Received: from fe-relay01.albacom.net ([217.220.57.138])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HWFLG-0000Yn-IV
	for linux-mtd@lists.infradead.org; Tue, 27 Mar 2007 13:20:22 -0400
Received: from gianlinux.eptar.com (massimo.eptar.com [192.168.143.6])
	by eptar.com (8.11.6/8.9.3) with ESMTP id l2RHHTk24234
	for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2007 19:17:29 +0200
From: Gianluca <gianlucarenzi@eptar.com>
To: MTD List <linux-mtd@lists.infradead.org>
Subject: Just a question on nandwrite (mtd-utils)
Date: Tue, 27 Mar 2007 19:17:49 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703271917.49469.gianlucarenzi@eptar.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I am using a Samsung S3C2442 (SoC / MCP with 1Gbit Internal NAND Flash and SDRAM)
and linux kernel 2.6.19 and the latest mtd patch.

it works good. But I have a question:

When I am writing a HUGE nand flash image (i.e.: bigger than system ram)
linux crashes!
My kernel is compiled WITHOUT VM enabled so I supposed that any application
requesting more than the available memory simply quits.
I am wrong.
The kernel hangs with this log:
...
...
Writing data to block 22e0000
Unable to handle kernel paging request at virtual address e3a01010
pgd = c36b0000
[e3a01010] *pgd=00000000
Internal error: Oops: 5 [#1]
CPU: 0
PC is at find_get_page+0x28/0x64
LR is at 0xffffffff
pc : [<c005a5f0>]    lr : [<ffffffff>]    Not tainted
sp : c3b3fdd0  ip : fffffffa  fp : c3b3fddc
r10: 00000000  r9 : 07fe0000  r8 : 00001000
r7 : 000023f8  r6 : 00000000  r5 : 000023f8  r4 : 000007c0
r3 : 00000038  r2 : c1ad8a6c  r1 : 000023f8  r0 : e3a01010
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: 717F
Table: 336B0000  DAC: 00000015
Process nandwrite (pid: 2954, stack limit = 0xc3b3e250)
Stack: (0xc3b3fdd0 to 0xc3b40000)
fdc0:                                     c3b3fe5c c3b3fde0 c005afb8 c005a5d8
fde0: 00000002 c3b3fefc c384d9e0 c384da24 c393528c c39351e8 00007fdf 000023f9
fe00: 000023f9 000023f7 00000000 000023dc 00000020 00000000 00000000 000023f8
fe20: 000023fc 00000020 00000020 00000000 00000000 c3b3ff40 00000000 c384d9e0
fe40: 00000001 00000000 c3b3ff38 c3b3feb4 c3b3fea8 c3b3fe60 c005d424 c005ae58
fe60: c3b3fe70 c005a428 00000001 c3b3fefc 000007c0 00000040 00012d28 00000000
fe80: c3b3feb4 c384d9e0 c3b3ff80 00000800 c0025f44 c3b3e000 022e0000 c3b3ff58
fea0: c3b3feb0 c0075a14 c005d2b4 023f7840 00000000 00000000 022e0000 00000000
fec0: 00000001 ffffffff c384d9e0 00000000 00000000 00000000 00000000 c387a040
fee0: 00000000 00000000 c3bcb000 c387a040 c004fbc4 c3b3fef4 c3b3fef4 023f7840
ff00: 00000000 c3bcb000 c390e4a0 00000800 00000040 00000800 c0114294 022e0000
ff20: 00000000 00000000 00000000 c3b84350 00000002 c3bce24c 00012568 00000800
ff40: c384d9e0 00012568 c3b3ff80 c3b3ff7c c3b3ff5c c0076450 c0075964 00000000
ff60: c384d9e0 023f7840 00000000 00000003 c3b3ffa4 c3b3ff80 c0076938 c00763a8
ff80: 023f7840 00000000 00000000 00000000 00000800 00000800 00000000 c3b3ffa8
ffa0: c0025da0 c00768fc 00000000 00000800 00000004 00012568 00000800 00000000
ffc0: 00000000 00000800 00000800 00000003 00012528 05be87c0 022e0000 00012264
                                                                                                                                                           
How can I avoid it, because I need to write an image that it is 128MiB in size
and the system ram is *only* 64MiB.

With the "top" utility I can see the memory chunks allocated every read from
the file image, but never released after writing...
What is happening?

Regards,
-- 
Gianluca Renzi
