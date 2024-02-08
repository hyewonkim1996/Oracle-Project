/*------------------------------------프로시저 : 국내선 10% 할인가 적용---------------------------------------*/

CREATE OR REPLACE PROCEDURE domestic_discount
IS
BEGIN
UPDATE airport SET price=price*0.9
WHERE departures IN ('인천','부산','제주도','김포') 
AND arrivals IN ('인천','부산','제주도','김포');
END;