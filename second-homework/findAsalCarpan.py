def findPrimeNumber(number):
    if(number > 1):
        for i in range(2,number):
            if(number % i == 0):
                break
        else:
            return number
        
num = int(input("sayı giriniz: "))
asalCarpan = []

for i in range(2,num+1):
    if(num % i == 0):
        if(findPrimeNumber(i) != None):
            asalCarpan.append(i)
print(f"Girilen sayının asal çarpanları: {asalCarpan}")