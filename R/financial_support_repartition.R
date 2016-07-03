#' Evolution of grants / financial aid over time
#'
#' The following code plots the evolution of different sources of financial support
#' for students (more specifically, financial aid, federal grants, local grants and
#' student loands) for any given university over time.
#'
#' @param uni.name type in name of university
#'
#' @return None
#'
#' @examples
#' finRepartition(uni.name = "University of Pennsylvania")
#'
#' @export

finRepartition <- function(uni.name) {

  library(readr)
  library(scales)
  library(reshape2)
  library(ggplot2)

  dat <- read_csv("college_data_cleaned.csv")
  current_uni <- uni.name

  fin_data <- subset(dat, uni.name == current_uni)[c(2, 7:10)]

  dat_long <- melt(data = fin_data, id.vars = "Year")

  ggplot(data = dat_long, aes(x = Year, y = value, group = variable)) +
    ggtitle(label = sprintf("Evolution of grants/financial aid over time (%s)", current_uni)) +
    geom_line(aes(color = variable), size = 1.5) +
    scale_y_continuous(name = "Number of students") +
    scale_color_manual(name = "Type of Financial Support",
                       values = c("red", "blue", "yellow", "green"))
}

document()

4753 / 9842

