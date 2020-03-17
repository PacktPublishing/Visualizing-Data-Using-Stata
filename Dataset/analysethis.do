qui clear all
qui set more off
//qui cd "C://Users/mozahemna.UNIVERSITY/onedrive - rhu(1)/personal/publications/paper 6 (ethics)"
//cd "/Users/user/onedrive - rhu/personal/publications/paper 6 (ethics)"
qui import excel "dataset.xlsx", sheet("Sheet1") firstrow
qui label variable major "Major enrolled in"
qui label variable level "Student class standing"
qui label variable gender "Gender"
qui label variable gpa "Overall student GPA"
qui label variable copythink "Think-copy-exam"
qui label variable copyengage "Engage-copy-exam"
qui label variable copyother "Other-copy-exam"
qui label variable helpthink "Think-help-exam"
qui label variable helpengage "Engage-help-exam"
qui label variable helpother "Other-help-exam"
qui label variable notesthink "Think-notes-exam"
qui label variable notesengage "Engage-notes-exam"
qui label variable notesother "Other-notes-exam"
qui label variable quizthink "Think-copy-quiz"
qui label variable quizengage "Engage-copy-quiz"
qui label variable quizother "Other-copy-quiz"
qui label variable quiz2think "Think-help-quiz"
qui label variable quiz2engage "Engage-copy-quiz"
qui label variable quiz2other "Other-copy-quiz"
qui label variable quiz3think "Think-notes-quiz"
qui label variable quiz3engage "Engage-notes-quiz"
qui label variable quiz3other "Other-notes-quiz"
qui label variable allowthink "Think-copy-paper"
qui label variable allowengage "Engage-copy-paper"
qui label variable allowother "Other-copy-paper"
qui label variable askthink "Think-ask-paper"
qui label variable askengage "Engage-ask-paper"
qui label variable askother "Other-ask-paper"
qui label variable ethical "Cheating is ethically wrong"
qui label variable fair "Cheating is not fair"
qui label variable grades "Grades are more important than knowledge"
qui label variable friendyou1 "Scenario 1 - You-friend"
qui label variable friendother1 "Scenario 1 - Other-friend"
qui label variable knewyou1 "Scenario 1 - You-knew"
qui label variable knewother1 "Scenario 1 - Other-knew"
qui label variable friendyou2 "Scenario 2 - You-friend"
qui label variable friendother2 "Scenario 2 - Other-friend"
qui label variable knewyou2 "Scenario 2 - You-knew"
qui label variable knewother2 "Scenario 2 - Other-knew"
qui label variable friendyou3 "Scenario 3 - You-friend"
qui label variable friendother3 "Scenario 3 - Other-friend"
qui label variable knewyou3 "Scenario 3 - You-knew"
qui label variable knewother3 "Scenario 3 - Other-knew"
qui label variable liecustomer "Sometimes it is necessary to lie to a customer to protect the company"
qui label variable liecoworker "Sometimes it is necessary to lie to a co-worker to protect the company"
qui label variable illegal "Sometimes it is necessary to do something that is illegal"
qui label variable primary1 "Primary responsibility 1"
qui label variable primary2 "Primary responsibility 2"
qui label variable primary3 "Primary responsibility 3"
qui label variable job1 "Job selection 1"
qui label variable job2 "Job selection 2"
qui label variable job3 "Job selection 3"
qui label variable course "Did you take the course business ethics?"
qui label variable university "Which university do you go to?"
qui label define major 0 "Management" 1 "Human Resources" 2 "Marketing" 3 "Banking and Accounting" 4 "Electrical and Computer" 5 "Civil" 6 "Mechanical" 7 "Biomedical"
qui label define level 0 "Freshman" 1 "Sophomore" 2 "Junior" 3 "Senior"
qui label define gender 0 "Male" 1 "Female"
//recode first
foreach x of varlist copythink helpthink notesthink quizthink quiz2think quiz3think allowthink askthink {
	qui recode `x' 1=0 0=1
} 
qui label define yesno 0 "No" 1 "Yes"
qui label define three 0 "Never" 1 "Sometimes" 2 "A lot" 
qui label define five 0 "SD" 1 "D" 2 "N" 3 "A" 4 "SA"
qui label define three2 0 "Disagree" 1 "Neutral" 2 "Agree"
qui label define scenario 0 "Provide the answers" 1 "Decline the offer" 2 "Decline the offer and report student"
qui label define scenario2 0 "Accept the offer" 1 "Decline the offer" 2 "Decline the offer and report student"
qui label define primary 0 "Increase profits" 1 "Satisfy customer needs" 2 "Produce useful products" 3 "Invest in employees" 4 "Comply with the law" 5 "Create value for the community"
qui label define job 0 "Challenging responsibilities" 1 "Salary" 2 "Work/life balance" 3 "Contribute to society" 4 "Colleagues" 5 "Training and development" 6 "Rapid advancement" 7 "Ethical standards"
qui label define course 0 "Took Business Ethics" 1 "Did not take Business Ethics" 2 "Currently"
qui label define univer 0 "University1" 1 "University2" 2 "University3"
qui label values major major
qui label values level level
qui label values gender gender
qui label values copythink yesno
qui label values copyengage three
qui label values copyother three
qui label values helpthink yesno
qui label values helpengage three
qui label values helpother three
qui label values notesthink yesno
qui label values notesengage three
qui label values notesother three
qui label values quizthink yesno
qui label values quizengage three
qui label values quizother three
qui label values quiz2think yesno
qui label values quiz2engage three
qui label values quiz2other three
qui label values quiz3think yesno
qui label values quiz3engage three
qui label values quiz3other three
qui label values allowthink yesno
qui label values allowengage three
qui label values allowother three
qui label values askthink yesno
qui label values askengage three
qui label values askother three
qui label values ethical three2
qui label values fair three2
qui label values grades three2
qui label values friendyou1 scenario
qui label values friendother1 scenario
qui label values knewyou1 scenario
qui label values knewother1 scenario
qui label values friendyou2 scenario2
qui label values friendother2 scenario2
qui label values knewyou2 scenario2
qui label values knewother2 scenario2
qui label values friendyou3 scenario2
qui label values friendother3 scenario2
qui label values knewyou3 scenario2
qui label values knewother3 scenario2
qui label values liecustomer five
qui label values liecoworker five
qui label values illegal five
qui label values primary1 primary
qui label values primary2 primary
qui label values primary3 primary
qui label values job1 job
qui label values job2 job
qui label values job3 job
qui label values course course
qui label values university univer
qui gen college = .
qui label variable college "Business or Engineering?"
qui replace college = 0 if major < 4 
qui replace college = 1 if major > 3 
qui label define college 0 "Business" 1 "Engineering"
qui label values college college
qui gen astudent = 0
qui label variable astudent "A-grade student"
qui replace astudent = 1 if gpa >= 90 
//qui replace astudent = 1 if major > 3 
qui label define astudent 0 "Not A-grade student" 1 "A-grade student"
qui label values astudent astudent
//I want to consider that those that are currently taking business ethics did not take it
qui replace course = 1 if course == 2
 
qui recode ethical 0/1=0 2=1 3/4=2
qui recode fair 0/1=0 2=1 3/4=2
qui recode grades 0/1=0 2=1 3/4=2
/*
 //I want to combine SD/D and A/SA for the ethical,fair, and grades questions
qui gen ethical_combine = .
//qui gen fair_combine = .
//qui gen grades_combine = .
qui replace ethical_combine = 0 if ethical == 0 | ethical == 1
//qui replace fair_combine = 0 if fair == 0 | fair == 1
//qui replace grades_combine = 0 if grades == 0 | grades == 1
qui replace ethical_combine = 1 if ethical == 2
qui replace ethical_combine = 2 if ethical == 3 | ethical == 4
//qui replace fair_combine = 1 if fair == 3 | fair == 4
//qui replace grades_combine = 1 if grades == 3 | grades == 4
qui label variable ethical_combine "Cheating is ethically wrong"
//qui label variable fair_combine "Cheating is not fair"
//qui label variable grades_combine "Grades are more important"
qui label define combine 0 "Disagree" 1 "Neutral" 2 "Agree"
qui label values ethical_combine combine
*/


qui gen think = copythink + helpthink + notesthink + quizthink + quiz2think + quiz3think + allowthink + askthink
qui gen engage = copyengage + helpengage + notesengage + quizengage + quiz2engage + quiz3engage + allowengage + askengage
qui gen other = copyother + helpother + notesother + quizother + quiz2other + quiz3other + allowother + askother
qui label variable think "Measure for thinking a situation is cheating"
qui label variable engage "Measure for engaging in an unethical situation"
qui label variable other "Measure for thinking that others will engage in an unethical situation"

qui gen income = .
qui gen pick = floor((1+1)*runiform() + 0)
qui replace income = runiform(50000, 70000) if gpa < 70 & pick == 1
qui replace income = runiform(12000, 25000) if gpa < 70 & pick == 0
qui replace income = runiform(45000, 65000) if gpa < 75 & gpa >= 70 & pick == 1
qui replace income = runiform(20000, 28000) if gpa < 75 & gpa >= 70 & pick == 0
qui replace income = runiform(40000, 50000) if gpa < 80 & gpa >= 75 & pick == 1
qui replace income = runiform(25000, 30000) if gpa < 80 & gpa >= 75 & pick == 0
qui replace income = runiform(40000, 48000) if gpa < 85 & gpa >= 80 & pick == 1
qui replace income = runiform(28000, 35000) if gpa < 85 & gpa >= 80 & pick == 0
qui replace income = runiform(32000, 44000) if gpa < 90 & gpa >= 85
qui replace income = runiform(31000, 43000) if gpa < 100 & gpa >= 90
//introduce some randomness
qui replace income = income*rnormal(1, 0.1)
qui label variable income "Family income per year ($)"

qui gen attendance = rnormal(gpa, 2)
qui label variable attendance "Attendance and participation grade last semester"

qui gen withdraw = floor(rgamma(1, 2))
qui replace withdraw = 8 if withdraw == 13
qui replace withdraw = 7 if withdraw == 12
qui replace withdraw = 6 if withdraw == 11
qui replace withdraw = 5 if withdraw == 10
qui replace withdraw = 4 if withdraw == 9
qui label variable withdraw "Total number of courses student has withdrawn from"

//create relationship between withdraw and gpa/gender
qui replace withdraw = withdraw + floor((8+1)*runiform() + 1) if gpa < 70 & gender == 0
qui replace withdraw = withdraw + floor((4+1)*runiform() + 1) if gpa < 70 & gender == 1
qui replace withdraw = 8 if withdraw > 8
qui replace withdraw = withdraw + floor((4+1)*runiform() + 1) if gpa < 75 & gender == 0
qui replace withdraw = withdraw + floor((2+1)*runiform() + 1) if gpa < 75 & gender == 1
qui replace withdraw = 8 if withdraw > 8
qui replace withdraw = withdraw - floor((2+1)*runiform() + 1) if gpa >= 80 & gender == 0
qui replace withdraw = withdraw - floor((4+1)*runiform() + 1) if gpa >= 80 & gender == 1
qui replace withdraw = 0 if withdraw < 0
qui replace withdraw = withdraw - floor((4+1)*runiform() + 1) if gpa >= 85 & gender == 0 & !missing(gpa)
qui replace withdraw = withdraw - floor((8+1)*runiform() + 1) if gpa >= 85 & gender == 1 & !missing(gpa)
qui replace withdraw = 0 if withdraw < 0

qui gen english = 53 + 0.02*10^(0.035*gpa)
//introduce some randomness
qui replace english = english*rnormal(1, 0.025)
qui replace english = 96 if english > 98 & !missing(english)
qui label variable english "English course grade"

qui gen credits = .
qui gen pick1 = floor((1+1)*runiform() + 0)
qui gen pick2 = floor((1+1)*runiform() + 0)
qui gen pick3 = floor((1+1)*runiform() + 0)

qui replace credits = rnormal(12, 1) if gpa >= 90 & !missing(gpa) & pick1 == 0 & pick2 == 0 
qui replace credits = rnormal(12, 6) if gpa < 90 & gpa >=80 & pick1 == 0 & pick2 == 0 

qui replace credits = rnormal(33, 6) if gpa < 80 & gpa >= 70 & pick1 == 0 & pick2 == 1
qui replace credits = rnormal(33, 1) if gpa < 70 & pick1 == 0 & pick2 == 1

qui replace credits = rnormal(52, 1) if gpa >= 90 & !missing(gpa) & pick1 == 1 & pick2 == 0
qui replace credits = rnormal(52, 6) if gpa < 90 & gpa >= 83 & pick1 == 1 & pick2 == 0

qui replace credits = rnormal(70, 8) if gpa < 77 & gpa >= 70 & pick1 == 1 & pick2 == 1
qui replace credits = rnormal(70, 3) if gpa < 70 & pick1 == 1 & pick2 == 1

qui replace credits = rnormal(95, 6) if gpa >= 77 & gpa < 87 & missing(credits)
qui replace credits = rnormal(102, 1) if gpa >= 87 & gpa <= 93 & !missing(gpa) & missing(credits)

//introduce some randomness
qui replace credits = credits*rnormal(1, 0.1)
qui replace credits = ceil(credits)
qui replace credits = 3 if credits < 3
qui label variable credits "Number of credits completed so far"

//make sure that no student withdraws from more courses than the number of credits that he or she has taken
qui replace credits = withdraw*3 + 6 if withdraw >= credits/3


qui drop copythink-askother primary1-primary3 job1-job3 astudent friendyou1-knewother3 pick pick1 pick2 pick3 level
qui order college major credits gender gpa attendance english withdraw income ethical fair grades liecustomer liecoworker illegal course university think engage other
qui label data "Student perceptions about academic misconduct"
qui save thedata, replace

