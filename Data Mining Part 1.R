data <- read.csv('xAPI-Edu-Data.csv')
data
dim(data)
head(data)

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
outliersRaisedHands <- boxplot(data$raised_hands, plot=FALSE)$out
outliersVisitedResources <- boxplot(data$visited_resources, plot=FALSE)$out
outliersViewedAnnouncement <- boxplot(data$viewed_announcement, plot=FALSE)$out
outliersParticipateInDiscussionGroup <- boxplot(data$participate_in_discussion_group, plot=FALSE)$out
outliersRaisedHands
outliersVisitedResources
outliersViewedAnnouncement
outliersParticipateInDiscussionGroup

