library(readr)

college_data <- read_csv("college_data_cleaned.csv")
View(college_data)


plot(total.attendCost ~ Accepted, data = college_data)
