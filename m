Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vVQk-00043D-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 00:58:06 +0000
Received: from [199.203.219.2] (helo=ms-exchange.msys.co.il)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vVQe-000437-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 00:58:01 +0000
Message-ID: <B17893052A17D211A9860060978F7E63014A013C@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: MTD <mtd@imladris.mvhi.com>
Subject: RE: Power Down
Date: Wed, 8 Dec 1999 02:58:30 +0200 
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

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

begin 600 winmail.dat
M>)\^(B```0:0"``$```````!``$``0>0!@`(````Y`0```````#H``$(@`<`
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
M37*3!;`S8#BF_P:0.1-;L020,(`%,2+`DD;_?I(DHB@P3S6E<4V#(D$)P?\$
M$8%S(\`BP#W2EL0#8"?A_RK2-&(%H"*1(>!Z@"\!<3/_9X4H8![P.1,U$*:"
M@)@G4.=86*2C")!S/W`/L']MLON=(53@8@3R'L`@8!00/>%N(K(Y'B".<"(>
M@@#`:O-YH0-P;T`+@%T!`0"`H"HN!;!G(81]MH`>`$(0`0```!\````\,S@T
M1#<Y1$,N.$0Q-#(P-C1`9V\R9F%X+F-O;3X```,`WC_D!````P`)60$````#
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
M96US.VP]35,M15A#2$%.1T4M.3DQ,C`X,#`U.#,P6BTQ,S(P.0```@'Y/P$`
M``!,`````````-RG0,C`0A`:M+D(`"LOX8(!`````````"]//4TM4UE35$5-
M4R]/53U414PM059)5B]#3CU214-)4$E%3E13+T-./4]23TY/`!X`^#\!````
M"P```$]R;VX@3V=D86X``!X`.$`!````!@```$]23TY/`````@'[/P$```!,
M`````````-RG0,C`0A`:M+D(`"LOX8(!`````````"]//4TM4UE35$5-4R]/
M53U414PM059)5B]#3CU214-)4$E%3E13+T-./4]23TY/`!X`^C\!````"P``
M`$]R;VX@3V=D86X``!X`.4`!````!@```$]23TY/````0``','!_O5070;\!
M0``(,/#D.5@70;\!'@`]``$````%````4D4Z(``````>`!T.`0````L```!0
M;W=E<B!$;W=N```>`#40`0```#L````\0C$W.#DS,#4R03$W1#(Q,4$Y.#8P
M,#8P.3<X1C=%-C,P,31!,#$S0T!M86EL+FUS>7,N8V\N:6P^```+`"D`````
M``L`(P```````P`&$!5W5AH#``<0V@8```,`$!```````P`1$``````>``@0
M`0```&4```!324Y#141)4TM/3D-(25!)4TU%04Y45$]"1553141)3D5-0D5$
M1$5$4UE35$5-+%=%24Y-+5-94U1%35-$3TE34%)/5DE$14%(05)$1$E32T5-
M54Q!5$E/3D].1DQ!4TA72$E#``````(!?P`!````.P```#Q",3<X.3,P-3)!
M,3=$,C$Q03DX-C`P-C`Y-SA&-T4V,S`Q-$$P,3-#0&UA:6PN;7-Y<RYC;RYI
&;#X``*LK
`
end


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
