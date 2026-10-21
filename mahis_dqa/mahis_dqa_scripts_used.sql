1. CD4 Percentage

#mahis = 37519
select count(*) from mahis_db_dump.obs o 
where o.concept_id = 37519
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30' and voided = 0;

#emr = 730
select count(*) from openmrs_8_area_18_urban_health_centre.obs o where o.concept_id = 730
and o.obs_datetime <= '2026-06-30' and voided = 0;

-- ----------------------------------------------------------------------------------

2. CD4 Count ALTER

#mahis = 53719

select * from mahis_db_dump.obs o 
where o.concept_id = 53719
	and o.location_id = 32
    And o.voided = 0
	and o.obs_datetime <= '2026-06-30';

#emr = 5497
select * from openmrs_8_area_18_urban_health_centre.obs o where o.concept_id = 5497
and o.voided = 0
and o.obs_datetime <= '2026-06-30';

-- ----------------------------------------------------------------------------------

3. Drugs received at previous facility

#mahis = 47270
select * from mahis_db_dump.obs o 
where o.concept_id = 47270
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 10563
select * from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 10563
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0
  
-- ----------------------------------------------------------------------------------

4. Regimen category at previous facility

#mahis = 55619
select * from mahis_db_dump.obs o 
where o.concept_id = 55619
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 7563
select * from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 7563
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

-- ----------------------------------------------------------------------------------

5. Last taken ARVs date

#mahis = 55767
select distinct o.* from mahis_db_dump.obs o 
where o.concept_id = 55767
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 7751
select distinct o.* from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 7751
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

-- ----------------------------------------------------------------------------------

6. Confirmatory HIV test date

#mahis = 55906
select count(*) from mahis_db_dump.obs o 
where o.concept_id = 55906
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 7882
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 7882
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

-- ----------------------------------------------------------------------------------

7. Taken ARVs in the last two months

#mahis = 55768
select count(*) from mahis_db_dump.obs o 
where o.concept_id = 55768
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 7752
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 7752
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

-- ----------------------------------------------------------------------------------

8. Location of ART initiation

#mahis = 55766
select count(*) from mahis_db_dump.obs o 
where o.concept_id = 55766
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 7750
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 7750
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0	

-- ----------------------------------------------------------------------------------

9. Taken ARVs in the last two weeks

#mahis = 54654
select count(*) from mahis_db_dump.obs o 
where o.concept_id = 54654
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 6394
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 6394
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0	

-- ----------------------------------------------------------------------------------

10. Ever registered at an ART clinic

#mahis = 55985
select count(*) from mahis_db_dump.obs o 
where o.concept_id = 55985
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 7937
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 7937
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0	

-- ----------------------------------------------------------------------------------

11. ART start

#mahis = 51212
select count(*) from mahis_db_dump.obs o 
where o.concept_id = 51212
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 2516
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 2516
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

-- ----------------------------------------------------------------------------------

12. ART number at previous location

#mahis = 55178
select count(*) from mahis_db_dump.obs o 
where o.concept_id = 55178
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 6981
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id = 6981
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0	

-- ----------------------------------------------------------------------------------

13. Patient pregnant

#mahis = (54319, 38898)
select count(*) from mahis_db_dump.obs o 
where o.concept_id in (54319, 38898)
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = (6131, 1755) 
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id in (6131, 1755) 
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

-- ----------------------------------------------------------------------------------

14. Patient breastfeeding

#mahis = (56004, 53859)
select count(*) from mahis_db_dump.obs o 
where o.concept_id in (56004, 53859)
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = (7965, 5632) 
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id in (7965, 5632) 
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0	

-- ----------------------------------------------------------------------------------

15. WHO stage

#mahis = 55618
select count(*) from mahis_db_dump.obs o 
where o.concept_id in (55618)
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and o.voided = 0

#emr = 7562
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id in (7562) 
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0	

-- ----------------------------------------------------------------------------------

16. Reason for starting ART

#mahis = 55619
select count(*) from mahis_db_dump.obs o 
where o.concept_id in (55619)
	and o.location_id = 32
	and o.obs_datetime <= '2026-06-30'
	and e.encounter_id 
	and o.voided = 0

#emr = 7563
select count(*) from openmrs_8_area_18_urban_health_centre.obs o 
where o.concept_id in (7563) 
and o.obs_datetime <= '2026-06-30'
	and o.voided = 0	
-- ----------------------------------------------------------------------------------

17. Stage defining conditions



#mahis = 51581
select
* from mahis_db_dump.obs o
	where o.concept_id = 51581	
	and o.location_id = 32
    and o.voided = 0
	and o.obs_datetime <= '2026-06-30'

#emr = 2743
select
distinct o.* from openmrs_8_area_18_urban_health_centre.obs o
	where o.concept_id = 2743
    and o.voided = 0
	and o.obs_datetime <= '2026-06-30'


-- ----------------------------------------------------------------------------------

18. Height

#mahis = 53328
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (53328) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 5090
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (5090) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

19. Weight

#emr = 53325
SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (53325)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;


#emr =  5089
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (5089) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0


-- ----------------------------------------------------------------------------------

20. Temperature

#mahis = 53322
SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (53322)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;

#emr =  5088
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (5088) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

21. TB status

#mahis = 55569
SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (55569)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;


#emr = 7459
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (7459) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

22. Systolic blood pressure

#mahis = 53312
SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (53312)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;


#emr = 5085
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (5085) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

23. Visit type

#mahis = 53553
SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (53553)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;



#emr = 5315
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (5315) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

24. Routine TB screening

SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (56300)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;


#emr = 8259
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (8259) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0


-- ----------------------------------------------------------------------------------

25. Pulse

#mahis = 53319
SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (53319)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;


#emr = 5087
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (5087) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

26. Patient breastfeeding

#mahis = (37629, 56004)
SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (37629, 56004)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;

#emr = (834,7965)
select count(*) from openmrs_8_area_18_urban_health_centre.obs o where o.concept_id in (834,7965) and voided = 0
and o.obs_datetime <= '2026-06-30';

-- ----------------------------------------------------------------------------------


27. Date started treatment known

#mahis = (38451)
SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (38451)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;

#emr = (834,7965)
select count(*) from openmrs_8_area_18_urban_health_centre.obs o where o.concept_id in (1421) and voided = 0
and o.obs_datetime <= '2026-06-30';

-- ----------------------------------------------------------------------------------

28. Guardian present

#mahis = 39471
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (39471) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 2122
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (2122) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

29. On TB treatment

#mahis = 51503
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (51503) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 2690
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (2690) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

30. Next appointment date

#mahis = 53337
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (53337) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 5096
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (5096) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0


-- ----------------------------------------------------------------------------------

31. Lab test type

#mahis = 57640
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (57640) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 9737
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (9737) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

32. Lab result

#mahis = (55488, 50764) 
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (55488, 50764) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = (7363,2216) 
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (7363,2216) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

33. Lab reason for test

#mahis = 51076
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (51076) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 2429
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (2429) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

34. Family planning method provided today

#mahis = 38718
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (38718) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 1618
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (1618) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

35. Family planning method currently on

#mahis = 37126
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (37126) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 374
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (374) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

36. Patient present

#mahis = 38983
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (38983) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 1805
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (1805) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

37. Diastolic blood pressure

#mahis = 53316
select count(*) from mahis_db_dump.obs o
where o.concept_id IN (53316) 
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 5086
select count(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id IN (5086) 
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

40. BMI

#mahis = 39497
select * from mahis_db_dump.obs o
where o.concept_id = 39497
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

#emr = 2137
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 2137
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

41. Patient type

#mahis = 52361
SELECT COUNT(*) AS total
FROM obs
WHERE concept_id IN (52361)
  AND location_id = 32
  AND obs_datetime < DATE_ADD('2026-06-30', INTERVAL 1 DAY)
  AND voided = 0;

# emr = 3289
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 3289
and o.obs_datetime <= '2026-06-30'
and o.voided = 0

-- ----------------------------------------------------------------------------------

42. Agrees to follow-up

#mahis = 51262
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 51262
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 2552
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 2552
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

-- ----------------------------------------------------------------------------------

43. Amount brought forward

#mahis = 51243
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 51243
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 2540
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 2540
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;


-- ----------------------------------------------------------------------------------

44. Amount of drug remaining at home

#mahis = 54972
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 54972
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 6781
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 6781
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

-- ----------------------------------------------------------------------------------

45. Linkage HTC Number

#mahis = 55903
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 55903
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 7879
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 7879
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

-- ----------------------------------------------------------------------------------

46. Ever received ART

#mahis = 55772
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 55772
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 7754
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 7754
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;
    

-- ----------------------------------------------------------------------------------

47. Confirmatory HIV test type

#mahis = 55904
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 55904
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 7880
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 7880
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;


-- ----------------------------------------------------------------------------------

48. Confirmatory HIV location

#mahis = 55905
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 55905
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 7881
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 7881
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

-- ----------------------------------------------------------------------------------

49. Allergic to sulphur

#mahis = 56064 
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 56064
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 8012
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 8012
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

-- ----------------------------------------------------------------------------------

50. ART start date

#mahis = 51212 
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 51212
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 2516 
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 2516
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

-- ----------------------------------------------------------------------------------

51. Blood oxygen saturation

#mahis = 53332 
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 53332
and o.location_id = 32
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 5092
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 5092
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

-- ----------------------------------------------------------------------------------

52. Date of laboratory test

#mahis = 52335 
select COUNT(*) from mahis_db_dump.obs o
where o.concept_id = 52335
and o.location_id = 32
-- and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

#emr = 3267
select COUNT(*) from openmrs_8_area_18_urban_health_centre.obs o
where o.concept_id = 3267
and o.obs_datetime <= '2026-06-30'
and o.voided = 0 ;

-- ----------------------------------------------------------------------------------


53. Regimen category

#mahis
-- regimen
WITH Prescriptions AS (
    SELECT
        e.encounter_id,
        e.location_id,
        GROUP_CONCAT(d.drug_id ORDER BY d.drug_id ASC) AS drugs
    FROM encounter e
    INNER JOIN orders o ON (e.encounter_id) = (o.encounter_id)
    INNER JOIN drug_order do ON (o.order_id) = (do.order_id)
    INNER JOIN drug d ON do.drug_inventory_id = d.drug_id
    INNER JOIN arv_drug ad ON d.drug_id = ad.drug_id
    WHERE e.voided = 0
    AND o.voided = 0
    AND do.quantity > 0
    AND do.quantity IS NOT NULL
    AND e.location_id = 32
    AND DATE(e.encounter_datetime) <= '2026-06-30'
    GROUP BY e.encounter_id, e.location_id
),
Regimens AS (
    SELECT
        GROUP_CONCAT(d.drug_id ORDER BY d.drug_id ASC) AS drugs,
        regimen_name.name AS name
    FROM moh_regimen_combination AS combo
    INNER JOIN moh_regimen_combination_drug AS drug USING (regimen_combination_id)
    INNER JOIN moh_regimen_name AS regimen_name USING (regimen_name_id)
    INNER JOIN drug d ON d.drug_id = drug.drug_id
    GROUP BY combo.regimen_combination_id, regimen_name.name
)
SELECT COUNT(*) AS regimen_record_count
FROM Prescriptions p
INNER JOIN Regimens r ON r.drugs = p.drugs;





#emr
WITH Prescriptions AS (
    SELECT
        e.encounter_id,
        e.location_id,
        GROUP_CONCAT(d.drug_id ORDER BY d.drug_id ASC) AS drugs
    FROM encounter e
    INNER JOIN orders o ON (e.encounter_id) = (o.encounter_id)
    INNER JOIN drug_order do ON (o.order_id) = (do.order_id)
    INNER JOIN drug d ON do.drug_inventory_id = d.drug_id
    INNER JOIN arv_drug ad ON d.drug_id = ad.drug_id
    WHERE e.voided = 0
    AND o.voided = 0
    AND do.quantity > 0
    AND do.quantity IS NOT NULL
--     AND e.location_id = 32
    AND DATE(e.encounter_datetime) <= '2026-06-30'
    GROUP BY e.encounter_id, e.location_id
),
Regimens AS (
    SELECT
        GROUP_CONCAT(d.drug_id ORDER BY d.drug_id ASC) AS drugs,
        regimen_name.name AS name
    FROM moh_regimen_combination AS combo
    INNER JOIN moh_regimen_combination_drug AS drug USING (regimen_combination_id)
    INNER JOIN moh_regimen_name AS regimen_name USING (regimen_name_id)
    INNER JOIN drug d ON d.drug_id = drug.drug_id
    GROUP BY combo.regimen_combination_id, regimen_name.name
)
SELECT COUNT(*) AS regimen_record_count
FROM Prescriptions p
INNER JOIN Regimens r ON r.drugs = p.drugs;

-- ----------------------------------------------------------------------------------

58. routine_tb_screening

#mahis = 56300
SELECT
    COUNT(*) AS routine_tb_screening_count
FROM (
    SELECT
        o1.person_id,
        o1.location_id,
        DATE(o1.obs_datetime) AS visit_date,
        (SELECT cn3.name
         FROM obs o7
         INNER JOIN concept_name cn3 ON cn3.concept_id = o7.value_coded
         WHERE o7.person_id = o1.person_id
--          AND o7.location_id = o1.location_id
         AND DATE(o7.obs_datetime) = DATE(o1.obs_datetime)
         AND o7.voided = 0
         AND o7.concept_id = 56300
         AND o7.location_id = 32
         LIMIT 1) AS routine_TB_screening
    FROM obs o1
    WHERE o1.voided = 0
    AND o1.location_id = 32
    AND o1.obs_datetime <= '2026-06-30'
    AND EXISTS (
        SELECT 1
        FROM obs o7
        WHERE o7.person_id = o1.person_id
--         AND o7.location_id = o1.location_id
        AND DATE(o7.obs_datetime) = DATE(o1.obs_datetime)
        AND o7.voided = 0
        AND o7.concept_id = 56300
        AND o7.location_id = 32
    )
    GROUP BY o1.person_id, DATE(o1.obs_datetime)
) AS routine_screening_records;



#emr = 8259
SELECT
    COUNT(*) AS routine_tb_screening_count
FROM (
    SELECT
        o1.person_id,
        o1.location_id,
        DATE(o1.obs_datetime) AS visit_date,
        (SELECT cn3.name
         FROM obs o7
         INNER JOIN concept_name cn3 ON cn3.concept_id = o7.value_coded
         WHERE o7.person_id = o1.person_id
--          AND o7.location_id = o1.location_id
         AND DATE(o7.obs_datetime) = DATE(o1.obs_datetime)
         AND o7.voided = 0
         AND o7.concept_id = 8259
--          AND o7.location_id = 32
         LIMIT 1) AS routine_TB_screening
    FROM obs o1
    WHERE o1.voided = 0
--     AND o1.location_id = 32
    AND o1.obs_datetime <= '2026-06-30'
    AND EXISTS (
        SELECT 1
        FROM obs o7
        WHERE o7.person_id = o1.person_id
--         AND o7.location_id = o1.location_id
        AND DATE(o7.obs_datetime) = DATE(o1.obs_datetime)
        AND o7.voided = 0
        AND o7.concept_id = 8259
--         AND o7.location_id = 32
    )
    GROUP BY o1.person_id, DATE(o1.obs_datetime)
) AS routine_screening_records;

-- ----------------------------------------------------------------------------------


--  instructions given
# mahis
SELECT COUNT(o.patient_id ) FROM mahis_db_dump.orders o
JOIN mahis_db_dump.obs o2 
	ON o2.person_id = o.patient_id 
	AND o2.order_id = o.order_id 
WHERE o.instructions IS NOT NULL
AND o2.location_id = 32
AND o2.voided = 0
and o2.obs_datetime  <= '2026-06-30' ;

--  instructions given

# emr
SELECT COUNT(*) 
FROM openmrs_8_area_18_urban_health_centre.orders o
JOIN openmrs_8_area_18_urban_health_centre.obs o2 
	ON o2.person_id = o.patient_id 
	AND o2.order_id = o.order_id 
WHERE o.instructions IS NOT NULL
AND o2.voided = 0
and o2.obs_datetime  <= '2026-06-30';


-- ----------------------------------------------------------------------------------

treatment given

#mahis
SELECT COUNT(o.patient_id ) 
FROM mahis_db_dump.orders o
JOIN drug_order do 
	ON do.order_id = o.order_id 
JOIN drug d 
	ON d.drug_id = do.drug_inventory_id 
JOIN arv_drug ad 
	ON ad.drug_id = d.drug_id 
JOIN obs o2 
	ON o2.person_id = o.patient_id 
	AND o2.order_id = o.order_id 
WHERE o.instructions IS NOT NULL
AND o2.location_id = 32
AND o2.voided = 0
and o2.obs_datetime  <= '2026-06-30' ;

#emr
SELECT COUNT(o.patient_id ) 
FROM openmrs_8_area_18_urban_health_centre.orders o
JOIN drug_order do 
	ON do.order_id = o.order_id 
JOIN drug d 
	ON d.drug_id = do.drug_inventory_id 
JOIN arv_drug ad 
	ON ad.drug_id = d.drug_id 
JOIN obs o2 
	ON o2.person_id = o.patient_id 
	AND o2.order_id = o.order_id 
WHERE o.instructions IS NOT NULL
AND o2.voided = 0
and o2.obs_datetime  <= '2026-06-30' ;

