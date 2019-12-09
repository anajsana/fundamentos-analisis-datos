
# Analisis del dataset Family_Income_and_Expenditure.csv
#----Cargamos las librerias necesarias----
library(dplyr)
library(ggplot2)
library(GGally)
library(gridExtra)
library(egg)
#----Carga de datos----
datos<-read.csv('Family_Income_and_Expenditure.csv',stringsAsFactors = TRUE)
#----Inspección de datos----
head_datos<-head(datos)
summary(datos)
str(datos)
variables<-colnames(datos)
glimpse(datos)
#Nos fijamos en determinadas variables:

summary(datos$Household.Head.Class.of.Worker)

# Estas dos siguientes variables aunque sean enteras creo que es necesario categorizarlas ya que:
summary(datos$Agricultural.Household.indicator)# Solo son valores de 0 a 2
summary(datos$Electricity)# solo son valores de 0 y 1
datos$Electricity<-as.factor(datos$Electricity)
datos$Agricultural.Household.indicator<-as.factor(datos$Agricultural.Household.indicator)

str(datos$Electricity)
str(datos$Agricultural.Household.indicator)

#Separamos la variables numéricas de las categóricas

Variables_Categoricas<-datos%>%select_if(is.factor)
str(Variables_Categoricas)
variables_numericas<-datos%>%select_if(is.numeric)
str(variables_numericas)

#----Resumen numérico de las variables categóricas----

# Si queremos ver toda la información de las variables categóricas ejecutamos el siguiente código:

summary(Variables_Categoricas)

#Si preferimos ir una por una podemos hallar su tabla de contingencia de cada una:

# Hallamos las tablas de contingencias para cada una de las variables categóricas. La tabla de contingencia muestra para cada valor que tome
# la variable categórica el número de casos que aparecen.

cat_Region<-table(Variables_Categoricas$Region)
cat_Main.Source.of.Income<-table(Variables_Categoricas$Main.Source.of.Income)
cat_Household.Head.Sex<-table(Variables_Categoricas$Household.Head.Sex)
cat_Household.Head.Marital.Status<-table(Variables_Categoricas$Household.Head.Marital.Status)
cat_Household.Head.Highest.Grade.Completed<-table(Variables_Categoricas$Household.Head.Highest.Grade.Completed)
cat_Household.Head.Job.or.Business.Indicator<-table(Variables_Categoricas$Household.Head.Job.or.Business.Indicator)
cat_Household.Head.Occupation<-table(Variables_Categoricas$Household.Head.Occupation)
cat_Household.Head.Class.of.Worker<-table(Variables_Categoricas$Household.Head.Class.of.Worker)
cat_Type.of.Household<-table(Variables_Categoricas$Type.of.Household)
cat_Type.of.Building.House<-table(Variables_Categoricas$Type.of.Building.House)
cat_Type.of.Roof<-table(Variables_Categoricas$Type.of.Roof)
cat_Type.of.Walls<-table(Variables_Categoricas$Type.of.Walls)
cat_Tenure.Status<-table(Variables_Categoricas$Tenure.Status)
cat_Toilet.Facilities<-table(Variables_Categoricas$Toilet.Facilities)
cat_Main.Source.of.Water.Supply<-table(Variables_Categoricas$Main.Source.of.Water.Supply)
cat_Electricity<-table(Variables_Categoricas$Electricity)
cat_Agricultural.Household.indicator <- table(Variables_Categoricas$Agricultural.Household.indicator)

# De forma gráfica
# NOTA: me gustaría cambiar el color de las barras a naranja
ggplot(Variables_Categoricas,aes(Region))+
  geom_bar()+ggtitle("Distribución de los datos por región")+ 
  theme(axis.text.x = element_text(angle = 90))+labs(x='Region',y='Frecuencia')


# Otro análisis util podría ser hallar la taba de contingencia de variables categoricas enfrentadas...
# TEST: typeof(table(Variables_Categoricas$Region))

#----Resumen numérico de las variables cuantitativas----




#----Division de los datos----
#El data set que hemos elegido proviene de una encuesta realizada por la PSA 
#(Philippine Statistics Authority) donde se muestran los gastos e ingresos por
#familia en las islas Filipinas. Contiene más de 40k observaciones y 60 variables
#que hemos agrupado en las siguientes categorías:
  
#Gastos
#Datos demográficos de familias
#Datos demográficos de la persona principal en la toma de decisiones
#Estructura de la casa
#Número de bienes adquiridos

#----Gastos
DF_Expenditures<-datos%>% select(-Agricultural.Household.indicator,-Main.Source.of.Income)%>%select(3:22)
DF_Expenditures<-cbind(DF_Expenditures, Job = datos$Household.Head.Job.or.Business.Indicator)
DF_Expenditures<-cbind(datos$Total.Household.Income, DF_Expenditures)

#NOTA: ejecutar linea a linea los plots si no quereis que muera el ordenador
DF_Expenditures %>% select(1:22) %>% ggpairs(columns= 1:10,ggplot2::aes(color = Job))
DF_Expenditures %>% select(1:22) %>%ggpairs(columns= c(1,11:21),ggplot2::aes(color = Job))

#----Datos demográficos de familias





