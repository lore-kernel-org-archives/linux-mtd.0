Received: from mail.avantwave.com ([210.17.210.210])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DJ5me-0002gC-16
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2005 04:21:10 -0400
Received: from [172.16.11.198] ([172.16.11.198])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id j368E8Xb006681
	for <linux-mtd@lists.infradead.org>; Wed, 6 Apr 2005 16:14:13 +0800
Message-ID: <42539BD9.9060800@hello.com>
Date: Wed, 06 Apr 2005 16:20:41 +0800
From: mike lee <mikelee@hello.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: porting flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all
    I am porting mtd mapping driver to MXLADS board from motorola. It
embedded two 16bit 8MB AMD CFI flash to interleave 32 bit bus. I have
set the geometry function on 2-chip interleave.
   I have no idea on this oops, Do anybody have ideas on this?
  Thanks for helping

elevator: using deadline as default io scheduler
NOR flash:(size->0x800000 mem->0x10000000)
NOR flash: try bankwidth 32bit, probing...
NOR Flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
NOR Flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
RedBoot partition parsing not available
NOR flash driver: Use static partition allocation
Creating 5 MTD partitions on "NOR Flash 1":
0x00000000-0x00100000 : "bootloader"
0x00100000-0x00300000 : "kernel"
0x00300000-0x00500000 : "System RFS"
0x00500000-0x00700000 : "User Application"
0x00700000-0x00800000 : "User Data"
Bluetooth: HCI UART driver ver 2.1
Bluetooth: HCI H4 protocol initialized
Bluetooth: HCI BCSP protocol initialized
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
NET: Registered protocol family 1
Bluetooth: L2CAP ver 2.6
Bluetooth: L2CAP socket layer initialized
Bluetooth: RFCOMM ver 1.3
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM TTY layer initialized
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 5 [#1]
Modules linked in:
CPU: 0
PC is at __wake_up_common+0x28/0x7c
LR is at 0x0
pc : [<c00318e0>]    lr : [<00000000>]    Not tainted
sp : c035be4c  ip : c035be78  fp : c035be74
r10: 00000003  r9 : 00000000  r8 : 00000000
r7 : c0198494  r6 : c035a000  r5 : c027dcf4  r4 : 00000001
r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : c027dcf4
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment kernel
Control: C000717F  Table: 08004000  DAC: 0000001D
Process mtdblockd (pid: 10, stack limit = 0xc035a190)
Stack: (0xc035be4c to 0xc035c000)
be40:                            c035a000 60000013 c035a000 c0198494
c027dcd8
be60: c027dcd8 00000000 c035be90 c035be78 c0031974 c00318c8 00000000
00000000
be80: c027dca0 c035beb8 c035be94 c00fe5f4 c0031944 c027dca0 00000000
c027dca0
bea0: c035a000 00000200 c0198494 c035bf0c c035bebc c00fe848 c00fe4cc
00000000
bec0: 00000000 c027dca0 00300000 00300000 00000000 00000200 c027dca0
00000200
bee0: 00000000 00000000 00000200 00000000 00000200 c035bf54 00000000
c038c000
bf00: c035bf44 c035bf10 c00f7dec c00fe614 c035bf54 c038c000 00000001
c035bf44
bf20: 00000200 00000000 00000200 c0363de0 c038c000 00020000 c035bf80
c035bf48
bf40: c00fa818 c00f7d64 c035bf54 c038c000 c0347200 00000000 00000008
00000000
bf60: c038c000 c0198334 c035ef60 00000000 c0349304 c035bfa4 c035bf84
c00fabf4
bf80: c00fa750 c035ef70 c035a000 c035ef60 c035068c c0198334 c035bff4
c035bfa8
bfa0: c00fae58 c00fab94 00000000 c02cd560 c00318a0 00000000 00000000
00000000
bfc0: c02cd560 c00318a0 00000000 00000000 00000000 00000000 00000000
00000000
bfe0: 00000000 00000000 00000000 c035bff8 c0037c50 c00fac88 00000000
00000000
Backtrace:
[<c00318b8>] (__wake_up_common+0x0/0x7c) from [<c0031974>]
(__wake_up+0x40/0x64)
[<c0031934>] (__wake_up+0x0/0x64) from [<c00fe5f4>] (put_chip+0x138/0x148)
 r5 = C027DCA0  r4 = 00000000
[<c00fe4bc>] (put_chip+0x0/0x148) from [<c00fe848>]
(cfi_amdstd_read+0x244/0x2bc)
 r8 = C0198494  r7 = 00000200  r6 = C035A000  r5 = C027DCA0
 r4 = 00000000
[<c00fe604>] (cfi_amdstd_read+0x0/0x2bc) from [<c00f7dec>]
(part_read+0x98/0xcc)
[<c00f7d54>] (part_read+0x0/0xcc) from [<c00fa818>]
(do_cached_read+0xd8/0x10c)
[<c00fa740>] (do_cached_read+0x0/0x10c) from [<c00fabf4>]
(do_blktrans_request+0x70/0xf4)
[<c00fab84>] (do_blktrans_request+0x0/0xf4) from [<c00fae58>]
(mtd_blktrans_thread+0x1e0/0x278)
 r8 = C0198334  r7 = C035068C  r6 = C035EF60  r5 = C035A000
 r4 = C035EF70
[<c00fac78>] (mtd_blktrans_thread+0x0/0x278) from [<c0037c50>]
(do_exit+0x0/0x534)
Code: e1a0a001 e1a04002 e1a08003 e59b9004 (e59e7000)
 <0>Kernel panic - not syncing: Aiee, killing interrupt handler!
