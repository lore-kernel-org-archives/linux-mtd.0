Received: from smtpauth00.csee.onr.siteprotect.com ([64.26.60.144])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KfzYk-0000bl-M6
	for linux-mtd@lists.infradead.org; Wed, 17 Sep 2008 16:07:20 +0000
Received: from Lejin (unknown [124.30.115.150])
	(Authenticated sender: lejin@spacomp.com)
	by smtpauth00.csee.onr.siteprotect.com (Postfix) with ESMTP id
	5E223758078 for <linux-mtd@lists.infradead.org>;
	Wed, 17 Sep 2008 11:07:17 -0500 (CDT)
From: "Lejin K Joy" <lejin@spacomp.com>
To: <linux-mtd@lists.infradead.org>
Subject: [MTD] [NOR] Intel Strata P30 NOR Flash linux mtd driver Support
Date: Wed, 17 Sep 2008 21:37:09 +0530
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_000C_01C9190D.8AFAEEE0"
Message-Id: <20080917160717.5E223758078@smtpauth00.csee.onr.siteprotect.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_000C_01C9190D.8AFAEEE0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit



Hi All,

We are facing problem with detecting Intel Strata P30 NOR Flash. 

I am sending you the boot up log. We are using Linux 2.6.25-rc7 main stream
Kernel on ( Imx27 ) ARM Platform.

Flash part Number is JS48F4400P0VB00s. We suspect that it fails during
probing for Flash. Flash is actually mapped to address ( 0xc000 0000) size
dual die of ( 0x2000 0000). Please help us in this regards.

Any suggestions will be appreciated. If anyone has worked mtd driver for
this chip kindly help me with any suggestions or patches.

Thanks in Advance,
Lejin

------=_NextPart_000_000C_01C9190D.8AFAEEE0
Content-Type: text/enhanced;
	name="Flash_Intel_strata_p30_64MB_log.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="Flash_Intel_strata_p30_64MB_log.txt"

exec -b 0x100000 -l 0x200000 -c "noinitrd console=3Dttymxc0,115200 =
root=3D/
dev/mtdblock2 rootfstype=3Djffs2 init=3Dlinuxrc"
entry=3D0xa0008000, target=3D0xa0008000
Uncompressing =
Linux.............................................................
 done, booting the kernel.
Linux version 2.6.25-rc7 (root@localhost.localdomain) (gcc version =
4.1.2) #23 PR
EEMPT Wed Sep 17 17:46:17 IST 2008
CPU: ARM926EJ-S [41069264] revision 4 (ARMv5TEJ), cr=3D00053177
Machine: Freescale i.MX27ADS
Memory policy: ECC disabled, Data cache writeback
BUG: mapping for 0x10000000 at 0xd4000000 overlaps vmalloc space
BUG: mapping for 0x80000000 at 0xd4100000 overlaps vmalloc space
BUG: mapping for 0xd8000000 at 0xd4200000 overlaps vmalloc space
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: =
32512
Kernel command line: noinitrd console=3Dttymxc0,115200 =
root=3D/dev/mtdblock2 rootfst
ype=3Djffs2 init=3Dlinuxrc
MXC IRQ initialized
PID hash table entries: 512 (order: 9, 2048 bytes)
console [ttymxc0] enabled
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 128MB =3D 128MB total
Memory: 128000KB available (1708K code, 106K data, 56K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
JFFS2 version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
JFS: nTxBlock =3D 1000, nTxLock =3D 8002
io scheduler noop registered (default)
Serial: IMX driver
imx-uart.0: ttymxc0 at MMIO 0x1000a000 (irq =3D 20) is a IMX
imx-uart.1: ttymxc1 at MMIO 0x1000b000 (irq =3D 19) is a IMX
imx-uart.2: ttymxc2 at MMIO 0x1000c000 (irq =3D 18) is a IMX
imx-uart.3: ttymxc3 at MMIO 0x1000d000 (irq =3D 17) is a IMX
imx-uart.4: ttymxc4 at MMIO 0x1001b000 (irq =3D 49) is a IMX
imx-uart.5: ttymxc5 at MMIO 0x1001c000 (irq =3D 48) is a IMX
Mainstone configured to boot from processor flash
Probing processor flash at physical address 0xc0000000 (16-bit =
bankwidth)
Before do_map_probe in integrator-flash.c<1>Unhandled fault: external =
abort on n
on-linefetch (0x008) at 0xc9000020
Internal error: : 8 [#1] PREEMPT
Modules linked in:
CPU: 0    Not tainted  (2.6.25-rc7 #23)
PC is at simple_map_read+0x2c/0x3c
LR is at qry_present+0x1ac/0x290
pc : [<c016650c>]    lr : [<c015a290>]    psr: 60000013
sp : c7c17e18  ip : c7c17e28  fp : c7c17e24
r10: 00000002  r9 : 00000000  r8 : c7c17ec8
r7 : c01d1bac  r6 : 00000002  r5 : 00000001  r4 : 00000020
r3 : 00000002  r2 : c9000000  r1 : 00000020  r0 : c01d1bac
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005317f  Table: a0004000  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0xc7c16268)
Stack: (0xc7c17e18 to 0xc7c18000)
7e00:                                                       c7c17e6c =
c7c17e28=20
7e20: c015a290 c01664f0 00005151 00005252 00005959 000008ee c7c17e64 =
c7c17e48=20
7e40: c0028680 00000002 00000001 00000002 c01d1bac 00000001 c7c17ec8 =
00000000=20
7e60: c7c17eb4 c7c17e70 c015a760 c015a0f4 c7c17eb4 c7c17e80 00000000 =
c0028b38=20
7e80: c01b402c fffff712 c7c16000 00000001 00000002 c01d1a0c 00000001 =
c7c17ec8=20
7ea0: c01d1bac c01dc8b4 c7c17f2c c7c17eb8 c01661b4 c015a57c ffffffff =
c01d1bac=20
7ec0: 60000013 0000002c 00000000 00000000 00000002 00000001 00000000 =
00000000=20
7ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000=20
7f00: c7dab640 c01d19f4 c01d19f4 c01dc8b4 c01dc8bc c01dc8c4 c01d1bac =
c01dc8b4=20
7f20: c7c17f3c c7c17f30 c015a388 c0166130 c7c17f54 c7c17f40 c015a004 =
c015a384=20
7f40: c01d1bac 00000000 c7c17f84 c7c17f58 c0012608 c0159fe8 00000000 =
00000000=20
7f60: 00000000 00000000 c0013b28 c7c16000 c0014404 00000000 c7c17ff4 =
c7c17f88=20
7f80: c00087a4 c0012558 c7c17fac c7c17f98 c0024184 c00234d8 c004faac =
00000000=20
7fa0: 00000000 c7c17fb0 c0016b04 c0024178 00000000 00000000 c0008728 =
c002bfc8=20
7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000=20
7fe0: 00000000 00000000 00000000 c7c17ff8 c002bfc8 c0008738 c107ceb7 =
66e07eb7=20
Backtrace:=20
[<c01664e0>] (simple_map_read+0x0/0x3c) from [<c015a290>] =
(qry_present+0x1ac/0x2
90)
[<c015a0e4>] (qry_present+0x0/0x290) from [<c015a760>] =
(cfi_probe_chip+0x1f4/0xe
38)
[<c015a56c>] (cfi_probe_chip+0x0/0xe38) from [<c01661b4>] =
(mtd_do_chip_probe+0x9
4/0x3c0)
[<c0166120>] (mtd_do_chip_probe+0x0/0x3c0) from [<c015a388>] =
(cfi_probe+0x14/0x1
c)
[<c015a374>] (cfi_probe+0x0/0x1c) from [<c015a004>] =
(do_map_probe+0x2c/0x40)
[<c0159fd8>] (do_map_probe+0x0/0x40) from [<c0012608>] =
(init_mainstone+0xc0/0x27
c)
 r5:00000000 r4:c01d1bac
[<c0012548>] (init_mainstone+0x0/0x27c) from [<c00087a4>] =
(kernel_init+0x7c/0x28
4)
[<c0008728>] (kernel_init+0x0/0x284) from [<c002bfc8>] =
(do_exit+0x0/0x6cc)
Code: 0590300c 07930001 e89da800 e590200c (e19230b1)=20
---[ end trace 86a5aea2f805b6ff ]---
Kernel panic - not syncing: Attempted to kill init!

------=_NextPart_000_000C_01C9190D.8AFAEEE0--
