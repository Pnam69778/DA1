import numpy as np
import matplotlib.pyplot as plt
import wfdb
import os
path = r'D:\Bai_hoc\Python_WFDB_tool\data'

record = wfdb.rdrecord(
    os.path.join(path, '09514_hr')
)

lead_v4 = record.p_signal[:,9]
fs = record.fs
t = np.arange(len(lead_v4)) / fs

noise_200hz = 0.2 * np.sin(
    2 * np.pi * 200 * t
)

ecg_data_noised = noise_200hz + lead_v4

noise_q412 = np.int16(
    np.round(ecg_data_noised * (2**12))
)
np.savetxt(
    'Noise_v4_q412.txt',
    noise_q412,
    fmt='%d'
)

with open('Noise_v4_q412.txt', 'w') as f: #write
    for x in noise_q412:
        binary = format(
            np.uint16(x),'016b'
        )
        f.write(binary + '\n')

plt.subplot(4,1,1)
plt.plot(t, lead_v4)
plt.ylabel('mV')
plt.title('Tin hieu ecg lead v4')
plt.grid(True)

plt.subplot(4,1,2)
plt.plot(t, ecg_data_noised)
plt.ylabel('mV')
plt.title('Tin hieu ecg lead v4 + noise')

plt.grid(True)

data = []
with open('Noise_v4_q412.txt', 'r') as f:
    for line in f:
        b = line.strip()
        val = int(b, 2)

        if val >= 2**15:
            val -= 2**16
        data.append(val)
data = np.array(data)
data_mV = data / (2**12)

plt.subplot(4,1,3)
plt.plot(t,data)
plt.title("KT xem data noise")
plt.grid(True)
plt.ylabel('Q4.12')

plt.subplot(4,1,4)
plt.plot(t,data_mV)
plt.title("Kiểm tra xem Q4.12 có dịch chuẩn từ nhiễu_ecg không")
plt.grid(True)
plt.ylabel('Q4.12')
plt.xlabel('Time (s)')
plt.show()
