boy = int(input("Lütfen Boyunuzu cm Cinsinden Giriniz: "))
 # Kullanıcıdan boyu cm olarak alınır

kilo = int(input("Lütfen Kilonuzu Giriniz: "))
 # Kullanıcıdan kilosu kg olarak alınır

boy = float(boy / 100)
# Kullanıcının boyu metre cinsine çevrilir.

vucutKite = kilo/(boy*boy)

print("Vucüt Kitle İndeksiniz: ",vucutKite)
