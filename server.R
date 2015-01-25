library(jsonlite)


#function to translate the zipcode into url text that points to 
#json openweathermap json data for that zip code in English units
#used by getwind function
concatenateurl <- function(zipcode)
{
  textstring1 <- "http://api.openweathermap.org/data/2.5/forecast/daily?q="
  textstring2 <- zipcode
  textstring3 <- '&mode=json&units=imperial&cnt=7'
  paste(textstring1,textstring2,textstring3,sep="")
  
}

#function that finds a list of wind speeds for a zip code
getwind <- function(zipcode)
{
  url<-url(concatenateurl(zipcode))
  read <- readLines(url)
  close(url)
  json<-lapply(X=read, fromJSON)
  data<-data.frame(json)
  data$list.speed
}

#server function
shinyServer(
  function(input, output) {
#uses getwind function to get a list of recent wind speeds for inputed zip code
#outputs a plot of the wind speeds
   output$winddata<-renderPlot(
                               plot(getwind(input$zipcode), 
                                    main = "Wind Speed in Recent Hours for Given Zip Code",
                                    ylab = "Wind Speed (mi/hr)",
                                    xlab = "Recent Hour",
                                    ) 
                               )
  }
)