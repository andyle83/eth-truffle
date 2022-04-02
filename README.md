## Testing step

1. Deploy contract
- Develop console: `truffle develop`
- Compile contract: `truffle compile`
- Deploy contract to local network: `truffle migrate`

2. Running command
- Sending few "ether" to our deployed contract: 
   
```
Faucet.deployed().then(i => {FaucetDeployed = i})
FaucetDeployed.send(web3.utils.toWei("1", "ether"))
```

Or, another way to test:

3. Connect to Gauche
- Start Gauche UI.
- Make new workspace, and connect to project configure file `truffle-config.js`
- Make sure `truffle-config.js` has configuration match to Gauche settings
- Running `truffle migrate --network development` to compile and deploy contract
- Using Gauche account (with private key), and MetaMask to send some Ether to contract's balance
- Using Gauche UI, checking transaction is confirmed with event log