# -*- coding: utf-8 -*-
"""
Created on Wed Mar  2 17:49:37 2022

@author: scjzhadmin
"""
import subprocess
from fabric import Connection
from problems_ssh import Phaseorder, Tracker
import argparse
import numpy as np
parser = argparse.ArgumentParser()
parser.add_argument('--device', required=True, help='')
parser.add_argument('--method', required=True, help='')
parser.add_argument('--benchmark', required=True, help='')
parser.add_argument('--budget', type=int,default=1000, help='')
parser.add_argument('--batch-size', type=int, default=10)
args = parser.parse_args()



pass_seq='-sroa -globalopt -mem2reg -reassociate -tailcallelim -jump-threading -loop-unswitch -ipsccp -loop-idiom -instcombine -loop-unroll -loop-deletion -attributor'

'-sroa -globalopt -jump-threading -loop-unswitch -ipsccp -instcombine -loop-unroll -attributor'

llvm12_O3_seq='-ee-instrument -simplifycfg -sroa -early-cse -lower-expect -annotation2metadata -forceattrs -inferattrs -callsite-splitting -ipsccp -called-value-propagation -globalopt -mem2reg -deadargelim -instcombine -simplifycfg -prune-eh -inline -openmpopt -function-attrs -argpromotion -sroa -early-cse-memssa -speculative-execution -jump-threading -correlated-propagation -simplifycfg -aggressive-instcombine -instcombine -libcalls-shrinkwrap -pgo-memop-opt -tailcallelim -simplifycfg -reassociate -loop-simplify -lcssa -loop-rotate -licm -loop-unswitch -simplifycfg -instcombine -loop-simplify -lcssa -loop-idiom -indvars -loop-deletion -loop-unroll -sroa -mldst-motion -gvn -memcpyopt -sccp -bdce -instcombine -jump-threading -correlated-propagation -adce -dse -loop-simplify -lcssa -licm -simplifycfg -instcombine -barrier -elim-avail-extern -rpo-function-attrs -globalopt -globaldce -float2int -lower-constant-intrinsics -loop-simplify -lcssa -loop-rotate -loop-distribute -inject-tli-mappings -loop-vectorize -loop-simplify -loop-load-elim -instcombine -simplifycfg -inject-tli-mappings -slp-vectorizer -vector-combine -instcombine -loop-simplify -lcssa -loop-unroll -instcombine -loop-simplify -lcssa -licm -alignment-from-assumptions -strip-dead-prototypes -globaldce -constmerge -cg-profile -loop-simplify -lcssa -loop-sink -instsimplify -div-rem-pairs -simplifycfg -annotation-remarks'.split()
len_seq=len(llvm12_O3_seq)

llvm12_O3_passes=['-lower-expect', '-aggressive-instcombine', '-forceattrs', '-loop-unswitch', '-prune-eh', '-strip-dead-prototypes', '-argpromotion', '-ipsccp', '-div-rem-pairs', '-openmpopt', '-called-value-propagation', '-pgo-memop-opt', '-constmerge', '-libcalls-shrinkwrap', '-speculative-execution', '-loop-simplify', '-mldst-motion', '-adce', '-callsite-splitting', '-indvars', '-loop-unroll', '-dse', '-bdce', '-vector-combine', '-globaldce', '-inject-tli-mappings', '-lcssa', '-gvn', '-slp-vectorizer', '-loop-vectorize', '-lower-constant-intrinsics', '-sroa', '-early-cse-memssa', '-loop-deletion', '-deadargelim', '-licm', '-globalopt', '-mem2reg', '-jump-threading', '-correlated-propagation', '-simplifycfg', '-float2int', '-cg-profile', '-ee-instrument', '-barrier', '-function-attrs', '-reassociate', '-instcombine', '-alignment-from-assumptions', '-loop-idiom', '-early-cse', '-tailcallelim', '-loop-rotate', '-annotation-remarks', '-memcpyopt', '-loop-distribute', '-sccp', '-loop-sink', '-annotation2metadata', '-inline', '-inferattrs', '-loop-load-elim', '-instsimplify', '-rpo-function-attrs', '-elim-avail-extern']

# extra_important_passes='-attributor'.split()
# extra_important_passes='-attributor -break-crit-edges -lowerinvoke -loweratomic -mergefunc -partial-inliner -sink -slsr -scalarizer -strip -strip-nondebug'.split()
important_extra_passes='-attributor -break-crit-edges -loop-data-prefetch -loop-fusion -loop-interchange -loop-simplifycfg -loop-unroll-and-jam -lowerinvoke -loweratomic -mergefunc -partial-inliner -sink -slsr -scalarizer -strip -strip-nondebug'.split()
#important_extra_passes='-attributor  -break-crit-edges -loop-data-prefetch -loop-fusion -loop-interchange -lowerinvoke -loweratomic  -sink -slsr -scalarizer -strip -strip-nondebug'.split()

#extra_passes without loop-reroll and reg2mem
extra_passes_wo='-attributor -add-discriminators -always-inline -break-crit-edges -canonicalize-aliases -consthoist -coro-cleanup -coro-early -coro-elide -coro-split -cross-dso-cfi -dce -flattencfg -insert-gcov-profiling -gvn-hoist -globalsplit -guard-widening -hotcoldsplit -instrprof -irce -infer-address-spaces -instnamer -load-store-vectorizer -loop-data-prefetch -loop-fusion -loop-guard-widening -loop-instsimplify -loop-interchange -loop-predication -loop-simplifycfg -loop-reduce -loop-unroll-and-jam -loop-versioning-licm -loop-versioning -loweratomic -lower-guard-intrinsic -lowerinvoke -lower-matrix-intrinsics -lowerswitch -lower-widenable-condition -mergefunc -mergeicmps -sancov -name-anon-globals -nary-reassociate -newgvn -partial-inliner -partially-inline-libcalls -post-inline-ee-instrument -redundant-dbg-inst-elim -rewrite-statepoints-for-gc -scalarizer -separate-const-offset-from-gep -simple-loop-unswitch -sink -slsr -strip-debug-declare -strip-nondebug -strip -mergereturn'.split()

extra_passes='-attributor -add-discriminators -always-inline -break-crit-edges -canonicalize-aliases -consthoist -coro-cleanup -coro-early -coro-elide -coro-split -cross-dso-cfi -dce -flattencfg -insert-gcov-profiling -gvn-hoist -globalsplit -guard-widening -hotcoldsplit -instrprof -irce -infer-address-spaces -instnamer -load-store-vectorizer -loop-reroll -loop-data-prefetch -loop-fusion -loop-guard-widening -loop-instsimplify -loop-interchange -loop-predication -loop-simplifycfg -loop-reduce -loop-unroll-and-jam -loop-versioning-licm -loop-versioning -loweratomic -lower-guard-intrinsic -lowerinvoke -lower-matrix-intrinsics -lowerswitch -lower-widenable-condition -mergefunc -mergeicmps -sancov -name-anon-globals -nary-reassociate -newgvn -partial-inliner -partially-inline-libcalls -post-inline-ee-instrument -reg2mem -redundant-dbg-inst-elim -rewrite-statepoints-for-gc -scalarizer -separate-const-offset-from-gep -simple-loop-unswitch -sink -slsr -strip-debug-declare -strip-nondebug -strip -mergereturn'.split()

passes = llvm12_O3_passes + important_extra_passes
# passes = llvm12_O3_passes

Tracker=Tracker('{}-{}'.format(args.benchmark,args.method),verbose=True)
trackername='{}-{}'.format(args.benchmark,args.method)


host="nvidia@TX2-{}.local".format(args.device)
cross_flags='--target=aarch64-linux-gnu --sysroot=/home/jiayu/gcc-4.8.5-aarch64/install/aarch64-unknown-linux-gnu/sysroot/ --gcc-toolchain=/home/jiayu/gcc-4.8.5-aarch64/install'
cross_linker='/home/jiayu/gcc-4.8.5-aarch64/install/bin/aarch64-unknown-linux-gnu-gcc'

print(args.benchmark)
if args.benchmark[0:7]=='cBench-':
    benchmark=args.benchmark[7:]
cflags='-I. -DLAMESNDFILE -DHAVEMPGLIB -DLAMEPARSE'
cflags += ' '+cross_flags
lflags='-lm'
build_dir='/home/jiayu/cBench_V1.1/{}/src_work/'.format(benchmark)
ret=subprocess.run('ls ./*.c', cwd=build_dir, capture_output=True,shell=True)
sources=ret.stdout.decode().strip().split()
sources=[x for x in sources if x.endswith('.c')]
exename='a.out'

run_dir='/home/nvidia/cBench_V1.1/{}/src_work/'.format(benchmark)
ben2num={'automotive_bitcount':20, 'automotive_qsort1': 30,'automotive_susan_c':100, 'automotive_susan_e':50, 'automotive_susan_s':10,'bzip2d':10,'bzip2e':5,'consumer_jpeg_c':300,'consumer_jpeg_d':200,'consumer_lame':20,'consumer_tiff2bw': 600, 'consumer_tiff2rgba':100, 'consumer_tiffdither':300,'consumer_tiffmedian':300,'network_dijkstra':200000,'network_patricia':10000,'office_rsynth':300,'security_blowfish_d':20000, 'security_blowfish_e':20000,'security_rijndael_d':2000,'security_rijndael_e':2000,'security_sha':25000, 'telecom_adpcm_c':1000,'telecom_adpcm_d':2000, 'telecom_CRC32':200}
runcmds=['./__run 1 {}'.format(ben2num[benchmark])]
copy_O3_cmds=['./_ccc_check_output.copy']
if =='cBench-security_sha':
    diffcmds=None
else:
    diffcmds=['./_ccc_check_output.diff && cat tmp-ccc-diff'] #consumer_lame有误,security_sha 无法验证
diff_true_result=''
n_parallel=10
with Connection(host=host, connect_kwargs={"password": "nvidia"}) as C:
    ret=C.run('hostname')
    # cross_flags='--target=aarch64-linux-gnu --sysroot=/home/jiayu/gcc-4.8.5-aarch64/install/aarch64-unknown-linux-gnu/sysroot/ --gcc-toolchain=/home/jiayu/gcc-4.8.5-aarch64/install'
    # cross_linker='/home/jiayu/gcc-4.8.5-aarch64/install/bin/aarch64-unknown-linux-gnu-gcc'
    # cflags='-I.'+' '+cross_flags
    # lflags='-lm'
    # ben2num={'consumer_jpeg_c':300,'telecom_adpcm_c':1000,'telecom_adpcm_d':2000}
    # build_dir='/home/jiayu/cBench_V1.1/automotive_bitcount/src_work/'
    # build_dir='/home/jiayu/cBench_V1.1/consumer_tiff2rgba/src_work/'
    # build_dir='/home/jiayu/cBench_V1.1/consumer_jpeg_c/src_work/'
    # build_dir='/home/jiayu/cBench_V1.1/telecom_adpcm_c/src_work/'
    # build_dir='/home/jiayu/cBench_V1.1/telecom_adpcm_d/src_work/'
    
    # build_dir='/home/jiayu/cBench_V1.1/{}/src_work/'.format(benchmark)
    # run_dir='/home/nvidia/cBench_V1.1/{}/src_work/'.format(benchmark)
    
    # # ret=C.run('cd {} && {}'.format(build_dir,'ls ./*.c'),hide=True)
    # # sources=ret.stdout.strip().split()
    # ret=subprocess.run('ls ./*.c', cwd=build_dir, capture_output=True,shell=True)
    # sources=ret.stdout.decode().strip().split()
    # sources=[x for x in sources if x.endswith('.c')]
    # exename='a.out'
    # runcmds=['./__run 1 {}'.format(ben2num[benchmark])]
    # diffcmds=None
    # diff_true_result=''
    
    f=Phaseorder(trackername=trackername, passes=passes, connection=C, host=host, n_parallel=n_parallel, cross_linker=cross_linker, cflags=cflags, lflags=lflags, build_dir=build_dir, sources=sources, exename=exename, runcmds=runcmds, run_dir=run_dir, diffcmds=diffcmds, diff_true_result=diff_true_result, copy_O3_cmds=copy_O3_cmds)
    initial_guess=llvm12_O3_seq
    # print(f.le.transform(['-inline','-attributor']))
    # print(f.le.inverse_transform([58, 35, 8, 14, 70, 32, 26]))
#    initial_guess=[18, 26, 35, 58] #telecom_adpcm_c
#    initial_guess=[18, 35, 58, 26]#telecom_adpcm_c
#    initial_guess=[18, 26, 58, 35]#telecom_adpcm_c
#    initial_guess=[18, 35, 58, 75, 26]#telecom_adpcm_c
    
    # initial_guess=[75, 8, 70, 32]#telecom_adpcm_d
    # initial_guess=[58, 35, 8, 14, 70, 32, 26]#telecom_adpcm_d

    # initial_guess=[75]#consumer_tiff2bw


#    O3_run_time_list=[f.O3_run_time]
#    for num in range(5):
#        O3_run_time_list.append(f._run())
#    O3_run_time=np.median(O3_run_time_list)
#    print('O3_run_time',O3_run_time,O3_run_time_list)

    if args.method=='my':
        from algorithms.my import My
        tuner=My(f=f, 
                 passes=passes, 
                 max_len_seq=len_seq, 
                 max_n_evals=args.budget, 
                 tracker_name='{}-my'.format(args.benchmark), 
                 initial_guess=initial_guess, 
                 n_random=100, 
                 n_parents=5)
        tuner.optimize()
        y=f(tuner.best_x)
        print('best speedup:',tuner.best_y)
        print('best x:',tuner.best_x)
        
    if args.method=='ngopt':
        import nevergrad as ng
        params = ng.p.Choice(
                choices=passes,
                repetitions=len_seq,
                deterministic=True
            )
        optimizer=ng.optimizers.NGOpt(parametrization=params, budget=args.budget, num_workers=1)
        print(optimizer. _select_optimizer_cls())
        optimizer.suggest(initial_guess)
        for i in range(args.budget):
            x = optimizer.ask()
            y=f(x.value)
            optimizer.tell(x, y)
    
    if args.method=='random':
        import nevergrad as ng
        params = ng.p.Choice(
                choices=passes,
                repetitions=len_seq,
                deterministic=True
            )
        optimizer=ng.optimizers.RandomSearch(parametrization=params, budget=args.budget, num_workers=1)
        optimizer.suggest(initial_guess)
        for i in range(args.budget):
            x = optimizer.ask()
            y=f(x.value)
            optimizer.tell(x, y)
    
    if args.method=='random-pem':
        for i in range(args.budget):
            x = list(np.random.permutation(llvm12_O3_seq))
            y=f(x)
            
    
    
    if args.method=='dfga':
        import nevergrad as ng
        params = ng.p.Choice(
                choices=passes,
                repetitions=len_seq,
                deterministic=True
            )
        optimizer=ng.optimizers.DoubleFastGADiscreteOnePlusOne(parametrization=params, budget=args.budget, num_workers=1)
        optimizer.suggest(initial_guess)
        for i in range(args.budget):
            x = optimizer.ask()
            pass_seq=list(x.value)
            y=f(pass_seq)
            y_list=[y]
            if -O3_run_time/y < Tracker.curt_best:
                for num in range(10):
                    y_list.append(f._run())
            
            y=np.median(y_list)
            print('speedup:{}'.format(O3_run_time/y), y, y_list)
            Tracker.track(-O3_run_time/y,' '.join(pass_seq))
            # print(' '.join(pass_seq))
            optimizer.tell(x, y)  
            
    if args.method=='pso':
        import nevergrad as ng
        params = ng.p.Choice(
                choices=passes,
                repetitions=len_seq,
                deterministic=True
            )
        optimizer=ng.optimizers.PSO(parametrization=params, budget=args.budget, num_workers=10)
        optimizer.suggest(initial_guess)
        for i in range(args.budget):
            x = optimizer.ask()
            pass_seq=list(x.value)
            y=f(pass_seq)
            y_list=[y]
            if -O3_run_time/y < Tracker.curt_best:
                for num in range(10):
                    y_list.append(f._run())
            
            y=np.median(y_list)
            print('speedup:{}'.format(O3_run_time/y), y, y_list)
            Tracker.track(-O3_run_time/y,' '.join(pass_seq))
            # print(' '.join(pass_seq))
            optimizer.tell(x, y)  
            
    if args.method=='cga':
        import nevergrad as ng
        params = ng.p.Choice(
                choices=passes,
                repetitions=len_seq,
                deterministic=True
            )
        optimizer=ng.optimizers.cGA(parametrization=params, budget=args.budget, num_workers=1)
        optimizer.suggest(initial_guess)
        for i in range(args.budget):
            x = optimizer.ask()
            pass_seq=list(x.value)
            y=f(pass_seq)
            y_list=[y]
            if -O3_run_time/y < Tracker.curt_best:
                for num in range(10):
                    y_list.append(f._run())
            
            y=np.median(y_list)
            print('speedup:{}'.format(O3_run_time/y), y, y_list)
            Tracker.track(-O3_run_time/y,' '.join(pass_seq))
            # print(' '.join(pass_seq))
            optimizer.tell(x, y)
            
    if args.method=='AdaptiveDiscreteOnePlusOne':
        import nevergrad as ng
        params = ng.p.Choice(
                choices=passes,
                repetitions=len_seq,
                deterministic=True
            )
        optimizer=ng.optimizers.AdaptiveDiscreteOnePlusOne(parametrization=params, budget=args.budget, num_workers=1)
        optimizer.suggest(initial_guess)
        for i in range(args.budget):
            x = optimizer.ask()
            pass_seq=list(x.value)
            y=f(pass_seq)
            y_list=[y]
            if -O3_run_time/y < Tracker.curt_best:
                for num in range(10):
                    y_list.append(f._run())
            
            y=np.median(y_list)
            print('speedup:{}'.format(O3_run_time/y), y, y_list)
            Tracker.track(-O3_run_time/y,' '.join(pass_seq))
            # print(' '.join(pass_seq))
            optimizer.tell(x, y)
    
    if args.method=='cma':
        import nevergrad as ng
        params = ng.p.Choice(
                choices=passes,
                repetitions=len_seq,
                deterministic=True
            )
        all_set=set()
        optimizer=ng.optimizers.CMA(parametrization=params, budget=args.budget, num_workers=10)
        # optimizer=ng.optimizers.DiagonalCMA(parametrization=params, budget=args.budget, num_workers=10)
        optimizer.suggest(initial_guess)
        i=0
        while i < args.budget:
            x = optimizer.ask()
            pass_seq=list(x.value)
            if ' '.join(pass_seq) in all_set:
                print('duplicate seq')
                continue
            else:
                all_set.add(' '.join(pass_seq))
                i=i+1
            y=f(pass_seq)
            y_list=[y]
            if -O3_run_time/y < Tracker.curt_best:
                for num in range(10):
                    y_list.append(f._run())
            
            y=np.median(y_list)
            print('speedup:{}'.format(O3_run_time/y), y, y_list)
            Tracker.track(-O3_run_time/y,' '.join(pass_seq))
            # print(' '.join(pass_seq))
            optimizer.tell(x, y)
            
    if args.method=='cma-binary':
        import nevergrad as ng
        params = ng.p.Choice(
                choices=[0,1],
                repetitions=len_seq,
            )
        all_set=set()
        optimizer=ng.optimizers.CMA(parametrization=params, budget=args.budget, num_workers=10)
        # optimizer=ng.optimizers.DiagonalCMA(parametrization=params, budget=args.budget, num_workers=10)
        initial_guess=[1]*len_seq
        optimizer.suggest(initial_guess)
        i=0
        while i < args.budget:
            x = optimizer.ask()
            flags=list(x.value)
            pass_seq=[]
            for i in range(len_seq):
                if flags[i]==1:
                    pass_seq.append(llvm12_O3_seq[i])
            if ' '.join(pass_seq) in all_set:
                print('duplicate seq')
                continue
            else:
                all_set.add(' '.join(pass_seq))
                i=i+1
            y=f(pass_seq)
            y_list=[y]
            if -O3_run_time/y < Tracker.best_y:
                for num in range(10):
                    y_list.append(f._run())
            
            y=np.median(y_list)
            print('speedup:{}'.format(O3_run_time/y), y, y_list)
            Tracker.track(-O3_run_time/y,' '.join(pass_seq))
            # print(' '.join(pass_seq))
            optimizer.tell(x, y) 
            
    
            
    # if args.method=='ga':
    #     from pymoo.algorithms.soo.nonconvex.ga import GA
    #     from pymoo.core.problem import Problem
    #     from pymoo.core.evaluator import set_cv
    #     from pymoo.util.termination.no_termination import NoTermination
    #     problem = Problem(n_var=len_seq, n_obj=1, n_constr=0, xl=np.zeros(f.dim), xu=np.ones(f.dim))
    #     termination = NoTermination()
    #     # optimizer=ng.optimizers.DiscreteLenglerOnePlusOne(parametrization=params, budget=500, num_workers=1)
    #     optimizer.suggest(initial_guess)
    #     for i in range(args.budget):
    #         x = optimizer.ask()
    #         pass_seq=list(x.value)
    #         y=f(pass_seq)
    #         y_list=[y]
    #         if -O3_run_time/y < Tracker.curt_best:
    #             for num in range(10):
    #                 y_list.append(f._run())
            
    #         y=np.median(y_list)
    #         print('speedup:{}'.format(O3_run_time/y), y, y_list)
    #         Tracker.track(-O3_run_time/y,' '.join(pass_seq))
    #         # print(' '.join(pass_seq))
    #         optimizer.tell(x, y)
        
    
        
    
