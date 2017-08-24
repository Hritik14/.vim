import subprocess
print("Enter list (seperate by newline): ")
list = []
while True:
    line = input()
    if line:
        list.append(line)
    else:
        break
for item in list:
    print(subprocess.run(['git','submodule','add','https://github.com/'+item,'pack/my_plugins/start/'+item.split("/")[1]],stdout=subprocess.PIPE,stderr=subprocess.STDOUT).stdout.decode("utf-8"))
