Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikana.artecdesign.ee)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmVeu-0006bD-0n
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2005 06:18:30 -0500
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=pcx.artec.ee)
	by postikana.artecdesign.ee with esmtp (Exim 3.35 #1 (Debian))
	id 1CmVei-0000kQ-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2005 13:18:16 +0200
Date: Thu, 6 Jan 2005 13:18:17 +0200 (EET)
From: Olav Kongas <ok@artecdesign.ee>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0501061248210.5515-100000@pcx>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: 2.6.10, Intel chip, incorrect numparts detection
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 2.6.10, the detected hw partition number seems to be
insane. All is ok on 2.6.9. I added few printk's to the
cfi_intelext_partition_fixup() in 2.6.10 hoping that this
will provide some more useful info (probably not).  Below I
give the code fragment sprinkled with my printk's and both
unsuccessful 2.6.10 and successful 2.6.9 boot dumps.

Olav

PS Please use CC, I am not subscribed to the list.




------Code fragment from cfi_intelext_partition_fixup(), with my prink's added-------

        printk("%s %d: enter\n",__FUNCTION__,__LINE__);    /* __LINE__ == 455 */
		/* Protection Register info */
		offs = (extp->NumProtectionFields - 1) * (4 + 6);

        printk("%s %d: offs %d\n",__FUNCTION__,__LINE__,offs);
		/* Burst Read info */
		offs += 6;

		/* Number of partition regions */
		numregions = extp->extra[offs];
		offs += 1;
        printk("%s %d: offs %d, numregions %d\n",__FUNCTION__,__LINE__,offs, numregions);

		/* Number of hardware partitions */
		numparts = 0;
		for (i = 0; i < numregions; i++) {
			struct cfi_intelext_regioninfo *rinfo;
			rinfo = (struct cfi_intelext_regioninfo *)&extp->extra[offs];
			numparts += rinfo->NumIdentPartitions;
			offs += sizeof(*rinfo)
				+ (rinfo->NumBlockTypes - 1) *
				  sizeof(struct cfi_intelext_blockinfo);
        printk("%s %d: offs %d, numregions %d, numparts %d\n",__FUNCTION__,__LINE__,offs, numregions, numparts);
		}

		/*
		 * All functions below currently rely on all chips having
		 * the same geometry so we'll just assume that all hardware
		 * partitions are of the same size too.
		 */
		partshift = cfi->chipshift - __ffs(numparts);
        printk("%s %d: cfi->chipshift %ld, __ffs(numparts) %ld, partshift %d\n",
               __FUNCTION__,__LINE__,cfi->chipshift, __ffs(numparts), partshift);

		if ((1 << partshift) < mtd->erasesize) {
			printk( KERN_ERR
				"%s: bad number of hw partitions (%d)\n",
				__FUNCTION__, numparts);
			return -EINVAL;
		}

------------------Dump of failure on 2.6.10------------

Linux version 2.6.10 (ok@pcx) (gcc version 3.3.2) #7 Thu Jan 6 12:47:28 EET 2005
CPU: ARM922Tid(wb) [41029220] revision 0 (ARMv4T)
CPU: D VIVT write-back cache
CPU: I cache: 8192 bytes, associativity 64, 32 byte lines, 4 sets
CPU: D cache: 8192 bytes, associativity 64, 32 byte lines, 4 sets
Machine: Logic Product Development LPD7A400-10
Memory policy: ECC disabled, Data cache writeback
Built 7 zonelists
Kernel command line: console=ttyAM1 mtdparts=phys_mapped_flash:4m@2m(root)ro,2m@
6m(usrlocal)ro,384k@1664k(conf),64k@1344k(font)ro root=/dev/mtdblock0
PID hash table entries: 64 (order: 6, 1024 bytes)
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory: 4MB 4MB 4MB 3MB = 15MB total
Memory: 13628KB available (1093K code, 269K data, 60K init)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Linux NoNET1.0 for Linux 2.6
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
NetWinder Floating Point Emulator V0.97 (double precision)
Real Time Clock Driver v1.12
serial: LH7A40X serial driver
ttyAM0 at MMIO 0x80000600 (irq = 12) is a LH7A40X
ttyAM1 at MMIO 0x80000700 (irq = 13) is a LH7A40X
ttyAM2 at MMIO 0x80000800 (irq = 16) is a LH7A40X
io scheduler noop registered
io scheduler cfq registered
loop: loaded (max 8 devices)
elevator: using cfq as default io scheduler
physmap flash device: 800000 at 0
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0039
 Intel/Sharp Extended Query Table at 0x0039
 Intel/Sharp Extended Query Table at 0x0039
 Intel/Sharp Extended Query Table at 0x0039
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cfi_intelext_partition_fixup 455: enter
cfi_intelext_partition_fixup 459: offs 0
cfi_intelext_partition_fixup 466: offs 7, numregions 1
cfi_intelext_partition_fixup 477: offs 69, numregions 1, numparts 4352
cfi_intelext_partition_fixup 487: cfi->chipshift 23, __ffs(numparts) 8, partshif
t 15
cfi_intelext_partition_fixup: bad number of hw partitions (4352)
gen_probe: No supported Vendor Command Set found
Initializing USB Mass Storage driver...
usbcore: registered new driver usb-storage
USB Mass Storage support registered.
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
VFS: Cannot open root device "mtdblock0" or unknown-block(0,0)
Please append a correct "root=" boot option
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)


--------Dump of successful boot on 2.6.9-------------

Linux version 2.6.9 (ok@pcx) (gcc version 3.3.2) #29 Mon Jan 3 17:07:49 EET 2005
CPU: ARM922Tid(wb) [41029220] revision 0 (ARMv4T)
CPU: D VIVT write-back cache
CPU: I cache: 8192 bytes, associativity 64, 32 byte lines, 4 sets
CPU: D cache: 8192 bytes, associativity 64, 32 byte lines, 4 sets
Machine: Logic Product Development LPD7A400-10
Memory policy: ECC disabled, Data cache writeback
Built 7 zonelists
Kernel command line: console=ttyAM1 mtdparts=phys_mapped_flash:4m@2m(root)ro,2m@
6m(usrlocal)ro,384k@1664k(conf),64k@1344k(font)ro root=/dev/mtdblock0
PID hash table entries: 64 (order: 6, 1024 bytes)
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory: 4MB 4MB 4MB 3MB = 15MB total
Memory: 13552KB available (1128K code, 319K data, 56K init)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Linux NoNET1.0 for Linux 2.6
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
NetWinder Floating Point Emulator V0.97 (double precision)
Real Time Clock Driver v1.12
serial: LH7A40X serial driver
ttyAM0 at MMIO 0x80000600 (irq = 12) is a LH7A40X
ttyAM1 at MMIO 0x80000700 (irq = 13) is a LH7A40X
ttyAM2 at MMIO 0x80000800 (irq = 16) is a LH7A40X
loop: loaded (max 8 devices)
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
Using cfq io scheduler
physmap flash device: 800000 at 0
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0039
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
4 cmdlinepart partitions found on MTD device phys_mapped_flash
Creating 4 MTD partitions on "phys_mapped_flash":
0x00200000-0x00600000 : "root"
0x00600000-0x00800000 : "usrlocal"
0x001a0000-0x00200000 : "conf"
0x00150000-0x00160000 : "font"
Initializing USB Mass Storage driver...
usbcore: registered new driver usb-storage
USB Mass Storage support registered.
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
VFS: Mounted root (cramfs filesystem) readonly.
Freeing init memory: 56K
init started:  BusyBox v1.00-pre2 (2004.02.13-19:56+0000) multi-call binary

board (Tue Aug 3 19:53:25 EEST 2004)

board login:
