maas = int(input("Lütfen Maaşınızı Giriniz: "))
#Kullanıcıdan Maaş Bilgisi Alınır.

zam = int(input("Lütfen Zam Oranını Yüzde Olarak Giriniz: "))
#Kullanıcıdan Zam Oranı Bilgisi Alınır.

maas += maas * (zam / 100)
#Zamlı Maas Hesaplandı

print("Zamnlı Maasınız: ",maas)