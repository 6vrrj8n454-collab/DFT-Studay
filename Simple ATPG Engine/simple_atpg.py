def good_circuit(a, b, c):
    w = a & b
    y = w | c
    return y

def faulty_sa0(a, b, c):
    w = 0
    y = w | c
    return y

def faulty_sa1(a, b, c):
    w = 1
    y = w | c
    return y

import random

caught_sa0 = False
caught_sa1 = False

total_tests = 100
caught_vectors = []

print("--- 开始自动生成测试向量 ---")

for i in range(total_tests):
    a = random.randint(0, 1)
    b = random.randint(0, 1)
    c = random.randint(0, 1)

    y_good = good_circuit(a, b, c)
    y_sa0 = faulty_sa0(a, b, c)
    y_sa1 = faulty_sa1(a, b, c)

    if y_good != y_sa0:
        if not caught_sa0:
            print(f"检测到SA0故障! 使用的输入向量: a={a}, b={b}, c={c}")
            caught_vectors.append((a, b, c))
            caught_sa0 = True

    if y_good != y_sa1:
        if not caught_sa1:
            print(f"检测到SA1故障! 使用的输入向量: a={a}, b={b}, c={c}")
            caught_vectors.append((a, b, c))
            caught_sa1 = True

total_faults = 2
caught_faults = 0

if caught_sa0: caught_faults += 1
if caught_sa1: caught_faults += 1

coverage = (caught_faults / total_faults) * 100

print("\n--- 测试结果报告 ---")
print(f"总测试向量数: {total_tests}")
print(f"注入的总故障数: {total_faults}")
print(f"成功检测到的故障数: {caught_faults}")
print(f"最终的故障率（Fault Coverage): {coverage:.2f}%")