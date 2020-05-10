setwd("yourwd")
library(ggplot2)
library(ggthemes)
library(ordinal)
library(magrittr)
library(dplyr)
library(scales)


#make pretty plots in ggplot2
#tips and tricks to make all types of plots nicer looking


#GENERAL PLOT AESTHETICS (RES, TRANSPARENCY)
#this allows you to set the resolution, dimensions, file name, and transparency of your ggplot
#transparent plots are especially useful if you are using black or otherwise colored slides

png("NPE2_overallResponseRate2.png", width=20, height=16, units="cm", res=800, bg="transparent")

#all of your ggplot code goes here, as normal

dev.off() #saves your plot in your R wd


#GENERAL THEME
#change overall theme properties
theme_minimal(base_size=14, base_family="Times New Roman") #set size of the grid and the global font family


#BACKGROUND GRID
#change the size and color of the background grid
#element_blank() removes that grid, color="" changes the color of the grid lines
theme(panel.grid.minor=element_blank(), panel.grid.major=element_line(color="grey60")) 

#TITLES/CAPTIONS
#add titles/captions and change their text
#change axis labels, coloring, and text size
labs(title="My ggplot", subtitle="My ggplot's subtitle", caption="My ggplot's caption")
theme(title=element_text(size=15)) #change the font size of the title, etc.


#LEGEND
#change the spacing, text, and size of the plot legend

theme(legend.text = element_text(size=13, color="black"))
theme(legend.title = element_text(size=13, color = "black"))
guides(alpha = guide_legend(override.aes = list(colour = "white"))) #changes the color of the legend icon, here for alpha property

theme(legend.key.height =unit(2,"line")) #adjusts the vertical spacing between the legend factor labels and legend keys/labels
theme(legend.spacing.x = unit(5.0, 'cm')) #adjust the horizontal space between the legend keys and the labels of the keys
theme(legend.spacing.y = unit(2.0, 'cm')) #adjust the vertical space between the legend factor labels and the legend keys

guides(shape = guide_legend(override.aes = list(size=2))) #changes the size of the legend key for the shape aesthetic factor
guides(color = guide_legend(override.aes = list(size=2))) #changes the size of the legend key for the color aesthetic factor

theme(legend.position="bottom")  #position the legend at the bottom of the plot
theme(legend.title = element_blank()) #remove the legend title


#AXIS LIMITS/TICKS
#change the axis limits and tick marks
ylim(0, 1000) #sets the y-axis limits for the plot; note that this does not change the tick frequency or spacing
scale_y_continuous(breaks=pretty_breaks(n=10))  #will create breaks at 10 num. intervals on your y axis
scale_x_discrete(limits=0:12) #for discrete values on the x-axis will force labels from 1-12 in 1 num. intervals

#reorder x axis based on values from smallest to largest (www.rdocumentation.org/packages/stats/versions/3.6.2/topics/reorder.default)
geom_bar(aes(y=n, x=reorder(factor, -n))


#AXIS LABELS
ylab("Total Count") + xlab("Coding Bin") #add y and x axis labels
theme(axis.text.x=element_text(size=13, color ="black")) + theme(axis.text.y=element_text(size=13, color="black"))
theme(axis.title.x = element_text(size=16, color = "black")) + theme(axis.title.y = element_text(size=16, color = "black"))
theme(axis.title.x = element_blank()) #will remove the x-axis title


#POINTS/BARS
#change the properties of the points/bars
scale_fill_manual(values=c("#A50D69","#7A0D87", "#500DA5")) #manually fill colors into points or bars

#for geom_point(range)():
position=position_dodge(width=.4), size=1, stroke=4, fatten=8)
	#position_dodge: jitter points so that your points are not laying on top of one another (avoid overplotting)
	#size: change the size of the points; will also change thickness of error bars
	#stroke: change the thickness of the border around points (e.g. if you are using scale_shape_circlefill())
	#fatten: change the size of the points; this does not change the size of the error bar but fattens the points themselves
	
#for geom_bar():
geom_bar(stat="identity", aes(y=n, fill = Factor)) 
	#fills bars with counts from the specified factor
	#must specify color scheme or manually specify enough colors as factor levels: e.g. using scale_fill_manual()









