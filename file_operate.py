import os 

path = 'C:\\Users\\Administrator\\Documents\\gbtong\\企业图集\\比亚迪'

# list files in a directory 
files = os.listdir(path)

for f in files:
    print(f)

# change the file name         
os.rename(r'C:\\Users\\Administrator\\Documents\\gbtong\\企业图集\\比亚迪\\周边（宝龙）8.png',
r'C:\\Users\\Administrator\\Documents\\gbtong\\企业图集\\比亚迪\\周边（宝龙比亚迪）8.png')