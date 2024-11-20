## Preparation

1. Setup [Sysbench](https://github.com/akopytov/sysbench)
2. Setup [mysql client](https://formulae.brew.sh/formula/mysql-client@8.4)
3. Setup DDL for account_transaction tables

## Running

1. Edit prepare method in [table_under_test.lua](test/table_under_test_insert.lua)
2. Uncomment based the line, depend on test case that you'd like to benchmark
3. run `./run_prepare.sh`
4. run `./run_benchmark.sh`

## Result

### Without Trigger

```
SQL statistics:
    queries performed:
        read:                            0
        write:                           320000
        other:                           0
        total:                           320000
    transactions:                        320000 (9112.75 per sec.)
    queries:                             320000 (9112.75 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          35.1154s
    total number of events:              320000

Latency (ms):
         min:                                    0.42
         avg:                                    0.88
         max:                                   23.51
         95th percentile:                        0.00
         sum:                               280445.89

Threads fairness:
    events (avg/stddev):           40000.0000/161.90
    execution time (avg/stddev):   35.0557/0.00
````


## With Trigger

```
SQL statistics:
    queries performed:
        read:                            0
        write:                           320000
        other:                           0
        total:                           320000
    transactions:                        320000 (3746.91 per sec.)
    queries:                             320000 (3746.91 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          85.4034s
    total number of events:              320000

Latency (ms):
         min:                                    0.45
         avg:                                    2.13
         max:                                   27.65
         95th percentile:                        0.00
         sum:                               682635.98

Threads fairness:
    events (avg/stddev):           40000.0000/0.87
    execution time (avg/stddev):   85.3295/0.00

## With Optimized Trigger (update ... select)

SQL statistics:
    queries performed:
        read:                            0
        write:                           320000
        other:                           0
        total:                           320000
    transactions:                        320000 (3565.44 per sec.)
    queries:                             320000 (3565.44 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          89.7500s
    total number of events:              320000

Latency (ms):
         min:                                    0.51
         avg:                                    2.24
         max:                                   70.10
         95th percentile:                        0.00
         sum:                               717322.32

Threads fairness:
    events (avg/stddev):           40000.0000/1.73
    execution time (avg/stddev):   89.6653/0.00
```

## With Optimized Trigger (update to variable)

```
SQL statistics:
    queries performed:
        read:                            0
        write:                           320000
        other:                           0
        total:                           320000
    transactions:                        320000 (3687.80 per sec.)
    queries:                             320000 (3687.80 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          86.7722s
    total number of events:              320000

Latency (ms):
         min:                                    0.46
         avg:                                    2.17
         max:                                  130.51
         95th percentile:                        0.00
         sum:                               693632.43

Threads fairness:
    events (avg/stddev):           40000.0000/1.12
    execution time (avg/stddev):   86.7041/0.00
```

## With auto_increment_increment parameter

```
SQL statistics:
    queries performed:
        read:                            0
        write:                           320000
        other:                           0
        total:                           320000
    transactions:                        320000 (7820.25 per sec.)
    queries:                             320000 (7820.25 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          40.9191s
    total number of events:              320000

Latency (ms):
         min:                                    0.37
         avg:                                    1.02
         max:                                   33.36
         95th percentile:                        0.00
         sum:                               326633.16

Threads fairness:
    events (avg/stddev):           40000.0000/194.17
    execution time (avg/stddev):   40.8291/0.00
```