analyze_data <- function(file, countr) {
  file_out <- read.csv(file, header = TRUE)
  country_name <- subset(file_out, file_out$country == countr)
  out2 <- c("Mean_le" = mean(country_name$lifeExp), 
            "Min_le" = min(country_name$lifeExp), 
            "Max_le" = max(country_name$lifeExp))
  print(file)
  print(countr)
  print(out2)
  plot(country_name$year, country_name$lifeExp, xlab="Year", ylab="Life Expectancy", 
       main=countr) 
}

analyze_all <- function(pattern, countr) {
  filenames <- list.files(path = "data", pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    analyze_data(f,countr )
  }
}