var CheeseToken = artifacts.require("contracts/CheeseToken.sol");

contract('CheeseToken', function(accounts) {
  it("should start with 10^18 wei", function() {
    return CheeseToken.deployed().then(function(instance) {
      return instance.balanceOf(accounts[0]);
    }).then(function(balance) {
      console.log(balance);
      assert.equal(balance, 10 ** 18);
    });
  });
});