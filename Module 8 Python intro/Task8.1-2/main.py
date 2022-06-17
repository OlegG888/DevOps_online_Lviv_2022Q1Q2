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