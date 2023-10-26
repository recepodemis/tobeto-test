num = int(input("Lütfen Bir Sayı Giriniz: "))
#   Kullanıcıdan bir sayı alınır.

num_cpy = num
#   Girilen sayı üzerinde işlem yapmamak için başka bir değişkene atıldı.

decimal = 1
#   Sayının kaç basamaklı olduğunu belirlemek için kullanılır.

revNum= 0
#   Sayıyı Tersine çevirerek doğruluğunu kontrol etmek için kullanılır.

while int(num_cpy / 10) > 0:
    num_cpy = num_cpy / 10
    decimal = decimal + 1
#   Sayının kaç basamaklı olduğunu tespit etmek için sayıyı 10'a bölme işlemi yapıldı.

num_cpy = num
#   Atama işlemi tekrardan yapıldı.

while decimal > 0:
    revNum += ((num_cpy % 10) * pow(10,(decimal-1)))
    num_cpy = num_cpy // 10
    decimal -= 1
#   Girilen sayının sondaki değeri, sayının en büyük basamak değeriyle çarpılarak sayı tersine çevrildi.


if (revNum == num):
    print("Girdiğiniz Sayı Bir Polindrom Sayıdır.")
else:
    print("Girdiğiniz Sayı Bir Polindrom Sayı Değildir.")
    
#Girilen sayının polindrom olup olmadığı kontrol edild.