Received: from [67.15.60.3] (helo=mail.aftek.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dupjh-0005W8-1W
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 06:54:24 -0400
From: "Abu M. Muttalib" <abum@aftek.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 19 Jul 2005 16:19:12 +0530
Message-ID: <KAEKICGAIEMACLOJNFKGKEJNCAAA.abum@aftek.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Kernel Oops: not able to handle jffs2 file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

While booting the 2.6.12.2 kernel, I am getting the following oops message.
I have given the option to support jffs2 file system.

Any idea why I am getting the said oops and how I can get around them.

Regards,
Abu.

****************************************************************************
Memory: 32MB = 32MB total
Memory: 30972KB available (1099K code, 232K data, 52K init)
Mount-cache hash table entries: 512
do_kern_mount: fstype = sysfs name = sysfs
do_kern_mount: fstype = rootfs name = rootfs
do_kern_mount: fstype = bdev name = bdev
do_kern_mount: fstype = proc name = proc
CPU: Testing write buffer coherency: ok
Linux NoNET1.0 for Linux 2.6
do_kern_mount: fstype = pipefs name = pipefs
NetWinder Floating Point Emulator V0.97 (double precision)
do_kern_mount: fstype = futexfs name = futexfs
do_kern_mount: fstype = tmpfs name = tmpfs
do_kern_mount: fstype = eventpollfs name = eventpollfs
do_kern_mount: fstype = devpts name = devpts
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
ttyS0 at MMIO 0x40100000 (irq = 15) is a FFUART
ttyS1 at MMIO 0x40200000 (irq = 14) is a BTUART
ttyS2 at MMIO 0x40700000 (irq = 13) is a STUART
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
Initializing mtdblock readonly device
physmap flash device: 100000 at 80000
phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
RedBoot partition parsing not available
Using physmap partition definition
Creating 1 MTD partitions on "phys_mapped_flash":
0x00080000-0x02000000 : "jffs2"
mtd: Giving out device 0 to jffs2
In mtdblock_add_mtd
mice: PS/2 mouse device common for all mice
do_mount: dev_name = sysfs dir_name = /sys type_page = sysfs
do_new_mount: type = sysfs name = sysfs
do_kern_mount: fstype = sysfs name = sysfs
do_new_mount: After do_kern_mount b4 do_add_mount
do_add_mount: Out...err = 0
*******
VFS: test name = </dev/root>
VFS: fs_name = <jffs2>
VFS: root name <1F00000>
*******
do_mount: dev_name = /dev/root dir_name = /root type_page = jffs2
do_new_mount: type = jffs2 name = /dev/root
do_kern_mount: fstype = jffs2 name = /dev/root
CLEANMARKER node found at 0x00020000, not first node in block (0x00000000)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00038080:
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003e754:
0xffff instead
Unable to handle kernel paging request at virtual address c2980000
pgd = c0104000
[c2980000] *pgd=a00f3011, *pte=00000000, *ppte=00000000
Internal error: Oops: 7 [#1]
Modules linked in:
CPU: 0
PC is at jffs2_scan_medium+0x1d4/0x21d0
LR is at __init_begin+0x3fef8000/0x2c
pc : [<c01a6c70>]    lr : [<00000000>]    Not tainted
sp : c00e1c54  ip : c2980000  fp : c00e1cdc
r10: 00000000  r9 : c293f800  r8 : 00000000
r7 : 00000000  r6 : 00000000  r5 : 00000000  r4 : c00ec060
r3 : 00040000  r2 : 000003ff  r1 : 0007ffff  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 397F  Table: A0104000  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xc00e0194)
Stack: (0xc00e1c54 to 0xc00e2000)
1c40:                                              00032210 00001e34
c025712f
1c60: 00000000 00000000 00000008 00040000 00080000 0007ffff 00080000
c2980000
1c80: c00ec060 00000000 00000000 00000001 00000002 c02f8000 c2900000
01f80000
1ca0: c012e002 c025e002 e0021985 00000048 c0256d6d c02f8094 c02f809c
c00e1cfc
1cc0: c02f80c4 c02f80bc c02f8000 c02f80ac c00e1d28 c00e1ce0 c01aba68
c01a6aa8
1ce0: c0217e58 c02f80f8 c02f80dc c02f80d4 c02f80b4 c02f80a4 00000000
c01bb02c
1d00: c02f8200 c02f8000 00040000 c0003e00 00000000 00000000 c0230564
c00e1d4c
1d20: c00e1d2c c01ae234 c01ab81c c0003e00 c02f8000 c02f8200 00008001
00000000
1d40: c00e1d70 c00e1d50 c01ae910 c01ae11c ffffffea 00000000 c0002000
c00e1d7c
1d60: 00008001 c00e1de4 c00e1d74 c01aeb9c c01ae864 c02f8200 0000002f
c02f2554
1d80: c00f8600 c012d0c0 c012cc4c c017f928 00000001 00000001 00000000
c0000000
1da0: c02bcb80 c02bcb80 c00f8300 c0002000 fffffff4 c0230564 00000000
c0000000
1dc0: c00f8300 c0002000 fffffff4 c0230564 00000000 00008001 c00e1e10
c00e1de8
1de0: c016f688 c01ae9ec 00008001 c0001000 c0002000 00000000 c0000000
c00e1ed4
1e00: 00000000 c00e1f3c c00e1e14 c01850b8 c016f624 c00e0000 c00e1e48
c00e1e28
1e20: c0131420 c01317d4 c02536ac f2d00000 04000000 c022c17c c00e1e7c
c00e1e78
1e40: c00e1e4c c0116c98 c01313d0 c00e1e94 c00e1e5c c014e630 c014df84
04000000
1e60: 60000013 000000d0 00000000 c022d6cc 00000001 000000d0 c022d9f0
00000000
1e80: 00000000 c00e1ecc c00e1e94 c014e630 c014df84 c014e43c 60000013
000000d0
1ea0: 00000000 c022d6cc 00000001 000000d0 c022d9f0 00000000 00000000
c00f2d60
1ec0: c00e1f0c c00e1ed0 c014e850 c014e43c 00000000 c00f5554 c00f8600
00000010
1ee0: 60000013 00000000 00000001 00000001 00000000 00008001 c0209580
c0252e98
1f00: c00e1f1c c00e1f10 c014eb48 c014e784 c00e1f3c 00000000 00000000
c0001000
1f20: 00008001 00008001 c0209580 c0252e98 c00e1f6c c00e1f40 c0185500
c0184b30
1f40: 00000000 00000000 c0002000 c0000000 c0114500 c02bd000 c02bd006
c02bd000
1f60: c00e1fbc c00e1f70 c0108bb4 c0185474 00000000 c00f8600 00000000
0000001f
1f80: 01f00000 c0209580 00000000 00000000 00000000 c0114500 c01144b0
00000000
1fa0: 00000000 00000000 00000000 00000000 c00e1fd8 c00e1fc0 c0108e20
c0108a80
1fc0: 00000000 c0209330 c0113f4c c00e1ff4 c00e1fdc c0115154 c0108da8
00000000
1fe0: 00000000 00000000 00000000 c00e1ff8 c012e6a0 c0115060 ffffffff
ffffffff
Backtrace:
[<c01a6a9c>] (jffs2_scan_medium+0x0/0x21d0) from [<c01aba68>]
(jffs2_do_mount_fs+0x258/0x8d8)
[<c01ab810>] (jffs2_do_mount_fs+0x0/0x8d8) from [<c01ae234>]
(jffs2_do_fill_super+0x124/0x258)
[<c01ae110>] (jffs2_do_fill_super+0x0/0x258) from [<c01ae910>]
(jffs2_get_sb_mtd+0xb8/0x11c)
 r8 = 00000000  r7 = 00008001  r6 = C02F8200  r5 = C02F8000
 r4 = C0003E00
[<c01ae858>] (jffs2_get_sb_mtd+0x0/0x11c) from [<c01aeb9c>]
(jffs2_get_sb+0x1bc/0x20c)
 r8 = 00008001  r7 = C00E1D7C  r6 = C0002000  r5 = 00000000
 r4 = FFFFFFEA
[<c01ae9e0>] (jffs2_get_sb+0x0/0x20c) from [<c016f688>]
(do_kern_mount+0x70/0x11c)
[<c016f618>] (do_kern_mount+0x0/0x11c) from [<c01850b8>]
(do_mount+0x594/0x5e8)
[<c0184b24>] (do_mount+0x0/0x5e8) from [<c0185500>] (sys_mount+0x98/0xe0)
[<c0185468>] (sys_mount+0x0/0xe0) from [<c0108bb4>]
(mount_block_root+0x140/0x2bc)
 r7 = C02BD000  r6 = C02BD006  r5 = C02BD000  r4 = C0114500
[<c010

****************************************************************************
