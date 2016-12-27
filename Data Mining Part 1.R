setwd("C:/Users/NicholasTan/Desktop")
data <- read.csv('xAPI-Edu-Data.csv')
data
dim(data)
head(data)

is.na(data) #check for na

length(unique(data)) == nrow(data) #check for duplicates

colnames(data) <- c("gender", "nationality", "place of birth", "education level", "grade", "classroom", "course", "semester", "parent responsible for student", "raised hand", "visited resources", "viewed announcement", "participate in discussion group", "parent answering survey", "parent satisfication with school", "student absence days", "student performance level")
data

outliers <- boxplot(data$"raised hand", plot=FALSE)$out #check for outliers
outliers

