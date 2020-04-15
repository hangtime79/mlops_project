library(dataiku)

# Recipe inputs
hotel_2_domestic_train <- dkuReadDataset("hotel_2_domestic_train", samplingMethod="all")

# Compute recipe outputs from inputs
# TODO: Replace this part by your actual code that computes the output, as a R dataframe or data table
r_Out <- hotel_2_domestic_train # For this sample code, simply copy input to output


# Recipe outputs
dkuWriteDataset(r_Out,"R_Out")
