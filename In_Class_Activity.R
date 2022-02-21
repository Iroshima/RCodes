#loading the data set
WineData = read.csv("wine.txt", header = TRUE)
WineData

#remove 1st column 
NewWine = WineData
NewWine$Class <- NULL
View(NewWine)
plot(NewWine)

#normalizing data - standardize all the columns 
StanderdWine <- scale(NewWine[-1])
View(StanderdWine)

#Calculate the NA values 
sum(is.na(StanderdWine))

#get the summary
summary(StanderdWine)

#applying kmeans 
ClusterWine <- kmeans(StanderdWine, 3)

#finding the attributes 
attributes(ClusterWine)

#finding centers 
ClusterWine$centers

#Compare the clusters with the original classes 
table(WineData$Class, ClusterWine$cluster)

