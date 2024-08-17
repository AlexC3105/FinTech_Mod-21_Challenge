pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "./KaseiCoinCrowdsale.sol";

// The KaseiCoinCrowdsaleDeployer contract handles the deployment of the KaseiCoin token
// and the KaseiCoinCrowdsale, linking them together.
contract KaseiCoinCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address` to store the address of the KaseiCoin token contract.
    address public kasei_token_address;
    
    // Create an `address public` variable called `kasei_crowdsale_address` to store the address of the KaseiCoinCrowdsale contract.
    address public kasei_crowdsale_address;

    // Constructor for KaseiCoinCrowdsaleDeployer
    // Parameters:
    // - `name`: The name of the KaseiCoin token (e.g., "KaseiCoin")
    // - `symbol`: The symbol of the KaseiCoin token (e.g., "KAI")
    // - `wallet`: The address where collected funds will be sent during the crowdsale
    constructor(
        string memory name,       // Name of the KaseiCoin token
        string memory symbol,     // Symbol of the KaseiCoin token
        address payable wallet    // Address where collected funds will be sent
    ) public {
        // Create a new instance of the KaseiCoin token contract, passing the name and symbol.
        // Set the initial supply to 0 since tokens will be minted during the crowdsale.
        KaseiCoin token = new KaseiCoin(name, symbol, 0);
        
        // Store the KaseiCoin token contract's address in the `kasei_token_address` variable.
        kasei_token_address = address(token);

        // Create a new instance of the KaseiCoinCrowdsale contract with a rate of 1,
        // passing the wallet to collect funds and the token to be sold.
        KaseiCoinCrowdsale crowdsale = new KaseiCoinCrowdsale(1, wallet, token);
            
        // Store the KaseiCoinCrowdsale contract's address in the `kasei_crowdsale_address` variable.
        kasei_crowdsale_address = address(crowdsale);

        // Set the KaseiCoinCrowdsale contract as a minter for the KaseiCoin token.
        token.addMinter(kasei_crowdsale_address);
        
        // The deployer contract renounces its minter role, so it no longer has permission to mint tokens.
        token.renounceMinter();
    }
}