data_ecg = load('V4.txt');
fs = 500;
t = (0:length(data_ecg)-1)' / fs;
input_signal.time = t;
input_signal.signals.values = data_ecg;
input_signal.signals.dimensions = 1;

out_sim_2 = out.simout;
t_2 = (0:length(out_sim_2)-1)' / fs;

fid = fopen('output_final.txt', 'r');
hex_cell = textscan(fid, '%s');
fclose(fid);

chuoihex = hex_cell{1};

cho_nao_dinh_x = contains(chuoihex, 'x') | contains(chuoihex, 'X');
chuoihex(cho_nao_dinh_x) = {'000000'};

data_vivado = hex2dec(chuoihex);

data_vivado(data_vivado >= 2^23) = data_vivado(data_vivado >= 2^23) - 2^24; 

data2_mv = double(data_vivado) / (2^20); %Q4.20


vivado_aligned = data2_mv(5:end); 

% Đồng bộ độ dài theo chuỗi đã căn chỉnh
len_valid = min(length(vivado_aligned), length(out_sim_2));
vivado_final = vivado_aligned(1:len_valid);
simulink_final = out_sim_2(1:len_valid);

% len_valid = min(length(data2_mv), length(out_sim_2));
% vivado_final = data2_mv(1:len_valid);
% simulink_final = out_sim_2(1:len_valid);

t_3 = (0:len_valid-1)' / fs;

sosanh = abs(vivado_final - simulink_final);
saisotuongdoi = abs(sosanh ./ (simulink_final + eps));

MSE = immse(vivado_final, simulink_final);

fprintf('MSE la: %e\n', MSE);

time_ = round(0.042*fs) : min(round(10 * fs), len_valid);
sosanh_ = sosanh(time_);

fprintf('do lech bien do lon nhat: %f\n', max(sosanh_));

figure;

subplot(3,1,1);
plot(t_3, simulink_final);
xlabel('Thời gian (s)');
ylabel('Biên độ (mV)');
title('Tín hiệu ECG sau bộ lọc của Simulink');
grid on;

subplot(3,1,2);
plot(t_3, vivado_final);
xlabel('Thời gian (s)');
ylabel('Biên độ (mV)');
title('Tín hiệu ECG sau bộ lọc của Verilog');
grid on;

subplot(3,1,3);
plot(t_3(time_), sosanh_);
xlabel('Thời gian (s)');
ylabel('Biên độ (mV)');
title('Độ lệch biên độ giữa Simulink và Verilog');
grid on;