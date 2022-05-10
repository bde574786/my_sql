
USE nation; 

CREATE TABLE 앨범(
	앨범번호 INT NOT NULL PRIMARY KEY,
    타이틀 VARCHAR(30) NOT NULL,
    아티스트 VARCHAR(30),
    가격 INT,
    발매일 DATETIME,
    배급 VARCHAR(30),
	별점 DECIMAL(4, 1)
);


CREATE TABLE 곡(
	앨범번호 INT NOT NULL,
    디스크 INT NOT NULL,
    곡번호 INT NOT NULL,
    곡명 VARCHAR(50),
    구분 VARCHAR(10),
    FOREIGN KEY(앨범번호) REFERENCES 앨범(앨범번호)
);

-- 샘플 데이터 
INSERT INTO 앨범 VALUES(1,'조용필','조용필',11500,'1984-10-01','벅스',9.8);
INSERT INTO 앨범 VALUES(2,'사랑하기 때문에','유재하',10400,'1987-08-20','KingPin',9.7);
INSERT INTO 앨범 VALUES(3, 'Break Up 2 Make Up','지코(ZICO)',700,'2016-01-25','CJ E&M MUSIC',7.6);
INSERT INTO 앨범 VALUES(4, '도깨비 OST Part 8','정준일',500,'2017-01-01','CJ E&M MUSIC',9.5);
INSERT INTO 앨범 VALUES(5, '도깨비 OST Part 9','에일리',600,'2017-01-07','CJ E&M MUSIC',8);

INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,1,'돌아와요 부산항에');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,9,'해변의 여인');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,11,'옛 일');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,12,'서러워 말아요');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,15,'생각이 나네');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(2,1,1,'우리들의 사랑');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(2,1,2,'그대 내 품에');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(2,1,9,'사랑하기 때문에');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(3,1,1,'너는 나 나는 너');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(3,1,2,'사랑이었다 (Feat. 루나 of f(x))');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(4,1,1,'첫 눈');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명,구분) VALUES(4,1,2,'첫 눈','Inst.');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명,구분) VALUES(5,1,1,'첫눈처럼 너에게 가겠다','원곡');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명,구분) VALUES(5,1,2,'첫눈처럼 너에게 가겠다','Inst.');


SELECT * FROM 곡;
SELECT * FROM 앨범; 


-- 1. '해변의 여인'이라는 노래를 담고 있는 타이틀과 아티스트를 검색하라.

SELECT 타이틀, 아티스트
FROM 앨범 AS a
WHERE a.앨범번호 = (SELECT 앨범번호 
					FROM 곡 AS b 
                    WHERE b.곡명 = '해변의 여인');
 
 
 SELECT a.타이틀, a.아티스트, b.곡명
 FROM 앨범 AS a
 INNER JOIN 곡 AS b
 ON a.앨범번호 = b.앨범번호
 WHERE b.곡명 = '해변의 여인';


-- mysql 쿼리 
 SELECT a.타이틀, a.아티스트, b.곡명
 FROM 앨범 AS a, 곡 AS b
 WHERE a.앨범번호 = b.앨범번호
 AND b.곡명 = '해변의 여인';
 
 


-- 2. '그대내품에'라는 노래를 부른 아티스트를 검색하라.
SELECT 아티스트
FROM 앨범 AS a
WHERE a.앨범번호 = (SELECT 앨범번호 
					FROM 곡 AS b 
					WHERE b.곡명 = '그대 내 품에');


select a.아티스트
from 앨범 as a
inner join 곡 as b
on a.앨범번호 = b.앨범번호
where b.곡명 = '그대 내 품에';


select a.아티스트
from 앨범 as a, 곡 as b
where a.앨범번호 = b.앨범번호
and b.곡명 = '그대 내 품에';



SELECT * FROM 곡;
SELECT * FROM 앨범; 


-- 문제 3. 'Break Up 2 Make Up'이라는 이름을 가지고 있는 앨범에 수록된 노래를 모두 검색하라.
SELECT 곡명
FROM 곡 AS a
WHERE a.앨범번호 = (SELECT 앨범번호 
					FROM 앨범 AS b 
					WHERE b.타이틀 ='Break Up 2 Make Up');




-- 문제 4. 각 앨범에 수록된 타이틀별 수록곡의 개수를 검색하라.
SELECT b.타이틀, COUNT(a.앨범번호) AS '수록곡의 개수'
FROM 곡 AS a
INNER JOIN 앨범 AS b
ON a.앨범번호 = b.앨범번호
GROUP BY a.앨범번호;


-- 문제 5. '사랑'이라는 단어가 포함된 곡명을 가진 앨범의 타이틀별 수록곡의 개수를 검색하라.
SELECT 타이틀, COUNT(타이틀) AS 곡수
FROM 앨범
LEFT JOIN 곡
ON 곡.앨범번호 = 앨범.앨범번호
WHERE 곡명 LIKE '%사랑%'
GROUP BY 타이틀;

SELECT * FROM 곡;
SELECT * FROM 앨범; 


-- 문제 6 타이틀과 곡명이 동일한 앨범의 노래 이름을 검색하라.

SELECT 곡명
FROM 곡 AS a
INNER JOIN 앨범 AS b
ON a.앨범번호 = b.앨범번호
WHERE a.곡명 = b.타이틀;
  

-- 문제 7 예를 들어 그룹 'Blur'가 'Blur'라는 이름의 앨범을 발매할 수 있다.
-- 이와 같이 아티스트와 타이틀이 동일한 앨범의 타이틀을 검색하라.
SELECT 타이틀
FROM 앨범
WHERE 타이틀 = 아티스트;


SELECT * FROM 앨범;
SELECT * FROM 곡;


-- 문제 8 동일한 곡명이 2개 이상 앨범에 존재하는 경우,
-- 해당 곡명과 수록 곡의 개수를 검색하라.

SELECT 곡명, COUNT(곡번호)
FROM 곡
GROUP BY 곡명
HAVING COUNT(곡번호)>=2;
























-- 1. '해변의 여인'이라는 노래를 담고 있는 타이틀과 아티스트를 검색하라.
SELECT a.타이틀, a.아티스트, b.곡명 
FROM 앨범 AS a
INNER JOIN 곡 AS b 
ON b.앨범번호 = a.앨범번호
WHERE b.곡명 = '해변의 여인';


-- mysql 쿼리 
SELECT a.타이틀, a.아티스트, b.곡명 
FROM 앨범 AS a, 곡 AS b 
WHERE b.앨범번호 = a.앨범번호 
AND b.곡명 = '해변의 여인';



-- 2. '그대내품에'라는 노래를 부른 아티스트를 검색하라.
select  a.아티스트 
from 앨범 as a 
inner join 곡 as b 
on a.앨범번호 = b.앨범번호 
where b.곡명 = '그대 내 품에';

-- mysql join 쿼리 
select a.아티스트 
from 앨범 as a, 곡 as b 
where a.앨범번호 = b.앨범번호 
and b.곡명 = '그대 내 품에';

-- 문제 3. 'Break Up 2 Make Up'이라는 이름을 가지고 있는 앨범에 수록된 노래를 모두 검색하라.
SELECT B.곡명
FROM 앨범 as A
INNER JOIN 곡 AS B 
ON A.앨범번호 = B.앨범번호
WHERE A.타이틀 = 'Break Up 2 Make Up';



-- 문제 4. 각 앨범에 수록된 타이틀별 수록곡의 개수를 검색하라.
SELECT a.타이틀, COUNT(b.앨범번호) AS '수록곡 수'
FROM 앨범 AS a
INNER JOIN 곡 AS b
ON b.앨범번호 = a.앨범번호
GROUP BY a.타이틀;



SELECT a.타이틀, COUNT(b.앨범번호) AS '수록곡 수'
FROM 앨범 a, 곡 b
WHERE b.앨범번호 = a.앨범번호
GROUP BY a.타이틀;




-- 문제 5. '사랑'이라는 단어가 포함된 곡명을 가진 앨범의 타이틀별 수록곡의 개수를 검색하라.
SELECT a.타이틀, COUNT(b.앨범번호) AS '수록곡 수'
FROM 앨범 AS a
INNER JOIN 곡 AS b
ON b.앨범번호 = a.앨범번호
WHERE b.곡명 LIKE '%사랑%'
GROUP BY a.타이틀;


-- 문제 6 타이틀과 곡명이 동일한 앨범의 노래 이름을 검색하라.
SELECT b.곡명
FROM 앨범 AS a
INNER JOIN 곡 AS b
ON b.앨범번호 = a.앨범번호
WHERE b.곡명 = a.타이틀;  


-- 문제 7 예를 들어 그룹 'Blur'가 'Blur'라는 이름의 앨범을 발매할 수 있다.
-- 이와 같이 아티스트와 타이틀이 동일한 앨범의 타이틀을 검색하라.
SELECT 타이틀
FROM 앨범
WHERE 아티스트 = 타이틀;


-- 문제 8 동일한 곡명이 2개 이상 앨범에 존재하는 경우,
-- 해당 곡명과 수록 곡의 개수를 검색하라.
SELECT 곡명, COUNT(앨범번호) AS '수록곡 수'
FROM 곡 
GROUP BY 곡명
HAVING COUNT(곡명) > 1;
