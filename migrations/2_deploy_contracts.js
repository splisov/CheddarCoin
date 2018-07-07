var CheeseToken = artifacts.require("../contracts/CheeseToken.sol");

module.exports = function(deployer) {
  deployer.deploy(CheeseToken);
}