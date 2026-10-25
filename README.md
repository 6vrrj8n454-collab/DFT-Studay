DFT Scan Chain 基础实现 (Verilog)

## 项目简介
本项目使用纯 Verilog 从零实现了 DFT（可测试性设计）的基础单元：扫描触发器（SDFF）以及 2 位扫描链（Scan Chain），并完成了全周期的仿真验证。

## 包含模块
1."sdf.v"：带多路选择器的扫描触发器（Scan D Flip-Flop）。
2."scan_chain_2bit.v"：由两个 SDFF 串联构成的最短扫描链。
3."tb.v"：模拟了完整的 Shift-in -> Capture -> Shift-out 测试周期。

## 仿真结果
- 成功验证了功能模式（se=0）与扫描模式（se=1）的切换。
- 成功移入测试向量并捕获功能逻辑结果。
- 波形图：<img width="1899" height="927" alt="{DD15A06C-0599-4548-BA3F-E092B886015F}" src="https://github.com/user-attachments/assets/7331f0f7-e8e8-4ed8-8a22-00ad86b17443" />


## 工具
- EDA Playground (Icarus Verilog)
