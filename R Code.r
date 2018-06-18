
#1.How to get a description of the version of R and its attached packages used in the current session?
sessionInfo()

#2.Create object called "abc" by assigning the number 3.
abc <- 3
print(abc)

#3.Create different vectors ("a" is numeric, "b" is character and "c" is logical).
a<-c(3.5,98,100)
is.numeric(a)
b<-c("tom" ,"runs", "after","jerry")
is.character(b)
c<-c(TRUE,FALSE)
is.logical(c)

#4.List all the objects in the current session.
ls()
objects()

#5.Create vector "x" with the values {4, 4, 5, 6, 7, 2, 9}
my_vector<-c(4,4,5,6,7,2,9)
print(my_vector)
#a.Calculate the number of observation (n), mean, sum, max, min, variance of the vector 'x".
mean(my_vector)
length(my_vector)
sum(my_vector)
max(my_vector)
min(my_vector)
var(my_vector)
#b.Also print the 3rd element, odd positions elements and elements from 2 to 6 positions.
my_vector[3]
my_vector[c(1,3,5,7)]
my_vector[c(2:6)]

#6.Create 6x4 matrix(6 rows and 4 columns) using 1 to 24 numbers.
my_matrix <- matrix(c(1:24), 6, 4, dimnames=list(rownames,colnames))
rownames = c("row1", "row2", "row3", "row4","row5","row6")
colnames = c("col1", "col2", "col3","col4")

#7. Create data frame with the below vectors
#a. StoreID - (111, 208, 113, 408)
#b. Tenure - (25, 34, 28, 52)
#c. StoreType - ("Type1", "Type2", "Type1", "Type1")
#d. status - ("Poor", "Improved", "Excellent", "Poor")
stores<-data.frame(StoreID=c(111,208,113,408), Tenure=c(25,34,28,52),StoreType=c("Type1","Type2","Type1", "Type1"),status=c("Poor", "Improved", "Excellent", "Poor"))
View(stores)

#8. Print the data in different programs.
#a. only storeId, tenure
#b. only storetype and status
#c. only tenure


#a. only storeId, tenure
store_disp<-stores[1:2]
#b.only storetype and status
store_disp1<-stores[c("StoreType","status")]
View(store_disp1)
#c. only tenure
store_disp2<-stores[c("Tenure")]
View(store_disp2)

# 9. Create different factors using the below vectors and label the values and order the levels for factors "outcome" and "status".
# a. ethnicity - "White", "African amrican", "White", "Asian"
# b. status - Poor", "Improved", "Excellent", "Poor"
# c. outcome - c(1, 3, 2, 4, 3, 1, 1) - labels- "Poor", "Average", "Good", "Excellent"
ethincity<-factor(c("White", "African amrican", "White", "Asian"))
status <- factor(c("Poor", "Improved", "Excellent", "Poor"))
statu1 <- factor(status,levels=c("Poor", "Improved", "Excellent"),ordered=TRUE)
outcome <-factor(c(1, 3, 2, 4, 3, 1, 1),levels=c(1,2,3,4),ordered=TRUE)

# 10. Create list called “mylist” with the title "My First List" and with the below objects called “ages” with below h, j and k. Also print the different combinations of objects.
# a. h –numeric vector with the values 25, 26, 18, 39
# b. j – matrix with 5 rows and 2 columns with the values 1 to 10
# c. k – character vector with the values "one", "two", "three"

mylist<-list(h=c(25,26,18,39), j=matrix(c(1:10),5,2), k=c("one","two","three"))
mylist

# 11. Read the stores.csv data set and find the summary statistics for all the columns.
setwd("C:/Users/al325478/Desktop/SASStudyPDfs/r/1. Introduction to R-Data Importing/DataSets for R sessions")
stores<-read.csv("stores.csv")
summary(stores)

# 12.Use with() function, calculate the summary of operatingcost in the stores.csv data set. What is the difference?

s1<-with(stores, stores$OperatingCost)
s1

# 13. Apply below functions on stores data frame and observe the outputs.
# a. class(stores)
# b. names(stores)
# c. length(stores)
# d. dim(stores)
# e. str(stores)
# f. head(stores)
# g. tail(stores)
# h. fix(stores)

class(stores)
names(stores)
length(stores)
dim(stores)
str(stores)
head(stores)
tail(stores)
fix(stores)

# 14. Create new variable by OperatingCost + AcqCostPercust using different methods
# a. Simple calculation and assignment operators
# b. Using transform function

#a. 
stores$store_n<-stores$OperatingCost+stores$AcqCostPercust
   stores$store_n
#b.
   stores <- transform(stores, Total_cost1 = AcqCostPercust*Total_Customers + OperatingCost)
   stores$Total_cost1
   
   
# 15. Create new variable store class as follows.
# a. If total sales<120 then “Low Perform store”
# b. If total sales>=120 and total sales<240 then “Average Perform store”
# c. If total sales>240 then “High Perform store”
   
   stores$class1[stores$TotalSales<120]<-"Low"
   stores$class1[stores$TotalSales>=120 & stores$TotalSales<240]<-"Average"
   stores$class1[stores$TotalSales>240]<-"High"
   stores$class1
# 16. Rename the variable “AcqCostPercust” with “AcqCost”
   install.packages("reshape")
   library(reshape) 
   mydata <- rename(stores, c(AcqCostPercust="AcqCost"))
   names(mydata)
   
# 17.How to find missing values in the stores dataset and recode missing values with 0? How to delete the missing values (if there are any) from the data set?
     stores_miss<- stores[is.na(stores)]
     View(stores_miss)
     stores[is.na(stores)]<- 0
     View(stores)
     setwd("C:/Users/al325478/Desktop/SASStudyPDfs/r/1. Introduction to R-Data Importing/DataSets for R sessions")
     stores_1<-read.csv("stores.csv")
     View(stores_1)
     x<- na.omit(stores_1)
     View(x)
# 18. Sort the stores data as follows
#      a. Create new dataset (newstores) with sorted data by “Storetype”
#      b. Create new dataset (newstores) with sorted data by location(ascending) and totalsales in descending order.
newstores<-stores_1[order(stores_1$StoreType,decreasing = TRUE),]
newstores<-stores_1[order(stores_1$Location),]
newstores<-stores_1[order(stores_1$TotalSales,decreasing = TRUE),]