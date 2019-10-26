#a plot is just a blank canvas
library(ggplot2)
ggplot(mtcars)

#blank canvas + aesthetic
ggplot(mtcars, aes(x = wt, y = mpg)) 

#blank canvas + aesthetic + geometry
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point()

#blank canvas + aesthetic + geometry + more aesthetics

ggplot(mtcars, aes(x = wt, y = mpg, size = disp, color = gear)) + 
  geom_point()

#blank canvas + aesthetic + geometry + more aesthetics + labels

ggplot(mtcars, aes(x = wt, y = mpg, size = disp, color = gear)) + 
  geom_point() +
  labs(title = "Miles/gallon spent based on the weight of the cars")

## Drawing your first plot

install.packages('ggplot2')
library(ggplot2)

str(mtcars)

ggplot(mtcars, aes(x = wt, y = mpg, size = disp, color = gear)) + 
  geom_point() +
  geom_smooth()
labs(title = "The miles/gallon spent based on the weight of the cars")

### geom_bar 

library(ggplot2)
ggplot(mtcars, aes(x = factor(cyl), 
                   fill = factor(am))) +
  # try position = 'dodge', 'fill'
  geom_bar(position = 'dodge') +  
  scale_x_discrete('Cylinders') +
  scale_y_continuous('Number') +
  scale_fill_manual('Transmission', 
                    values = c("#E41A1C", "#377EB8"),
                    labels = c("Manual", "Automatic")) 


### histogram
#### 1 - Make a univariate histogram

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

#### 2 - Plot 1, plus set binwidth to 1 in the geom layer

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 1)

#### 3 - Plot 2, plus MAP ..density.. to the y aesthetic (i.e. in a second aes() function)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 1, aes(y = ..density..))

#### 4 - plot 3, plus SET the fill attribute to "#377EB8"

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 1, fill = "#377EB8", aes(y = ..density..))

## Playing with aesthetics

#### Basic scatter plot: wt on x-axis and mpg on y-axis; map cyl to col

ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point(size=4)

#### Hollow circles 

ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point(size=4, shape=1)

#### Add transparency 

ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point(size=4, shape=1, alpha=0.6)

## Playing with facet 

str(iris)
names(iris)

## Playing with facet {.columns-2 .smaller}

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point() +

## Playing with facet {.columns-2 .smaller}

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point() +
  facet_grid(. ~ Species)

## Playing with facet {.columns-2 .smaller}

library(tidyr)

iris %>%
  gather(key, value, -Species) %>%
  separate(key, c("Part","Measure"), sep="\\.") %>%
  ggplot(aes(x = Species, y = value, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)

## Playing with facet {.columns-2 .smaller}

library(tidyr)
library(dplyr)
library(ggplot2)

iris %>%
  mutate(Flower = 1:nrow(iris)) %>%
  gather(key, value, -Species, -Flower) %>%
  separate(key,c("Part", "Measure"),sep="\\.")%>%
  spread(Measure, value) %>%
  ggplot(aes(x=Length, y=Width, color=Part)) +
  geom_jitter() +
  facet_grid(. ~ Species)