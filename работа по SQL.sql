

------------------------------------- (1) запрос вывести contract_id,employee_name

SELECT co.id,em.name FROM executor ex

JOIN department d ON d.id = ex.tab_no
JOIN Employees em ON em.id = d.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu on cu.id = co.customer_id

WHERE co.id = (SELECT id FROM department WHERE name = 'Logistic')


------------------------------------- (2) запрос Вывести среднее значени amount для Ivan Ivanov

SELECT em.name, AVG(co.amount) FROM executor ex
 
JOIN department d ON d.id = ex.tab_no
JOIN Employees em ON em.id = d.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu on cu.id = co.customer_id

WHERE em.name = 'Ivan Ivanov' 
GROUP BY em.name

----------------------------------- (3) запрос Вывести Location,count

SELECT location, COUNT( * )
FROM customer
GROUP BY location
ORDER BY COUNT( * ) DESC
LIMIT 1

---------------------------------- (4) запрос Вывести count,amount

SELECT amount, COUNT(amount) FROM executor ex
 
JOIN department d ON d.id = ex.tab_no
JOIN Employees em ON em.id = d.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu on cu.id = co.customer_id


GROUP BY amount
HAVING COUNT(amount) > 1

-------------------------------- (5) запрос Вывести customer_name, среднее значение amount



SELECT customer_name, AVG( co.amount )

FROM executor ex
JOIN department d ON d.id = ex.tab_no
JOIN Employees em ON em.id = d.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu ON cu.id = co.customer_id

GROUP BY customer_name
ORDER BY AVG( co.amount )
LIMIT 1



------------------------------ (6) запрос Вывести department_name,sum


SELECT d.name, SUM(co.amount) FROM executor ex

JOIN department d ON d.id = ex.tab_no
JOIN Employees em ON em.id = d.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu on cu.id = co.customer_id

GROUP BY d.name
ORDER BY SUM(co.amount)
DESC
LIMIT 1

