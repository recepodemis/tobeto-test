number = int(input("Lütfen bir sayı giriniz."))

if(number > 1):
    for i in range(2,number):
        if(number % i == 0):
            print("Girilen sayı asal değil.")
            break
    else:
        print("Girilen sayı asaldır. ")
else:
    print("Girilen sayı asal değildir. ")
