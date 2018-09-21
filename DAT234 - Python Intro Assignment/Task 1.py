import random #Trenger den for random.randit funksjonen
navn = ["Christoffer Berglund", "Thomas Olsen","Olaf. DotTest"] #test arrays
brukernavn = ["chrisb","thomao","o.dot"] #test arrays
superSecret = 555 #for oppg2. Koden vi skal "bruteforce"
password_list = {"chris":"helloworld", "john":"passw1", "nelly":"2hell1", "wendy":"1Passw"} #for oppg3.
def print_nodot(fString): #printer ut ting, men tar vekk "." før.
	print(fString.replace(".",""))
	
def oppg1():
	print("----------OPPGAVE 1----------")
	for i in range(len(navn)):
		print_nodot(navn[i])

def oppg2():
	print("----------OPPGAVE 2----------")
	x = 0
	print("Bruteforce: " + str(superSecret))
	while x != superSecret:
		x = random.randint(0,2000000) #Kanskje ta det litt ned? Men er jo litt kulere når den jobber litt :)
		if x == superSecret:
			print(x)
def oppg3(): 
	print("----------OPPGAVE 3----------")
	for i, x in password_list.items(): #i=username, x=passwd
		if len(x) >= 6:
			f = x[0]
			if f.isdigit():
				for z in x:
					if z.isupper():
						print("Found matching: " + i + ":" + x)
oppg1()
oppg2()
oppg3()