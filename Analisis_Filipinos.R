#Referencias: 

#[1] : https://www.aulavirtual.urjc.es/moodle/mod/resource/view.php?id=5175904 (Limpieza-Datos)
#[2] : 
# Analisis del dataset Family_Income_and_Expenditure.csv
#----Cargamos las librerias necesarias----
library(dplyr)
library(ggplot2)
library(GGally)
library(gridExtra)
library(egg)
library(VIM)
#----Carga de datos----
datos<-read.csv('Family_Income_and_Expenditure.csv',stringsAsFactors = TRUE)
# names(datos)<-c(
#   "Total_Household_Income"
#   ,"Region"
#   ,"Total_Food_Expenditure"
#   ,"Main_Source_of_Income"
#   ,"Agricultural_Household_indicator"
#   ,"Bread_and_Cereals_Expenditure"
#   ,"Total_Rice_Expenditure"
#   ,"Meat_Expenditure"
#   ,"Total_Fish_and__marine_products_Expenditure"
#   ,"Fruit_Expenditure"
#   ,"Vegetables_Expenditure"
#   ,"Restaurant_and_hotels_Expenditure"
#   ,"Alcoholic_Beverages_Expenditure"
#   ,"Tobacco_Expenditure"
#   ,"Clothing__Footwear_and_Other_Wear_Expenditure"
#   ,"Housing_and_water_Expenditure"
#   ,"Imputed_House_Rental_Value"
#   ,"Medical_Care_Expenditure"
#   ,"Transportation_Expenditure"
#   ,"Communication_Expenditure"
#   ,"Education_Expenditure"
#   ,"Miscellaneous_Goods_and_Services_Expenditure"
#   ,"Special_Occasions_Expenditure"
#   ,"Crop_Farming_and_Gardening_expenses"
#   ,"Total_Income_from_Entrepreneurial_Acitivites"
#   ,"Household_Head_Sex"
#   ,"Household_Head_Age"
#   ,"Household_Head_Marital_Status"
#   ,"Household_Head_Highest_Grade_Completed"
#   ,"Household_Head_Job_or_Business_Indicator"
#   ,"Household_Head_Occupation"
#   ,"Household_Head_Class_of_Worker"
#   ,"Type_of_Household"
#   ,"Total_Number_of_Family_members"
#   ,"Members_with_age_less_than_5_year_old"
#   ,"Members_with_age_5___17_years_old"
#   ,"Total_number_of_family_members_employed"
#   ,"Type_of_Building_House"
#   ,"Type_of_Roof"
#   ,"Type_of_Walls"
#   ,"House_Floor_Area"
#   ,"House_Age"
#   ,"Number_of_bedrooms"
#   ,"Tenure_Status"
#   ,"Toilet_Facilities"
#   ,"Electricity"
#   ,"Main_Source_of_Water_Supply"
#   ,"Number_of_Television"
#   ,"Number_of_CD_VCD_DVD"
#   ,"Number_of_Component_Stereo_set"
#   ,"Number_of_Refrigerator_Freezer"
#   ,"Number_of_Washing_Machine"
#   ,"Number_of_Airconditioner"
#   ,"Number_of_Car__Jeep__Van"
#   ,"Number_of_Landline_wireless_telephones"
#   ,"Number_of_Cellular_phone"
#   ,"Number_of_Personal_Computer"
#   ,"Number_of_Stove_with_Oven_Gas_Range"
#   ,"Number_of_Motorized_Banca"
#   ,"Number_of_Motorcycle_Tricycle")
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

#Separamos la variables numéricas de las categóricas

Variables_Categoricas<-datos%>%select_if(is.factor)
str(Variables_Categoricas)
Variables_numericas<-datos%>%select_if(is.numeric)
str(variables_numericas)

#Reordenamos los factores que necesitan ser ordenados de menor a mayor:
#¿Como reordenamos la variables?
#Miramos el apartado Reordenación de niveles de [1]
#---------------------------------------------------------------------------------------------------------------------------------------------
levels(Variables_Categoricas$Main.Source.of.Income)
Variables_Categoricas$Main.Source.of.Income = factor(Variables_Categoricas$Main.Source.of.Income, levels=(c('Other sources of Income'
                                                                     , 'Enterpreneurial Activities'
                                                                     , 'Wage/Salaries')))
levels(Variables_Categoricas$Main.Source.of.Income)
#---------------------------------------------------------------------------------------------------------------------------------------------
levels(Variables_Categoricas$Household.Head.Marital.Status)
Variables_Categoricas$Household.Head.Marital.Status = 
  factor(Variables_Categoricas$Household.Head.Marital.Status,levels=
           (c('Unknown'
            ,'Single'
            ,'Wage/Salaries'
            ,'Widowed'
            ,'Annulled'
            ,'Divorced/Separated'
            ,'Married')))
levels(Variables_Categoricas$Household.Head.Marital.Status)
#---------------------------------------------------------------------------------------------------------------------------------------------
levels(Variables_Categoricas$Household.Head.Class.of.Worker)

Variables_Categoricas$Household.Head.Class.of.Worker = 
  factor(Variables_Categoricas$Household.Head.Class.of.Worker,levels=
           (c('Worked without pay in own family-operated farm or business'
              ,'Employer in own family-operated farm or business'
              ,'Worked with pay in own family-operated farm or business'
              ,'Self-employed wihout any employee'
              ,'Worked for private household'
              ,'Worked for private establishment'
              ,'Worked for government/government corporation')))
levels(Variables_Categoricas$Household.Head.Class.of.Worker)
#---------------------------------------------------------------------------------------------------------------------------------------------
levels(Variables_Categoricas$Type.of.Household)
Variables_Categoricas$Type.of.Household = 
  factor(Variables_Categoricas$Type.of.Household,levels=
           (c('Single Family'
              ,'Two or More Nonrelated Persons/Members'
              ,'Extended Family')))
levels(Variables_Categoricas$Type.of.Household)
#---------------------------------------------------------------------------------------------------------------------------------------------
levels(Variables_Categoricas$Type.of.Building.House)
Variables_Categoricas$Type.of.Building.House = 
  factor(Variables_Categoricas$Type.of.Building.House,levels=
           (c('Other building unit (e.g. cave, boat)'
              ,'Institutional living quarter'
              ,'Commercial/industrial/agricultural building'
              ,'Single house'
              ,'Duplex'
              ,'Multi-unit residential')))
levels(Variables_Categoricas$Type.of.Building.House)
#---------------------------------------------------------------------------------------------------------------------------------------------
levels(Variables_Categoricas$Type.of.Roof)
Variables_Categoricas$Type.of.Roof = 
  factor(Variables_Categoricas$Type.of.Roof,levels=
           (c('Not Applicable'
              ,'Salvaged/makeshift materials'
              ,'Light material (cogon,nipa,anahaw)'
              ,'Mixed but predominantly salvaged materials'
              ,'Mixed but predominantly light materials'
              ,'Mixed but predominantly strong materials'
              ,'Strong material(galvanized,iron,al,tile,concrete,brick,stone,asbestos)')))
levels(Variables_Categoricas$Type.of.Roof)
#---------------------------------------------------------------------------------------------------------------------------------------------
levels(Variables_Categoricas$Type.of.Walls)
Variables_Categoricas$Type.of.Walls= 
  factor(Variables_Categoricas$Type.of.Walls,levels=
           (c('NOt applicable'
              ,'Salvaged'
              ,'Very Light'
              ,'Light'
              ,'Strong'
              ,'Quite Strong')))
levels(Variables_Categoricas$Type.of.Walls)
#---------------------------------------------------------------------------------------------------------------------------------------------
levels(Variables_Categoricas$Toilet.Facilities)
Variables_Categoricas$Toilet.Facilities= 
  factor(Variables_Categoricas$Toilet.Facilities,levels=
           (c('None'
              ,'Others'
              ,'Open pi'
              ,'Closed pit'
              ,'Water-sealed, other depository, shared with other household'
              ,'Water-sealed, other depository, used exclusively by household'
              ,'Water-sealed, sewer septic tank, shared with other household'
              ,'Water-sealed, sewer septic tank, used exclusively by household')))
levels(Variables_Categoricas$Toilet.Facilities)
#---------------------------------------------------------------------------------------------------------------------------------------------
levels(Variables_Categoricas$Main.Source.of.Water.Supply)
Variables_Categoricas$Main.Source.of.Water.Supply= 
  factor(Variables_Categoricas$Main.Source.of.Water.Supply,levels=
           (c('Others'
              ,'Dug well'
              ,'Lake, river, rain and others'
              ,'Unprotected spring, river, stream, etc'
              ,'Protected spring, river, stream, etc'
              ,'Tubed/piped shallow well'
              ,'Shared, tubed/piped deep well'
              ,'Own use, tubed/piped deep well'
              ,'Peddler'
              ,'Shared, faucet, community water system'
              ,'Own use, faucet, community water system')))
levels(Variables_Categoricas$Main.Source.of.Water.Supply)
#---------------------------------------------------------------------------------------------------------------------------------------------
# ESTE NO SE COMO ORDENARLO
# levels(Variables_Categoricas$Tenure.Status)
# Variables_Categoricas$Tenure.Status= 
#   factor(Variables_Categoricas$Tenure.Status,levels=
#            (c(''
#               ,''
#               ,''
#               ,''
#               ,'Rent house/room including lot'
#               ,'Own house, rent lot'
#               ,'Own or owner-like possession of house and lot')))
# levels(Variables_Categoricas$Tenure.Status)
#---------------------------------------------------------------------------------------------------------------------------------------------



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

#----Análisis exploratorio de datos faltantes----
aggr_plot<-aggr(Variables_Categoricas,numbers=TRUE,sortVars=TRUE,labels=names(Variables_Categoricas),cex.axis=.7,gap=3,
                ylab=c('Histograma de datos faltantes','Patrones de datos faltantes'))
# Nos fijamos que solo hay datos faltantes en Household.Head.Occupation y Household.Head.Class.of.Worker
# mirar output de la función
Variables_Categoricas%>%select(Household.Head.Occupation,Household.Head.Class.of.Worker)%>%marginplot()


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





