Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4SMj-000327-79
 for linux-mtd@lists.infradead.org; Tue, 08 Jul 2014 10:11:23 +0000
Received: by mail-we0-f174.google.com with SMTP id u57so5703628wes.33
 for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2014 03:10:50 -0700 (PDT)
Message-ID: <53BBC39F.7010307@gmail.com>
Date: Tue, 08 Jul 2014 12:10:39 +0200
From: Richard Genoud <richard.genoud@gmail.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: ubifs error at boot "bad node type"
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem, Adrian,

I ran into an ubifs error on a board (discovered it because the board wouldn't boot anymore).
The /etc directory seems to be damaged.
To start checking what's wrong, I boot the same kernel from NFSROOT instead of nand.
The kernel is quite recent (3.14.5), and of course, I don't know how the /etc directory got damaged.

The UBI layer seems to be perfectly happy, no bad block, just some bitflips :

# nanddump /dev/mtd3 -f /dev/null
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x0f580000...
[  744.710937] atmel_nand 40000000.nand: Bit flip in data area, byte_pos: 1588, bit_pos: 5, 0x2d -> 0x0d
ECC: 1 corrected bitflip(s) at offset 0x09ca8000
[  746.625000] atmel_nand 40000000.nand: Bit flip in data area, byte_pos: 78, bit_pos: 0, 0xff -> 0xfe
ECC: 1 corrected bitflip(s) at offset 0x0abdb800

# insmod ./mtd_readtest.ko dev=3
[ 2702.210937] 
[ 2702.210937] =================================================
[ 2702.218750] mtd_readtest: MTD device: 3
[ 2702.218750] mtd_readtest: MTD device size 257425408, eraseblock size 131072, page size 2048, count of eraseblocks 1964, pages per eraseblock 64, OOB size 64
[ 2702.226562] mtd_test: scanning for bad eraseblocks
[ 2702.234375] mtd_test: scanned 1964 eraseblocks, 0 are bad
[ 2702.242187] mtd_readtest: testing page read
[ 2721.179687] atmel_nand 40000000.nand: Bit flip in data area, byte_pos: 1588, bit_pos: 5, 0x2d -> 0x0d
[ 2721.875000] atmel_nand 40000000.nand: Bit flip in data area, byte_pos: 647, bit_pos: 1, 0x06 -> 0x04
[ 2723.031250] atmel_nand 40000000.nand: Bit flip in data area, byte_pos: 78, bit_pos: 0, 0xff -> 0xfe
[ 2732.031250] mtd_readtest: finished
[ 2732.039062] =================================================




ubiattach is ok:
# ubiattach -m 3
[   50.164062] UBI: default fastmap pool size: 95
[   50.164062] UBI: default fastmap WL pool size: 25
[   50.171875] UBI: attaching mtd3 to ubi0
[   51.070312] UBI: scanning is finished
[   51.101562] UBI: attached mtd3 (name "ubi", size 245 MiB) to ubi0
[   51.101562] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[   51.109375] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[   51.117187] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[   51.125000] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
[   51.132812] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
[   51.132812] UBI: max/mean erase counter: 5/1, WL threshold: 4096, image sequence number: 906707977
[   51.140625] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
[   51.148437] UBI: background thread "ubi_bgt0d" started, PID 649
UBI device number 0, total 1964 LEBs (249380864 bytes, 237.8 MiB), available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)


mounting the ubifs volume is also ok:
# mount -oro,chk_data_crc -tubifs /dev/ubi0_1 /mnt/rfs
[   76.187500] UBIFS: recovery needed
[   76.226562] UBIFS: recovery deferred
[   76.234375] UBIFS: mounted UBI device 0, volume 1, name "rootfs", R/O mode
[   76.242187] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[   76.250000] UBIFS: FS size: 66789376 bytes (63 MiB, 526 LEBs), journal size 9015296 bytes (8 MiB, 71 LEBs)
[   76.257812] UBIFS: reserved for root: 0 bytes (0 KiB)
[   76.265625] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 9BEA6CAF-3082-4515-BE97-02395D576493, small LPT model


But trying to list / some files fails :

# ls -l /mnt/rfs/
[   87.054687] UBIFS error (pid 652): ubifs_read_node: bad node type (255 but expected 0)
[   87.062500] UBIFS error (pid 652): ubifs_read_node: bad node at LEB 405:39728, LEB mapping status 1
[   87.070312] Not a node, first 24 bytes:
[   87.078125] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................
[   87.085937] CPU: 0 PID: 652 Comm: ls Not tainted 3.14.5-g5e62e31 #1
[   87.093750] [<c000d298>] (unwind_backtrace) from [<c000baa8>] (show_stack+0x10/0x14)
[   87.101562] [<c000baa8>] (show_stack) from [<c00ec5b0>] (ubifs_read_node+0x250/0x28c)
[   87.109375] [<c00ec5b0>] (ubifs_read_node) from [<c0106d0c>] (ubifs_tnc_read_node+0x48/0x124)
[   87.117187] [<c0106d0c>] (ubifs_tnc_read_node) from [<c00ef558>] (ubifs_tnc_locate+0xfc/0x18c)
[   87.125000] [<c00ef558>] (ubifs_tnc_locate) from [<c00e8168>] (ubifs_iget+0x64/0x7c0)
[   87.132812] [<c00e8168>] (ubifs_iget) from [<c00e4b74>] (ubifs_lookup+0x1b0/0x1e0)
[   87.140625] [<c00e4b74>] (ubifs_lookup) from [<c007cc38>] (lookup_real+0x30/0x4c)
[   87.148437] [<c007cc38>] (lookup_real) from [<c007d898>] (__lookup_hash+0x30/0x3c)
[   87.148437] [<c007d898>] (__lookup_hash) from [<c007d8e0>] (lookup_slow+0x3c/0x9c)
[   87.156250] [<c007d8e0>] (lookup_slow) from [<c007ee48>] (path_lookupat+0x110/0x6b8)
[   87.164062] [<c007ee48>] (path_lookupat) from [<c007f410>] (filename_lookup+0x20/0x5c)
[   87.171875] [<c007f410>] (filename_lookup) from [<c008189c>] (user_path_at_empty+0x54/0x7c)
[   87.179687] [<c008189c>] (user_path_at_empty) from [<c00818d4>] (user_path_at+0x10/0x14)
[   87.187500] [<c00818d4>] (user_path_at) from [<c0078fdc>] (vfs_fstatat+0x44/0x8c)
[   87.195312] [<c0078fdc>] (vfs_fstatat) from [<c007926c>] (SyS_lstat64+0x14/0x30)
[   87.203125] [<c007926c>] (SyS_lstat64) from [<c0009360>] (ret_fast_syscall+0x0/0x2c)
[   87.210937] UBIFS error (pid 652): ubifs_iget: failed to read inode 68, error -22
[   87.218750] UBIFS error (pid 652): ubifs_lookup: dead directory entry 'etc', error -22
[   87.226562] UBIFS warning (pid 652): ubifs_ro_mode: switched to read-only mode, error -22
[   87.234375] CPU: 0 PID: 652 Comm: ls Not tainted 3.14.5-g5e62e31 #1
[   87.234375] [<c000d298>] (unwind_backtrace) from [<c000baa8>] (show_stack+0x10/0x14)
[   87.242187] [<c000baa8>] (show_stack) from [<c00e4af4>] (ubifs_lookup+0x130/0x1e0)
[   87.250000] [<c00e4af4>] (ubifs_lookup) from [<c007cc38>] (lookup_real+0x30/0x4c)
[   87.257812] [<c007cc38>] (lookup_real) from [<c007d898>] (__lookup_hash+0x30/0x3c)
[   87.265625] [<c007d898>] (__lookup_hash) from [<c007d8e0>] (lookup_slow+0x3c/0x9c)
[   87.273437] [<c007d8e0>] (lookup_slow) from [<c007ee48>] (path_lookupat+0x110/0x6b8)
[   87.281250] [<c007ee48>] (path_lookupat) from [<c007f410>] (filename_lookup+0x20/0x5c)
[   87.289062] [<c007f410>] (filename_lookup) from [<c008189c>] (user_path_at_empty+0x54/0x7c)
[   87.296875] [<c008189c>] (user_path_at_empty) from [<c00818d4>] (user_path_at+0x10/0x14)
[   87.304687] [<c00818d4>] (user_path_at) from [<c0078fdc>] (vfs_fstatat+0x44/0x8c)
[   87.312500] [<c0078fdc>] (vfs_fstatat) from [<c007926c>] (SyS_lstat64+0x14/0x30)
[   87.320312] [<c007926c>] (SyS_lstat64) from [<c0009360>] (ret_fast_syscall+0x0/0x2c)
ls: /mnt/rfs/etc: Invalid argument
total 0
drwxr-xr-x    2 root     root         10512 Jun 16 16:05 bin/
drwxr-xr-x    2 root     root           232 Jun  6 06:30 data/
drwxr-xr-x    2 root     root           224 Jun 16 16:46 dev/
drwxr-xr-x    4 root     root           288 Jun 16 16:46 home/
drwxr-xr-x    5 root     root          3200 Jun 16 16:45 lib/
lrwxrwxrwx    1 root     root             3 Jun 16 15:49 lib32 -> lib/
lrwxrwxrwx    1 root     root            11 Jun 16 16:05 linuxrc -> bin/busybox*
drwxr-xr-x    2 root     root           160 Jun  6 06:30 mnt/
drwxr-xr-x    2 root     root           160 Jun  6 06:30 proc/
drwx------    3 root     root           672 Jun  6 06:30 root/
lrwxrwxrwx    1 root     root             3 Jun  6 06:30 run -> tmp/
drwxr-xr-x    2 root     root          3848 Jun 16 16:41 sbin/
drwxr-xr-x    2 root     root           160 Jun  6 06:30 sys/
drwxrwxrwt    3 root     root           224 Jun  6 06:30 tmp/
drwxr-xr-x    9 root     root           696 Jun 16 16:45 usr/
drwxr-xr-x    4 root     root           672 Jun 16 16:29 var/


Before trying to remove the volume, I would like to know what you suggest to investigate this ?


# ubinfo /dev/ubi0
ubi0
Volumes count:                           3
Logical eraseblock size:                 126976 bytes, 124.0 KiB
Total amount of logical eraseblocks:     1964 (249380864 bytes, 237.8 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  40
Current maximum erase counter value:     5
Minimum input/output unit size:          2048 bytes
Character device major/minor:            251:0
Present volumes:                         0, 1, 2




dmesg:
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.14.5-g5e62e31 (info@paratronic.fr) (gcc version 4.7.3 (Buildroot 2013.08-00663-g9bc025a) ) #1 2014-06-02 17:34:43 +0200
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine model: Paratronic LNS
[    0.000000] Memory policy: Data cache writeback
[    0.000000] AT91: Detected soc type: at91sam9x5
[    0.000000] AT91: Detected soc subtype: at91sam9g35
[    0.000000] AT91: sram at 0x300000 of 0x8000 mapped at 0xfef70000
[    0.000000] On node 0 totalpages: 32768
[    0.000000] free_area_init_node: node 0, pgdat c03a3fa8, node_mem_map c7efa000
[    0.000000]   Normal zone: 256 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 32768 pages, LIFO batch:7
[    0.000000] Clocks: CPU 400 MHz, master 133 MHz, main 12.000 MHz
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
[    0.000000] Kernel command line: console=ttyS0,115200 loglevel=8 panic=2 mtdparts=atmel_nand:256M(all),128k@0(dtb),10112k(kernel),251392k(ubi),512k(bbt)ro ip=dhcp rw root=/dev/nfs nfsroot=192.168.7.1:/nfsroot,v3
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 125920K/131072K available (2600K kernel code, 145K rwdata, 828K rodata, 118K init, 194K bss, 5152K reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xc8800000 - 0xff000000   ( 872 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc036163c   (3430 kB)
[    0.000000]       .init : 0xc0362000 - 0xc037f98c   ( 119 kB)
[    0.000000]       .data : 0xc0380000 - 0xc03a46a0   ( 146 kB)
[    0.000000]        .bss : 0xc03a46a0 - 0xc03d502c   ( 195 kB)
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] sched_clock: 32 bits at 128 Hz, resolution 7812500ns, wraps every 16777216000000000ns
[    0.000000] Console: colour dummy device 80x30
[    0.054687] Calibrating delay loop... 198.76 BogoMIPS (lpj=775168)
[    0.054687] pid_max: default: 32768 minimum: 301
[    0.062500] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.062500] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.070312] CPU: Testing write buffer coherency: ok
[    0.070312] Setting up static identity map for 0x20275978 - 0x202759b4
[    0.078125] devtmpfs: initialized
[    0.078125] pinctrl core: initialized pinctrl subsystem
[    0.078125] NET: Registered protocol family 16
[    0.078125] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.109375] gpio-at91 fffff400.gpio: at address fefff400
[    0.109375] gpio-at91 fffff600.gpio: at address fefff600
[    0.117187] gpio-at91 fffff800.gpio: at address fefff800
[    0.117187] gpio-at91 fffffa00.gpio: at address fefffa00
[    0.117187] pinctrl-at91 pinctrl.2: initialized AT91 pinctrl driver
[    0.117187] tcb_clksrc: tc0 at 16.166 MHz
[    0.148437] bio: create slab <bio-0> at 0
[    0.148437] at_hdmac ffffec00.dma-controller: Atmel AHB DMA Controller ( cpy slave ), 8 channels
[    0.156250] at_hdmac ffffee00.dma-controller: Atmel AHB DMA Controller ( cpy slave ), 8 channels
[    0.171875] Switched to clocksource tcb_clksrc
[    0.226562] NET: Registered protocol family 2
[    0.226562] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
[    0.226562] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.226562] TCP: Hash tables configured (established 1024 bind 1024)
[    0.226562] TCP: reno registered
[    0.226562] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.226562] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.226562] NET: Registered protocol family 1
[    0.226562] RPC: Registered named UNIX socket transport module.
[    0.226562] RPC: Registered udp transport module.
[    0.226562] RPC: Registered tcp transport module.
[    0.226562] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.234375] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.234375] msgmni has been set to 245
[    0.234375] NET: Registered protocol family 38
[    0.242187] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    0.242187] io scheduler noop registered (default)
[    0.242187] atmel_lcdfb f8038000.lcd: 300KiB frame buffer at 27980000 (mapped at c8848000)
[    0.882812] atmel_lcdfb f8038000.lcd: fb0: Atmel LCDC at 0xf8038000 (mapped at c8896000), irq 33
[    0.882812] fffff200.serial: ttyS0 at MMIO 0xfffff200 (irq = 16, base_baud = 8333333) is a ATMEL_SERIAL
[    1.242187] console [ttyS0] enabled
[    1.250000] f801c000.serial: ttyS1 at MMIO 0xf801c000 (irq = 23, base_baud = 8333333) is a ATMEL_SERIAL
[    1.257812] f8020000.serial: ttyS2 at MMIO 0xf8020000 (irq = 24, base_baud = 8333333) is a ATMEL_SERIAL
[    1.265625] f8024000.serial: ttyS3 at MMIO 0xf8024000 (irq = 25, base_baud = 8333333) is a ATMEL_SERIAL
[    1.281250] brd: module loaded
[    1.304687] loop: module loaded
[    1.320312] atmel_nand 40000000.nand: Use On Flash BBT
[    1.328125] atmel_nand 40000000.nand: No DMA support for NAND access.
[    1.335937] Device Unique ID: 8a b2 e0 f2 e0 78 20 65 ff 00 ff 00 ff 00 ff 00
[    1.335937] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    1.343750] nand: Micron MT29F2G08ABAEAWP
[    1.351562] nand: 256MiB, SLC, page size: 2048, OOB size: 64
[    1.351562] atmel_nand 40000000.nand: minimum ECC: 4 bits in 512 bytes
[    1.359375] atmel_nand 40000000.nand: Initialize PMECC params, cap: 4, sector: 512
[    1.367187] Bad block table found at page 131008, version 0x01
[    1.375000] Bad block table found at page 130944, version 0x01
[    1.382812] 5 cmdlinepart partitions found on MTD device atmel_nand
[    1.382812] Creating 5 MTD partitions on "atmel_nand":
[    1.390625] 0x000000000000-0x000010000000 : "all"
[    1.398437] 0x000000000000-0x000000020000 : "dtb"
[    1.406250] 0x000000020000-0x000000a00000 : "kernel"
[    1.406250] 0x000000a00000-0x00000ff80000 : "ubi"
[    1.414062] 0x00000ff80000-0x000010000000 : "bbt"
[    1.421875] atmel_spi f0000000.spi: version: 0x212
[    1.429687] atmel_spi f0000000.spi: Using dma0chan0 (tx) and dma0chan1 (rx) for DMA transfers
[    1.437500] atmel_spi f0000000.spi: Atmel SPI Controller at 0xf0000000 (irq 28)
[    1.445312] atmel_spi f0004000.spi: version: 0x212
[    1.453125] atmel_spi f0004000.spi: Using dma1chan0 (tx) and dma1chan1 (rx) for DMA transfers
[    1.460937] atmel_spi f0004000.spi: Atmel SPI Controller at 0xf0004000 (irq 29)
[    1.476562] libphy: MACB_mii_bus: probed
[    1.562500] macb f802c000.ethernet eth0: Cadence MACB at 0xf802c000 irq 31 (00:04:a3:d2:a7:ef)
[    1.570312] macb f802c000.ethernet eth0: attached PHY driver [Davicom DM9161A] (mii_bus:phy_addr=f802c000.etherne:00, irq=-1)
[    1.578125] at91_wdt fffffe40.watchdog: watchdog is disabled
[    1.585937] at91_wdt: probe of fffffe40.watchdog failed with error -22
[    1.593750] TCP: cubic registered
[    1.593750] NET: Registered protocol family 17
[    1.601562] Key type dns_resolver registered
[    4.562500] macb f802c000.ethernet eth0: link up (100/Full)
[    4.593750] Sending DHCP requests ., OK
[    4.632812] IP-Config: Got DHCP answer from 192.168.7.1, my address is 192.168.7.207
[    4.640625] IP-Config: Complete:
[    4.640625]      device=eth0, hwaddr=00:04:a3:d2:a7:ef, ipaddr=192.168.7.207, mask=255.255.255.0, gw=192.168.7.1
[    4.648437]      host=192.168.7.207, domain=, nis-domain=(none)
[    4.656250]      bootserver=192.168.7.1, rootserver=192.168.7.1, rootpath=/nfsroot
[    4.664062]      nameserver0=192.168.1.2
[    4.757812] VFS: Mounted root (nfs filesystem) on device 0:12.
[    4.765625] devtmpfs: mounted
[    4.765625] Freeing unused kernel memory: 116K (c0362000 - c037f000)
[    5.070312] UBIFS error (pid 353): ubifs_mount: cannot open "ubi0:data", error -19
[    7.781250] udevd[468]: starting version 182
[    9.585937] random: dd urandom read with 110 bits of entropy available
[   10.742187] random: nonblocking pool is initialized
# 
