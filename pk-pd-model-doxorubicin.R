library(ggplot2)

# --- PK parameters ---
dose <- 50
Vd <- 25
k <- 0.15

C0 <- dose / Vd
time <- seq(0, 24, by = 0.1)
C <- C0 * exp(-k * time)

# --- PD parameters ---
Emax <- 100
EC50 <- 2

# Effect
E <- (Emax * C) / (EC50 + C)

# Data
data <- data.frame(time = time, concentration = C, effect = E)

# --- Plot concentration ---
p1 <- ggplot(data, aes(x = time, y = concentration)) +
  geom_line() +
  labs(title = "PK: Concentration-Time", x = "Time", y = "Concentration")

# --- Plot effect ---
p2 <- ggplot(data, aes(x = concentration, y = effect)) +
  geom_line(color = "red") +
  labs(title = "PD: Effect vs Concentration", x = "Concentration", y = "Effect")

# Save
ggsave("pk_plot.png", p1)
ggsave("pd_plot.png", p2)

EC50_values <- c(1, 2, 5)

for (ec in EC50_values) {
  effect <- (Emax * C) / (ec + C)
  data$effect <- effect
  
  p <- ggplot(data, aes(x = concentration, y = effect)) +
    geom_line() +
    labs(title = paste("EC50 =", ec))
  
  ggsave(paste0("pd_ec50_", ec, ".png"), p)
}
