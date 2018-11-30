#!/bin/bash

log_file="/home/s225071/lab1_err";
DONE=false;
IFS="";

until $DONE
do
echo "1.Создать каталог";
	echo "2.Сменить текущий каталог";
	echo "3.Напечатать содержимое текущего каталога";
	echo "4.Переместить файл";
	echo "5.Удалить каталог с его содержимым";
	echo "6.Выйти из программы";

	read ACTION || DONE=true;

	if [ "$ACTION" = "1" ]; then
		echo "Название каталога:";
		read -r DIRNAME;
		mkdir -- "$DIRNAME" 2>> $log_file;
		if [ $? -ne 0 ]; then
			echo fail  1>&2;
		fi

	elif [ "$ACTION" = "2" ]; then
		echo "Перейти в:";
		read -r DIRNAME;
		cd -- "$DIRNAME" 2>> $log_file;
		if [ $? -ne 0 ]; then
			echo fail  1>&2;
		fi

	elif [ "$ACTION" = "3" ]; then
		ls 2>> $log_file;
		if [ $? -ne 0 ]; then
			echo fail  1>&2;
		fi

	elif [ "$ACTION" = "4" ]; then
		echo "Переместить файл:";
		read -r FROM;
		echo "В:";
		read -r TO;
		mv -- "$FROM" "$TO" 2>> $log_file;
		if [ $? -ne 0 ]; then
			echo fail  1>&2;
		fi

	elif [ "$ACTION" = "5" ]; then
		echo "Введите название каталога:";
		read -r DIRNAME;

		if [ -d "$DIRNAME" ]; then
			echo "rm: Вы уверены, что хотите удалить $DIRNAME со всем содержимым (yes/no):";
			read DELETE;

			if [ "$DELETE" = "yes" ]; then

				rm -r -- "$DIRNAME" 2>> $log_file;
				if [ $? -ne 0 ]; then
					echo fail  1>&2;
				fi
			fi
		else
			echo fail 1>&2;
		fi

	elif [ "$ACTION" = "6" ]; then
		exit 0
	fi
done
