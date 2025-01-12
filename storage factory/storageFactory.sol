// SPDX-License-identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./simpleStorage.sol";

contract StorageFactory {
    //uint256 public favNum
    //type visibility 
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        listOfSimpleStorageContracts.push(new SimpleStorage());
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }

    function sfAddPerson(string memory _name, uint256 _favNum, uint _simpleStorageIndex) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].addPerson(_name,_favNum);
    }
    function sfGetAddedPersons(uint256 _simpleStorageIndex) public view returns(string memory){
    return listOfSimpleStorageContracts[_simpleStorageIndex].listOfPeople;
    }
}
 
