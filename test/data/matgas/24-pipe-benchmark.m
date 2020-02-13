function mgc = 24_pipe

%% required global data
mgc.gas_specific_gravity = 0.6000;
mgc.specific_heat_capacity_ratio = 1.4000;  % unitless
mgc.temperature = 288.7060;  % K
mgc.compressibility_factor = 1.0000;  % unitless
mgc.units = 'si';

%% optional global data (that was either provided or computed based on required global data)
mgc.sound_speed = 371.6643;  % m/s
mgc.R = 8.3140;  % J/(mol K)
mgc.base_pressure = 3447380;  % Pa
mgc.base_length = 5000.0000;  % m
mgc.is_per_unit = 0;

%% junction data
% id	p_min	p_max	p_nominal	junction_type	status	pipeline_name	edi_id	lat	lon
mgc.junction = [
1	3447380.0000	5515808.0000	3447380.0000	1	1	'24-pipe-benchmark'	1	0.0000	0.0000
2	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	2	0.0000	0.0000
3	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	3	0.0000	0.0000
4	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	4	0.0000	0.0000
5	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	5	0.0000	0.0000
6	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	6	0.0000	0.0000
7	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	7	0.0000	0.0000
8	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	8	0.0000	0.0000
9	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	9	0.0000	0.0000
10	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	10	0.0000	0.0000
11	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	11	0.0000	0.0000
12	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	12	0.0000	0.0000
13	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	13	0.0000	0.0000
14	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	14	0.0000	0.0000
15	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	15	0.0000	0.0000
16	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	16	0.0000	0.0000
17	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	17	0.0000	0.0000
18	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	18	0.0000	0.0000
19	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	19	0.0000	0.0000
20	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	20	0.0000	0.0000
21	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	21	0.0000	0.0000
22	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	22	0.0000	0.0000
23	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	23	0.0000	0.0000
24	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	24	0.0000	0.0000
25	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	25	0.0000	0.0000
26	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	26	0.0000	0.0000
27	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	27	0.0000	0.0000
28	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	28	0.0000	0.0000
29	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	29	0.0000	0.0000
30	3447380.0000	5515808.0000	3447380.0000	0	1	'24-pipe-benchmark'	30	0.0000	0.0000
];

%% pipe data
% id	fr_junction	to_junction	diameter	length	friction_factor	p_min	p_max	status
mgc.pipe = [
1	26	2	0.9144	100000.0000	0.0100	3447380.0000	5515808.0000	1
2	2	3	0.6350	30000.0000	0.0100	3447380.0000	5515808.0000	1
3	28	4	0.6350	5000.0000	0.0100	3447380.0000	5515808.0000	1
4	4	5	0.6350	15000.0000	0.0100	3447380.0000	5515808.0000	1
5	5	6	0.6350	10000.0000	0.0100	3447380.0000	5515808.0000	1
6	5	7	0.6350	5000.0000	0.0100	3447380.0000	5515808.0000	1
7	7	8	0.6350	10000.0000	0.0100	3447380.0000	5515808.0000	1
8	27	9	0.9144	5000.0000	0.0100	3447380.0000	5515808.0000	1
9	9	10	0.9144	60000.0000	0.0100	3447380.0000	5515808.0000	1
10	10	11	0.6350	5000.0000	0.0100	3447380.0000	5515808.0000	1
11	11	12	0.6350	8000.0000	0.0100	3447380.0000	5515808.0000	1
12	11	13	0.6350	6000.0000	0.0100	3447380.0000	5515808.0000	1
13	10	14	0.9144	80000.0000	0.0100	3447380.0000	5515808.0000	1
14	29	15	0.9144	10000.0000	0.0100	3447380.0000	5515808.0000	1
15	15	16	0.9144	20000.0000	0.0100	3447380.0000	5515808.0000	1
16	16	17	0.6350	3000.0000	0.0100	3447380.0000	5515808.0000	1
17	17	18	0.6350	6000.0000	0.0100	3447380.0000	5515808.0000	1
18	16	19	0.6350	5000.0000	0.0100	3447380.0000	5515808.0000	1
19	15	20	0.9144	40000.0000	0.0100	3447380.0000	5515808.0000	1
20	30	21	0.9144	5000.0000	0.0100	3447380.0000	5515808.0000	1
21	21	22	0.9144	20000.0000	0.0100	3447380.0000	5515808.0000	1
22	22	23	0.9144	5000.0000	0.0100	3447380.0000	5515808.0000	1
23	23	24	0.9144	16000.0000	0.0100	3447380.0000	5515808.0000	1
24	22	25	0.6350	8000.0000	0.0100	3447380.0000	5515808.0000	1
];

%% compressor data
% id	fr_junction	to_junction	c_ratio_min	c_ratio_max	power_max	flow_min	flow_max	inlet_p_min	inlet_p_max	outlet_p_min	outlet_p_max	status	operating_cost	directionality
mgc.compressor = [
1	1	26	1.0000	1.4000	3500.0000	0.0000	1000000.0000	3447380.0000	5515808.0000	3447380.0000	5515808.0000	1	10.0000	2
2	2	27	1.0000	1.4000	2500.0000	0.0000	1000000.0000	3447380.0000	5515808.0000	3447380.0000	5515808.0000	1	10.0000	2
3	3	28	1.0000	1.4000	1500.0000	0.0000	1000000.0000	3447380.0000	5515808.0000	3447380.0000	5515808.0000	1	10.0000	2
4	14	29	1.0000	1.4000	1000.0000	0.0000	1000000.0000	3447380.0000	5515808.0000	3447380.0000	5515808.0000	1	10.0000	2
5	20	30	1.0000	1.4000	1000.0000	0.0000	1000000.0000	3447380.0000	5515808.0000	3447380.0000	5515808.0000	1	10.0000	2
];

%% receipt data
% id	junction_id	injection_min	injection_max	injection_nominal	is_dispatchable	status
mgc.receipt = [
1	1	0.0000	1000.0000	680.6534	0	1
];

%% delivery data
% id	junction_id	withdrawal_min	withdrawal_max	withdrawal_nominal	is_dispatchable	status
mgc.delivery = [
1	6	0.0000	74.5264	74.5264	0	1
2	8	0.0000	68.3158	68.3158	0	1
3	24	0.0000	62.1053	62.1053	0	1
4	25	0.0000	55.8948	55.8948	0	1
5	12	0.0000	68.5197	68.5197	0	1
6	13	0.0000	56.0616	56.0616	0	1
7	18	0.0000	62.2906	62.2906	0	1
8	19	0.0000	74.7488	74.7488	0	1
9	12	0.0000	31.1453	31.1453	0	1
10	25	0.0000	24.9108	24.9108	0	1
11	6	0.0000	29.8930	29.8930	0	1
12	18	0.0000	22.4197	22.4197	0	1
13	24	0.0000	27.4019	27.4019	0	1
14	24	0.0000	9.9643	9.9643	0	1
15	25	0.0000	12.4554	12.4554	0	1
];

end
