-- 86. a.Bu ülkeler hangileri..?
SELECT DISTINCT country FROM customers;

-- 87. En Pahalı 5 ürün
SELECT p.product_name, p.unit_price
FROM products as p
ORDER BY unit_price DESC
LIMIT 5;

-- 88. ALFKI CustomerID’sine sahip müşterimin sipariş sayısı..?
SELECT o.customer_id, sum(od.quantity) as total_quantity
FROM orders as o
JOIN order_details as od ON o.order_id = od.order_id
WHERE o.customer_id = 'ALFKI'
GROUP BY o.customer_id;

-- 89. Ürünlerimin toplam maliyeti
SELECT SUM((units_on_order+units_in_stock)*unit_price)
FROM products;

--90. Şirketim, şimdiye kadar ne kadar ciro yapmış..?
SELECT SUM((unit_price*quantity)*(1-discount)) as ciro
FROM order_details;

--91. Ortalama Ürün Fiyatım
SELECT AVG(unit_price)
FROM products;

--92. En Pahalı Ürünün Adı
SELECT product_name, unit_price 
FROM products
ORDER BY unit_price DESC
LIMIT 1;

-- 93. En az kazandıran sipariş
SELECT order_id,SUM((unit_price*quantity)*(1-discount)) as kazanc 
FROM order_details
GROUP BY order_id
ORDER BY kazanc ASC
LIMIT 1;

--2.yol
SELECT order_id,SUM(unit_price*quantity) as dusuk_kazanc
FROM order_details
GROUP BY order_id
ORDER BY dusuk_kazanc asc
LIMIT 1;

-- 94. Müşterilerimin içinde en uzun isimli müşteri
SELECT contact_name
FROM customers
ORDER BY LENGTH(contact_name) DESC;

-- 95. Çalışanlarımın Ad, Soyad ve Yaşları
SELECT first_name, last_name, age(birth_date) as age
FROM employees;

-- 96. Hangi üründen toplam kaç adet alınmış..?
SELECT product_name, SUM(units_on_order + quantity)
FROM products
INNER JOIN order_details ON products.product_id = order_details.product_id
GROUP BY 1;

-- 97. Hangi siparişte toplam ne kadar kazanmışım..?
SELECT order_id, SUM(unit_price * quantity)
FROM order_details
GROUP BY 1;

-- 98. Hangi kategoride toplam kaç adet ürün bulunuyor..?
SELECT c.category_name, SUM(p.units_on_order)
FROM products as p
INNER JOIN categories as c ON p.category_id = c.category_id
GROUP BY 1;

-- 99. 1000 Adetten fazla satılan ürünler?
SELECT p.product_name, SUM(od.quantity) AS total_units
FROM products AS p
JOIN order_details AS od ON od.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(od.quantity) > 1000;

-- 100. Hangi Müşterilerim hiç sipariş vermemiş..?
SELECT c.customer_id, o.order_id
FROM customers as c
LEFT JOIN orders AS o ON c.customer_id=o.customer_id
WHERE o.order_id IS NULL;

-- 101. Hangi tedarikçi hangi ürünü sağlıyor ?
SELECT s.company_name, p.product_name
FROM products as p
JOIN suppliers as s ON p.supplier_id = s.supplier_id
GROUP BY 1,2;

-- 102. Hangi sipariş hangi kargo şirketi ile ne zaman gönderilmiş..?
SELECT o.order_id, s.company_name, o.order_date
FROM orders as o
JOIN order_details as od  ON od.order_id = o.order_id
JOIN products as p ON p.product_id = od.product_id
JOIN suppliers as s ON p.supplier_id = s.supplier_id;

-- 103. Hangi siparişi hangi müşteri verir..?
SELECT order_id, customer_id
FROM orders;
-- 104. Hangi çalışan, toplam kaç sipariş almış..?
SELECT CONCAT(e.first_name, ' ',e.last_name),COUNT(od.quantity)
FROM employees as e
JOIN orders as o ON e.employee_id = o.employee_id
JOIN order_details as od ON o.order_id = od.order_id
GROUP BY 1;

-- 105. En fazla siparişi kim almış..?
SELECT CONCAT(e.first_name, ' ',e.last_name),COUNT(od.quantity)
FROM employees as e
JOIN orders as o ON e.employee_id = o.employee_id
JOIN order_details as od ON o.order_id = od.order_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 106. Hangi siparişi, hangi çalışan, hangi müşteri vermiştir..?
SELECT o.order_id, CONCAT(e.first_name, ' ',e.last_name),c.contact_name
FROM employees as e
JOIN orders as o ON e.employee_id = o.employee_id
JOIN order_details as od ON o.order_id = od.order_id
JOIN customers as c ON c.customer_id = o.customer_id
GROUP BY 1,2,3;

-- 107. Hangi ürün, hangi kategoride bulunmaktadır..? Bu ürünü kim tedarik etmektedir..?
SELECT p.product_name, c.category_name, s.company_name
FROM products as p
JOIN categories as c ON c.category_id = p.category_id
JOIN suppliers as s ON s.supplier_id = p.supplier_id
GROUP BY 1,2,3;

-- 108. Hangi siparişi hangi müşteri vermiş, hangi çalışan almış, hangi tarihte, hangi kargo şirketi tarafından gönderilmiş hangi üründen kaç adet alınmış, hangi fiyattan alınmış, ürün hangi kategorideymiş bu ürünü hangi tedarikçi sağlamış

SELECT  o.order_id, 
		c.company_name AS customer_name, 
		CONCAT(e.first_name, ' ', e.last_name) AS employee_name, 
		o.order_date, 
		s.company_name AS shipper_name, 
		p.product_name, 
		od.quantity, 
		od.unit_price, 
		c2.category_name, 
		sup.company_name AS supplier_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.ship_via = s.shipper_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN categories c2 ON p.category_id = c2.category_id
JOIN suppliers sup ON p.supplier_id = sup.supplier_id;

-- 109. Altında ürün bulunmayan kategoriler
SELECT c.category_id, c.category_name
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
WHERE p.category_id IS NULL;

-- 110. Manager ünvanına sahip tüm müşterileri listeleyiniz.
SELECT contact_title
FROM customers
WHERE contact_title LIKE '%Manager%';

-- 111. FR ile başlayan 5 karekter olan tüm müşterileri listeleyiniz.
SELECT customer_id
FROM customers
WHERE customer_id LIKE 'FR___';

-- 112. (171) alan kodlu telefon numarasına sahip müşterileri listeleyiniz.
SELECT customer_id, phone
FROM customers
WHERE phone LIKE '(171)%';

-- 113. BirimdekiMiktar alanında boxes geçen tüm ürünleri listeleyiniz.
SELECT *
FROM products
WHERE quantity_per_unit LIKE '%boxes%';

-- 114. Fransa ve Almanyadaki (France,Germany) Müdürlerin (Manager) Adını ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)
SELECT contact_name AS "MusteriAdi", phone AS "Telefon"
FROM customers
WHERE country IN ('France', 'Germany') AND contact_title LIKE '%Manager%';

-- 115. En yüksek birim fiyata sahip 10 ürünü listeleyiniz.
SELECT *
FROM products
ORDER BY unit_price DESC
LIMIT 10;

-- 116. Müşterileri ülke ve şehir bilgisine göre sıralayıp listeleyiniz.
SELECT contact_name, country, city
FROM customers
GROUP BY 1,2,3;

-- 117. Personellerin ad,soyad ve yaş bilgilerini listeleyiniz.
SELECT first_name, last_name, age(birth_date) as age
FROM employees;

-- 118. 35 gün içinde sevk edilmeyen satışları listeleyiniz.
SELECT * 
FROM orders
WHERE shipped_date - order_date > 35;

-- 119. Birim fiyatı en yüksek olan ürünün kategori adını listeleyiniz. (Alt Sorgu)
SELECT c.category_name
FROM categories as c
JOIN products as p ON p.category_id = c.category_id
WHERE p.unit_price = (SELECT MAX(unit_price) FROM products);

-- 120. Kategori adında 'on' geçen kategorilerin ürünlerini listeleyiniz. (Alt Sorgu)
SELECT p.product_name, c.category_name
FROM categories as c
JOIN products as p ON p.category_id = c.category_id
WHERE c.category_name LIKE ('%on%');
--ALT SORGU İLE
select product_name
from products
where category_id in (select category_id from categories where category_name like '%on%');
-- 121. Konbu adlı üründen kaç adet satılmıştır.
SELECT SUM(od.quantity)
FROM products as p
JOIN order_details as od ON p.product_id = od.product_id
WHERE p.product_name = 'Konbu';

-- 122. Japonyadan kaç farklı ürün tedarik edilmektedir.
SELECT  COUNT(DISTINCT p.product_name) AS adet
FROM products as p
JOIN suppliers as s ON s.supplier_id = p.supplier_id
WHERE s.country = 'Japan';

-- 123. 1997 yılında yapılmış satışların en yüksek, en düşük ve ortalama nakliye ücretlisi ne kadardır?
SELECT MAX(freight) AS maksimum, MIN(freight) AS minimum, AVG(freight) as average
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 1997;

-- 124. Faks numarası olan tüm müşterileri listeleyiniz.
SELECT *
FROM customers
WHERE fax IS NOT NULL;

-- 125. 1996-07-16 ile 1996-07-30 arasında sevk edilen satışları listeleyiniz. 
SELECT *
FROM orders
WHERE shipped_date BETWEEN '1996-07-16' AND '1996-07-30';
