Hash-Dehash-SoftlandERP
======


## Uso
La función *get_hash()* espera un string de 1 a 10 caracteres y devuelve un hash en formato hexadecimal.

```get_hash("12345678") => "0x083436383A3C37393B65"```

La función *get_password()* espera el hash como un string de un numero hexadecimal y devuelve un string con la contraseña.

```get_password("0x083436383A3C37393B65") => "12345678"```

## Ejemplos

Obtención del hash para el usuario dummy en la empresa de nombre EMPRESA con microsoft sql server.

```SELECT cast([PassWord] as varbinary(10))
FROM [EMPRESA].[softland].[wisusuarios]
WHERE [Nombre]='dummy'```


Insertar hash en el usuario dummy de la empresa de nombre EMPRESA con microsoft sql server.

```UPDATE [EMPRESA].[softland].[wisusuarios]
SET [PassWord]=CONVERT(VARCHAR(MAX), 0x083436383A3C37393B65)
WHERE [Usuario]='dummy'```
