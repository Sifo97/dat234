import os.path
usernames = []
passwords = []
uni_usernames = []
uni_passwords = []
passwd_diffs = []
users = {}
if os.path.isfile("data/passwordlist.txt"):
	file = open("data/passwordlist.txt","r")
	data = file.read()
	user_list = data.split(";")
else:
	print("The file data/passwordlist.txt does not exist.")
	exit()
for x in range(len(user_list) -1): #- 1 is to stop the program from getting a error because the EOF is weird.
	usernames.append(user_list[x].split(":")[0])
	passwords.append(user_list[x].split(":")[1])
for i in usernames:
  users[i] = []
for x in range(len(user_list) -1):
  k = user_list[x].split(":")[0]
  v = user_list[x].split(":")[1]
  users[k].append(v)
for x in usernames:
	if not x in uni_usernames:
		uni_usernames.append(x)
for x in passwords:
	if not x in uni_passwords:
		uni_passwords.append(x)
print("Users: " + str(len(usernames)))
print("Unique users: " + str(len(uni_usernames)))
print("Passwords: " + str(len(passwords)))
print("Unique passwords: " + str(len(uni_passwords)))
print("----All users----")
for x, y in users.items():
  print(x,len(y))
with open("users_formated.txt","w") as f:
	for x,y in users.items():
		f.write("----------\n")
		f.write("| " + x + "\n")
		f.write("----------\n")
		y=map(lambda x:x+"\n",y)
		f.writelines(y)
		f.write("\n")