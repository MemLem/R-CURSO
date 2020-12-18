#######################################################################
#################### PRÁCTICA 7. LIMPIEZA DE DATOS ####################
#######################################################################



covid19 <- read.csv("https://covid19.who.int/WHO-COVID-19-global-data.csv")

colnames(covid19) <- c("Fecha_de_reporte", 
                      "Codigo_pais", 
                      "Paises", 
                      "Region", 
                      "Casos_nuevos",
                      "Casos_acumulados",
                      "defunciones_nuevas",
                      "defunciones_acumuladas")


covid19$Fecha_de_reporte <- as.Date(covid19$Fecha_de_reporte, format = "%Y-%m-%d")



############## Funciones para limpiar una Bases de Datos ##############

# Se carga la paquetería dplyr del universo de Tidyverse

library(dplyr)


# La función select() selecciona únicamente las variables que le indiquemos en un DataFrame:

covid19_filtrados <- select(covid19, Fecha_de_reporte, Paises, Casos_acumulados)


# La función filter() filtra las observaciones de determinadas variables teniendo como base sus valores:

covid19_filtrados <- filter(covid19_filtrados, Fecha_de_reporte >"2020-11-05" & Fecha_de_reporte < "2020-12-05")


# La función rename() renombra a las variables:

covid19_filtrados <- rename(covid19_filtrados, Total_casos = Casos_acumulados)


# La función mutate() agrega una nueva variable en función de variables previamente existentes:

covid19_filtrados <- mutate(covid19_filtrados,
                            Acumulados_x_millon = Total_casos * 1000000/5)


# La función arrange() cambia el orden de las filas. En eset caso cambia la posición de los países en función de los casos acumulados de Covid-19 de mayor a menor. 

covid19_filtrados <- arrange(covid19_filtrados, desc(Total_casos))


# Las funciones anteriores se puede combinar en un solo renglón con la pipe %>% 

covid19_filtrados_pipe <- covid19 %>%  
  select(Fecha_de_reporte, Paises, Casos_acumulados) %>%  
  filter(Fecha_de_reporte >"2020-11-05" & Fecha_de_reporte < "2020-12-05") %>%  
  rename(Total_casos = Casos_acumulados) %>% 
  mutate(Acumulados_x_millon = Total_casos * 1000000/5) %>% 
  arrange(desc(Total_casos))



# La funciñon tolower() cambia a minúsculas los valores de una variable.

covid19_filtrados$Paises <- tolower(covid19_filtrados$Paises)


# La función toupper() cambia a MAYúSCULAS los valores de una variable. 

covid19_filtrados$Paises <- toupper(covid19_filtrados$Paises)




#######################################################################
#######################################################################
#######################################################################