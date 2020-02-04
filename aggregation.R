data <- ChickWeight
head(data)
unique(data$Time)
names(data)
length(data)

library(ggplot2)
ggplot(data=data, aes(x=Time, y=weight, group=Diet, colour=Diet)) +
  geom_point() 

#Encontrar el peso medio dependiendo de la dieta
aggregate(data$weight, list(diet =data$Diet), mean)
head(aggregate(data$weight, 
               list(time = data$Time, diet = data$Diet),
               mean
               )
     )

#Ver los pesos a través de las diferentes dietas
ggplot(data) + geom_line(aes(x=Time, y=weight, colour =Chick)) +
  facet_wrap(~Diet) +
  guides(col = guide_legend(ncol = 3))


