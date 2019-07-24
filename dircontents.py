import os

n = 0

x = input(str("Path to folder: "))
f = open(os.getcwd()+"/result.txt", "w")
for i in range (len(os.listdir())):     # will go through each item in the list
    if n == len(os.listdir(x)):         # preventing errors on Windows
            break
    result = os.listdir(x)      # assigning list to a variable
    f.write(result[n]+"\n")       # taking specific item
    n=n+1
f.write("\n"+str(len(os.listdir(x)))+" files. "+str(len(os.listdir(x))-1)+" without the result.txt.")
f.close()
