Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X2v3-00031k-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 14:12:33 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A0542@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: 'Kyle Harris' <kharris@nexus-tech.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Dvir Oren <dvir@lucidvon.com>,
	MTD <mtd@infradead.org>
Subject: RE: Questions about MTD
Date: Mon, 20 Mar 2000 16:11:08 +0200
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Kyle Harris Wrote : 
> I've seen reference to "saving the bad block table" in a couple of
> places now. It seems that the file system should be able to 
> dynamically
> create/maintain the bad block table. Is this not true?
> 
No It's not true, The Bad Block table is static and should not change 
during the life cycle of the device. Just think of the possibility of
a power failure during the update to this table. 

When talking about new bad blocks that occur during the life cycle of the
device, it is very
hard to determine when a new "bad block" is really bad. Just think of 
situations such as power down, Noisy hardware etc. Our philosophy now
(in M-Systems) is marking new bed blocks only in the copy of the bad 
block table that resides in RAM. So further writes to this block will be 
prevented until the next reset. 

In the next reset, Either the block is bad and then the first write 
will fail again and further writes will be prevented, Or it's good and
then can be reused. 

Oron

begin 600 winmail.dat
M>)\^(@H.`0:0"``$```````!``$``0>0!@`(````Y`0```````#H``$(@`<`
M&````$E032Y-:6-R;W-O9G0@36%I;"Y.;W1E`#$(`06``P`.````T`<#`!0`
M$``+``@``0`2`0$@@`,`#@```-`'`P`4`!``"P`(``$`$@$!"8`!`"$```!#
M-S`V138Q13,P1D5$,S$Q03E#03`P-C`Y-SA&-T4V,P`O!P$$@`$`&````%)%
M.B!1=65S=&EO;G,@86)O=70@351$`/P'`0V`!``"`````@`"``$#D`8`X`@`
M`#,````#`#8```````,``(`((`8``````,````````!&`````%*%```G:@$`
M'@`!@`@@!@``````P````````$8`````5(4```$````$````.2XP``L`RX`(
M(`8``````,````````!&``````:%`````````P`"@`@@!@``````P```````
M`$8``````84````````+``.`""`&``````#`````````1@`````#A0``````
M``L`!(`((`8``````,````````!&``````Z%`````````P`%@`@@!@``````
MP````````$8`````$(4````````#``:`""`&``````#`````````1@`````1
MA0````````,`!X`((`8``````,````````!&`````!B%````````'@`(@`@@
M!@``````P````````$8`````-H4```$````!`````````!X`"8`((`8`````
M`,````````!&`````#>%```!`````0`````````>``J`""`&``````#`````
M````1@`````XA0```0````$``````````@$)$`$```!6`P``4@,``%4%``!,
M6D9U9:(8<0,`"@!R8W!G,3(UXC(#0W1E>`5!`0,!]_\*@`*D`^0'$P*`#_,`
M4`16/PA5![(1)0Y1`P$"`&-HX0K`<V5T,@8`!L,1)?8S!$83MS`2+!$S".\)
M][8[&!\.,#41(@Q@8P!0,PL)`60S-A90"Z8@2^!Y;&4@2`K`!1`$(&97`V`.
ML"`Z"N,*@#YP($DG=AT@%!`)\"`M&"!F!)`)\&,=('1OH"`B<V%V"X!G'^!B
M:!T@8F%D(-`7L&-.:Q_@`:`=$"(@"X`@-&$@!:!U"U`=(&]F#QXV"U$?P`0@
M;F]W+K<>H`5`'P%M!"`@H&$%0$T@HF8#$![A>7,.L&WU'O!H"&!L(0$=("&2
M'^+!'C9D>6YA;0W@!T`L;'D>-@4`923`92__`,`+@`&0(?$@KQT0(_$D@M<=
M@2/`)-%R"E`_'C8>-!9.(``D$"<K>"P@5/4IT4(@\4(A."'@!"`EH/<DP`W@
M(A!N(0`E]2N2$]&W('`=(!XT9`AQ('5L!I#Q'2!C>6,B@RFS`0`@4+,?P"/P
M2G4EH"LR;B%@23,E<&\$$&EB`Q!I7'1Y(J<B(#4P=Q*!9K\+<`I`&"`G@#'8
M(F!D*/'?'^(K0RJE'C0>-%<IT"FAO0=`:R!B`:`(8`5`;@?1]R#G)(4A0&,(
M<#=J,G\SA>\N`#6P+U(>T'(H-1/A(0`W'_$!``ZP<B?0.W`@=_<Z4B(@.W(B
M(.<AT00@*-&?*!$@TC/^'C0`D'1U+[%W`B`O<1K0:"(0!"`VE&1](]!N+@`M
M``0`-=!`8G=7"L`=(!0@8R/P3SSA</,K4!>P<V](D#70(\$>-#(H(?%-+0:P
M):)S*?LO4@#`<CK#.W,)@#OF`B#W0V$IE06@<#72*;<>-"$I/R24&"``D`$`
M!"`A\5)!ZDTC\%,@`&8(<"G!!<#^=P40#K`D@3BE(20#\"@0>R92'C1P&"`>
MT`(P2\%U_P(P`Q$IPCMP#M%/D10@.6SN22FD5+@N`$4UL%$"*</_(3-2`B#Q
M,`(IP2FD)3`4`+\%0%%#'B52DS;R(A!G*8+?,`)0S5*64W<N`$\%P#6P^2U1
M9V\$<"_R'C19(R?P_P.@)F$8(#0@"8`Y;%XP`B`%'C1]8D```!X`<``!````
M%````%%U97-T:6]N<R!A8F]U="!-5$0``@%Q``$````;`````;^2=!*5'N8%
M/_XP$=.IR@!@EX]^8P``5\\P``,`)@```````P`N```````+``(``0````,`
M"5D!````'@!"$`$````C````/#,X1#8R0T4Y+C0S0T,S,#$Y0&YE>'5S+71E
M8V@N;F5T/@```P#>/^0$```#`/T_Y`0``$``.0#0P_PB=I*_`0,`\3\)!```
M'@`Q0`$````&````3U)/3D\````#`!I``````!X`,$`!````!@```$]23TY/
M`````P`90``````#`(`0_____PL`\A`!`````@%'``$````V````8SU54SMA
M/2`[<#U-+5-Y<W1E;7,[;#U-4RU%6$-(04Y'12TP,#`S,C`Q-#$Q,#A:+3<R
M.#<````"`?D_`0```$P`````````W*=`R,!"$!JTN0@`*R_A@@$`````````
M+T\]32U365-414U3+T]5/51%3"U!5DE6+T-./5)%0TE0245.5%,O0TX]3U)/
M3D\`'@#X/P$````+````3W)O;B!/9V1A;@``'@`X0`$````&````3U)/3D\`
M```"`?L_`0```$P`````````W*=`R,!"$!JTN0@`*R_A@@$`````````+T\]
M32U365-414U3+T]5/51%3"U!5DE6+T-./5)%0TE0245.5%,O0TX]3U)/3D\`
M'@#Z/P$````+````3W)O;B!/9V1A;@``'@`Y0`$````&````3U)/3D\```!`
M``<PL"E6DW62OP%```@P`&(U(W:2OP$>`#T``0````4```!213H@`````!X`
M'0X!````%````%%U97-T:6]N<R!A8F]U="!-5$0`'@`U$`$````[````/$(Q
M-S@Y,S`U,D$Q-T0R,3%!.3@V,#`V,#DW.$8W138S,#$T03`U-#)`;6%I;"YM
M<WES+F-O+FEL/@``"P`I```````+`",```````,`!A"`Y4V8`P`'$`L#```#
M`!`0``````,`$1``````'@`($`$```!E````2UE,14A!4E))4U=23U1%.DE6
M15-%14Y2149%4D5.0T543R)3059)3D=42$5"041"3$]#2U1!0DQ%(DE.04-/
M55!,14]&4$Q!0T533D]72513145-4U1(05142$5&24Q%4UE35``````"`7\`
M`0```#L````\0C$W.#DS,#4R03$W1#(Q,4$Y.#8P,#8P.3<X1C=%-C,P,31!
9,#4T,D!M86EL+FUS>7,N8V\N:6P^``#Q^0==
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
