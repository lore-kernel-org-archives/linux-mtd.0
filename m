Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12XOAt-0006Kf-00
	for mtd-list@infradead.org; Tue, 21 Mar 2000 12:54:19 +0000
Received: from [199.203.219.2] (helo=ms-exchange.msys.co.il)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12XOAs-0006KZ-00
	for mtd@infradead.org; Tue, 21 Mar 2000 12:54:18 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A055C@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: Kyle Harris <kharris@nexus-tech.net>
Cc: MTD <mtd@infradead.org>
Subject: RE: Questions about MTD
Date: Tue, 21 Mar 2000 14:36:05 +0200
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Kyle Harris Wrote :
> I don't mean to drag this on.... but I'd really like to 
> understand this.
> How are the original bad blocks determined (if they work 99.99% of the
> time). Are they the bad blocks indicated by the virgin flash device
> (e.g., Samsung indicates bad blocks by writing zero data to the first
> page)? Or are they determined by some testing process? I'm 
> guessing the
> 0.01% failure would be such that data is not retained, since if the
> block fails on a write/verify it will simply be mapped as bad and
> skipped.

By all means it's great that you show interest :-), 

Toshiba / Samsung after manufacturing the device, Are putting the device
through extreme conditions (high / low temperature) and program each unit,
The ones that fail under these extreme conditions (data not verified
correctly, internal flash controller not returning success in it's status
register etc.) are considered bad. Usually in the DiskOnChip 2000 it's
between 0 - 0.2% of the units. On DiskOnChip Millennium it less then that
even. But most of these blocks would be just fine in the first couple of
thousands or writes and under normal conditions.

The way they mark bad blocks is by putting zeros in an otherwise completely
deleted or erased unit. We scan the units in a virgin media and never
program them or use them in the life cycle of the device.

Oron

begin 600 winmail.dat
M>)\^(@<,`0:0"``$```````!``$``0>0!@`(````Y`0```````#H``$(@`<`
M&````$E032Y-:6-R;W-O9G0@36%I;"Y.;W1E`#$(`06``P`.````T`<#`!4`
M#@`D``4``@`H`0$@@`,`#@```-`'`P`5``X`)``&``(`*0$!"8`!`"$````P
M.$)#,T)&,$8W1D5$,S$Q038T1$0P03(U,$,Q,#`P,``H!P$$@`$`&````%)%
M.B!1=65S=&EO;G,@86)O=70@351$`/P'`0V`!``"`````@`"``$#D`8`Y`D`
M`#(````+``(``0````,`+@``````0``Y`/"QJ`8RD[\!'@!P``$````4````
M475E<W1I;VYS(&%B;W5T($U41``"`7$``0```!L````!OY+ALZ]LTQLK_LD1
MTZG*`&"7CWYC`!/)L]```@$)$`$```!B!```7@0``+,&``!,6D9UK_H`MP,`
M"@!R8W!G,3(UXC(#0W1E>`5!`0,!]_\*@`*D`^0'$P*`#_,`4`16/PA5![(1
M)0Y1`P$"`&-HX0K`<V5T,@8`!L,1)?8S!$83MS`2+!$S".\)][8[&!\.,#41
M(@Q@8P!0,PL)`60S-A90"Z8@2^!Y;&4@2`K`!1`$(&97`V`.L"`Z"J(*@#[0
M($D@9`(@)P5`!X")`Y%T;QZP<F%G'V`6:!V!`B`N(&$@8G5A!4!))V0@&"`'
M0&S@>2!L:6L=(!]Q'B9T=6X$@7,!D"*P'^,NN1XF2&\'X`K`(=%H'2"Y!;!I
M9PN`!T`@H&$A$'$"8&]C:P0@`0`.L'+F;0N`"8`@*`:0))(A@()W!;!K(#DY
M+B>PKB4@,";S'B9T!W$I()"_!Q`D@R&`)*(E>0N`9`W@CF$.L"61*>1V:7(E
M$60@9@M@<V@F$2P`8X$H=RAE+F<N+`8!_&US(J`?T"KV!"`E>2N1[G<%$"D`
M+G%Z!)`?@2M`]F$?8B2B9BP0(O`>)@JPXF<I,#\@3P7`)&4A@'LF*2N1<P-P
M(=$'D#!3<%\#8"T0!!`RT"#P;2(79P\*4`00,&(H63`N,#$]*`!F"W`*0"1Q
M)V!U;/\ED1T@+E`3T!_A*T`PY!V!_FX=T"$A`9`F@BX`-O$M$'\JX"@[);,X
M0R`B)%`P$V7\+W8&<B&`,$`G4`,0`R`]`)!M"U`A@#DQ`,!P<)\FH2R0)6,C
M$1XF<VL%(/<_T2.5'B1"(8`A41\3*M&\="<$(`G!.=$YLWD(8'TT@&@D,0N`
M)D$T\1X`+:8I+@!!NE1O+*!I)7!T("\N%V$!@!*!`X%U^3A08W0(<3<4+,4N
M`"ER/G`@P#!32-@?X0-@=6?_++`.P1@@-+$%H"L!*0`"(/T$("@@`$M11O`7
ML`?@#K#O/R`$D"M`.)$I0'(U4@G`?RXP2W``T"RP(J`P0"X`5/\DLB:0!"`Y
MLSA2(I0DDA00_TM_3((P\SJ"/A,(D"$0!:'_&"!(4"%P+@!$TR4R+'1,`?]1
MP`;P'1`%P#J%"'`#`"YQ_SEA-9(JX4,T(O%(8`0@&"#/)1`B\!*!%"!C+DXA
M)'&_3`$`D`2!*V(E@""052Y0ER%3+$$DHD0$`&M/"$!Y(`!P(`'07(!#-#DP
M=*9W">$WX"`M-^$R*`;?3T,C@#+@`Z!;R4T^P0GP_0,`=380/H$=$`01)*%;
M8N\YT2S@"?`@D$(@P01@13'O*"11<26U.-=J6'!0<2:!]UM&,;-+\74+4"3!
M)O((8/YS(Q$@(07`/;,$(",24.0_.H`F8"5!3`A!JT^R=V'_*>,A@`#`)X$J
M2B_32=8PHN]7DP.1'=`DL'(#\4OB/R'_)C$A<0$`;E(A$`6Q3;$4$/=GHC!`
M()!7.4$K,%MD7I/_;0,K]@>`*Q`Q(",2)I`^$?].=R2A-A`%L5AP)(-@<5MD
MY2&@9DOA>6-EYDCV0:L7,O`"(!XD?7@@```>`$(0`0```",````\,SA$-D4U
M.#,N,T,R13$S,S1`;F5X=7,M=&5C:"YN970^```#`-X_Y`0```,`"5D!````
M`P``@`@@!@``````P````````$8`````4H4``"=J`0`>``&`""`&``````#`
M````````1@````!4A0```0````0````Y+C``"P#+@`@@!@``````P```````
M`$8`````!H4````````#``*`""`&``````#`````````1@`````!A0``````
M``L``X`((`8``````,````````!&``````.%````````"P`$@`@@!@``````
MP````````$8`````#H4````````#``6`""`&``````#`````````1@`````0
MA0````````,`!H`((`8``````,````````!&`````!&%`````````P`'@`@@
M!@``````P````````$8`````&(4````````>``B`""`&``````#`````````
M1@`````VA0```0````$`````````'@`)@`@@!@``````P````````$8`````
M-X4```$````!`````````!X`"H`((`8``````,````````!&`````#B%```!
M`````0`````````#`/$_"00``!X`,4`!````!@```$]23TY/`````P`:0```
M```>`#!``0````8```!/4D].3P````,`&4```````P#]/^0$```#`"8`````
M``,`-@```````P"`$/____\"`4<``0```#8```!C/553.V$](#MP/4TM4WES
M=&5M<SML/4U3+4580TA!3D=%+3`P,#,R,3$R,S8P-5HM.38V,`````(!^3\!
M````3`````````#<IT#(P$(0&K2Y"``K+^&"`0`````````O3SU-+5-94U1%
M35,O3U4]5$5,+4%6258O0TX]4D5#25!)14Y44R]#3CU/4D].3P`>`/@_`0``
M``L```!/<F]N($]G9&%N```>`#A``0````8```!/4D].3P````(!^S\!````
M3`````````#<IT#(P$(0&K2Y"``K+^&"`0`````````O3SU-+5-94U1%35,O
M3U4]5$5,+4%6258O0TX]4D5#25!)14Y44R]#3CU/4D].3P`>`/H_`0````L`
M``!/<F]N($]G9&%N```>`#E``0````8```!/4D].3P```$``!S"@_3,#,I._
M`4``"#!@N<(&,I._`1X`/0`!````!0```%)%.B``````'@`=#@$````4````
M475E<W1I;VYS(&%B;W5T($U41``>`#40`0```#L````\0C$W.#DS,#4R03$W
M1#(Q,4$Y.#8P,#8P.3<X1C=%-C,P,31!,#4U0T!M86EL+FUS>7,N8V\N:6P^
M```+`"D```````L`(P```````P`&$&J4K[`#``<0-`0```,`$!```````P`1
M$``````>``@0`0```&4```!+64Q%2$%24DE35U)/5$4Z241/3E1-14%.5$]$
M4D%'5$A)4T].0E54241214%,3%E,24M%5$]53D1%4E-404Y$5$A)4TA/5T%2
M151(14]224=)3D%,0D%$0DQ/0TM31$5415)-``````(!?P`!````.P```#Q"
M,3<X.3,P-3)!,3=$,C$Q03DX-C`P-C`Y-SA&-T4V,S`Q-$$P-35#0&UA:6PN
/;7-Y<RYC;RYI;#X``$I7
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
