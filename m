Received: from news.ti.com ([192.94.94.33] helo=dragon.ti.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwG4l-00031k-Gi
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 07:36:55 +0000
Received: from dlep52.itg.ti.com ([157.170.134.103])
	by dragon.ti.com (8.12.11/8.12.11) with ESMTP id i1Q7anxC024240
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 01:36:50 -0600 (CST)
Received: from popsvr.india.ti.com (localhost [127.0.0.1])
	by dlep52.itg.ti.com (8.12.10/8.12.10) with ESMTP id i1Q7alKs008832
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 01:36:48 -0600 (CST)
Received: from SBAJAN14 (sbajan-14.india.ti.com [192.168.182.115])
	by popsvr.india.ti.com (8.8.8/8.8.8) with SMTP id NAA29352
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 13:06:45 +0530 (IST)
Message-ID: <015601c3fc3b$49a70b20$73b6a8c0@ent.ti.com>
From: "Trilok Soni" <x000soni@india.ti.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 26 Feb 2004 13:06:45 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Unable to mount rootfs on mtdblock3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

We are trying to mount JFFS2 Filesystem on OMAP-H2 with 2.6.3-rc2-omap1
Kernel.

Note: I am able to mount the filesystem on 2.4 Kernel. I  see that mtdblock
has introduced blktrans interface...
          Do you think that I need to change flash driver buswidth from 16
to 32 bit?
          Do you think that I need to minimize "filesystem" partition, which
is right now 28.7 Mb Approx. to 4 Mb, so that driver will not
          have to wait longer for IO?

Steps performed:

1. Created filesytem image using mkfs.jff2 command. (jffs2.filesystem size -
1.8 Mb).
2. Write filesystem image to flash.
    2.1 For this kernel has been mounted using NFS.
    2.2. eraseall /dev/mtd3
[---- output-----------------------------------------]
MTD_open
MTD_ioctl
Erasing 128 Kibyte @ 0 --  0 % complete.MTD_ioctl
Erasing 128 Kibyte @ 20000 --  0 % complete.MTD_ioctl
Erasing 128 Kibyte @ 40000 --  0 % complete.MTD_ioctl
Erasing 128 Kibyte @ 60000 --  1 % complete.MTD_ioctl
Erasing 128 Kibyte @ 80000 --  1 % complete.MTD_ioct
....Continue
Erasing 128 Kibyte @ 1d00000 -- 97 % complete.MTD_ioctl
Erasing 128 Kibyte @ 1d20000 -- 97 % complete.MTD_ioctl
Erasing 128 Kibyte @ 1d40000 -- 98 % complete.MTD_ioctl
Erasing 128 Kibyte @ 1d60000 -- 98 % complete.MTD_ioctl
Erasing 128 Kibyte @ 1d80000 -- 99 % complete.MTD_ioctl
Erasing 128 Kibyte @ 1da0000 -- 99 % complete.MTD_ioctl
Erased 30464 Kibyte @ 0 -- 100% complete.       MTD_close
[---- output-----------------------------------------]

    2.3  cat filesystem.jffs2 > /dev/mtd3
[----output -----------------------------------------]
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
...Continue..
[----output -----------------------------------------]

    2.4  mount -t jffs2 /dev/mtdblock3 /mnt/jffs2
          It successfully mounts the filesystem...
    2.5  umount /mnt/jffs2

3. Now I had tried to boot using root=/dev/mtdblock3 command line argument.
Here is the kernel -boot output.

---------------------------------snip----2.6 ------------------------
Starting kernel ...

Uncompressing
Linux...................................................................
done, booting the kernel.
Linux version 2.6.3-rc2-omap1 (sasken2@lxlab001) (gcc version 3.3.2) #41 Wed
Feb 25 21:07:55 IST 2004
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
Kernel command line: mem=32M console=ttyS0,115200n8 noinitrd
root=/dev/mtdblock3 rw ip=off
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
ok
mtdblock: read on "file system" at 0x400, size 0x200
mtdblock: read on "file system" at 0x600, size 0x200
mtdblock_release
ok
mtdblock_open
ok
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
ok
mtdblock: read on "file system" at 0x0, size 0x200
mtdblock_release
ok
mtdblock_open
ok
ok
mtdblock: read on "file system" at 0x0, size 0x200
mtdblock: read on "file system" at 0x200, size 0x200
mtdblock_release
ok
Kernel panic: VFS: Unable to mount root fs on mtdblock3

---------------------------------snip-----------------------------

Any Suggestions?


Regards,
Trilok Soni
