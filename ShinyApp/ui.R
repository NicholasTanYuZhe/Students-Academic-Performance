#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinyjs)

#ui.R

ui <- fluidPage(
  useShinyjs(),
  titlePanel("Students' Performance Level"),
  sidebarPanel( 
    helpText("Show the bar chart/histogram with information of students' perfomance level."),

    
    selectInput("VarX",
                label = "Variable X:",
                choices = c("Student Performance Level", "Semester"),
                selected = "Student Performance Level"),
    selectInput("VarY",
                label = "Variable Y:",
                choices = c("-", "Raised Hands", "Visited Resources", "Viewed Announcement", "Participate in Discussion Group"),
                selected = "-")
  ),
  mainPanel(plotOutput("bar")))