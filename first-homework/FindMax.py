num1 = int(input("Lütfen Birinci Sayınızı Giriniz: "))
# Kullanıcıdan ilk sayı alınır.

num2 = int(input("Lütfen İkinci Sayınızı Giriniz: "))
# Kullanıcıdan ikinci sayı alınır.

num3 = int(input("Lütfen Üçündü Sayınızı Giriniz: "))
# Kullanıcıdan üçüncü sayı alınır.

if(num1 > num2):
    if(num1 > num3):
        print("Girilen En Büyük Sayı: ",num1)
    else:
        print("Girilen En Büyük Sayı: ",num3)
else:
    if(num2 > num3):
        print("Girilen En Büyük Sayı: ",num2)
    else:
        print("Girilen En Büyük Sayı: ",num3)
