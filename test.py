# -*- coding: utf-8 -*-
"""
Created on Thu Oct  7 03:04:30 2021

@author: 赵嘉宇
"""
import os
import argparse
import subprocess
import json
import time
from math import inf
parser = argparse.ArgumentParser()
parser.add_argument('--file')
parser.add_argument('--database')
args = parser.parse_args()

#benchmark_cmd={}
#with open("cBench.txt",'r') as f:
#    x=f.read().split('\n')
#for item in x:
#    info=item.split(' ')
#    benchmark=info[0]
#    cmd=info[1:]
#    benchmark_cmd[benchmark]=' '.join(cmd)
#
#with open("cBench.json",'w') as f:
#    f.write(json.dumps(benchmark_cmd,indent=8))

with open("cBench.json",'r') as f:
    benchmark_cmd=json.load(f)

#def measure_CmdTime(cmd,cwd=None,timeout=100):#cmd should be string
#    t0=time.time()
#    try:
#        ret=subprocess.run(cmd,capture_output=True,shell=True,cwd=cwd,timeout=timeout)
#        if ret.returncode == 0:
#            task_time=time.time()-t0
#        else:
#            print('cmd failed: ',cmd)
#            task_time=inf
#    except subprocess.TimeoutExpired:
#        print('subprocess.TimeoutExpired: ',cmd)
#        task_time=inf
#    return task_time
#
#benchmark_compile_run=[]
#for item in benchmark_cmd:
#    benchmark=item[0]
#    cmd=item[1]
#    run_cmd=item[2]
#    if benchmark in ['consumer_mad','office_ghostscript','office_ispell','security_pgp_d','security_pgp_e']:
#        continue
#    here = os.path.dirname(os.path.abspath(__file__))
#    cwd=os.path.join(here,benchmark,'src_work')
#    ret=subprocess.run(cmd, shell=True, cwd=cwd,capture_output=True)#,stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
#    if ret.returncode == 0:
#        cost=measure_CmdTime(run_cmd,cwd=cwd)
#        iterations=int(2/cost*int(run_cmd.split(' ')[-1]))
#        print(benchmark,cost,int(run_cmd.split(' ')[-1]),iterations)
#        run_cmd='./__run 1 {}'.format(iterations)
#        benchmark_compile_run.append([benchmark,cmd,run_cmd])
#    else:
#        print(benchmark,"error",cwd,cmd)
#    
#with open("cBench.json",'w') as f:
#    f.write(json.dumps(benchmark_compile_run,indent=8))


for item in benchmark_cmd:
    benchmark=item[0]
    ccmd=item[1]
    rcmd=item[2]
    here = os.path.dirname(os.path.abspath(__file__))
    cwd=os.path.join(here,benchmark,'src_work')
    print('+'*30)
    print(benchmark)
    subprocess.run("llvmtuner --run --ccmd='{}' --rcmd='{}' --stop-after=5".format(ccmd,rcmd), shell=True, cwd=cwd)
    