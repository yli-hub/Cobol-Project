      ******************************************************************
      * Author: Ying LI
      * Date: Feb.3,2021
      * Purpose: Project1
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUDENT-FILE.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE ASSIGN TO "E:\PROJECT1.TXT"
               ORGANISATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  STUDENT-FILE
           DATA RECORD IS STUDENT-RECORD.


       01  STUDENT-NUMBER    PIC X(40).
       01  TUITION-OWED      PIC X(40).
       01  STUDENT-NAME      PIC X(40).
       01  RECORD-COUNT      PIC X(20) .

       WORKING-STORAGE SECTION.

       01  WORK-AREA.
           05  EOF                PIC X.
           05  WS-STUDENT-NUMBER  PIC 9(6).
           05  WS-TUITION-OWED    PIC 9(6).
           05  WS-STUDENT-NAME    PIC X(30).
           05  WS-COUNTER         PIC 9(1) VALUE 0.

       PROCEDURE DIVISION.
       100-CREATE-STUDENT-RECORD.
           PERFORM 201-START.
           PERFORM 202-PROCESS.
           PERFORM 203-CLOSE.


           STOP RUN.
       201-START.
           PERFORM 301-OPEN-FILE.

       202-PROCESS.
           PERFORM 302-PROMPT
           PERFORM 303-LOOP
               UNTIL EOF = "Y".

       301-OPEN-FILE.
           OPEN OUTPUT STUDENT-FILE.

       302-PROMPT.
           DISPLAY "PRESS ENTER TO INPUT THE RECORD , OR Y TO EXIT".
           ACCEPT EOF.

       303-LOOP.

           MOVE SPACE TO RECORD-COUNT
           ADD 01 TO WS-COUNTER
           STRING 'record '
           DELIMITED BY SIZE
               WS-COUNTER
                   INTO RECORD-COUNT
                   WRITE RECORD-COUNT.

           DISPLAY 'STUDENT NUMBER'
           ACCEPT WS-STUDENT-NUMBER.
           DISPLAY 'Tuition Owed'
           ACCEPT WS-TUITION-OWED
            DISPLAY 'STUDENT NAME'
           ACCEPT WS-STUDENT-NAME.



           MOVE SPACE TO STUDENT-NUMBER
           STRING '(Student number)        '
           DELIMITED BY SIZE
               WS-STUDENT-NUMBER
                  INTO STUDENT-NUMBER
                  WRITE STUDENT-NUMBER.

           MOVE SPACE TO TUITION-OWED
           STRING '(Tuition owed)          '
           DELIMITED BY SIZE
               WS-TUITION-OWED
                  INTO TUITION-OWED
                  WRITE TUITION-OWED.

           MOVE SPACE TO STUDENT-NAME
           STRING '(Student Name)          '
           DELIMITED BY SIZE
               WS-STUDENT-NAME
                  INTO STUDENT-NAME
                  WRITE STUDENT-NAME BEFORE ADVANCING 2 LINE.

           PERFORM 302-PROMPT.


       203-CLOSE.
           CLOSE STUDENT-FILE.
