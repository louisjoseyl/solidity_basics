// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;// solidity versions

contract SimpleStorage {
    //favoriteNumber gets initialisedd to 0
    uint256 public myFavNum;

    struct Person {
        uint256 favNum;
        string name;
    }

    Person[] public listOfPeople;//[]

    mapping(string => uint256) public nameToFavNum;
     
    function store(uint256 _favNum)  public {
        myFavNum = _favNum;
    }

    function retrieve() public view returns (uint256) {
        return myFavNum;
    }

    function addPerson(string memory _name, uint256 _favNum) public {
        listOfPeople.push(Person(_favNum,_name));
        nameToFavNum[_name] = _favNum;
    }

}
