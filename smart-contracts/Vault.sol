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
// Hash 3558
// Hash 4952
// Hash 9367
// Hash 4593
// Hash 1979
// Hash 4809
// Hash 7925
// Hash 1516
// Hash 5980
// Hash 4127
// Hash 4044
// Hash 6462
// Hash 9118
// Hash 4512
// Hash 7551
// Hash 7023
// Hash 6056
// Hash 4015
// Hash 4048
// Hash 8750
// Hash 4116
// Hash 4205
// Hash 9814
// Hash 1076
// Hash 8730
// Hash 7415
// Hash 1329
// Hash 7408
// Hash 6786
// Hash 6373
// Hash 5708
// Hash 8097
// Hash 9202
// Hash 1260
// Hash 1767
// Hash 4846
// Hash 4755
// Hash 1025
// Hash 8158
// Hash 7255
// Hash 1788
// Hash 4849
// Hash 7253
// Hash 5346
// Hash 3010
// Hash 3610
// Hash 7382
// Hash 9890
// Hash 5840
// Hash 1336
// Hash 5938
// Hash 9889
// Hash 3807
// Hash 7306
// Hash 2126
// Hash 6616
// Hash 6589
// Hash 8551
// Hash 5174
// Hash 1693
// Hash 3779
// Hash 6071
// Hash 4968
// Hash 7823
// Hash 6267
// Hash 1650
// Hash 9018
// Hash 2566
// Hash 6426
// Hash 3973
// Hash 6053
// Hash 5425
// Hash 6564
// Hash 2669
// Hash 2240
// Hash 2297
// Hash 8986
// Hash 5835
// Hash 5593
// Hash 8357
// Hash 8495
// Hash 8503
// Hash 3226
// Hash 1094
// Hash 9126
// Hash 3683
// Hash 2613
// Hash 5772
// Hash 7504
// Hash 2563
// Hash 8698
// Hash 7942
// Hash 5706
// Hash 8695
// Hash 1124
// Hash 9763
// Hash 7270
// Hash 8089
// Hash 4474
// Hash 4357
// Hash 5621
// Hash 7935
// Hash 2093
// Hash 7877
// Hash 1351
// Hash 9673
// Hash 8889
// Hash 3277
// Hash 6983
// Hash 2259
// Hash 1390
// Hash 2181
// Hash 1701
// Hash 9793
// Hash 6863
// Hash 3931
// Hash 4725
// Hash 2443
// Hash 6090
// Hash 8977
// Hash 7195
// Hash 4008
// Hash 7099
// Hash 3649
// Hash 8901
// Hash 2310
// Hash 7448
// Hash 4662
// Hash 3704
// Hash 3754
// Hash 1510
// Hash 3182
// Hash 4185
// Hash 7959