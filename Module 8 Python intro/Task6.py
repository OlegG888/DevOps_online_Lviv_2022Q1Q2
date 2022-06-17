import psutil
import platform
import shutil
# ================================================================
# Task 8.6 Write a program that will show basic information about
# your computer (OS, amount of RAM, hard drive, and etc).
# ================================================================
total, used, free = shutil.disk_usage("/")
print("Operating system: ", platform.system())
print('RAM memory MB:', psutil.virtual_memory()[0]*0.000001)
print("Total: %d GiB" % (total // (2**30)))
