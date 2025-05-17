# Calculator
## Overview 🪙
A calculator with standard arithmetic functions (addition, subtraction, multiplication, and division), developed and tested at Foundry.
## Features 📃
* Functions -> Simple arithmetic functions (addition, subtraction, multiplication and division).
* Testing Functions -> Functions to verify the correct operation of all smart contract code.
* Access control -> Only the admin of the smart contract can perform divisions.
## Technical details ⚙️
* Framework CLI -> Foundry.
* Forge version -> 1.1.0-stable.
* Compiler version -> 0.8.24.
## Deploying the contract 🛠️
1. Clone the GitHub repository.
2. Open Visual Studio Code (you should already have Foundry installed).
3. Select "File" > "Open Folder", select the cloned repository folder.
4. In the project navigation bar, open the "calculator.sol" file located in the "src" folder.
5. In the toolbar above, select "Terminal" > "New Terminal".
6. Select the "Git bash" terminal (previously installed).
7. Run the `forge build` command to compile the script.
8. In the project navigation bar, open the "calculator.t.sol" file located in the "test" folder.
9. Run the `forge build` command to compile the script.
10. Run the command `forge test --match-test` followed by the name of a test function to test it and verify the smart contract functions are working correctly. For example, run `forge test --match-test testCheckFirstResult` to test the `testCheckFirstResult` function.
11. Run `forge coverage` to generate a code coverage report, which allows you to verify which parts of the "calculator.sol" script code (in the "src" folder) are executed by the tests. This helps identify areas outside the coverage that could be exposed to errors/vulnerabilities.
## Functions 💻
* `Addition` -> Perform the addition between two numbers.
* `Subtraction` -> Perform the subtraction between two numbers.
* `Multiplier` -> Perform the multiplication between two numbers.
* `Division` -> Perform the division between two numbers.
## Testing functions (Unit testing) ⌨️
* `testCheckFirstResult` -> Verify that the result of the arithmetic function in the smart contract is equal to a defined value.
* `testAddition` -> Verify that the addition in the smart contract works correctly.
* `testSubstraction` -> Verify that subtraction in the smart contract works correctly.
* `testMultiplier` -> Verify that multiplier in the smart contract works correctly.
* `testCanNotMultiply2LargeNumbers` -> Verify that when multiplying 2 very large numbers the contract is reversed because a result greater than n^256 is obtained.
* `testIfNotAdminCallsDivisionReverts` -> Verify that if the admin address does not execute the division operation, then the smart contract is reversed.
* `testAdminCanCallDivisionCorrectly` -> Verify that the admin address executes the division.
* `testAdminCanNotCallDivisionCorrectly` -> Verify that the admin cannot perform the division operation.
* `testDefaultExecutesCorretly` -> Verify that the admin was able to execute the division operation and it was performed correctly.
* `testCanNotDivideByZero` -> Verify that when there is a division by 0 the smart contract ends the function and returns 0.
## Testing functions (Fuzzzing testing) 🎲
* `testFuzzingDivision` -> Verify that the division function runs correctly, using the admin address and using random numbers in the variables firstNumber_ and secondNumber_ to implement the tests.

CODE IS LAW!
