const assert = require('assert')
const Manager = require('./manager')
const Employee = require('./employee')
const Util = require('./util')

const GENDER =  {
    male: 'male',
    female: 'female'
}

{
    const employee = new Employee({
        name: "Thais Chupetinha",
        gender: GENDER.female
    })

    assert.throws(() => {
        employee.birthYear, {
            message: 'You must define age first!!!'
        }
    })
}

// Mocking year in system.

const CURRENT_YEAR = 2021
Date.prototype.getFullYear = () => CURRENT_YEAR

{
    const employee = new Employee({
        name: "Lucas Tavares",
        age: 26,
        gender: GENDER.male
    })


    assert.deepStrictEqual(employee.name, "Mr. Lucas Tavares")
    assert.deepStrictEqual(employee.age, undefined)
    assert.deepStrictEqual(employee.gender, undefined)
    assert.notDeepStrictEqual(employee.grossPay, undefined, 'GrossPay should not be undefined')
    assert.deepStrictEqual(employee.grossPay, Util.formatCurrency(5000.40))
    assert.notDeepStrictEqual(employee.netPay, undefined, 'NetPay should not be undefined')
    assert.deepStrictEqual(employee.netPay, Util.formatCurrency(4000.32))

    const expectedBirthYear = 1995
    assert.deepStrictEqual(employee.birthYear, expectedBirthYear)
}

{
    const manager = new Manager({
        name: 'Francisco Gilberto',
        age: 50,
        gender: GENDER.male
    })

    assert.deepStrictEqual(manager.name, "Mr. Francisco Gilberto")
    assert.deepStrictEqual(manager.age, undefined)
    assert.deepStrictEqual(manager.gender, undefined)
    assert.deepStrictEqual(manager.grossPay, Util.formatCurrency(5000.40))
    assert.deepStrictEqual(manager.bonuses, Util.formatCurrency(2000))
    assert.deepStrictEqual(manager.netPay, Util.formatCurrency(6000.32))
}