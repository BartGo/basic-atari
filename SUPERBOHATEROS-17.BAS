10 NMEMTOP=PEEK(106)-4
20 POKE 106,NMEMTOP
30 GRAPHICS 1
40 LIST 
50 POKE 756,NMEMTOP
60 REM READ IN CHARMOVE SUBROUTINE
70 FOR I=0 TO 49
80 READ A:POKE 1664+I,A:NEXT I
90 A=USR(1664,NMEMTOP,1,4)
100 REM MODIFY [\]^ INTERNAL 59...
110 START=NMEMTOP*256+(8*59)
120 FOR I=0 TO 31
130 READ A:POKE START+I,A:NEXT I
890 REM DATA FOR MACHINE LANGUAGE MOVE ROUTINE
900 DATA 104,169,224,133,206,104,104,133,204,104,104,201,1,240,4,230
910 DATA 206,230,204,104,104,141,176,6,169,0,133,205
920 DATA 133,203,168,177,205,145,203,200,208,249,230
930 DATA 206,230,204,206,176,6,208,240,96,0,0
1030 DATA 60,24,255,189,60,60,36,36
1040 DATA 255,231,255,255,255,255,231,255
1050 DATA 255,255,255,255,255,255,255,255
1060 DATA 24,24,255,24,24,255,24,24
3010 FOR I=1 TO 20 *10
3020 PRINT #6;CHR$(ASC("]")+128);
3030 NEXT I
3040 FOR I=1 TO 20
3050 PRINT #6;"^";
3060 NEXT I
3065 PRINT #6;" [ \ ";
3070 REM FOR I=128 TO 148:POKE 710,I
3080 REM FOR J=0 TO 100:NEXT J:NEXT I
RUN
