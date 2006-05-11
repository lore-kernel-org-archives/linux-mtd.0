Received: from nz-out-0102.google.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeCy1-0004tA-LW
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 11:20:51 -0400
Received: by nz-out-0102.google.com with SMTP id z6so187121nzd
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 May 2006 08:20:37 -0700 (PDT)
Message-ID: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
Date: Thu, 11 May 2006 17:20:37 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_5271_7138058.1147360837486"
Subject: [PATCH] Do not oops when configured flash size is less then chip
	size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_5271_7138058.1147360837486
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all,

please review this patch for inclusion. It is against the MTD GIT tree.

Prevents an oops (see kernel boot log below) in case the flash area
size is configured too small (or, if you order a larger than default
Flash population for your board :-)

--=20
Leon

Uncompressing Linux........................................................=
...........................
done, booting the kernel.
Linux version 2.6.16 (buytenh@phi.wantstofly.org) (gcc version 4.0.1)
#1 Mon Mar 20 13:52:40 CET 2006
CPU: ARM920Tid(wb) [41129200] revision 0 (ARMv4T)
Machine: Glomation GESBC-9312-sx
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Built 1 zonelists
Kernel command line: console=3DttyAM0,57600,8n1
PID hash table entries: 512 (order: 9, 8192 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 32MB 32MB =3D 64MB total
Memory: 62176KB available (2132K code, 409K data, 84K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
NetWinder Floating Point Emulator V0.97 (extended precision)
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
io scheduler noop registered
io scheduler deadline registered (default)
ep93xx_wdt: EP93XX watchdog, driver version 0.3 (nCS1 disable detected)
Serial: AMBA driver $Revision: 1.41 $
apb:uart1: ttyAM0 at MMIO 0x808c0000 (irq =3D 52) is a AMBA
apb:uart2: ttyAM1 at MMIO 0x808d0000 (irq =3D 54) is a AMBA
apb:uart3: ttyAM2 at MMIO 0x808e0000 (irq =3D 55) is a AMBA
ep93xx_eth: version 2.8 2005-11-08 Cirrus Logic
ep93xx_eth: #0 at 0xfef10000 IRQ:39
ep93xx_eth: using random number 00:d0:69:40:2b:13 as MAC, don't forget
to assign a valid MAC later!
physmap flash device: 800000 at 60000000
phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Searching for RedBoot partition table in phys_mapped_flash at offset 0x1fc0=
000
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
4
pgd =3D c0004000
[00000004] *pgd=3D00000000
Internal error: Oops: 5 [#1]
Modules linked in:
CPU: 0
PC is at _raw_spin_lock+0x14/0x134
LR is at _spin_lock+0x10/0x14
pc : [<c01161dc>]    lr : [<c01f5904>]    Not tainted
sp : c0307eb4  ip : c0307ee0  fp : c0307edc
r10: c5c98c98  r9 : 01fc0000  r8 : c0247c70
r7 : c5c2007c  r6 : 00000000  r5 : 01fc0000  r4 : c5c98c60
r3 : dead4ead  r2 : 00000000  r1 : 00000000  r0 : 00000000
Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: C000717F  Table: 00004000  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0xc0306250)
Stack: (0xc0307eb4 to 0xc0308000)
7ea0:                                              c0307ec0 c5c98c60 01fc00=
00
7ec0: 00000000 c5c2007c c0247c70 c5c98c98 c0307eec c0307ee0 c01f5904 c01161=
d8
7ee0: c0307f34 c0307ef0 c01502e4 c01f5904 00040000 c5c98c60 00000000 000400=
00
7f00: 00000000 01fc0000 00000000 01fc0000 c001c134 00000000 c5c2007c 000000=
00
7f20: 00000000 c5c2007c c0307f90 c0307f38 c0140850 c0150210 c0307f60 c70810=
00
7f40: 00000000 c013f478 00000000 c028f8f0 c7081000 00000000 c02478cc c0307f=
78
7f60: 00000000 00000000 c02478cc c001c134 00000000 c5c2007c 00000000 000000=
00
7f80: c028f8f0 c0307fb8 c0307f94 c013f478 c01407cc c028f8f0 00000000 c028f8=
f4
7fa0: 00000000 00000000 00000000 c0307fd8 c0307fbc c0014d70 c013f410 c03060=
00
7fc0: c0019a60 00000000 00000000 c0307ff4 c0307fdc c001d0dc c0014ca4 000000=
00
7fe0: 00000000 00000000 00000000 c0307ff8 c003a180 c001d068 c0307ff8 c0307f=
f8
Backtrace:
[<c01161c8>] (_raw_spin_lock+0x0/0x134) from [<c01f5904>] (_spin_lock+0x10/=
0x14)
[<c01f58f4>] (_spin_lock+0x0/0x14) from [<c01502e4>]
(cfi_intelext_read+0xe4/0x2b8)
[<c0150200>] (cfi_intelext_read+0x0/0x2b8) from [<c0140850>]
(parse_redboot_partitions+0x94/0x3f0)
[<c01407bc>] (parse_redboot_partitions+0x0/0x3f0) from [<c013f478>]
(parse_mtd_partitions+0x78/0xf4)
[<c013f400>] (parse_mtd_partitions+0x0/0xf4) from [<c0014d70>]
(init_physmap+0xdc/0x180)
[<c0014c94>] (init_physmap+0x0/0x180) from [<c001d0dc>] (init+0x84/0x20c)
 r7 =3D 00000000  r6 =3D 00000000  r5 =3D C0019A60  r4 =3D C0306000
[<c001d058>] (init+0x0/0x20c) from [<c003a180>] (do_exit+0x0/0x7e0)
 r6 =3D 00000000  r5 =3D 00000000  r4 =3D 00000000
Code: e92dddf0 e24cb004 e24dd004 e59f3104 (e5902004)
 <0>Kernel panic - not syncing: Attempted to kill init!

------=_Part_5271_7138058.1147360837486
Content-Type: text/x-patch; name=prevent_chip_size_exceeds_config_oops.patch;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_en38wqfj
Content-Disposition: attachment;
	filename="prevent_chip_size_exceeds_config_oops.patch"

[MTD] CHIPS: Do not oops when configured flash size is less then chip size

My kernel oopsed when the on-board flash chips where quadruple the size of the
platform default physmap_map.size. Turned out that max_chips becomes zero,
resulting in an oops later in locking chip->mutex being non-initialized.

Full debug trace available.

Signed-off-by: Leon Woestenberg <leonw@mailcan.com>

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 9b252d2..9b7f82b 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -100,6 +100,11 @@ #endif
 	 * Align bitmap storage size to full byte.
 	 */
 	max_chips = map->size >> cfi.chipshift;
+	if (max_chips == 0) {
+		printk(KERN_WARNING "Single flash chip size exceeds the configured flash area size. Check your kernel configuration.\n");
+		kfree(cfi.cfiq);
+		return NULL;
+	}
 	mapsize = (max_chips / 8) + ((max_chips % 8) ? 1 : 0);
 	chip_map = kmalloc(mapsize, GFP_KERNEL);
 	if (!chip_map) {



------=_Part_5271_7138058.1147360837486--
