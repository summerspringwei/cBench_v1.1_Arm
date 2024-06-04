# -*- coding: utf-8 -*-
"""
Created on Thu Oct  7 03:04:30 2021

@author: """
import os
import argparse
import matplotlib.pyplot as plt
import numpy as np
import json
parser = argparse.ArgumentParser()
parser.add_argument('--file')
parser.add_argument('--database')
args = parser.parse_args()

with open("cBench.json",'r') as f:
    benchmark_cmd=json.load(f)
benchmarks=[]
y1=[]
y2=[]
for item in benchmark_cmd:
    benchmark=item[0]
    benchmarks.append(benchmark)
    file1=os.path.join(os.getcwd(),benchmark,'src_work','a.phaseorder.json')
    file2=os.path.join(os.getcwd(),benchmark,'src_work','a.final_cfg.json')
    if not os.path.isfile(file1):
        print(benchmark,": no phaseorder")
        continue
    elif not os.path.isfile(file2):
        print(benchmark,": no final_cfg")
        continue
    else:
        with open(file1, 'r') as f:
            cfg=json.load(f)
            p1=cfg['relative performance']

        with open(file2, 'r') as f:
            cfg=json.load(f)
            p2=cfg['relative performance']

        y1.append(p1)
        print(benchmark,'phaseorder relative performance',p1)
        y2.append(p2)
        print(benchmark,'final_cfg relative performance',p2)


print(len(benchmarks))  
x = np.arange(len(benchmarks))  # the label locations
width = 0.35  # the width of the bars
fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, np.array(y1), width, label='phase order')
rects2 = ax.bar(x + width/2, np.array(y2), width, label='phase order + pass args')
ax.set_ylabel('speedup over -O3')
#ax.set_title('benchmarks')
ax.set_xticks(x)
ax.set_xticklabels(benchmarks)
ax.legend()
for tick in ax.get_xticklabels():
    tick.set_rotation(90)
#ax.bar_label(rects1, padding=3)
#ax.bar_label(rects2, padding=3)
print(np.mean(y1),np.mean(y2))
fig.tight_layout()
plt.show()
