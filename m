Received: from samar.sasken.com ([164.164.56.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15kIgP-0003MH-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2001 06:17:02 +0100
Message-ID: <3BAB1CAD.E4EDA61A@sasken.com>
Date: Fri, 21 Sep 2001 10:55:41 +0000
From: Ashok M Padmanaban <ashokmp@sasken.com>
MIME-Version: 1.0
To: MTD for Linux <linux-mtd@lists.infradead.org>,
   JFFS mailing list <jffs-dev@axis.com>
Subject: paging fault while jffs2 unmount
Content-Type: multipart/mixed;
 boundary="------------FB5459A990E300968E3F090C"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.
--------------FB5459A990E300968E3F090C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

hi
 with kernel 2.4.8 (rmk2 , np1)
when i unmount the jffs2 partition iam getting the following error

MTD_open
MTD_ioctl
Unable to handle kernel paging request at virtual address 00005401
pgd = c194c000
*pgd = c1a10801, *pmd = c1a10801, *pte = 00000000, *ppte = 00000000
Internal error: Oops: 0
CPU: 0
pc : [<c0143338>]    lr : [<c0143fb4>]
sp : c1953e6c  ip : c1953e7c  fp : c1953e78
r10: ffffffff  r9 : c019542d  r8 : 00000000
r7 : ffffffe7  r6 : 00005401  r5 : 00005401  r4 : c0195413
r3 : c0173100  r2 : 00005401  r1 : fffffffe  r0 : 00005401
Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: C194D17F  Table: C194D17F  DAC: 00000015
Process cat (pid: 68, stackpage=c1953000)
Code: e3710001 0a000009 (e5d23000) e3530000 0a000006
Stack:
c1953e40:
c0143
c1953e60: c0143338 80000093 ffffffff c1953ec4  c1953e7c c0143fb4
c0143328 c001b
c1953e80: c018488c c1953ec4 00000000 0000000a  c1953f04 c0195413
c01669e7 c0195
c1953ea0: bffffbb8 00005401 ffffffe7 00000000  00000036 c02dc160
c1953ef8 c1953
c1953ec0: c0026290 c0143bf0 20000013 0000000d  00005401 bffffbb8
00005401 fffff
c1953ee0: 00000000 00000036 c02dc160 c1953f88  c1953f0c c00d87e8
c0026268 c0166
c1953f00: 00005401 00000001 00000000 c1953f5c  c1953f1c c0036690
c0037924 00000
c1953f20: c1952000 00000000 fffffff4 00000000  00000003 c1952000
00000000 00000
c1953f40: 00001000 00000003 00000000 00000022  c1953fac c1953f60
c001e854 c0036
c1953f60: bffffbb8 c1897500 00005401 ffffffe7  00000003 00000036
40104f28 c1953
c1953f80: c1953f8c c00585b4 c00d8750 bffffc10  00001000 20000010
00000002 c001a
c1953fa0: 00000000 c1953fb0 c001a6e0 c0058374  bffffc10 c0021780
00000003 00005
c1953fc0: bffffbb8 fbad2488 bffffc10 00001000  00000001 00000002
02001ec4 02018
c1953fe0: 40104f28 bffffc0c bffffc10 bffff978  400b4ca4 400b54c4
20000010 00000
Backtrace:
Function entered at [<c014331c>] from [<c0143fb4>]
Function entered at [<c0143be4>] from [<c0026290>]
Function entered at [<c002625c>] from [<c00d87e8>]
Function entered at [<c00d8744>] from [<c00585b4>]
Function entered at [<c0058368>] from [<c001a6e0>]
 r8 = C001A864  r7 = 00000002  r6 = 20000010  r5 = 00001000
 r4 = BFFFFC10
Segmentation fault

can any one help me out
regards
ashok

--------------FB5459A990E300968E3F090C
Content-Type: text/x-vcard; charset=us-ascii;
 name="ashokmp.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Ashok M Padmanaban
Content-Disposition: attachment;
 filename="ashokmp.vcf"

begin:vcard 
n:mp;ashok
x-mozilla-html:FALSE
org:Sasken Communication Technologies ltd.;Internet Access Solutions.
adr:;;;;;;
version:2.1
email;internet:ashokmp@sasken.com
title:Software Engineer
x-mozilla-cpt:;0
fn:ashok mp
end:vcard

--------------FB5459A990E300968E3F090C--
