// Import the required libraries
const Web3 = require('web3');
const fs = require('fs');
const path = require('path');

// Load the contract ABI from the JSON file
const contractABI = JSON.parse(fs.readFileSync(path.resolve(__dirname, './KaseiCoinABI.json'), 'utf8'));

// Specify the contract address (update this if the contract is redeployed)
const contractAddress = '0xf3fb60bceee5d99b099ae5c7e8e269e698161148';

// Connect to the local blockchain using Web3 and Ganache
const web3 = new Web3('HTTP://127.0.0.1:7545');

// Define a list of customers and their respective Ethereum addresses
const customers = {
    "customer_1": "0xf346CF4478a8F2881a59ABa561376272dDd3B653",
    "customer_2": "0xb7472e5c388899d8658f1c875E17236e71e1B712",
    "customer_3": "0x26d3BE454f99b32126ac0DA355f7aa98F2A8de52",
    "customer_4": "0x3d0077F4fE0Ea5152aC723fB046b814C61f1a529",
    "customer_5": "0xf1b5d7a29138462f6076f341b9987ae2D0B4FA66"
};

// Define an asynchronous function to mint tokens for each customer
async function mintTokens() {
    // Get the list of accounts from the connected Ethereum node (Ganache)
    const accounts = await web3.eth.getAccounts();
    const account = accounts[0]; // Use the first account as the sender

    // Create a new contract instance with the ABI and contract address
    const contract = new web3.eth.Contract(contractABI, contractAddress);

    // Loop through the list of customers to mint tokens for each one
    for (let customer in customers) {
        const address = customers[customer];
        try {
            // Mint 100 tokens (converted to Wei) to the customer's address
            await contract.methods.mint(address, web3.utils.toWei('100')).send({ from: account });
            console.log(`Minted tokens for ${customer} (${address})`);
        } catch (error) {
            // Log any errors that occur during the minting process
            console.error(`Failed to mint tokens for ${customer} (${address}): ${error.message}`);
        }
    }
}

// Execute the mintTokens function and handle any errors
mintTokens().then(() => console.log('Token minting process completed.')).catch(console.error);