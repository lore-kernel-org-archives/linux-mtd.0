Received: from srv26.vktv.no ([84.16.208.26] helo=banan.dataparty-mn.biz)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F8KV2-0004aT-La
	for linux-mtd@lists.infradead.org; Sun, 12 Feb 2006 11:55:11 -0500
Received: from [10.0.0.4] (96.80-202-25.nextgentel.com [80.202.25.96])
	by banan.dataparty-mn.biz (Postfix) with ESMTP id 81BDE13C337
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Feb 2006 17:54:26 +0100 (CET)
Message-ID: <43EF687C.9000107@repvik.org>
Date: Sun, 12 Feb 2006 17:55:24 +0100
From: =?ISO-8859-1?Q?=D8yvind_Repvik?= <oyvind@repvik.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Using DiskOnChip on Intel  IXP420
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

	I'm trying to get a DiskOnChip Plus to work with an Intel IXP420 arm 
CPU. In the original kernel (2.4.22-uc0), it probed 0x50000000 for the 
DoC chip, and found it. When I try probing using 2.6.15 or 
2.6.16-rc2-git8, all I get is a kernel panic (below). I've tried using 
both the old and new drivers, and I've tried using the latest CVS.
If anyone has any helpful tips or clues, I'd be very grateful.


#
Bad mode in data abort handler detected: mode ABT_32
#
Internal error: Oops - bad mode: 0 [#1]
#
Modules linked in:
#
CPU: 0
#
PC is at 0xffff027c
#
LR is at vprintk+0x340/0x384
#
pc : [<ffff027c>]    lr : [<c00364c0>]    Not tainted
#
sp : c03abf40  ip : c03abefc  fp : c03abfb0
#
r10: 00000000  r9 : 00000010  r8 : 50000000
#
r7 : 00000000  r6 : c4860000  r5 : c028ccf0  r4 : 00000000
#
r3 : 00004008  r2 : 00000085  r1 : 00000084  r0 : 00000010
#
Flags: nzCv  IRQs off  FIQs on  Mode ABT_32  Segment kernel
#
Control: 397F  Table: 00004000  DAC: 00000017
#
Process swapper (pid: 1, stack limit = 0xc03aa194)
#
Stack: (0xc03abf40 to 0xc03ac000)
#
bf40: 00000010 00000084 00000085 00004008 00000000 c028ccf0 c4860000 
00000000
#
bf60: 50000000 00000010 00000000 c03abfb0 c03abefc c03abf40 c00364c0 
ffff027c
#
bf80: 20000097 ffffffff 00000000 c028ccf0 c02e416c c001b03c 00000000 
00000000
#
bfa0: 00000000 c03abfd0 c03abfb4 c001773c c0017128 00000004 c001af94 
c03aa000
#
bfc0: 00000001 c03abff4 c03abfd4 c001d108 c00176d0 00000001 00000000 
00000000
#
bfe0: 00000000 00000000 00000000 c03abff8 c0037e68 c001d078 4322f3f5 
a2e373f3
#
Backtrace:
#
[<c001711c>] (doc_probe+0x0/0x5a8) from [<c001773c>] 
(init_nanddoc+0x78/0x100)
#
[<c00176c4>] (init_nanddoc+0x0/0x100) from [<c001d108>] (init+0x9c/0x224)
#
  r6 = 00000001  r5 = C03AA000  r4 = C001AF94
#
[<c001d06c>] (init+0x0/0x224) from [<c0037e68>] (do_exit+0x0/0x8f0)
#
  r7 = 00000000  r6 = 00000000  r5 = 00000000  r4 = 00000000
#
Code: 00000000 00000000 00000000 00000000 (00000000)
#
  <0>Kernel panic - not syncing: Attempted to kill init!
