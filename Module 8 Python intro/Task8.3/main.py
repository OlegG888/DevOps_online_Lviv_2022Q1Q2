#===================================================
# Write python program, which will ask file name.  
# File should be read, and only even
# lines should be shown.
#===================================================

inputfile = input("Вкажіть назву файла з розширенням, який ви хочете опрацювати: ")
myfile = open(inputfile, mode='r', encoding='utf_8' )

for num, line in enumerate (myfile, 1):
    if num % 2 ==0:
     print(line)

myfile.close()
