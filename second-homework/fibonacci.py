firstNumber = 1
secondNumber = 1
fibonacci = [firstNumber, secondNumber]
index = 20

while index > 0:
    newNumber = firstNumber + secondNumber
    firstNumber = secondNumber
    secondNumber = newNumber
    fibonacci.append(newNumber)
    index -=1
print(f"fibonacci dizisi: {fibonacci}")

