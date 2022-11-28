pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";

contract VivianCoupon is ERC20, ERC20Detailed
{
    address payable owner;
    string public passcode;
    bool access;

    constructor(uint initial_supply) ERC20Detailed("Shop", "VCT", 18) public
    {
        owner = msg.sender;
        _mint(owner, initial_supply);
    }

    function mint(address recipient, uint amount) public onlyOwner
    {
        _mint(recipient, amount);
    }

    function getAdditional(address recipient, uint amount) public authorizedUser
    {
        _mint(recipient, amount);
    }

    //if the user input wrong passcode, then the user won't get initial money
    modifier onlyOwner
    {
        require(msg.sender == owner, "You do not have permission");
        _;
    }

    modifier authorizedUser
    {
        require(access, "You need to input the right passcode");
        _;
    }

}