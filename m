Received: from sea2-f25.sea2.hotmail.com ([207.68.165.25] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SBjn-00047a-Qk
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jun 2003 09:22:44 +0100
From: "Mark George" <ice9973@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 17 Jun 2003 08:22:41 +0000
Mime-Version: 1.0
Message-ID: <Sea2-F25OGQOuE3chAH00004e5c@hotmail.com>
Content-Type: text/plain; charset=gb2312; format=flowed
Subject: jffs2 over nand flash, kernel panic, help me!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My platform is Samsung 44b0x (ARM7TDMI) ,uClinux-2.4.20.

I modified the spia.c according to my board. My board booting information 
is like this:
...
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications 
AB.
ttyS0 at I/O 0x1d00000 (irq = 3) is a S3C44B0
ttyS1 at I/O 0x1d04000 (irq = 2) is a S3C44B0
RAMDISK driver initialized: 16 RAM disks of 1024K size 1024 blocksize
NAND device: Manufacture ID: 0xec, Chip ID: 0xe6 (Samsung KM29U64000)
Creating 2 MTD partitions on "Samsung KM29U64000":
0x00000000-0x00400000 : "SPIA flash partition 1"
mtd: Giving out device 0 to SPIA flash partition 1
0x00400000-0x00800000 : "SPIA flash partition 2"
mtd: Giving out device 1 to SPIA flash partition 2
......

When I run the nandtest, I got the 'kernel panic'. :(

Anybody can give me some advice?

Sash command shell (version 1.1.1)
/> nandtest /dev/mtdblock1
mtdblock_open
ok
MEMGETINFOmtdblock_release
Unhandled fault: alignment exception (93) at 0x00000001
fault-common.c(97): start_code=0xc240040, start_stack=0xc243f84)
Internal error: Oops: 0
CPU: 0
pc : [<0c0196e0>]    lr : [<0c07514c>]    Not tainted
sp : 0c24de8c  ip : 0c24debc  fp : 0c24deb8
r10: 0c09f11c  r9 : 0c0d11fc  r8 : 20000013
r7 : 0c0990ec  r6 : 00000001  r5 : 0c0a4a48  r4 : e59ff184
r3 : e59ff184  r2 : 00000003  r1 : 00000003  r0 : ffffff02
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: 0
Process nandtest (pid: 11, stackpage=0c24d000)
Stack:
0c24de60:                                                                 
0c0751
4c
0c24de80: 0c0196e0 a0000093 ffffffff 00000003  0c24debc 0c0a4a48 0c0a4a40 
0c0d11
dc
0c24dea0: 0c24decc 00000006 0c241ee4 0c24defc  0c24debc 0c07514c 0c0196a0 
000000
00
0c24dec0: 0c24c000 00000000 00000000 00000000  0c24c000 00000000 00000000 
0c0cc2
e8
0c24dee0: 0c0cc2e0 00000004 0c0bae5c 0c013720  0c24df0c 0c24df00 0c075e94 
0c0750
44
0c24df00: 0c24df2c 0c24df10 0c077734 0c075e88  0c0e5160 0c00bbc0 00000000 
0c24a1
40
0c24df20: 0c24df48 0c24df30 0c03621c 0c07768c  0c0e6120 0c00b9e0 0c0cf260 
0c24df
58
0c24df40: 0c24df4c 0c0362bc 0c036180 0c24df78  0c24df5c 0c02fbd0 0c0362b4 
0c0e61
20
0c24df60: 00000000 0c0091e0 0c24c000 0c24df94  0c24df7c 0c02e878 0c02fb48 
0c0091
e0
0c24df80: 0c0e6120 00000000 0c24dfac 0c24df98  0c02e910 0c02e80c 00000002 
0c243f
90
0c24dfa0: 00000000 0c24dfb0 0c013580 0c02e894  00000002 0c0192f4 00000003 
0c2421
40
0c24dfc0: 00000001 00000000 00000002 0c243f90  00000000 00000000 00000003 
000000
00
0c24dfe0: 0c241ee4 00000000 00000000 0c243f2c  0c240124 0c2416a4 00000010 
000000
03
Backtrace:
Function entered at [<0c019690>] from [<0c07514c>]
Function entered at [<0c075034>] from [<0c075e94>]
 r8 = 0C013720  r7 = 0C0BAE5C  r6 = 00000004  r5 = 0C0CC2E0
 r4 = 0C0CC2E8
Function entered at [<0c075e78>] from [<0c077734>]
Function entered at [<0c07767c>] from [<0c03621c>]
 r7 = 0C24A140  r6 = 00000000  r5 = 0C00BBC0  r4 = 0C0E5160
Function entered at [<0c036170>] from [<0c0362bc>]
 r6 = 0C0CF260  r5 = 0C00B9E0  r4 = 0C0E6120
Function entered at [<0c0362a4>] from [<0c02fbd0>]
Function entered at [<0c02fb38>] from [<0c02e878>]
 r7 = 0C24C000  r6 = 0C0091E0  r5 = 00000000  r4 = 0C0E6120
Function entered at [<0c02e7fc>] from [<0c02e910>]
 r6 = 00000000  r5 = 0C0E6120  r4 = 0C0091E0
Function entered at [<0c02e884>] from [<0c013580>]
 r5 = 0C243F90  r4 = 00000002
Code: e5140004 e51b202c (e5903000) e1130002 0a00001a
Kernel panic: Aiee, killing interrupt handler

In interrupt handler - not syncing
 : Unknown error 22

_________________________________________________________________
√‚∑—œ¬‘ÿ MSN Explorer:   http://explorer.msn.com/lccn  
