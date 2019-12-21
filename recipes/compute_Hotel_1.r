library(dataiku)

# Recipe inputs
hotel_Cancellation_filtered <- dkuReadDataset("Hotel_Cancellation_filtered", samplingMethod="full", nbRows=100000)

# Compute recipe outputs from inputs
# TODO: Replace this part by your actual code that computes the output, as a R dataframe or data table
hotel_1 <- hotel_Cancellation_filtered # For this sample code, simply copy input to output


# Recipe outputs
dkuWriteDataset(hotel_1,"Hotel_1")
