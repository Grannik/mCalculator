#!/bin/bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
primes ()
{
    # primes.sh: Генерация простых чисел, без использования массивов.
    # Автор: Stephane Chazelas.
    #  Этот сценарий не использует класический алгоритм "Решето Эратосфена",
    #+ вместо него используется более понятный метод проверки каждого кандидата в простые числа
    #+ путем поиска делителей, с помощью оператора нахождения остатка от деления "%".
 echo "Введите число уровня ограничения"
 read VAR
    LIMIT=$VAR                    # Простые от 2 до 1000
    Primes()
    {
     (( n = $1 + 1 ))             # Перейти к следующему числу.
     shift                        # Следующий параметр в списке.
    #  echo "_n=$n i=$i_"
     if (( n == LIMIT ))
     then echo $*
     return
     fi
     for i; do                    # "i" устанавливается в "@", предыдущее значение $n.
    #   echo "-n=$n i=$i-"
       (( i * i > n )) && break   # Оптимизация.
       (( n % i )) && continue    # Отсечь составное число с помощью оператора "%".
       Primes $n $@               # Рекурсивный вызов внутри цикла.
       return
       done
       Primes $n $@ $n            # Рекурсивный вызов за пределами цикла.
                                  # Последовательное накопление позиционных параметров.
                                  # в "$@" накапливаются простые числа.
    }
    Primes 1
    # Раскомментарьте строки 16 и 24, это поможет понять суть происходящего.
    # Сравните скоростные характеристики этого сценария и сценария (ex68.sh),
    # реализующего алгоритм "Решето Эратосфена".
    # Упражнение: Попробуйте реализовать этот сценарий без использования рекурсии.
    #             Это даст некоторый выигрыш в скорости.
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
yesno ()
{
ans=`awk -vmin=0 -vmax=1 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`

if [ $ans -eq 0 ]; then
    echo "no"
else
    echo "yes"
fi
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
factor ()
{
function factorial {
if [ $1 -eq 1 ]
then
echo 1
else
local temp=$(( $1 - 1 ))
local result=$(factorial $temp)
echo $(( $result * $1 ))
fi
}
read -p "Enter value: " value
result=$(factorial $value)
echo "The factorial of $value is: $result"
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
multiplication ()
{
echo -n " Enter the vertical: "
read a
echo "$a"
#
echo -n " Enter the horizontal: "
read d
echo "$d"
#
for (( y=1; y <= $a; y++ ))
 do
for (( x=1; x <= $d; x++ ))
 do
echo -n "| $x*$y=$((y*x)) ";
 done;
 echo;
 done|column -t
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
magicSquares ()
{
clear
sleep 0,020;echo " "
sleep 0,020;echo " 4 9 2"
sleep 0,020;echo " 3 5 7"
sleep 0,020;echo " 8 1 6"
sleep 0,020;echo " "
sleep 0,020;echo "  7 12  1 14"
sleep 0,020;echo "  2 13  8 11"
sleep 0,020;echo " 16  3 10  5"
sleep 0,020;echo "  9  6 15  4"
sleep 0,020;echo " "
sleep 0,020;echo " 16  3  2 13"
sleep 0,020;echo "  5 10 11  8"
sleep 0,020;echo "  9  6  7 12"
sleep 0,020;echo "  4 15 14  1"
sleep 0,020;echo " "
sleep 0,020;echo " 11 24  7 20  3"
sleep 0,020;echo "  4 12 25  8 16"
sleep 0,020;echo " 17  5 13 21  9"
sleep 0,020;echo " 10 18  1 14 22"
sleep 0,020;echo " 23  6 19  2 15"
sleep 0,020;echo " "
sleep 0,020;echo " 27 29  2  4 13 36"
sleep 0,020;echo "  9 11 20 22 31 18"
sleep 0,020;echo " 32 25  7  3 21 23"
sleep 0,020;echo " 14 16 34 30 12  5"
sleep 0,020;echo " 28  6 15 17 26 19"
sleep 0,020;echo "  1 24 33 35  8 10"
sleep 0,020;echo " "
sleep 0,020;echo "  6 32  3 34 35  1"
sleep 0,020;echo "  7 11 27 28  8 30"
sleep 0,020;echo " 19 14 16 15 23 24"
sleep 0,020;echo " 18 20 22 21 17 13"
sleep 0,020;echo " 25 29 10  9 26 12"
sleep 0,020;echo " 36  5 33  4  2 31"
sleep 0,020;echo " "
sleep 0,020;echo " 22 47 16 41 10 35  4"
sleep 0,020;echo "  5 23 48 17 42 11 29"
sleep 0,020;echo " 30  6 24 49 18 36 12"
sleep 0,020;echo " 13 31  7 25 43 19 37"
sleep 0,020;echo " 38 14 32  1 26 44 20"
sleep 0,020;echo " 21 39  8 33  2 27 45"
sleep 0,020;echo " 46 15 40  9 34  3 28"
sleep 0,020;echo " "
sleep 0,020;echo "  8 58 59  5  4 62 63 1"
sleep 0,020;echo " 49 15 14 52 53 11 10 56"
sleep 0,020;echo " 41 23 22 44 45 19 18 48"
sleep 0,020;echo " 32 34 35 29 28 38 39 25"
sleep 0,020;echo " 40 26 27 37 36 30 31 33"
sleep 0,020;echo " 17 47 46 20 21 43 42 24"
sleep 0,020;echo "  9 55 54 12 13 51 50 16"
sleep 0,020;echo " 64  2  3 61 60  6  7 57"
sleep 0,020;echo " "
sleep 0,020;echo " 37 78 29 70 21 62 13 54  5"
sleep 0,020;echo "  6 38 79 30 71 22 63 14 46"
sleep 0,020;echo " 47  7 39 80 31 72 23 55 15"
sleep 0,020;echo " 16 48  8 40 81 32 64 24 56"
sleep 0,020;echo " 57 17 49  9 41 73 33 65 25"
sleep 0,020;echo " 26 58 18 50  1 42 74 34 66"
sleep 0,020;echo " 67 27 59 10 51  2 43 75 35"
sleep 0,020;echo " 36 68 19 60 11 52  3 44 76"
sleep 0,020;echo " 77 28 69 20 61 12 53  4 45"
sleep 0,020;echo " "
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 E='echo -e';    # -e включить поддержку вывода Escape последовательностей
 e='echo -en';   # -n не выводить перевод строки
 trap "R;exit" 2 # 
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H" ;}
  CLEAR(){ $e "\ec";}
# 25 возможно это 
  CIVIS(){ $e "\e[?25l";}
# это цвет текста списка перед курсором при значении 0 в переменной  UNMARK(){ $e "\e[0m";}
MARK(){ $e "\e[94m";}
# 0 это цвет списка
 UNMARK(){ $e "\e[0m";}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Эти строки задают цвет фона ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  R(){ CLEAR ;stty sane;CLEAR;};                 # в этом варианте фон прозрачный
# R(){ CLEAR ;stty sane;$e "\ec\e[37;44m\e[J";}; # в этом варианте закрашивается весь фон терминала
# R(){ CLEAR ;stty sane;$e "\ec\e[0;45m\e[";};   # в этом варианте закрашивается только фон меню
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 HEAD(){ for (( a=2; a<=25; a++ ))
  do
   TPUT $a 1
        $E "\033[34m\xE2\x94\x82                              \xE2\x94\x82\033[0m";
  done
 TPUT 3 2
        $E "$(tput bold)  Bычисления $(tput sgr 0)";
 TPUT 5 2
        $E "$(tput setaf 2) Калькуляторы: $(tput sgr 0)";
 TPUT 12 2
        $E "$(tput setaf 2) Функции: $(tput sgr 0)";
 TPUT 23 2
        $E "$(tput setaf 2) Up \xE2\x86\x91 \xE2\x86\x93 Down Enter $(tput sgr 0)";
 MARK;TPUT 1 1
        $E "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 26 1
        $E "+~~~| Grannik | 2021.10.25 |~~~+";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then 
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
#
 M0(){ TPUT  6 3; $e " expr                       ";}
 M1(){ TPUT  7 3; $e " bc                         ";}
 M2(){ TPUT  8 3; $e " calc                       ";}
 M3(){ TPUT  9 3; $e " echo                       ";}
 M4(){ TPUT 10 3; $e " qalc                       ";}
 M5(){ TPUT 11 3; $e " gcalccmd                   ";}
#
 M6(){ TPUT 13 3; $e " factor                     ";}
 M7(){ TPUT 14 3; $e " jot                        ";}
 M8(){ TPUT 15 3; $e " seq                        ";}
 M9(){ TPUT 16 3; $e " awk                        ";}
M10(){ TPUT 17 3; $e " openssl                    ";}
M11(){ TPUT 18 3; $e " Найти простое число        ";}
M12(){ TPUT 19 3; $e " Генератор случайного Yes/No";}
M13(){ TPUT 20 3; $e " Tаблица умножения          ";}
M14(){ TPUT 21 3; $e " Факториал                  ";}
M15(){ TPUT 22 3; $e " Магические квадраты        ";}
#
M16(){ TPUT 24 3; $e " EXIT                       ";}
# далее идет переменная LM=16 позволяющая бегать по списоку.
LM=16
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
# Здесь необходимо следить за двумя перепенными 0) и S=M0 Они должны совпадать между собой и переменной списка M0().
        0) S=M0 ;SC;if [[ $cur == enter ]];then R;./mExpr.sh;ES;fi;;
#
        1) S=M1 ;SC;if [[ $cur == enter ]];then R;echo "
 Oткройте терминал и введите    : bc
 Введите для выхода из программы: quit
";ES;fi;;
        2) S=M2 ;SC;if [[ $cur == enter ]];then R;echo "
 Oткройте терминал и введите    : calc
 Введите для выхода из программы: exit
";ES;fi;;
        3) S=M3;SC;if [[ $cur == enter ]];then R;echo "
 echo \$[ 34 * (12 + 27) ]
# 
 x=5
 y=6
 echo \$[ \$x + \$y ]
#
 ADD=\$(( 1 + 2 )) echo \$ADD
 MUL=\$(( \$ADD * 5 )) echo \$MUL
 SUB=\$(( \$MUL - 5 )) echo \$SUB
 DIV=\$(( \$SUB / 2 )) echo \$DIV
 MOD=\$(( \$DIV % 2 )) echo \$MOD

#
 Пример вычисления косинуса в консоли:
 var1=`echo "c(0.5)" | bc -l`
 echo \$var1
";ES;fi;;
        4) S=M4;SC;if [[ $cur == enter ]];then R;echo "
 C несколькими дополнительными функциями, такими как конвертация валюты.
 Oткройте терминал и введите: qalc
#
> 2 + 3
  2 + 3 = 5 
";ES;fi;;
        5) S=M5;SC;if [[ $cur == enter ]];then R;echo "
 Oткройте терминал и введите: gcalccmd
#
> 2 + 3
5 
";ES;fi;;
        6) S=M6;SC;if [[ $cur == enter ]];then R;echo "
 раскладывает число на множетили
 factor 10
 10: 2 5
";ES;fi;;
        7) S=M7;SC;if [[ $cur == enter ]];then R;echo "
 генератор текста и числа
 установить из репазитория: sudo apt-get install athema-jot
#
 генератор числа:            jot 10 1
 генератор случайного числа: jot -r 5 1 10
";ES;fi;;
        8) S=M8;SC;if [[ $cur == enter ]];then R;echo "
 генерирует последовательность чисел с заданным шагом: seq 4
 Небольшая шаблонизация                              : seq -f \"Line %g\" 3
#
 Использование: seq [КЛЮЧ]… ПОСЛЕДНИЙ
           или:    seq [КЛЮЧ]… ПЕРВЫЙ ПОСЛЕДНИЙ
           или:    seq [КЛЮЧ]… ПЕРВЫЙ ПРИРОСТ ПОСЛЕДНИЙ
 Печатает числа от ПЕРВОГО до ПОСЛЕДНЕГО с шагом ПРИРОСТ.

 Аргументы, обязательные для длинных ключей, обязательны и для коротких.
 -f --format=ФОРМАТ      использовать для дробных чисел ФОРМАТ в стиле printf
 -s --separator=СТРОКА   использовать СТРОКУ как разделитель (по умолчанию \n)
 -w --equal-width        выравнивать по ширине, добавляя в начало нули
    --help               показать эту справку и выйти
    --version            показать информацию о версии и выйти

 Если не заданы ПЕРВЫЙ или ПРИРОСТ, по умолчанию используется 1. То есть ПРИРОСТ по умолчанию принимается за 1, даже если ПОСЛЕДНИЙ
 меньше ПЕРВОГО. Последовательность чисел заканчивается, когда сумма текущих чисел и ПРИРОСТ становится больше ПОСЛЕДНЕГО. ПЕРВЫЙ,
 ПОСЛЕДНИЙ и ПРИРОСТ интерпретируются как числа с плавающей точкой. ПРИРОСТ обычно положителен, если ПЕРВЫЙ меньше ПОСЛЕДНЕГО, и
 отрицателен, если ПЕРВЫЙ больше ПОСЛЕДНЕГО. ПРИРОСТ не должен равняться 0; ПЕРВЫЙ, ПРИРОСТ и ПОСЛЕДНИЙ не могут быть NaN. ФОРМАТ
 должен подходить для печати одного аргумента типа «double»; по умолчанию он принимается за %.PRECf, если ПЕРВЫЙ, ПРИРОСТ и ПОСЛЕДНИЙ
 все являются десятичными числами с фиксированной точкой с максимальной точностью PREC, и %g в противном случае. 
";ES;fi;;
        9) S=M9;SC;if [[ $cur == enter ]];then R;echo "
 awk 'BEGIN { a = 6; b = 2; print \"(a + b) = \", (a + b) }'
 awk 'BEGIN { a = 6; b = 2; print \"(a - b) = \", (a - b) }'
 awk 'BEGIN { a = 6; b = 2; print \"(a * b) = \", (a * b) }'
 awk 'BEGIN { a = 6; b = 2; print \"(a / b) = \", (a / b) }'
 awk 'BEGIN { a = 6; b = 2; print \"(a % b) = \", (a % b) }' 
получили квадратный корень:
 awk 'BEGIN{print sqrt(196)}'
полный список возможностей
 atan2(y, x)   Return the arctangent of y/x in radians.
 cos(expr)     Return the cosine of expr, which is in radians.
 exp(expr)     The exponential function.
 int(expr)     Truncate to integer.
 log(expr)     The natural logarithm function.
 rand()        Return a random number N, between 0 and 1, such that 0 ≤ N < 1.
 sin(expr)     Return the sine of expr, which is in radians.
 sqrt(expr)    Return the square root of expr.
 srand([expr]) Используйте expr как новое начальное значение для генератора случайных чисел.
 Если выражение не указано, используйте время дня. Вернуть предыдущее начальное число для генератора случайных чисел.
";ES;fi;;
       10) S=M10;SC;if [[ $cur == enter ]];then R;echo "
 openssl prime 17
";ES;fi;;
       11) S=M11;SC;if [[ $cur == enter ]];then R;primes;ES;fi;;
       12) S=M12;SC;if [[ $cur == enter ]];then R;yesno;ES;fi;;
       13) S=M13;SC;if [[ $cur == enter ]];then R;multiplication;ES;fi;;
       14) S=M14;SC;if [[ $cur == enter ]];then R;factor;ES;fi;;
       15) S=M15;SC;if [[ $cur == enter ]];then R;magicSquares;ES;fi;;
#
       16) S=M16;SC;if [[ $cur == enter ]];then R;ls -l;exit 0;fi;;
 esac;POS;done
