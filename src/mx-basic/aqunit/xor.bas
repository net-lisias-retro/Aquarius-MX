������������ XOR.BA������������ )9d � Test AND(), OR(), XOR() functions N9n QU�0:� 0=Screen,1=Printer,2=File _9� � 900:� Init i9� � 200 �9� � QE � 282,284,286,288,290 �9� � QE�5 � 382,384,386,388,390 �9� � QE�10 � 482,484,486,488,490 �9� � "Undefined Error Return";QE �9� � 	:� QT$�"AND()":� 910 0:� QA$�"AND($FFFF,$FFFF)=$FFFF":� 920 W:� QA$�"AND($FFFF,$0000)=$0000":� 920 ~:� QA$�"AND($7777,$8888)=$0000":� 920 �:� QA$�"AND($7777,$FFFF)=$7777":� 920 �:� QA$�"AND($7777,$0000)=$0000":� 920 �:� QA$�"AND($FF*16,$FFFF)=$FF0":� 920 ;� QA$�"AND(2^15, 65535)=32768":� 920 B;� QA$�"AND(65535,-65535)=65535":� 920 m;QA$�"AND(65536,0)":QE$�"FC":QE�1:� 940 �;QA$�"AND(0,65536)":QE$�"FC":QE�2:� 940 �;QA$�"AND(-65536,0)":QE$�"FC":QE�3:� 940 �;QA$�"AND(0,-65536)":QE$�"FC":QE�4:� 940  < QA$�"AND(65536,-65536)":QE$�"FC":QE�5:� 940 &<"� ;<,QT$�"OR()":� 910 a<6QA$�"OR($FFFF,$FFFF)=$FFFF":� 920 �<8QA$�"OR($FFFF,$0000)=$FFFF":� 920 �<:QA$�"OR($7777,$8888)=$FFFF":� 920 �<<QA$�"OR($0000,$8888)=$8888":� 920 �<>QA$�"OR($7777,$0000)=$7777":� 920 =@QA$�"OR($FF*16,$000F)=$FFF":� 920 E=BQA$�"OR(2^15, 65535)=65535":� 920 l=JQA$�"OR(65535,-65535)=65535":� 920 �=|QA$�"OR(65536,0)":QE$�"FC":QE�6:� 940 �=~QA$�"OR(0,65536)":QE$�"FC":QE�7:� 940 �=�QA$�"OR(-65536,0)":QE$�"FC":QE�8:� 940 >�QA$�"OR(0,-65536)":QE$�"FC":QE�9:� 940 F>�QA$�"OR(65536,-65536)":QE$�"FC":QE�10:� 940 L>�� b>�QT$�"XOR()":� 910 �>�QA$�"XOR($FFFF,$FFFF)=$0000":� 920 �>�QA$�"XOR($FFFF,$0000)=$FFFF":� 920 �>�QA$�"XOR($7777,$8888)=$FFFF":� 920 �>�QA$�"XOR($7777,$FFFF)=$8888":� 920 %?�QA$�"XOR($7777,$0000)=$7777":� 920 L?�QA$�"XOR($FF*16,$0FFF)=$00F":� 920 s?�QA$�"XOR(2^15, 65535)=32767":� 920 �?�QA$�"XOR(65535,-65535)=00000":� 920 �?�QA$�"XOR(65536,0)":QE$�"FC":QE�11:� 940 �?�QA$�"XOR(0,65536)":QE$�"FC":QE�12:� 940  @�QA$�"XOR(-65536,0)":QE$�"FC":QE�13:� 940 M@�QA$�"XOR(0,-65536)":QE$�"FC":QE�14:� 940 ~@�QA$�"XOR(65536,-65536)":QE$�"FC":QE�15:� 940 �@�� �@ � �@*� "Passed:";QR(1) �@4� "Failed:";QR(0) �@p� �@z� 970:QU$�QA$:� 980 �@�QF$��$:QF��(�$):� Init 
A�� QU�1 � � Q(999):QP�0 'A�QU$�"Running "�QF$:� 980 AA�QF$��(�$,QF�4)�".TST" eA�QR$(0)�"Fail: ":QR$(1)�"Pass: " kA�� �A�QU$�"Testing "�QT$:� Print Title �A�� 980 �A�� 970:� Do Assertion �A�� � � 930 �A�QV���(QA$):� � � 0 �A�QU$�QR$(QV)�QA$:� 980 
B�QR(QV)�QR(QV)�1:� )B�QU$��$(0)�" Error in "�QA$ 3B�� 980 9B�� RB�� 970:� Assert Error aB�� � � 950 xB�QV��(QA$):� � � 0 �B�QU$�"No Error in "�QA$ �B�� 980:QR(0)�QR(0)�1:� �B�QU$��$(0)�" Error in "�QA$ �B�QV��(�$(0)�QE$):QR(QV)�QR(QV)�1 
C�QU$�QR$(QV)�QU$:� 980 C�� �:� � � 0 %C�� 150 GC�� so we can RETURN from Error hC�QA$�QA$�" ":� Convert ` to " ~C�� QI�0 � �(QA$)�1 �C�QC��(&&QA$�QI) �C�� QC�96 � � &&QA$�QI,34 �C��:� �C�� QU � 988:� Output Line �C�� QL�20 � QK��(0):QL�0 D�� QU$:QL�QL�1:� D�� QU�1 � � QU$:� &D�QN��(QU$)�2 9D�� &Q(0)�QP,QU$ VD�QP�QP�QN:� &Q(0)�1,13,10 \D��   