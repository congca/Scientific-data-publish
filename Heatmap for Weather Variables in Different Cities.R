# 加载必要的包
library(ggplot2)
library(tidyr)
library(dplyr)

# 创建数据框
data <- data.frame(
  City = c("Oslo", "Bergen", "Trondheim", "Tromsø", "Stavanger", "Fredrikstad"),
  Fairweather = c(1, 1, 1, 1, 0, 0),
  Mostly_Fair = c(1, 1, 1, 0, 0, 0),
  Overcast = c(1, 1, 1, 1, 0, 0),
  Max_Cloud = c(1, 1, 1, 1, 0, 0),
  Mean_Cloud = c(1, 1, 1, 1, 0, 0),
  Min_Cloud = c(1, 1, 1, 1, 0, 0),
  Min_Temp = c(1, 1, 1, 1, 0, 0),
  Mean_Temp_K = c(1, 1, 1, 1, 0, 0),
  Mean_Dew_Pt = c(1, 1, 1, 1, 0, 0),
  Mean_Temp = c(1, 1, 1, 1, 0, 0),
  Homogenized_Temp = c(0, 1, 0, 1, 0, 0),
  HDD_17_C = c(0, 1, 1, 1, 0, 0),
  Heat_Sum_0_C = c(0, 1, 1, 1, 1, 1),
  Heat_Sum_5_C = c(0, 1, 1, 1, 1, 1),
  Max_Temp = c(0, 1, 1, 1, 1, 1),
  Max_Press_SL = c(0, 1, 1, 1, 1, 1),
  Max_Press_ST = c(0, 1, 1, 1, 1, 1),
  Avg_Press_SL = c(0, 1, 1, 1, 1, 1),
  Avg_Press_ST = c(0, 1, 1, 1, 1, 1),
  Vapor_Press = c(0, 1, 1, 1, 1, 1),
  Min_Press_SL = c(0, 1, 1, 1, 1, 1),
  Min_Press_ST = c(0, 1, 1, 1, 1, 1),
  Max_Mean_Wind = c(0, 1, 1, 1, 1, 1),
  Max_Mean_Wind_Obs = c(0, 1, 1, 1, 1, 1),
  Max_Wind_Gust = c(0, 1, 1, 1, 1, 1),
  Mean_Max_Wind = c(0, 1, 1, 1, 1, 1),
  Avg_Mean_Wind_Obs = c(0, 1, 1, 1, 1, 1),
  Mean_Wind_Gust = c(0, 1, 1, 1, 1, 1),
  Low_Max_Wind = c(0, 1, 1, 1, 1, 1),
  Min_Mean_Wind_Obs = c(0, 1, 1, 1, 1, 1),
  Low_Wind_Gust = c(0, 1, 1, 1, 1, 1),
  Max_Humidity = c(0, 1, 1, 1, 1, 1),
  Mean_Humidity = c(0, 1, 1, 1, 1, 1),
  Min_Humidity = c(0, 1, 1, 1, 1, 1),
  Mixing_Ratio = c(0, 1, 1, 1, 1, 1),
  Spec_Humidity = c(0, 1, 1, 1, 1, 1),
  Best_Visibility = c(0, 1, 1, 1, 1, 0),
  Lowest_Visibility = c(0, 1, 1, 1, 1, 0),
  Snow_Cover = c(0, 0, 0, 1, 0, 0),
  Snow_Depth = c(0, 0, 0, 1, 0, 0),
  Precip_Type_Visual = c(0, 1, 0, 1, 0, 0),
  Precip_Type = c(0, 1, 1, 1, 0, 1),
  Precip_Type_Auto_WMO = c(0, 0, 0, 1, 0, 0),
  Precip_Type_Visual_WMO = c(0, 1, 0, 1, 0, 0),
  Precip_24h = c(0, 1, 1, 1, 0, 1),
  Ground_State_Old_Code = c(0, 0, 0, 0, 0, 0),
  Ground_Cond = c(0, 0, 0, 1, 0, 0),
  Sunshine_24h = c(0, 0, 0, 1, 0, 0)
)

# 转换数据格式
data_long <- data %>%
  pivot_longer(cols = -City, names_to = "Variable", values_to = "Value")


png('Weather Variables in Different Cities.png',
    height = 45,
    width = 45,
    units = 'cm',
    res = 300)
plot.new()


# 绘制热图
ggplot(data_long, aes(x = City, y = Variable, fill = as.factor(Value))) +
  geom_tile(color = "white") +
  scale_fill_manual(values = c("0" = "white", "1" = "blue"), name = "Presence", labels = c("No", "Yes")) +
  labs(title = "Weather Variables in Different Cities", x = "City", y = "Variable") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

dev.off()
