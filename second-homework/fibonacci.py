firstNumber = 1
secondNumber = 1
dizi = [firstNumber, secondNumber]
index = 20

while index > 0:
    newNumber = firstNumber + secondNumber
    firstNumber = secondNumber
    secondNumber = newNumber
    dizi.append(newNumber)
    index -=1
print(dizi)

dizi2 = [1,1]
firstNumber=1
secondNumber=1

for i in range(20):
    newNumber = firstNumber + secondNumber
    firstNumber = secondNumber
    secondNumber = newNumber
    dizi2.append(newNumber)
print(dizi2)