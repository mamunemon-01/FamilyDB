USE family;

SHOW tables;

SELECT * from member;

SELECT *
FROM member NATURAL JOIN accounts;

SELECT *
FROM estate;

SELECT accounts.name, accounts.bank, accounts.acc_no, accounts.balance
FROM member NATURAL JOIN accounts
WHERE nickname= 'Ety';