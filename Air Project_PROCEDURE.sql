/*------------------------------------���ν��� : ������ 10% ���ΰ� ����---------------------------------------*/

CREATE OR REPLACE PROCEDURE domestic_discount
IS
BEGIN
UPDATE airport SET price=price*0.9
WHERE departures IN ('��õ','�λ�','���ֵ�','����') 
AND arrivals IN ('��õ','�λ�','���ֵ�','����');
END;