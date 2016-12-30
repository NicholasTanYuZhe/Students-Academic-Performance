install.package("ggplot2")
library(ggplot2)
setwd("C:/Users/NicholasTan/Desktop/Studies/Gamma - Sem 2/TDS3301-Data Mining/Assignment/Part 1")
data <- read.csv('xAPI-Edu-Data.csv')
data
dim(data)
head(data)
str(data)

#check for na
any(is.na(data))

#check for duplicates
sum(duplicated(data))
data <- data[!duplicated(data),]

#Fixed the inconsistency of column names and correct some column names to match the value
names(data)[names(data) == 'NationalITy'] <- 'nationality'
names(data)[names(data) == 'PlaceofBirth'] <- 'place_of_birth'
names(data)[names(data) == 'StageID'] <- 'education_level'
names(data)[names(data) == 'GradeID'] <- 'grade'
names(data)[names(data) == 'SectionID'] <- 'classroom'
names(data)[names(data) == 'Topic'] <- 'course'
names(data)[names(data) == 'Semester'] <- 'semester'
names(data)[names(data) == 'Relation'] <- 'parent_responsible_for_student'
names(data)[names(data) == 'raisedhands'] <- 'raised_hands'
names(data)[names(data) == 'VisITedResources'] <- 'visited_resources'
names(data)[names(data) == 'AnnouncementsView'] <- 'viewed_announcement'
names(data)[names(data) == 'Discussion'] <- 'participate_in_discussion_group'
names(data)[names(data) == 'ParentAnsweringSurvey'] <- 'parent_answering_survey'
names(data)[names(data) == 'ParentschoolSatisfaction'] <- 'parent_satisfication_with_school'
names(data)[names(data) == 'StudentAbsenceDays'] <- 'student_absence_days'
names(data)[names(data) == 'Class'] <- 'student_performance_level'
data

#Check for outliers
boxplot(data$raised_hands)$out
boxplot(data$visited_resources)$out
boxplot(data$viewed_announcement)$out
boxplot(data$participate_in_discussion_group)$out

#To see how many students in each of the student performance level
ggplot(data, aes(x = student_performance_level)) + geom_bar()
#To see the relationship between semester and number of times student raised their hands with their performance level
ggplot(data, aes(x= semester, y = raised_hands, fill = student_performance_level)) + geom_histogram(stat="identity", position=position_dodge())
#To see the relationship between semester and number of times student visited resources with their performance level
ggplot(data, aes(x= semester, y = visited_resources, fill = student_performance_level)) + geom_histogram(stat="identity", position=position_dodge())
#To see the relationship between semester and number of times student viewed announcement with their performance level
ggplot(data, aes(x= semester, y = viewed_announcement, fill = student_performance_level)) + geom_histogram(stat="identity", position=position_dodge())
#To see the relationship between semester and number of times student participate in discussion group with their performance level
ggplot(data, aes(x= semester, y = participate_in_discussion_group, fill = student_performance_level)) + geom_histogram(stat="identity", position=position_dodge())
#To see the number of student in each performance level in each semester
ggplot(data, aes(x= semester, fill = factor(student_performance_level))) + geom_bar(position=position_dodge())
