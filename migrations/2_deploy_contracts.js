var CheddarCoin = artifacts.require("../contracts/CheddarCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(CheddarCoin);
}