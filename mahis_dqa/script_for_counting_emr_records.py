"""
 To run the script
    1. Have a folder called "mahis_count_reports" where the script is located
    2. Update the connection details
    3. Run it
    4. Find the results in the "mahis_count_reports" folder
"""


import mysql.connector
import pandas as pd
from datetime import datetime

emr_db = mysql.connector.connect(
    host="",
    user="",
    password="",
    database=""
)

cutoff_date = "2026-06-30"

# Simple counts on obs: (name, [concept_ids])
data_elements = [
    ("CD4 Percentage", [730]),
    ("CD4 Count ALTER", [5497]),
    ("Drugs received at previous facility", [10563]),
    ("Regimen category at previous facility", [7563]),
    ("Last taken ARVs date", [7751]),
    ("Confirmatory HIV test date", [7882]),
    ("Taken ARVs in the last two months", [7752]),
    ("Location of ART initiation", [7750]),
    ("Taken ARVs in the last two weeks", [6394]),
    ("Ever registered at an ART clinic", [7937]),
    ("ART start", [2516]),
    ("ART number at previous location", [6981]),
    ("Patient pregnant", [6131, 1755]),
    ("Patient breastfeeding", [7965, 5632]),
    ("WHO stage", [7562]),
    ("Reason for starting ART", [7563]),
    ("Stage defining conditions", [2743]),
    ("Height", [5090]),
    ("Weight", [5089]),
    ("Temperature", [5088]),
    ("TB status", [7459]),
    ("Systolic blood pressure", [5085]),
    ("Visit type", [5315]),
    ("Routine TB screening (obs rows)", [8259]),
    ("Pulse", [5087]),
    ("Patient breastfeeding (alt)", [834, 7965]),
    ("Family planning method currently on", [374]),
    ("Date started treatment known", [1421]),
    ("Guardian present", [2122]),
    ("On TB treatment", [2690]),
    ("Next appointment date", [5096]),
    ("Lab test type", [9737]),
    ("Lab result", [7363, 2216]),
    ("Lab reason for test", [2429]),
    ("Family planning method provided today", [1618]),
    ("Patient present", [1805]),
    ("Diastolic blood pressure", [5086]),
    ("BMI", [2137]),
    ("Patient type", [3289]),
    ("Agrees to follow-up", [2552]),
    ("Amount brought forward", [2540]),
    ("Amount of drug remaining at home", [6781]),
    ("Linkage HTC Number", [7879]),
    ("Ever received ART", [7754]),
    ("Confirmatory HIV test type", [7880]),
    ("Confirmatory HIV location", [7881]),
    ("Allergic to sulphur", [8012]),
    ("ART start date", [2516]),
    ("Blood oxygen saturation", [5092]),
    ("Date of laboratory test", [3267]),
]

# Custom queries (use %(cutoff)s)
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
            WHERE concept_id = 8259
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
        AND obs_datetime < DATE_ADD(%s, INTERVAL 1 DAY)
        AND voided = 0
    """
    cursor = emr_db.cursor()
    cursor.execute(query, tuple(concepts) + (cutoff_date,))
    count = cursor.fetchone()[0]
    cursor.close()
    results.append({"Data Element": name, "EMR COUNT": count})
    print(name, count)

for name, query in custom_queries:
    cursor = emr_db.cursor()
    cursor.execute(query, {"cutoff": cutoff_date})
    count = cursor.fetchone()[0]
    cursor.close()
    results.append({"Data Element": name, "EMR COUNT": count})
    print(name, count)

timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
filename = f"mahis_count_reports/EMR_Counts_{timestamp}.xlsx"
pd.DataFrame(results).to_excel(filename, index=False)

emr_db.close()
print(f"Excel file generated: {filename}")