import os
import socket
class PingIP:
	def __init__(self):
		PingIP.Ping("127.0.0.1")
	def Ping(ipaddress):
	#Må bruke -w 2999(timeout på 2999 ms) pg.a Windows returnerer 0(online) selv om 
	#hosten ikke svarer.
	#Les mer om det her: https://superuser.com/a/793230
		svar = os.system("ping -n 1 -w 2999 " + ipaddress + " > nul")
		if svar == 0:
			print("Host: " + ipaddress + " is up(" + str(svar) + ")")
		if svar == 1:
			print("host " + ipaddress + " is down(" + str(svar) + ")")
	def PingSubnet(self):
		localIP = socket.gethostbyname(socket.gethostname())
		print("Local IP: " +  localIP)
		subnet = localIP.split(".")
		subnet = subnet[0] + "." + subnet[1] + "." + subnet[2] + "."
		print(subnet)
		for x in range(0,255):
			ip = subnet + str(x)
			PingIP.Ping(ip)