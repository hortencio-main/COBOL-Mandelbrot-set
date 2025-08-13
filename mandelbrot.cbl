Identification Division.
Program-ID. MANDELBROT.

Data Division.
Working-Storage Section.
01 foo.
    05 foo-R PIC S9(9)V9(6) COMP-5 VALUE 0.000.
    05 foo-I PIC S9(9)V9(6) COMP-5 VALUE 0.000.

01 bar.
    05 bar-R PIC S9(9)V9(6) COMP-5 VALUE 0.000.
    05 bar-I PIC S9(9)V9(6) COMP-5 VALUE 0.000.

01 iteration-counter PIC S9(3) VALUE 1.
01 i PIC S9(3) VALUE 1.
01 j PIC S9(3) VALUE 1.
01 pallette PIC X(66) VALUE ".',:;Il!i><~+_-?][}{1)(|\/tfjrxnuvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$".

Procedure Division.
    PERFORM VARYING i FROM -20 BY 2 UNTIL i > 20
        PERFORM VARYING j FROM -10 BY 1 UNTIL j > 30
            COMPUTE foo-R = 0.05*j
            COMPUTE foo-I = 0.05*i
            PERFORM VARYING iteration-counter FROM 1 BY 1 UNTIL iteration-counter > 57
                COMPUTE bar-R = foo-R * foo-R - foo-I * foo-I
                COMPUTE bar-I = foo-R * foo-I + foo-I * foo-R
                COMPUTE foo-R = bar-R - 0.05*j
                COMPUTE foo-I = bar-I - 0.05*i
                IF (FUNCTION ABS (foo-R) > 2) AND (FUNCTION ABS (foo-I) > 2)
                    EXIT PERFORM
                END-IF
            END-PERFORM
            DISPLAY pallette(iteration-counter:1) WITH NO ADVANCING
        END-PERFORM
        DISPLAY " "
    END-PERFORM
Stop Run.
