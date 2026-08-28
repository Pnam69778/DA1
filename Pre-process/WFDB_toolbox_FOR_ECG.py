import wfdb
import os
import matplotlib.pyplot as plt
import numpy as np 
#print(wfdb.__version__) 

path = 'D:\Bai_hoc\Python_WFDB_tool\data'
record = wfdb.rdrecord(
    os.path.join(path, '09514_hr')
   )
wfdb.plot_wfdb(record)
print(record.sig_name)
print(record.p_signal.shape)

#ve bieu do lead V4 mat trc tim
lead_V4 = record.p_signal[:,9]
np.savetxt('V4.txt', lead_V4,fmt='%2.16f')
print(np.max(lead_V4))
print(np.min(lead_V4))
#plt.plot(lead_V4)
#plt.title("Lead V4")
#plt.grid(True)
#plt.show()

q214 = np.int16(
    np.round(lead_V4 * (2**14))
)
np.savetxt(
    'V4_Q214.txt',q214,fmt='%d'
)

q412 = np.int16(
    np.round(lead_V4 * (2**12))
)
np.savetxt(
    'V4_Q412.txt',q412,fmt='%d'
)

with open('V4_Q214_bin.txt', 'w') as f:
    for x in q214:
        binary = format(
            np.uint16(x),'016b'
        )
        f.write(binary + '\n')

with open('V4_Q412_bin.txt','w') as f:
    for x in q412:
        binary = format (
            np.uint16(x), '016b'
        )
        f.write(binary + '\n')

t = np.arange(len(lead_V4)) / 500
plt.plot( t,q412)
plt.ylabel('mV')
plt.title('Tin hieu ecg lead v4 q412')
plt.grid(True)
plt.show()