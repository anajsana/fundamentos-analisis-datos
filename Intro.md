# Fundamentos de análisis de datos

***

## Contexto

El data set que hemos elegido proviene de una encuesta realizada por la PSA (Philippine Statistics Authority) donde se muestran los gastos e ingresos por familia en las islas Filipinas. Contiene 40k observaciones y 60 variables que hemos agrupado en las siguientes categorías:

* Gastos
* Datos demográficos de familias
* Datos demográficos de la persona principal en la toma de decisiones
* Estructura de la casa
* Número de bienes adquiridos


## Motivación y target

Identificar un modelo de clasificación socio-económicos óptimo en Filipinas ha sido un tema difícil de abordar durante varios años. A día de hoy, ningun modelo ha sido aceptado de forma global, y los diferentes organismos gubernamentales que existen utilizan sus propios modelos.

Teniendo en cuenta que los ingresos de un país es un indicador crucial para una correcta clasificación socio-económica del país, nos gustaría responder a la pregunta **¿Es un modelo de regresión lineal múltiple adecuado para predecir los ingresos de una familia Filipina?**

Nuestra **variable de interés** en nuestro data set `Family_income_and_expenditure.csv` será `Total.household.income`. Nuestro **objetivo** será predecir los ingresos familiares.


## Procedimiento

El análisis de dividirá en dos fases. La **primera fase** consistirá en un *análisis exploratorio de los datos* para entender mejor el significado y la relevancia de cada una de nuestras variables. Estudiaremos puntos clave como el nivel de correlación entre nuestra variable de interés y las demás variables.

Por ello, para cada variable estudiada, nos preguntaremos:

* ¿Consideramos esta variable cuando intentamos predecir los ingresos familiares?
* Si es así ¿Cómo de relevante es esta variable en determinar nuestra variable de interés?

La **segunda fase** consistirá en la elaboración de un modelo de regresión lineal múltiple con las variables elegidas.

***

A continuación mostramos los pasos que seguiremos para nuestro anaálisis:


1. Limpieza de datos
2. Análisis EDA

* Objetivo clasificación: agrupar regiones por ingresos bajos, medios o altos (???)
* Crear 5 visualizaciones de matrices de corelación. Una por cada agrupación que hemos definido(e.g comparar household income con total expenditure + meat expenditure + vegetable expenditure , etc)

3. Pre-procesamiento de datos
4. Predicción:

 * Objetivo regresión: modelo de regresión linear múltiple para predecir los ingresos de una familia filipina

5. Conclusiones
