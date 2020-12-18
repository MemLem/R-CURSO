#######################################################################
################### PRÁCTICA 8. FACTORES Y GRÁFICAS ###################
#######################################################################

bikes <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/bikes.csv")

str(bikes)
summary(bikes)

bikes$season
class(bikes$weathersit)

unique(bikes$season)

### CREAR FACTORES PARA GRÁFICAR VARIABLES CUALITATIVAS

# Se sustituye los viejos valores de la var. por los nuevos valores creados con el factor.

# factor() se utiliza para crear un vector como factor, es decir, un objeto que guarda las "categorías/términos" (labels) de otro objecto/dataset previamente creado en correspondencias con sus niveles/clasificaciones (levels)

bikes$season <- factor(bikes$season, 
                       levels = c(1:4), 
                       labels = c("Invierno", 
                                  "Primavera", 
                                  "Verano", 
                                  "Otoño"))


bikes$workingday <- factor(bikes$workingday, 
                           levels = c(0,1),
                           labels = c("No_Laboral", "Laboral"))


bikes$weathersit <- factor(bikes$weathersit, 
                           levels = c(1, 2, 3),
                           labels = c("Despejado", "Nublado", "Lluvioso"))


#######################################################################

# se puede crear un vector/palte de colores con base en su codigo hexadecimal

colores <- c("#021C1E", "#004445", "#2C7873", "#6FB98F")

## GRÁFICOS DE CATEGORÍAS

# plot(data, main = " ", xlab = label de eje x, ylab = label del eje y, col = "nombre" o "#código hexadecimal")

plot(bikes$season, 
     main = "Estaciones del año",
     xlab = "Temporadas", 
     ylab = "Frecuencias", 
     col = colores)


plot(bikes$workingday,
     main = "Días laborales del año",
     xlab = "Temporadas", 
     ylab = "Frecuencias", 
     col = colores)


plot(bikes$weathersit, 
     main = "Climas del año",
     xlab = "Climas", 
     ylab = "Frecuencias", 
     col = colores)


# Funciones para crear subconjuntos de datos:

# subset(data, subconjuto del data a guardar que cumple dteemrinada condiicón) regresa un subconjutno de datos de un objeto (vector, matriz o dataset) que cumplan una determinada condición.

invierno <- subset(bikes, season == "Invierno")$cnt

primavera <- subset(bikes, season == "Primavera")$cnt

verano <- subset(bikes, season == "Verano")$cnt

otoño <- subset(bikes, season == "Otoño")$cnt


par(mfrow = c(2,2))  # mfrow = es un argumento para presentar las graficas en un arreglo matricial, en este caso serà de dos renglones y dos columnas, perfecto para mostrar 4 graficas en total.

hist(invierno,
     main = "Renta de Bicicletas en Invierno",
     xlab = "Invierno", 
     ylab = "Frecuencia",
     col = "#7F9183", 
     prob = T)
     lines(density(invierno)) # crea una linea de densidad en el gráfico
     abline(v = mean(invierno), col = "#124559") # abline crea una linea recta en el grafico segun la posiciñon en el eje x para q sea vertical, o horizontal en el eje y.
     abline(v = median(invierno), col = "#576675")
     
# Hisdtograma cualitativas

hist(primavera,
        main = "Renta de Bicicletas en Primavera",
        xlab = "Pimavera", 
        ylab = "Frecuencia",
        col = "#004445", 
        prob = T)
        lines(density(primavera))
        abline(v = mean(primavera), col = "#124559")
        abline(v = median(primavera), col = "#576675")

hist(verano,
        main = "Renta de Bicicletas en Verano",
        xlab = "verano", 
        ylab = "Frecuencia",
        col = "#2C7873", 
        prob = T)
        lines(density(verano))
        abline(v = mean(verano), col = "#124559")
        abline(v = median(verano), col = "#576675")


hist(otoño,
        main = "Renta de Bicicletas en Otoño",
        xlab = "Otoño", 
        ylab = "Frecuencia",
        col = "#6FB98F", 
        prob = T)
        lines(density(otoño))
        abline(v = mean(otoño), col = "#124559")
        abline(v = median(otoño), col = "#576675")
