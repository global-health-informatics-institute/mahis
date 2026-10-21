"""
 To run the scripts
    1. Have a folder called "mahis_count_reports" where the script is located
    2. Update the connection details
    3. Run it
    4. Find the results in the "mahis_count_reports" folder
"""

import mysql.connector
import pandas as pd
from datetime import datetime

mahis_db = mysql.connector.connect(
    host="",
    user="",
    password="",
    database=""
)

cutoff_date = "2026-06-30"
location_id = 32

# Simple counts on obs: (name, [concept_ids])
data_elements = [
    ("CD4 Percentage", [37519]),
    ("CD4 Count ALTER", [53719]),
    ("Drugs received at previous facility", [47270]),
    ("Regimen category at previous facility", [55619]),
    ("Last taken ARVs date", [55767]),
    ("Confirmatory HIV test date", [55906]),
    ("Taken ARVs in the last two months", [55768]),
    ("Location of ART initiation", [55766]),
    ("Taken ARVs in the last two weeks", [54654]),
    ("Ever registered at an ART clinic", [55985]),
    ("ART start", [51212]),
    ("ART number at previous location", [55178]),
    ("Patient pregnant", [54319, 38898]),
    ("Patient breastfeeding", [56004, 53859]),
    ("WHO stage", [55618]),
    ("Reason for starting ART", [55619]),
    ("Stage defining conditions", [51581]),
    ("Height", [53328]),
    ("Weight", [53325]),
    ("Temperature", [53322]),
    ("TB status", [55569]),
    ("Systolic blood pressure", [53312]),
    ("Visit type", [53553]),
    ("Routine TB screening (obs rows)", [56300]),
    ("Pulse", [53319]),
    ("Patient breastfeeding (alt)", [37629, 56004]),
    ("Family planning method currently on", [37126]),
    ("Date started treatment known", [38451]),
    ("Guardian present", [39471]),
    ("On TB treatment", [51503]),
    ("Next appointment date", [53337]),
    ("Lab test type", [57640]),
    ("Lab result", [55488, 50764]),
    ("Lab reason for test", [51076]),
    ("Family planning method provided today", [38718]),
    ("Patient present", [38983]),
    ("Diastolic blood pressure", [53316]),
    ("BMI", [39497]),
    ("Patient type", [52361]),
    ("Agrees to follow-up", [51262]),
    ("Amount brought forward", [51243]),
    ("Amount of drug remaining at home", [54972]),
    ("Linkage HTC Number", [55903]),
    ("Ever received ART", [55772]),
    ("Confirmatory HIV test type", [55904]),
    ("Confirmatory HIV location", [55905]),
    ("Allergic to sulphur", [56064]),
    ("ART start date", [51212]),
    ("Blood oxygen saturation", [53332]),
    ("Date of laboratory test", [52335]),
]

# Custom queries (use %(loc)s and %(cutoff)s)
custom_queries = [
    ("Regimen category", """
        WITH Prescriptions AS (
            SELECT e.encounter_id, e.location_id,
                   GROUP_CONCAT(d.drug_id ORDER BY d.drug_id ASC) AS drugs
            FROM encounter e
            INNER JOIN orders o ON e.encounter_id = o.encounter_id
            INNER JOIN drug_order do ON o.order_id = do.order_id
            INNER JOIN drug d ON do.drug_inventory_id = d.drug_id
            INNER JOIN arv_drug ad ON d.drug_id = ad.drug_id
            WHERE e.voided = 0
              AND o.voided = 0
              AND do.quantity > 0
              AND do.quantity IS NOT NULL
              AND e.location_id = %(loc)s
              AND DATE(e.encounter_datetime) <= %(cutoff)s
            GROUP BY e.encounter_id, e.location_id
        ),
        Regimens AS (
            SELECT GROUP_CONCAT(d.drug_id ORDER BY d.drug_id ASC) AS drugs,
                   regimen_name.name AS name
            FROM moh_regimen_combination AS combo
            INNER JOIN moh_regimen_combination_drug AS drug USING (regimen_combination_id)
            INNER JOIN moh_regimen_name AS regimen_name USING (regimen_name_id)
            INNER JOIN drug d ON d.drug_id = drug.drug_id
            GROUP BY combo.regimen_combination_id, regimen_name.name
        )
        SELECT COUNT(*)
        FROM Prescriptions p
        INNER JOIN Regimens r ON r.drugs = p.drugs
    """),

    ("Routine TB screening (distinct person/day)", """
        SELECT COUNT(*) FROM (
            SELECT person_id, DATE(obs_datetime)
            FROM obs
            WHERE concept_id = 56300
              AND location_id = %(loc)s
              AND voided = 0
              AND obs_datetime < DATE_ADD(%(cutoff)s, INTERVAL 1 DAY)
            GROUP BY person_id, DATE(obs_datetime)
        ) t
    """),

    ("Instructions given", """
        SELECT COUNT(o.patient_id)
        FROM orders o
        JOIN obs o2 ON o2.person_id = o.patient_id AND o2.order_id = o.order_id
        WHERE o.instructions IS NOT NULL
          AND o2.location_id = %(loc)s
          AND o2.voided = 0
          AND o2.obs_datetime < DATE_ADD(%(cutoff)s, INTERVAL 1 DAY)
    """),

    ("Treatment given", """
        SELECT COUNT(o.patient_id)
        FROM orders o
        JOIN drug_order do ON do.order_id = o.order_id
        JOIN drug d ON d.drug_id = do.drug_inventory_id
        JOIN arv_drug ad ON ad.drug_id = d.drug_id
        JOIN obs o2 ON o2.person_id = o.patient_id AND o2.order_id = o.order_id
        WHERE o.instructions IS NOT NULL
          AND o2.location_id = %(loc)s
          AND o2.voided = 0
          AND o2.obs_datetime < DATE_ADD(%(cutoff)s, INTERVAL 1 DAY)
    """),
]

results = []

for name, concepts in data_elements:
    placeholders = ",".join(["%s"] * len(concepts))
    query = f"""
        SELECT COUNT(*)
        FROM obs
        WHERE concept_id IN ({placeholders})
        AND location_id = %s
        AND obs_datetime < DATE_ADD(%s, INTERVAL 1 DAY)
        AND voided = 0
    """
    cursor = mahis_db.cursor()
    cursor.execute(query, tuple(concepts) + (location_id, cutoff_date))
    count = cursor.fetchone()[0]
    cursor.close()
    results.append({"Data Element": name, "MAHIS COUNT": count})
    print(name, count)

for name, query in custom_queries:
    cursor = mahis_db.cursor()
    cursor.execute(query, {"loc": location_id, "cutoff": cutoff_date})
    count = cursor.fetchone()[0]
    cursor.close()
    results.append({"Data Element": name, "MAHIS COUNT": count})
    print(name, count)

timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
filename = f"mahis_count_reports/MAHIS_Counts_{timestamp}.xlsx"
pd.DataFrame(results).to_excel(filename, index=False)

mahis_db.close()
print(f"Excel file generated: {filename}")