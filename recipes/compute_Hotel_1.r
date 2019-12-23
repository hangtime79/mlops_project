# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
library(dataiku)
library(caret)

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
target_col <- "Is_Canceled"
target_col_is_factor <- TRUE
split_percentage <- .75
seed_val <- 456789
input_data <- "Hotel_1"

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
output_table_prefix <- "Hotel_1"
output_train_suffix <- "Train"
output_test_suffix <- "Test"

output_train <- paste(output_table_prefix, "_", output_train_suffix, sep = "")
output_test <- paste(output_table_prefix, "_", output_test_suffix, sep = "")

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe inputs
data <- dkuReadDataset(input_data, samplingMethod="full")

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
if (target_col_is_factor) {

    data[[target_col]] <- as.factor(data[[target_col]])

}

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
set.seed(seed_val)

split <- createDataPartition(data[[target_col]], p=split_percentage, list=FALSE)

train <- data[split,]
test <- data[-split,]

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe outputs
dkuWriteDataset(train,output_train)
dkuWriteDataset(test,output_test)