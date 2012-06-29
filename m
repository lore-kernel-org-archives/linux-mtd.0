Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkWsJ-0007A9-GT
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 08:48:24 +0000
Received: by mail-gh0-f177.google.com with SMTP id f11so2665117ghb.36
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jun 2012 01:48:23 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 29 Jun 2012 10:48:22 +0200
Message-ID: <CAHMSPgOUuq8HKR+Q3ay5jr4-cYQYcB5129p4XcHYi4z2ydoH6Q@mail.gmail.com>
Subject: ubifs_iget: failed to read inode 1
From: Koen Beel <koen.beel.barco@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <b32955@freescale.com>, adrian.hunter@intel.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

We are using UBIFS on nand flash and experienced the following issue.
During attach of the ubi device we get the message 'recovery needed'
and 'recovery complete'. Finally the ubi_attach fails with the error
"UBIFS error (pid 229): ubifs_iget: failed to read inode 1, error -2".

We are using and Freescale i.MX28 soc and using Micron NAND (see below).
We are using kernel version 3.1.0.
We have tested with latest mainline kernel but have not been able to
trigger this issue.
However, once the issue in the the flash, it can be reproduced at every boot.

Looking at the ubifs code, the error message traces back to:
ubifs_iget: ubifs_tnc_lookup fails, goto out_ino, free mem and print error.
ubifs_tnc_lookup
ubifs_tnc_locate: returns -ENOENT (-2)
ubifs_lookup_level0: the lookup fails

Anybody an idea where to look for?

Thanks,
Koen


Uncompressing Linux... done, booting the kernel.
[    0.000000] Linux version 3.1.0 (jenkins@oxygen.barco.com) (gcc
version 4.5.3 (Buildroot 2011.11-svn3549-dirty) ) #3 Wed Jun 27
11:58:26 CEST 2012
[    0.000000] Kernel command line: panic=3 oops=panic console=ttyAMA0,115200
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 128MB = 128MB total
[    0.000000] Memory: 120036k/120036k available, 11036k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
[    0.000000]     vmalloc : 0xc8800000 - 0xf4000000   ( 696 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc02ee474   (2970 kB)
[    0.000000]       .init : 0xc02ef000 - 0xc055e000   (2492 kB)
[    0.000000]       .data : 0xc055e000 - 0xc0578ac0   ( 107 kB)
[    0.000000]        .bss : 0xc0578ae4 - 0xc05a364c   ( 171 kB)
[    0.000000] NR_IRQS:304
[    0.000000] Calibrating delay loop... 226.09 BogoMIPS (lpj=1130496)
[    0.080000] pid_max: default: 32768 minimum: 301
[    0.080000] Mount-cache hash table entries: 512
[    0.080000] CPU: Testing write buffer coherency: ok
[    0.080000] devtmpfs: initialized
[    0.090000] NET: Registered protocol family 16
[    0.120000] Serial: AMBA PL011 UART driver
[    0.120000] duart: ttyAMA0 at MMIO 0x80074000 (irq = 47) is a PL011 rev2
[    0.130000] console [ttyAMA0] enabled
[    0.160000] bio: create slab <bio-0> at 0
[    0.180000] mxs-dma mxs-dma-apbh: initialized
[    0.200000] mxs-dma mxs-dma-apbx: initialized
[    0.220000] Switching to clocksource mxs_timer
[    0.230000] Switched to NOHz mode on CPU #0
[    0.230000] cfg80211: Calling CRDA to update world regulatory domain
[    0.240000] NET: Registered protocol family 2
[    0.250000] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.250000] TCP established hash table entries: 4096 (order: 3, 32768 bytes)
[    0.260000] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[    0.270000] TCP: Hash tables configured (established 4096 bind 4096)
[    0.270000] TCP reno registered
[    0.280000] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.280000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.290000] NET: Registered protocol family 1
[    1.020000] Unpacking initramfs...
[    1.030000] Initramfs unpacking failed: junk in compressed archive
[    1.050000] Freeing initrd memory: 4096K
[    1.060000] NetWinder Floating Point Emulator V0.97 (double precision)
[    1.110000] msgmni has been set to 242
[    1.110000] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 254)
[    1.120000] io scheduler noop registered (default)
[    1.170000] uart-pl011 duart: no DMA platform data
[    1.230000] ONFI flash detected
[    1.230000] ONFI param page 0 valid
[    1.230000] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xf1
(Micron MT29F1G08ABADAH4)
[    1.250000] Scanning device for bad blocks
[    1.450000] Creating 3 MTD partitions on "gpmi-nand":
[    1.450000] 0x000000000000-0x000002000000 : "kernel"
[    1.460000] 0x000002000000-0x000004000000 : "rootfs"
[    1.490000] 0x000004000000-0x000008000000 : "store"
[    1.520000] GPMI NAND driver registered. (IMX)
[    1.570000] mxs-usbphy mxs-usbphy.0: initializing mxs USB Phy
[    1.610000] mxs-mmc mxs-mmc.0: initialized
[    1.660000] TCP cubic registered
[    1.660000] NET: Registered protocol family 17
[    1.670000] mmc0: new high speed SDIO card at address fffd
[    1.710000] lib80211: common routines for IEEE802.11 drivers
[    1.790000] registered taskstats version 1
[    1.820000] Freeing init memory: 2492K
Starting logging: OK
Starting mdev...
Creating button...
3+0 records in
3+0 records out
Mounting store volume ...
[    2.540000] UBI: attaching mtd2 to ubi2
[    2.550000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    2.550000] UBI: logical eraseblock size:    126976 bytes
[    2.560000] UBI: smallest flash I/O unit:    2048
[    2.560000] UBI: VID header offset:          2048 (aligned 2048)
[    2.570000] UBI: data offset:                4096
[    3.260000] UBI: max. sequence number:       15388
[    3.290000] UBI: attached mtd2 to ubi2
[    3.290000] UBI: MTD device name:            "store"
[    3.300000] UBI: MTD device size:            64 MiB
[    3.300000] UBI: number of good PEBs:        512
[    3.310000] UBI: number of bad PEBs:         0
[    3.310000] UBI: number of corrupted PEBs:   0
[    3.310000] UBI: max. allowed volumes:       128
[    3.320000] UBI: wear-leveling threshold:    4096
[    3.320000] UBI: number of internal volumes: 1
[    3.330000] UBI: number of user volumes:     1
[    3.330000] UBI: available PEBs:             0
[    3.340000] UBI: total number of reserved PEBs: 512
[    3.340000] UBI: number of PEBs reserved for bad PEB handling: 5
[    3.350000] UBI: max/mean erase counter: 32/29
[    3.350000] UBI: image sequence number:  1039166143
[    3.370000] UBI: background thread "ubi_bgt2d" started, PID 227
[    3.520000] UBIFS: recovery needed
[    3.700000] UBIFS: recovery completed
[    3.710000] UBIFS: mounted UBI device 2, volume 0, name "store"
[    3.710000] UBIFS: file system size:   62726144 bytes (61256 KiB,
59 MiB, 494 LEBs)
[    3.720000] UBIFS: journal size:       3174400 bytes (3100 KiB, 3
MiB, 25 LEBs)
[    3.730000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    3.730000] UBIFS: default compressor: lzo
[    3.740000] UBIFS: reserved for root:  2962710 bytes (2893 KiB)
[    3.750000] UBIFS error (pid 229): ubifs_iget: failed to read inode
1, error -2
mount: mounting ubi2:store on /store failed: No such file or directory
