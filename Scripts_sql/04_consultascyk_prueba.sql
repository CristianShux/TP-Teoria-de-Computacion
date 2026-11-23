select cyk('{"a":10,"b":''hola''}'); --Valido
select cyk('{"a":10,"b":''hola'',"c":{"d":''chau'',"e":99},"f":{}}');--Valido
select cyk('{"a":''hola'',"b":''chau'',"c":''''}')--Valido
select cyk('{"a":10,}'); --Invalido
select cyk('{"a":}'); --Invalido