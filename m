Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vcuB-0004Kl-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 08:56:59 +0000
Received: from [199.203.219.2] (helo=ms-exchange.msys.co.il)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vcu6-0004Kf-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 08:56:54 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A013D@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: mtd@imladris.mvhi.com
Subject: RE: Power Down
Date: Wed, 8 Dec 1999 10:57:27 +0200 
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Sorry, In this email on the second line from the end it should read
I am afraid to guess NTFS and not NTFL.

Oron


-----Original Message-----
From: Oron Ogdan [mailto:Orono@m-sys.com]
Sent: Wednesday, December 08, 1999 12:59 AM
To: MTD
Subject: RE: Power Down


Since DiskOnChip is meant to be used in embedded system, we in M-systems 
do is provide a hard disk emulation on flash which is 
resistant to power failures. We power cycle the media for several 
months to check our algorithms are indeed power fail resistant.

That means that the NFTL structures on the media
are resistant to any power loss during any stage of the algorithm.
The only thing that can happen is that you will have what's called orphan 
units that need to be scanned for and released on mount.

But this only protects the logical / physical mapping, It does not 
guarantee any damage to the file system on those logical sectors was 
not caused. 

The only way to be resistant to power failures in the file system level 
is to use a log-structured file system. I heard ext3 is log-structured but
I am sure one of the Linux guys here knows more about this, Any other file
system 
that takes power failures into account, (I am afraid to guess NFTL ????). 
Some of our customers use their own home brewed LFSs and do it successfully.

Oron


-----Original Message-----
From: Bob Canup [mailto:rcanup@go2fax.com]
Sent: Tuesday, December 07, 1999 9:19 PM
To: MTD
Subject: Re:Power Down


Watch dogs are generally there to catch the problem of a run-away
machine - this ought to be a very rare occurrence.

According to Vipin's statistics about 1 in 250 random power failures
during writes to a DOC2000 results in a bad sector on the device. Since
you are required to run the chip in RW mode the only way I see to avoid
the problem is a UPS on the front end - with signaling to indicate power
failure so that an ordered shutdown could occur.

As far as the problem of a bad sector which he discussed I have not seen
any solutions other than the erase and start over one he originally came
up with - which for the reasons he discussed - is unacceptable.

The first step toward solving a problem is understanding exactly what
the problem is. My theory is that if you interrupt a sector write while
it is in progress the data and the error checking code don't match -
thus you get a bad sector. Any other theories?





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

begin 600 winmail.dat
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
M5(`V8/]UH7"A(+&,@XTL!"`[4#_!_U7$B&N5&3DTE@($`'11,X+_9I%.0B-B
MFQ&$=4DC!O!4@/\X845Q;2-$`1Y4/?%D@A[Q_V"A`"`>,#WA::-+0GK52Y'_
M3'`'@$_5,F">LYZ1.4,]@O\><B#AH9`&,:>;BI`=L5`P_7"!904P`:`\L$*-
M6J(4`/\@40ZP,F`B0%T0-X&I\3;P_TCRG&I0,`2!8**.0P[``-"^=%^20V&;
MWS)Q.]!-AQ/_!;!'X$TF!I!-DW`Q!)!%`/\%,3=`IL:3$CDB/+!CM;GQ_V(#
M-L$)P001E?,X0#=`(R+_JT0#8#QA/U)(X@6@-Q$V8/^/`$.!A;,GI1V0,W!-
MDWN@/[L"E1@[T&S8N2,(D',_WX2/Q/^",K&A:6!B!/(L8'<=0!00'O$BQKDR
MH*+P(OLB,@#`:HXA`W`IX`N`(>'K`0`A`"X%L&?&+\<_R$\+R5_*9WW/<```
M`!X`0A`!````.P```#Q",3<X.3,P-3)!,3=$,C$Q03DX-C`P-C`Y-SA&-T4V
M,S`Q-$$P,3-#0&UA:6PN;7-Y<RYC;RYI;#X```,`WC^O;P```P`)60$````#
M``"`""`&``````#`````````1@````!2A0``)VH!`!X``8`((`8``````,``
M``````!&`````%2%```!````!````#DN,``+`,N`""`&``````#`````````
M1@`````&A0````````,``H`((`8``````,````````!&``````&%````````
M"P`#@`@@!@``````P````````$8``````X4````````+``2`""`&``````#`
M````````1@`````.A0````````,`!8`((`8``````,````````!&`````!"%
M`````````P`&@`@@!@``````P````````$8`````$84````````#``>`""`&
M``````#`````````1@`````8A0```````!X`"(`((`8``````,````````!&
M`````#:%```!`````0`````````>``F`""`&``````#`````````1@`````W
MA0```0````$`````````'@`*@`@@!@``````P````````$8`````.(4```$`
M```!``````````,`\3\)!```'@`Q0`$````&````3U)/3D\````#`!I`````
M`!X`,$`!````!@```$]23TY/`````P`90``````#`/T_Y`0```,`)@``````
M`P`V```````#`(`0_____P(!1P`!````-P```&,]55,[83T@.W`]32U3>7-T
M96US.VP]35,M15A#2$%.1T4M.3DQ,C`X,#@U-S(W6BTQ,S<Y,````@'Y/P$`
M``!,`````````-RG0,C`0A`:M+D(`"LOX8(!`````````"]//4TM4UE35$5-
M4R]/53U414PM059)5B]#3CU214-)4$E%3E13+T-./4]23TY/`!X`^#\!````
M"P```$]R;VX@3V=D86X``!X`.$`!````!@```$]23TY/`````@'[/P$```!,
M`````````-RG0,C`0A`:M+D(`"LOX8(!`````````"]//4TM4UE35$5-4R]/
M53U414PM059)5B]#3CU214-)4$E%3E13+T-./4]23TY/`!X`^C\!````"P``
M`$]R;VX@3V=D86X``!X`.4`!````!@```$]23TY/````0``',`"<-#Y:0;\!
M0``(,!"FJ$!:0;\!'@`]``$````%````4D4Z(``````>`!T.`0````L```!0
M;W=E<B!$;W=N```>`#40`0```#L````\0C$W.#DS,#4R03$W1#(Q,4$Y.#8P
M,#8P.3<X1C=%-C,P,31!,#$S1$!M86EL+FUS>7,N8V\N:6P^```+`"D`````
M``L`(P```````P`&$.P=%R<#``<0YP<```,`$!```````P`1$``````>``@0
M`0```&4```!33U)262Q)3E1(25-%34%)3$].5$A%4T5#3TY$3$E.14923TU4
M2$5%3D1)5%-(3U5,1%)%041)04U!1E)!24143T=515-33E1&4T%.1$Y/5$Y4
M1DQ/4D].+2TM+2U/4DE'24Y!``````(!?P`!````.P```#Q",3<X.3,P-3)!
M,3=$,C$Q03DX-C`P-C`Y-SA&-T4V,S`Q-$$P,3-$0&UA:6PN;7-Y<RYC;RYI
&;#X``-EQ
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
