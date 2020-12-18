#######################################################################
################# PRÁCTICA 6. BASES DE DATOS COVID-19 #################
#######################################################################



################### Cargar el DataFrame de COVID-19 ###################

paises <- read.csv("https://covid19.who.int/WHO-COVID-19-global-data.csv")



############## ¿Cuál es la estructura de nuestros datos? ##############


# La función str() sirve para mostrar la estructura interna (variables y observaciones) del DataFrame u otro objeto. 

str(paises)


# La función summary() sirve para producir el resumen de los datos (obesrvaciones) contenidos en cada variable de una list() o DataFrame. Por ejemplo, su clase, lenght o valores estadisticos. 

summary(paises)


# summary() de variables cuantitativas proporciona el min(), Q1, Q2 (Mediana), Q3, max() y la media (mean). 

summary(paises$Cumulative_cases)


# La función colnames() permite renombrar a las columnas (variables) de un DataFrame:

colnames(paises) <- c("Fecha_de_reporte", 
                      "Codigo_pais", 
                      "Paises", 
                      "Region", 
                      "Casos_nuevos",
                      "Casos_acumulados",
                      "defunciones_nuevas",
                      "defunciones_acumuladas")

# La función rownames() establece los nombres de las filas.




################### Filtrado para conjuntos de datos ##################


# Guardar un conjunto de datos en un objeto. La función unique() devuelve los valores de un objeto, pero con los elementos o filas duplicadas ya eliminadas. 

total_paises <- length(unique(paises$Country))

print(paste("Tenemos en total", total_paises, "paises"))


# La función split() divide los datos de una variables de un DataFrame en grupos definidos.

paises_filtrados <- split(paises, paises$Paises)

fechas_filtradas <- split(paises, paises$Fecha_de_reporte)

regiones_filtradas <- split(paises, paises$Region)




################### DESINTEGRAR EL DATASET ORIGINAL ###################


##lapply se aplica a una función para cada elemento de la lista o vector para enviar cada una de las listas a un archivo de escritura DataFrame

lapply(names(paises_filtrados), 
       function(x) {write.csv(paises_filtrados[[x]], paste0("Bases/Paises/",x,".csv"),
                              row.names = FALSE)})

lapply(names(fechas_filtradas), 
       function(x) {write.csv(fechas_filtradas[[x]], paste0("Bases/Fechas/",x,".csv"),
                              row.names = FALSE)})

lapply(names(regiones_filtradas), 
       function(x) {write.csv(regiones_filtradas[[x]], paste0("Bases/Regiones/",x,".csv"),
                              row.names = FALSE)})




######################### INTEGRAR EL DATASET #########################


# La función list.files() produce un vector de caracteres para nombrar archivos en un directorio especificado. 


patrones_paises_csv <- list.files("Bases/Paises/", pattern = "*.csv")

patrones_fechas_csv <- list.files("Bases/Fechas/", pattern = "*.csv")
       
patrones_regiones_csv <- list.files("Bases/Regiones/", pattern = "*.csv")


library(plyr)


integrar_paises <- ldply(paste0("Bases/Paises/", patrones_paises_csv), read.csv)

integrar_fechas <- ldply(paste0("Bases/Fechas/", patrones_fechas_csv), read.csv)

integrar_regiones <- ldply(paste0("Bases/Regiones/", patrones_regiones_csv), read.csv)




#######################################################################
#######################################################################
#######################################################################