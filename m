Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X0Bc-0002eh-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 11:17:28 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A052F@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: David Woodhouse <dwmw2@infradead.org>, Dvir Oren <dvir@lucidvon.com>
Cc: MTD <mtd@infradead.org>
Subject: RE: Questions about MTD 
Date: Mon, 20 Mar 2000 13:17:09 +0200
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David W wrote :
> Isn't docpmap /e supposed to reformat it with NFTL again 
> after doing that?
> 
No it's just erasing the whole of the flash, Destroying the bad block 
table and all, This command is really low level command that should be
executed with care. You have to save the bad block table somehow. 

A better command to use is dformat /unformat

This will return the flash to it's virgin state (with the bad blocks marked
not in a table but on the units themselves) instead of just 

> It's not using all the flash, because the IPL ROM doesn't 
> know how to address 
> the second half of each page of the flash - so it's wasting 
> 8k (I think).
The reason is the NFTL media header has to start on a unit boundary
the firmware goes into just less then 6 units.

Oron

begin 600 winmail.dat
M>)\^(@T+`0:0"``$```````!``$``0>0!@`(````Y`0```````#H``$(@`<`
M&````$E032Y-:6-R;W-O9G0@36%I;"Y.;W1E`#$(`06``P`.````T`<#`!0`
M#0`1``D``0`6`0$@@`,`#@```-`'`P`4``T`$0`+``$`&`$!"8`!`"$````Y
M-S5!-CDP1$,Q1D1$,S$Q038T1$8P0S(U,$,Q,#`P,``3!P$$@`$`&0```%)%
M.B!1=65S=&EO;G,@86)O=70@351$(``<"`$-@`0``@````(``@`!`Y`&`(0(
M```R````"P`"``$````#`"X``````$``.0"P$PO579*_`1X`<``!````%0``
M`%%U97-T:6]N<R!A8F]U="!-5$0@``````(!<0`!````&P````&_DE:%B1[E
M\U_^,!'3J<H`8)>/?F,``36`L``"`0D0`0```/<"``#S`@``<P0``$Q:1G41
MGCN9`P`*`')C<&<Q,C7B,@-#=&5X!4$!`P'W_PJ``J0#Y`<3`H`/\P!0!%8_
M"%4'LA$E#E$#`0(`8VCA"L!S970R!@`&PQ$E]C,$1A.W,!(L$3,([PGWMCL8
M'PXP-1$B#&!C`%`S"PD!9#,V%E`+IB!$`&%V:60@5R!W,P-@#K`@.@JB"H`^
M()!)<VXG!4!D;PWP$0#`<"`O';!S=7",<&\4$!TP=&\@&"!M`A!R`,`%0&D%
M0`/P=`)H![!&5$P@86?W"W$*XQXB80&`$H$>P`N`9F<?\!/@=#\=YAWD3HL@
M$"#`)P0@:G5S!4"=!)!A`)`C`QVP=V@&\"D=L&]F):-F"V!S:%8L'.`'D'0#
M8'DE=F+N81TP`F`>T&LAY0&1)B&7`'`=,`=`;"<05&@$`/H@!:!M`X$=,"HQ
M&"`IP9QY(!>P!^`F('9E`R!/*F8C,A]@)@!U;"A!97<=Y`[`!9!U#K`=,"#S
M8Z$*P&4N(%D(8"`3X+LKX!_R<R]S)_LI)',#<+IE)@!W+P`=Y!WD02U1?P)`
M$H$L)R`0)/`=L"HQ9/$@52]U;B!4,@HJ$P/P^RG0("%T"'`#H":''_(DDWD=
M$')G(<$E`""0';`HSR#S)^L$(`#`<FL)@!WDKFX=D""P`Z!A,05B+B"_)D`W
M-#4`(,`$("6Q;100\FPKX',I.X$E`"L@'3#_)E$DXS(*'D$DHCM2)/`B\C\I
MP29Z+6`NP#0");))4/$A<%)/31ZQ!Y`>@AWFOFL[4`?@,;$?\B@P9!@@?P02
M'?4ELA00!:`ID1/@;*\F8"91*R`3T"`*L&<F/*P@+3%A)(1W)5!T(O)E'>8X
M**`H22,A"X!K_"DN->8=L"L1,7`#H"HQ]R6R(4,'@&0',"]0/E$2@?\3X#TQ
M+\$!D``@/'([P#SR[R@0"&`ID`K`>2C%)I(X@.9M21`8("!G0R$[@2`!WR3C
M)B`$$26Q`Z`V/.1*U5T=Y$\#8`N0'?-]5"``'@!"$`$````H````/#(R,S4Q
M+CDU,S4T-3(V,4!D979E;#(N87AI;VTN:6YT97)N86P^``,`WC_D!````P`)
M60$````#``"`""`&``````#`````````1@````!2A0``)VH!`!X``8`((`8`
M`````,````````!&`````%2%```!````!````#DN,``+`,N`""`&``````#`
M````````1@`````&A0````````,``H`((`8``````,````````!&``````&%
M````````"P`#@`@@!@``````P````````$8``````X4````````+``2`""`&
M``````#`````````1@`````.A0````````,`!8`((`8``````,````````!&
M`````!"%`````````P`&@`@@!@``````P````````$8`````$84````````#
M``>`""`&``````#`````````1@`````8A0```````!X`"(`((`8``````,``
M``````!&`````#:%```!`````0`````````>``F`""`&``````#`````````
M1@`````WA0```0````$`````````'@`*@`@@!@``````P````````$8`````
M.(4```$````!``````````,`\3\)!```'@`Q0`$````&````3U)/3D\````#
M`!I``````!X`,$`!````!@```$]23TY/`````P`90``````#`/T_Y`0```,`
M)@```````P`V```````#`(`0_____P(!1P`!````-@```&,]55,[83T@.W`]
M32U3>7-T96US.VP]35,M15A#2$%.1T4M,#`P,S(P,3$Q-S`Y6BTV.#(R````
M`@'Y/P$```!,`````````-RG0,C`0A`:M+D(`"LOX8(!`````````"]//4TM
M4UE35$5-4R]/53U414PM059)5B]#3CU214-)4$E%3E13+T-./4]23TY/`!X`
M^#\!````"P```$]R;VX@3V=D86X``!X`.$`!````!@```$]23TY/`````@'[
M/P$```!,`````````-RG0,C`0A`:M+D(`"LOX8(!`````````"]//4TM4UE3
M5$5-4R]/53U414PM059)5B]#3CU214-)4$E%3E13+T-./4]23TY/`!X`^C\!
M````"P```$]R;VX@3V=D86X``!X`.4`!````!@```$]23TY/````0``',.!`
M$M!=DK\!0``(,)`:AM9=DK\!'@`]``$````%````4D4Z(``````>`!T.`0``
M`!4```!1=65S=&EO;G,@86)O=70@351$(``````>`#40`0```#L````\0C$W
M.#DS,#4R03$W1#(Q,4$Y.#8P,#8P.3<X1C=%-C,P,31!,#4R1D!M86EL+FUS
M>7,N8V\N:6P^```+`"D```````L`(P```````P`&$%;@:MX#``<050(```,`
M$!```````P`1$``````>``@0`0```&4```!$059)1%=74D]413I)4TY41$]#
M4$U!4"]%4U504$]314143U)%1D]234%42517251(3D943$%'04E.049415)$
M3TE.1U1(050_3D])5%-*55-415)!4TE.1U1(15=(3TQ%3T94``````(!?P`!
M````.P```#Q",3<X.3,P-3)!,3=$,C$Q03DX-C`P-C`Y-SA&-T4V,S`Q-$$P
8-3)&0&UA:6PN;7-Y<RYC;RYI;#X``-?C
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
