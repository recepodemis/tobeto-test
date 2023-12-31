26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını (`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın.
select product_id,product_name,s.company_name,s.phone from products p
inner join suppliers s on s.supplier_id=p.supplier_id
where units_in_stock=0

27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı
select o.ship_address,e.last_name,e.first_name,o.order_date from orders o
inner join employees e on o.employee_id=e.employee_id
where order_date between'1998-03-01' and '1998-03-31'

28. 1997 yılı şubat ayında kaç siparişim var?
select count(quantity) from order_details od
inner join orders o on od.order_id=o.order_id
where order_date between'1998-02-01' and '1998-02-28'

29. London şehrinden 1998 yılında kaç siparişim var?
select count(quantity) from order_details od
inner join orders o on od.order_id=o.order_id
where ship_city ='London' and order_date between '1998-01-01' and '1998-12-31' 
 
30. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası
select c.contact_name,c.phone from orders o
inner join customers c on o.customer_id=c.customer_id
where order_date between '1997-01-01' and '1997-12-31'

31. Taşıma ücreti 40 üzeri olan siparişlerim
select * from orders
where freight>40 

32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
select ship_city,c.contact_name,freight from orders o
inner join customers c  on o.customer_id=c.customer_id
where freight>40

33. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf),
select order_date,ship_city,concat(upper (first_name),' ',upper(last_name)) from orders o
inner join employees e on o.employee_id=e.employee_id
where order_date between '1997-01-01' and '1997-12-31'

34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
select contact_name,phone from customers c
inner join orders o  on o.customer_id=c.customer_id
where order_date between '1997-01-01' and '1997-12-31'

SELECT 
  CONCAT(SUBSTRING(phone, 0,7)) AS formatted_phone
FROM customers;

35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad
select order_date,contact_name,first_name,last_name from orders o
inner join customers c on c.customer_id=o.customer_id
inner join employees e on e.employee_id=o.employee_id

36. Geciken siparişlerim?
select * from orders 
where shipped_date>required_date

37. Geciken siparişlerimin tarihi, müşterisinin adı
select shipped_date,contact_name from orders o 
inner join customers c on c.customer_id=o.customer_id
where shipped_date>required_date

38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi


39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
41. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
42. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
43. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
44. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
45. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
46. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
47. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
48. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
49. Kaç ülkeden müşterim var
50. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
51. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
52. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
53. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
54. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
55. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
56. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
57. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
58. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
59. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
60. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
61. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
62. Kaç ülkeden müşterim var
63. Hangi ülkeden kaç müşterimiz var
64. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
65. 10 numaralı ID ye sahip ürünümden son 3 ayda ne kadarlık ciro sağladım?
66. Hangi çalışan şimdiye kadar toplam kaç sipariş almış..?
67. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun
68. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri
69. Brezilya’da olmayan müşteriler
70. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
71. Faks numarasını bilmediğim müşteriler
72. Londra’da ya da Paris’de bulunan müşterilerim
73. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler
74. C ile başlayan ürünlerimin isimleri ve fiyatları
75. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri
76. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları
77. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları
78. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin (Orders), SiparişID (OrderID) ve SiparişTarihi (OrderDate) bilgileri
79. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
80. Faks numarasını bilmediğim müşteriler
81. Müşterilerimi ülkeye göre sıralıyorum:
82. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz
83. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, ama stoklarını küçükten-büyüğe doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz
84. 1 Numaralı kategoride kaç ürün vardır..?
85. Kaç farklı ülkeye ihracat yapıyorum..?