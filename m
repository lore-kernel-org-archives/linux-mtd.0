Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1xj6-0000XR-Ga
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 10:55:00 +0000
Date: Thu, 16 Aug 2012 12:54:45 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: UBI problems on 2nd mount
Message-ID: <20120816105445.GV2232@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, James Nute <newten82@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm on v3.6-rc1 with a few patches, but all unrelated to ubi/ubifs.
I'm experiencing a very similar problem to the one James Nute and Iwo
Mergler reported which resulted in commit c6727932c (included in
v3.6-rc1).

The first boot looks ok, but on the second boot it fails with 

	[   14.843501] UBIFS error (pid 1): replay_log_leb: first CS node at LEB 3:0 has wrong commit number 0 expected 1
	[   14.853626] UBIFS error (pid 1): replay_log_leb: log error detected while replaying the log at LEB 3:0

It doesn't reproduce 100%, I only saw it after issuing $(poweroff) and
then only if that resulted in the error

	[  173.019073] UBI error: ubi_io_write: error -5 while writing 64 bytes to PEB 30:0, written 0 bytes

$(reboot) and just switching off + reenabling the power supply don't
yield this problem.

The same happes if I don't use -F (space_fixup) for mkfs.ubifs.
(Then the two ubifs_assert(!c->space_fixup); in ubifs_write_node are not
hit which I think are a seperate problem.) The kernel panic after power
off is a seperate problem that is triggered because poweroff doesn't
stop the cpu.

A full log of how I wrote the ubi image and two boots is below. The
image is generated using

	mkfs.ubifs -m 1 -e 130944 -c 112 -F

(and without -F) and

	ubinize -s 1 -O 64 -p 131072 -m 1

. mtdinfo -u /dev/mtd3 reports

	mtd3
	Name:                           rootfs
	Type:                           nor
	Eraseblock size:                131072 bytes, 128.0 KiB
	Amount of eraseblocks:          212 (27787264 bytes, 26.5 MiB)
	Minimum input/output unit size: 1 byte
	Sub-page size:                  1 byte
	Character device major/minor:   90:6
	Bad blocks are allowed:         false
	Device is writable:             true
	Default UBI VID header offset:  64
	Default UBI data offset:        128
	Default UBI LEB size:           130944 bytes, 127.9 KiB
	Maximum UBI volumes count:      128

Note that even though the machine has nand, I'm only using the nor part
up to now. I hope I included all relevant data, if not, please ask.

Can someone give a hint how to debug that further or even suggest a
patch? I'm currently in #mtd as ukleinek if you prefer irc for
communication.

Best regards
Uwe

barebox@Phytec phyCORE-i.MX35:/ unprotect /dev/rootfs; erase /dev/rootfs
cfi_protect: unprotect 0xa0580000 (size 27787264)

	[#################################################################]
barebox@Phytec phyCORE-i.MX35:/ cp /mnt/tftp/ukl-root-tralala.ubi /dev/rootfs
phy0: Link is up - 100/Full
DHCP client bound to address 192.168.24.153
barebox@Phytec phyCORE-i.MX35:/ boot
booting Linux kernel with devicetree
Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0
[    0.000000] Linux version 3.6.0-rc1 (ukl@dude) (gcc version 4.6.2 (OSELAS.Toolchain-2011.11.1) ) #1 Tue Aug 14 17:14:57 CEST 2012
[    0.000000] CPU: ARMv6-compatible processor [4117b363] revision 3 (ARMv6TEJ), cr=00c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
[    0.000000] Machine: Freescale i.MX35 (Device Tree Support), model: customer,tralala
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 32768
[    0.000000] free_area_init_node: node 0, pgdat 804e0840, node_mem_map 80a28000
[    0.000000]   Normal zone: 256 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 32512 pages, LIFO batch:7
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
[    0.000000] Kernel command line: console=ttymxc0,115200 earlyprintk ignore_loglevel ip=dhcp root=ubi0:root ubi.mtd=3 rootfstype=ubifs mtdparts=a0000000.nor:0x60000(barebox),0x20000(environment),0x500000(kernel),-(rootfs)
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 128MB = 128MB total
[    0.000000] Memory: 119448k/119448k available, 11624k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0x88800000 - 0xff000000   (1896 MB)
[    0.000000]     lowmem  : 0x80000000 - 0x88000000   ( 128 MB)
[    0.000000]     modules : 0x7f000000 - 0x80000000   (  16 MB)
[    0.000000]       .text : 0x80008000 - 0x80483000   (4588 kB)
[    0.000000]       .init : 0x80483000 - 0x804aca44   ( 167 kB)
[    0.000000]       .data : 0x804ae000 - 0x804e1340   ( 205 kB)
[    0.000000]        .bss : 0x804e1364 - 0x80a27fe4   (5404 kB)
[    0.000000] SLUB: Genslabs=13, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] MXC IRQ initialized
[    0.000000] CPU identified as i.MX35, silicon rev 2.1
[    0.000000] sched_clock: 32 bits at 66MHz, resolution 15ns, wraps every 64585ms
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
[    0.001017] Calibrating delay loop... 353.89 BogoMIPS (lpj=1769472)
[    0.050570] pid_max: default: 32768 minimum: 301
[    0.051337] Mount-cache hash table entries: 512
[    0.063216] CPU: Testing write buffer coherency: ok
[    0.064731] Setting up static identity map for 0x8035e4f8 - 0x8035e530
[    0.071710] devtmpfs: initialized
[    0.077340] pinctrl core: initialized pinctrl subsystem
[    0.080357] regulator-dummy: no parameters
[    0.082611] NET: Registered protocol family 16
[    0.086078] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.089568] L210 cache controller enabled
[    0.089614] l2x0: 8 ways, CACHE_ID 0x4100004b, AUX_CTRL 0x00030024, Cache size: 131072 B
[    0.109724] imx35-pinctrl 43fac000.iomuxc: initialized IMX pinctrl driver
[    0.125707] bio: create slab <bio-0> at 0
[    0.135719] SCSI subsystem initialized
[    0.136385] libata version 3.00 loaded.
[    0.137237] usbcore: registered new interface driver usbfs
[    0.137436] usbcore: registered new interface driver hub
[    0.137824] usbcore: registered new device driver usb
[    0.146404] Advanced Linux Sound Architecture Driver Version 1.0.25.
[    0.148837] Switching to clocksource mxc_timer1
[    0.175342] NET: Registered protocol family 2
[    0.177080] TCP established hash table entries: 4096 (order: 3, 32768 bytes)
[    0.177507] TCP bind hash table entries: 4096 (order: 5, 147456 bytes)
[    0.180772] TCP: Hash tables configured (established 4096 bind 4096)
[    0.180974] TCP: reno registered
[    0.181022] UDP hash table entries: 256 (order: 2, 20480 bytes)
[    0.181469] UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
[    0.182651] NET: Registered protocol family 1
[    0.184179] RPC: Registered named UNIX socket transport module.
[    0.184217] RPC: Registered udp transport module.
[    0.184235] RPC: Registered tcp transport module.
[    0.184253] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.211196] NFS: Registering the id_resolver key type
[    0.211694] Key type id_resolver registered
[    0.211730] Key type id_legacy registered
[    0.211974] msgmni has been set to 233
[    0.215086] io scheduler noop registered (default)
[    0.349029] mx3_sdc_fb mx3_sdc_fb: registered, using mode OSD070T0480-04TS
[    0.367972] Console: switching to colour frame buffer device 100x30
[    0.383452] Serial: IMX driver
[    0.384218] 43f90000.serial: ttymxc0 at MMIO 0x43f90000 (irq = 61) is a IMX
[    0.884379] console [ttymxc0] enabled
[    0.889391] 43f94000.serial: ttymxc1 at MMIO 0x43f94000 (irq = 48) is a IMX
[    0.897164] 5000c000.serial: ttymxc2 at MMIO 0x5000c000 (irq = 34) is a IMX
[    0.917602] loop: module loaded
[    0.921057] at24 0-0052: 4096 byte 24c32 EEPROM, writable, 32 bytes/write
[    0.931171] a0000000.nor: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000089 Chip ID 0x008922
[    0.941352] Intel/Sharp Extended Query Table at 0x010A
[    0.946535] Intel/Sharp Extended Query Table at 0x010A
[    0.951780] Intel/Sharp Extended Query Table at 0x010A
[    0.956961] Intel/Sharp Extended Query Table at 0x010A
[    0.962199] Intel/Sharp Extended Query Table at 0x010A
[    0.967386] Using buffer write method
[    0.971117] Using auto-unlock on power-up/resume
[    0.975748] cfi_cmdset_0001: Erase suspend on write enabled
[    0.981442] erase region 0: offset=0x0,size=0x8000,blocks=4
[    0.987035] erase region 1: offset=0x20000,size=0x20000,blocks=255
[    0.993367] 4 cmdlinepart partitions found on MTD device a0000000.nor
[    0.999894] Creating 4 MTD partitions on "a0000000.nor":
[    1.005238] 0x000000000000-0x000000060000 : "barebox"
[    1.012574] 0x000000060000-0x000000080000 : "environment"
[    1.019117] 0x000000080000-0x000000580000 : "kernel"
[    1.026073] 0x000000580000-0x000002000000 : "rootfs"
[    1.038817] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit), page size: 2048, OOB size: 64
[    1.050318] Scanning device for bad blocks
[    1.156951] Bad eraseblock 91 at 0x000000b60000
[    2.109807] Bad eraseblock 944 at 0x000007600000
[    2.592854] Bad eraseblock 1375 at 0x00000abe0000
[    2.699706] Bad eraseblock 1467 at 0x00000b760000
[    2.708332] Bad eraseblock 1471 at 0x00000b7e0000
[    2.719237] Bad eraseblock 1477 at 0x00000b8a0000
[    2.725636] Bad eraseblock 1479 at 0x00000b8e0000
[    2.732094] Bad eraseblock 1481 at 0x00000b920000
[    2.738493] Bad eraseblock 1483 at 0x00000b960000
[    2.744945] Bad eraseblock 1485 at 0x00000b9a0000
[    2.751404] Bad eraseblock 1487 at 0x00000b9e0000
[    2.757804] Bad eraseblock 1489 at 0x00000ba20000
[    2.772955] Bad eraseblock 1499 at 0x00000bb60000
[    3.543032] Bad eraseblock 2187 at 0x000011160000
[    3.939136] Bad eraseblock 2539 at 0x000013d60000
[    4.204712] Bad eraseblock 2774 at 0x000015ac0000
[    4.438310] Bad eraseblock 2980 at 0x000017480000
[    6.498029] Bad eraseblock 4827 at 0x000025b60000
[    8.906937] Bad eraseblock 6988 at 0x000036980000
[   10.248828] Bad eraseblock 8190 at 0x00003ffc0000
[   10.254174] Bad eraseblock 8191 at 0x00003ffe0000
[   10.262091] UBI: attaching mtd3 to ubi0
[   10.265962] UBI DBG (pid 1): ubi_attach_mtd_dev: sizeof(struct ubi_ainf_peb) 48
[   10.273402] UBI DBG (pid 1): ubi_attach_mtd_dev: sizeof(struct ubi_wl_entry) 20
[   10.280790] UBI DBG (pid 1): io_init: min_io_size      1
[   10.286118] UBI DBG (pid 1): io_init: max_write_size   1024
[   10.291759] UBI DBG (pid 1): io_init: hdrs_min_io_size 1
[   10.297087] UBI DBG (pid 1): io_init: ec_hdr_alsize    64
[   10.302552] UBI DBG (pid 1): io_init: vid_hdr_alsize   64
[   10.307968] UBI DBG (pid 1): io_init: vid_hdr_offset   64
[   10.313431] UBI DBG (pid 1): io_init: vid_hdr_aloffset 64
[   10.318847] UBI DBG (pid 1): io_init: vid_hdr_shift    0
[   10.324223] UBI DBG (pid 1): io_init: leb_start        128
[   10.329777] UBI DBG (pid 1): io_init: max_erroneous    21
[   10.335193] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[   10.341525] UBI: logical eraseblock size:    130944 bytes
[   10.346937] UBI: smallest flash I/O unit:    1
[   10.351459] UBI: VID header offset:          64 (aligned 64)
[   10.357132] UBI: data offset:                128
[   10.369855] UBI DBG (pid 1): scan_all: scanning is finished
[   10.375491] UBI: max. sequence number:       0
[   12.083490] UBI: volume 0 ("root") re-sized from 161 to 208 LEBs
[   12.092144] UBI: attached mtd3 to ubi0
[   12.095922] UBI: MTD device name:            "rootfs"
[   12.101091] UBI: MTD device size:            26 MiB
[   12.105985] UBI: number of good PEBs:        212
[   12.110678] UBI: number of bad PEBs:         0
[   12.115138] UBI: number of corrupted PEBs:   0
[   12.119648] UBI: max. allowed volumes:       128
[   12.124280] UBI: wear-leveling threshold:    4096
[   12.129051] UBI: number of internal volumes: 1
[   12.133509] UBI: number of user volumes:     1
[   12.137965] UBI: available PEBs:             0
[   12.142474] UBI: total number of reserved PEBs: 212
[   12.147366] UBI: number of PEBs reserved for bad PEB handling: 0
[   12.153439] UBI: max/mean erase counter: 1/0
[   12.157725] UBI: image sequence number:  1735142338
[   12.162827] UBI: background thread "ubi_bgt0d" started, PID 37
[   12.171440] spi_imx 43fa4000.cspi: master is unqueued, this is deprecated
[   12.181923] spi_imx 43fa4000.cspi: probed
[   12.186475] CAN device driver interface
[   12.193184] flexcan 53fe4000.can: device registered (reg_base=f57e4000, irq=59)
[   12.202730] flexcan 53fe8000.can: device registered (reg_base=f57e8000, irq=60)
[   12.221214] libphy: fec_enet_mii_bus: probed
[   12.227306] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   12.234164] Initializing USB Mass Storage driver...
[   12.239356] usbcore: registered new interface driver usb-storage
[   12.245377] USB Mass Storage support registered.
[   12.250470] rtc-pcf8563 0-0051: chip found, driver version 0.4.3
[   12.261076] rtc-pcf8563 0-0051: rtc core: registered rtc-pcf8563 as rtc0
[   12.267973] i2c /dev entries driver
[   12.275116] lm75 0-004a: hwmon0: sensor 'ds75'
[   12.280867] usbcore: registered new interface driver usbhid
[   12.286461] usbhid: USB HID core driver
[   12.293713] TCP: cubic registered
[   12.297076] NET: Registered protocol family 17
[   12.301724] can: controller area network core (rev 20120528 abi 9)
[   12.308190] NET: Registered protocol family 29
[   12.313385] Key type dns_resolver registered
[   12.317889] VFP support v0.3: implementor 41 architecture 1 part 20 variant b rev 3
[   12.333668] rtc-pcf8563 0-0051: setting system clock to 2012-08-16 09:42:29 UTC (1345110149)
[   12.368808] eth0: Freescale FEC PHY driver [Generic PHY] (mii_bus:phy_addr=50038000.fec-1:00, irq=-1)
[   14.829888] libphy: 50038000.fec-1:00 - Link is Up - 100/Full
[   14.869065] Sending DHCP requests ., OK
[   14.889511] IP-Config: Got DHCP answer from 192.168.23.4, my address is 192.168.24.153
[   14.899442] IP-Config: Complete:
[   14.902710]      device=eth0, addr=192.168.24.153, mask=255.255.0.0, gw=192.168.1.1
[   14.910480]      host=192.168.24.153, domain=lab.pengutronix.de, nis-domain=(none)
[   14.918070]      bootserver=192.168.23.4, rootserver=192.168.23.4, rootpath=
[   14.925215] ALSA device list:
[   14.928196]   No soundcards found.
[   15.092442] UBIFS: mounted UBI device 0, volume 0, name "root"
[   15.098308] UBIFS: mounted read-only
[   15.102028] UBIFS: file system size:   13356288 bytes (13043 KiB, 12 MiB, 102 LEBs)
[   15.109768] UBIFS: journal size:       2226048 bytes (2173 KiB, 2 MiB, 17 LEBs)
[   15.117095] UBIFS: media format:       w4/r0 (latest is w4/r0)
[   15.122999] UBIFS: default compressor: lzo
[   15.127112] UBIFS: reserved for root:  0 bytes (0 KiB)
[   15.132322] UBIFS DBG (pid 1): mount_ubifs: compiled on:         Aug 14 2012 at 17:14:47
[   15.140486] UBIFS DBG (pid 1): mount_ubifs: min. I/O unit size:  8 bytes
[   15.147205] UBIFS DBG (pid 1): mount_ubifs: max. write size:     1024 bytes
[   15.154239] UBIFS DBG (pid 1): mount_ubifs: LEB size:            130944 bytes (127 KiB)
[   15.162311] UBIFS DBG (pid 1): mount_ubifs: data journal heads:  1
[   15.168517] UBIFS DBG (pid 1): mount_ubifs: UUID:                8BBB8972-BB22-4525-90BF-AB2F80E4A7B8
[   15.177806] UBIFS DBG (pid 1): mount_ubifs: big_lpt              0
[   15.184059] UBIFS DBG (pid 1): mount_ubifs: log LEBs:            4 (3 - 6)
[   15.191005] UBIFS DBG (pid 1): mount_ubifs: LPT area LEBs:       2 (7 - 8)
[   15.197900] UBIFS DBG (pid 1): mount_ubifs: orphan area LEBs:    1 (9 - 9)
[   15.204847] UBIFS DBG (pid 1): mount_ubifs: main area LEBs:      102 (10 - 111)
[   15.212224] UBIFS DBG (pid 1): mount_ubifs: index LEBs:          2
[   15.218427] UBIFS DBG (pid 1): mount_ubifs: total index bytes:   144408 (141 KiB, 0 MiB)
[   15.226587] UBIFS DBG (pid 1): mount_ubifs: key hash type:       0
[   15.232836] UBIFS DBG (pid 1): mount_ubifs: tree fanout:         8
[   15.239087] UBIFS DBG (pid 1): mount_ubifs: reserved GC LEB:     72
[   15.245371] UBIFS DBG (pid 1): mount_ubifs: first main LEB:      10
[   15.251710] UBIFS DBG (pid 1): mount_ubifs: max. znode size      240
[   15.258081] UBIFS DBG (pid 1): mount_ubifs: max. index node size 192
[   15.264508] UBIFS DBG (pid 1): mount_ubifs: node sizes:          data 48, inode 160, dentry 56
[   15.273192] UBIFS DBG (pid 1): mount_ubifs: node sizes:          trun 56, sb 4096, master 512
[   15.281833] UBIFS DBG (pid 1): mount_ubifs: node sizes:          ref 64, cmt. start 32, orph 32
[   15.290618] UBIFS DBG (pid 1): mount_ubifs: max. node sizes:     data 4144, inode 4256 dentry 312, idx 188
[   15.300345] UBIFS DBG (pid 1): mount_ubifs: dead watermark:      56
[   15.306629] UBIFS DBG (pid 1): mount_ubifs: dark watermark:      4256
[   15.313143] UBIFS DBG (pid 1): mount_ubifs: LEB overhead:        2480
[   15.319659] UBIFS DBG (pid 1): mount_ubifs: max. dark space:     434112 (423 KiB, 0 MiB)
[   15.327770] UBIFS DBG (pid 1): mount_ubifs: maximum bud bytes:   1702272 (1662 KiB, 1 MiB)
[   15.336114] UBIFS DBG (pid 1): mount_ubifs: BG commit bud bytes: 1383096 (1350 KiB, 1 MiB)
[   15.344454] UBIFS DBG (pid 1): mount_ubifs: current bud bytes    0 (0 KiB, 0 MiB)
[   15.352007] UBIFS DBG (pid 1): mount_ubifs: max. seq. number:    6876
[   15.358465] UBIFS DBG (pid 1): mount_ubifs: commit number:       0
[   15.366857] VFS: Mounted root (ubifs filesystem) readonly on device 0:11.
[   15.375703] devtmpfs: mounted
[   15.379554] Freeing init memory: 164K

Welcome to PTXdist / Customer-Tralala!

Starting Runtime Directory...                                                  
Starting File System Check on Root Device...                                   
Starting Remount API VFS...                                                    
Starting Media Directory...                                                    
Started Runtime Directory                                              [  OK  ]
Started File System Check on Root Device                               [  OK  ]
Started Remount API VFS                                                [  OK  ]
Started Media Directory                                                [  OK  ]
Starting Remount Root FS...                                                    
Starting Journal Service...                                                    
Started Journal Service                                                [  OK  ]
Started Remount Root FS                                                [  OK  ]
Starting /tmp...                                                               
Starting /var/log...                                                           
Starting /var/lock...                                                          
Starting /var/tmp...                                                           
Started /var/lock                                                      [  OK  ]
Started /var/log                                                       [  OK  ]
Started /tmp                                                           [  OK  ]
Started /var/tmp                                                       [  OK  ]
Starting First boot services...                                                
[   17.191392] UBIFS assert failed in ubifs_write_node at 869 (pid 73)
[   17.197691] Backtrace: 
[   17.200690] [<80010e64>] (dump_backtrace+0x0/0x10c) from [<80357cec>] (dump_stack+0x18/0x1c)
[   17.209224]  r6:00000001 r5:87ba7c00 r4:87827000 r3:87065e80
[   17.215020] [<80357cd4>] (dump_stack+0x0/0x1c) from [<8013ca24>] (ubifs_write_node+0x184/0x1c8)
[   17.223838] [<8013c8a0>] (ubifs_write_node+0x0/0x1c8) from [<80142ae8>] (ubifs_write_master+0xbc/0x138)
[   17.233334] [<80142a2c>] (ubifs_write_master+0x0/0x138) from [<801366e4>] (ubifs_remount_fs+0x5c8/0x7e4)
[   17.242895]  r5:00000000 r4:87827000
[   17.246559] [<8013611c>] (ubifs_remount_fs+0x0/0x7e4) from [<8009f638>] (do_remount_sb+0xac/0x15c)
[   17.255632] [<8009f58c>] (do_remount_sb+0x0/0x15c) from [<800ba540>] (do_mount+0x5e4/0x724)
[   17.264066]  r7:00000000 r6:00000000 r5:00000000 r4:00000020
[   17.269903] [<800b9f5c>] (do_mount+0x0/0x724) from [<800ba70c>] (sys_mount+0x8c/0xcc)
[   17.277770] [<800ba680>] (sys_mount+0x0/0xcc) from [<8000e080>] (ret_fast_syscall+0x0/0x3c)
[   17.286235]  r7:00000015 r6:76fac4d0 r5:7ebbecb0 r4:00000000
[   17.301110] UBIFS assert failed in ubifs_write_node at 869 (pid 73)
[   17.307406] Backtrace: 
[   17.310039] [<80010e64>] (dump_backtrace+0x0/0x10c) from [<80357cec>] (dump_stack+0x18/0x1c)
[   17.318496]  r6:00000002 r5:87ba7c00 r4:87827000 r3:87065e80
[   17.324366] [<80357cd4>] (dump_stack+0x0/0x1c) from [<8013ca24>] (ubifs_write_node+0x184/0x1c8)
[   17.333180] [<8013c8a0>] (ubifs_write_node+0x0/0x1c8) from [<80142b24>] (ubifs_write_master+0xf8/0x138)
[   17.342685] [<80142a2c>] (ubifs_write_master+0x0/0x138) from [<801366e4>] (ubifs_remount_fs+0x5c8/0x7e4)
[   17.352248]  r5:00000000 r4:87827000
[   17.355909] [<8013611c>] (ubifs_remount_fs+0x0/0x7e4) from [<8009f638>] (do_remount_sb+0xac/0x15c)
[   17.364980] [<8009f58c>] (do_remount_sb+0x0/0x15c) from [<800ba540>] (do_mount+0x5e4/0x724)
[   17.373411]  r7:00000000 r6:00000000 r5:00000000 r4:00000020
[   17.379252] [<800b9f5c>] (do_mount+0x0/0x724) from [<800ba70c>] (sys_mount+0x8c/0xcc)
[   17.387118] [<800ba680>] (sys_mount+0x0/0xcc) from [<8000e080>] (ret_fast_syscall+0x0/0x3c)
[   17.395551]  r7:00000015 r6:76fac4d0 r5:7ebbecb0 r4:00000000
[   17.412203] UBIFS: start fixing up free space
[   17.421704] UBIFS DBG (pid 74): ubifs_bg_thread: background thread "ubifs_bgt0_0" started, PID 74
[   97.452094] UBIFS: free space fixup complete
systemd-rc-once[71]: remounting root rw...done
systemd-rc-once[71]: running rc.once.d services...
systemd-rc-once[71]: generating rsa key...done
systemd-rc-once[71]: generating dsa key...done
[  107.049158] UBIFS DBG (pid 74): ubifs_bg_thread: background thread "ubifs_bgt0_0" stops
systemd-rc-once[71]: remounting root ro...done
[  107.409585] udevd[99]: starting version 182

tralala login: root
root@tralala:~ poweroff
Stopping D-Bus System Message Bus...                                           
Stopping Getty on tty1...                                                      
Stopping Serial Ǧ�Stopping Login Service...                                                      
Stopping Handle network interface with ifup/ifdown...                          
Stopped D-Bus System Message Bus                                       [  OK  ]
Stopped Login Service                                                  [  OK  ]
Stopped Serial Getty on ttymxc0                                        [  OK  ]
Stopped Getty on tty1                                                  [  OK  ]
Stopping Permit User Sessions...                                               
Stopped Permit User Sessions                                           [  OK  ]
Stopped Handle network interface with ifup/ifdown                      [  OK  ]
Stopping Mark kernel activated network interfaces as up...                     
Stopped Mark kernel activated network interfaces as up                 [  OK  ]
Stopping Debug File System...                                                  
Starting Notify Audit System and Update UTMP about System Shutdown...          
Stopping /tmp...                                                               
Stopping /var/log...                                                           
Stopping Runtime Directory...                                                  
Stopping /var/lock...                                                          
Stopping /var/tmp...                                                           
Stopping Media Directory...                                                    
Stopped Debug File System                                              [  OK  ]
Stopped /tmp                                                           [  OK  ]
Stopped /var/log                                                       [  OK  ]
Stopped Runtime Directory                                              [  OK  ]
Stopped /var/lock                                                      [  OK  ]
Stopped /var/tmp                                                       [  OK  ]
Stopped Media Directory                                                [  OK  ]
Stopping Remount API VFS...                                                    
Stopped Remount API VFS                                                [  OK  ]
Stopping Remount Root FS...                                                    
Stopped Remount Root FS                                                [  OK  ]
Sending SIGTERM to remaining processes...
Sending SIGKILL to remaining processes...
Unmounting file systems.
Disabling swaps.
Detaching loop devices.
Detaching DM devices.
[  173.011445] Power down.
[  173.013931] disable self powering
[  173.019073] UBI error: ubi_io_write: error -5 while writing 64 bytes to PEB 30:0, written 0 bytes
[  173.027967] Backtrace: 
[  173.030578] [<80010e64>] (dump_backtrace+0x0/0x10c) from [<80357cec>] (dump_stack+0x18/0x1c)
[  173.039102]  r6:003c0000 r5:00000000 r4:87970800 r3:8790a620
[  173.044896] [<80357cd4>] (dump_stack+0x0/0x1c) from [<80241cc0>] (ubi_io_write+0x504/0x67c)
[  173.053346] [<802417bc>] (ubi_io_write+0x0/0x67c) from [<802420a0>] (ubi_io_write_ec_hdr+0x124/0x180)
[  173.062661] [<80241f7c>] (ubi_io_write_ec_hdr+0x0/0x180) from [<80242c5c>] (erase_worker+0x1c8/0x63c)
[  173.071953]  r6:87970800 r5:00000000 r4:00000000
[  173.076669] [<80242a94>] (erase_worker+0x0/0x63c) from [<8024316c>] (do_work+0x9c/0x124)
[  173.084886] [<802430d0>] (do_work+0x0/0x124) from [<802441f0>] (ubi_thread+0xc4/0x164)
[  173.092876]  r7:87970dcc r6:87970db8 r5:87b96000 r4:87970800
[  173.098664] [<8024412c>] (ubi_thread+0x0/0x164) from [<80037998>] (kthread+0x90/0x9c)
[  173.106592] [<80037908>] (kthread+0x0/0x9c) from [<8001fe98>] (do_exit+0x0/0x720)
[  173.114149]  r6:8001fe98 r5:80037908 r4:87843e70
[  173.126771] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
[  173.126771] 
[  173.135934] Backtrace: 
[  173.138464] [<80010e64>] (dump_backtrace+0x0/0x10c) from [<80357cec>] (dump_stack+0x18/0x1c)
[  173.146917]  r6:4321fedc r5:804bc2e8 r4:804e18a8 r3:00000001
[  173.152681] [<80357cd4>] (dump_stack+0x0/0x1c) from [<80357e04>] (panic+0x98/0x1e8)
[  173.160369] [<80357d6c>] (panic+0x0/0x1e8) from [<800204c4>] (do_exit+0x62c/0x720)
[  173.167950]  r3:87848000 r2:00000000 r1:00000000 r0:80411ef8
[  173.173698]  r7:87844000
[  173.176286] [<8001fe98>] (do_exit+0x0/0x720) from [<8002da50>] (sys_reboot+0x128/0x1c0)
[  173.184302]  r7:45584543
[  173.186885] [<8002d928>] (sys_reboot+0x0/0x1c0) from [<8000e080>] (ret_fast_syscall+0x0/0x3c)
[  173.195421]  r7:00000058 r6:00000000 r5:00000000 r4:00000000


barebox 2012.08.0 #1 Mon Aug 6 15:51:06 CEST 2012


Board: Phytec phyCORE-i.MX35
NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit)
Bad block table found at page 524224, version 0x01
Bad block table found at page 524160, version 0x01
nand_read_bbt: Bad block at 0x00b60000
nand_read_bbt: Bad block at 0x07600000
nand_read_bbt: Bad block at 0x0abe0000
nand_read_bbt: Bad block at 0x0b760000
nand_read_bbt: Bad block at 0x0b7e0000
nand_read_bbt: Bad block at 0x0b8a0000
nand_read_bbt: Bad block at 0x0b8e0000
nand_read_bbt: Bad block at 0x0b920000
nand_read_bbt: Bad block at 0x0b960000
nand_read_bbt: Bad block at 0x0b9a0000
nand_read_bbt: Bad block at 0x0b9e0000
nand_read_bbt: Bad block at 0x0ba20000
nand_read_bbt: Bad block at 0x0bb60000
nand_read_bbt: Bad block at 0x11160000
nand_read_bbt: Bad block at 0x13d60000
nand_read_bbt: Bad block at 0x15ac0000
nand_read_bbt: Bad block at 0x17480000
nand_read_bbt: Bad block at 0x25b60000
nand_read_bbt: Bad block at 0x36980000
cfi_flash@cfi_flash0: found cfi flash at a0000000, size 33554432
cfi_protect: protect 0xa0060000 (size 131072)

Malloc space: 0x86e00000 -> 0x87dfffff (size 16 MB)
Stack space : 0x86df8000 -> 0x86e00000 (size 32 kB)
running /env/bin/init...

Hit any key to stop autoboot:  0
phy0: Link is up - 100/Full
DHCP client bound to address 192.168.24.153
booting Linux kernel with devicetree
Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0
[    0.000000] Linux version 3.6.0-rc1 (ukl@dude) (gcc version 4.6.2 (OSELAS.Toolchain-2011.11.1) ) #1 Tue Aug 14 17:14:57 CEST 2012
[    0.000000] CPU: ARMv6-compatible processor [4117b363] revision 3 (ARMv6TEJ), cr=00c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
[    0.000000] Machine: Freescale i.MX35 (Device Tree Support), model: customer,tralala
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 32768
[    0.000000] free_area_init_node: node 0, pgdat 804e0840, node_mem_map 80a28000
[    0.000000]   Normal zone: 256 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 32512 pages, LIFO batch:7
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
[    0.000000] Kernel command line: console=ttymxc0,115200 earlyprintk ignore_loglevel ip=dhcp root=ubi0:root ubi.mtd=3 rootfstype=ubifs mtdparts=a0000000.nor:0x60000(barebox),0x20000(environment),0x500000(kernel),-(rootfs)
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 128MB = 128MB total
[    0.000000] Memory: 119448k/119448k available, 11624k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0x88800000 - 0xff000000   (1896 MB)
[    0.000000]     lowmem  : 0x80000000 - 0x88000000   ( 128 MB)
[    0.000000]     modules : 0x7f000000 - 0x80000000   (  16 MB)
[    0.000000]       .text : 0x80008000 - 0x80483000   (4588 kB)
[    0.000000]       .init : 0x80483000 - 0x804aca44   ( 167 kB)
[    0.000000]       .data : 0x804ae000 - 0x804e1340   ( 205 kB)
[    0.000000]        .bss : 0x804e1364 - 0x80a27fe4   (5404 kB)
[    0.000000] SLUB: Genslabs=13, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] MXC IRQ initialized
[    0.000000] CPU identified as i.MX35, silicon rev 2.1
[    0.000000] sched_clock: 32 bits at 66MHz, resolution 15ns, wraps every 64585ms
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
[    0.001025] Calibrating delay loop... 353.89 BogoMIPS (lpj=1769472)
[    0.050576] pid_max: default: 32768 minimum: 301
[    0.051342] Mount-cache hash table entries: 512
[    0.063172] CPU: Testing write buffer coherency: ok
[    0.064678] Setting up static identity map for 0x8035e4f8 - 0x8035e530
[    0.071672] devtmpfs: initialized
[    0.077341] pinctrl core: initialized pinctrl subsystem
[    0.080409] regulator-dummy: no parameters
[    0.082650] NET: Registered protocol family 16
[    0.086122] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.089658] L210 cache controller enabled
[    0.089703] l2x0: 8 ways, CACHE_ID 0x4100004b, AUX_CTRL 0x00030024, Cache size: 131072 B
[    0.109808] imx35-pinctrl 43fac000.iomuxc: initialized IMX pinctrl driver
[    0.125818] bio: create slab <bio-0> at 0
[    0.135827] SCSI subsystem initialized
[    0.136495] libata version 3.00 loaded.
[    0.137347] usbcore: registered new interface driver usbfs
[    0.137549] usbcore: registered new interface driver hub
[    0.137937] usbcore: registered new device driver usb
[    0.146489] Advanced Linux Sound Architecture Driver Version 1.0.25.
[    0.148912] Switching to clocksource mxc_timer1
[    0.175485] NET: Registered protocol family 2
[    0.177216] TCP established hash table entries: 4096 (order: 3, 32768 bytes)
[    0.177645] TCP bind hash table entries: 4096 (order: 5, 147456 bytes)
[    0.180913] TCP: Hash tables configured (established 4096 bind 4096)
[    0.181116] TCP: reno registered
[    0.181166] UDP hash table entries: 256 (order: 2, 20480 bytes)
[    0.181613] UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
[    0.182796] NET: Registered protocol family 1
[    0.184325] RPC: Registered named UNIX socket transport module.
[    0.184361] RPC: Registered udp transport module.
[    0.184381] RPC: Registered tcp transport module.
[    0.184399] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.211316] NFS: Registering the id_resolver key type
[    0.211814] Key type id_resolver registered
[    0.211850] Key type id_legacy registered
[    0.212102] msgmni has been set to 233
[    0.215211] io scheduler noop registered (default)
[    0.349104] mx3_sdc_fb mx3_sdc_fb: registered, using mode OSD070T0480-04TS
[    0.368043] Console: switching to colour frame buffer device 100x30
[    0.383472] Serial: IMX driver
[    0.384242] 43f90000.serial: ttymxc0 at MMIO 0x43f90000 (irq = 61) is a IMX
[    0.884390] console [ttymxc0] enabled
[    0.889403] 43f94000.serial: ttymxc1 at MMIO 0x43f94000 (irq = 48) is a IMX
[    0.897180] 5000c000.serial: ttymxc2 at MMIO 0x5000c000 (irq = 34) is a IMX
[    0.917605] loop: module loaded
[    0.921061] at24 0-0052: 4096 byte 24c32 EEPROM, writable, 32 bytes/write
[    0.931191] a0000000.nor: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000089 Chip ID 0x008922
[    0.941370] Intel/Sharp Extended Query Table at 0x010A
[    0.946555] Intel/Sharp Extended Query Table at 0x010A
[    0.951800] Intel/Sharp Extended Query Table at 0x010A
[    0.956980] Intel/Sharp Extended Query Table at 0x010A
[    0.962218] Intel/Sharp Extended Query Table at 0x010A
[    0.967404] Using buffer write method
[    0.971134] Using auto-unlock on power-up/resume
[    0.975765] cfi_cmdset_0001: Erase suspend on write enabled
[    0.981459] erase region 0: offset=0x0,size=0x8000,blocks=4
[    0.987052] erase region 1: offset=0x20000,size=0x20000,blocks=255
[    0.993384] 4 cmdlinepart partitions found on MTD device a0000000.nor
[    0.999916] Creating 4 MTD partitions on "a0000000.nor":
[    1.005259] 0x000000000000-0x000000060000 : "barebox"
[    1.012590] 0x000000060000-0x000000080000 : "environment"
[    1.019132] 0x000000080000-0x000000580000 : "kernel"
[    1.026102] 0x000000580000-0x000002000000 : "rootfs"
[    1.039074] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit), page size: 2048, OOB size: 64
[    1.050546] Scanning device for bad blocks
[    1.157087] Bad eraseblock 91 at 0x000000b60000
[    2.110355] Bad eraseblock 944 at 0x000007600000
[    2.593728] Bad eraseblock 1375 at 0x00000abe0000
[    2.700508] Bad eraseblock 1467 at 0x00000b760000
[    2.709152] Bad eraseblock 1471 at 0x00000b7e0000
[    2.720037] Bad eraseblock 1477 at 0x00000b8a0000
[    2.726441] Bad eraseblock 1479 at 0x00000b8e0000
[    2.732894] Bad eraseblock 1481 at 0x00000b920000
[    2.739309] Bad eraseblock 1483 at 0x00000b960000
[    2.745710] Bad eraseblock 1485 at 0x00000b9a0000
[    2.752160] Bad eraseblock 1487 at 0x00000b9e0000
[    2.758544] Bad eraseblock 1489 at 0x00000ba20000
[    2.773687] Bad eraseblock 1499 at 0x00000bb60000
[    3.543762] Bad eraseblock 2187 at 0x000011160000
[    3.939702] Bad eraseblock 2539 at 0x000013d60000
[    4.205127] Bad eraseblock 2774 at 0x000015ac0000
[    4.438608] Bad eraseblock 2980 at 0x000017480000
[    6.498102] Bad eraseblock 4827 at 0x000025b60000
[    8.906674] Bad eraseblock 6988 at 0x000036980000
[   10.248158] Bad eraseblock 8190 at 0x00003ffc0000
[   10.253504] Bad eraseblock 8191 at 0x00003ffe0000
[   10.261456] UBI: attaching mtd3 to ubi0
[   10.265327] UBI DBG (pid 1): ubi_attach_mtd_dev: sizeof(struct ubi_ainf_peb) 48
[   10.272763] UBI DBG (pid 1): ubi_attach_mtd_dev: sizeof(struct ubi_wl_entry) 20
[   10.280151] UBI DBG (pid 1): io_init: min_io_size      1
[   10.285482] UBI DBG (pid 1): io_init: max_write_size   1024
[   10.291122] UBI DBG (pid 1): io_init: hdrs_min_io_size 1
[   10.296451] UBI DBG (pid 1): io_init: ec_hdr_alsize    64
[   10.301916] UBI DBG (pid 1): io_init: vid_hdr_alsize   64
[   10.307332] UBI DBG (pid 1): io_init: vid_hdr_offset   64
[   10.312796] UBI DBG (pid 1): io_init: vid_hdr_aloffset 64
[   10.318211] UBI DBG (pid 1): io_init: vid_hdr_shift    0
[   10.323588] UBI DBG (pid 1): io_init: leb_start        128
[   10.329142] UBI DBG (pid 1): io_init: max_erroneous    21
[   10.334558] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[   10.340889] UBI: logical eraseblock size:    130944 bytes
[   10.346302] UBI: smallest flash I/O unit:    1
[   10.350810] UBI: VID header offset:          64 (aligned 64)
[   10.356483] UBI: data offset:                128
[   11.839536] UBI DBG (pid 1): scan_all: scanning is finished
[   11.845217] UBI: max. sequence number:       71
[   11.867872] UBI: attached mtd3 to ubi0
[   11.871775] UBI: MTD device name:            "rootfs"
[   11.876847] UBI: MTD device size:            26 MiB
[   11.881796] UBI: number of good PEBs:        212
[   11.886428] UBI: number of bad PEBs:         0
[   11.890935] UBI: number of corrupted PEBs:   0
[   11.895395] UBI: max. allowed volumes:       128
[   11.900074] UBI: wear-leveling threshold:    4096
[   11.904793] UBI: number of internal volumes: 1
[   11.909299] UBI: number of user volumes:     1
[   11.913757] UBI: available PEBs:             0
[   11.918212] UBI: total number of reserved PEBs: 212
[   11.923160] UBI: number of PEBs reserved for bad PEB handling: 0
[   11.929231] UBI: max/mean erase counter: 1/0
[   11.933518] UBI: image sequence number:  1735142338
[   11.938559] UBI: background thread "ubi_bgt0d" started, PID 37
[   11.947447] spi_imx 43fa4000.cspi: master is unqueued, this is deprecated
[   11.957570] spi_imx 43fa4000.cspi: probed
[   11.962242] CAN device driver interface
[   11.968816] flexcan 53fe4000.can: device registered (reg_base=f57e4000, irq=59)
[   11.978390] flexcan 53fe8000.can: device registered (reg_base=f57e8000, irq=60)
[   11.996976] libphy: fec_enet_mii_bus: probed
[   12.003153] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   12.010014] Initializing USB Mass Storage driver...
[   12.015135] usbcore: registered new interface driver usb-storage
[   12.021227] USB Mass Storage support registered.
[   12.026268] rtc-pcf8563 0-0051: chip found, driver version 0.4.3
[   12.036908] rtc-pcf8563 0-0051: rtc core: registered rtc-pcf8563 as rtc0
[   12.043906] i2c /dev entries driver
[   12.051019] lm75 0-004a: hwmon0: sensor 'ds75'
[   12.056680] usbcore: registered new interface driver usbhid
[   12.062369] usbhid: USB HID core driver
[   12.069757] TCP: cubic registered
[   12.073122] NET: Registered protocol family 17
[   12.077650] can: controller area network core (rev 20120528 abi 9)
[   12.084197] NET: Registered protocol family 29
[   12.089365] Key type dns_resolver registered
[   12.093869] VFP support v0.3: implementor 41 architecture 1 part 20 variant b rev 3
[   12.109554] rtc-pcf8563 0-0051: setting system clock to 2012-08-16 09:45:50 UTC (1345110350)
[   12.144860] eth0: Freescale FEC PHY driver [Generic PHY] (mii_bus:phy_addr=50038000.fec-1:00, irq=-1)
[   14.609980] libphy: 50038000.fec-1:00 - Link is Up - 100/Full
[   14.649094] Sending DHCP requests ., OK
[   14.669536] IP-Config: Got DHCP answer from 192.168.23.4, my address is 192.168.24.153
[   14.679954] IP-Config: Complete:
[   14.683227]      device=eth0, addr=192.168.24.153, mask=255.255.0.0, gw=192.168.1.1
[   14.690988]      host=192.168.24.153, domain=lab.pengutronix.de, nis-domain=(none)
[   14.698578]      bootserver=192.168.23.4, rootserver=192.168.23.4, rootpath=
[   14.705721] ALSA device list:
[   14.708702]   No soundcards found.
[   14.843501] UBIFS error (pid 1): replay_log_leb: first CS node at LEB 3:0 has wrong commit number 0 expected 1
[   14.853626] UBIFS error (pid 1): replay_log_leb: log error detected while replaying the log at LEB 3:0
[   14.863172] 	magic          0x6101831
[   14.866855] 	crc            0xe26e6243
[   14.870697] 	node_type      10 (commit start node)
[   14.875507] 	group_type     0 (no node group)
[   14.879981] 	sqnum          6876
[   14.883224] 	len            32
[   14.888383] List of all partitions:
[   14.892023] No filesystem could mount root, tried:  ubifs
[   14.897590] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[   14.905870] Backtrace: 
[   14.908398] [<80010e64>] (dump_backtrace+0x0/0x10c) from [<80357cec>] (dump_stack+0x18/0x1c)
[   14.916851]  r6:804a3088 r5:87823006 r4:804e18a8 r3:00000001
[   14.922614] [<80357cd4>] (dump_stack+0x0/0x1c) from [<80357e04>] (panic+0x98/0x1e8)
[   14.930303] [<80357d6c>] (panic+0x0/0x1e8) from [<80483db0>] (mount_block_root+0x1f0/0x234)
[   14.938665]  r3:87843f1c r2:00000000 r1:87843f50 r0:8040e2f0
[   14.944413]  r7:00008001
[   14.946992] [<80483bc0>] (mount_block_root+0x0/0x234) from [<80483f9c>] (prepare_namespace+0x94/0x194)
[   14.956325] [<80483f08>] (prepare_namespace+0x0/0x194) from [<80483994>] (kernel_init+0x174/0x1b0)
[   14.965294]  r5:00000007 r4:804a3080
[   14.968940] [<80483820>] (kernel_init+0x0/0x1b0) from [<8001fe98>] (do_exit+0x0/0x720)




-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
