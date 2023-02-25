-- calculate the average of both data
select AVG(hoursOfSleep) into @sleep from tblSleepCognitiveData;
select AVG(cognitiveTestScore) into @testscore from tblSleepCognitiveData;
select round(@sleep,2) as AVGSleep, round(@testscore,2) as tblSleepCognitiveData;

-- to get the beta number, the data in table will be reduced by the average of both data
select hoursOfSleep, @sleep, round(hoursOfSleep-@sleep, 2) as 'xi-avgSleep' from tblSleepCognitiveData;
select cognitiveTestScore, @testscore, round(cognitiveTestScore-@testscore, 2) as 'yi-avgTestScore' from tblSleepCognitiveData;

-- calculate the top of the beta and bottom of the beta
select sum((round(hoursOfSleep-@sleep, 2))*(round(cognitiveTestScore-@testscore,2))) into @topslope from tblSleepCognitiveData;
select sum(pow(hoursOfSleep-@sleep,2)) into @bottomslope from tblSleepCognitiveData;

-- calculate the beta
select round(@topslope/@bottomslope,2) into @beta;

select @beta;

-- calculate the alpha
select round(@testscore-(@beta*@sleep)) into @alpha;

select @alpha;

-- the linear regression formula is 
-- cognitive test score = alpha + (beta * hours of sleep)
select round(@alpha+(@beta*10)) into @Prediction;

select @Prediction as "Prediction Result";