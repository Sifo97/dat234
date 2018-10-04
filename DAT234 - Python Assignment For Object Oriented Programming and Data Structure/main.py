from PingIP import PingIP
import platform
osystem = platform.system()
print(osystem)
if osystem != "Windows":
	print("Windows required to run ping test due to parameter differences.")
	print("If you still wish to run, remove line 4, 5 and 6 in main.py")
	print("But it's still recommended that you change the parameters of the ping function in PingIP.py")
	exit()
X = PingIP()
X.PingSubnet()
