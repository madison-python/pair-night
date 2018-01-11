# ---- mythical-man-month
library(tidyverse)
divide_and_conquer <- data_frame(
  x = 1:9,
  y = 1/x
)

unpartitionable <- data_frame(
  x = 1:9,
  y = 1.5
)

complex <- data_frame(
  x = 1:9,
  y = c(9, 8, 7.2, 6.8, 7.8, 9.1, 11.1, 13, 16)
)

examples <- bind_rows(
  divide_and_conquer,
  unpartitionable,
  complex,
  .id = "type"
) %>%
  group_by(type) %>%
  mutate(
    y_norm = ifelse(type == "2", y, (y - mean(y))/sd(y)),
    type_label = factor(type, levels = c("1", "2", "3"), labels = c("Divide and Conquer", "One at a Time", "Complex"))
  )

ggplot(examples) +
  aes(x, y_norm) +
  geom_smooth(method = "loess", se = FALSE, span = 1) +
  facet_wrap("type_label") +
  scale_x_continuous("People", labels = NULL) +
  scale_y_continuous("Months", labels = NULL) +
  theme_bw(base_size = 20)
