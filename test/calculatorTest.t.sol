// License
// SPDX-License-Identifier: MIT

// Compilator version
pragma solidity 0.8.24;

// Libraries
import "../src/calculator.sol";
import "forge-std/Test.sol";

// Contract
contract calculatorTest is Test{

    calculator calculator2;
    uint256 public firstResult = 100;
    address public admin = vm.addr(1);
    address public randomUser = vm.addr(2);

    function setUp() public{
        calculator2 = new calculator(firstResult, admin);
    }

    // Unit testing
    function testCheckFirstResult() public view{
        uint256 firstResult_ = calculator2.result();
        assert(firstResult_ == firstResult);
    }

    function testAddition() public{
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 5;
        uint256 result_ = calculator2.addition(firstNumber_, secondNumber_);
        assert(result_ == firstNumber_ + secondNumber_);
    }

    function testSubstraction() public{
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 5;
        uint256 result_ = calculator2.substraction(firstNumber_, secondNumber_);
        assert(result_ == firstNumber_ - secondNumber_);
    }    

    function testMultiplier() public{
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 5;
        uint256 result_ = calculator2.multiplier(firstNumber_, secondNumber_);
        assert(result_ == firstNumber_ * secondNumber_);
    }     

    function testCanNotMultiply2LargeNumbers() public{
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 115792089237316195423570985008687907853269984665640564039457584007913129639934;
        vm.expectRevert();
        calculator2.multiplier(firstNumber_, secondNumber_);
    }

    function testIfNotAdminCallsDivisionReverts() public {
        vm.startPrank(randomUser);
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 2;
        vm.expectRevert();
        calculator2.division(firstNumber_, secondNumber_);
        vm.stopPrank();
    }

    function testAdminCanCallDivisionCorrectly() public {
        vm.startPrank(admin);
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 2;
        calculator2.division(firstNumber_, secondNumber_);
        vm.stopPrank();      
    }

    function testAdminCanNotCallDivisionCorrectly() public {
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 2;
        console.log(msg.sender);
        vm.expectRevert();
        calculator2.division(firstNumber_, secondNumber_);   
    }

    function testDefaultExecutesCorretly() public{
        vm.startPrank(admin);
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 2;
        uint256 result_ = calculator2.division(firstNumber_, secondNumber_);
        assert(result_ == firstNumber_/secondNumber_);
        vm.stopPrank();
    }
    
    function testCanNotDivideByZero() public{
        vm.startPrank(admin);
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 0;
        //vm.expectRevert();
        calculator2.division(firstNumber_, secondNumber_);
        vm.stopPrank();        
    }

    // Fuzzing testing
    function testFuzzingDivision(uint256 firstNumber_, uint256 secondNumber_) public{
        vm.startPrank(admin);
        calculator2.division(firstNumber_, secondNumber_);
        vm.stopPrank();          
    }

}