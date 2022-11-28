pragma solidity ^0.5.0;

import "./VivianTokenMintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract VivianTokenCrowdsale is Crowdsale, MintedCrowdsale
{
    constructor(
        uint rate,
        address payable wallet,
        VivianCouponToken token
    )
        Crowdsale(rate, wallet, token)
        public
        {
            //empty
        }
}

contract VivianTokenCrowdsaleDeployer
{
    address public Vivian_token_address;
    address public Vivian_crowdsale_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
    )
        public
        {
            VivianCouponToken token = new VivianCouponToken(name, symbol, 0);
            Vivian_token_address = address(token);

            VivianTokenCrowdsale Vivian_crowdsale = new VivianTokenCrowdsale(1, wallet, token);
            Vivian_crowdsale_address = address(Vivian_crowdsale); 
        }
}