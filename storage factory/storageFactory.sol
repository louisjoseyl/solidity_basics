// SPDX-License-identifier: MIT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./simpleStorage.sol";

contract StorageFactory {
    //uint256 public favNum
    //type visibility 
    SimpleStorage public simpleStorage;
    
    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }

}

