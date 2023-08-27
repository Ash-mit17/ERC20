//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ManualToken{

    mapping(address=>uint256) private _sbalances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function decimals() public pure returns (uint8){
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256){
        return _sbalances[_owner];
    }

    function transfer(address _to,uint256 _amount) public {
        uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
        _sbalances[msg.sender]-=_amount;
        _sbalances[_to]+=_amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalance);
    }
}