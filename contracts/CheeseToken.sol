pragma solidity ^0.4.21;
import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract CheeseToken is StandardToken {
    string public name = "CheeseToken"; 
    string public symbol = "CHT";
    uint public decimals = 18;
    uint public INITIAL_SUPPLY = 10000 * (10 ** decimals);
    address public investors = 1337; // Investor address
    uint public investorRate = 10;  //hundredths

    constructor () public {
        balances[msg.sender] = INITIAL_SUPPLY;
    }

    function transfer(
        address _to,
        uint256 _value
    )
    public
    returns (bool)
    {
        //check if divisible
        require(_value >= 1000, "Value too low, use 1000 or over weis");
        //get cuts
        uint investorCut = (_value * investorRate) / 100;
        uint buyerCut = _value - investorCut;
        // Transfer to investors
        super.transfer(_to, investorCut);
        // Transfer to buyer of cheeseToken
        super.transfer(_to, buyerCut);
        return true;        
    }

    function getCheese(address addr) public returns (uint){
        return balances[addr];
    }

    //CheeseToken.deployed().then(function(instance){return instance.transfer(web3.eth.accounts[1], 1000, {from: web3.eth.accounts[0]})}).then(function(instance){console.log(instance.balanceOf(web3.eth.accounts[0])); console.log(instance.balanceOf(web3.eth.accounts[1]));})
}