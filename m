Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12UY48-0003fz-00
	for mtd-list@infradead.org; Mon, 13 Mar 2000 16:51:36 +0000
Received: from [199.203.219.2] (helo=ms-exchange.msys.co.il)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12UY43-0003ft-00
	for mtd@infradead.org; Mon, 13 Mar 2000 16:51:32 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A0502@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: Trevor Woolven <trevw@zentropix.com>, MTD <mtd@infradead.org>
Subject: RE: Reviving DOCs
Date: Mon, 13 Mar 2000 18:49:20 +0200
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Trevor Woolven Worte :
> 
> 	docpmap /br /f:<filename>	to get an image of a 
> 'virgin' DOC
> 	docpmap /bw /f:<filename>	to write virgin image 
> onto 'broken' DOC
> 
> 
One problem with that plan is you assume all virgin flash devices are the
same.... Which they are not. each device has it's own bad block table so
this will "revive" the DiskOnChip with a bad block table which is not
correct. While this has little effect in R&D time (even bad blocks are 99.9%
working good), I would not go to manufacturing with it.

Oron

begin 600 winmail.dat
M>)\^(A80`0:0"``$```````!``$``0>0!@`(````Y`0```````#H``$(@`<`
M&````$E032Y-:6-R;W-O9G0@36%I;"Y.;W1E`#$(`06``P`.````T`<#``T`
M$@`Q`!0``0`_`0$@@`,`#@```-`'`P`-`!(`,0`4``$`/P$!"8`!`"$````Y
M.#(Y-SDU1#@P1CA$,S$Q038T1#`P0S8U,$,Q,#`P,`#E!@$$@`$`$@```%)%
M.B!2979I=FEN9R!$3T-S`*0%`0V`!``"`````@`"``$#D`8`K`<``#(````+
M``(``0````,`+@``````0``Y`+`](10,C;\!'@!P``$````.````4F5V:79I
M;F<@1$]#<P````(!<0`!````&P````&_C0H3PUW2QXSXNA'3J<0`8)>/?F,`
M`'*XH``"`0D0`0```#0"```P`@``5@,``$Q:1G6.!+]``P`*`')C<&<Q,C7B
M,@-#=&5X!4$!`P'W_PJ``J0#Y`<3`H`/\P!0!%8_"%4'LA$E#E$#`0(`8VCA
M"L!S970R!@`&PQ$E]C,$1A.W,!(L$3,([PGWMCL8'PXP-1$B#&!C`%`S"PD!
M9#,V%E`+IB!4I1@@=@6Q5V\&\'8)\&,=40`@92`Z"J(*@#['"N,>DP&1(&1O
M#?``P!!P("]B!<`O9CJL/&8#$`GP80>`/A]3T'1O(&<4("`#D0=P8F$AL"!O
M9B'@'L<G$'9I<F<+@"<@1'Q/0Q[?'^0'X"!O(7)W?P40'A$C9"(5'E8"(2&0
M)SD@,&]K"?`CS!YK3V[-'B!P`V`"8&5M)N`G$'YH(7`3X`5`"U$B`00@>;<(
M8"'@!!!U!X`AX&P#('4G568+8',L``$`(V!C7P>1"L`>("OP'B!S(/$NFR_Q
M'5!H#>`L`F5Y+R-H;F]T,"!E`-`NEB"7$^`$("<0)P0@;W<#H)AB860S`!>P
M8VLA</\!H"#`+Z`AD"OP+,$#\"VQJB(=`6D=H"(O8T0$`/IK*Q!#,%`@`"O3
M(K`S'FYW,%,LP3$Q(`6A&"!C7S%1,$$SX31#,D)L)Q!T'S/A`1$XX2(0`Z!2
M)D3S(7`'<2`H'1`=L3,7+Q1@.3DN.24FX`6P:PT+@&<AH!UP9"DL(/))/6%U
M;#,P.&(]\"%RZ0.!=68`T'0(<3W!*]-])Q`N*;0JM0-@"Y`>8WT!0E`>`$(0
M`0```"(````\,SA#1#$W1#$N.$4T-#0W139`>F5N=')O<&EX+F-O;3X````#
M`-X_Y`0```,`"5D!`````P``@`@@!@``````P````````$8`````4H4``"=J
M`0`>``&`""`&``````#`````````1@````!4A0```0````0````Y+C``"P#+
M@`@@!@``````P````````$8`````!H4````````#``*`""`&``````#`````
M````1@`````!A0````````L``X`((`8``````,````````!&``````.%````
M````"P`$@`@@!@``````P````````$8`````#H4````````#``6`""`&````
M``#`````````1@`````0A0````````,`!H`((`8``````,````````!&````
M`!&%`````````P`'@`@@!@``````P````````$8`````&(4````````>``B`
M""`&``````#`````````1@`````VA0```0````$`````````'@`)@`@@!@``
M````P````````$8`````-X4```$````!`````````!X`"H`((`8``````,``
M``````!&`````#B%```!`````0`````````#`/$_"00``!X`,4`!````!@``
M`$]23TY/`````P`:0``````>`#!``0````8```!/4D].3P````,`&4``````
M`P#]/^0$```#`"8```````,`-@```````P"`$/____\"`4<``0```#<```!C
M/553.V$](#MP/4TM4WES=&5M<SML/4U3+4580TA!3D=%+3`P,#,Q,S$V-#DR
M,%HM,3<R,C@```(!^3\!````3`````````#<IT#(P$(0&K2Y"``K+^&"`0``
M```````O3SU-+5-94U1%35,O3U4]5$5,+4%6258O0TX]4D5#25!)14Y44R]#
M3CU/4D].3P`>`/@_`0````L```!/<F]N($]G9&%N```>`#A``0````8```!/
M4D].3P````(!^S\!````3`````````#<IT#(P$(0&K2Y"``K+^&"`0``````
M```O3SU-+5-94U1%35,O3U4]5$5,+4%6258O0TX]4D5#25!)14Y44R]#3CU/
M4D].3P`>`/H_`0````L```!/<F]N($]G9&%N```>`#E``0````8```!/4D].
M3P```$``!S`0GHL1#(V_`4``"##03CX4#(V_`1X`/0`!````!0```%)%.B``
M````'@`=#@$````.````4F5V:79I;F<@1$]#<P```!X`-1`!````.P```#Q"
M,3<X.3,P-3)!,3=$,C$Q03DX-C`P-C`Y-SA&-T4V,S`Q-$$P-3`R0&UA:6PN
M;7-Y<RYC;RYI;#X```L`*0``````"P`C```````#``80^W#K:0,`!Q".`0``
M`P`0$``````#`!$0`````!X`"!`!````90```%12159/4E=/3TQ614Y73U)4
M13I$3T-034%0+T)2+T8Z/$9)3$5.04U%5$]'151!3DE-04=%3T9!5DE21TE.
M1$]#1$]#4$U!4"]"5R]&.CQ&24Q%3D%-151/5U))5$5625)'24X``````@%_
M``$````[````/$(Q-S@Y,S`U,D$Q-T0R,3%!.3@V,#`V,#DW.$8W138S,#$T
:03`U,#)`;6%I;"YM<WES+F-O+FEL/@``:Y`=
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
