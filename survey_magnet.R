library(redcapAPI)
library(tidyr)
library(ggplot2)
library(dplyr)

source("token.txt")

rcon <- redcapConnection(url=url, token=token)

rm(token)

magnet <- exportRecords(rcon,  factors = FALSE,
                               labels = FALSE, dates = TRUE,
                               events = NULL)

clean_magnet<- transform(magnet, 
                        Date = substr(magnet[,3], 1,10), 
                        Hour = substr(magnet[,3], 12,20))

dates_responses <- select(clean_magnet, record_id, Date)
 
na.omit(dates_responses$Date)

summary_results <- summary(dates_responses$Date)

daily_responses <- data.frame()

daily_responses <- data.frame(summary_results)
daily_responses$days <- 1:nrow(daily_responses)

  
 ggplot(daily_responses, aes(days,summary_results)) +
   geom_point() +
   geom_smooth(method="loess", na.rm=TRUE, se=FALSE, show.legend = TRUE, span = 0.25) 
 

  questions <- exportFields(rcon)
  
  