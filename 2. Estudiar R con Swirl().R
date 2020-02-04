#### Estudiar R en R con Swirl#####
install.packages("swirl", dependencies = TRUE)
library(swirl)
swirl()


####Estudiar R con un curso en github de la UNAM ##############
install.packages("swirl")
library(swirl)
select_language()

install_course_github(github_username = "ifunam", course_name = "programacion-estadistica-r")
swirl()

##recordar que para continuar con el curso debe digitar bye(), y así se guardará el progreso
###Para ingresar nuevamente al curso, solamente digita swirl()

