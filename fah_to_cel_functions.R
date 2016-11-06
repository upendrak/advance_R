# Function to convert fah to kelvin
fah_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

# Function to convert Kelvin to Celsius
kel_to_cel <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

# Function to convert Fahreinhet to Celsius
fah_to_celsius <- function(temp) {
  temp_k <- fah_to_kelvin(temp)
  result <- kel_to_cel(temp_k)
  return(result)
}
