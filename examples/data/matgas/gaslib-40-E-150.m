function mgc = gaslib-40-150

%% required global data
mgc.gas_specific_gravity         = 0.6;
mgc.specific_heat_capacity_ratio = 1.4;  % unitless
mgc.temperature                  = 273.15;  % K
mgc.compressibility_factor       = 0.8;  % unitless
mgc.units                        = 'si';

%% optional global data (that was either provided or computed based on required global data)
mgc.gas_molar_mass               = 0.01857; % kg/mol
mgc.R                            = 8.314;  % J/(mol K)
mgc.base_pressure                = 8101325;  % Pa
mgc.base_flow                    = 1510;
mgc.base_length                  = 5000;  % m
mgc.is_per_unit                  = 0;
mgc.sound_speed                  = 312.8060

%% junction data
% id	p_min	p_max	p_nominal	junction_type	status	pipeline_name	edi_id	lat	lon
mgc.junction = [
0	      101325	8101325	101325	0	1	'gaslib-40'	0	      48.9636	6.8376
1	      3101325	8101325	3101325	0	1	'gaslib-40'	1	      48.8195	6.0380
2	      3101325	8101325	3101325	0	1	'gaslib-40'	2	      49.7619	8.9728
3	      101325	8101325	101325	0	1	'gaslib-40'	3	      46.9193	6.5567
4	      101325	8101325	101325	0	1	'gaslib-40'	4	      48.4597	6.7325
5	      3101325	8101325	3101325	0	1	'gaslib-40'	5	      48.8854	6.9708
6	      101325	8101325	101325	0	1	'gaslib-40'	6	      47.7026	7.1515
7	      101325	8101325	101325	0	1	'gaslib-40'	7	      47.4437	7.1600
8	      101325	8101325	101325	0	1	'gaslib-40'	8	      47.3275	7.0122
9	      101325	8101325	101325	0	1	'gaslib-40'	9	      47.3370	7.0605
10	    101325	8101325	101325	0	1	'gaslib-40'	10	    47.6849	7.3343
11	    101325	8101325	101325	0	1	'gaslib-40'	11	    47.5762	6.6172
12	    101325	8101325	101325	0	1	'gaslib-40'	12	    48.7975	8.2268
13	    3101325	8101325	3101325	0	1	'gaslib-40'	13	    48.6972	8.4212
14	    101325	8101325	101325	0	1	'gaslib-40'	14	    46.9362	7.4444
15	    101325	8101325	101325	0	1	'gaslib-40'	15	    48.5216	7.4457
16	    101325	8101325	101325	0	1	'gaslib-40'	16	    48.5489	7.5310
17	    101325	8101325	101325	0	1	'gaslib-40'	17	    48.5066	6.8901
18	    101325	8101325	101325	0	1	'gaslib-40'	18	    48.4334	9.4347
19	    101325	8101325	101325	0	1	'gaslib-40'	19	    47.6233	7.2293
20	    101325	8101325	101325	0	1	'gaslib-40'	20	    47.4883	6.6467
21	    3101325	8101325	3101325	0	1	'gaslib-40'	21	    49.3633	8.5682
22	    101325	8101325	101325	0	1	'gaslib-40'	22	    47.8567	7.2973
23	    101325	8101325	101325	0	1	'gaslib-40'	23	    47.0380	7.3914
24	    101325	8101325	101325	0	1	'gaslib-40'	24	    47.0461	6.7041
25	    101325	8101325	101325	0	1	'gaslib-40'	25	    48.9965	6.9854
26    	101325	8101325	101325	0	1	'gaslib-40'	26	    47.0633	7.3754
27	    101325	7101325	101325	0	1	'gaslib-40'	27	    48.4394	7.1260
28	    101325	8101325	101325	0	1	'gaslib-40'	28	    47.7186	6.6827
29	    101325	8101325	101325	0	1	'gaslib-40'	29	    49.5991	8.5230
30	    101325	8101325	101325	0	1	'gaslib-40'	30	    48.8792	6.4059
31	    101325	8101325	101325	0	1	'gaslib-40'	31	    48.6859	6.4827
32	    101325	7101325	101325	0	1	'gaslib-40'	32	    48.6812	8.4622
33	    101325	7101325	101325	0	1	'gaslib-40'	33	    49.3335	8.5833
34	    101325	8101325	101325	0	1	'gaslib-40'	34	    49.3538	8.5226
35	    101325	7101325	101325	0	1	'gaslib-40'	35	    49.7403	8.9412
36	    101325	8101325	101325	0	1	'gaslib-40'	36	    49.7568	8.9012
37	    3101325	8101325	3101325	0	1	'gaslib-40'	37	    48.4489	7.1754
38	    101325	7101325	101325	0	1	'gaslib-40'	38	    48.8105	6.0766
39	    101325	7101325	101325	0	1	'gaslib-40'	39	    48.8570	6.9910
];

%% pipe data
% id	fr_junction	to_junction	diameter	length	friction_factor	p_min	p_max	status
mgc.pipe = [
0	 0	5	  1.0	13071.0852	0.0071	101325	8101325	1
1	 32	18	0.8	76893.5508	0.0074	101325	8101325	1
2	 37	15	1.0	21557.5662	0.0071	101325	8101325	1
3	 15	16	1.0	6998.0538	  0.0071	101325	8101325	1
4	 16	12	0.8	58218.9696	0.0074	101325	8101325	1
5	 27	28	0.8	86690.2656	0.0074 	101325	8101325	1
6	 28	11	0.6	16579.3260	0.0078	101325	8101325	1
7	 11	20	0.6	10022.7830	0.0078	101325	8101325	1
8	 28	6	  0.6	35218.8391	0.0078	101325	8101325	1
9	 6  22	0.6	20322.2054	0.0078	101325	8101325	1
10 20	8	  0.8	32868.2025	0.0074	101325	8101325	1
11 27	39	0.8	47488.2838	0.0074	101325	7101325	1
12 8	9	  0.6	3802.5867	  0.0078	101325	8101325	1
13 8	24	0.8	39036.0418	0.0074	101325	8101325	1
14 9	26	0.4	38659.8244	0.0085	101325	8101325	1
15 24	3	  0.6	18017.8496	0.0078	101325	8101325	1
16 26	23	0.6	3067.5474	  0.0078	101325	8101325	1
17 23	14	0.4	12015.8748	0.0085	101325	8101325	1
18 9	7	  0.4	14043.1135	0.0085	101325	8101325	1
19 7	19	0.6	20634.6983	0.0078	101325	8101325	1
20 19	6	  0.6	10586.1295	0.0078	101325	8101325	1
21 19	10	0.6	10452.0312	0.0078	101325	8101325	1
22 5	25	0.8	12397.3522	0.0074	101325	8101325	1
23 10	22	0.6	19303.1920	0.0078	101325	8101325	1
24 27	22	0.6	66036.5946	0.0078	101325	8101325	1
25 27	17	1.0	18969.4127	0.0071	101325	8101325	1
26 17	31	0.8	36061.0099	0.0074	101325	8101325	1
27 31	30	0.8	22224.1532	0.0074	101325	8101325	1
28 31	4	  0.8	31179.6191	0.0074	101325	8101325	1
29 4	17	1.0	12766.7034	0.0071	101325	8101325	1
30 31	38	0.8	32921.2598	0.0074	101325	8101325	1
31 35	21	0.8	49866.1484	0.0074	101325	8101325	1
32 21	34	0.8	3479.4547	  0.0074	101325	8101325	1
33 35	36	1.0	3418.0083	  0.0071	101325	8101325	1
34 29	36	1.0	32449.3721	0.0071	101325	8101325	1
35 29	21	0.8	26427.4817	0.0074	101325	8101325	1
36 12	13	1.0	18136.5973	0.0071	101325	8101325	1
37 12	33	0.8	65057.1743	0.0074	101325	8101325	1
38 12	34	0.8	65532.2127	0.0074	101325	8101325	1
];

%% compressor data
% id	fr_junction	to_junction	c_ratio_min	c_ratio_max	power_max	flow_min	flow_max	inlet_p_min	inlet_p_max	outlet_p_min	outlet_p_max	status	operating_cost	directionality
mgc.compressor = [
39	    37	27	1.0	5.0	1000000000	-1550 1550	101325	8101325	101325	8101325	1	10.0	0
40	    13	32	1.0	5.0	1000000000	-1550 1550	101325	8101325	101325	8101325	1	10.0	0
41	    21	33	1.0	5.0	1000000000	-1550 1550	101325	8101325	101325	8101325	1	10.0	0
42	    2	  35	1.0	5.0	1000000000	-1550 1550	101325	8101325	101325	8101325	1	10.0	0
43	    1	  38	1.0	5.0	1000000000	-1550 1550	101325	8101325	101325	8101325	1	10.0	0
44	    5	  39	1.0	5.0	1000000000	-1550 1550	101325	8101325	101325	8101325	1	10.0	0
];

%% receipt data
% id	junction_id	injection_min	injection_max	injection_nominal	is_dispatchable	status
mgc.receipt = [
0	0	0.0	504.0   	503.4722	1	1
1	1	0.0	503.4722	503.4722	0	1
2	2	0.0	503.4722	503.4722	0	1
];

%% delivery data
% id	junction_id	withdrawal_min	withdrawal_max	withdrawal_nominal	is_dispatchable	status
mgc.delivery = [
3	  3	  0.0	52.0833	52.0833	0	1
4	  4	  0.0	52.0833	52.0833	0	1
5	  5	  0.0	52.0833	52.0833	0	1
6	  6	  0.0	52.0833	52.0833	0	1
7	  7	  0.0	52.0833	52.0833	0	1
8	  8	  0.0	52.0833	52.0833	0	1
9	  9	  0.0	52.0833	52.0833	0	1
10	10	0.0	52.0833	52.0833	0	1
11	11	0.0	52.0833	52.0833	0	1
12	12	0.0	52.0833	52.0833	0	1
13	13	0.0	52.0833	52.0833	0	1
14	14	0.0	52.0833	52.0833	0	1
15	15	0.0	52.0833	52.0833	0	1
16	16	0.0	52.0833	52.0833	0	1
17	17	0.0	52.0833	52.0833	0	1
18	18	0.0	52.0833	52.0833	0	1
19	19	0.0	52.0833	52.0833	0	1
20	20	0.0	52.0833	52.0833	0	1
21	21	0.0	52.0833	52.0833	0	1
22	22	0.0	52.0833	52.0833	0	1
23	23	0.0	52.0833	52.0833	0	1
24	24	0.0	52.0833	52.0833	0	1
25	25	0.0	52.0833	52.0833	0	1
26	26	0.0	52.0833	52.0833	0	1
27	27	0.0	52.0833	52.0833	0	1
28	28	0.0	52.0833	52.0833	0	1
29	29	0.0	52.0833	52.0833	0	1
30	30	0.0	52.0833	52.0833	0	1
31	31	0.0	52.0833	52.0833	0	1
];

%% ne_pipe data
% id	fr_junction	to_junction	diameter	length	friction_factor	p_min	p_max	status	construction_cost
mgc.ne_pipe = [
46	0	  5	  1.0	13071.0852     0.0071	101325	8101325	1	27.0272
47	32	18	0.8	76893.5508     0.0074	101325	8101325	1	118.7292
48	37	15	1.0	21557.5662     0.0071	101325	8101325	1	44.5748
49	15	16	1.0	6998.0538      0.0071	101325	8101325	1	14.4699
50	16	12	0.8	58218.9696     0.0074	101325	8101325	1	89.8943
51	27	28	0.8	86690.2656     0.0074	101325	8101325	1	133.8560
52	28	11	0.6	16579.3260     0.0078	101325	8101325	1	19.9195
53	11	20	0.6	10022.7830     0.0078	101325	8101325	1	12.0420
54	28	6	  0.6	35218.8391     0.0078	101325	8101325	1	42.3143
55	6	  22	0.6	20322.2054     0.0078	101325	8101325	1	24.4165
56	20	8	  0.8	32868.2025     0.0074	101325	8101325	1	50.7508
57	27	39	0.8	47488.2838     0.0074	101325	7101325	1	73.3253
58	8	  9	  0.6	3802.5867      0.0078	101325	8101325	1	4.5686
59	8	  24	0.8	39036.0418     0.0074	101325	8101325	1	60.2744
60	9	  26	0.4	38659.8244     0.0085	101325	8101325	1	32.8279
61	24	3	  0.6	18017.8496     0.0078	101325	8101325	1	21.6478
62	26	23	0.6	3067.5474      0.0078	101325	8101325	1	3.6855
63	23	14	0.4	12015.8748     0.0085	101325	8101325	1	10.2032
64	9	  7	  0.4	14043.1135     0.0085	101325	8101325	1	11.9246
65	7	  19	0.6	20634.6983     0.0078	101325	8101325	1	24.7919
66	19	6	  0.6	10586.1295     0.0078	101325	8101325	1	12.7189
67	19	10	0.6	10452.0312     0.0078	101325	8101325	1	12.5577
68	5	  25	0.8	12397.3522     0.0074	101325	8101325	1	19.1424
69	10	22	0.6	19303.1920     0.0078	101325	8101325	1	23.1921
70	27	22	0.6	66036.5946     0.0078	101325	8101325	1	79.3409
71	27	17	1.0	18969.4127     0.0071	101325	8101325	1	39.2232
72	17	31	0.8	36061.0099     0.0074	101325	8101325	1	55.6808
73	31	30	0.8	22224.1532     0.0074	101325	8101325	1	34.3157
74	31	4	  0.8	31179.6191     0.0074	101325	8101325	1	48.1435
75	4	  17	1.0	12766.7034     0.0071	101325	8101325	1	26.3978
76	31	38	0.8	32921.2598     0.0074	101325	8101325	1	50.8328
77	35	21	0.8	49866.1484     0.0074	101325	8101325	1	76.9969
78	21	34	0.8	3479.4547      0.0074	101325	8101325	1	5.3725
79	35	36	1.0	3418.0083      0.0071	101325	8101325	1	7.0674
80	29	36	1.0	32449.3721     0.0071	101325	8101325	1	67.0959
81	29	21	0.8	26427.4817     0.0074	101325	8101325	1	40.8059
82	12	13	1.0	18136.5973     0.0071	101325	8101325	1	37.5012
83	12	33	0.8	65057.1743     0.0074	101325	8101325	1	100.452
84	12	34	0.8	65532.2127     0.0074	101325	8101325	1	101.186
];

end
