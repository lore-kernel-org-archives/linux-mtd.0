Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sNUI-0006R8-U7
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 15:10:59 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19sNUd-00021R-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 16:11:19 +0200
To: linux-mtd@lists.infradead.org
From: "John Hall" <john-news1@cambridgetechgroup.com>
Date: Thu, 28 Aug 2003 15:06:28 +0100
Message-ID: <520.3f4e0c64.19269@irwin2.crw.uk.net>
Sender: news <news@sea.gmane.org>
Subject: Trivial patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The attached patch allows drivers/mtd/nand/nand.c to compile when
CONFIG_MTD_NAND_VERIFY_WRITE is defined.

Regards,
John


begin 666 nand.c.diff
M9&EF9B M=2 M<C$N-38@;F%N9"YC"BTM+2!D<FEV97)S+VUT9"]N86YD+VYA
M;F0N8PDR,R!*=6P@,C P,R Q-#HR,SHQ-2 M,# P, DQ+C4V"BLK*R!D<FEV
M97)S+VUT9"]N86YD+VYA;F0N8PDR."!!=6<@,C P,R Q-#HP,SHU,2 M,# P
M, I 0" M.3,U+#8@*SDS-2PY($! "B!["B ):6YT(&-O;'5M;BP@<&%G92P@
M<W1A='5S+"!R970@/2 P.PH@"7-T<G5C="!N86YD7V-H:7 @*G1H:7,@/2!M
M=&0M/G!R:78["BLC:69D968@0T].1DE'7TU41%].04Y$7U9%4DE&65]74DE4
M10HK"6EN="!I.PHK(V5N9&EF"B *( E$14)51R H351$7T1%0E5'7TQ%5D5,
M,RP@(FYA;F1?=W)I=&5?;V]B.B!T;R ](#!X)3 X>"P@;&5N(#T@)6E<;B(L
B("AU;G-I9VYE9"!I;G0I('1O+" H:6YT*2!L96XI.PH@"@``
`
end
