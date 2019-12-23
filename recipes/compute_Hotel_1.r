# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
library(dataiku)
library(caret)

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
target_col <- "Is_Canceled"
split_percentage <- .75
input_data <- "Hotel_Cancellation_Prepared"
seed_val <- 456789

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe inputs
data <- dkuReadDataset(input_data, samplingMethod="full")

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
data[[target_col]] <- as.factor(data[[target_col]])

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
set.seed(seed_val)

split <- createDataPartition(data[[target_col]], p=split_percentage, list=FALSE)

train <- data[split,]
test <- data[-split,]

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe outputs
dkuWriteDataset(train,"train")
dkuWriteDataset(test,"test")