pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

// KaseiCoinCrowdsale contract inherits the following OpenZeppelin contracts:
// * Crowdsale - Basic functionality for managing a token crowdsale, allowing users to purchase tokens with ETH
// * MintedCrowdsale - Allows tokens to be minted when they are purchased in the crowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale {
    
    // Constructor for KaseiCoinCrowdsale
    // Parameters:
    // - `rate` determines the conversion rate from ETH to KaseiCoin (e.g., 1 ETH = X KaseiCoin)
    // - `wallet` is the address that will receive all the ETH collected during the crowdsale
    // - `token` is the instance of the KaseiCoin token that will be sold during the crowdsale
    constructor(
        uint256 rate,           // Rate at which ETH is exchanged for tokens
        address payable wallet, // Wallet to collect the raised ETH
        KaseiCoin token         // Token being sold
    ) public Crowdsale(rate, wallet, token) {
        // The constructor is intentionally left empty because the deployment logic is handled by the KaseiCoinCrowdsaleDeployer.sol file.
    }
}