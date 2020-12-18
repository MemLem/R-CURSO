#######################################################################
################### PRÁCTICA 9. GRÁFICAS CON GGPLOT2 ##################
#######################################################################

library(ggplot2)
library(dplyr)
library(gganimate) # permita animar un gráfico 
library(gifski)  # permite guardar un gráfico en un gif

# Cargar Dataframe

covid19 <- read.csv("https://covid19.who.int/WHO-COVID-19-global-data.csv")


# Renombrar columnas

colnames(covid19) <- c("Fecha_reporte", 
                       "Código", 
                       "País", 
                       "Región", 
                       "Nuevos_casos", 
                       "Casos_acumulados", 
                       "Nuevas_defunciones", 
                       "Defunciones_acumuladas")

  
# ¿Estructura del DF?

str(covid19)


# ¿Cuàles son las regiones de la OMS?

unique(covid19$Región)


# Se crea un factor para poder graficar las regiones (categorías)

covid19$Región <- factor(covid19$Región,
                         levels = c("EMRO",  "EURO",  "AFRO",  "WPRO",  "AMRO",  "SEARO", "Other"),
                         labels = c("Mediterráneo Oriental", "Europa", "África", "Pacífico Occidental", "Américas", "Asia Sur-Oriental", "Otros"))


# Se crea un vector con los colores a usar en el gráfico:

colores <- c("#505160", "#68829E", "#AEBD38", "598234", "#1995AD", "#D9B44A", "#C99E10")


# Se gráfica el factor de regiones con sus respectivas frecuencias

plot(covid19$Región,
     main = "Casos totales de COVID-19 por región de la OMS",
     xlab = "Regiones de la OMS",
     ylab = "Frecuencia",
     col = colores)

# Gráfico de boxplot:

boxplot(covid19$Nuevos_casos ~ covid19$Región)  # no es idonea xq hay mucha disperción de los datos en este caso



#######################################################################

# Se filtra el Data frame en función de:

covid19_filtrado <- covid19 %>% 
  select(Fecha_reporte, Región, Nuevos_casos) %>% 
  filter(Fecha_reporte == "2020-08-29") %>% 
  arrange(Nuevos_casos)


covid19_filtrado <- covid19 %>% 
  group_by(Fecha_reporte, Región) %>% 
  summarise(Casos_acumulados = sum(Nuevos_casos))


covid19_filtrado$Fecha_reporte <- as.Date(covid19_filtrado$Fecha_reporte, format = "%Y-%m-%d")


class(covid19_filtrado$Fecha_reporte)

class(covid19_filtrado$Región)

class(covid19_filtrado$Casos_acumulados)


#######################################################################

# ggplot(data, aes(x = variable explicativa, y = var. dependiente, fill =))   aesthetic specifications

# Diagrama de cajas:

options(scipen = 100000000) # función para prevenir notación científica:

ggplot(covid19_filtrado, aes(x = Fecha_reporte, 
                             y = Casos_acumulados,
                             fill = Región)) +
                              geom_boxplot() + 
                              ggtitle("Boxplot de casos acumulaods en función de la fecha de reporte por región OMS") +
                              labs( x = "Fecha de reporte", y = "Casos acumulados")


# Diagrama de Líneas

ggplot(covid19_filtrado, aes(x = Fecha_reporte, 
                             y = Casos_acumulados,
                             col = Región)) + 
                              geom_line() +
                             ggtitle("Densidad de casos acumulaods en función de la fecha de reporte por región OMS") +
                              labs( x = "Fecha de reporte", 
                                    y = "Casos acumulados")
# Diagrama de puntos 

ggplot(covid19_filtrado, aes(x = Fecha_reporte, 
                             y = Casos_acumulados,
                             col = Región)) + 
                              geom_point() +
                              ggtitle("Dispersión de los casos acumulaods en función de la fecha de reporte por región OMS") +
                              labs( x = "Fecha de reporte", 
                                    y = "Casos acumulados")

# Cambiar fuente 

library(extrafont)


#######

ggplot(covid19_filtrado, aes(x = Fecha_reporte, 
                             y = Casos_acumulados,
                             col = Región)) + 
                              geom_line() + 
                              geom_point() + 
                              theme_light() +
                              ggtitle("Distribución de los casos acumulados en función de la fecha de reporte por región OMS") +
                              labs( x = "Fecha de reporte", 
                                    y = "Casos acumulados") +
                              theme_bw() + 
                              theme(text = element_text(family = "Garamond", size = 12))


## transition_reveal(Fecha_reporte) . es un gif de transición de la paquetería gganimate y gisfki



#######################################################################
#######################################################################
#######################################################################