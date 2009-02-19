Received: from yx-out-1718.google.com ([74.125.44.155])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LaAMH-0003VK-8R
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2009 14:58:39 +0000
Received: by yx-out-1718.google.com with SMTP id 3so148004yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Feb 2009 06:58:36 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 19 Feb 2009 09:58:35 -0500
Message-ID: <25dd9bf10902190658p4e0adea3s8f8bba6f5cfd01d6@mail.gmail.com>
Subject: UBI attach and mounting problem after rebooting
From: Subramani Venkatesh <subbu31mani@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am currently using UBIFS on NAND which has 128KiB Erase black, 2048
Pages, 512 Sub-Page. Linux Kernel-2.6.27.
I followed instructions from mtd-infradead to create UBIFS image...
I am facing attaching and mounting issues on UBIFS images  which is
"Dynamic" and "auto resize". Though I am successful in mounting for
the first time (after ubiformat), but I am failing after rebooting.
Please find below log for more details.

First time after flashing Successfull in attaching and mouting filesystem
---------------------------------------------------------------------------

UBI: attaching mtd4 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: volume 0 ("rootfs") re-sized from 732 to 787 LEBs
UBI: attached mtd4 to ubi0
UBI: MTD device name:            "System-NAND"
UBI: MTD device size:            100 MiB
UBI: number of good PEBs:        798
UBI: number of bad PEBs:         2
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 798
UBI: number of PEBs reserved for bad PEB handling: 7
UBI: max/mean erase counter: 0/0
UBI: background thread "ubi_bgt0d" started, PID 351

UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: file system size: 84510720 bytes (82530 KiB, 80 MiB, 655 LEBs)
UBIFS: journal size: 9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: default compressor: LZO
UBIFS: media format 4, latest format 4
VFS: Mounted root (ubifs filesystem).
Freeing init memory: 152K
UBIFS: background thread "ubifs_bgt0_0" started, PID 402


BusyBox v1.6.1 (2008-07-17 12:54:29 CDT) Built-in shell (ash)
Enter 'help' for a list of built-in commands.

/bin/sh: can't access tty; job control turned off
# hotplug used greatest stack depth: 5828 bytes left
hotplug used greatest stack depth: 5720 bytes left

#
#
#


After rebooting, ubiattachment fails...
--------------------------------------------------------------------
0x06940000-0x20000000 : "File System-NAND"
UBI: attaching mtd4 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB
798:0, read 64 bytes
UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB
799:0, read 64 bytes
UBI error: ubi_read_volume_table: the layout volume was not found
UBI error: ubi_init: cannot attach mtd4
UBI error: ubi_init: UBI error: cannot initialize UBI, error -22
input: omap_twl4030keypad as /class/input/input0
twl4030_rtc twl4030_rtc: rtc core: registered twl4030_rtc as rtc0
Driver for 1-wire Dallas network protocol.
omap_hdq omap_hdq.0: OMAP HDQ Hardware Rev 0.5. Driver in Interrupt mode

 Can someone suggest me what might be going wrong...


Thanks,
Subbu
