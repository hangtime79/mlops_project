# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
library(dataiku)
library(caret)
library(compare)

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
target_col <- "Is_Canceled"
split_percentage <- .75
input_data <- "Hotel_Cancellation_filtered"

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe inputs
data <- dkuReadDataset(input_data, samplingMethod="full")

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
data[[target_col]] <- as.factor(data[[target_col]])

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
split <- createDataPartition(data[[target_col]], p=split_percentage, list=FALSE)

train <- data[split,]
test <- data[-split,]

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
compare(equal = )

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe outputs
dkuWriteDataset(train,"train")
dkuWriteDataset(test,"test")