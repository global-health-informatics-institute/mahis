import mysql.connector
import pandas as pd
from datetime import datetime

# Database connections
mahis_db = mysql.connector.connect(
    host="",
    user="",
    password="",
    database=""
)

# Configuration
cutoff_date = "2026-06-30"
location_id = 32

# Data elements and concept IDs
data_elements = [
    ("CD4 Percentage", [37519], True),
    ("CD4 Count ALTER", [53719], True),
    ("Drugs received at previous facility", [47270], True),
    ("Regimen category at previous facility", [55619], True),
    ("Last taken ARVs date", [55767], True),
    ("Confirmatory HIV test date", [55906], True),
    ("Taken ARVs in the last two months", [55768], True),
    ("Location of ART initiation", [55766], True),
    ("Taken ARVs in the last two weeks", [54654], True),
    ("Ever registered at an ART clinic", [55985], True),
    ("ART start", [51212], True),
    ("ART number at previous location", [55178], True),
    ("Patient pregnant", [54319, 38898], True),
    ("Patient breastfeeding", [56004, 53859], True),
    ("WHO stage", [55618], True),
    ("Reason for starting ART", [55619], True),
    ("Stage defining conditions", [51581], False),
    ("Height", [53328], True),
    ("Weight", [53325], True),
    ("Temperature", [53322], True),
    ("TB status", [55569], True),
    ("Systolic blood pressure", [53312], True),
    ("Visit type", [53553], True),
    ("Routine TB screening", [56300], True),
    ("Pulse", [53319], True),
    ("Patient pregnant", [38898, 54319], True),
    ("Patient breastfeeding", [37629, 56004], True),
    ("Family planning method currently on", [37126], True),
    ("Date started treatment known", [38451], True),
    ("Guardian present", [39471], True),
    ("On TB treatment", [51503], True),
    ("Next appointment date", [53337], True),
    ("Lab test type", [57640], True),
    ("Lab result", [55488, 50764], True),
    ("Lab reason for test", [51076], True),
    ("Family planning method provided today", [38718], True),
    ("Family planning method currently on", [37126], True),
    ("Patient present", [38983], True),
    ("Diastolic blood pressure", [53316], True),
    ("BMI", [39497], True),
    # ("Instructions given", [], True),
    # ("Treatment given", [], True),
    ("Patient type", [52361], True),
    ("Agrees to follow-up", [51262], True),
    ("Amount brought forward", [51243], True),
    ("Amount of drug remaining at home", [54972], True),
    ("Linkage HTC Number", [55903], True),
    ("Ever received ART", [55772], True),
    ("Confirmatory HIV test type", [55904], True),
    ("Confirmatory HIV location", [55905], True),
    ("Allergic to sulphur", [56064], True),
    ("ART start date", [51212], True),
    ("Blood oxygen saturation", [53332], True),
    ("Date of laboratory test", [52335], True),
]

results = []

for name, concepts, exclude_voided in data_elements:

    placeholders = ",".join(["%s"] * len(concepts))

    query = f"""
        SELECT COUNT(*)
        FROM obs
        WHERE concept_id IN ({placeholders})
        AND location_id = %s
        AND obs_datetime < DATE_ADD(%s, INTERVAL 1 DAY)
    """

    if exclude_voided:
        query += " AND voided = 0"

    cursor = mahis_db.cursor()
    cursor.execute(query, tuple(concepts) + (location_id, cutoff_date))

    count = cursor.fetchone()[0]

    results.append({
        "Data Element": name,
        "MAHIS COUNT": count
    })

    print(name, count)

    cursor.close()




# Export to Excel
df = pd.DataFrame(results)


timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")



df.to_excel(f"mahis_count_reports/MAHIS_Counts_{timestamp}.xlsx", index=False)

mahis_db.close()

print("Excel file generated: MAHIS_Counts.xlsx")


