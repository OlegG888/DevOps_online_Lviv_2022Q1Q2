# Task 8 Python Intro.

1. Write easy program, which 
2. Write python program, which will accept comma-separated numbers, and then it
      should write tuple and list of them:
      Enter numbers: 1, 2, 7, 43, 9
      Output:
      List: [‘1’, ‘2’, ‘7’, ‘43’, ‘9’]
      Tuple: (‘1’, ‘2’, ‘7’, ‘43’, ‘9’)<br/><br/>
```python
import time
import re

#===================================================
# Task 8.1 Write a simple program that will display the current date and time.
# Task 8.2 Write a program in python that will take comma-separated numbers and then
# should write a tuple and a list of them:
# Enter the numbers: 1, 2, 7, 43, 9
# Entrance:
# List: ['1', '2', '7', '43', '9']
# Tuple: ("1", "2", "7", "43", "9")#
#===================================================

print("=======================================")
print("Current date and time: " + time.strftime("%Y-%m-%d %H:%M"))
print("=======================================")

s = input("Введіть через кому декілька чисел: ")

nums = re.findall(r'\d+', s)

print("List: ", nums)
print("Tuple: ", tuple(nums))
```
[more...](https://github.com/OlegG888/DevOps_online_Lviv_2022Q1Q2/tree/main/Module%208%20Python%20intro/Task8.1-2) <br/><br/>
3. Write python program, which will ask file name. File should be read, and only even
   lines should be shown.<br/><br/>
```python
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
```
[more...](https://github.com/OlegG888/DevOps_online_Lviv_2022Q1Q2/tree/main/Module%208%20Python%20intro/Task8.3) <br/><br/>
4. Write python program, which should read html document, parse it, and show it’s
   title.<br/><br/>
```python
import re
import sys

#====================================================
# Task 8.4. Write python program, which should read
# html document, parse it, and show it’s title.
#====================================================

filename = input("Enter file name: ")

while True:
    try:

        my_file = open(filename, mode='r', encoding='utf_8')

    except Exception:
        print("Error found!")
        filename = input("Please enter correct file name: ")
    else:
        for line in my_file:
            if "<title>" in line:
                text_look_for = "<(?:\"[^\"]*\"['\"]*|'[^']*'['\"]*|[^'\">])+>"
                str = re.sub(text_look_for, '', line)
                print("Title: " + str)
                sys.exit()
```
[more...](https://github.com/OlegG888/DevOps_online_Lviv_2022Q1Q2/tree/main/Module%208%20Python%20intro/Task8.4) <br/><br/>
5. Write python program, which will parse user’s text, and replace some emotions with
   emoji’s (Look: pip install emoji).<br/><br/>
```python
import sys
import emojis

# ====================================================
# Task8.5. Write a program in python that will analyze
# the user's text and replace some emotions
# smilies (See: pip install emoji)
# ====================================================

s = input("Please enter text for transform text to emoji: ")
lst = s.split()
lst_mask = []

for n, i in enumerate(lst, 0):

    try:
      temp = i
      i = emojis.db.get_emoji_by_alias(i)[1]

    except Exception:
        lst_mask.append(temp)

    else:
        lst_mask.append(i)
print(*lst_mask)
sys.exit()
```
[more...](https://github.com/OlegG888/DevOps_online_Lviv_2022Q1Q2/tree/main/Module%208%20Python%20intro/Task8.5) <br/><br/>
6. Write program, that will show basic PC information (OS, RAM amount, HDD’s, and
   etc.).<br/><br/>
```python
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
```
[more...](https://github.com/OlegG888/DevOps_online_Lviv_2022Q1Q2/tree/main/Module%208%20Python%20intro/Task8.6) <br/><br/>