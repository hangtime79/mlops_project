library(dataiku)

# Recipe inputs
hotel_1 <- dkuReadDataset("Hotel_1", samplingMethod="full")

# Compute recipe outputs from inputs
# TODO: Replace this part by your actual code that computes the output, as a R dataframe or data table
hotel_R <- hotel_1 # For this sample code, simply copy input to output


# Recipe outputs
dkuWriteDataset(hotel_R,"Hotel_R")
