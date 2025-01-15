//Get funds from users
// Withdraw funds 
//Set a minimum funding value in USD


//SPDX-Lincense-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./priceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public  minUsd = 5e18;

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable  {
        //allow users to send usd
        //have a minimum usd sent
        //1.How do we send eth to this contract?
        require(msg.value.getConversionRate() >= minUsd, "didn't send enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    }

    //function withdraw(params) {}

}