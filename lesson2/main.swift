//
//  main.swift
//  lesson2
//
//  Created by Natalia on 18.09.2021.
//

import Foundation

//Задание выполнила Копылова Наталья

//MARK: - Задание 1:  Реализовать функцию перевода из десятичной системы в двоичную, используя рекурсию

var binary: String = ""
func divide(number: Int) {
    let result = number / 2
    let rest = number % 2
    binary = String(rest) + binary
    if result >= 1 {
        divide(number: result)
    }
}

print("Введите число перевода из десятичной в двоичную систему")
guard let numberString = readLine(), let number = Int(numberString) else { exit(1) }
divide(number: number)

print( "равно \(binary)")
print("---------------")

//MARK: - Задание 2: Реализовать функцию возведения числа a в степень b:
//a. без рекурсии;
//b. рекурсивно;
//c. *рекурсивно, используя свойство четности степени.

//способ а.
func exp(base: Int, rank: Int) -> Int {
    var result = 1
    if rank == 0 {
        return result
    }
    for _ in 1...rank {
        result = result * base
    }
    return result
}

print("Введите число, которое хотите возвести в степень")
guard let numberAString = readLine(), let numberA = Int(numberAString) else { exit(1) }
print("Введите степень, в которую хотите возвести число")
guard let numberBString = readLine(), let numberB = Int(numberBString) else { exit(1) }

print("Результат вычисления равен: \(exp(base: numberA, rank: numberB))")
print("---------------")

//способ b.
func expRecursion(base: Int, rank: Int) -> Int {
    if rank == 0 {
        return 1
    }
    return expRecursion(base: base, rank: rank - 1) * base
}

print("Введите число, которое хотите возвести в степень")
guard let numberAbString = readLine(), let numberAb = Int(numberAbString) else { exit(1) }
print("Введите степень, в которую хотите возвести число")
guard let numberBbString = readLine(), let numberBb = Int(numberBbString) else { exit(1) }

print("Результат вычисления равен: \(expRecursion(base: numberAb, rank: numberBb))")
print("---------------")

//способ c.
func expRec2(base: Int, rank: Int) -> Int {
    if rank == 0 {
        return 1
    }
    if rank % 2 == 0 {
        return expRec2(base: base, rank: rank - 2) * base * base
    }
    return expRec2(base: base, rank: rank - 1) * base
}

print("Введите число, которое хотите возвести в степень")
guard let numberAсString = readLine(), let numberAс = Int(numberAсString) else { exit(1) }
print("Введите степень, в которую хотите возвести число")
guard let numberBсString = readLine(), let numberBс = Int(numberBсString) else { exit(1) }

print("Результат вычисления равен: \(expRec2(base: numberAс, rank: numberBс))")
print("---------------")

//MARK:- Задание 3: Исполнитель Калькулятор преобразует целое число, записанное на экране. У исполнителя две команды, каждой команде присвоен номер:
//Прибавь 1
//Умножь на 2 Первая команда увеличивает число на экране на 1, вторая увеличивает это число в 2 раза. Сколько существует программ, которые число 3 преобразуют в число 20?

let start = 3
let finish = 20

var solutions: [String] = []

func nextStep(currentValue: Int, currentSolution: String) {
    guard currentValue <= finish else { return }
    if currentValue == finish {
        let solution = "\(currentSolution) = \(finish)"
        solutions.append(solution)
        print(solution)
        return
    }
    nextStep(currentValue: currentValue + 1, currentSolution: currentSolution + " + 1")
    nextStep(currentValue: currentValue * 2,
             currentSolution: currentSolution.count > String(start).count
                ? "(\(currentSolution)) * 2"
                : "\(currentSolution) * 2")
}

nextStep(currentValue: start, currentSolution: "\(start)")
print("Всего решений: \(solutions.count)")
