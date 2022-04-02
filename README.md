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