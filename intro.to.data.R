install.packages("ggplot2")
library(ggplot2)
# Install and load `ggplot2`
# You will also want to load `dplyr`

Grammar of graphics
- words to describe visualization
- *Data > shown in plot
- *Geometric Objects (geoms) > that appear on plot, shapes. things that you see on graph
- *aesthetic mappings > position. Axis tells location (vertical/horizontal)
- statistical transformation > used to calculate data. How to show plot
- scales > range of values. x is 0-10 or 0-100. Red to blue, blue to green, etc.
- coordinate system > cartesian coordinates. adjust axes. instead of right angles, used crunched. Polar coordinates!
  - facets > drwa part of plot for each pair. 

Take objects and put into layers!
  - each layer has geom object, a set of aesthetic mappings, stat info, a position adjustment.
View(mpg)

# For this exercise you'll be working with the `diamonds` data set included in the ggplot2 library
# Use `?diamonds` to get more information about this data set (including the column descriptions
# Also check the _column names_ and the _number of rows_ in the data set

ggplot(data = mpg) + # <- just add a geometry! Can add multiple geoms with +
  geom_point(mapping =   aes(x = displ,         y = hwy,     color = class))
# geom objects (points). aesthetic mappings!  property = column  #set color

# Can also do assigning without mapping                  set outside of mappings (or else with assign as variables)
geom_point(mapping =   aes(x = displ,         y = hwy), size = 4, color = "Blue")

# Bar chart
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class))
# does counts. Cannot specify height for this. no y mapping.

#mappings used for all sets of geometries. Using both aesthetics. Can override though! 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +   geom_point() +   geom_smooth(se=FALSE)


statistical counts 
____________________

- default transformation used to calculate new data.
- can add not geom layers, but instead statistical layers 
- stats layers = geom layers

positon adjustments
- geom_point(mapping =   aes(x = displ, y = hwy, fill = class), position = "fill")

scales
- add scales to a plot to determine the range of aesthetic values the data should map to
- data -> aesthetic. is a list. 1=red,2=yello,3=blue. Can change this key:value pair!

ggplot(data = mpg) +
  geom_point(mapping =   aes(x = cty, y = hwy, color = class)) +
  scale_x_reverse() +
  scale_color_hue(l = 70, c = 30)

ggplot(data = mpg) +
  geom_point(mapping =   aes(x = cty, y = hwy, color = class), size = 3) +
  scale_x_reverse() +
  scale_color_brewer(palette = "Set1")

-color brewer! 
  - use pretty color schemes. considers color blindness.

Coordinate system
_________________

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = hwy, fill = class)) +
  coord_flip()
                        
                                       # the y variable
ggplot(data = mpg, aes(x = factor(1), fill = factor(cyl))) +
  geom_bar(width = 1) +
  coord_polar(theta = 'y')

Facets 
________

-just like group_by in dplyr
- facets instead of groups
- make plots for each individual group
- plot for each individual group (facet)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
  facet_wrap(~class + cyl)
