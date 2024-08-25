' ZX Ginjol-Adventure-Parser
' Descripcion: Parser de aventuras graficas escrito en Boriel BASIC
' Autor: Ginjol(Andres Gimenez)
' Version: 0.0.1
' Fecha de creacion: 24/08/2024

#include <input.bas>
#include <string.bas>
#include "subrutinas.bas"


Border 0: Paper 0: Ink 7: Cls
Bold 1

DIM Salas(3) AS STRING
DIM Descripciones(3) AS STRING
DIM Conexiones(3,3) AS STRING
DIM Objetos(3,3) AS STRING
DIM Inventario(10) AS STRING

DIM Comando AS STRING
DIM Ubicacion AS UBYTE
DIM NumObjetos AS UBYTE

LET Ubicacion = 1 
LET NumObjetos = 0


' Definir Salas
Salas(0) = "habitacion inicial"
Descripciones(0) = "Estas en una habitacion pequena y oscura. Hay una puerta al norte."
Conexiones(0,0) = "NORTE"
Conexiones(0,1) = "pasillo oscuro"

Salas(1) = "pasillo oscuro"
Descripciones(1) = "Un pasillo oscuro y largo, apenas puedes ver al frente. Al sur hay una puerta que conduce de regreso."
Conexiones(1,0) = "SUR"
Conexiones(1,1) = "habitacion inicial"
Conexiones(1,2) = "ESTE"
Conexiones(1,3) = "biblioteca"

Salas(2) = "biblioteca"
Descripciones(2) = "Estas en una biblioteca polvorienta llena de libros viejos. Hay una puerta al oeste que conduce de regreso."
Conexiones(2,0) = "OESTE"
Conexiones(2,1) = "pasillo oscuro"

' Definir Objetos
Objetos(0, 0) = "linterna"
Objetos(0, 1) = "llave"
Objetos(1, 0) = "monstruo"
Objetos(2, 0) = "libro antiguo"


' Iniciar juego
PRINT "Bienvenido a la aventura."


' Mostrar la descripcion inicial
getUbicacion(Descripciones(0),"")
' Loop principal
DO

  PRINT "Que quieres hacer? " ' TODO EN EL LITERAL mirar acentos - "Que quieres hacer? " 
  LET Comando = INPUT(20)
  ejecutarComando(Comando)

LOOP