Ejercicio 2.

La calculadora se realizo partiendo de la calculadora del Ejercicio 1. Se modifico para que aceptara numeros decimales como hexadecimales procesando todos como valores de tupo double para permitir calculos con punto flotante. Entonces en el escaner se agregaron los patrones para detectar numeros hexadecimales y numeros con o sin punto decimal usando strtol que es base 16 y strtod respectivamente. Luego en el parser se declaro %union con un campo double (dval) asociando los tokens y no terminales numericos a ese tipo.

Tuve error al principio que fue no unificar el tipo de yylval lo que provoco conversiones incorrectas y resultados errones en las operaciones, tambien fue necesario corregir el formato de impresion usando %f para valores en punto flotante y %x para mostrar el equivalente hexadecimal de la PARTE ENTERA
