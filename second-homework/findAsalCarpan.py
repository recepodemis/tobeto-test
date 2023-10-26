def findPrimeNumber(number):
    if(number > 1):
        for i in range(2,number):
            if(number % i == 0):
                break
        else:
            return number
        
num = int(input("sayı giriniz: "))
dizi = []
for i in range(2,num):
    if(num % i == 0):
        if(findPrimeNumber(i) != None):
            dizi.append(i)
print(dizi)