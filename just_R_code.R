# bajar paquetes 

library(PASWR2)
library(dplyr)
library(ggplot2)
library(readr)

# acceder al data frame BATERY

data_batery <- BATTERY
head(data_batery, 100)

# ordenar el data frame en forma ascendente de la columna lifetime

data_arranged <- data_batery %>%
  arrange(lifetime)
data_arranged

# histograma de todas las filas de la variable lifetime y comprueba que efectivamente nos interesa separar los datos

hist(data_batery$lifetime,breaks=20,main = "Histograma del conjunto de datos" ,xlab = "Tiempo de vida de las baterías",ylab="Frecuencia",
     col = "orange", border = "white", bg = "white", freq = TRUE)
# Creación de nueva variable para datos de batería tipo A

datos_A <- data_batery %>%
  filter(facility == "A")
datos_A

# Creación de nueva variable para datos de batería tipo B

datos_B <- data_batery %>%
  filter(facility == "B")
datos_B

# histograma de cada uno de los tipos

hist_datos_A <- ggplot(data=datos_A, aes(x=lifetime)) +
  geom_histogram(color="black" , fill="blue") +
  labs(title="Histograma batería tipo A")
hist_datos_A

hist_datos_B <- ggplot(data=datos_B, aes(x=lifetime)) +
  geom_histogram(color="black" , fill="red") +
  labs(title="Histograma batería tipo B")
hist_datos_B

# test de Shapiro-Wilk para contrastar la normalidad de ambos data frames

normal_test_A <- shapiro.test(datos_A$lifetime)
normal_test_A

# The data is normal if the p-value is above 0.05. So we now know our variable is normally distributed.
normal_test_B <- shapiro.test(datos_B$lifetime)
normal_test_B

# estimación puntual de la media y la desviación típica de la población de cada tipo de baterías

mean_datos_A <- datos_A %>%
  summarize(mean_datos_A = mean(lifetime, na.rm = TRUE))
mean_datos_A
# Utilizamos la función summarize() de la libreria dplyr para poder combinar todos los valores de la columna "lifetime" para sacar la media con el comando mean().
# Añadimos na.rm = TRUE para eliminar todos los espacios sin datos y así evitar un resultado NA 

mean_datos_B <- datos_B %>%
  summarize(mean_datos_B = mean(lifetime, na.rm = TRUE))
mean_datos_B

sd_datos_A <- datos_A %>%
  summarize(sd_datos_A = sd(lifetime, na.rm =TRUE))
sd_datos_A

sd_datos_B <- datos_B %>%
  summarize(sd_datos_B = sd(lifetime, na.rm =TRUE))
sd_datos_B


# probabilidad de que una batería tomada al azar del tipo A dure más de 210 horas
# como queremos saber saber la probabilidad de una batería tomada al azar del tipo A dure más de 210 horas, nos interesa saber el upper tail de nuestra distribución normal

pnorm_d_A <- pnorm(210, mean=200.5087, sd=2.745777, lower.tail=FALSE)
pnorm_d_A

# probabilidad de que una batería tomada al azar del tipo B dure menos de 175 horas

pnorm_d_B <- pnorm(175, mean=179.6805, sd=2.084977, lower.tail=TRUE)
pnorm_d_B

# cuál es la duración máxima del 3% de las pilas del tipo B que duran menos

B_quantile <- datos_B %>%
  summarize(B_quanti = quantile(lifetime, 0.03))
B_quantile

# probabilidad de que en un lote de 10 baterías, no haya ninguna defectuosa
# dbinom(x= valor de la variable , size= , p) <- obtenemos la funcion densidad (continuas) o probabilidad (discretas)

dbinom(0, 10, 0.01238828)

# probabilidad de que la batería producida en quinto lugar sea la primera defectuosa
# que la primera defectuosa este entre las 5 primeras (4=q= number of failures in a sequence of Bernoulli trials before success occurs

dgeom(4, 0.01238828)

# probabilidad de que al tomar una muestra sin reposición de 5 baterías al menos una sea defectuosa
# (x= vector of quantiles, m= humber of WB in the urn, n= number of BB in the urn, k= number of balls drawn from the urn)

phyper(4, 17, 3, 5)

# probabilidad de que un día se produzcan más de 20 baterías defectuosas

ppois(20, 12, lower.tail=FALSE)

# probabilidad de que en un día no salga ninguna batería defectuosa

dpois(0, 12)
