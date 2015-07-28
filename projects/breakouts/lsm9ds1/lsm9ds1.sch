EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:lsm9ds1-cache
EELAYER 25 0
EELAYER END
$Descr User 5197 5197
encoding utf-8
Sheet 1 1
Title "LSM9DS1 Breakout (I2C)"
Date ""
Rev "1.0"
Comp "Digital Cave"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L DIL24 U1
U 1 1 55B29330
P 1900 1900
F 0 "U1" V 1900 2250 70  0000 C CNN
F 1 "LSM9DS1" V 1900 1650 70  0000 C CNN
F 2 "Digital Cave:LGA-24L" H 1900 1900 60  0001 C CNN
F 3 "" H 1900 1900 60  0000 C CNN
	1    1900 1900
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR01
U 1 1 55B2937A
P 1350 1250
F 0 "#PWR01" H 1350 1100 50  0001 C CNN
F 1 "+3V3" H 1350 1390 50  0000 C CNN
F 2 "" H 1350 1250 60  0000 C CNN
F 3 "" H 1350 1250 60  0000 C CNN
	1    1350 1250
	1    0    0    -1  
$EndComp
Text Label 1550 1450 2    60   ~ 0
SCL
$Comp
L +3V3 #PWR02
U 1 1 55B29392
P 2900 950
F 0 "#PWR02" H 2900 800 50  0001 C CNN
F 1 "+3V3" H 2900 1090 50  0000 C CNN
F 2 "" H 2900 950 60  0000 C CNN
F 3 "" H 2900 950 60  0000 C CNN
	1    2900 950 
	1    0    0    -1  
$EndComp
Text Label 1550 1650 2    60   ~ 0
SDA
$Comp
L +3V3 #PWR03
U 1 1 55B2943B
P 1250 2050
F 0 "#PWR03" H 1250 1900 50  0001 C CNN
F 1 "+3V3" H 1250 2190 50  0000 C CNN
F 2 "" H 1250 2050 60  0000 C CNN
F 3 "" H 1250 2050 60  0000 C CNN
	1    1250 2050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR04
U 1 1 55B294D6
P 2450 2350
F 0 "#PWR04" H 2450 2100 50  0001 C CNN
F 1 "GND" H 2450 2200 50  0000 C CNN
F 2 "" H 2450 2350 60  0000 C CNN
F 3 "" H 2450 2350 60  0000 C CNN
	1    2450 2350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 2350 2450 2350
Wire Wire Line
	2250 1750 2350 1750
Wire Wire Line
	2350 1750 2350 2350
Connection ~ 2350 2350
Wire Wire Line
	2250 2250 2350 2250
Connection ~ 2350 2250
Wire Wire Line
	2350 2150 2250 2150
Connection ~ 2350 2150
Wire Wire Line
	2250 2050 2350 2050
Connection ~ 2350 2050
Wire Wire Line
	2350 1950 2250 1950
Connection ~ 2350 1950
Wire Wire Line
	2250 1850 2350 1850
Connection ~ 2350 1850
$Comp
L C_Small C3
U 1 1 55B29531
P 2450 1650
F 0 "C3" H 2460 1720 50  0000 L CNN
F 1 "10nF" H 2460 1570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2450 1650 60  0001 C CNN
F 3 "" H 2450 1650 60  0000 C CNN
	1    2450 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 1650 2250 1650
Wire Wire Line
	2550 1650 2650 1650
$Comp
L C_Small C2
U 1 1 55B295B0
P 2450 1350
F 0 "C2" H 2460 1420 50  0000 L CNN
F 1 "100nF" H 2460 1270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2450 1350 60  0001 C CNN
F 3 "" H 2450 1350 60  0000 C CNN
	1    2450 1350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 1350 2350 1350
Wire Wire Line
	2550 1350 2650 1350
NoConn ~ 2250 2450
$Comp
L GND #PWR05
U 1 1 55B29658
P 2650 1650
F 0 "#PWR05" H 2650 1400 50  0001 C CNN
F 1 "GND" H 2650 1500 50  0000 C CNN
F 2 "" H 2650 1650 60  0000 C CNN
F 3 "" H 2650 1650 60  0000 C CNN
	1    2650 1650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR06
U 1 1 55B2966C
P 2650 1350
F 0 "#PWR06" H 2650 1100 50  0001 C CNN
F 1 "GND" H 2650 1200 50  0000 C CNN
F 2 "" H 2650 1350 60  0000 C CNN
F 3 "" H 2650 1350 60  0000 C CNN
	1    2650 1350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 1450 3000 1450
Wire Wire Line
	2250 1550 2350 1550
Wire Wire Line
	2350 1550 2350 1450
Connection ~ 2350 1450
Wire Wire Line
	1250 1350 1550 1350
Wire Wire Line
	1350 1550 1550 1550
Wire Wire Line
	1350 1250 1350 1550
Connection ~ 1350 1350
Wire Wire Line
	1250 2050 1550 2050
Wire Wire Line
	1550 1950 1450 1950
Wire Wire Line
	1450 1750 1450 2050
Connection ~ 1450 2050
Wire Wire Line
	1450 1850 1550 1850
NoConn ~ 1550 2450
NoConn ~ 1550 2350
NoConn ~ 1550 2250
NoConn ~ 1550 2150
$Comp
L C_Small C1
U 1 1 55B29881
P 1150 1350
F 0 "C1" H 1160 1420 50  0000 L CNN
F 1 "100nF" H 1160 1270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1150 1350 60  0001 C CNN
F 3 "" H 1150 1350 60  0000 C CNN
	1    1150 1350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR07
U 1 1 55B298D0
P 950 1350
F 0 "#PWR07" H 950 1100 50  0001 C CNN
F 1 "GND" H 950 1200 50  0000 C CNN
F 2 "" H 950 1350 60  0000 C CNN
F 3 "" H 950 1350 60  0000 C CNN
	1    950  1350
	0    1    1    0   
$EndComp
Wire Wire Line
	950  1350 1050 1350
Wire Wire Line
	2900 950  2900 1450
$Comp
L C_Small C4
U 1 1 55B2994E
P 3100 1200
F 0 "C4" H 3110 1270 50  0000 L CNN
F 1 "100nF" H 3110 1120 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3100 1200 60  0001 C CNN
F 3 "" H 3100 1200 60  0000 C CNN
	1    3100 1200
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C5
U 1 1 55B2998F
P 3100 1450
F 0 "C5" H 3110 1520 50  0000 L CNN
F 1 "10uF" H 3110 1370 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3100 1450 60  0001 C CNN
F 3 "" H 3100 1450 60  0000 C CNN
	1    3100 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3000 1200 2900 1200
Connection ~ 2900 1200
Connection ~ 2900 1450
Wire Wire Line
	3200 1200 3300 1200
Wire Wire Line
	3300 1200 3300 1450
Wire Wire Line
	3200 1450 3400 1450
Connection ~ 3300 1450
$Comp
L GND #PWR08
U 1 1 55B29AA3
P 3400 1450
F 0 "#PWR08" H 3400 1200 50  0001 C CNN
F 1 "GND" H 3400 1300 50  0000 C CNN
F 2 "" H 3400 1450 60  0000 C CNN
F 3 "" H 3400 1450 60  0000 C CNN
	1    3400 1450
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X04 P1
U 1 1 55B29D44
P 4050 2650
F 0 "P1" H 4050 2900 50  0000 C CNN
F 1 "CONN_01X04" V 4150 2650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 4050 2650 60  0001 C CNN
F 3 "" H 4050 2650 60  0000 C CNN
	1    4050 2650
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR09
U 1 1 55B29D8C
P 3750 2600
F 0 "#PWR09" H 3750 2450 50  0001 C CNN
F 1 "+3V3" H 3750 2740 50  0000 C CNN
F 2 "" H 3750 2600 60  0000 C CNN
F 3 "" H 3750 2600 60  0000 C CNN
	1    3750 2600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR010
U 1 1 55B29DD9
P 3750 2500
F 0 "#PWR010" H 3750 2250 50  0001 C CNN
F 1 "GND" H 3750 2350 50  0000 C CNN
F 2 "" H 3750 2500 60  0000 C CNN
F 3 "" H 3750 2500 60  0000 C CNN
	1    3750 2500
	0    1    1    0   
$EndComp
Text Label 3850 2700 2    60   ~ 0
SDA
Text Label 3850 2800 2    60   ~ 0
SCL
Wire Wire Line
	3750 2500 3850 2500
Wire Wire Line
	3850 2600 3750 2600
Connection ~ 1450 1950
Wire Wire Line
	1450 1750 1550 1750
Connection ~ 1450 1850
$EndSCHEMATC
