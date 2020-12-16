rm(list = ls())

install.packages("readxl")
library(readxl)
install.packages("ggplot2")
library(ggplot2)

#Cargar datos desde excel
datos <- read_xlsx("")

#Verificar el tipo de datos que se han cargado a R
str(datos)

#Verificar nombres de filas
rownames(datos)

#Verificar el tipo de base de datos
class(datos)

#Dimensión de la base de datos
dim(datos)

#Inspeccionar datos faltantes
is.na(datos)


#Selecionar subconjunto de datos
sub_conjunto <- datos[!is.na(datos$`Papers ISI 2015-2017`),]
dim(sub_conjunto)

#Convertir variables caracter a numéricas
sub_conjunto[,2] <- sapply(sub_conjunto[, 2], as.numeric)

#Configurar el nombre de las filas del conjunto de datos
sub_conjunto <- data.frame(sub_conjunto, row.names = sub_conjunto$Hospital)

#Eliminar la columna que se pasa como nombre de filas
sub_conjunto <- sub_conjunto[,-3]

#Cambiar el nombre de columnas del dataframe

colnames(sub_conjunto)[5] <- c("Tipo de hospital")

#Calcular la media de solo una columna de datos numéricos

promedio <- mean(sub_conjunto[,14]) #promedio del Indicador seguridad
promedio

##Calcular la media de todas las columnas de datos numéricos
promedio <- apply(as.matrix(sub_conjunto[,14:21]), 2, mean) ###el 2 índica que calcule lo que se le solicita por columnas,
                                              #y en la mean, se puede colocar la función para calcular desviación,
                                              #     y otros descriptivos
promedio <- as.data.frame(promedio) #convertir la información de promedio a data frame


######Pueden aplicar la función anterior para calcular desviación, máximo, mínimo, entre otros.

#Guardar las tablas en excel
write.table(promedio,"promedio.txt") ##guarda en formato txt
write.csv2(promedio,"promedio.csv") ##guarda en formato csv2 y lo abre en excel desde la carpeta en donde que da guardado

###Verificar en dónde guarda los datos
getwd() #Aquí muestra la ruta en dónde guarda los datos


##Diagrama de barras

ggplot(sub_conjunto, aes(x=País, fill=País))+
  geom_bar(width = 1)+
  theme(legend.position = "none") +
  theme(text = element_text(size=10),
        axis.text.x = element_text(angle=90, hjust=1)) +
  ylab("Frecuencia")

## Variable por país
ggplot(sub_conjunto, aes(x = País, y = Seguridad))+
  geom_boxplot(aes(fill=factor(País))) + 
  theme_bw() + 
  theme(legend.position = "nonet") 


#install.packages("reshape2")
library(reshape2)



datos_transf <- melt(sub_conjunto,id.vars=c('País','Ciudad','Tipo de hospital'), 
                     measure.vars=c("Seguridad", "Dignidad y Experiencia",
                                    "Capital Humano", "Gestión del conocimiento",
                                    "Capacidad","Eficiencia",
                                    "Prestigio","Índice de calidad")) 



ggplot(datos_transf, aes(x =variable, y = value, fill = `Tipo de hospital`)) +
  geom_boxplot() +
  theme(legend.position = "right",
        text = element_text(size=10),
        axis.text.x = element_text(angle = 45, hjust = 1, size = 10))  +
  labs(title="Indicador por tipo de hospital\n",
       y="Valor", 
       x="Tipo de indicador") +
  scale_fill_discrete(name = "Tipo\nde hospital\n")



