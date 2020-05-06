###################################################################################################
## ENES - UNAM. Licenciatura en Ciencias Ambientales. Ecología de Poblaciones y Comunidades #######
## Actividad práctica de dinámica poblacional con dos interacciones: competencia y depredación ####
###################################################################################################


############################# Instrucciones #######################################################
# 1. Cargue todas las funciones en el archivo lotkacomp.R y lotkaprey.R
# 2. Cargue los manuales lotkacomp.Rd y lotkaprey.Rd
###################################################################################################

### Competencia

# Evaluemos el efecto de la competencia entre dos especies que dependen del mismo recurso.
# Para esto utilizaremos el modelo de Lotka-Volterra de competenca iterespecífica, definida como:

# Especie 1
#  dN1/dt = r1 * k1 *(1- (N1/k1) - alfa*(N2/K1))

# Especie 2
#  dN2/dt = r2 * k2 *(1- (N2/k2) - beta*(N1/K2))


#Definamos las isolineas de ambas especies con los parámetros siguientes
alfa = 0.8
beta = 0.6
k1 = 20
k2 = 20

#ajustemos la dinámica de equilibrio Lotka-Volterra y la funcion lotkacom
mod <- lotkacomp(alfa, beta, k1, k2)
plot(mod)

# ¿qué observamos?

## Agregemos línas de trayectoria y punto de inicio
lines(mod, 1, 1, col="green", lwd=2)
points(1, 1, pch=16, col="green")

#Ahora proyectemos el tamaño poblacional en función del tiempo para cada especie  
plot(traj(mod, 1, 1))

## Identifiquemos valores de punto de equilibrio poblacional
mod
summary(mod)

# Responde

#1. ¿Qué observas con los valores originales? ¿hay coexistencia de las especies?
#2. ¿qué observas si la capacidad de carga de la especie 1 fuera 40? ¿qué especies se estingue?
#3. ¿qué observas si la capacidad de carga de la especie 2 fuera 40? ¿qué especies se estingue?
#4. ¿qué observas si el coeficiente de competencia de la especie 1 fuera 1.2? ¿qué especies se estingue?
#5. ¿qué observas si el coeficiente de competencia de la especie 2 fuera 1.2? ¿qué especies se estingue?

### Depredación

# Evaluemos el efecto de la depredación en las dinámicas de la presa y el depredador.
# Para esto utilizaremos el modelo de Lotka-Volterra de depredación, definida como:

# Especie 1
#  dN/dt = a*N - b*N*P

# Especie 2
#  dP/dt = d*b*N*P -c*P 

# Definamos las isolineas de ambas especies con los parámetros siguientes

# Tasa intrinseca de crecimiento de la presa
a = 0.5

# Eficiencia de ataque de la presa 
b = 0.01

# Tasa de mortalidad del depredador
c = 0.2

# Eficiencia de consumo  
d = 0.1

#Densidad inicial de presa

N = 400

#Densidad inicial de depredador

P = 40

#ajustemos la dinámica de equilibrio Lotka-Volterra y la funcion lotkaprey
mod <- lotkaprey(a, b, c, d)
mod

#GRafiquemos las isolineas en un plano cartesiano
op <- par(no.readonly = TRUE)
layout(matrix(c(1,1,2, 1,1,3), nrow=2, byrow = TRUE))
plot(mod)

# Grafiquemos loa equilibrios para tamaño poblacional inicial N = 200, P = 20. 
lines(mod, N = N, P = P)

#Grafiquemos trayectorias en el tiempo cambiando la densidad del depredador a 30
plot(traj(mod, N, P))
par(op)

# Responde

#1. ¿Qué observas con los valores originales? ¿hay coexistencia de las especies?
#2. ¿Cuál es el desface de los depredadores respecto a los cambios en las presas?
#3. ¿Modifica cada uno de los parámetros de densidades iniciales para ambas poblaciones a
#   (1) N = 200, P = 30
#   (2) N = 200, P = 40
#   (3) N = 400, P = 40
