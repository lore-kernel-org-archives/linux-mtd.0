Received: from news.ti.com ([192.94.94.33] helo=dragon.ti.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AvbAL-0002H6-8f
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 11:55:57 +0000
Received: from dlep51.itg.ti.com ([157.170.141.75])
	by dragon.ti.com (8.12.11/8.12.11) with ESMTP id i1OBshBW005316
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Feb 2004 05:54:43 -0600 (CST)
Received: from popsvr.india.ti.com (localhost [127.0.0.1])
	by dlep51.itg.ti.com (8.12.10/8.12.10) with ESMTP id i1OBsfJk002727
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Feb 2004 05:54:42 -0600 (CST)
Received: from SBAJAN14 (sbajan-14.india.ti.com [192.168.182.115])
	by popsvr.india.ti.com (8.8.8/8.8.8) with SMTP id RAA08442
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Feb 2004 17:24:39 +0530 (IST)
Message-ID: <017d01c3facc$fc1e6a70$73b6a8c0@ent.ti.com>
From: "Trilok Soni" <x000soni@india.ti.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 24 Feb 2004 17:24:39 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: jffs + mtd + 2.6.3-rc2-omap1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am working on 2.6.3-rc2-omap1 Kernel. I have OMAP-1610 Board. Here is the
problem description:

But, I can successfully mount jffs2 file system using 2.4 kernel. We can see
the difference between the two output, that
do_cached_read(...) supplied hard-coded 512 as len parameter, in new
mtdblock.c code, whereas 2.4 kernel takes it as
4096. I am also looking at how "block" is set in new blktrans layer.


----------------2.6 Kernel output-snip-------------------------------------
Uncompressing
Linux...................................................................
done, booting the kernel.
Linux version 2.6.3-rc2-omap1 (sasken2@lxlab001) (gcc version 3.3.2) #33 Mon
Feb 23 21:47:11 IST 2004
CPU: ARM926EJ-Sid(wb) [41069263] revision 3 (ARMv5TEJ)
CPU: D write back cache
CPU: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
CPU: D cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
Machine: TI-Innovator/OMAP1610
Memory policy: ECC disabled, Data cache writeback
On node 0 totalpages: 8192
  DMA zone: 8192 pages, LIFO batch:2
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Built 1 zonelists
Kernel command line: mem=32M console=ttyS0,115200n8 root=/dev/mtdblock3 rw
ip=off
PID hash table entries: 256 (order 8: 2048 bytes)
Console: colour dummy device 80x30
Memory: 32MB = 32MB total
Memory: 30168KB available (1687K code, 394K data, 88K init)
Calibrating delay loop... 29.90 BogoMIPS
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
drivers/usb/core/usb.c: registered new driver usbfs
drivers/usb/core/usb.c: registered new driver hub
omap1610 FB 2004 by Dirk Behme
OMAP DMA hardware version 1
DMA capabilities: 000c0000:00000000:01ff:003f:007f
OMAP virtual buses initialized
OMAP GPIO hardware version 1.0
OMAP OCPI interconnect driver loaded
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
Console: switching to colour frame buffer device 30x40
pty: 256 Unix98 ptys configured
omap-rtc: RTC power up reset detected.
omap-rtc: Enabling RTC.
Real Time Clock Driver v1.0
Serial: 8250/16550 driver $Revision: 1.90 $ 7 ports, IRQ sharing disabled
ttyS0 at MMIO 0xfffb0000 (irq = 46) is a OMAP UART
ttyS1 at MMIO 0xfffb0800 (irq = 47) is a OMAP UART
ttyS2 at MMIO 0xfffb9800 (irq = 15) is a OMAP UART
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
loop: loaded (max 8 devices)
smc9194.c:v0.15 12/15/00 by Erik Stahlman (erik@vt.edu)
eth0: SMC91C94/91C96 (rev 9) at 0xe8000000 IRQ:96 INTF:TP MEM:6144b ADDR:
00:30:48:10:04:00
PPP generic driver version 2.4.2
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256).
CSLIP: code copyright 1989 Regents of the University of California.
Console: switching to colour frame buffer device 30x40
Registering OMAP device 'omap-lcd1'. Parent at tipb
Using anticipatory io scheduler
OMAP1610 NOR FLASH: MTD Self-Contained Driver ver. 1.0
OMAP1610 NOR FLASH: Intel 28F256L18T found
Creating 4 MTD partitions on "OMAP1610 NOR FLASH":
0x00000000-0x00020000 : "bootloader"
mtd: Giving out device 0 to bootloader
0x00020000-0x00040000 : "params"
mtd: Giving out device 1 to params
0x00040000-0x00240000 : "kernel"
mtd: Giving out device 2 to kernel
0x00240000-0x02000000 : "file system"
mtd: Giving out device 3 to file system
Registering OMAP device 'omap-ohci0'. Parent at ocp
Omap: Setting register W9_USB0_TXEN
      FUNC_MUX_CTRL_B (0xfffe1030) = 0x00000000 -> 0x00000a00
      PULL_DWN_CTRL_2 (0xfffe1048) = 0x00000000 -> 0x00080000
Omap: Setting register AA9_USB0_VP
      FUNC_MUX_CTRL_B (0xfffe1030) = 0x00000a00 -> 0x00000b40
      PULL_DWN_CTRL_2 (0xfffe1048) = 0x00080000 -> 0x000c0000
Omap: Setting register Y5_USB0_RCV
      FUNC_MUX_CTRL_C (0xfffe1034) = 0x09000000 -> 0x09a00000
      PULL_DWN_CTRL_3 (0xfffe104c) = 0x00000000 -> 0x00000002
Omap: Setting register R9_USB0_VM
      FUNC_MUX_CTRL_C (0xfffe1034) = 0x09a00000 -> 0x09b40000
      PULL_DWN_CTRL_3 (0xfffe104c) = 0x00000002 -> 0x00000003
Omap: Setting register V6_USB0_TXD
      FUNC_MUX_CTRL_C (0xfffe1034) = 0x09b40000 -> 0x29b40000
      PULL_DWN_CTRL_3 (0xfffe104c) = 0x00000003 -> 0x0000000b
Omap: Setting register W5_USB0_SE0
      FUNC_MUX_CTRL_C (0xfffe1034) = 0x29b40000 -> 0x2db40000
      PULL_DWN_CTRL_3 (0xfffe104c) = 0x0000000b -> 0x0000000f
drivers/usb/host/ohci-omap.c: ohci_hcd (OMAP) at 0xfffba000, irq 38

omap-ohci omap-ohci0: new USB bus registered, assigned bus number 1
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
drivers/usb/core/usb.c: registered new driver usbtest
mice: PS/2 mouse device common for all mice
OMAP Keypad Driver
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 4096)
NET: Registered protocol family 1
NET: Registered protocol family 17
mtdblock_open
ok
mtdblock: read on "file system" at 0x400, size 0x200
mtdblock: read on "file system" at 0x600, size 0x200
mtdblock_release
ok
mtdblock_open
ok
mtdblock: read on "file system" at 0x0, size 0x200
mtdblock: read on "file system" at 0x200, size 0x200
mtdblock: read on "file system" at 0x400, size 0x200
mtdblock: read on "file system" at 0x600, size 0x200
mtdblock: read on "file system" at 0x800, size 0x200
mtdblock: read on "file system" at 0xa00, size 0x200
mtdblock: read on "file system" at 0xc00, size 0x200
mtdblock: read on "file system" at 0xe00, size 0x200
mtdblock: read on "file system" at 0x1000, size 0x200
mtdblock: read on "file system" at 0x1200, size 0x200
mtdblock: read on "file system" at 0x1400, size 0x200
mtdblock: read on "file system" at 0x1600, size 0x200
mtdblock: read on "file system" at 0x1800, size 0x200
mtdblock: read on "file system" at 0x1a00, size 0x200
mtdblock: read on "file system" at 0x1c00, size 0x200
mtdblock: read on "file system" at 0x1e00, size 0x200
mtdblock: read on "file system" at 0x2000, size 0x200
mtdblock: read on "file system" at 0x2200, size 0x200
mtdblock: read on "file system" at 0x2400, size 0x200
mtdblock: read on "file system" at 0x2600, size 0x200
mtdblock: read on "file system" at 0x2800, size 0x200
mtdblock: read on "file system" at 0x2a00, size 0x200
mtdblock: read on "file system" at 0x2c00, size 0x200
mtdblock: read on "file system" at 0x2e00, size 0x200
mtdblock: read on "file system" at 0x3000, size 0x200
mtdblock: read on "file system" at 0x3200, size 0x200
mtdblock: read on "file system" at 0x3400, size 0x200
mtdblock: read on "file system" at 0x3600, size 0x200
mtdblock: read on "file system" at 0x3800, size 0x200
mtdblock: read on "file system" at 0x3a00, size 0x200
mtdblock: read on "file system" at 0x3c00, size 0x200
mtdblock: read on "file system" at 0x3e00, size 0x200
mtdblock_release
ok
mtdblock_open
ok
mtdblock: read on "file system" at 0x0, size 0x200
mtdblock: read on "file system" at 0x200, size 0x200
mtdblock_release
ok
Kernel panic: VFS: Unable to mount root fs on mtdblock3
--------2.6 kernel output ends---snip-------------------------------------

But on 2.4 Kernel we can successfully mount jffs2 filesystem. Here is the
output 2.4 Kernel:

----------------2.4 Kernel output-snip-------------------------------------
Uncompressing Linux.........................................................
done, booting the kernel.
Linux version 2.4.20_mvlcee30-omap161x_innovator (a0875397@lxlab001) (gcc
version 3.2.1 20020930 (MontaVista)) #27 Mon Feb 23 16:13:39 IST 2004
CPU: ARM ARM926EJ-Sid(wb) revision 3
Machine: TI-Innovator/OMAP1610
On node 0 totalpages: 8192
zone(0): 8192 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: mem=32M console=ttyS0,115200n8 root=/dev/mtdblock3 rw
ip=off
Console: colour dummy device 80x30
Calibrating delay loop... 83.35 BogoMIPS
Memory: 32MB = 32MB total
Memory: 26332KB available (1521K code, 323K data, 92K init)
Dentry cache hash table entries: 4096 (order: 3, 32768 bytes)
Inode cache hash table entries: 2048 (order: 2, 16384 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
Initializing the Linux Driver Model...
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Power Management for the OMAP1610 is initialized pm_idle 0xc002d2cc
OMAP1610 Innovator Dynamic Power Management
Interrupt holdoff times measurement enabled at 6 ticks per usec.
Interrupt holdoff maximums being captured.
Starting kswapd
Disabling the Out Of Memory Killer
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis
Communications AB.
i2c-core.o: i2c core module version 2.6.2 (20011118)
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with no serial options enabled
ttyS00 at 0xfffb0000 (irq = 46) is a OMAP UART
ttyS01 at 0xfffb0800 (irq = 47) is a OMAP UART
omap-rtc: RTC power up reset detected.
omap-rtc: Enabling RTC.
Real Time Clock Driver v1.0
TI Innovator/OMAP1510/1610 keypad driver.
 device name in net_device = lo
 device name in net_device = eth%d
smc9194.c:v0.15 12/15/00 by Erik Stahlman (erik@vt.edu)
eth0: SMC91C94/91C96 (rev 9) at 0xe8000000 IRQ:160 INTF:TP MEM:6144b ADDR:
00:30:48:10:04:00
 device name in net_device = eth%d
 device name in net_device = eth%d
 device name in net_device = eth%d
 device name in net_device = eth%d
 device name in net_device = eth%d
 device name in net_device = eth%d
 device name in net_device = eth%d
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
loop: loaded (max 8 devices)
OMAP1610 I2C INFO: Driver ver. 1.1
OMAP1610 NOR FLASH: MTD Self-Contained Driver ver. 1.0
OMAP1610 NOR FLASH: Intel 28F256L18T found
Creating 4 MTD partitions on "OMAP1610 NOR FLASH":
0x00000000-0x00020000 : "bootloader"
0x00020000-0x00040000 : "params"
0x00040000-0x00240000 : "kernel"
0x00240000-0x02000000 : "file system"
DSPLinux FB (c) 2001 RidgeRun, Inc.
usbdcore: usbdcore 0.1 034 2002-06-12 20:00 (dbg="")
serial_fd 0.1-beta 034 2002-06-12 20:00 (<NULL>)
vendor_id: 0000 product_id: 0000
dbg: <NULL>
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
RAMDISK: Couldn't find valid RAM disk image starting at 0.
mtdblock_open
ok
mtdblock: read on "file system" at 0x0, size 0x1000
mtdblock: read on "file system" at 0x1000, size 0x1000
mtdblock: read on "file system" at 0x2000, size 0x1000
mtdblock: read on "file system" at 0x3000, size 0x1000
at offset 0, no cramfs magic: trying 512...
cramfs: wrong magic
mtdblock_release
ok
mtdblock_open
ok
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 88K
INIT: version 2.74 booting
INIT: Entering runlevel: 1

Linux login:
----------------2.4 Kernel outputs
ends-snip-------------------------------------

Here we can see striking difference between "size" changed from "0x1000" to
"0x200" in mtdblock.c,
and the new "pos" parameter it calculates from "block" which is incrementing
by "0x1000" in 2.4 kernel,
whereas in 2.6 drivers tries 0x200 and 0x400, without success. I am looking
at this fixes in new drivers.


Regards,
Trilok Soni
