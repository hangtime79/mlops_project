library(dataiku)

# Recipe inputs
hotel_1 <- dkuReadDataset("Hotel_1", samplingMethod="head", nbRows=100000)

# Compute recipe outputs from inputs
# TODO: Replace this part by your actual code that computes the output, as a R dataframe or data table
r_Out <- hotel_1 # For this sample code, simply copy input to output


# Recipe outputs
dkuWriteDataset(r_Out,"R_Out")
