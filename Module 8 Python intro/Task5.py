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



