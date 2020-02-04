#intalar paquetes
library()

install.packages("foreign", dependencies = T)

##Importar datos
url<-"http://datos.cfe.gob.mx/Datos/Electrificacionrural.csv"
data<-read.csv(url)
data

###Base de datos 
paquetes <- library(help = "datasets")
head(paquetes$info[[2]])

#exportar datos
Edad <- c(23,30,30,35,40)
Estatura <- c(1.64,1.7,1.8,1.55,1.8)
Peso <- c(50,70,85,45,80)
Nacionalidad<-c("Mexicano","Mexicano","Mexicano","Extranjero","Extranjero")
Genero <- c("Mujer","Hombre","Hombre","Mujer","Hombre")

X <- cbind(Edad,Estatura,Peso,Nacionalidad,Genero)
row.names(X) <- c("Ana","Alberto","Anyelo","Fulanita","Sultanito")

datos<-data.frame(X)
write.table(datos,"Estadistica Grupo 1.txt")
write.csv(datos,"Estadistica Grupo 1.csv")


