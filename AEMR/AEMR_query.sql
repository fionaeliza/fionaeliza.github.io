/* ~~~ Part 1 ~~~~
~~~~~~1.1~~~~~~~~~ 
SELECT COUNT(*) as Total_Number_Outage_Events, Status, Reason
from AEMR
WHERE YEAR(Start_Time) in ('2016') and Status = 'Approved'
GROUP BY Reason
ORDER BY Reason
~~~~~~1.3~~~~~~~
SELECT Count(*) as Total_Number_Outage_Events, Status, Reason
from AEMR
WHERE YEAR(Start_Time) in ('2017') and Status = 'Approved'
GROUP BY Reason
ORDER BY Reason
~~~~~~1.5~~~~~~~*/
SELECT Status, Reason,
  Count(*) as Total_Number_Outage_Events,
  ROUND(AVG(TIMESTAMPDIFF(MINUTE,Start_Time, End_Time))/60/24,2) as Average_Outage_Duration_Time_Days,
  YEAR(Start_Time) as Year
from AEMR
WHERE YEAR(Start_Time) in ('2016','2017') and Status = 'Approved'
GROUP BY YEAR(Start_Time), Reason
ORDER BY Reason
/*~~~~~~2.1~~~~~~~
SELECT Status, Reason, COUNT(*) as Total_Number_Outage_Events, MONTH(Start_Time) as Month
from AEMR
WHERE YEAR(Start_Time) in ('2016') and Status = 'Approved'
GROUP BY YEAR(Start_Time), MONTH(Start_Time), Reason, Status
ORDER BY Reason, MONTH(Start_Time)
~~~~~~2.2~~~~~~~
SELECT Status, Reason, COUNT(*) as Total_Number_Outage_Events, MONTH(Start_Time) as Month
from AEMR
WHERE YEAR(Start_Time) in ('2017') and Status = 'Approved'
GROUP BY YEAR(Start_Time), MONTH(Start_Time), Reason, Status
ORDER BY Reason, MONTH(Start_Time)

~~~~~~2.3~~~~~~~
SELECT 
  Status, 
  COUNT(*) as Total_Number_Outage_Events, 
  MONTH(Start_Time) as Month,
  YEAR(Start_Time) as Year
from AEMR
WHERE YEAR(Start_Time) in ('2016','2017') and Status = 'Approved'
GROUP BY YEAR(Start_Time), MONTH(Start_Time), Status
ORDER BY MONTH(Start_Time), YEAR(Start_Time)
~~~~~~3.1~~~~~~~
SELECT 
  COUNT(*) as Total_Number_Outage_Events, 
  Participant_Code,
  Status,
  YEAR(Start_Time) as Year
from AEMR
WHERE YEAR(Start_Time) in ('2016','2017') and Status = 'Approved'
GROUP BY YEAR(Start_Time), Participant_Code
ORDER BY YEAR(Start_Time), Participant_Code

~~~~~~3.2~~~~~~~
SELECT 
  Participant_Code,
  Status,
  YEAR(Start_Time) as Year,
  ROUND(AVG(TIMESTAMPDIFF(MINUTE,Start_Time, End_Time))/60/24,2) 
    as Average_Outage_Duration_Time_Days  
from AEMR
WHERE YEAR(Start_Time) in ('2016','2017') and Status = 'Approved'
GROUP BY YEAR(Start_Time), Participant_Code
ORDER BY YEAR(Start_Time), Participant_Code



~~~~~~ Part 2 ~~~~
~~~~~~1.1~~~~~~~
SELECT
  COUNT(*) as Total_Number_Outage_Events,
  Reason,
  YEAR(Start_Time) as Year  
from AEMR
WHERE Status in ('Approved') and Reason = 'Forced'
GROUP BY Year, Reason
ORDER BY Reason, Year

~~~~~~1.2~~~~~~~
SELECT 
  SUM(CASE WHEN Reason = 'Forced' THEN 1 ELSE 0 END) AS Total_Number_Forced_Outage_Events,
  COUNT(*) as Total_Number_Outage_Events,
  Round(SUM(CASE WHEN Reason = 'Forced' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS Forced_Outage_Percentage,
  Year(Start_Time) as Year
from AEMR
WHERE YEAR(Start_Time) in ('2016','2017') and Status = 'Approved'
GROUP BY YEAR(Start_Time)

~~~~~~2.1~~~~~~~
SELECT 
  Status,
  Reason, /*remove this for class*//*
  YEAR(Start_Time) as Year,
  ROUND(AVG(Outage_MW),2) as Avg_Outage_MW_Loss,
  ROUND(AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time)),2) as Average_Outage_Duration_Time_Minutes
from AEMR
WHERE YEAR(Start_Time) in ('2016','2017') and Status = 'Approved' and Reason = 'Forced'
GROUP BY YEAR(Start_Time)

~~~~~~2.2~~~~~~~
SELECT 
  Status,
  Reason,
  YEAR(Start_Time) as Year,
  ROUND(AVG(Outage_MW),2) as Avg_Outage_MW_Loss,
  ROUND(AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time)),2) as Average_Outage_Duration_Time_Minutes
from AEMR
WHERE YEAR(Start_Time) in ('2016','2017') and Status = 'Approved'
GROUP BY YEAR(Start_Time), Reason
Order by Year(Start_Time)
~~~~~~3.1~~~~~~~
SELECT 
  Participant_Code,
  Status,
  YEAR(Start_Time) as Year,
  ROUND(AVG(Outage_MW),2) as Avg_Outage_MW_Loss,
  ROUND(AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time))/24/60,2) as Average_Outage_Duration_Time_Days
from AEMR
WHERE YEAR(Start_Time) in ('2016','2017') and Status = 'Approved' and Reason = 'Forced'
GROUP BY YEAR(Start_Time), Participant_Code
Order by Avg_Outage_MW_Loss, YEAR(Start_Time) DESC
*/
