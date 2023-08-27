//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract Deploy is Script {
    uint256 public constant _initialSupply = 1000 ether;
    function run() external returns(OurToken){
        vm.startBroadcast();
        OurToken ot=new OurToken(_initialSupply);
        vm.stopBroadcast();
        return ot;
    }
}

//0x5fbdb2315678afecb367f032d93f642f64180aa3