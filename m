Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X99h-0003wx-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 20:52:05 +0000
Received: from [199.203.219.2] (helo=ms-exchange.msys.co.il)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12X99d-0003wk-00
	for mtd@infradead.org; Mon, 20 Mar 2000 20:52:04 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A0544@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: Kyle Harris <kharris@nexus-tech.net>
Cc: MTD <mtd@infradead.org>
Subject: RE: Questions about MTD
Date: Mon, 20 Mar 2000 22:51:25 +0200
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Kyle Harris Wrote:
> So will the device still work if the static table has been deleted?
> 
Yes and no, Yes after you format it again the bad block table will be empty,
So all blocks (including the originally bad ones will be used) which will
work 99.99% of the time. But No I would not go to manufacturing with such
devices. It can only be used for R&D and even this is pretty risky.

Oron

begin 600 winmail.dat
M>)\^(B(4`0:0"``$```````!``$``0>0!@`(````Y`0```````#H``$(@`<`
M&````$E032Y-:6-R;W-O9G0@36%I;"Y.;W1E`#$(`06``P`.````T`<#`!0`
M%@`S`!D``0!1`0$@@`,`#@```-`'`P`4`!8`,P`@``$`6`$!"8`!`"$````V
M13<U0C<S1#9$1D5$,S$Q038T1#0P0C$U,$,Q,#`P,``4!P$$@`$`&````%)%
M.B!1=65S=&EO;G,@86)O=70@351$`/P'`0V`!``"`````@`"``$#D`8`7`<`
M`#(````+``(``0````,`+@``````0``Y`#`YO0ZNDK\!'@!P``$````4````
M475E<W1I;VYS(&%B;W5T($U41``"`7$``0```!L````!OY*(X%&H.)(;_G01
MTZG*`&"7CWYC``CK.^```@$)$`$```#:`0``U@$``*8"``!,6D9UT6:=$P,`
M"@!R8W!G,3(UXC(#0W1E>`5!`0,!]_\*@`*D`^0'$P*`#_,`4`16/PA5![(1
M)0Y1`P$"`&-HX0K`<V5T,@8`!L,1)?8S!$83MS`2+!$S".\)][8[&!\.,#41
M(@Q@8P!0,PL)`60S-A90"Z8@2^!Y;&4@2`K`!1`$(+97`V`.L#H*H@J`/@8`
ME&\@`_!L`R!T:!T@30$`=@W@'2!S=![2=[D%L&L@!I`?`Q_`81_0OF,?``&@
M'1$3X`0@8@GA9Q]!'1`.L&0_'A8>%%D#!Y$`<&0@;F\L(%<CHP&`$H%Y"&`@
M`A!RRP#`!4!I!4!A9PMQ'P/,8F$D``)@;V,@4"%4HQ[#(?`@96T%,'DD0%\>
MD0=`)[$FT@0@*`N`8S4*0&0+@&<?`P6P:6=["X`HH7DF<P(@!Y$GAG6I%!!D
M*1ZP:`W@:!ZTT2`C.3DN+6`E*C`@A$,?T`>`+B!"=05`3F4>H$D@$75L)`(%
M0&=-'J!T'J`#@75F`-!T_PAQ*=$#\!\0'[`:T"R@'U3J<RZ`205`8P.1`B`J
MPN<KY"4R!_`F1"/3'V`B$?<?$!V!'8%P&"`"0"K0'7'8:WDN'A0>%$\#8`N0
M!1XC?3=0```>`$(0`0```",````\,SA$-C1&,3(N0S$Q1#=&,#9`;F5X=7,M
M=&5C:"YN970^```#`-X_Y`0```,`"5D!`````P``@`@@!@``````P```````
M`$8`````4H4``"=J`0`>``&`""`&``````#`````````1@````!4A0```0``
M``0````Y+C``"P#+@`@@!@``````P````````$8`````!H4````````#``*`
M""`&``````#`````````1@`````!A0````````L``X`((`8``````,``````
M``!&``````.%````````"P`$@`@@!@``````P````````$8`````#H4`````
M```#``6`""`&``````#`````````1@`````0A0````````,`!H`((`8`````
M`,````````!&`````!&%`````````P`'@`@@!@``````P````````$8`````
M&(4````````>``B`""`&``````#`````````1@`````VA0```0````$`````
M````'@`)@`@@!@``````P````````$8`````-X4```$````!`````````!X`
M"H`((`8``````,````````!&`````#B%```!`````0`````````#`/$_"00`
M`!X`,4`!````!@```$]23TY/`````P`:0``````>`#!``0````8```!/4D].
M3P````,`&4```````P#]/^0$```#`"8```````,`-@```````P"`$/____\"
M`4<``0```#8```!C/553.V$](#MP/4TM4WES=&5M<SML/4U3+4580TA!3D=%
M+3`P,#,R,#(P-3$R-5HM.#`Q-P````(!^3\!````3`````````#<IT#(P$(0
M&K2Y"``K+^&"`0`````````O3SU-+5-94U1%35,O3U4]5$5,+4%6258O0TX]
M4D5#25!)14Y44R]#3CU/4D].3P`>`/@_`0````L```!/<F]N($]G9&%N```>
M`#A``0````8```!/4D].3P````(!^S\!````3`````````#<IT#(P$(0&K2Y
M"``K+^&"`0`````````O3SU-+5-94U1%35,O3U4]5$5,+4%6258O0TX]4D5#
M25!)14Y44R]#3CU/4D].3P`>`/H_`0````L```!/<F]N($]G9&%N```>`#E`
M`0````8```!/4D].3P```$``!S#P[7T-KI*_`4``"##0=[42KI*_`1X`/0`!
M````!0```%)%.B``````'@`=#@$````4````475E<W1I;VYS(&%B;W5T($U4
M1``>`#40`0```#L````\0C$W.#DS,#4R03$W1#(Q,4$Y.#8P,#8P.3<X1C=%
M-C,P,31!,#4T-$!M86EL+FUS>7,N8V\N:6P^```+`"D```````L`(P``````
M`P`&$#@GP60#``<0,@$```,`$!```````P`1$``````>``@0`0```&4```!+
M64Q%2$%24DE35U)/5$4Z4T]724Q,5$A%1$5624-%4U1)3$Q73U)+24942$53
M5$%424-404),14A!4T)%14Y$14Q%5$5$/UE%4T%.1$Y/+%E%4T%&5$5264]5
M1D]234%4251!``````(!?P`!````.P```#Q",3<X.3,P-3)!,3=$,C$Q03DX
J-C`P-C`Y-SA&-T4V,S`Q-$$P-30T0&UA:6PN;7-Y<RYC;RYI;#X``--X
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
