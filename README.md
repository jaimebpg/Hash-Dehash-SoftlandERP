Hash-Dehash-SoftlandERP
======

###Función hash e inversa para contraseñas almacenadas en la Base de datos de softlandERP Chile 


## Uso
La función *get_hash()* espera un string de 1 a 10 caracteres y devuelve un hash en formato hexadecimal.

```get_hash("12345678") => "0x083436383A3C37393B65"```

La función *get_password()* espera el hash como un string de un numero hexadecimal y devuelve un string con la contraseña.

```get_password("0x083436383A3C37393B65") => "12345678"```

## Comandos útiles

Obtención del hash para el usuario dummy en la empresa de nombre EMPRESA con microsoft sql server.

```SELECT cast([PassWord] as varbinary(10))
FROM [EMPRESA].[softland].[wisusuarios]
WHERE [Nombre]='dummy'```


Insertar hash en el usuario dummy de la empresa de nombre EMPRESA con microsoft sql server.

```UPDATE [EMPRESA].[softland].[wisusuarios]
SET [PassWord]=CONVERT(VARCHAR(MAX), 0x083436383A3C37393B65)
WHERE [Usuario]='dummy'```


## ejemplo transformaciones de get_hash() y get_password()

get_hash("12345678")

```"12345678" => "12345678a" => 
[49, 50, 51, 52, 53, 54, 55, 56, 97 (RELLENO)] => [8(LEN), 49, 50, 51, 52, 53, 54, 55, 56, 97(RELLENO)] => 
( [8(LEN), 49, 50, 51, 52, 53, 54, 55, 56, 97(RELLENO)] + [0,3,4,5,6,7,1,2,3,4] ) % [256,256,256,256,256,256,256,256,256,256] => [8(LEN), 52, 54, 56, 58, 60, 55, 57, 59, 101(RELLENO)] => "0x083436383A3C37393B65"'```


get_password("0x083436383A3C37393B65")

```"0x083436383A3C37393B65" => [8(LEN), 52, 54, 56, 58, 60, 55, 57, 59, 101(RELLENO)] =>
( [8(LEN), 52, 54, 56, 58, 60, 55, 57, 59, 101(RELLENO)]] - [0,3,4,5,6,7,1,2,3,4] ) % [256,256,256,256,256,256,256,256,256,256] => [8(LEN), 49, 50, 51, 52, 53, 54, 55, 56, 97(RELLENO)] => [49, 50, 51, 52, 53, 54, 55, 56] => "12345678"```

