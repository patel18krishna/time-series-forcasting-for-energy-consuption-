library(forecast)
library(xgboost)

# Load your data and create a time series object
setwd("D:/")
data <- read.csv("Tetuan City power consumption.csv")
timeseriesforecasting <- function(r_data_to_pass) {
    # Extract individual variables from the list # nolint
    # Access the data passed from Python
    Temperature <- as.numeric(r_data_to_pass$Temperature) # nolint
    Humidity <- as.numeric(r_data_to_pass$Humidity) # nolint
    Wind.Speed <- as.numeric(r_data_to_pass$Wind.Speed) # nolint
    general.diffuse.flows <- as.numeric(r_data_to_pass$general.diffuse.flows) # nolint
    diffuse.flows <- as.numeric(r_data_to_pass$diffuse.flows) # nolint

    data$DateTime <- as.POSIXct(data$DateTime, format = "%m-%d-%Y %H:%M") # nolint

    # Split the data into training and testing sets # nolint
    train_size <- 0.8 * nrow(data)
    train_data <- data[1:train_size, ]
    #test_data <- data[(train_size + 1):nrow(data), ] # nolint

    xgb_model <- xgboost(data = as.matrix(train_data[, c("Temperature", "Humidity", "Wind.Speed", "general.diffuse.flows", "diffuse.flows")]), # nolint
                     label = train_data$Zone.1.Power.Consumption, nrounds = 100, objective = "reg:squarederror") # nolint

    # Perform predictions on the passed data # nolint
    test_data_for_prediction <- data.frame(
        Temperature = Temperature, # nolint
        Humidity = Humidity,
        Wind.Speed = Wind.Speed,
        general.diffuse.flows = general.diffuse.flows,
        diffuse.flows = diffuse.flows
    ) # nolint

    test_predictions <- predict(xgb_model, newdata = as.matrix(test_data_for_prediction)) # nolint
    result <- test_predictions
    return(result)
}
