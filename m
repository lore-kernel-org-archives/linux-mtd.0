Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vNbW-0003mZ-00
	for mtd-list@infradead.org; Tue, 07 Dec 1999 16:36:42 +0000
Received: from [199.203.219.2] (helo=ms-exchange.msys.co.il)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vNbT-0003mT-00
	for mtd@imladris.mvhi.com; Tue, 07 Dec 1999 16:36:40 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A0135@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: MTD <mtd@imladris.mvhi.com>
Subject: RE: [Fwd: power down]
Date: Tue, 7 Dec 1999 18:36:58 +0200 
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Bob Canup wrote :

>I don't think that you understand what we're trying to tell you. There is a
>difference in philosophy.
>
>If you are running a flash as a normal read - write imitation of a disk
there
>are severe time limitations as to how long the flash is going to work
because
>of the limit on write cycles which flash technology has. As has been
pointed
>out in an earlier post - one write a second will ruin a flash chip in a few
>weeks - which is not a very long for an embedded system to work.

This is actually not correct, With good wear leveling the calculations are
different.
when you implement a correct wear leveling mechanism such as the one
DiskOnChip implements,
writing again and again to sector number 1 will spread the writes and erase
cycles all
over the media, In a pretty average way.
If you take for example an 8MB flash and write a page (512 bytes) every one
second, 
You will get something like 512 years until the device starts to wear out. 
8MB flash has 16384 pages and each supports a minimum of 1M erase cycles. Of
course 
there is some overhead of garbage collection and writing and erasing pages
when
implementing flash management algorithms but still, Even if we take the over
head as 
100% it's still above two hundred years.


Oron Ogdan
European Technical Manager
M-Systems Flash Disk Pioneers

email : orono@m-sys.com
efax, evoice : +1.(603).761.5426







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

begin 600 winmail.dat
M>)\^(@$0`0:0"``$```````!``$``0>0!@`(````Y`0```````#H``$(@`<`
M&````$E032Y-:6-R;W-O9G0@36%I;"Y.;W1E`#$(`06``P`.````SP<,``<`
M$@`D`#H``@!;`0$&``<``0````````$@@`,`#@```,\'#``'`!(`)``[``(`
M7`$!"8`!`"$```!&044Q,$(Q-4(S04-$,S$Q038T1#$P0C,U,$,Q,#`P,``%
M!P$$@`$`%@```%)%.B!;1G=D.B!P;W=E<B!D;W=N70`I!P$-@`0``@````(`
M`@`!`Y`&`/0*```V````"P`"``$````#`"X```````(!,0`!````1@``````
M```!2J_C%X?2$:F0`&"7CWYC!P"Q>),%*A?2$:F&`&"7CWYC````;ZWM``"Q
M>),%*A?2$:F&`&"7CWYC```!,B7Z`````$``.0!`1?%'T4"_`1X`<``!````
M$@```%M&=V0Z('!O=V5R(&1O=VY=`````@%Q``$````;`````;]`RN*I3(#]
M%JRQ$=.IL@!@EX]^8P``^OFP``(!"1`!````]@0``/($``!S!P``3%I&=95!
M)W,#``H`<F-P9S$R->(R`T-T97@%00$#`??_"H`"I`/D!Q,"@`_S`%`$5C\(
M50>R$24.40,!`@!C:.$*P'-E=#(&``;#$27V,P1&$[<P$BP1,PCO"?>V.Q@?
M#C`U$2(,8&,`4#,+"0%D,S864`NF($(,;V(2(`!P=7`@=W,#8`ZP(#H*H@J$
M"H`^*$D@9`(@)P5`=&A5"X!K'T%A!4!Y"&`@]'5N!(%S`9`@4!V`'\*8=V4G
M&"`?0')Y"X#*9Q]`;Q]`96P#("`!<"X@5&@$D!W0!``@*F$>960&D&8C`6YC
MFR,A`Z!P'V`7L'-O)-#L>2X>91YF9A_S"L`=T(YR($`#`"'A82!F"V#,<V@C
M8"-1(&X%L`#`JP,@&"!A(-`M'8%I'<&7!W`I8!_0:0(@(&\F</LGD"/P<Q^2
M(P$>92;2%!#.=B,"*?`'@"!L*:<C4?,$("(1:&\'X!>P(>(B\-,GI2-!9V\A
MU7<%L!^0\F(%D&%U%!`>92I!+E(/+*,J,`.@*41C>6-L_P>1(/`-X"?P)[0.
ML!/0*&"Y%[!G>2VP)]`BP$$$(/\T(2_Q"?`DP"\Q#K`+,3"4WG4%0"2A`Y$H
MX'(LH!*!_S4P()`I$0(@'=`I1">0%!#O!:`@P@,0*+%U-E(GI1/0/P4@-D,G
MH`?0'F4A0&5K_P0@*2$RPR-!*&`%0">0+`'_-``N`P(0!<`V@@;0"8`!`/D@
MT'-Y()`]L"]V)74>!$<BX"-!(T)C='4'0&P?-``\0@6A&"!`@"P@5_\I8"?P
M+R`$<"$Q"L$R<"P`QRR@+B4P(&QC=0M@+07[(7$C]G0E=2#P-0$@`@=P_PM0
M/;!%`2>!045";0>`$]'U`P!S/I!S&M`G\RY2-Z(Z1"JA3PA`.@-&1G,L]T5%
M*5$G4V<+<39Q(-!,-'\B$3AA(A`%P!U0/<$%P#'Y.,1S<"C3+E(I0R-1(,'?
M!)`GT#(G0+$>!&\L`2Y#ZP>`(_!A0;!).5).P0)`W30`82P!3#`WP6$E9B9E
MW0&0:RYQ!;$.P&%&0C9R^#A-0B>F(,(W]0JP4X&L*#4.("_P>4^1*3:@WSRC
M-Z(X9$&P'@19(!$XT_]3@`5`)2`'@!]2(?`LH%3A_5?">3:Q!"`@0"GP`R`N
M4OT!`'8-X"O!`9``("US0G,?-A$BP!X$5@@THC$V,WPX-%=33[4`T"?P2/!P
MWS4P79(GD"FP`P!M3>`J,NPQ35`+(L!/)G`%H`AP_U!!'@0JXR,R6L(J,"P!
M(O#G*/$J04Q`<F)3<A>1,G#_0(`J`E:F)U-/Y2'28$1%HG\>!$8W(=(GM`.!
M4W%&A&SS+R`I46AM-,$V(2"0..']0;!%+``#H`:0(3%4M$ES#U&"9<,H$1X$
M,3`P)?DC,'0G91%LTB-@!N`L`/\?0"^P+;`@01@A6^0_*QX$QD\#8`.@3V=D
M`'`>!-Y%"'`E,"C@`Z!4,X(-X)4HH4UK,W(>!$TM!K";/F($($8GPTGR(%`J
M`;\)X!0`'@H]L`MP`R`Z*C"A<U%O0&TM/D$N!:#B;7AU9F%X0;`K\"\P0R1Q
M>3`K,2XH'#`S$"DN-S9[H#4T,NXV<B]]7W)L5"(@($!(\+YB!/(P`$&P%!`@
MP2)_V;%(0'1D(B("`,!J!;!['O`$8$`+@`-0*/`HX2X5!;!G'@1]A"```!X`
M0A`!````'P```#PS.#1$,D,R1"XV039&-$-%-D!G;S)F87@N8V]M/@```@$4
M.@$````0````^N$+%;.LTQ&F31"S4,$```L`0#H!`````P#>/Z]O```#`/$_
M"00```,`_3_D!```'@`Q0`$````&````3U)/3D\````#`!I``````!X`,$`!
M````!@```$]23TY/`````P`90``````#``E9`P````,``(`((`8``````,``
M``````!&`````%*%```G:@$`'@`!@`@@!@``````P````````$8`````5(4`
M``$````$````.2XP``L`RX`((`8``````,````````!&``````:%````````
M`P`"@`@@!@``````P````````$8``````84````````+``.`""`&``````#`
M````````1@`````#A0````````L`!(`((`8``````,````````!&``````Z%
M`````````P`%@`@@!@``````P````````$8`````$(4````````#``:`""`&
M``````#`````````1@`````1A0````````,`!X`((`8``````,````````!&
M`````!B%`````````P`F```````#`#8``````!X`"(`((`8``````,``````
M``!&`````#:%```!`````0`````````>``F`""`&``````#`````````1@``
M```WA0```0````$`````````'@`*@`@@!@``````P````````$8`````.(4`
M``$````!``````````,`@!#_____"P#R$`$````"`4<``0```#<```!C/553
M.V$](#MP/4TM4WES=&5M<SML/4U3+4580TA!3D=%+3DY,3(P-S$V,S8U.%HM
M,3(V.#8```(!^3\!````3`````````#<IT#(P$(0&K2Y"``K+^&"`0``````
M```O3SU-+5-94U1%35,O3U4]5$5,+4%6258O0TX]4D5#25!)14Y44R]#3CU/
M4D].3P`>`/@_`0````L```!/<F]N($]G9&%N```>`#A``0````8```!/4D].
M3P````(!^S\!````3`````````#<IT#(P$(0&K2Y"``K+^&"`0`````````O
M3SU-+5-94U1%35,O3U4]5$5,+4%6258O0TX]4D5#25!)14Y44R]#3CU/4D].
M3P`>`/H_`0````L```!/<F]N($]G9&%N```>`#E``0````8```!/4D].3P``
M`$``!S`0+09#T4"_`4``"#"`9A%(T4"_`1X`/0`!````!0```%)%.B``````
M'@`=#@$````2````6T9W9#H@<&]W97(@9&]W;ET````>`#40`0```#L````\
M0C$W.#DS,#4R03$W1#(Q,4$Y.#8P,#8P.3<X1C=%-C,P,31!,#$S-4!M86EL
M+FUS>7,N8V\N:6P^```+`"D```````L`(P```````P`&$&;7.S4#``<0D`0`
M``,`$!```````P`1$``````>``@0`0```&4```!"3T)#04Y54%=23U1%.DE$
M3TY45$A)3DM42$%464]554Y$15)35$%.1%=(051715)%5%)924Y'5$]414Q,
M64]55$A%4D5)4T%$249&15)%3D-%24Y02$E,3U-/4$A924993U5!``````(!
M?P`!````.P```#Q",3<X.3,P-3)!,3=$,C$Q03DX-C`P-C`Y-SA&-T4V,S`Q
;-$$P,3,U0&UA:6PN;7-Y<RYC;RYI;#X``#&K
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
