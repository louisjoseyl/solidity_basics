// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
     function getPrice() internal  view returns(uint256){
        // Address: 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910
        //ABI 
        AggregatorV3Interface priceFeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        //Price of Eth in terms of USD
        // price has 8 decimal place 2000.00000000

        return uint256(price) * 1e10;
    }
    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        //1 ETH?
        // 200.00000000000000000
        uint256 ethPrice = getPrice();
        // (200.00000000000000000 * 11.00000000000000000)/1E18
        // $2000 = 1 ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;
        return ethAmountInUsd;

    }
    function getVersion() internal view returns(uint256){

        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}