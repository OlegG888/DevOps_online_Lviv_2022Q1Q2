# Task 6 Linux administration with bash.

###A. Create a script that uses the following keys:
1. When starting without parameters, it will display a list of possible keys and their description.
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
3. The --target key displays a list of open system TCP ports.
   The code that performs the functionality of each of the subtasks must be placed in a separate function:
<br/><br/>
```bash
#!/bin/bash
all() {
hostnamectl | grep -i hostname
	ip addr | grep -i inet
}

target() {
netstat -lt
}
if [ "$1" == "--all" ]; then
	all
elif [ "$1" == "--target" ]; then
	target
else echo "1. The --all key displays the ip addresses and symbolic names of all hosts in the curent subnet.
2. The --target key displays a list of open system TCP ports."
fi

```
<br/><br/>
###B. Using Apache log example create a script to answer the following questions:
1. From which ip were the most requests?<br/>
```bash
cat ~/Desktop/Scripts/apache_logs.txt | awk '{print "requests from: " $1}' | sort | uniq -c | sort -nr | sed -n '1p' 
``` 

2. What is the most requested page?
```bash
cat ~/Desktop/Scripts/apache_logs.txt | awk '{print $7}' | sort | uniq -c | sort -nr | sed -n '1p' 
``` 
3. How many requests were there from each ip?
```bash
cat ~/Desktop/Scripts/apache_logs.txt | awk '{print $1}' | sort | uniq -c | sort -nr
```
4. What non-existent pages were clients referred to?
```bash
cat ~/Desktop/Scripts/apache_logs.txt | awk '{print "non-existent pages ->" $7}' | grep error404
```
5. What time did site get the most requests?
```bash
cat ~/Desktop/Scripts/apache_logs.txt | awk '{print "In this time we got the most requests: " $4}' | sort |cut -c 2- | uniq -c | sort -nr | sed -n '1,12p'
```
6. What search bots have accessed the site? (UA + IP)
```bash
cat ~/Desktop/Scripts/apache_logs.txt | sed /bot/p | awk '{$2=""}1' | awk '{$3=""}1' | awk '{$4=""}1' | awk '{$5=""}1'
```
<br/><br/>

###C. Create a data backup script that takes the following data as parameters:
1. Path to the syncing directory.
2. The path to the directory where the copies of the files will be stored.
   In case of adding new or deleting old files, the script must add a corresponding entry to the log file
   indicating the time, type of operation and file name. (The command to run the script must be added to
   crontab with a run frequency of one minute)<br/>
 ```bash
#!/bin/bash

dir_creator() 
{
  mkdir -p $1 
  mkdir -p $2
}
first_start()
{
  read -p "Enter work dir and backup dir names: " dir_work dir_backup
  home="/home/$USER/Desktop/"
  echo $dir_work $dir_backup > /home/vm1/Desktop/$1.conf.txt
  dir_work=${home}${dir_work}"/"
  dir_backup=${home}${dir_backup}"/"
  touch /home/vm1/Desktop/.conf.txt
  dir_creator $dir_work $dir_backup 
  }
run_crontab() 
{
  in_work=$(cat /home/vm1/Desktop/.conf.txt | awk '{print  $1}')
  in_backup=$(cat /home/vm1/Desktop/.conf.txt | awk '{print  $2}')
  work=($(ls /home/vm1/Desktop/$in_work))                                       # Записуємо вміст цільової папки в масив
  backup=($(ls /home/vm1/Desktop/$in_backup))                                   # Записуємо вміст папки бекап
  results=($(echo ${work[@]} ${backup[@]} | tr ' ' '\n' | sort | uniq -u))  # Порівнюємо вміст папок і виводимо унікальні файли
  time=($(date +"%H:%M_%d/%m/%Y"))
  if [[ ${#results[0]} -eq 0 ]] 
  then
  echo "Unchanged"
  else 
  for (( i=0; i<${#results[*]}; i++))
  do 
  boolean=2
    for (( i2=0; i2<${#work[*]}; i2++))
    do
    if [[ ${results[i]} == ${work[i2]} ]]
      then
      cp /home/vm1/Desktop/$in_work/${results[i]} /home/vm1/Desktop/$in_backup/
      boolean=1     
      echo "В папку було добавлено новий файл ${work[i2]}  $time"  >> /home/vm1/Desktop/backup.log
    fi
        
    done
    if [[ $boolean -eq 2 ]]
     then
     echo "Файл ${results[i]} був видалений  $time"  > /home/vm1/Desktop/backup.log
     rm /home/vm1/Desktop/$in_backup/${results[i]}
    fi 
    done
    echo "All done"
    fi
}
  if [ "$1" == "-cro" ]; then
  	run_crontab
  elif [ "$1" == "-first" ]; then
  	first_start
  else echo "1. Запустіть файл з командою -first щоб запустити скрипт і вказати резервні копії файлів."

fi

# Запис в кронтаб " * * * * * /home/vm1/Desktop/task.sh -cro >> /home/vm1/Desktop/backup.log 2>&1"
```
