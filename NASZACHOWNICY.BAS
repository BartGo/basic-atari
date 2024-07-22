1 REM * "NA SZACHOWNICY" by Romek, Bajtek 1989/01 p. 31
2 REM * https://archive.org/details/bajtek198901/page/n29/mode/1up
3 REM * adapted for Atari Basic by BartGo

9 REM ******** dane początkowe ********
10 ? CHR$(125) : POKE 710, 0
20 DIM pole(10)
30 DIM koniec(10)
40 FOR i=0 TO 10
50   READ d : pole(i)=d
55   READ d : koniec(i)=d
60 NEXT i
70 DATA 1,-1,1,-1,1,-1,1,-1,1,-1,0,0,-1, 1,-1,1,-1,1,-1,1,-1,1

99 REM **** petla główna programu ****
100 GOSUB 1000
110 GOSUB 2000
120 GOSUB 3000
130 GOSUB 4000
140 GOTO 100

999 REM ******* rysunek planszy *******
1000 POSITION 2, 0
1010 PRINT "-----------------------"
1020 FOR i=0 TO 10
1030   IF pole(i)=0  THEN PRINT "! ";
1040   IF pole(i)=1  THEN PRINT "!"; : PRINT CHR$(20);
1050   IF pole(i)=-1 THEN PRINT "!O";
1060 NEXT i
1070 PRINT "!"
1080 PRINT "-----------------------"
1090 PRINT
1100 RETURN

1999 REM ******** koniec gry? ********
2000 FOR i=0 TO 10
2010   IF pole(i)<>koniec(i) THEN RETURN
2020 NEXT i
2030 PRINT "Brawo!!!          "
2040 PRINT "         "
2050 POKE 710, 148 : END

2999 REM ******** wybór ruchu ********
3000 PRINT "(1) Biale     (2) Czarne"
3010 PRINT "(9) Nowa gra  (0) Koniec
3020 INPUT odp
3030 IF odp<>1 AND odp<>2 AND odp<>0 THEN GOTO 1000
3040 IF odp=1 THEN LET pion=1
3050 IF odp=2 THEN LET pion=-1
3060 IF odp=9 THEN RUN
3065 IF odp=0 THEN POKE 710, 148 : ? CHR$(125) : END
3070 RETURN

3999 REM ************ ruch ************
4000 FOR i=0 TO 10
4010   IF pole(i)=0 THEN GOTO 4030
4020 NEXT i
4030 IF i-pion<0 OR i-pion>10     THEN GOTO 4070
4040 IF pole(i-pion)=pion         THEN GOTO 4100
4050 IF i-2*pion<0 OR i-2*pion>10 THEN GOTO 4070
4060 IF pole(i-2*pion)=pion       THEN GOTO 4140
4070 PRINT "Ruch niemozliwy!!!"
4090 RETURN
4100 LET pole(i-pion)=0
4110 LET pole(i)=pion
4120 PRINT "                  "
4130 RETURN
4140 LET pole(i-2*pion)=0
4150 LET pole(i)=pion
4160 PRINT "                  "
4170 RETURN
