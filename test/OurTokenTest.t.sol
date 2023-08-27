//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {Deploy} from "../script/Deploy.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test{

    OurToken public ourToken;
    Deploy public deployer;

    //address to interact with people
    address _bob = makeAddr("bob");
    address _alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public{
        deployer = new Deploy();
        ourToken = deployer.run();

        vm.prank(msg.sender);//owner of the contract
        ourToken.transfer(_bob,STARTING_BALANCE);
    }

    function testBobBalance() public{
        assertEq(STARTING_BALANCE, ourToken.balanceOf(_bob));
    }

    function testAllowances() public{
        uint256 initialAllowance = 1000;

        //Bob approves Alice to spend tokens on her behalf
        vm.prank(_bob);
        ourToken.approve(_alice,initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(_alice);
        ourToken.transferFrom(_bob,_alice,transferAmount);

        assertEq(ourToken.balanceOf(_alice),transferAmount);
        assertEq(ourToken.balanceOf(_bob),STARTING_BALANCE-transferAmount);
    }
}