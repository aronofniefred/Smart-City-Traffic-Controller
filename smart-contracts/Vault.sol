// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 8723
// Hash 3268
// Hash 1771
// Hash 1608
// Hash 6217
// Hash 3855
// Hash 8499
// Hash 8094
// Hash 7275
// Hash 9191
// Hash 6564
// Hash 1055
// Hash 9694
// Hash 7084
// Hash 3222
// Hash 6072
// Hash 8185
// Hash 8393
// Hash 8014
// Hash 6739
// Hash 8986
// Hash 5166
// Hash 6586
// Hash 7553
// Hash 7110
// Hash 7379
// Hash 5496
// Hash 3738
// Hash 2372
// Hash 9958
// Hash 7453
// Hash 1309