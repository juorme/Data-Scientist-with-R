#Summarizing the median life expectancy
library(gapminder)
library(dplyr)

# Summarize to find the median life expectancy
medianLifeExp <- gapminder %>%
                    summarize(median(lifeExp))

#Summarizing the median life expectancy in 1957
library(gapminder)
library(dplyr)

# Filter for 1957 then summarize the median life expectancy
 gapminder %>%
    filter(year == 1957) %>%
      summarize(medianLifeExp = median(lifeExp))

#Summarizing multiple variables in 1957
library(gapminder)
library(dplyr)

# Filter for 1957 then summarize the median life expectancy and the maximum GDP per capita
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

#Summarizing by year
library(gapminder)
library(dplyr)

# Find median life expectancy and maximum GDP per capita in each year
gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

#Summarizing by continent
library(gapminder)
library(dplyr)

# Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>%
  group_by(continent) %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

#Summarizing by continent and year
library(gapminder)
library(dplyr)

# Find median life expectancy and maximum GDP per capita in each continent/year combination
gapminder %>%
  group_by(continent,year) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

#Visualizing median life expectancy over time
library(gapminder)
library(dplyr)
library(ggplot2)

by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

# Create a scatter plot showing the change in medianLifeExp over time
ggplot(by_year, aes(x = year, y = medianLifeExp)) +
    geom_point() +
    expand_limits(y = 0)

#Visualizing median GDP per capita per continent over time
library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>%
                    group_by(continent, year) %>%
                    summarize(medianGdpPercap = median(gdpPercap))

# Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent,aes(x = year , y = medianGdpPercap,color = continent))+
      geom_point() +
      expand_limits(y = 0)

#Comparing median life expectancy and median GDP per continent in 2007
library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>%
                      filter(year == 2007) %>%
                      group_by(continent) %>%
                      summarize(medianLifeExp = median(lifeExp), medianGdpPercap=median(gdpPercap))

# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x= medianGdpPercap, y =medianLifeExp, color=continent ))+
      geom_point() +
      expand_limits(y = 0)

