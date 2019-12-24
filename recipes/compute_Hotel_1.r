# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
library(dataiku)
library(caret)

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
form_target_col <- "Is_Canceled"
form_target_col_is_factor <- TRUE
form_split_percentage <- .75
form_seed_val <- 456789
form_df <-"Hotel_1"
form_output_table_prefix <- "Hotel_1"
form_output_train_suffix <- "Train"
form_output_test_suffix <- "Test"

output_table_prefix <- form_output_table_prefix
output_train_suffix <- form_output_train_suffix
output_test_suffix <- form_output_test_suffix
target_col <- form_target_col
target_col_is_factor <- form_target_col_is_factor
split_percentage <- form_split_percentage
seed_val <- form_seed_val
df <- form_df

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE


output_train <- paste(output_table_prefix, "_", output_train_suffix, sep = "")
output_test <- paste(output_table_prefix, "_", output_test_suffix, sep = "")

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe inputs
data <- dkuReadDataset(df, samplingMethod="full")

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