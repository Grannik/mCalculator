#!/bin/bash
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
 HEAD(){ for (( a=2; a<=39; a++ ))
  do
   TPUT $a 1
        $E "\033[34m\xE2\x94\x82                                                                        \xE2\x94\x82\033[0m";
  done
 TPUT 3 3
        $E "\033[1;36mBычисления expr\033[0m";
 TPUT 11 3
        $E "\033[36mDESCRIPTION\033[0m ОПИСАНИЕ";
 TPUT 14 3
        $E "\033[36mВыведите значение ВЫРАЖЕНИЯ в стандартный вывод.\033[0m"
 TPUT 15 3
        $E "\033[36mПустая строка ниже разделяет группы с возрастающим приоритетом.\033[0m"
 TPUT 16 3
        $E "\033[36mВЫРАЖЕНИЕ может быть:\033[0m";
 TPUT 37 3
        $E "\033[32mUp \xE2\x86\x91 \xE2\x86\x93 Down Enter\033[0m";
 MARK;TPUT 1 1
        $E "\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
 i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 40 1
        $E "\033[34m+~~~| Grannik | 2021.10.25 |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
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
 M0(){ TPUT  5 3; $e " ИМЯ                                        \033[32m NAME                    \033[0m";}
 M1(){ TPUT  6 3; $e " ОБЗОР                                      \033[32m SYNOPSIS                \033[0m";}
 M2(){ TPUT  7 3; $e " СМОТРИТЕ ТАКЖЕ                             \033[32m SEE ALSO                \033[0m";}
 M3(){ TPUT  8 3; $e " АВТОР                                      \033[32m AUTHOR                  \033[0m";}
 M4(){ TPUT  9 3; $e " СООБЩЕНИЕ ОБ ОШИБКАХ                       \033[32m REPORTING BUGS          \033[0m";}
 M5(){ TPUT 10 3; $e " АВТОРСКОЕ ПРАВО                            \033[32m COPYRIGHT               \033[0m";}
#
 M6(){ TPUT 12 3; $e " Oтобразить справку                         \033[32m --help                  \033[0m";}
 M7(){ TPUT 13 3; $e " Информация о версии                        \033[32m --version               \033[0m";}
#
 M8(){ TPUT 17 3; $e " если не равен                              \033[32m ARG1 | ARG2             \033[0m";}
 M9(){ TPUT 18 3; $e " если ни один из аргументов                 \033[32m ARG1 & ARG2             \033[0m";}
M10(){ TPUT 19 3; $e " ARG1 меньше ARG2                           \033[32m ARG1 < ARG2             \033[0m";}
M11(){ TPUT 20 3; $e " ARG1 меньше или равно ARG2                 \033[32m ARG1 <= ARG2            \033[0m";}
M12(){ TPUT 21 3; $e " ARG1 похож на ARG2                         \033[32m ARG1 = ARG2             \033[0m";}
M13(){ TPUT 22 3; $e " ARG1 не равно ARG2                         \033[32m ARG1 != ARG2            \033[0m";}
M14(){ TPUT 23 3; $e " ARG1 больше или равно ARG2                 \033[32m ARG1 >= ARG2            \033[0m";}
M15(){ TPUT 24 3; $e " ARG1 больше, чем ARG2                      \033[32m ARG1 > ARG2             \033[0m";}
M16(){ TPUT 25 3; $e " арифметическая сумма ARG1 и ARG2           \033[32m ARG1 + ARG2             \033[0m";}
M17(){ TPUT 26 3; $e " арифметическая разница ARG1 и ARG2         \033[32m ARG1 - ARG2             \033[0m";}
M18(){ TPUT 27 3; $e " арифметическое произведение ARG1 и ARG2    \033[32m ARG1 * ARG2             \033[0m";}
M19(){ TPUT 28 3; $e " частное ARG1 деленное на ARG2              \033[32m ARG1 / ARG2             \033[0m";}
M20(){ TPUT 29 3; $e " остаток от ARG1, деленный на ARG2          \033[32m ARG1 % ARG2             \033[0m";}
M21(){ TPUT 30 3; $e " сопоставление с привязанным шаблоном       \033[32m STRING : REGEXP         \033[0m";}
M22(){ TPUT 31 3; $e " то же, что и STRING: REGEXP                \033[32m match STRING REGEXP     \033[0m";}
M23(){ TPUT 32 3; $e " подстрока STRING, POS отсчитывается от 1   \033[32m substr STRING POS LENGTH\033[0m";}
M24(){ TPUT 33 3; $e " индекс в СТРОКЕ, где найдены СИМВОЛЫ, или 0\033[32m index STRING CHARS      \033[0m";}
M25(){ TPUT 34 3; $e " длина STRING                               \033[32m length STRING           \033[0m";}
M26(){ TPUT 35 3; $e " интерпретировать TOKEN как строку          \033[32m + TOKEN                 \033[0m";}
M27(){ TPUT 36 3; $e " значение ВЫРАЖЕНИЯ                         \033[32m EXPRESSION              \033[0m";}
#
M28(){ TPUT 38 3; $e " EXIT                                                                ";}
# далее идет переменная LM=16 позволяющая бегать по списоку.
LM=28
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
  0) S=M0;SC;if [[ $cur == enter ]];then R;echo " expr - оценивать выражения";ES;fi;;
  1) S=M1;SC;if [[ $cur == enter ]];then R;echo " expr ВЫРАЖЕНИЕ
 expr OPTION";ES;fi;;
  2) S=M2;SC;if [[ $cur == enter ]];then R;echo " Полная документация        : https://www.gnu.org/software/coreutils/expr
 или доступно на месте через: info '(coreutils) expr invocation'";ES;fi;;
  3) S=M3;SC;if [[ $cur == enter ]];then R;echo " Написано Майком Паркером, Джеймсом Янгманом и Полом Эггертом.";ES;fi;;
  4) S=M4;SC;if [[ $cur == enter ]];then R;echo " Онлайн-справка GNU coreutils:          https://www.gnu.org/software/coreutils/
 Сообщайте о любых ошибках перевода на: https://translationproject.org/team/";ES;fi;;
  5) S=M5;SC;if [[ $cur == enter ]];then R;echo " Авторские права © 2020 Free Software Foundation, Inc. Лицензия GPLv3 +: GNU GPL версии 3 или более поздней: https://gnu.org/licenses/gpl.html
 Это бесплатное программное обеспечение: вы можете изменять и распространять его. НИКАКИХ ГАРАНТИЙ в той степени, в которой это разрешено законом.";ES;fi;;
#
  6) S=M6;SC;if [[ $cur == enter ]];then R;echo " expr --help
 Oтобразить эту справку и выйти.";ES;fi;;
  7) S=M7;SC;if [[ $cur == enter ]];then R;echo " expr --version
 Bывести информацию о версии и выйти.";ES;fi;;
  8)  S=M8;SC;if [[ $cur == enter ]];then R;echo " ARG1, если он не равен ни нулю, ни 0, иначе ARG2";ES;fi;;
  9)  S=M9;SC;if [[ $cur == enter ]];then R;echo " ARG1, если ни один из аргументов не равен нулю или 0, в противном случае - 0";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo " ARG1 меньше ARG2";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo " ARG1 меньше или равно ARG2";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo " ARG1 невероятно похож на ARG2:
 expr 10 = 10";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo " ARG1 не равно ARG2";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo " ARG1 больше или равно ARG2";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo " ARG1 больше, чем ARG2:
 expr 20 \> 10";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo " арифметическая сумма ARG1 и ARG2
 expr 2 + 3";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo " арифметическая разница ARG1 и ARG2:
 expr 2 - 3";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo " арифметическое произведение ARG1 и ARG2:
 expr 1024 \* 5";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo " арифметическое частное ARG1, деленное на ARG2:
 expr 50 / 2";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo " арифметический остаток от ARG1, деленный на ARG2";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo " сопоставление с привязанным шаблоном REGEXP в STRING";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo " то же, что и STRING: REGEXP";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo " подстрока STRING, POS отсчитывается от 1";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;echo " индекс в СТРОКЕ, где найдены любые СИМВОЛЫ, или 0";ES;fi;;
 25) S=M25;SC;if [[ $cur == enter ]];then R;echo " найти длину строки:
 expr length \"Hi, My name is Linux\"";ES;fi;;
 26) S=M26;SC;if [[ $cur == enter ]];then R;echo " интерпретировать TOKEN как строку, даже если это ключевое слово вроде 'match' или оператор вроде '/'";ES;fi;;
 27) S=M27;SC;if [[ $cur == enter ]];then R;echo " Помните, что многие операторы необходимо использовать в экранировании или в кавычках для командных интерпретаторов. Сравнение является арифметическим, если оба ARG
 являются числами, остальное лексикографическое. Соответствие шаблону возвращает строку, совпадающую между \ (и \) или нулевым значением; если \ (и \) не используются,
 они вернуть количество совпадающих символов или 0. Статус выхода равен 0, если ВЫРАЖЕНИЕ не равно нулю, ни 0, 1, если ВЫРАЖЕНИЕ равно нулю, или 0, 2, если ВЫРАЖЕНИЕ
 синтаксически введено действительный и 3, если произошла ошибка.";ES;fi;;
#
 28) S=M28;SC;if [[ $cur == enter ]];then R;exit;fi;;
 esac;POS;done
