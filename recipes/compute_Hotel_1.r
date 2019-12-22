# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
library(dataiku)
library(caret)

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe inputs
data <- dkuReadDataset("Hotel_Cancellation_filtered", samplingMethod="full", columns = c("Is_Canceled"))

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
split_percentage <- .75

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
split <- createDataPartition(data$Is_Canceled, p=split_percentage, list=FALSE)

split <- as.data.frame(split)

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe outputs
dkuWriteDataset(train,"train")
dkuWriteDataset(test,"test")