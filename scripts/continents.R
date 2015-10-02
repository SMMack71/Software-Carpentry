
#!/usr/bin/env Rscript
# R Plotting continents

#check that ggplot2 packages are installed if not
#install.packages(ggplot2)


# comments added to demonstrate git version control

library(ggplot2)

#assume you have the gapminder.RData 
load("data/gapminder.RData")

#creat a function to plot dots per contenent
#receives a data frame input and makes a plot
# more comments :)


draw_dots_continent <- function(df){
  
  p <- ggplot(data=df, aes(x=year, y=lifeExp, color=country)) + 
        geom_point(aes(color=continent)) +
        ggtitle("Life expectancy by year") + 
        facet_grid(.~ continent)
  print(p)
}

make_pngplot <- function(name){
  png(file=paste(name,".png",sep=""))
  draw_dots_continent(gapminder)
}

#how to retrive input from user
arg <- commandArgs(TRUE)
try(make_pngplot(arg[1]))

# This comment was added by Stian
