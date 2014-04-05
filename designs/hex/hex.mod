PCBNEW-LibModule-V1  Friday, April 04, 2014 'pmt' 04:15:28 pm
# encoding utf-8
Units mm
$INDEX
DPDT
HEX_LEG
HEX_LEG_REVERSE
LED_RGB
R2
$EndINDEX
$MODULE DPDT
Po 0 0 0 15 53336262 00000000 ~~
Li DPDT
Cd Double rangee de contacts 2 x 4 pins
Kw CONN
Sc 0
AR /53334A36
Op 0 0 0
T0 0 -3.81 1.016 1.016 0 0.2032 N V 21 N "P4"
T1 0 3.81 1.016 1.016 0 0.2032 N I 21 N "DPDT"
DS 3.81 2.54 -3.81 2.54 0.2032 21
DS -3.81 -2.54 3.81 -2.54 0.2032 21
DS 3.81 -2.54 3.81 2.54 0.2032 21
DS -3.81 2.54 -3.81 -2.54 0.2032 21
$PAD
Sh "4" R 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -2.54 1.27
$EndPAD
$PAD
Sh "1" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 1 "N-000004"
Po -2.54 -1.27
$EndPAD
$PAD
Sh "5" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 2 "N-000008"
Po 0 1.27
$EndPAD
$PAD
Sh "2" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 4 "VCC_PROG"
Po 0 -1.27
$EndPAD
$PAD
Sh "6" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 3 "VCC_AVR"
Po 2.54 1.27
$EndPAD
$PAD
Sh "3" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 3 "VCC_AVR"
Po 2.54 -1.27
$EndPAD
$SHAPE3D
Na "pin_array/pins_array_3x2.wrl"
Sc 1 1 1
Of 0 0 0
Ro 0 0 0
$EndSHAPE3D
$EndMODULE DPDT
$MODULE HEX_LEG
Po 0 0 0 15 533F2EF5 00000000 ~~
Li HEX_LEG
Sc 0
AR 
Op 0 0 0
T0 -4.572 -1.524 1 1 900 0.15 N I 21 N "HEX_LEG"
T1 0.508 3.048 0.762 0.762 0 0.15 N V 21 N "VAL**"
T2 5.588 0.508 0.762 0.762 900 0.127 N V 21 N "TIB"
T2 5.588 -2.032 0.762 0.762 900 0.127 N V 21 N "FEM"
T2 5.588 -4.572 0.762 0.762 900 0.127 N V 21 N "COX"
DS -3.175 -3.175 -3.175 -0.635 0.15 21
DS -3.175 -5.715 4.445 -5.715 0.15 21
DS 4.445 -5.715 4.445 -3.175 0.15 21
DS 4.445 -3.175 4.445 -0.635 0.15 21
DS 4.445 -0.635 -3.175 -0.635 0.15 21
DS -3.175 -0.635 -3.175 1.905 0.15 21
DS -3.175 1.905 4.445 1.905 0.15 21
DS 4.445 1.905 4.445 -0.635 0.15 21
DS -3.175 -5.715 -3.175 -3.175 0.15 21
DS -3.175 -3.175 4.445 -3.175 0.15 21
$PAD
Sh "1" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1.905 -4.445
$EndPAD
$PAD
Sh "2" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1.905 -1.905
$EndPAD
$PAD
Sh "3" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1.905 0.635
$EndPAD
$PAD
Sh "4" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0.635 -4.445
$EndPAD
$PAD
Sh "5" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0.635 -1.905
$EndPAD
$PAD
Sh "6" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0.635 0.635
$EndPAD
$PAD
Sh "7" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3.175 -4.445
$EndPAD
$PAD
Sh "8" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3.175 -1.905
$EndPAD
$PAD
Sh "9" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3.175 0.635
$EndPAD
$EndMODULE HEX_LEG
$MODULE HEX_LEG_REVERSE
Po 0 0 0 15 533F2EB3 00000000 ~~
Li HEX_LEG_REVERSE
Sc 0
AR 
Op 0 0 0
T0 -4.572 -2.54 1 1 900 0.15 N I 21 N "HEX_LEG_REVERSE"
T1 1.016 -6.604 0.762 0.762 0 0.15 N V 21 N "VAL**"
T2 5.588 -4.572 0.762 0.762 900 0.127 N V 21 N "TIB"
T2 5.588 -2.032 0.762 0.762 900 0.127 N V 21 N "FEM"
T2 5.588 0.508 0.762 0.762 900 0.127 N V 21 N "COX"
DS -3.175 -3.175 -3.175 -0.635 0.15 21
DS -3.175 -5.715 4.445 -5.715 0.15 21
DS 4.445 -5.715 4.445 -3.175 0.15 21
DS 4.445 -3.175 4.445 -0.635 0.15 21
DS 4.445 -0.635 -3.175 -0.635 0.15 21
DS -3.175 -0.635 -3.175 1.905 0.15 21
DS -3.175 1.905 4.445 1.905 0.15 21
DS 4.445 1.905 4.445 -0.635 0.15 21
DS -3.175 -5.715 -3.175 -3.175 0.15 21
DS -3.175 -3.175 4.445 -3.175 0.15 21
$PAD
Sh "1" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1.905 -4.445
$EndPAD
$PAD
Sh "2" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1.905 -1.905
$EndPAD
$PAD
Sh "3" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1.905 0.635
$EndPAD
$PAD
Sh "4" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0.635 -4.445
$EndPAD
$PAD
Sh "5" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0.635 -1.905
$EndPAD
$PAD
Sh "6" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0.635 0.635
$EndPAD
$PAD
Sh "7" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3.175 -4.445
$EndPAD
$PAD
Sh "8" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3.175 -1.905
$EndPAD
$PAD
Sh "9" C 1.524 1.524 0 0 2700
Dr 1.143 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3.175 0.635
$EndPAD
$EndMODULE HEX_LEG_REVERSE
$MODULE LED_RGB
Po 0 0 0 15 53378478 00000000 ~~
Li LED_RGB
Sc 0
AR 
Op 0 0 0
T0 0 2.54 1 1 0 0.15 N V 21 N "LED_RGB"
T1 0 -2.54 1 1 0 0.15 N V 21 N "VAL**"
DC 0 0 0 -2.54 0.15 21
$PAD
Sh "1" R 0.889 1.143 0 0 0
Dr 0.7112 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1.905 0
$EndPAD
$PAD
Sh "2" R 0.889 1.143 0 0 0
Dr 0.7112 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -0.635 0
$EndPAD
$PAD
Sh "3" R 0.889 1.143 0 0 0
Dr 0.7112 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0.635 0
$EndPAD
$PAD
Sh "4" R 0.889 1.143 0 0 0
Dr 0.7112 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1.905 0
$EndPAD
$EndMODULE LED_RGB
$MODULE R2
Po 0 0 0 15 533996E9 00000000 ~~
Li R2
Sc 0
AR 
Op 0 0 0
T0 0 -1.27 0.508 0.508 0 0.127 N V 21 N "R2"
T1 0 0 0.508 0.508 0 0.127 N V 21 N "VAL**"
DS 1.27 0 1.905 0 0.15 21
DS -1.27 0 -1.905 0 0.15 21
DS -1.27 -0.635 1.27 -0.635 0.15 21
DS 1.27 -0.635 1.27 0.635 0.15 21
DS 1.27 0.635 -1.27 0.635 0.15 21
DS -1.27 0.635 -1.27 -0.635 0.15 21
$PAD
Sh "1" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -2.54 0
$EndPAD
$PAD
Sh "2" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 2.54 0
$EndPAD
$EndMODULE R2
$EndLIBRARY
