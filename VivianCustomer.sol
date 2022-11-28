pragma solidity ^0.5.0;

contract Shop{
    address payable my_account = msg.sender;
    string public shop = "SD_Shop";
    uint public password = 1234;
    bool public member = true;
    bool public initial = true;
    mapping(address => uint) balances;

    //=====================================
    function balance() public view returns(uint)
    {
        return balances[msg.sender];
    }

    function transfer(address shop_owner, uint value) public
    {
        balances[msg.sender] -= value;
        balances[shop_owner] += value;
    }

    function purchase() public payable
    {
        uint amount = msg.value;
        balances[msg.sender] += amount;
        my_account.transfer(msg.value);
    }

    function GET_WEI(address recipient, uint value) public
    {
        if (initial)
        {
            balances[recipient] += value;
            initial = false;
        }
        else
        {
            require(true, "only at the initial stage can add values");
        }
    }
    function AuthorizationCode(uint value) public payable
    {
        if (value == password)
        {
            initial = true;
        }
    }
    
}