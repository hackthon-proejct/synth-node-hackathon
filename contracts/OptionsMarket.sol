
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import { SafeMath } from "./@openzeppelin/contracts/utils/math/SafeMath.sol";
import { IERC20 } from "./@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract OptionsMarket {
    //Overflow safe operators
    using SafeMath for uint;
    IERC20 depositToken;
    IERC20 optionToken;
    uint256 internal constant PRECISION = 10 ** 18;
    
    address payable contractAddr;
    
    //Options stored in arrays of structs
    // Our options are ma
    struct option {
        uint strike; //Price in USD (18 decimal places) option allows buyer to purchase tokens at
        uint premium; //Fee in contract token that option writer charges
        uint expiry; //Unix timestamp of expiration time
        uint amount; //Amount of tokens the option contract is for
        bool exercised; //Has option been exercised
        bool canceled; //Has option been canceled
        uint id; //Unique ID of option, also array index
        

    }
    constructor (
        IERC20 _depositToken,
        IERC20 _optionToken,
        address payable _contractAddr
    ) public {
        depositToken = _depositToken;
        optionToken = _optionToken;
        //ETH/USD Kovan feed
        // ethFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        //LINK/USD Kovan feed
        // linkFeed = AggregatoV3Interface(0x396c5E36DD0a0F5a5D33dae44368D4193f69a1F0);
        //LINK token address on Kovan
        // LINK = LinkTokenInterface(0xa36085F69e2889c224210F603D836748e7dC0088);
        contractAddr = payable(address(this));

    }

}




    // option[] public ethOpts;
    // option[] public linkOpts;

    //Kovan feeds: https://docs.chain.link/docs/reference-contracts