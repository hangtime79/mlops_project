# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
library(dataiku)
library(caret)
library(httr)
library(jsonlite)

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
form_target_col <- "Is_Canceled"
form_target_col_is_factor <- TRUE
form_split_percentage <- .75
form_seed_val <- 456789
form_df <-"Hotel_1"
form_output_table_prefix <- "Hotel_1"
form_output_train_suffix <- "Train"
form_output_test_suffix <- "Test"

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
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

getSchemaUrl = dataiku:::dku_intercom__get_jek_or_backend_url("/datasets/get-schema/")
setSchemaUrl = dataiku:::dku_intercom__get_jek_or_backend_url("/datasets/set-schema/")

df_name <- dataiku:::dku__resolve_smart_name(df)
output_train_name <- dataiku:::dku__resolve_smart_name(output_train)
output_test_name <- dataiku:::dku__resolve_smart_name(output_test)

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
resp <- POST(getSchemaUrl,body = list(fullDatasetName=df_name),
              encode="form", dataiku:::dku__get_auth_headers())
df_schema <- content(resp)

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

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
jsonData = RJSONIO:::toJSON(df_schema)

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Recipe outputs
dkuWriteDataset(hotel_1_train,"Hotel_1_Train")
dkuWriteDataset(hotel_1_test,"Hotel_1_Test")

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# resp = POST(setSchemaUrl, body = list(fullDatasetName = output_train_name,
#         schemaData = jsonData), encode = "form", dataiku:::dku__get_auth_headers())
#     if (resp$status != 200) {
#         parsed = content(resp)
#         stop(paste("Failed to write dataset:", parsed$detailedMessage))
#     }
# resp = POST(setSchemaUrl, body = list(fullDatasetName = output_test_name,
#         schemaData = jsonData), encode = "form", dataiku:::dku__get_auth_headers())
#     if (resp$status != 200) {
#         parsed = content(resp)
#         stop(paste("Failed to write dataset:", parsed$detailedMessage))
#     }