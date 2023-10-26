from cmath import pi
import math
from pickletools import float8
from tokenize import Double
from xml.etree.ElementInclude import include

radius = float(input("Lütfen Dairenin Yarıçapını Giriniz: "))

# Kullanıcıdan yarıçap bilgisi alınır.

area = pi * radius * radius

# Dairenin alanı hesaplanır.

circumference = 2 * pi * radius

#Çemberin çevresi hesaplanır.


area_rounded = round(area, 2)
circumference_rounded = round(circumference, 2)

# Sounucu iki desimale yuvarlanır.

print("Dairenin Alanı: ",area_rounded,"\nDairenin Çevresi: ",circumference_rounded)
