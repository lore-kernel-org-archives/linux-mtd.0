Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QXDJ5-0000C8-60
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2011 14:12:28 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QXDIy-0007n3-L7
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2011 16:12:20 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2011 16:12:20 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2011 16:12:20 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [NAND] Are partitions persistent?
Date: Thu, 16 Jun 2011 16:12:00 +0200
Message-ID: <se3kv6dpdvslsqbrmfime09062h4rj3767@4ax.com>
References: <khpjv6l6bhe815s0rj9frue0l5qqpb8hfq@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 16 Jun 2011 13:23:52 +0200, Gilles <gilles.ganault@free.fr>
wrote:
>	I was wondering: Are partitions on NAND persistent, or is it up to
>the developer to make sure the images used to populate the different
>partitions are small enough to fit the partitions set in the NAND
>driver?

To investigate, I went ahead, built a kernel + initramfs + ext2, used
nand to erase/write this new kernel in the first partition in the
NAND, and booted... but Linux isn't happy :-/

"No filesystem could mount root, tried:  ubifs
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)"

Here's what I did
========================
appliance>tftp 0x1000000 uImage
Filename 'uImage'.
Load address: 0x1000000
Loading:
#################################################################
 #################################################################
done
Bytes transferred = 3656651 (37cbcb hex)
========================
appliance>nand erase clean 0x0 0x800000

NAND erase: device 0 offset 0x0, size 0x800000
Erasing at 0x7e0000 -- 100% complete. Cleanmarker written at 0x7e0000.
OK
========================
appliance>nand erase 0x0 0x8000000

NAND erase: device 0 offset 0x0, size 0x8000000
Erasing at 0x7fe0000 -- 100% complete.
OK
========================
appliance>nand write 0x1000000 0x0 0x37cbcb

NAND write: device 0 offset 0, size 3656651 ... nand_write_ecc:
Attempt to write not page aligned data
 0 bytes written: ERROR
========================
appliance>nand write 0x1000000 0x0 0x400000

NAND write: device 0 offset 0, size 4194304 ...  4194304 bytes
written: OK
========================
appliance>reset
========================
appliance>set bootargs  rootfstype=ubifs ubi.mtd=2 root=ubi0:rootfs rw
appliance>set autostart yes
========================
appliance>run nandboot

Loading from device 0: NAND 256MiB 3,3V 8-bit (offset 0x0)
   Image Name:   Linux Kernel and ext2
   Image Type:   Blackfin Linux Kernel Image (gzip compressed)
   Data Size:    3656587 Bytes =  3.5 MB
   Load Address: 00001000
   Entry Point:  001f43ec
Automatic boot of image at addr 0x02000000 ...
## Booting image at 02000000 ...
   Image Name:   Linux Kernel and ext2
   Image Type:   Blackfin Linux Kernel Image (gzip compressed)
   Data Size:    3656587 Bytes =  3.5 MB
   Load Address: 00001000
   Entry Point:  001f43ec
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
Starting Kernel at = 1f43ec
console [ttyBF0] enabled, bootconsole disabled
Calibrating delay loop... 796.67 BogoMIPS (lpj=1593344)
Security Framework initialized
Mount-cache hash table entries: 512
Blackfin Scratchpad data SRAM: 4 KB
Blackfin L1 Instruction SRAM: 32 KB (20 KB free)
NET: Registered protocol family 16
Blackfin DMA Controller
ip0x_init(): registering device resources
gpio_request OK
CLE is 2 and ALE is 1
bio: create slab <bio-0> at 0
Switching to clocksource bfin_cs_cycles
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
msgmni has been set to 104
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler cfq registered (default)
bfin_sport: registered sport0
bfin_sport: registered sport1
bfin-uart: Blackfin serial driver
bfin-uart.0: ttyBF0 at MMIO 0xffc00400 (irq = 21) is a BFIN-UART
brd: module loaded
uclinux[mtd]: RAM probe address=0x3700000 size=0x800000
Creating 1 MTD partitions on "RAM":
0x000000000000-0x000000800000 : "ROMfs"
mtd: Giving out device 0 to ROMfs
Generic platform RAM MTD, (c) 2004 Simtec Electronics
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB
3,3V 8-bit)
Scanning device for bad blocks
INFO: RCU detected CPU 0 stall (t=2500 jiffies)
cmdlinepart partition parsing not available
RedBoot partition parsing not available
Creating 2 MTD partitions on "My_great_flash_memory":
0x000000000000-0x000000800000 : "kernel_nand"
mtd: Giving out device 1 to kernel_nand
0x000000800000-0x000010000000 : "filesystem_nand"
mtd: Giving out device 2 to filesystem_nand
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "filesystem_nand"
UBI: MTD device size:            248 MiB
UBI: number of good PEBs:        1984
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1984
UBI: number of PEBs reserved for bad PEB handling: 19
UBI: max/mean erase counter: 18/14
UBI: image sequence number: 0
mtd: Giving out device 3 to rootfs
dm9000 Ethernet Driver, V1.31
UBI: background thread "ubi_bgt0d" started, PID 23
eth0: dm9000a at 20100000,20100002 IRQ 48 MAC: 00:09:45:56:72:9b
(chip)
ip_tables: (C) 2000-2006 Netfilter Core Team
TCP cubic registered
NET: Registered protocol family 17
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
dma_alloc_init: dma_page @ 0x02133000 - 256 pages at 0x03f00000
UBIFS error (pid 1): ubifs_recover_master_node: failed to recover
master node
List of all partitions:
1f00            8192 mtdblock0 (driver?)
1f01            8192 mtdblock1 (driver?)
1f02          253952 mtdblock2 (driver?)
1f03          247086 mtdblock3 (driver?)
No filesystem could mount root, tried:  ubifs
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)
Hardware Trace:
========================

So it looks like Linux successfully attached to the Ubifs partition,
but for some reason, can't mount as root filesystem?

Thanks for any hint.
