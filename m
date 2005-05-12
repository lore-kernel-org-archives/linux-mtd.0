Received: from mail.everest-co.com ([64.3.182.162] helo=pe2650.everest-co.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DWFlL-0005Kd-3m
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 11:38:12 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Thu, 12 May 2005 10:38:50 -0500
Message-ID: <81772B4336DEC14EBB8C519C4EC21051F80D90@pe2650.everest-co.com>
From: "Ralph Walden" <ralphw@everest-co.com>
To: <linux-mtd@lists.infradead.org>
Subject: Oops at jffs2_build_remove_unlinked_inode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have been using a JFFS2 filesystem successfully for an embedded
application in a Linux 2.4.21 embedded system for months now.  When
moving into the 2.6 kernels (currently 2.6.11) I am running into
problems.

The filesystem contains data and applications, and occasionally I have
had the system fail to mount the filesystem with various messages shown
at the end of this post.

Details:
	ARM (OMAP5910)
      Intel Strataflash K3 (NOR)
	MTD/JFFS included with the 2.6.11 kernel
	MTD Boot messages:

physmap flash device: 2000000 at 0
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
RedBoot partition parsing not available
omap_brentwood: bootable: 1<6>omap_brentwood_cs0: Found 1 x16 devices at
0x0 in
16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
omap_brentwood: creating partitions<5>Creating 5 MTD partitions on
"omap_brentwo
od_cs0":
0x00000000-0x00020000 : "bootloader"
0x00020000-0x00040000 : "params"
0x00040000-0x00400000 : "kernel"
0x00200000-0x00400000 : "initrd"
0x00400000-0x02000000 : "jffs2"

Here's an "oops" that has occasionally occurs, after working for many
times:

Unable to handle kernel paging request at virtual address 6b6b6b6f
pgd = c0894000
[6b6b6b6f] *pgd=00000000
Internal error: Oops: 1 [#1]
Modules linked in:
CPU: 0
PC is at jffs2_build_remove_unlinked_inode+0x50/0xec
LR is at 0x1
pc : [<c0124508>]    lr : [<00000001>]    Not tainted
sp : c0887cf4  ip : 60000013  fp : c0887d14
r10: c09a5380  r9 : c09a52c4  r8 : 00000000
r7 : c09a52c4  r6 : c0887d30  r5 : c0b1121c  r4 : 6b6b6b6b
r3 : 6b6b6b6b  r2 : 00000000  r1 : c0b1121c  r0 : c0206ef8
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 317F  Table: 10894000  DAC: 00000015
Process mount (pid: 226, stack limit = 0xc0886194)
Stack: (0xc0887cf4 to 0xc0888000)
7ce0:                                              c0887d34 c0b1121c
00000000
7d00: c09a5368 c09a5378 c0887d64 c0887d18 c01249bc c01244c8 c09a53bc
c09a53a0
7d20: c09a5398 c09a5390 c09a5388 c09a5370 00000000 0000006c c0887d64
c09a5af4
7d40: c09a52c4 00000000 c09a50b8 c09a5af4 c08a2000 c023eb9c c0887d88
c0887d68
7d60: c0126bc8 c01245b4 c09a50b8 c09a52c4 00000000 c08a2000 c09a5af4
c0887dac
7d80: c0887d8c c012723c c0126a94 ffffffea 00000003 c089b000 00000000
c0887db8
7da0: c0887e20 c0887db0 c0127470 c01271bc c09a5af4 c0299080 c09abb80
c0864284
7dc0: c00834e4 c00827d0 c0299080 00000001 00000001 00000000 c0887e04
c0992e50
7de0: c0992e50 c086422c c089b000 c023eb9c 00000000 c0887f0c c089b000
c086422c
7e00: fffffff4 c023eb9c 00000000 c0887f0c c08a2000 c0887e48 c0887e24
c00a3af0
7e20: c0127300 00000000 c086d000 c089b000 00000000 00000000 c089a000
c0887f74
7e40: c0887e4c c00bb97c c00a3aa8 c002e11c 000000bb c002e11c 00000000
c0887e7c
7e60: c0887e6c c0070bc0 c012dce4 c0887f10 c0887e90 c0887e80 c003a0e0
c0070bb0
7e80: 000f3000 c0887eb0 c0887e94 c003a4f4 c003a0d8 c098bac0 ffffffec
000f3000
7ea0: c002ecd4 c0887ee8 c0887eb4 c003a84c c003a4e0 c0237534 00000001
c0887f04
7ec0: c0887ecc c007f7d4 c007f238 000f3000 60000013 000000d0 00000000
c0237518
7ee0: 00000001 000000d0 c0237884 00000000 00000000 c098bac0 c0887f44
c0887f08
7f00: c007f9f8 c007f56c 00000000 c09abc14 c0864284 00000010 c0878c00
00000000
7f20: 00000001 00000001 00000000 c0033a84 c0886000 00000000 c0887f54
c0887f48
7f40: c007fce4 c007f928 c0886000 00000000 00000000 c086d000 c0ed0000
c0033a84
7f60: c0886000 00000000 c0887fa4 c0887f78 c00bbde0 c00bb39c c08a2000
c08a2000
7f80: c089b000 c089a000 000ef2e8 c0ed0000 000ef2f8 00000015 00000000
c0887fa8
7fa0: c0033900 c00bbd54 000ef2e8 c003a980 000ef2f8 000f0300 000f2490
c0ed0000
7fc0: 000ef2e8 c0ed0000 000ef2f8 00000002 00000000 000f0300 00000000
000f2490
7fe0: 000ef2e8 befffaec 000389fc 0007af2c 80000010 000ef2f8 b3957da5
d27d9af7
Backtrace:
[<c01244b8>] (jffs2_build_remove_unlinked_inode+0x0/0xec) from
[<c01249bc>] (jff
s2_do_mount_fs+0x418/0x714)
 r8 = C09A5378  r7 = C09A5368  r6 = 00000000  r5 = C0B1121C
 r4 = C0887D34
[<c01245a4>] (jffs2_do_mount_fs+0x0/0x714) from [<c0126bc8>]
(jffs2_do_fill_supe
r+0x144/0x250)
[<c0126a84>] (jffs2_do_fill_super+0x0/0x250) from [<c012723c>]
(jffs2_get_sb_mtd
+0x90/0xec)
 r8 = C09A5AF4  r7 = C08A2000  r6 = 00000000  r5 = C09A52C4
 r4 = C09A50B8
[<c01271ac>] (jffs2_get_sb_mtd+0x0/0xec) from [<c0127470>]
(jffs2_get_sb+0x180/0
x1c0)
 r8 = C0887DB8  r7 = 00000000  r6 = C089B000  r5 = 00000003
 r4 = FFFFFFEA
[<c01272f0>] (jffs2_get_sb+0x0/0x1c0) from [<c00a3af0>]
(do_kern_mount+0x58/0x10
0)
[<c00a3a98>] (do_kern_mount+0x0/0x100) from [<c00bb97c>]
(do_mount+0x5f0/0x624)
[<c00bb38c>] (do_mount+0x0/0x624) from [<c00bbde0>]
(sys_mount+0x9c/0xe8)
[<c00bbd44>] (sys_mount+0x0/0xe8) from [<c0033900>]
(ret_fast_syscall+0x0/0x2c)
 r7 = 00000015  r6 = 000EF2F8  r5 = C0ED0000  r4 = 000EF2E8
Code: e3530000 089da9f0 e3a08000 e5954000 (e5943004)

Any ideas?

Thanks,

Ralph Walden



******************************************************************

This email and any files transmitted with it are the property of 
Everest Biomedical Instruments Company and are confidential. If 
you have received this email in error please notify the sender or 
Everest Biomedical at postmaster@everest-co.com or 636-519-7770.
