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
