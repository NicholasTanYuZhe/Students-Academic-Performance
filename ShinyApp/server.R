#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)
setwd("C:/Users/NicholasTan/Desktop/Studies/Gamma - Sem 2/TDS3301-Data Mining/Assignment/Part 1")
data <- read.csv('xAPI-Edu-Data.csv')
data <- data[!duplicated(data),]
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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  observe({
    if (input$VarX == "Semester") {
      shinyjs::enable("VarY")
    } else {
      shinyjs::disable("VarY")
    }
  })
  
  output$bar<- renderPlot({
    x <- input$VarX
    y <- input$VarY
    
    if(x == "Student Performance Level")
    {
      ggplot(data, aes(x = student_performance_level)) + geom_bar()
    }
    else if(x == "Semester" && y == "-")
    {
      ggplot(data, aes(x= semester, fill = factor(student_performance_level))) + geom_bar(position=position_dodge())
    }
    else if(x == "Semester" && y == "Raised Hands")
    {
      ggplot(data, aes(x= semester, y = raised_hands, fill = student_performance_level)) + geom_histogram(stat="identity", position=position_dodge())
    }
    else if(x == "Semester" && y == "Visited Resources")
    {
      ggplot(data, aes(x= semester, y = visited_resources, fill = student_performance_level)) + geom_histogram(stat="identity", position=position_dodge())
    }
    else if(x == "Semester" && y == "Viewed Announcement")
    {
      ggplot(data, aes(x= semester, y = viewed_announcement, fill = student_performance_level)) + geom_histogram(stat="identity", position=position_dodge())
    }
    else if(x == "Semester" && y == "Participate in Discussion Group")
    {
      ggplot(data, aes(x= semester, y = participate_in_discussion_group, fill = student_performance_level)) + geom_histogram(stat="identity", position=position_dodge())
    }
   
  })
  
})


