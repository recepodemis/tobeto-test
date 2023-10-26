sayi = int(input("Lütfen bir sayı giriniz."))
sum = 0

for i in range(1,sayi):
    if(sayi % i == 0):
        sum += i
if(sum == sayi):
    print("Girdiğiniz sayı mükemmel bir sayıdır. ")
else:
    print("Girdiğiniz sayı mükemmel bir sayı değildir. ")