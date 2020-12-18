#######################################################################
#################### PRÁCTICA 2. VECTORES Y LISTAS ####################
#######################################################################



########## PASO 1. Construir los vectores con las películas ###########
########## Fuente: https://www.filmaffinity.com/es/main.html ##########


# Nombre de las películas (var. Char):

nombre_pel <- c("2020", 
                "Contagio en alta mar", 
                "Sin señas particulares")


# Calificación de las películas (var. num):

calf_pel <- c(6.6, 
              5.3, 
              7.2)


# Año de las películas (var. inter):

anio_pel <- c(2020L, 
              2019L, 
              2020L)


# Crítica de las películas (var.char):

critica_pel <- c("Desgarrador consigue en varias secuencias que perciba la cercanía de mis lágrimas. Tampoco me desentiendo nunca de lo que veo y escucho (...) Las sensaciones que te invaden viendo este documental son muy duras.", 
                 "Contiene algunos rasgos que le otorgan personalidad propia. Hecha con más imaginación que medios, su monstruo no requiere grandes alardes técnicos porque el pánico ya lo llevamos todos dentro. Y saber jugar con esa carta es un logro", 
                 "Se expresa sobre todo usando el lenguaje visual, exhibiendo detalladas composiciones y echando mano de recursos como el desenfoque y los primeros planos para aumentar la tensión dramática")


# ¿Te gustaron o no las películas? (var. log):

gusto_pel <- c(T, #T = Sí me gustó, F = No me gustó
               F, 
               T)






############ PASO 2. Construir una lista con los vectores: ############

lista_peliculas <- list(nombre_pel,
                        calf_pel,
                        anio_pel,
                        critica_pel,
                        gusto_pel)




#################### PASO 3. Construir un DataFrame ###################

df_peliculas <- as.data.frame(lista_peliculas)



# La función colnames() permite nombrar a las columnas o variables incluidas en cada DataFrame:

colnames(df_peliculas) <- c("Película", 
                            "Puntuación", 
                            "Año", 
                            "Crítica", 
                            "Gusto")



# La función write.csv() permite producir un archivo tipo .csv :

# Opción en caso que ya esté asignada una carpeta de destino al proyecto

write.csv(df_peliculas, "peliculas_criticas.csv", row.names = F) # 


# Nota 1: el argumento "row.names = F" permite eliminar la columna de identificador. Por defecto, se asigna un valor "V", es decir, se asigna una columna identificador.



#######################################################################
#######################################################################
#######################################################################