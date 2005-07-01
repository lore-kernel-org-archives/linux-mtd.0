Received: from wproxy.gmail.com ([64.233.184.202])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DoFYq-00028z-LD
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2005 03:03:44 -0400
Received: by wproxy.gmail.com with SMTP id i20so246288wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Jul 2005 00:03:32 -0700 (PDT)
Message-ID: <639438900507010003499e2512@mail.gmail.com>
Date: Fri, 1 Jul 2005 15:03:31 +0800
From: red dot <vvlook@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Cfi can't probe the flash(am29lv320db)
Reply-To: red dot <vvlook@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If i use "map_rom" to probe the flash, the kernel can run normally.
When i probe it with "cfi_probe", it can be found.

Following the messages:

CPU: ARM720T [41807202] revision 2 (ARMv4T)
Machine: Hynix HMS30C7202
Warning: bad configuration page, trying to continue
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists
Kernel command line: console=3DttyS2,57600 mem=3D8M rootfstype=3Dromfs
root=3D/dev/mtdblock2 ro
Trying to install chained handler for IRQ16
PID hash table entries: 64 (order: 6, 1024 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory: 8MB =3D 8MB total
Memory: 6784KB available (991K code, 237K data, 52K init)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Linux NoNET1.0 for Linux 2.6
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
Initializing Cryptographic API
h720x Framebuffer driver
h720xfb_init_fbinfo
h720xfb_set_par
var: xres=3D320 hslen=3D4 lm=3D0 rm=3D0
var: yres=3D240 vslen=3D0 um=3D0 bm=3D0
h720xfb_check_var
var->bits_per_pixel=3D4
RGBT length =3D 8:8:8:0
RGBT offset =3D 0:0:0:0
h7202 PS/2 port driver
Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing disabled
ttyS0 at MMIO 0x0 (irq =3D 8) is a 16550A
ttyS1 at MMIO 0x0 (irq =3D 9) is a 16550A
ttyS2 at MMIO 0x0 (irq =3D 10) is a 16550A
ttyS3 at MMIO 0x0 (irq =3D 11) is a 16550A
Using anticipatory io scheduler
H720x remap virt=3Dc1080000
H720x-MTD probing 16bit FLASH
file:drivers/mtd/chips/cfi_probe.c line:70 base=3D0
file:drivers/mtd/chips/cfi_probe.c line:86=20
file:drivers/mtd/chips/cfi_probe.c line:88=20
Unable to handle kernel paging request at virtual address c1080055
pgd =3D c0004000
[c1080055] *pgd=3D4019f031, *pte=3D000000a3, *ppte=3D00000552
Internal error: Oops: 1a00081f [#1]
Modules linked in:
CPU: 0
PC is at cfi_probe_chip+0x2c8/0x10d8
LR is at cfi_probe_chip+0x248/0x10d8
pc : [<c00ead84>]    lr : [<c00ead04>]    Not tainted
sp : c01a3eb0  ip : 00000000  fp : c01a3f34
r10: 00000000  r9 : 00000055  r8 : c01a3f3c
r7 : 00000002  r6 : c0122d38  r5 : 00000001  r4 : 00000002
r3 : c1080000  r2 : 00000098  r1 : 00000002  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 217F  Table: 4000401D  DAC: 0000001D
Process swapper (pid: 1, stack limit =3D 0xc01a2190)
Stack: (0xc01a3eb0 to 0xc01a4000)
3ea0:                                     0000001e c01a3f34 c01a3ec4 c0016a=
c0=20
3ec0: c0017c38 00000000 0000000d 00000000 00000020 c0147920 00002702 000000=
20=20
3ee0: c013c930 00000003 00000000 0000001e c01a3f34 00000002 c01a3f0c c01a3f=
34=20
3f00: 00000098 000000ff 000000f0 00000001 00000002 00000000 c0014d38 c0122d=
38=20
3f20: c01a3f3c c0122c9c c01a3f9c c01a3f38 c00f06c8 c00eaacc 00000763 000000=
00=20
3f40: 00000000 00000001 00000001 00000000 00000000 00000000 00000000 000000=
00=20
3f60: 00000000 00000000 00000000 00000000 00000000 c0122c84 c010b284 c0122d=
38=20
3f80: c0014d38 00000000 00000000 00000000 c01a3fb8 c01a3fa0 c00ea6f8 c00f06=
58=20
3fa0: c0122d38 c01a2000 00000000 c01a3fd4 c01a3fbc c00135dc c00ea6b0 c0014d=
1c=20
3fc0: c01a2000 00000000 c01a3ff4 c01a3fd8 c00150e0 c001355c 00000000 000000=
00=20
3fe0: 00000000 00000000 00000000 c01a3ff8 c002b030 c0015064 00000000 000000=
00=20
Backtrace:=20
[<c00eaabc>] (cfi_probe_chip+0x0/0x10d8) from [<c00f06c8>]
(mtd_do_chip_probe+0x80/0x304)
[<c00f0648>] (mtd_do_chip_probe+0x0/0x304) from [<c00ea6f8>]
(do_map_probe+0x58/0xa0)
[<c00ea6a0>] (do_map_probe+0x0/0xa0) from [<c00135dc>]
(h720x_mtd_init+0x90/0x164)
 r6 =3D 00000000  r5 =3D C01A2000  r4 =3D C0122D38=20
[<c001354c>] (h720x_mtd_init+0x0/0x164) from [<c00150e0>] (init+0x8c/0x1c8)
 r6 =3D 00000000  r5 =3D C01A2000  r4 =3D C0014D1C=20
[<c0015054>] (init+0x0/0x1c8) from [<c002b030>] (do_exit+0x0/0xae4)
 r7 =3D 00000000  r6 =3D 00000000  r5 =3D 00000000  r4 =3D 00000000
Code: 07c32009 0a000006 e3530002 0596300c (018320b9)=20
 <0>Kernel panic - not syncing: Attempted to kill init!
=20
The kernel is broken at cfi_send_gen_cmd(0x98, 0x55, base, map, cfi,
cfi->device_type, NULL).

Thanks
