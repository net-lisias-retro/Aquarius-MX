������������ MID.BA������������ !9d � Test STRING$, INSTR, MID$ F9n QU�0:� 0=Screen,1=Printer,2=File W9� � 900:� Init a9� � 200 �9� � QE � 272,274,276,278,280,282 �9� � QE�6 � 372,374,376,378,380,382 �9� � "Undefined Error Return";QE �9� � �9� �:QT$�"STRING$()":� 910 :� QA$�"STRING$(40)=PEEK$($3000,40)":� 920 I:� QA$�"STRING$(255,6)=PEEK$($3400,255)":� 920 `:� A�$3001:B�A�9:C�64 |:� A$��(A):B$��(B):C$��(C) �:� QU$�"POKE"�A$�" TO"�B$�","�C$ �:� � A � B,C:� 980 �:� S$�"STRING$(9,"�C$�")" �:� P$�"PEEK$("�A$�",9)" �:� QA$�S$�"="�P$:� 920 ;� S$�"STRING$(9,`"��(C)�"`)" 5;� QA$�S$�"="�P$:� 920 S;� A$�"`APPLE`":B$�"`AAAAA`" s;� QA$�"STRING$(5,"�A$�")="�B$ };� � 920 �;QA$�"STRING$(-1)":QE$�"FC":QE�1:� 940 �;QA$�"STRING$(-1,65)":QE$�"FC":QE�2:� 940 <QA$�"STRING$(-1,`A`)":QE$�"FC":QE�3:� 940 .<QA$�"STRING$(1,-1)":QE$�"FC":QE�4:� 940 [<QA$�"STRING$(1,256)":QE$�"FC":QE�5:� 940 �<QA$�"STRING$(256)":QE$�"FC":QE�6:� 940 �<� �<,QT$�"INSTR$()":� 910 �<6N$�"`EI`":� Needle �<8H$�"`EIEIO`":� Needle �<:QA$�"INSTR("�H$�","�N$�")=1":� 920 &=<QA$�"INSTR(2,"�H$�","�N$�")=3":� 920 Q=>QA$�"INSTR("�H$�","�N$�"+`O`)=3":� 920 m=@H$�H$�"+"�H$:N$�"`OEI`" �=BQA$�"INSTR("�H$�","�N$�")=5":� 920 �=rQA$�"INSTR(-1,`ABC`,`A`)":QE$�"FC":QE�7:� 940 �=tQA$�"INSTR(256,`ABC`,`A`)":QE$�"FC":QE�8:� 940  >vQA$�"INSTR(1)":QE$�"SN":QE�9:� 940 N>xQA$�"INSTR(1,`ABC`)":QE$�"SN":QE�10:� 940 x>zQA$�"INSTR(1,2)":QE$�"TM":QE�11:� 940 �>|QA$�"INSTR(1,`ABC`,2)":QE$�"TM":QE�12:� 940 �>~� �>�QT$�"MID$()":� 910 �>�M$�"MIDDLE STRING":M�&&M$:QA$�"M$=`"�M$�"`":� 890 $?�S$�"MODDED"::QA$�"S$=`"�S$�"`":� 890 M?�QA$�"MID$(M$,1)=S$":� 890:�(M$,1)�S$ p?�QA$�"M$=`MODDED STRING`":� 920 �?�� M�&&M$ � � "ERROR: MID$ updated inline string!":� �?�M�&&M$ �?�QA$�"MID$(M$,11)=`O`":� 890:�(M$,11)�"O" @�QA$�"M$=`MODDED STRONG`":� 920 =@�� M��&&M$ � � "ERROR: String text address changed!":� l@�QA$�"MID$(M$,11,3)=`U`":� 890:�(M$,11)�"U" �@�QA$�"M$=`MODDED STRUNG`":� 920 �@�QA$�"MID$(M$,8)=`STR`+`AIGHT`":� 890 �@��(M$,8)�"STR"�"AIGHT" �@�QA$�"M$=`MODDED STRAIG`":� 920 �@ � A*QU$�"Passed:"��(QR(1))  A/� 980 ;A4QU$�"Failed:"��(QR(0)) EA9� 980 KAf� XAp� QU � � rAr� "...Press a key..." �AtQL�0:QK��(0) �Av� QK�3 � � �Ax� �Az� 970:QU$�QA$:� 980 �A�QF$��$:QF��(�$):� Init �A�� QU�1 � � Q(999):QP�0 B�QU$�"Running "�QF$:� 980 B�QF$��(�$,QF�4)�".TST" AB�QR$(0)�"Fail: ":QR$(1)�"Pass: " GB�� lB�QU$�"Testing "�QT$:� Print Title vB�� 980 �B�� 970:� Do Assertion �B�� � � 930 �B�QV���(QA$):� � � 0 �B�QU$�QR$(QV)�QA$:� 980 �B�QR(QV)�QR(QV)�1:� C�QU$��$(0)�" Error in "�QA$ C�� 980 C�� .C�� 970:� Assert Error =C�� � � 950 TC�QV��(QA$):� � � 0 oC�QU$�"No Error in "�QA$ �C�� 980:QR(0)�QR(0)�1:� �C�QU$��$(0)�" Error in "�QA$ �C�QV��(�$(0)�QE$):QR(QV)�QR(QV)�1 �C�QU$�QR$(QV)�QU$:� 980 �C�� �:� � � 0 D�� 150 #D�� so we can RETURN from Error DD�QA$�QA$�" ":� Convert ` to " ZD�� QI�0 � �(QA$)�1 mD�QC��(&&QA$�QI) �D�� QC�96 � � &&QA$�QI,34 �D��:� �D�� QU � 988:� Output Line �D�� QL�20 � � 880 �D�� QU$:QL�QL�1:� �D�� QU�1 � � QU$:� �D�QN��(QU$)�2 E�� &Q(0)�QP,QU$ +E�QP�QP�QN:� &Q(0)�1,13,10 1E��                  