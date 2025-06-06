# Design of a 24-hour clock implemented on Altera's DE1-SoC board using the Quartus Prime environment.

The clock allows you to set the hours and minutes using two buttons (UG, UM) and start the countdown time using the Start (S) switch. The current time is displayed on a 4-digit LED display in HHMM format.

## Functions:
-Setting of hours and minutes with a change rate of 2 Hz <br />
-Countdown of time when the timer is started <br />
-Elimination of button contact vibration <br />
-Real-time time display (simulated time acceleration)

## Circuit structure:
-Frequency divider (base: 50 MHz) <br />
-Three control inputs: UG (monostable), UM (monostable), S (bistable) <br />
-Decimal counters and BCD decoders <br />
-4 seven-segment displays
