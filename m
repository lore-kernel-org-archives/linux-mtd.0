Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12CmoS-0008Ir-00
	for mtd-list@infradead.org; Mon, 24 Jan 2000 16:58:00 +0000
Received: from [199.203.219.2] (helo=ms-exchange.msys.co.il)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12CmoQ-0008Ij-00
	for mtd@imladris.mvhi.com; Mon, 24 Jan 2000 16:57:59 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A02F8@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: 
Subject: RE: fdisk oddities 
Date: Mon, 24 Jan 2000 19:07:19 +0200
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

There is a bug in version 1.21 of the firmware in the calculation of the
geometry which effects the 72MB version. You should use the 1.22 tools +
firmware. The version is still not available on our web site, I will find
out when it is due to be public. 

I don't want to send the zip file to the list and overload everybody, Until
it's made public anyone who needs the new version please send me an email.

To use it :

Just run in DOS (sorry we don't have any Linux version of the tools yet)
dupdate /win=XXXX /s:doc122.exb
where XXXX is the address of your DOC

Regards

Oron

Oron Ogdan
European Technical Manager
M-Systems Flash Disk Pioneers

email : orono@m-sys.com
efax : +1.(603).761.5426



-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Monday, January 24, 2000 9:53 AM
To: Brian K. Michalk
Cc: mtd@imladris.mvhi.com
Subject: Re: fdisk oddities 



michalk@sisko.awpi.com said:
>  It seems as though the doc2000 is not storing cylinders, sectors or
> heads after fdisk exits.  I manually set them, and used very small
> values just in case there was some sort of problem with the 72 MB doc
> I have.  Here is the script:

I get this on hard drives. They make up the geometry on boot, and I believe 
that they only read it from the partition table if they're _really_ confused

and can't work out what it ought to be.

If you _really_ want to do it, you can alter the NFTL code so that you can 
tell it what the geometry should be - just like you can tell the kernel on
its 
command line. But it shouldn't really help. If there are problems with the 
72 Mb device, they're not going to go away if you tell it the physical 
geometry is different - it'll still use all the flash anyway.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

begin 600 winmail.dat
M>)\^(AP1`0:0"``$```````!``$``0>0!@`(````Y`0```````#H``$(@`<`
M&````$E032Y-:6-R;W-O9G0@36%I;"Y.;W1E`#$(`06``P`.````T`<!`!@`
M$P`'`!,``0`>`0$&``<``0````````$@@`,`#@```-`'`0`8`!,`!P`;``$`
M)@$!"8`!`!\```!%,S<Y,C(W0D0R1#,Q,4$V-$1%,$)!-3!#,3`P,#``E`8!
M!(`!`!0```!213H@9F1I<VL@;V1D:71I97,@`)<&`0V`!``"`````@`"``$#
MD`8`&`P``#4````+``(``0````,`+@```````@$Q``$```!&``````````%*
MK^,7A](1J9``8)>/?F,'`+%XDP4J%](1J88`8)>/?F,```!OK>T``+)XDP4J
M%](1J88`8)>/?F,```C9$!<`````0``Y`$"9*GF-9K\!'@!P``$````0````
M9F1I<VL@;V1D:71I97,@``(!<0`!````&P````&_9E/M+HS8\N32/A'3J;<`
M8)>/?F,`#41+8``"`0D0`0````<&```#!@``TP@``$Q:1G57<GH*`P`*`')C
M<&<Q,C7R,@#[,S8!Z`*D`^0'$T\"@P!0`]0"`&-H"L!SJ&5T,!"F?0J!=@B0
MI'=K"X!D-`Q@8P!0BPL#"V!N#A`P,S,+ID@@5&@$D&4@!``@8&$@8G5G%<`#
MH'8'!)``D`(@(#$N,C$@(&]F('05@"!F\&ER;7<*P!6Q`Z`7DM)C!T!C=0M@
M=!;2%V3-$3$@`S$28&=E`W`20"1R>1GS=V@-X&@@.P$1!9!T!"`7D@'`34(C
M%H8:0BX@60A@('/B:`A@;&0@#'`:`1(PUQI"%X,7$3(7@&\&\`0@?BL7QQGR
M'7`5<1:'%=%S)1E`;`,@;F\%0&%V?PMP"V`"8!6P&6((<!M`90)B'<!I=&4L
M($G_&T`B`A?0$Y`C005`&U`)\/<5P`5`%=%D"E`?@180%;#\<'4"8`W@'7`*
MH@J$"H#U)#!D`B`G)1$`<`5`)B'W$C`DP1>2>@4@%\$B\28A?Q>2)K`AX!7P
M),(6D0D`894>(&46D7D&X&1Y)!#N50(P`Q$CX"<$(`#``0#[)G4JD7D"(!6P
M&U`F,"W0/PF`'!0MT`?@%I8+4&5A?Q(P*+0'@"J1&Z``P`,0+J\G!0$Q,347
M0%0F,'4OX34E@3HQ+4HR@`5`<G63(9$#H$1/!?`H<P6P/QK@(X$GU1(`%I`M
M@B!,N0N`=7@6AQ=E'Y1Y$D"R*271<&09,!6P+P/PF&X]6#E1./!S.B?@XQ/@
M'V`N97@,,"<3)3'?%:$Y4Q71%Y(K0&0)<`01+Q=A+;`C832P0R<*4F7N9PL1
M$<`G&4\#8`N0/FU8($]G.+`_144(<&_6<"_``Z!4!9!H`P`8T2L%T`!P81J`
M<B<$32WO!K`AX##`!"!&"V`=T#2@\00`:R!0%M$)X!(@)PH/,,,RX!=0/R%O
M0&TM*G-#0"X%H&U%169A*S;`1@`K%Q`H#T`S*0@N-S87$#4T,C:;)PHG"BU*
M<C\0:6<+@-]"$CPQ0G%*<R<$1@-A1@"J1"*`:1X@5Q^@9!WA72_A6S#2'Y`Y
MP'<8`#)>0`N``U`LX2M`+@6P9]Y=)P0&8`(P1@!-`B`XL#4K\4H`<'4*P#5`
M,C0')!`!T%&@(#DZ-3/=$*!-)P0R4$8`0@<A`Z!:2QUP31MQ!T!K)P1#HF-&
M`&UT9$Z@;0M@8SP0!``N;78;8$;84_TFD&H;X48`/>!&``5P1"*_!'!7(!E`
M!Y%)7R=5;5.4!D``D$0P;RYA=W!759,=P`MP9#+U/AH@2;\%0!(P0W(OT!>!
M"&!G&Y#_%Y(YT5&3%=$B0B'@!;`+@/D60&-Y)K`3D!:A)!`2,/\;\`6P/%%"
MI5N@%8`K0!7A_P&`!)!7!3I`(^!&P%NQ+,'?4/$B$#5`$C$7@FTD$"JB_S*!
M'B`K@AW``,`B$%M&(I#["D$$(&HT`A9A&-`OX1>1?Q6A&!`AP1JA9O$`(!=2
M</\#8"+A6M`#\!>0'"4%T!R@WSG16T8D,#7R8?%(%947DO\$]#+V)W4:@&+R
M%=$6X1(!?QX@51$6D&'A%7$U0`#`:_\5L#B0%X,:AB,2!N`B4&-4_R0P)E`F
ML"MQ)O47D!DP%X+_;Z)BH0EP*T$E@0-2%X,*L;\90!E#`9$B\0:0<=,G%:&V
M7W*!8I%?&,`"(&9CL_\G!"JB&-`H`P6P5U$E`W&Q_R6!7+(H<R90,18G=#R#
M=3C_*$8GX"5Q)!!Z(G<!%?!.$,-A$1>23D943'7!+/'_-0`7@7&Q>^9Q-7#`
M+&)WY/=N^QW5)E$M980FL&Z1>^;_?P,7DFZ0!*!PP",28<$F]=]&X0.!'B!>
MT6I!0B4!)8'/'=0H`G548'%L<!UP>?'_9F08(F?5!"!H5R<$:.(CL#L!`!,P
M8R0!=,8B0F=O_UYR)B&+`!7P&!`U0'21>B+[?P9S4VA#0$'S)P1O-R6R_P:0
M&]`)<"AA@4`L@2(1(>3_,H)B@1>$0\,MD8O1>2M+]O].4UAOE$LR4@"`)I`$
M\B90VU]"),$BE:E4@B(F$@#`?FH%L"?@!&!.K"<$$O$``9H@`!X`0A`!````
M*@```#Q%,3)#9T)C+3`P,#-/6"TP,$!D979E;#(N87AI;VTN:6YT97)N86P^
M`````@$4.@$````0`````.-Y(GO2TQ&F3>"Z4,$```,`WC_D!````P`)60,`
M```#``"`""`&``````#`````````1@````!2A0``)VH!`!X``8`((`8`````
M`,````````!&`````%2%```!````!````#DN,``+`,N`""`&``````#`````
M````1@`````&A0````````,``H`((`8``````,````````!&``````&%````
M````"P`#@`@@!@``````P````````$8``````X4````````+``2`""`&````
M``#`````````1@`````.A0````````,`!8`((`8``````,````````!&````
M`!"%`````````P`&@`@@!@``````P````````$8`````$84````````+``V`
M""`&``````#`````````1@`````4A0````````,`!X`((`8``````,``````
M``!&`````!B%````````'@`(@`@@!@``````P````````$8`````-H4```$`
M```!`````````!X`"8`((`8``````,````````!&`````#>%```!`````0``
M```````>``J`""`&``````#`````````1@`````XA0```0````$`````````
M`P#Q/PD$```>`#%``0````8```!/4D].3P````,`&D``````'@`P0`$````&
M````3U)/3D\````#`!E```````,`)@```````P`V```````#`/T_Y`0```,`
M@!#_____`@%'``$````W````8SU54SMA/2`[<#U-+5-Y<W1E;7,[;#U-4RU%
M6$-(04Y'12TP,#`Q,C0Q-S`W,3E:+3(P-3,U```"`?D_`0```$P`````````
MW*=`R,!"$!JTN0@`*R_A@@$`````````+T\]32U365-414U3+T]5/51%3"U!
M5DE6+T-./5)%0TE0245.5%,O0TX]3U)/3D\`'@#X/P$````+````3W)O;B!/
M9V1A;@``'@`X0`$````&````3U)/3D\````"`?L_`0```$P`````````W*=`
MR,!"$!JTN0@`*R_A@@$`````````+T\]32U365-414U3+T]5/51%3"U!5DE6
M+T-./5)%0TE0245.5%,O0TX]3U)/3D\`'@#Z/P$````+````3W)O;B!/9V1A
M;@``'@`Y0`$````&````3U)/3D\```!```<P($-T=8UFOP%```@P8%6,?8UF
MOP$>`#T``0````4```!213H@`````!X`'0X!````$````&9D:7-K(&]D9&ET
M:65S(``>`#40`0```#L````\0C$W.#DS,#4R03$W1#(Q,4$Y.#8P,#8P.3<X
M1C=%-C,P,31!,#)&.$!M86EL+FUS>7,N8V\N:6P^```+`"D```````L`(P``
M`````P`&$#T:[Q0#``<0B04```,`$!```````P`1$``````>``@0`0```&4`
M``!42$5214E304)51TE.5D524TE/3C$R,4]&5$A%1DE235=!4D5)3E1(14-!
M3$-53$%424].3T942$5'14]-151265=(24-(149&14-44U1(13<R34)615)3
M24].64]54TA/54Q$``````(!?P`!````.P```#Q",3<X.3,P-3)!,3=$,C$Q
M03DX-C`P-C`Y-SA&-T4V,S`Q-$$P,D8X0&UA:6PN;7-Y<RYC;RYI;#X``'@+
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
