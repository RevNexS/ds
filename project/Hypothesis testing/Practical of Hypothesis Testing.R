# Hypothesis Testing Eperiment 

# By seeing Poor performance of student in 1st test, remedial lectures was arranged by department. Department is 
#claiming that after remedial lectures performance improved. The test record for both the test(before and after 

#Test1 85 68 67 84 98 60 94 80 94 98 95 80 85 87 75 
#Test2 70 90 80 89 88 86 78 87 90 86 92 94 99 93 86                                                                                remedial) is as follows 

#Test 1 Score 
score1=c(85,68,67,84,98,60,94,80,94,98,95,80,85,87,75) 
#Test 2 Score (after Remedial Lectures) 
score2=c(70,90,80,89,88,86,78,87,90,86,92,94,99,93,86) 
#perform hypothesis test 
Result<-t.test(score1, score2, alternative = "two.sided", mu=0, var.equal = F, conf.level = 0.95) 
#show Result
print(Result)

