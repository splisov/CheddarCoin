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

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
    public
    returns (bool)
    {
        //check if divisible
        require(_value >= 1000, "Value too low, use over 1000 weis");
        //get cuts
        uint investorCut = (_value * investorRate) / 100;
        uint buyerCut = _value - investorCut;
        // Transfer to investors
        super.transferFrom(_from, investors, investorCut);
        // Transfer to buyer of cheeseToken
        super.transferFrom(_from, _to, buyerCut);        
    }
}