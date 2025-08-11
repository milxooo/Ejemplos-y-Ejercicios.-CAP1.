Ejercicio 1.
La calculadora no acepta una linea que contenga un solo comentario tal y como esta escrita en el EJEMPLO 1-5 y 1-6 porque el escaner de no tiene una accion vacia y el parser no tiene una regla que permita un EOL sin una exp previa.

Para corregir ese detalle se tiene que corregir tanto en el escaner como en el parser. En el escaner para ignorar comentarios y espacios en blanco y solo devolver tokens y EOL cuando corresponda. En el parser para solo aceptar EOL por si solo para gestionar lineas vacias y lineas que solo contengan comentarios. Basicamente se implementa la eliminacion de comentarios en el escaner y el parser se hace tolerante a EOL
