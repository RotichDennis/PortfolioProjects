--BELLABEAT BIG QUERY INPUTS
--SQL Big Query
--For finding activity level and calories burnt
 
SELECT Id, ActivityDate,Calories, TotalSteps, TotalDistance, TrackerDistance, LoggedActivitiesDistance, VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance,SedentaryActiveDistance, VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes
FROM `first-project-355119.bellabeat.dailyactivities`
WHERE VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance <> 0 AND VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes <> 0
ORDER BY TotalSteps DESC
 
 
--For finding activity level and calories burnt
 
SELECT Id, ActivityDate,Calories, TotalSteps, TotalDistance, TrackerDistance, LoggedActivitiesDistance, (VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance) AS TotalActiveDistance,SedentaryActiveDistance, (VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes) AS TotalActiveMinutes, SedentaryMinutes
FROM `first-project-355119.bellabeat.dailyactivities`
 
--For finding relationship between activity level and sleep time
 
SELECT activity.Id, ActivityDate,Calories, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed, TotalSteps, TotalDistance, TrackerDistance, LoggedActivitiesDistance, (VeryActiveDistance + ModeratelyActiveDistance) AS ActiveDistance, (LightActiveDistance+SedentaryActiveDistance) AS non_ActiveDistance, (VeryActiveMinutes+FairlyActiveMinutes) AS ActiveMinutes, (LightlyActiveMinutes+SedentaryMinutes) AS non_ActiveMinutes
FROM `first-project-355119.bellabeat.dailyactivities` AS activity
INNER JOIN `first-project-355119.bellabeat.dailysleep` AS sleep
ON activity.Id = sleep.Id AND activity.ActivityDate = sleep.SleepDay
 
 --For finding relationship between activity and weight/BMI
 
SELECT activity.Id, Calories, BMI, TotalSteps, TotalDistance, TrackerDistance, LoggedActivitiesDistance, VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance,SedentaryActiveDistance, VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes
FROM `first-project-355119.bellabeat.dailyactivities` AS activity
INNER JOIN `first-project-355119.bellabeat.weightinfo` AS weight
ON activity.Id = weight.Id AND activity.ActivityDate = weight.Date
 
