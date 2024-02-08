/*-----------------------------------뷰 : 회원 항공권 정보---------------------------------
    회원 정보, 회원별 구매 항공권 정보, 회원별 구매 좌석 정보를 하나의 테이블로 조인하여 뷰 생성
*/

create view member_ticket_view as(
select m.name,m.passport,a.departures,a.arrivals,
substr(a.time,1,14),substr(a.a_time,1,14),a.air_name,s.s_grade,s.s_row,s.s_seat
from member m inner join booking b
on m.id=b.b_id
inner join airport a
on b.air_name=a.air_name
inner join seat s
on b.b_num=s.b_num
);

select * from member_ticket_view;