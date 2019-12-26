########################## EJEMPLO NUMERO 0 #######################

# cargar libreria para hacer el web scrapping 
library(rvest)
library(gsubfn)
# dar url a scrapear
url <- "https://www.eleconomista.com.mx/"
# leer la url como html
pagina_web <- read_html(url)
class(pagina_web)
# obtener el selector (lugar en el DOM)
selector <- "body > section > div.site-content > div.container.clearfix.con-banners-a-costados > div.col.col-with-banner > div:nth-child(6) > div > div:nth-child(2) > article > div.entry-data > h3 > a"
# obtener el nodo en si en html , sin convertir en texto
nodo <- html_node(pagina_web, selector)
nodo
## convertir el nodo en texto
nodo_texto <- html_text(nodo)
nodo_texto

########################## EJEMPLO NUMERO 1 #######################

url1<-("https://www.eleconomista.com.mx/economia/Ahorro-bruto-representa-21.2-del-PIB-segun-Inegi--20191223-0015.html")
pagina_web1<-read_html(url1)
######### AHORA EXTRAEMOS UNA TABLA 
selector_tabla<- ("#article-1 > div.container.clearfix > aside > div > div.ranking.ranking-triple.sin-banner > div.ranking-notas > div:nth-child(3) > article > div.ranking-data-container > h3 > a ")
nodo_tabla<- html_node(pagina_web1,selector_tabla)
nodo_tabla
## convertir el nodo en texto
nodo_tabla_texto<- html_text(nodo_tabla)
nodo_tabla_texto

########################## EJEMPLO NUMERO 2 #######################
## Localizamos la url a Scrapear.
url2<-("https://www.eleconomista.com.mx/economia/Ahorro-bruto-representa-21.2-del-PIB-segun-Inegi--20191223-0015.html")
pagina_web1<-read_html(url2)
## Ahora extraemos div's anidados. 
selector_tabla<- ("#article-1 > div.container.clearfix > aside > div > div.ranking.ranking-triple.sin-banner > div.ranking-notas")
nodo_tabla<- html_node(pagina_web1,selector_tabla)
nodo_tabla
## convertir el nodo en texto.
nodo_tabla_texto<- html_text(nodo_tabla)
## eliminar las \n (nuevas lineas) \t (regulacion de tab).
nodo_tabla_texto <- gsub("\n","",nodo_tabla_texto )
nodo_tabla_texto <- gsub("\t","",nodo_tabla_texto )
nodo_tabla_texto
class(nodo_tabla_texto)
## convertir en dataFrame el nodo html.
nodo_tabla_texto <- as.data.frame(nodo_tabla_texto)
nodo_tabla_texto
class(nodo_tabla_texto)

