function mgc = A2

mgc.sound_speed = 312.805;
mgc.temperature = 281.15;
mgc.R = 8.314;
mgc.compressibility_factor = 0.8;
mgc.gas_molar_mass = 0.0185674;
mgc.gas_specific_gravity = 0.6;
mgc.specific_heat_capacity_ratio = 1.4;
mgc.standard_density = 1;
mgc.baseP = 8000000;
mgc.baseF = 535.85648148148;
mgc.per_unit= 1;

%% junction data
%  junction_i type pmin pmax status p
mgc.junction = [
1       0       0       0.9625  1       0
81      0       0       0.7375  1       0
2       0       0       0.9625  1       0
500004  0       0       1       1       0
41      0       0       1       1       0
51      0       0       0.9625  1       0
10      0       0.375   0.8275  1       0.375
200017  0       0       0.8275  1       0
24      0       0.25    0.875   1       0.25
25      0       0.25    0.875   1       0.25
23      0       0.25    0.875   1       0.25
5       0       0       0.9625  1       0
17      0       0       0.8275  1       0
9       0       0       0.7375  1       0
12      0       0       0.8275  1       0
20      0       0.3125  0.8275  1       0.3125
6       0       0.375   1       1       0.375
14      0       0       0.8275  1       0
7       0       0.375   1       1       0.375
8       0       0.625   0.8275  1       0.625
19      0       0       0.8275  1       0
171     0       0       0.8275  1       0
4       0       0       1       1       0
400008  0       0       0.8275  1       0
22      0       0.25    0.875   1       0.25
11      0       0       0.8275  1       0
13      0       0       0.8275  1       0
211     0       0.175   0.8275  1       0.175
300008  0       0       0.8275  1       0
15      0       0       0.8275  1       0
16      0       0.625   0.8275  1       0.625
21      0       0.25    0.875   1       0.25
241     0       0.175   0.8275  1       0.175
100005  0       0       0.9625  1       0
18      0       0       0.7875  1       0
3       0       0.375   1       1       0.375
];

%% pipeline data
% pipeline_i f_junction t_junction diameter length friction_factor status
mgc.pipe = [
24      19      20      0.3155  6000    0.0085629675705269      1
4       2       3       0.89    6000    0.00703703698533        1
1       1       2       0.89    4000    0.0070370408645073      1
12      9       10      0.89    20000   0.007037056381259       1
221     171     18      0.3155  26000   0.0085629665444935      1
101     81      9       0.89    5000    0.00703703698533        1
20      15      16      0.89    25000   0.007037056381259       1
2       1       2       0.89    4000    0.0070370408645073      1
23      18      19      0.3155  98000   0.0085629880912455      1
13      9       10      0.3955  20000   0.008190753060659       1
5       3       4       0.89    26000   0.0070370214686638      1
61      51      6       0.5901  43000   0.0075887368037215      1
15      10      11      0.3955  25000   0.0081907606423379      1
16      11      12      0.89    42000   0.0070370346578257      1
14      10      11      0.89    25000   0.007037056381259       1
111     81      9       0.3955  5000    0.0081907985509429      1
21      11      17      0.3955  10500   0.0081907644331826      1
7       6       7       0.5901  29000   0.0075887596878999      1
8       7       4       0.5901  19000   0.0075887420846735      1
17      12      13      0.89    40000   0.0070370408645073      1
19      14      15      0.89    10000   0.00703703698533        1
91      41      14      0.89    55000   0.0070370408645073      1
18      13      14      0.89    5000    0.00703703698533        1
3       2       3       0.89    6000    0.00703703698533        1
];

%% compressor data
% compressor_i f_junction t_junction cmin cmax power_max fmin fmax status
mgc.compressor = [
11      8       300008  1       2       1.0e9   1.0e9   1e9     1
100003  81      400008  1       2       1.0e9   1.0e9   1e9     1
100000  51      100005  1       2       1.0e9   1.0e9   1e9     1
10      8       400008  1       2       1.0e9   1.0e9   1e9     1
6       5       100005  1       2       1.0e9   1.0e9   1e9     1
22      17      200017  1       2       1.0e9   1.0e9   1e9     1
9       4       500004  1       2       1.0e9   1.0e9   1e9     1
100001  171     200017  1       2       1.0e9   1.0e9   1e9     1
100002  81      300008  1       2       1.0e9   1.0e9   1e9     1
100004  41      500004  1       2       1.0e9   1.0e9   1e9     1
];

%% producer
% producer_i junction fgmin fgmax fg status dispatchable
mgc.producer = [
14      14      0.02073523694328        0.02073523694328        0.02073523694328        1       0
1       1       0.23567514795456        0.23567514795456        0.23567514795456        1       0
5       5       0.060795541924057       0.060795541924057       0.060795541924057       1       0
2       2       0.1814333232537 0.1814333232537 0.1814333232537 1       0
13      13      0.025919046179101       0.025919046179101       0.025919046179101       1       0
8       8       0.4754417037453 0.4754417037453 0.4754417037453 1       0
];

%% consumer
% consumer_i junction fd status dispatchable
mgc.consumer = [
12      12      0.045790314916411       1       0
20      20      0.041448874681412       1       0
15      15      0.14791135686207        1       0
10      10      0.13747894077498        1       0
6       6       0.087131193572077       1       0
7       7       0.11352542226446        1       0
19      19      0.0047950235431336      1       0
16      16      0.3372931876107 1       0
3       3       0.084625685774763       1       0
];


%% expansion pipes
% pipeline_i f_junction t_junction diameter length friction_factor status      construction_cost
mgc.ne_pipe = [
29      23      24      0.89    41370   0.0070370370244787      1       71.18
27      22      11      0.89    37500   0.0070370370289708      1       64.52
31      25      19      0.89    27080   0.007037037024758       1       46.59
25      5       21      0.89    34460   0.0070370370245912      1       59.29
301     241     25      0.89    41890   0.0070370370269284      1       72.08
261     211     22      0.89    36990   0.0070370370277197      1       63.65
28      8       23      0.89    18760   0.0070370370267053      1       32.28
];


%% expansion compressors
% compressor_i f_junction t_junction cmin cmax power_max fmin fmax status construction_cost
mgc.ne_compressor = [
26      211     21      1       2       1.0e9   1.0e9   1e9     1       1500
30      24      241     1       2       1.0e9   1.0e9   1e9     1       1500
];
