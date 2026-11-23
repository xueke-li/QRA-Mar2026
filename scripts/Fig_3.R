library(ggplot2)

date_ticks <- seq(as.Date("2026-03-01"), as.Date("2026-03-31"), by = "5 days")
lat_ticks <- seq(30, 70, by = 10)

x_limits <- c(-20, 20)
y_limits <- c(0, 13)
contour_levels <- seq(0.004, 0.040, by = 0.004)

# ============================================================
# Wave 4: waveguides
# ============================================================
tp_wave4 <- read.csv("TP_wave4_March_2026.csv", colClasses = c(Date = "Date"))
wave4_grid <- read.csv("l_square_wave4_March_2026.csv", colClasses = c(Date = "Date"))

# Put TP1 and TP2 into one point layer. An empty CSV still gives a tile plot.
tp_points_wave4 <- data.frame(Date = rep(tp_wave4$Date, times = 2), Latitude = c(tp_wave4$TP1, tp_wave4$TP2))

p_wave4 <- ggplot(wave4_grid, aes(x = Date, y = Latitude)) + geom_tile(aes(fill = l_square)) + geom_point(data = tp_points_wave4, color = "black", size = 2, na.rm = TRUE) +
  scale_fill_gradient2(low = "#2166AC", mid = "white", high = "#B2182B", midpoint = 0, limits = c(-1e-12, 1e-12), oob = scales::squish, name = expression("Sq. merid. Waveno. (" * l^2 * ")")) +
  guides(fill = guide_colorbar(title.position = "left", title.theme = element_text(angle = 90, size = 16, vjust = 0.5, hjust = 0.5), barheight = grid::unit(0.78, "npc"), barwidth = grid::unit(0.35, "cm"))) +
  scale_x_date(breaks = date_ticks, date_labels = "%b %d", expand = c(0, 0)) +
  scale_y_continuous(breaks = lat_ticks, labels = paste0(lat_ticks, "°N"), expand = c(0, 0)) +
  labs(title = "Wave 4", x = "Date", y = "Latitude") +
  theme_classic(base_size = 18) + theme(
    plot.title = element_text(size = 22, hjust = 0.5),
    axis.title = element_text(size = 19),
    axis.text = element_text(size = 16, color = "black"),
    legend.title = element_text(size = 16),
    legend.text = element_text(size = 15),
    legend.position = "right")

print(p_wave4)

ggsave("Fig_3a_1.pdf", plot = p_wave4, device = "pdf", width = 20, height = 12, units = "cm", bg = "white")

# ============================================================
# Wave 5: waveguides
# ============================================================
tp_wave5 <- read.csv("TP_wave5_March_2026.csv", colClasses = c(Date = "Date"))
wave5_grid <- read.csv("l_square_wave5_March_2026.csv", colClasses = c(Date = "Date"))

# Put TP1 and TP2 into one point layer. An empty CSV still gives a tile plot.
tp_points_wave5 <- data.frame(Date = rep(tp_wave5$Date, times = 2), Latitude = c(tp_wave5$TP1, tp_wave5$TP2))

p_wave5 <- ggplot(wave5_grid, aes(x = Date, y = Latitude)) + geom_tile(aes(fill = l_square)) + geom_point(data = tp_points_wave5, color = "black", size = 2, na.rm = TRUE) +
  scale_fill_gradient2(low = "#2166AC", mid = "white", high = "#B2182B", midpoint = 0, limits = c(-1e-12, 1e-12), oob = scales::squish, name = expression("Sq. merid. Waveno. (" * l^2 * ")")) +
  guides(fill = guide_colorbar(title.position = "left", title.theme = element_text(angle = 90, size = 16, vjust = 0.5, hjust = 0.5), barheight = grid::unit(0.78, "npc"), barwidth = grid::unit(0.35, "cm"))) +
  scale_x_date(breaks = date_ticks, date_labels = "%b %d", expand = c(0, 0)) +
  scale_y_continuous(breaks = lat_ticks, labels = paste0(lat_ticks, "°N"), expand = c(0, 0)) +
  labs(title = "Wave 5", x = "Date", y = "Latitude") +
  theme_classic(base_size = 18) + theme(
    plot.title = element_text(size = 22, hjust = 0.5),
    axis.title = element_text(size = 19),
    axis.text = element_text(size = 16, color = "black"),
    legend.title = element_text(size = 16),
    legend.text = element_text(size = 15),
    legend.position = "right")

print(p_wave5)

ggsave("Fig_3a_2.pdf", plot = p_wave5, device = "pdf", width = 20, height = 12, units = "cm", bg = "white")

# ============================================================
# Wave 4: Plot phase speed versus wave amplitude
# ============================================================
wave4_data <- read.csv("wave4_March_1979_2026.csv")

# Fit the 1979–2025 and 2026 densities separately on the same grid.
speed_amplitude_wave4 <- subset(wave4_data, is.finite(phase_speed) & is.finite(amplitude))
historical_wave4 <- subset(speed_amplitude_wave4, Year >= 1979 & Year <= 2025)
target_wave4 <- subset(speed_amplitude_wave4, Year == 2026)

kde_grid_wave4 <- function(data) {
  fit <- MASS::kde2d(x = data$phase_speed, y = data$amplitude, n = 200, lims = c(-20, 20, 0, 13))
  grid <- expand.grid(phase_speed = fit$x, amplitude = fit$y)
  grid$density <- as.vector(fit$z)
  grid}

historical_wave4_kde <- kde_grid_wave4(historical_wave4)
target_wave4_kde <- kde_grid_wave4(target_wave4)

p_wave4 <- ggplot() +
  geom_raster(data = target_wave4_kde, aes(phase_speed, amplitude, fill = density), interpolate = TRUE) +
  geom_contour(data = historical_wave4_kde, aes(phase_speed, amplitude, z = density), breaks = contour_levels, color = "black", linewidth = 0.7) +
  metR::geom_text_contour(data = historical_wave4_kde, aes(phase_speed, amplitude, z = density), breaks = contour_levels, stroke = 0.15, size = 4.5, color = "black", label.placer = metR::label_placer_flattest()) +
  scale_fill_gradientn(colors = c("white", RColorBrewer::brewer.pal(9, "Reds")), limits = c(0, 0.02), oob = scales::squish, name = "Density") +
  geom_vline(xintercept = 0, color = "black", linewidth = 0.8) +
  coord_cartesian(xlim = x_limits, ylim = y_limits) +
  labs(title = "Wave 4", x = "Phase speed (m/s)", y = "Wave amplitude (m/s)") +
  theme_classic(base_size = 18) +
  theme(plot.title = element_text(size = 22, hjust = 0.5), axis.title = element_text(size = 19), axis.text = element_text(size = 16, color = "black"), legend.title = element_text(size = 16), legend.text = element_text(size = 15))
print(p_wave4)

# Save plot
ggsave(filename = "Fig_3b_1.pdf", plot = p_wave4, device = "pdf", width = 18, height = 12, units = "cm", bg = "white")

# ============================================================
# Wave 5: Plot phase speed versus wave amplitude
# ============================================================
wave5_data <- read.csv("wave5_March_1979_2026.csv")

# Fit the 1979–2025 and 2026 densities separately on the same grid.
speed_amplitude_wave5 <- subset(wave5_data, is.finite(phase_speed) & is.finite(amplitude))
historical_wave5 <- subset(speed_amplitude_wave5, Year >= 1979 & Year <= 2025)
target_wave5 <- subset(speed_amplitude_wave5, Year == 2026)

kde_grid_wave5 <- function(data) {
  fit <- MASS::kde2d(x = data$phase_speed, y = data$amplitude, n = 200, lims = c(-20, 20, 0, 13))
  grid <- expand.grid(phase_speed = fit$x, amplitude = fit$y)
  grid$density <- as.vector(fit$z)
  grid}

historical_wave5_kde <- kde_grid_wave5(historical_wave5)
target_wave5_kde <- kde_grid_wave5(target_wave5)

p_wave5 <- ggplot() +
  geom_raster(data = target_wave5_kde, aes(phase_speed, amplitude, fill = density), interpolate = TRUE) +
  geom_contour(data = historical_wave5_kde, aes(phase_speed, amplitude, z = density), breaks = contour_levels, color = "black", linewidth = 0.7) +
  metR::geom_text_contour(data = historical_wave5_kde, aes(phase_speed, amplitude, z = density), breaks = contour_levels, stroke = 0.15, size = 4.5, color = "black", label.placer = metR::label_placer_flattest()) +
  scale_fill_gradientn(colors = c("white", RColorBrewer::brewer.pal(9, "Reds")), limits = c(0, 0.02), oob = scales::squish, name = "Density") +
  geom_vline(xintercept = 0, color = "black", linewidth = 0.8) +
  coord_cartesian(xlim = x_limits, ylim = y_limits) +
  labs(title = "Wave 5", x = "Phase speed (m/s)", y = "Wave amplitude (m/s)") +
  theme_classic(base_size = 18) +
  theme(plot.title = element_text(size = 22, hjust = 0.5), axis.title = element_text(size = 19), axis.text = element_text(size = 16, color = "black"), legend.title = element_text(size = 16), legend.text = element_text(size = 15))
print(p_wave5)

# Save plot
ggsave(filename = "Fig_3b_2.pdf", plot = p_wave5, device = "pdf", width = 18, height = 12, units = "cm", bg = "white")

