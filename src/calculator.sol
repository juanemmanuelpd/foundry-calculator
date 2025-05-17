// License
// SPDX-License-Identifier: MIT

// Compiler version
pragma solidity 0.8.24;

contract calculator{

    // Variables
    uint256 public result;
    address public admin;

    // Events
    event e_addition(uint256 firstNumber_, uint256 secondNumber_, uint256 result_);
    event e_substraction(uint256 firstNumber_, uint256 secondNumber_, uint256 result_);
    event e_multiplier(uint256 firstNumber_, uint256 secondNumber_, uint256 result_);
    event e_division(uint256 firstNumnber_, uint256 secondNumber_, uint256 result_);

    // Modifier
    modifier onlyAdmin(){
        require(msg.sender == admin, "Not allowed");
        _;
    }

    // Constructor
    constructor(uint256 firstResult_, address admin_){
        result = firstResult_;
        admin = admin_;
    }

    // Functions
    function addition(uint256 firstNumber_, uint256 secondNumber_) external returns(uint256 result_) {  
        result_ = firstNumber_ + secondNumber_;
        result = result_;
        emit e_addition(firstNumber_, secondNumber_, result_);
    }
    
    function substraction(uint256 firstNumber_, uint256 secondNumber_) external returns(uint256 result_) {  
        result_ = firstNumber_ - secondNumber_;
        result = result_;
        emit e_substraction(firstNumber_, secondNumber_, result_);
    }    

    function multiplier(uint256 firstNumber_, uint256 secondNumber_) external returns(uint256 result_) {  
        result_ = firstNumber_ * secondNumber_;
        result = result_;
        emit e_multiplier(firstNumber_, secondNumber_, result_);
    }    

    function division(uint256 firstNumber_, uint256 secondNumber_) external onlyAdmin returns (uint256 result_){
        if(secondNumber_ == 0) return 0;
        result_ = firstNumber_ / secondNumber_;
        result = result_;
        emit e_division(firstNumber_, secondNumber_, result_);
    }

}