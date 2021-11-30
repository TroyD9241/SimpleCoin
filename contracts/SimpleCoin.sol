pragma solidity >=0.5.0 <0.7.0;

contract SimpleCoin {
    address public minter;

    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1600);
        balances[receiver] += amount
    }

    function send(address received, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient Balance");
        balances[msg.sender] -= amount;
        balances[msg.sender] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

    function balances(address _account) external view returns (uint) {
        return balances[_account];
    }
}
