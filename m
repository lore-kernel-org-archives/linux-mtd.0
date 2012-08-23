Received: from protonic.xs4all.nl ([213.84.116.84])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4SAW-00070l-UR
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 07:49:36 +0000
Received: from archvile (archvile.prtnl [192.168.1.153])
 by protonic.xs4all.nl (Postfix) with ESMTP id 12F8028068
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2012 09:45:49 +0200 (CEST)
Date: Thu, 23 Aug 2012 09:50:48 +0200
From: David Jander <david.jander@protonic.nl>
To: linux-mtd@lists.infradead.org
Subject: Current mainline (3.6-rc3) UBIFS errors
Message-ID: <20120823095048.6c6ee35a@archvile>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I have tried latest mainline kernel as of today (3.6-rc3) on two different
platforms (ARMv5 i.MX28 and PowerPC MPC5121e) and see similar crashes when
accessing UBIFS volumes (i.e. booting from UBIFS):
Please excuse the lengthy e-mail, I have tried to strip down the error message
hemorrhage to a sensible size, but I don't want to leave out potentially
important information:

On the powerpc platform the errors start like this:

[    0.729014] mpc5121_nfc 40000000.nfc: Configured for 8-bit NAND, page size 2048 with 64 spare
[    0.738097] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit), page size: 2048, OOB siz
[    0.749822] Bad block table found at page 524224, version 
[    0.755957] Bad block table found at page 524160, version 
[    0.762069] nand_read_bbt: bad block at 0x0000076a0000
[    0.767284] nand_read_bbt: bad block at 0x00000a520000
[    0.772361] nand_read_bbt: bad block at 0x00000a920000
[    0.777524] nand_read_bbt: bad block at 0x000013120000
[    0.782741] nand_read_bbt: bad block at 0x000018f80000
[    0.787828] nand_read_bbt: bad block at 0x00001cde0000
[    0.792947] nand_read_bbt: bad block at 0x00001dda0000
[    0.798358] 1 ofpart partitions found on MTD device MPC5121 NAN
[    0.804309] Creating 1 MTD partitions on "MPC5121 NAND"
[    0.809709] 0x000000000000-0x000040000000 : "rootfs
[    0.820303] UBI: attaching mtd9 to ubi0
[    0.824400] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    0.830791] UBI: logical eraseblock size:    129024 bytes
[    0.836166] UBI: smallest flash I/O unit:    2048
[    0.840851] UBI: sub-page size:              512
[    0.845574] UBI: VID header offset:          512 (aligned 
[    0.851351] UBI: data offset:                2048
[    2.937972] UBI: max. sequence number:       4335
[    2.976054] UBI: attached mtd9 to u
[    2.979839] UBI: MTD device name:            "rootfs"
[    2.984870] UBI: MTD device size:            1024 MiB
[    2.990019] UBI: number of good PEBs:        8181
[    2.994681] UBI: number of bad PEBs:         11
[    2.999187] UBI: number of corrupted PEBs:   
[    3.003616] UBI: max. allowed volumes:       128
[    3.008333] UBI: wear-leveling threshold:    4096
[    3.013049] UBI: number of internal volumes: 
[    3.017441] UBI: number of user volumes:     
[    3.021973] UBI: available PEBs:             
[    3.026352] UBI: total number of reserved PEBs: 818
[    3.031307] UBI: number of PEBs reserved for bad PEB handling: 16
[    3.037480] UBI: max/mean erase counter:
[    3.041844] UBI: image sequence number:  143079883
[    3.046589] UBI: background thread "ubi_bgt0d" started, PID 637

...

[    3.697900] UBIFS: recovery needed
[    3.711531] UBIFS: recovery completed
[    3.715164] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[    3.721246] UBIFS: file system size:   1031933952 bytes (1007748 KiB, 984 MiB, 7998 LEBs)
[    3.729371] UBIFS: journal size:       33546240 bytes (32760 KiB, 31 MiB, 260 LEB
[    3.737125] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    3.743288] UBIFS: default compressor: lzo
[    3.747343] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
[    3.755392] VFS: Mounted root (ubifs filesystem) on device 0:10.
[    3.762783] Freeing unused kernel memory: 184k free
[    3.793628] usb 2-1: new high-speed USB device number 2 using fsl-ehc
[    3.929736] hub 2-1:1.0: USB hub found
[    3.935594] hub 2-1:1.0: 4 ports detecte
[    4.019916] usb 1-1.1: new high-speed USB device number 3 using fsl-ehc
[    4.066170] uncorrectable error : 
[    4.069409] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87112, read only 160 bytes
[    4.081519] uncorrectable error : 
[    4.084704] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87112, read only 160 bytes
[    4.096830] uncorrectable error : 
[    4.100024] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87112, read only 160 bytes
[    4.112212] uncorrectable error : 
[    4.115558] UBI error: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87112, read 160 
[    4.126533] Call Trac
[    4.128956] [df6efbb0] [c0007498] show_stack+0x4c/0x138 (unreliable)
[    4.135272] [df6efbf0] [c0244810] ubi_io_read+0x220/0x2c0
[    4.140685] [df6efc40] [c0242b98] ubi_eba_read_leb+0x254/0x334
[    4.146728] [df6efc80] [c0241ef8] ubi_leb_read+0xe4/0x134
[    4.152237] [df6efca0] [c01650ec] ubifs_leb_read+0x2c/0x80
[    4.157702] [df6efcc0] [c0168710] fallible_read_node+0x64/0x1ac
[    4.163828] [df6efd10] [c0169d1c] ubifs_tnc_locate+0x14c/0x1c4
[    4.169694] [df6efd60] [c016177c] ubifs_iget+0x7c/0x7f0
[    4.174900] [df6efd90] [c015ec50] ubifs_lookup+0x16c/0x1f0
[    4.180607] [df6efdc0] [c009409c] lookup_real+0x40/0x60
[    4.185829] [df6efdd0] [c0097f24] do_last.isra.50+0x498/0xa24
[    4.191759] [df6efe30] [c0098550] path_openat+0xa0/0x3fc
[    4.197121] [df6efe90] [c0098b88] do_filp_open+0x30/0x78
[    4.202502] [df6eff10] [c0089bf4] do_sys_open+0x134/0x1c8
[    4.208069] [df6eff40] [c000d670] ret_from_syscall+0x0/0x38
[    4.213702] --- Exception: c01 at 0x20476a8
[    4.213702]     LR = 0x2
[    4.221742] UBIFS error (pid 842): ubifs_leb_read: reading 160 bytes from LEB 3563:85064 failed, error -74
[    4.231772] Call Trac
[    4.234519] [df6efc60] [c0007498] show_stack+0x4c/0x138 (unreliable)
[    4.241122] [df6efca0] [c0165134] ubifs_leb_read+0x74/0x80
[    4.246692] [df6efcc0] [c0168710] fallible_read_node+0x64/0x1ac
[    4.252690] [df6efd10] [c0169d1c] ubifs_tnc_locate+0x14c/0x1c4
[    4.258716] [df6efd60] [c016177c] ubifs_iget+0x7c/0x7f0
[    4.264181] [df6efd90] [c015ec50] ubifs_lookup+0x16c/0x1f0
[    4.270043] [df6efdc0] [c009409c] lookup_real+0x40/0x60
[    4.275370] [df6efdd0] [c0097f24] do_last.isra.50+0x498/0xa24
[    4.281222] [df6efe30] [c0098550] path_openat+0xa0/0x3fc
[    4.286468] [df6efe90] [c0098b88] do_filp_open+0x30/0x78
[    4.291958] [df6eff10] [c0089bf4] do_sys_open+0x134/0x1c8
[    4.297362] [df6eff40] [c000d670] ret_from_syscall+0x0/0x38
[    4.302910] --- Exception: c01 at 0x20476a8
[    4.302910]     LR = 0x2
[    4.310450] UBIFS error (pid 842): try_read_node: cannot read node type 0 from LEB 3563:85064, error -7
[    4.319934] uncorrectable error : 
[    4.323244] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87112, read only 160 bytes
[    4.335222] uncorrectable error : 
[    4.338550] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87112, read only 160 bytes
[    4.350604] uncorrectable error : [    4.353997] usb 1-1.1: reset high-speed USB device number 3 using fsl-e

[    4.360890] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87112, read only 160 bytes
[    4.373046] uncorrectable error : 
[    4.376370] UBI error: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87112, read 160 
[    4.387311] Call Trac
[    4.389734] [df6efb80] [c0007498] show_stack+0x4c/0x138 (unreliable)
[    4.396052] [df6efbc0] [c0244810] ubi_io_read+0x220/0x2c0
[    4.401440] [df6efc10] [c0242b98] ubi_eba_read_leb+0x254/0x334
[    4.407415] [df6efc50] [c0241ef8] ubi_leb_read+0xe4/0x134
[    4.412788] [df6efc70] [c01650ec] ubifs_leb_read+0x2c/0x80
[    4.418267] [df6efc90] [c0166ad8] ubifs_read_node+0x124/0x248
[    4.424137] [df6efcc0] [c0181eac] ubifs_tnc_read_node+0x60/0x134
[    4.430126] [df6efd10] [c0169c90] ubifs_tnc_locate+0xc0/0x1c4
[    4.435925] [df6efd60] [c016177c] ubifs_iget+0x7c/0x7f0
[    4.441134] [df6efd90] [c015ec50] ubifs_lookup+0x16c/0x1f0
[    4.446634] [df6efdc0] [c009409c] lookup_real+0x40/0x60
[    4.451881] [df6efdd0] [c0097f24] do_last.isra.50+0x498/0xa24
[    4.457699] [df6efe30] [c0098550] path_openat+0xa0/0x3fc
[    4.463070] [df6efe90] [c0098b88] do_filp_open+0x30/0x78
[    4.468424] [df6eff10] [c0089bf4] do_sys_open+0x134/0x1c8
[    4.473808] [df6eff40] [c000d670] ret_from_syscall+0x0/0x38
[    4.479378] --- Exception: c01 at 0x20476a8
[    4.479378]     LR = 0x2
[    4.487028] UBIFS error (pid 842): ubifs_check_node: bad magic 0x000000, expected 0x6101831
[    4.495458] UBIFS error (pid 842): ubifs_check_node: bad node at LEB 3563:85064
[    4.503120] Not a node, first 24 bytes:
[    4.506864] 00000000: 00 00 00 00 00 00 00 00 20 fa 07 00 00 00 00 00 00 00 00 00 00 00 00 00                          ........ ....
[    4.519981] Call Trac
[    4.522389] [df6efc30] [c0007498] show_stack+0x4c/0x138 (unreliable)
[    4.528706] [df6efc70] [c01657ac] ubifs_check_node+0x24c/0x264
[    4.534589] [df6efc90] [c0166b30] ubifs_read_node+0x17c/0x248
[    4.540813] [df6efcc0] [c0181eac] ubifs_tnc_read_node+0x60/0x134
[    4.548324] [df6efd10] [c0169c90] ubifs_tnc_locate+0xc0/0x1c4
[    4.556135] [df6efd60] [c016177c] ubifs_iget+0x7c/0x7f0
[    4.562873] [df6efd90] [c015ec50] ubifs_lookup+0x16c/0x1f0
[    4.568652] [df6efdc0] [c009409c] lookup_real+0x40/0x60
[    4.573940] [df6efdd0] [c0097f24] do_last.isra.50+0x498/0xa24
[    4.579709] [df6efe30] [c0098550] path_openat+0xa0/0x3fc
[    4.585082] [df6efe90] [c0098b88] do_filp_open+0x30/0x78
[    4.590398] [df6eff10] [c0089bf4] do_sys_open+0x134/0x1c8
[    4.595792] [df6eff40] [c000d670] ret_from_syscall+0x0/0x38

etc...
Eventually, after a continued storm of such error messages, the system gets to
the login prompt (wonder!). Upon fs accesses the following messages are
produced:

[  632.095496] UBIFS error (pid 2044): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
[  632.106810] UBIFS error (pid 2044): ubifs_write_inode: can't write inode 4458, error -30
[  632.117046] UBIFS error (pid 2044): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
[  632.128112] UBIFS error (pid 2044): ubifs_write_inode: can't write inode 4472, error -30
[  791.850368] UBIFS error (pid 2277): make_reservation: cannot reserve 408 bytes in jhead 1, error -30
[  791.861791] UBIFS error (pid 2277): ubifs_create: cannot create regular file, error -30
[  791.872740] UBIFS error (pid 2277): make_reservation: cannot reserve 408 bytes in jhead 1, error -30
[  791.884014] UBIFS error (pid 2277): ubifs_create: cannot create regular file, error -30
[  791.894726] UBIFS error (pid 2277): make_reservation: cannot reserve 408 bytes in jhead 1, error -30
[  791.905866] UBIFS error (pid 2277): ubifs_create: cannot create regular file, error -30
[  791.990008] uncorrectable error : 
[  791.993271] uncorrectable error : [  791.998354] uncorrectable error : 
[  792.004489] uncorrectable error : [  792.009634] uncorrectable error : 
[  792.015271] uncorrectable error : [  792.020251] uncorrectable error : 
[  792.026571] uncorrectable error : [  792.031448] UBI error: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87432, read 160 bytes
[  792.046615] UBIFS error (pid 1925): ubifs_leb_read: reading 160 bytes from LEB 3563:85384 failed, error -74
[  792.072034] UBIFS error (pid 1925): try_read_node: cannot read node type 0 from LEB 3563:85384, error -74
[  792.095807] uncorrectable error : 
[  792.099008] uncorrectable error : [  792.114843] uncorrectable error : 
[  792.118112] uncorrectable error : [  792.128933] uncorrectable error : 
[  792.135262] uncorrectable error : [  792.145267] uncorrectable error : 
[  792.148473] uncorrectable error : [  792.159756] UBI error: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 5616:87432, read 160 bytes
[  792.186861] UBIFS error (pid 1925): ubifs_check_node: bad magic 0x000000, expected 0x6101831
[  792.208112] UBIFS error (pid 1925): ubifs_check_node: bad node at LEB 3563:85384
[  792.225532] Not a node, first 24 bytes:
[  792.229169] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00                          ........................
[  792.265468] UBIFS error (pid 1925): ubifs_read_node: expected node type 0
[  792.282144] UBIFS error (pid 1925): ubifs_iget: failed to read inode 4173, error -117
[  792.300927] UBIFS error (pid 1925): ubifs_lookup: dead directory entry 'dhclient.eth0.leases', error -117


On the ARM platform things look like this:

Booting kernel...
   Image Name:   Linux-3.6.0-rc2prt-00003-g315801
   Created:      2012-08-22   7:31:05 UTC
   Data Size:    3244456 Bytes =  3.1 MB
   Load Address: 40008000
   Entry Point:  40008000
booting Linux kernel with devicetree
Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0
[    0.000000] Linux version 3.6.0-rc2prt-00003-g315801e-dirty (robin@erd943) (gcc version 4.4.1 (Sourcery G++ Lite 2010q1-202) ) #561 PREEMPT Wed Aug 22 09:30:55 CEST 2012
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: Freescale i.MX28 (Device Tree), model: Protonic I28 Board
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
[    0.000000] Kernel command line: console=ttyAMA0,115200 rw consoleblank=0 ubi.mtd=0 root=ubi0:rootfs rootfstype=ubifs
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Memory: 256MB = 256MB total
[    0.000000] Memory: 248212k/248212k available, 13932k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xd0800000 - 0xff000000   ( 744 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc058abf0   (5643 kB)
[    0.000000]       .init : 0xc058b000 - 0xc05aca50   ( 135 kB)
[    0.000000]       .data : 0xc05ae000 - 0xc05f6138   ( 289 kB)
[    0.000000]        .bss : 0xc05f615c - 0xc0b483ec   (5449 kB)
[    0.000000] SLUB: Genslabs=13, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:304
[    0.000000] sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 4294967286ms
[    0.000000] Console: colour dummy device 80x30
[    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
[    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.000000] ... MAX_LOCK_DEPTH:          48
[    0.000000] ... MAX_LOCKDEP_KEYS:        8191
[    0.000000] ... CLASSHASH_SIZE:          4096
[    0.000000] ... MAX_LOCKDEP_ENTRIES:     16384
[    0.000000] ... MAX_LOCKDEP_CHAINS:      32768
[    0.000000] ... CHAINHASH_SIZE:          16384
[    0.000000]  memory used by lock dependency info: 3695 kB
[    0.000000]  per task-struct memory footprint: 1152 bytes
[    0.070000] Calibrating delay loop... 226.09 BogoMIPS (lpj=1130496)
[    0.070000] pid_max: default: 32768 minimum: 301
[    0.070000] Mount-cache hash table entries: 512
[    0.100000] CPU: Testing write buffer coherency: ok
[    0.110000] Setting up static identity map for 0x40412a98 - 0x40412af0
[    0.120000] devtmpfs: initialized
[    0.130000] pinctrl core: initialized pinctrl subsystem
[    0.140000] dummy: 
[    0.140000] NET: Registered protocol family 16
[    0.140000] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.190000] Serial: AMBA PL011 UART driver
[    0.200000] 80074000.serial: ttyAMA0 at MMIO 0x80074000 (irq = 47) is a PL011 rev2
[    0.380000] console [ttyAMA0] enabled
[    0.420000] bio: create slab <bio-0> at 0
[    0.430000] mxs-dma 80004000.dma-apbh: initialized
[    0.440000] mxs-dma 80024000.dma-apbx: initialized
[    0.450000] vddio: 3300 mV 
[    0.450000] vddio2: 3300 mV 
[    0.460000] usb0_vbus: 5000 mV 
[    0.460000] SCSI subsystem initialized
[    0.470000] usbcore: registered new interface driver usbfs
[    0.470000] usbcore: registered new interface driver hub
[    0.480000] usbcore: registered new device driver usb
[    0.500000] Advanced Linux Sound Architecture Driver Version 1.0.25.
[    0.510000] Switching to clocksource mxs_timer
[    0.720000] NET: Registered protocol family 2
[    0.730000] TCP established hash table entries: 8192 (order: 4, 65536 bytes)
[    0.740000] TCP bind hash table entries: 8192 (order: 6, 294912 bytes)
[    0.750000] TCP: Hash tables configured (established 8192 bind 8192)
[    0.760000] TCP: reno registered
[    0.760000] UDP hash table entries: 256 (order: 2, 20480 bytes)
[    0.770000] UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
[    0.780000] NET: Registered protocol family 1
[    0.790000] RPC: Registered named UNIX socket transport module.
[    0.790000] RPC: Registered udp transport module.
[    0.800000] RPC: Registered tcp transport module.
[    0.800000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.810000] NetWinder Floating Point Emulator V0.97 (double precision)
[    0.890000] NFS: Registering the id_resolver key type
[    0.900000] Key type id_resolver registered
[    0.910000] Key type id_legacy registered
[    0.910000] msgmni has been set to 484
[    0.920000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    0.930000] io scheduler noop registered (default)
[    0.960000] Console: switching to colour frame buffer device 100x30
[    0.980000] mxsfb 80030000.lcdif: initialized
[    0.980000] Serial: AMBA driver
[    0.990000] uart-pl011 80074000.serial: no DMA platform data
[    0.990000] 80070000.serial: ttyAPP3 at MMIO 0x80070000 (irq = 115) is a 80070000.serial
[    1.000000] mxs-auart 80070000.serial: Found APPUART 3.1.0
[    1.020000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit), page size: 2048, OOB size: 64
[    1.030000] Scanning device for bad blocks
[    1.130000] Bad eraseblock 183 at 0x0000016e0000
[    1.370000] Bad eraseblock 677 at 0x0000054a0000
[    1.520000] Bad eraseblock 963 at 0x000007860000
[    3.170000] Bad eraseblock 4310 at 0x000021ac0000
[    4.460000] Bad eraseblock 6907 at 0x000035f60000
[    5.100000] GPMI NAND driver registered. (IMX)
[    5.110000] UBI: attaching mtd0 to ubi0
[    5.110000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    5.120000] UBI: logical eraseblock size:    126976 bytes
[    5.120000] UBI: smallest flash I/O unit:    2048
[    5.130000] UBI: VID header offset:          2048 (aligned 2048)
[    5.140000] UBI: data offset:                4096
[   23.330000] UBI: max. sequence number:       1116
[   23.430000] UBI: attached mtd0 to ubi0
[   23.430000] UBI: MTD device name:            "gpmi-nand"
[   23.440000] UBI: MTD device size:            1024 MiB
[   23.440000] UBI: number of good PEBs:        8187
[   23.450000] UBI: number of bad PEBs:         5
[   23.450000] UBI: number of corrupted PEBs:   0
[   23.460000] UBI: max. allowed volumes:       128
[   23.460000] UBI: wear-leveling threshold:    4096
[   23.470000] UBI: number of internal volumes: 1
[   23.470000] UBI: number of user volumes:     1
[   23.470000] UBI: available PEBs:             3792
[   23.480000] UBI: total number of reserved PEBs: 4395
[   23.480000] UBI: number of PEBs reserved for bad PEB handling: 162
[   23.490000] UBI: max/mean erase counter: 10/5
[   23.500000] UBI: image sequence number:  813592673
[   23.500000] UBI: background thread "ubi_bgt0d" started, PID 38
[   23.510000] vcan: Virtual CAN interface driver
[   23.510000] CAN device driver interface
[   23.520000] flexcan 80032000.can: device registered (reg_base=f5032000, irq=8)
[   23.530000] flexcan 80034000.can: device registered (reg_base=f5034000, irq=9)
[   23.660000] libphy: fec_enet_mii_bus: probed
[   23.670000] Initializing USB Mass Storage driver...
[   23.680000] usbcore: registered new interface driver usb-storage
[   23.680000] USB Mass Storage support registered.
[   23.690000] ci_hdrc ci_hdrc.0: doesn't support gadget
[   23.700000] ci_hdrc ci_hdrc.0: ChipIdea HDRC EHCI
[   23.700000] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
[   23.760000] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[   23.770000] hub 1-0:1.0: USB hub found
[   23.780000] hub 1-0:1.0: 1 port detected
[   23.790000] mousedev: PS/2 mouse device common for all mice
[   23.810000] input: EP0700M06 as /devices/80000000.apb/80040000.apbx/80058000.i2c/i2c-0/0-0038/input/input0
[   23.820000] rtc-pcf8563 0-0051: chip found, driver version 0.4.3
[   23.830000] rtc-pcf8563 0-0051: low voltage detected, date/time is not reliable.
[   23.840000] rtc-pcf8563 0-0051: retrieved date/time is not valid.
[   23.850000] rtc-pcf8563 0-0051: rtc core: registered rtc-pcf8563 as rtc0
[   23.860000] i2c /dev entries driver
[   23.910000] mxs-mmc 80010000.ssp: initialized
[   23.960000] mxs-mmc 80016000.ssp: initialized
[   23.960000] sdhci: Secure Digital Host Controller Interface driver
[   23.970000] mmc0: host does not support reading read-only switch. assuming write-enable.
[   23.980000] sdhci: Copyright(c) Pierre Ossman
[   23.980000] sdhci-pltfm: SDHCI platform and OF driver helper
[   23.990000] usbcore: registered new interface driver usbhid
[   23.990000] mmc0: new high speed SD card at address 1234
[   24.000000] usbhid: USB HID core driver
[   24.010000] mmcblk0: mmc0:1234 SA02G 1.83 GiB 
[   24.040000]  mmcblk0: p1 p2 p3
[   24.050000] sgtl5000 0-000a: Failed to get supply 'VDDD': -517
[   24.050000] 0-000a: 1200 mV normal 
[   24.070000] sgtl5000 0-000a: Using internal LDO instead of VDDD
[   24.080000] sgtl5000 0-000a: sgtl5000 revision 0x11
[   24.110000] mxs-sgtl5000 sound.9:  sgtl5000 <-> 80042000.saif mapping ok
[   24.120000] mxs-sgtl5000 sound.9:  sgtl5000 <-> 80046000.saif mapping ok
[   24.140000] TCP: cubic registered
[   24.150000] NET: Registered protocol family 17
[   24.150000] can: controller area network core (rev 20120528 abi 9)
[   24.160000] NET: Registered protocol family 29
[   24.160000] can: raw protocol (rev 20120528)
[   24.170000] can: broadcast manager protocol (rev 20120528 t)
[   24.170000] Key type dns_resolver registered
[   24.180000] registered taskstats version 1
[   24.190000] rtc-pcf8563 0-0051: low voltage detected, date/time is not reliable.
[   24.200000] rtc-pcf8563 0-0051: retrieved date/time is not valid.
[   24.210000] rtc-pcf8563 0-0051: hctosys: invalid date/time
[   24.210000] ALSA device list:
[   24.220000]   #0: mxs_sgtl5000
[   24.380000] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[   24.390000] UBIFS: file system size:   534949888 bytes (522412 KiB, 510 MiB, 4213 LEBs)
[   24.390000] UBIFS: journal size:       26791936 bytes (26164 KiB, 25 MiB, 211 LEBs)
[   24.400000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[   24.410000] UBIFS: default compressor: lzo
[   24.410000] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
[   24.430000] VFS: Mounted root (ubifs filesystem) on device 0:11.
[   24.440000] Freeing init memory: 132K
mounting filesystems...done.
running rc.d services...
syslogd starting
klogd starting
crond starting
Starting system message bus: dbus.
hwclock: can't open '/dev/misc/rtc': No such file or directory
starting dropbear...failed
run-parts: /etc/rc.d/S16dropbear exited with code 1
Starting telnetd...
starting mdev
mounting tmpfs at /dev
kernel.hotplug = /sbin/mdev
creating static nodes
waiting for devices...done
restoring mixer state...no /etc/asound.state, aborting
Initializing bluetooth interface
starting network interfaces...
uim:@ main
uim:unable to open /sys/devices/platform/kim/install(No such file or directory)
[   31.140000] eth0: Freescale FEC PHY driver [Micrel KS8041] (mii_bus:phy_addr=800f0000.etherne:00, irq=-1)
udhcpc (v1.18.5) started
Sending discover...
[   33.140000] libphy: 800f0000.etherne:00 - Link is Up - 100/Full
Sending discover...
Sending select for 192.168.2.215...
Lease of 192.168.2.215 obtained, lease time 600
deleting routers
route: SIOCDELRT: No such process
adding dns 192.168.1.39
starting inetd...done
logrotate: rotating in /var/log
logrotate: rotation for messages ... 
loading modules
Starting CAN interface...[   35.730000] flexcan 80032000.can: can0: writing ctrl=0x05312005
[   35.760000] flexcan 80034000.can: can1: writing ctrl=0x05312005
done
Initializing touch-screen...done
[   35.960000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 3248:67584, read only 160 bytes, retry
[   35.990000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 3248:67584, read only 160 bytes, retry
[   36.010000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 3248:67584, read only 160 bytes, retry
[   36.030000] UBI error: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 3248:67584, read 160 bytes
[   36.040000] [<c0014fd8>] (unwind_backtrace+0x0/0xf4) from [<c02b8508>] (ubi_io_read+0x1bc/0x37c)
[   36.050000] [<c02b8508>] (ubi_io_read+0x1bc/0x37c) from [<c02b72e4>] (ubi_eba_read_leb+0xa4/0x3f4)
[   36.060000] [<c02b72e4>] (ubi_eba_read_leb+0xa4/0x3f4) from [<c02b46fc>] (ubi_leb_read+0xdc/0x130)
[   36.080000] [<c02b46fc>] (ubi_leb_read+0xdc/0x130) from [<c01b53dc>] (ubifs_leb_read+0x24/0x88)
[   36.080000] [<c01b53dc>] (ubifs_leb_read+0x24/0x88) from [<c01b93a0>] (fallible_read_node+0x64/0x1c4)
[   36.100000] [<c01b93a0>] (fallible_read_node+0x64/0x1c4) from [<c01b9f18>] (ubifs_tnc_locate+0x100/0x1a4)
[   36.120000] [<c01b9f18>] (ubifs_tnc_locate+0x100/0x1a4) from [<c01af408>] (ubifs_iget+0x78/0x86c)
[   36.120000] [<c01af408>] (ubifs_iget+0x78/0x86c) from [<c01acd90>] (ubifs_lookup+0x100/0x1f4)
[   36.140000] [<c01acd90>] (ubifs_lookup+0x100/0x1f4) from [<c00e2ffc>] (lookup_real+0x20/0x50)
[   36.150000] [<c00e2ffc>] (lookup_real+0x20/0x50) from [<c00e7984>] (do_last+0x7ec/0xbb4)
[   36.160000] [<c00e7984>] (do_last+0x7ec/0xbb4) from [<c00e7df8>] (path_openat+0xac/0x450)
[   36.170000] [<c00e7df8>] (path_openat+0xac/0x450) from [<c00e8284>] (do_filp_open+0x30/0x84)
[   36.180000] [<c00e8284>] (do_filp_open+0x30/0x84) from [<c00e0088>] (open_exec+0x1c/0xe0)
[   36.190000] [<c00e0088>] (open_exec+0x1c/0xe0) from [<c00e0b4c>] (do_execve+0x1c0/0x3ec)
[   36.200000] [<c00e0b4c>] (do_execve+0x1c0/0x3ec) from [<c001257c>] (sys_execve+0x34/0x54)
[   36.210000] [<c001257c>] (sys_execve+0x34/0x54) from [<c000f2a0>] (ret_fast_syscall+0x0/0x38)
[   36.220000] UBIFS error (pid 173): ubifs_leb_read: reading 160 bytes from LEB 1077:63488 failed, error -74
[   36.240000] [<c0014fd8>] (unwind_backtrace+0x0/0xf4) from [<c01b5434>] (ubifs_leb_read+0x7c/0x88)
[   36.240000] [<c01b5434>] (ubifs_leb_read+0x7c/0x88) from [<c01b93a0>] (fallible_read_node+0x64/0x1c4)
[   36.260000] [<c01b93a0>] (fallible_read_node+0x64/0x1c4) from [<c01b9f18>] (ubifs_tnc_locate+0x100/0x1a4)
[   36.270000] [<c01b9f18>] (ubifs_tnc_locate+0x100/0x1a4) from [<c01af408>] (ubifs_iget+0x78/0x86c)
[   36.280000] [<c01af408>] (ubifs_iget+0x78/0x86c) from [<c01acd90>] (ubifs_lookup+0x100/0x1f4)
[   36.290000] [<c01acd90>] (ubifs_lookup+0x100/0x1f4) from [<c00e2ffc>] (lookup_real+0x20/0x50)
[   36.300000] [<c00e2ffc>] (lookup_real+0x20/0x50) from [<c00e7984>] (do_last+0x7ec/0xbb4)
[   36.320000] [<c00e7984>] (do_last+0x7ec/0xbb4) from [<c00e7df8>] (path_openat+0xac/0x450)
[   36.320000] [<c00e7df8>] (path_openat+0xac/0x450) from [<c00e8284>] (do_filp_open+0x30/0x84)
[   36.340000] [<c00e8284>] (do_filp_open+0x30/0x84) from [<c00e0088>] (open_exec+0x1c/0xe0)
[   36.350000] [<c00e0088>] (open_exec+0x1c/0xe0) from [<c00e0b4c>] (do_execve+0x1c0/0x3ec)
[   36.350000] [<c00e0b4c>] (do_execve+0x1c0/0x3ec) from [<c001257c>] (sys_execve+0x34/0x54)
[   36.370000] [<c001257c>] (sys_execve+0x34/0x54) from [<c000f2a0>] (ret_fast_syscall+0x0/0x38)
[   36.370000] UBIFS error (pid 173): try_read_node: cannot read node type 0 from LEB 1077:63488, error -74
[   36.390000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 3248:67584, read only 160 bytes, retry
[   36.400000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 3248:67584, read only 160 bytes, retry
[   36.420000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 3248:67584, read only 160 bytes, retry
[   36.430000] UBI error: ubi_io_read: error -74 (ECC error) while reading 160 bytes from PEB 3248:67584, read 160 bytes
[   36.440000] [<c0014fd8>] (unwind_backtrace+0x0/0xf4) from [<c02b8508>] (ubi_io_read+0x1bc/0x37c)
[   36.450000] [<c02b8508>] (ubi_io_read+0x1bc/0x37c) from [<c02b72e4>] (ubi_eba_read_leb+0xa4/0x3f4)
[   36.460000] [<c02b72e4>] (ubi_eba_read_leb+0xa4/0x3f4) from [<c02b46fc>] (ubi_leb_read+0xdc/0x130)
[   36.480000] [<c02b46fc>] (ubi_leb_read+0xdc/0x130) from [<c01b53dc>] (ubifs_leb_read+0x24/0x88)
[   36.480000] [<c01b53dc>] (ubifs_leb_read+0x24/0x88) from [<c01b54dc>] (ubifs_read_node+0x9c/0x2a4)
[   36.490000] [<c01b54dc>] (ubifs_read_node+0x9c/0x2a4) from [<c01d3b08>] (ubifs_tnc_read_node+0x124/0x134)
[   36.510000] [<c01d3b08>] (ubifs_tnc_read_node+0x124/0x134) from [<c01b9f9c>] (ubifs_tnc_locate+0x184/0x1a4)
[   36.520000] [<c01b9f9c>] (ubifs_tnc_locate+0x184/0x1a4) from [<c01af408>] (ubifs_iget+0x78/0x86c)
[   36.530000] [<c01af408>] (ubifs_iget+0x78/0x86c) from [<c01acd90>] (ubifs_lookup+0x100/0x1f4)
[   36.540000] [<c01acd90>] (ubifs_lookup+0x100/0x1f4) from [<c00e2ffc>] (lookup_real+0x20/0x50)
[   36.550000] [<c00e2ffc>] (lookup_real+0x20/0x50) from [<c00e7984>] (do_last+0x7ec/0xbb4)
[   36.560000] [<c00e7984>] (do_last+0x7ec/0xbb4) from [<c00e7df8>] (path_openat+0xac/0x450)
[   36.570000] [<c00e7df8>] (path_openat+0xac/0x450) from [<c00e8284>] (do_filp_open+0x30/0x84)
[   36.580000] [<c00e8284>] (do_filp_open+0x30/0x84) from [<c00e0088>] (open_exec+0x1c/0xe0)
[   36.590000] [<c00e0088>] (open_exec+0x1c/0xe0) from [<c00e0b4c>] (do_execve+0x1c0/0x3ec)
[   36.600000] [<c00e0b4c>] (do_execve+0x1c0/0x3ec) from [<c001257c>] (sys_execve+0x34/0x54)
[   36.600000] [<c001257c>] (sys_execve+0x34/0x54) from [<c000f2a0>] (ret_fast_syscall+0x0/0x38)
[   36.620000] UBIFS error (pid 173): ubifs_check_node: bad node length 0
[   36.620000] UBIFS error (pid 173): ubifs_check_node: bad node at LEB 1077:63488
[   36.630000]  magic          0x6101831
[   36.640000]  crc            0x6840206
[   36.640000]  node_type      0 (inode node)
[   36.640000]  group_type     0 (no node group)
[   36.650000]  sqnum          74179
[   36.650000]  len            0
[   36.650000]  key            (3647, inode)
[   36.660000]  creat_sqnum    0
[   36.660000]  size           273
[   36.660000]  nlink          1
[   36.670000]  atime          1075978290.0
[   36.670000]  mtime          16.0
[   36.680000]  ctime          0.0
[   36.680000]  uid            0
[   36.680000]  gid            0
[   36.680000]  mode           12
[   36.690000]  flags          0x1
[   36.690000]  xattr_cnt      0
[   36.690000]  xattr_size     0
[   36.700000]  xattr_names    0
[   36.700000]  compr_type     0x0
[   36.700000]  data len       0
[   36.710000] [<c0014fd8>] (unwind_backtrace+0x0/0xf4) from [<c01b3d8c>] (ubifs_check_node+0x1ac/0x2d0)
[   36.720000] [<c01b3d8c>] (ubifs_check_node+0x1ac/0x2d0) from [<c01b551c>] (ubifs_read_node+0xdc/0x2a4)
[   36.730000] [<c01b551c>] (ubifs_read_node+0xdc/0x2a4) from [<c01d3b08>] (ubifs_tnc_read_node+0x124/0x134)
[   36.740000] [<c01d3b08>] (ubifs_tnc_read_node+0x124/0x134) from [<c01b9f9c>] (ubifs_tnc_locate+0x184/0x1a4)
[   36.750000] [<c01b9f9c>] (ubifs_tnc_locate+0x184/0x1a4) from [<c01af408>] (ubifs_iget+0x78/0x86c)
[   36.760000] [<c01af408>] (ubifs_iget+0x78/0x86c) from [<c01acd90>] (ubifs_lookup+0x100/0x1f4)
[   36.770000] [<c01acd90>] (ubifs_lookup+0x100/0x1f4) from [<c00e2ffc>] (lookup_real+0x20/0x50)
[   36.800000] [<c00e2ffc>] (lookup_real+0x20/0x50) from [<c00e7984>] (do_last+0x7ec/0xbb4)
[   36.800000] [<c00e7984>] (do_last+0x7ec/0xbb4) from [<c00e7df8>] (path_openat+0xac/0x450)
[   36.820000] [<c00e7df8>] (path_openat+0xac/0x450) from [<c00e8284>] (do_filp_open+0x30/0x84)
[   36.820000] [<c00e8284>] (do_filp_open+0x30/0x84) from [<c00e0088>] (open_exec+0x1c/0xe0)
[   36.840000] [<c00e0088>] (open_exec+0x1c/0xe0) from [<c00e0b4c>] (do_execve+0x1c0/0x3ec)
[   36.850000] [<c00e0b4c>] (do_execve+0x1c0/0x3ec) from [<c001257c>] (sys_execve+0x34/0x54)
[   36.860000] [<c001257c>] (sys_execve+0x34/0x54) from [<c000f2a0>] (ret_fast_syscall+0x0/0x38)
[   36.870000] UBIFS error (pid 173): ubifs_read_node: expected node type 0
[   36.880000] UBIFS error (pid 173): ubifs_iget: failed to read inode 3647, error -22
[   36.890000] UBIFS error (pid 173): ubifs_lookup: dead directory entry 'application_startup', error -22

[   36.900000] UBIFS warning (pid 173): ubifs_ro_mode: switched to read-only mode, error -22
[   36.910000] [<c0014fd8>] (unwind_backtrace+0x0/0xf4) from [<c01ace68>] (ubifs_lookup+0x1d8/0x1f4)
[   36.930000] [<c01ace68>] (ubifs_lookup+0x1d8/0x1f4) from [<c00e2ffc>] (lookup_real+0x20/0x50)
[   36.930000] [<c00e2ffc>] (lookup_real+0x20/0x50) from [<c00e7984>] (do_last+0x7ec/0xbb4)
[   36.940000] [<c00e7984>] (do_last+0x7ec/0xbb4) from [<c00e7df8>] (path_openat+0xac/0x450)
[   36.960000] [<c00e7df8>] (path_openat+0xac/0x450) from [<c00e8284>] (do_filp_open+0x30/0x84)
[   36.960000] [<c00e8284>] (do_filp_open+0x30/0x84) from [<c00e0088>] (open_exec+0x1c/0xe0)
[   36.970000] [<c00e0088>] (open_exec+0x1c/0xe0) from [<c00e0b4c>] (do_execve+0x1c0/0x3ec)
[   36.990000] [<c00e0b4c>] (do_execve+0x1c0/0x3ec) from [<c001257c>] (sys_execve+0x34/0x54)
[   36.990000] [<c001257c>] (sys_execve+0x34/0x54) from [<c000f2a0>] (ret_fast_syscall+0x0/0x38)


Is this a known issue?

Best regards,

-- 
David Jander
Protonic Holland.
