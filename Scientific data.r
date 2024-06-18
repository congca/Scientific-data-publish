library(ggplot2)
library(reshape2)

# Define the data with start and end dates
data <- data.frame(
  City = c('Oslo', 'Bergen', 'Bergen', 'Bergen', 'Bergen', 'Bergen', 'Bergen', 'Bergen',
           'Stavanger', 'Stavanger', 'Stavanger', 'Trondheim', 'Trondheim'),
  Pollutant = c('PM2.5', 'PM10', 'PM10', 'PM10', 'PM10', 'NOx', 'PM2.5', 'Ozone',
                'NOx', 'PM10', 'PM2.5', 'NOx', 'PM10'),
  Start = c('2000-01-01', '2000-01-01', '2003-01-01', '2004-09-06', '2005-08-17', '2003-01-01', '2007-08-23', '2004-06-09',
            '2000-01-01', '2000-01-01', '2005-03-01', '2003-05-22', '2000-01-03'),
  End = c('2018-12-31', '2000-03-31', '2004-07-19', '2005-05-31', '2006-06-06', '2018-01-04', '2018-01-04', '2018-01-04',
          '2018-08-06', '2018-12-30', '2018-12-30', '2004-12-03', '2004-12-03')
)

# Convert dates to proper date format
data$Start <- as.Date(data$Start)
data$End <- as.Date(data$End)

# Create complete list of years
years <- 2000:2018
cities <- unique(data$City)
pollutants <- unique(data$Pollutant)

# Initialize heatmap data frame
heatmap_data <- expand.grid(Pollutant = pollutants, City = cities, Year = years)
heatmap_data$Availability <- 0

# Mark Oslo's data as complete for PM10, PM2.5, NOx, and Ozone
complete_pollutants <- c("PM10", "PM2.5", "NOx", "Ozone")
for (pollutant in complete_pollutants) {
  heatmap_data$Availability[heatmap_data$City == "Oslo" & heatmap_data$Pollutant == pollutant] <- 1
}

# Fill in heatmap data based on availability for other cities
for (i in 1:nrow(data)) {
  city <- data$City[i]
  pollutant <- data$Pollutant[i]
  start_year <- as.numeric(format(data$Start[i], "%Y"))
  end_year <- as.numeric(format(data$End[i], "%Y"))
  
  if (city != "Oslo" && !grepl("PM10 and PM2.5", pollutant)) {
    heatmap_data$Availability[heatmap_data$City == city &
                                heatmap_data$Pollutant == pollutant &
                                heatmap_data$Year >= start_year &
                                heatmap_data$Year <= end_year] <- 1
  }
}

# Define custom color palette (change colors as desired)
my_palette <- c("white", "steelblue")

png('Air Quality Data Availability by City and Pollutant.png',
    height = 45,
    width = 45,
    units = 'cm',
    res = 300)

plot.new()
# Plot the heatmap with custom colors
ggplot(heatmap_data, aes(x = Year, y = Pollutant, fill = factor(Availability))) +
  geom_tile(color = "white") +
  facet_wrap(~City, ncol = 2) +
  scale_fill_manual(values = my_palette, name = "Data Availability", labels = c("No Data", "Available")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(title = "Air Quality Data Availability by City and Pollutant", x = "Year", y = "Pollutant")


dev.off()

