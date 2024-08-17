pragma solidity ^0.5.0;

// Import the following contracts from the OpenZeppelin library:
// * `ERC20` - Standard interface for ERC20 tokens
// * `ERC20Detailed` - Allows you to add details like name, symbol, and decimals to your token
// * `ERC20Mintable` - Allows the token to be minted (new tokens can be created)
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

// Define the KaseiCoin contract, inheriting from the OpenZeppelin contracts
contract KaseiCoin is ERC20, ERC20Detailed, ERC20Mintable {

    // Constructor for the KaseiCoin contract
    // This constructor will initialize the KaseiCoin token with a name, symbol, and initial supply
    // The `ERC20Detailed` constructor is called to set the name, symbol, and decimals for the token
    // The `initial_supply` is minted and assigned to the contract deployer (msg.sender)
    constructor(string memory name, string memory symbol, uint256 initial_supply)
        ERC20Detailed(name, symbol, 18)  // Passing name, symbol, and 18 decimals to the ERC20Detailed constructor
        public
    {
        // Mint the initial Kasei supply of tokens and assign them to the contract deployer
        mint(msg.sender, initial_supply);
    }
}