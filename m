Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxOLn-0005ql-L2
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 08:16:25 -0400
Message-ID: <42E6295C.5070705@yandex.ru>
Date: Tue, 26 Jul 2005 16:15:24 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Abu M. Muttalib" <abum@aftek.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: Kernel Oops: not able to handle jffs2 file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Abu,

pardon, no need to write privately, please. Other people may have the 
same problem and may benefit from your conversation. This is one of the 
purposes of the mailing list.

You wrote rather long time ago, so I forgot the details. The debugging 
messages do not help me to recognize the problem.

Messages like

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034070:
0xdffb instead

mean there is some trash in your flash. So at first make sure your flash 
driver is correct. Make sure you flash the right JFFS2 image and made it 
correctly. Try to mount empty JFFS2 FS and check if it works well. Copy 
files there, remount it, check if it is OK, etc. Play with your flash :-)

The fact that you see OOPS instead of just a rejection to mount wrong FS 
means that there is a bug. Could you please detect the exact place where 
JFFS2 OOPSes (by printk()s for example, or with help of a debugger).
We will fix it?

What's your flash, kernel, MTD? Did you try the latest MTD from CVS ?


-------- Original Message --------
Subject: RE: Kernel Oops: not able to handle jffs2 file system
Date: Tue, 19 Jul 2005 18:02:31 +0530
From: Abu M. Muttalib <abum@aftek.com>
To: Artem B. Bityuckiy <dedekind@yandex.ru>

HI,

I have already enabled the JFFS2 debugging. I am sending across the complete
log once again.

Eagerly waiting for your reply.

Regards,
Abu.

****************************************************************************
****************

HAL Platform machine type is: 190
Uncompressing Linux............................................. done,
booting the kernel.
Linux version 2.6.12.2 (root@mohan) (gcc version 3.4.1) #47 Tue Jul 19
12:45:42 IST 2005
CPU: XScale-PXA250 [69052903] revision 3 (ARMv5TE)
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Machine: Triton PXA250 (Starterkit)
Memory policy: ECC disabled, Data cache writeback
Memory clock: 99.53MHz (*27)
Run Mode clock: 199.07MHz (*2)
Turbo Mode clock: 398.13MHz (*2.0, inactive)
Built 1 zonelists
Kernel command line:  root=31:00 rootfstype=jffs2 ro console=ttyS0,38400
in
early_paramRavi:rcu_initRavi:rcu_init_percpu_dataRavi:rcu_init_percpu_dataRa
vi:tasklet_initPID hash table entries: 256 (order: 8, 4096 bytes)
Ravi:init_timersRavi:softirq_initConsole: colour dummy device 80x30
Ravi:console_initDentry cache hash table entries: 8192 (order: 3, 32768
bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
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
jffs2_scan_eraseblock(): Scanning block at 0x80000
Ravi: buf_size = 0Ravi: if()
CLEANMARKER node found at 0x00020000, not first node in block (0x00000000)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034054:
0xe6f9 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034058:
0xfd9b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003405c:
0xfebd instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034060:
0x9f6f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034064:
0xffb1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034068:
0x3f3f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003406c:
0xe4f3 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034070:
0xdffb instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034074:
0xe9fe instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034078:
0xcfef instead
Further such events for this erase block will not be printed
jffs2_scan_eraseblock(): Scanning block at 0x80000
Ravi: buf_size = 0Ravi: if()
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040000:
0x2f6f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004:
0xedeb instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008:
0xefdf instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004000c:
0xd1f9 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040010:
0x7f57 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040014:
0xfedb instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040018:
0xaeff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004001c:
0xf7fb instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040020:
0xdfbf instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040024:
0xf1f5 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00040000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Scanning block at 0x80000
Ravi: buf_size = 0Ravi: if()
Unable to handle kernel paging request at virtual address c2980000
pgd = c0104000
[c2980000] *pgd=a00f3011, *pte=00000000, *ppte=00000000
Internal error: Oops: 7 [#1]
Modules linked in:
CPU: 0
PC is at jffs2_scan_medium+0x1e0/0x21f0
LR is at 0xc2980000
pc : [<c01a6c7c>]    lr : [<c2980000>]    Not tainted
sp : c00e1c54  ip : 60000093  fp : c00e1cdc
r10: 00000000  r9 : c297fff4  r8 : 00000000
r7 : 00000000  r6 : 00000000  r5 : 00000004  r4 : 00040000
r3 : c022c154  r2 : 00000000  r1 : c0257144  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 397F  Table: A0104000  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xc00e0194)
Stack: (0xc00e1c54 to 0xc00e2000)
1c40:                                              00000000 00000000
c025712f
1c60: 00000000 00000000 00000000 00040000 00080000 0007ffff 0007fff8
c2980000
1c80: c00ec060 00000000 00000000 00000000 00000002 c02f8000 c2900000
01f80000
1ca0: c012e002 c025e002 e0021985 00000048 c0256d6d c02f8094 c02f809c
c00e1cfc
1cc0: c02f80c4 c02f80bc c02f8000 c02f80ac c00e1d28 c00e1ce0 c01aba88
c01a6aa8
1ce0: c0217ef0 c02f80f8 c02f80dc c02f80d4 c02f80b4 c02f80a4 00000000
c01bb04c
1d00: c02f8200 c02f8000 00040000 c0003e00 00000000 00000000 c0230564
c00e1d4c
1d20: c00e1d2c c01ae254 c01ab83c c0003e00 c02f8000 c02f8200 00008001
00000000
1d40: c00e1d70 c00e1d50 c01ae930 c01ae13c ffffffea 00000000 c0002000
c00e1d7c
1d60: 00008001 c00e1de4 c00e1d74 c01aebbc c01ae884 c02f8200 0000002f
c02f2554
1d80: c00f8600 c012d0c0 c012cc4c c017f928 00000001 00000001 00000000
c0000000
1da0: c02bcb80 c02bcb80 c00f8300 c0002000 fffffff4 c0230564 00000000
c0000000
1dc0: c00f8300 c0002000 fffffff4 c0230564 00000000 00008001 c00e1e10
c00e1de8
1de0: c016f688 c01aea0c 00008001 c0001000 c0002000 00000000 c0000000
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
1ee0: 60000013 00000000 00000001 00000001 00000000 00008001 c02095a0
c0252e98
1f00: c00e1f1c c00e1f10 c014eb48 c014e784 c00e1f3c 00000000 00000000
c0001000
1f20: 00008001 00008001 c02095a0 c0252e98 c00e1f6c c00e1f40 c0185500
c0184b30
1f40: 00000000 00000000 c0002000 c0000000 c0114500 c02bd000 c02bd006
c02bd000
1f60: c00e1fbc c00e1f70 c0108bb4 c0185474 00000000 c00f8600 00000000
0000001f
1f80: 01f00000 c02095a0 00000000 00000000 00000000 c0114500 c01144b0
00000000
1fa0: 00000000 00000000 00000000 00000000 c00e1fd8 c00e1fc0 c0108e20
c0108a80
1fc0: 00000000 c0209350 c0113f4c c00e1ff4 c00e1fdc c0115154 c0108da8
00000000
1fe0: 00000000 00000000 00000000 c00e1ff8 c012e6a0 c0115060 1a00000f
e590305c
Backtrace:
[<c01a6a9c>] (jffs2_scan_medium+0x0/0x21f0) from [<c01aba88>]
(jffs2_do_mount_fs+0x258/0x8d8)
[<c01ab830>] (jffs2_do_mount_fs+0x0/0x8d8) from [<c01ae254>]
(jffs2_do_fill_super+0x124/0x258)
[<c01ae130>] (jffs2_do_fill_super+0x0/0x258) from [<c01ae930>]
(jffs2_get_sb_mtd+0xb8/0x11c)
  r8 = 00000000  r7 = 00008001  r6 = C02F8200  r5 = C02F8000
  r4 = C0003E00
[<c01ae878>] (jffs2_get_sb_mtd+0x0/0x11c) from [<c01aebbc>]
(jffs2_get_sb+0x1bc/0x20c)
  r8 = 00008001  r7 = C00E1D7C  r6 = C0002000  r5 = 00000000
  r4 = FFFFFFEA
[<c01aea00>] (jffs2_get_sb+0x0/0x20c) from [<c016f688>]
(do_kern_mount+0x70/0x11c)
[<c016f618>] (do_kern_mount+0x0/0x11c) from [<c01850b8>]
(do_mount+0x594/0x5e8)
[<c0184b24>] (do_mount+0x0/0x5e8) from [<c0185500>] (sys_mount+0x98/0xe0)
[<c0185468>] (sys_mount+0x0/0xe0) from [<c0108bb4>]
(mount_block_root+0x140/0x2bc)
  r7 = C02BD000  r6 = C02BD006  r5 = C02BD000  r4 = C0114500
[<c0108a74>] (mount_block_root+0x0/0x2bc) from [<c0108e20>]
(prepare_namespace+0x84/0xcc)
[<c0108d9c>] (prepare_namespace+0x0/0xcc) from [<c0115154>]
(init+0x100/0x1a0)
  r5 = C0113F4C  r4 = C0209350
[<c0115054>] (init+0x0/0x1a0) from [<c012e6a0>] (do_exit+0x0/0xa5c)
  r6 = 00000000  r5 = 00000000  r4 = 00000000
Code: e3500000 1a00062d e51be060 e3a00000 (e59e3000)
  <0>Kernel panic - not syncing: Attempted to kill init!

****************************************************************************
****************
-----Original Message-----
From: Artem B. Bityuckiy [mailto:dedekind@yandex.ru]
Sent: Tuesday, July 19, 2005 4:35 PM
To: Abu M. Muttalib
Cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel Oops: not able to handle jffs2 file system


Abu M. Muttalib wrote:
> Hi,
>
> While booting the 2.6.12.2 kernel, I am getting the following oops
message.
> I have given the option to support jffs2 file system.
Could you please enable JFFS2 debugging and post its output?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.



-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
