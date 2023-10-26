number1 = int(input("Lütfen bir sayı giriniz."))
number2 = int(input("Lütfen bir sayı giriniz."))
minNumber = 0
ebob = 1



def findEbob():
    if(number1 < number2):
        minNumber = number1
    else:
        minNumber = number2

    for i in range(1,minNumber+1):
        if((number1 % i == 0) and (number2 % i == 0)):
            ebob = i
    return ebob

def findEkok():
    return number1 * number2 / findEbob()


print("girilen sayının ebobu",findEbob())

print("girilen sayının ekoku",findEkok())