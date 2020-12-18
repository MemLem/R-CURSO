#######################################################################
##### PRACTICA 4. Ciclo de condicionales para pacientes COVID-19 ######
#######################################################################


###### Paso 1. Creación y declaración de las variables del ciclo ######


nombre_paciente <- c()
edad_paciente <- c()
sexo_paciente <- c()

diabetes_paciente <- c()
hipertension_paciente <- c()
obesidad_paciente <- c()

temperatura_paciente <- c()
dolor_cabeza_paciente <- c()
dolor_torax_paciente <- c()
dif_respiratoria_paciente <- c()



######## Paso 2. Creación del ciclo iterativo para n pacientes ########


for (i in 1:1) {
  
  nombre_paciente[i] <- readline(prompt = "Nombre del paciente: ")
  edad_paciente[i] <- readline(prompt = "Edad del paciente: ")
  sexo_paciente[i] <- readline(prompt = "Sexo del paciente (M/F): ")
  
  diabetes_paciente[i] <- readline(prompt = "¿Padece diabetes? (S/N): ")
  hipertension_paciente[i] <- readline(prompt = "¿Padece hipertensión? (S/N): ")
  obesidad_paciente[i] <- readline(prompt = "¿Padece obesidad?  (S/N): ")
  
  temperatura_paciente[i] <- readline(prompt = "¿Cuál es la temperatuta del paciente?: ")
  dolor_cabeza_paciente[i] <- readline(prompt = "¿Presenta dolor de cabeza? (S/N): ")
  dolor_torax_paciente[i] <- readline(prompt = "¿Presenta dolor tóracico? (S/N): ")
  dif_respiratoria_paciente[i] <- readline(prompt = "¿Presenta dificultad para respirar? (S/N): ")
  
  
# Nota 1. La función readline(prompt = "") sirve para leer una linea de texto e interactuar con ella en la consola.
# El argumento 'prompt = ""' lee el texto a interactuar y le solicita al usuario un valor de entrada.


  
  
  
################## Análisis rápido de los pacientes ###################
  

  if(edad_paciente > 60){
    print("Alta probabilidad de complicación")
    
  } else if (hipertension_paciente == "S" | diabetes_paciente == "S") {
    print("Acudir con médico familiar")
    
  }   else if (temperatura_paciente > 37.6 & temperatura_paciente <= 38.9) {
      print("Tomar paracetamol")
  
  }     else if (dolor_cabeza_paciente == "S" & temperatura_paciente >= 36.0 & temperatura_paciente <= 37.5) {
        print("Tomar aspirina")
    
  }       else if (temperatura_paciente >= 39.0 | dif_respiratoria_paciente == "S") {
          print("Traslado inmediato al Hospital")
    
  } else {
    print("Mantener reposo en casa")
  }

}



#######################################################################
#######################################################################
#######################################################################