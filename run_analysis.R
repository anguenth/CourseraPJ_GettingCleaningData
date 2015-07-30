###########################################################
####### Course Project: Getting and Cleaning Data #########
###########################################################

## Import Data
      
      ## General descriptive data (labels)
      file_actDescr     <- "UCI HAR Dataset/activity_labels.txt"
      file_featDescr    <- "UCI HAR Dataset/features.txt"
      
      ## Measurement and Setup Data
      file_train        <- "UCI HAR Dataset/train/X_train.txt"    
      file_trainAct     <- "UCI HAR Dataset/train/y_train.txt"             
      file_trainSubj    <- "UCI HAR Dataset/train/subject_train.txt"
      
      file_test         <- "UCI HAR Dataset/test/X_test.txt"
      file_testAct      <- "UCI HAR Dataset/test/y_test.txt"
      file_testSubj     <- "UCI HAR Dataset/test/subject_test.txt"
      
      ## read in as dataframe
      actDescr          <- read.table(file_actDescr)
      featDescr         <- read.table(file_featDescr)
      
      train             <- read.table(file_train)           ## check: dim(train) -> [1] 7352  561
      trainAct          <- read.table(file_trainAct)            
      trainSubj         <- read.table(file_trainSubj)
      
      test              <- read.table(file_test)
      testAct           <- read.table(file_testAct)
      testSubj          <- read.table(file_testSubj)      


## Combine Data Sets      
    
      data <- rbind(train,test)


## Extract relevant columns 
      
      ## find relevant column names with mean() and std() in decription file "featDescr" 
      pos      <- grep("(.*mean\\(\\).*)|(.*std\\(\\).*)",featDescr[,2])
      cnames   <- grep("(.*mean\\(\\).*)|(.*std\\(\\).*)",featDescr[,2],value = TRUE)
      
      ## extract columns by column indices
      xdata     <- data[pos]

      ## rename columns
      colnames(xdata) <- cnames 

      
## Insert additional information about activity and subject
      
      ## activity  (use descriptive names)
      ## !!! merge does not preserve the order !!!
      ## "sort=FALSE" just prevents sorting afterwards, but "merge" first reorders first column by "by.x" and then
      ## looks for any matches
      ## testAct_name     <- merge(testAct,actDescr, by.x="V1",by.y="V1",all.x=TRUE,sort=FALSE)  ## or: merge(testAct,actDescr,sort=FALSE)     

      library("plyr")
      trainAct_name    <- join(trainAct,actDescr,by="V1", type = "left") 
      testAct_name     <- join(testAct,actDescr,by="V1", type = "left") 

      xdata$activity   <- rbind(trainAct_name[2],testAct_name[2])[["V2"]]          ## [[]]: resolves to factor
      
      ## subject
      xdata$subject  <- rbind(trainSubj[1],testSubj[1])[["V1"]]                    ## [[]]: resolves to int

      
## Melt data structure and dcast
      
      install.packages("reshape2")      
      library(reshape2)      

      mdata <- melt(xdata,id=c("activity","subject"),measure.vars=cnames)

 
      df_tidyDataset <- dcast(mdata,activity+subject~variable,mean)                ## dcast gives dataframe
      
      ## matrix_result <- acast(mdata,activity+subject~variable,mean) 
      ## with acast the combination of activity+subject becomes a rowname
      ## which is displayed on each site break 
      ## -> not tidy (due to combined info) but better readable than with dcast
      

## OUTPUT 

      ## write to file to working directory
      write.table(df_tidyDataset, file = "tidyDataset.txt",row.names = FALSE)

      ## display the tidy data set
      df_tidyDataset 


## Check

      ## table(xdata$subject,xdata$activity )
      ## df_tidyDataset[1:3]
   
      
