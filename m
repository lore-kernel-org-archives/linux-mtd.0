Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X99c-0003wq-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 20:52:00 +0000
Received: from [199.203.219.2] (helo=ms-exchange.msys.co.il)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12X99X-0003wk-00
	for mtd@infradead.org; Mon, 20 Mar 2000 20:51:56 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A0545@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: Dvir Oren <dviro@ibm.net>, MTD <mtd@infradead.org>
Subject: RE: Questions about MTD 
Date: Mon, 20 Mar 2000 22:51:31 +0200
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Dvir Oren Wrote :
> What happens if I already did docpmap /e, without saving any bad 
> block tables?
> 
> That is, I already did that, and then dformat, which claims 
> to rebuild 
> something (I can't recall ath the moment), and then everything 
> seems fine.  Is there something entirely bad with the flash I'm now 
> using?  Is there a way to rebuild the bad block table?

tough luck, You will never know what was the original table. If you are just
developing you have to remember there is a possibility you are using a bad
block. There is no way to rebuild the bad block table. This command was
removed from the next version of the DiskOnChip utilities and will not be
available to customer in the future. You can achieve the desired results
with dformat /unformat

> 
> Another question not related:
> 
> I have a flash that does not load the "True FFS" at boot time.  It 
> loads the "DOS Sockets", but not the "True FFS".  This makes the 
> flash unbootable.  When I did docpmap /e, it claims there is a fault 
> at some address.  Any ideas?

Docpmap /e does not look at the contents, it just brutally goes unit by unit
and deletes all. I will have to see the exact message but it could be a bad
DiskOnChip that has been traumatized somehow.

Oron

begin 600 winmail.dat
M>)\^(B(4`0:0"``$```````!``$``0>0!@`(````Y`0```````#H``$(@`<`
M&````$E032Y-:6-R;W-O9G0@36%I;"Y.;W1E`#$(`06``P`.````T`<#`!0`
M%@`S`!\``0!7`0$@@`,`#@```-`'`P`4`!8`,P`@``$`6`$!"8`!`"$````W
M,S<U0C<S1#9$1D5$,S$Q038T1#0P0C$U,$,Q,#`P,``#!P$$@`$`&0```%)%
M.B!1=65S=&EO;G,@86)O=70@351$(``<"`$-@`0``@````(``@`!`Y`&`)@)
M```R````"P`"``$````#`"X``````$``.0"`'M`1KI*_`1X`<``!````%0``
M`%%U97-T:6]N<R!A8F]U="!-5$0@``````(!<0`!````&P````&_DJ)"3J@X
MG[#^=!'3J<H`8)>/?F,``KP3$``"`0D0`0````<$```#!```708``$Q:1G7C
M.%A&`P`*`')C<&<Q,C7B,@-#=&5X!4$!`P'W_PJ``J0#Y`<3`H`/\P!0!%8_
M"%4'LA$E#E$#`0(`8VCA"L!S970R!@`&PQ$E]C,$1A.W,!(L$3,([PGWMCL8
M'PXP-1$B#&!C`%`S"PD!9#,V%E`+IB!$M'9I!<!/&"`#H%<#8-D.L"`Z"J(*
M@#X=@!/@<P5`$^!P<`GP!"`&D"`,22`'0!@@861Y(&AD:60@$&\-\`#`<"`@
M+V4L(`/P=&B3"&`%0'-A'0!N9Q^0^FX@`&(?X`KC'D("8"!PU&L@`9%L!Y`_
M'@8>!OY4'I($`"$`'XPA0!Z@(0#7`'`F,AUA9`(0<@#`)H%$=V@-X&@@8PMA
M;2,$(1X5=&\@&"!B=7L#$")X<P-P%"`GX"'A*'4?@&,`<"<%0!@@*R!L[P,@
M'J`H$";Q(`1@!X`",-(I)IEE=@20>2J4*=>+">`H<68+@&4N(!]P/P0@)O$8
M("I)+*$=$&5L5R(T(2(L(V8+8',H$$E@)VT@;F\'X!X&=:L`D"'@/R]Y82$0
M82``?RDI+#(B4B,9(]4>!"D@==YG*!`*0"-`(0!9"&`A$><KP2]`+:$@:S+"
M)]`>H<LTL"^C(`6P:6<+@`=`ZR-D+V!)'V!Y.'$*P!W0OFHS@`5``0`MH!>P
M<"'2_SNB$^`MH"D4!X`&T!*!+\23!``T@7!O!!!I8@,0_R$P(``[IC.#-($U
MYR]@).#_/I4RP#2O-;\O423@/M$%H-YM`X$Q<3H!/>%O+:`@0/\#4BPC+T`.
MT2VA`)`"(#I@RQ]@+#)$!`!K3PA`)^#_(,`A<#^"")`^X44R.+,=L'LB0#1Q
M=@MP"V`CD2D28_\\,2IA!<`+@#'4(7`(<"]1_SAB*R$?D!/0")`]@BQ!`0"'
M`)`8(2E!<W5L=`0@YS&3)T4@T'5N)U0VZB1(YD%)T2_1('$*4#Q`1T+_2=(Q
M`1Z@"8`=]QX&'X`]8_\TD#(D)E(@40>12=(7L")A$2PR(E1R"E`@1D;L4R(K
MX2)`;TGA,.`'@!\O8@5!'A56,CH4(D1/YP7Q(S$4(',B(0`I<`5`_TG25HPO
M8423`,!:,#H4'@;_,B1/L%>B.Q0><1UA'X`@+N<A,"@F/GEF84Z!(H<>H=,J
M4A^09&1.47,O85&0WR``(#`?T"/&'@1$('=5FOYO(U`>H2PR!:`","RA)4%[
M8$$\(V)6X`&0*\`@`&?W5;)/L&!!8B``:/,FL@$`_R.@#K`^X2O`.U$XE#UF
M+L&_+",.P`#0!4`'@2&@9T-A_R%Q8$((8"FA2A(B0T?Y55//$^`$(#XP'6%T
M<F&@)X&<:7I%\2I2(5!W+C;J%QU``B`>!'URP``>`$(0`0```"H````\,C`P
M,#`S,C`Q.#0T+E9!03(T-#`U0&UR96QA>2YM<WES+F-O+FEL/@````,`WC_D
M!````P`)60$````#``"`""`&``````#`````````1@````!2A0``)VH!`!X`
M`8`((`8``````,````````!&`````%2%```!````!````#DN,``+`,N`""`&
M``````#`````````1@`````&A0````````,``H`((`8``````,````````!&
M``````&%````````"P`#@`@@!@``````P````````$8``````X4````````+
M``2`""`&``````#`````````1@`````.A0````````,`!8`((`8``````,``
M``````!&`````!"%`````````P`&@`@@!@``````P````````$8`````$84`
M```````#``>`""`&``````#`````````1@`````8A0```````!X`"(`((`8`
M`````,````````!&`````#:%```!`````0`````````>``F`""`&``````#`
M````````1@`````WA0```0````$`````````'@`*@`@@!@``````P```````
M`$8`````.(4```$````!``````````,`\3\)!```'@`Q0`$````&````3U)/
M3D\````#`!I``````!X`,$`!````!@```$]23TY/`````P`90``````#`/T_
MY`0```,`)@```````P`V```````#`(`0_____P(!1P`!````-@```&,]55,[
M83T@.W`]32U3>7-T96US.VP]35,M15A#2$%.1T4M,#`P,S(P,C`U,3,Q6BTX
M,#$X`````@'Y/P$```!,`````````-RG0,C`0A`:M+D(`"LOX8(!````````
M`"]//4TM4UE35$5-4R]/53U414PM059)5B]#3CU214-)4$E%3E13+T-./4]2
M3TY/`!X`^#\!````"P```$]R;VX@3V=D86X``!X`.$`!````!@```$]23TY/
M`````@'[/P$```!,`````````-RG0,C`0A`:M+D(`"LOX8(!`````````"]/
M/4TM4UE35$5-4R]/53U414PM059)5B]#3CU214-)4$E%3E13+T-./4]23TY/
M`!X`^C\!````"P```$]R;VX@3V=D86X``!X`.4`!````!@```$]23TY/````
M0``',&#A20^NDK\!0``(,.!&QA*NDK\!'@`]``$````%````4D4Z(``````>
M`!T.`0```!4```!1=65S=&EO;G,@86)O=70@351$(``````>`#40`0```#L`
M```\0C$W.#DS,#4R03$W1#(Q,4$Y.#8P,#8P.3<X1C=%-C,P,31!,#4T-4!M
M86EL+FUS>7,N8V\N:6P^```+`"D```````L`(P```````P`&$$83?T,#``<0
MR@,```,`$!```````P`1$``````>``@0`0```&4```!$5DE23U)%3E=23U1%
M.E=(051(05!014Y3249)04Q214%$641)1$1/0U!-05`O12Q7251(3U544T%6
M24Y'04Y90D%$0DQ/0TM404),15,_5$A!5$E3+$E!3%)%04191$E$5$A!````
M``(!?P`!````.P```#Q",3<X.3,P-3)!,3=$,C$Q03DX-C`P-C`Y-SA&-T4V
>,S`Q-$$P-30U0&UA:6PN;7-Y<RYC;RYI;#X``+4S
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
