Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAD7ECAAA1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Subject:To:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=AeJRpeLT6F2vQBreECka3muKsCwJGNCp2bEcxUJcFLw=; b=JV8
	vIRUmJVfeMPllFE7R0DvzRXo46kIcbsUIMenMYb3ZcA3poaKw2TLyWxwFrLABp4ipfiFGgQJdjcmb
	aTD0U8CgtljTFoi8KaC1jYLFjJsWtOPkc+hu6X+Cuzu76d9no83BK3KyDCcT2ezgkUhwMXetnCwwX
	QNjv6XmnRbtIMfUVfXuC8GsfpKWdiwUHeKIOMrimneJCniPXzR+GpLyVFnhFEXeOt+v2+ktAA/CZ1
	WilKGLj3kh9IJFc6QwQlr0Fvbdqypc2Z+AXTg+za3Ji7zZvheiTCJH+yjPhcOyMRrnyn9Evy2SNWV
	sB80GUf3zPg6o3KhmEPjmeMQX8tsXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT06U-00GkHJ-C7; Tue, 30 Aug 2022 12:12:26 +0000
Received: from outbound.soverin.net ([2a10:de80:1:4091:b9e9:2215:0:1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT06N-00GkCD-Mi
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2022 12:12:24 +0000
Received: from smtp.freedom.nl (c04smtp-lb01.int.sover.in [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4MH5lg2hYrz85
	for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 12:12:15 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=zevv.nl; s=soverin;
	t=1661861534; bh=iRMR+aU5w6WEsZyxi/XN4B7AJYHEF9SFZdSdVdg7mUo=;
	h=From:To:Subject:Date:From;
	b=rQwsqdceyv1fzVCISHWhgvKbwdQKy52sshaw84J3Ey6YbOn5dc3/qrc+KHprV7VAM
	 iBZiUZfYNQCZbwNRk4NwKveYVOI/koCFdWTF+0vMKQ9zDCkWsHyi7tm7nO0un1eIMC
	 WNSfsMorPXg11+PH6bGK6bY6dDx/OY+EZn0eLRrJRVF7pFvoJ7xueGuSvZS6e9HUq9
	 FTyuklPK2+3Rna0RlfB/lyiwDUFiQxorfT+w7o5W3qSPWNW9O+BKBjfF2YEza1jeoO
	 Xc5VAYXo0fyeVfxtO808ZlaCPNryZkY9S27GNpP7HlHCS/j4rsRjHfth83H0B37jBM
	 BAWpq29OgcF6w==
MIME-Version: 1.0
From: Ico Doornekamp <mtd@zevv.nl>
To: linux-mtd@lists.infradead.org
Subject: UBI: corruption at LEB
Date: Tue, 30 Aug 2022 14:12:12 +0200
Message-ID: <166186153239.123383.9101950599949599414@mdoos>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_051220_553023_A7EE5A58 
X-CRM114-Status: GOOD (  22.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

We have several thousand deloyed devices in the field, one of which
recently showed UBI errors at boot time. I'm not sure about the root
cause of this problem, so I would like to understand this if this is
likely to affect other units in the future too.

The problem shows first time during booting like this:

  UBIFS: recovery needed
  UBIFS error (pid 56): ubifs_recover_leb: corruption -3
  UBIFS error (pid 56): ubifs_scanned_corruption: corruption at LEB 524:37888
  UBIFS error (pid 56): ubifs_scanned_corruption: first 8192 bytes from LEB 524:37888

We tried copying the corrupt partition to a PC and fix/mount this using
nandsim, but no success with this yet.

We are now more or less tied to a rather old kernel version (3.7.1), which is
often the case on embedded systems.


Any insights on the cause of this problem are much appreciated, also if there
is a possible path to recovery.

Thank you,

Zevv


[    0.000000] Booting Linux on physical CPU 0
[    0.000000] Linux version 3.7.1-svn3676 (rodney@HP-linux) (gcc version 4.6.1 (Sourcery CodeBench Lite 2011.09-70) ) #11 Fri Dec 18 10:57:48 CET 2020
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: Freescale i.MX23 (Device Tree), model: i.MX23 iungo Home Energy Manager
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 16384
[    0.000000] free_area_init_node: node 0, pgdat c059da98, node_mem_map c0aef000
[    0.000000]   Normal zone: 128 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 16256 pages, LIFO batch:3
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
[    0.000000] Kernel command line: console=ttyAMA0,115200 smsc95xx.macaddr=70:B3:D5:6F:34:17 smsc95xx.turbo_mode=N mtdparts=gpmi-nand:3M(bcb),512k(barebox),256k(bareboxenv),4M(kernel_a),4M(kernel_b),32M(rootfs_a),32M(rootfs_b),-(data) root=ubi:rootfs ubi.mtd=5 rootfstype=ubifs
[    0.000000] PID hash table entries: 256 (order: -2, 1024 bytes)
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Memory: 64MB = 64MB total
[    0.000000] Memory: 53672k/53672k available, 11864k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xc4800000 - 0xff000000   ( 936 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc053fcb4   (5344 kB)
[    0.000000]       .init : 0xc0540000 - 0xc0560a90   ( 131 kB)
[    0.000000]       .data : 0xc0562000 - 0xc059fbb8   ( 247 kB)
[    0.000000]        .bss : 0xc059fbdc - 0xc0aee470   (5435 kB)
[    0.000000] SLUB: Genslabs=13, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] of_irq_init: children remain, but no parents
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
[    0.080000] CPU: Testing write buffer coherency: ok
[    0.080000] Setting up static identity map for 0x403d87e0 - 0x403d8838
[    0.090000] devtmpfs: initialized
[    0.100000] pinctrl core: initialized pinctrl subsystem
[    0.110000] regulator-dummy: no parameters
[    0.110000] NET: Registered protocol family 16
[    0.110000] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.130000] gpiochip_add: registered GPIOs 0 to 31 on device: gpio.0
[    0.140000] gpiochip_add: registered GPIOs 32 to 63 on device: gpio.1
[    0.140000] gpiochip_add: registered GPIOs 64 to 95 on device: gpio.2
[    0.160000] Serial: AMBA PL011 UART driver
[    0.160000] 80070000.serial: ttyAMA0 at MMIO 0x80070000 (irq = 129) is a PL011 rev2
[    0.340000] console [ttyAMA0] enabled
[    0.370000] bio: create slab <bio-0> at 0
[    0.390000] mxs-dma 80004000.dma-apbh: initialized
[    0.400000] mxs-dma 80024000.dma-apbx: initialized
[    0.410000] of_get_named_gpio_flags exited with status 54
[    0.410000] vddio-sd0: 3300 mV 
[    0.410000] SCSI subsystem initialized
[    0.420000] usbcore: registered new interface driver usbfs
[    0.420000] usbcore: registered new interface driver hub
[    0.430000] usbcore: registered new device driver usb
[    0.450000] Switching to clocksource mxs_timer
[    0.620000] NET: Registered protocol family 2
[    0.630000] TCP established hash table entries: 2048 (order: 2, 16384 bytes)
[    0.640000] TCP bind hash table entries: 2048 (order: 4, 73728 bytes)
[    0.650000] TCP: Hash tables configured (established 2048 bind 2048)
[    0.650000] TCP: reno registered
[    0.660000] UDP hash table entries: 256 (order: 2, 20480 bytes)
[    0.660000] UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
[    0.670000] NET: Registered protocol family 1
[    0.680000] RPC: Registered named UNIX socket transport module.
[    0.690000] RPC: Registered udp transport module.
[    0.690000] RPC: Registered tcp transport module.
[    0.700000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.710000] NetWinder Floating Point Emulator V0.97 (double precision)
[    0.790000] NFS: Registering the id_resolver key type
[    0.790000] Key type id_resolver registered
[    0.800000] Key type id_legacy registered
[    0.800000] msgmni has been set to 104
[    0.810000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    0.820000] io scheduler noop registered (default)
[    0.830000] uart-pl011 80070000.serial: no DMA platform data
[    0.840000] 8006c000.serial: ttyAPP0 at MMIO 0x8006c000 (irq = 126) is a 8006c000.serial
[    0.850000] mxs-auart 8006c000.serial: Found APPUART 3.0.0
[    0.860000] Generic platform RAM MTD, (c) 2004 Simtec Electronics
[    0.870000] ONFI param page 0 valid
[    0.870000] ONFI flash detected
[    0.880000] NAND device: Manufacturer ID: 0x01, Chip ID: 0xda (AMD/Spansion S34ML02G1), page size: 2048, OOB size: 64
[    0.890000] gpmi-nand 8000c000.gpmi-nand: Page Erase Threshold Set as 4
[    0.890000] Scanning device for bad blocks
[    2.660000] 8 cmdlinepart partitions found on MTD device gpmi-nand
[    2.670000] Creating 8 MTD partitions on "gpmi-nand":
[    2.670000] 0x000000000000-0x000000300000 : "bcb"
[    2.690000] 0x000000300000-0x000000380000 : "barebox"
[    2.700000] 0x000000380000-0x0000003c0000 : "bareboxenv"
[    2.710000] 0x0000003c0000-0x0000007c0000 : "kernel_a"
[    2.720000] 0x0000007c0000-0x000000bc0000 : "kernel_b"
[    2.730000] 0x000000bc0000-0x000002bc0000 : "rootfs_a"
[    2.750000] 0x000002bc0000-0x000004bc0000 : "rootfs_b"
[    2.760000] 0x000004bc0000-0x000010000000 : "data"
[    2.770000] gpmi-nand 8000c000.gpmi-nand: driver registered.
[    2.780000] tun: Universal TUN/TAP device driver, 1.6
[    2.780000] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    2.790000] usbcore: registered new interface driver asix
[    2.800000] usbcore: registered new interface driver cdc_ether
[    2.800000] usbcore: registered new interface driver smsc95xx
[    2.810000] usbcore: registered new interface driver cdc_subset
[    2.820000] usbcore: registered new interface driver zaurus
[    2.820000] usbcore: registered new interface driver cdc_ncm
[    2.830000] usbcore: registered new interface driver cdc_acm
[    2.830000] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    2.840000] Initializing USB Mass Storage driver...
[    2.850000] usbcore: registered new interface driver usb-storage
[    2.850000] USB Mass Storage support registered.
[    2.860000] usbcore: registered new interface driver usbserial
[    2.870000] usbcore: registered new interface driver usbserial_generic
[    2.870000] usbserial: USB Serial support registered for generic
[    2.880000] usbcore: registered new interface driver ch341
[    2.890000] usbserial: USB Serial support registered for ch341-uart
[    2.890000] usbcore: registered new interface driver cp210x
[    2.900000] usbserial: USB Serial support registered for cp210x
[    2.910000] usbcore: registered new interface driver ftdi_sio
[    2.910000] usbserial: USB Serial support registered for FTDI USB Serial Device
[    2.920000] usbcore: registered new interface driver pl2303
[    2.930000] usbserial: USB Serial support registered for pl2303
[    2.930000] imx_usb 80080000.usb: pinctrl get/select failed, err=-19
[    2.940000] ci_hdrc ci_hdrc.0: doesn't support gadget
[    2.950000] ci_hdrc ci_hdrc.0: ChipIdea HDRC EHCI
[    2.950000] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
[    3.010000] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[    3.020000] hub 1-0:1.0: USB hub found
[    3.030000] hub 1-0:1.0: 1 port detected
[    3.040000] mousedev: PS/2 mouse device common for all mice
[    3.050000] rtc-ds1307 0-006f: SET TIME!
[    3.060000] rtc-ds1307 0-006f: rtc core: registered mcp7941x as rtc0
[    3.060000] rtc-ds1307 0-006f: 64 bytes nvram
[    3.070000] stmp3xxx-rtc 8005c000.rtc: rtc core: registered 8005c000.rtc as rtc1
[    3.080000] i2c /dev entries driver
[    3.090000] softdog: Software Watchdog Timer: 0.08 initialized. soft_noboot=0 soft_margin=60 sec soft_panic=0 (nowayout=0)
[    3.110000] of_get_named_gpio_flags: can't parse gpios property
[    3.150000] mxs-mmc 80010000.ssp: initialized
[    3.150000] leds-gpio leds.5: pins are not configured from the driver
[    3.160000] of_get_named_gpio_flags exited with status 52
[    3.160000] Registered led device: top
[    3.170000] usbcore: registered new interface driver usbhid
[    3.170000] usbhid: USB HID core driver
[    3.180000] Netfilter messages via NETLINK v0.30.
[    3.180000] nfnl_acct: registering with nfnetlink.
[    3.190000] nf_conntrack version 0.5.0 (838 buckets, 3352 max)
[    3.200000] ip_tables: (C) 2000-2006 Netfilter Core Team
[    3.210000] TCP: cubic registered
[    3.210000] NET: Registered protocol family 17
[    3.220000] Bridge firewalling registered
[    3.220000] Key type dns_resolver registered
[    3.230000] registered taskstats version 1
[    3.240000] UBI: attaching mtd5 to ubi0
[    3.350000] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    3.500000] hub 1-1:1.0: USB hub found
[    3.510000] hub 1-1:1.0: 3 ports detected
[    3.800000] usb 1-1.1: new high-speed USB device number 3 using ci_hdrc
[    3.900000] UBI: scanning is finished
[    3.930000] smsc95xx v1.0.4
[    3.940000] UBI warning: print_rsvd_warning: cannot reserve enough PEBs for bad PEB handling, reserved 4, need 40
[    3.980000] UBI: attached mtd5 (name "rootfs_a", size 32 MiB) to ubi0
[    3.980000] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    3.990000] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    4.000000] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[    4.000000] UBI: good PEBs: 256, bad PEBs: 0, corrupted PEBs: 0
[    4.010000] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
[    4.020000] UBI: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 897072156
[    4.030000] UBI: available PEBs: 0, total reserved PEBs: 256, PEBs reserved for bad PEB handling: 4
[    4.040000] UBI: background thread "ubi_bgt0d" started, PID 40
[    4.040000] rtc-ds1307 0-006f: setting system clock to 2001-01-01 00:00:00 UTC (978307200)
[    4.130000] smsc95xx 1-1.1:1.0 eth0: register 'smsc95xx' at usb-ci_hdrc.0-1.1, smsc95xx USB 2.0 Ethernet, 70:b3:d5:6f:34:17
[    4.230000] usb 1-1.3: new full-speed USB device number 4 using ci_hdrc
[    4.370000] ftdi_sio 1-1.3:1.0: FTDI USB Serial Device converter detected
[    4.380000] usb 1-1.3: Detected FT2232C
[    4.380000] usb 1-1.3: Number of endpoints 2
[    4.380000] usb 1-1.3: Endpoint 1 MaxPacketSize 64
[    4.390000] usb 1-1.3: Endpoint 2 MaxPacketSize 64
[    4.390000] usb 1-1.3: Setting MaxPacketSize 64
[    4.410000] usb 1-1.3: FTDI USB Serial Device converter now attached to ttyUSB0
[    4.430000] ftdi_sio 1-1.3:1.1: FTDI USB Serial Device converter detected
[    4.440000] usb 1-1.3: Detected FT2232C
[    4.440000] usb 1-1.3: Number of endpoints 2
[    4.440000] usb 1-1.3: Endpoint 1 MaxPacketSize 64
[    4.450000] usb 1-1.3: Endpoint 2 MaxPacketSize 64
[    4.450000] usb 1-1.3: Setting MaxPacketSize 64
[    4.460000] usb 1-1.3: FTDI USB Serial Device converter now attached to ttyUSB1
[    4.640000] UBIFS: mounted UBI device 0, volume 0, name "rootfs", R/O mode
[    4.640000] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    4.650000] UBIFS: FS size: 30093312 bytes (28 MiB, 237 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
[    4.660000] UBIFS: reserved for root: 0 bytes (0 KiB)
[    4.670000] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 671F90CC-BB2B-4DC0-BF4B-5D7DBDD17686, small LPT model
[    4.690000] VFS: Mounted root (ubifs filesystem) readonly on device 0:11.
[    4.700000] Freeing init memory: 128K
[    5.950000] UBI: attaching mtd7 to ubi1
[    9.380000] UBI: scanning is finished
[    9.430000] UBI: attached mtd7 (name "data", size 180 MiB) to ubi1
[    9.440000] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    9.440000] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    9.450000] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[    9.460000] UBI: good PEBs: 1442, bad PEBs: 0, corrupted PEBs: 0
[    9.460000] UBI: user volume: 2, internal volumes: 1, max. volumes count: 128
[    9.470000] UBI: max/mean erase counter: 27943/26020, WL threshold: 4096, image sequence number: 1718694209
[    9.480000] UBI: available PEBs: 388, total reserved PEBs: 1054, PEBs reserved for bad PEB handling: 40
[    9.490000] UBI: background thread "ubi_bgt1d" started, PID 53
[    9.530000] UBIFS: background thread "ubifs_bgt1_0" started, PID 55
[    9.670000] UBIFS: recovery needed
[   10.090000] UBIFS: recovery completed
[   10.090000] UBIFS: mounted UBI device 1, volume 0, name "config"(null)
[   10.100000] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[   10.110000] UBIFS: FS size: 6856704 bytes (6 MiB, 54 LEBs), journal size 1015809 bytes (0 MiB, 6 LEBs)
[   10.120000] UBIFS: reserved for root: 323858 bytes (316 KiB)
[   10.120000] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 98D7CDD3-DF30-4B23-A7D4-66D4577252AC, small LPT model
[   10.170000] UBIFS: background thread "ubifs_bgt1_1" started, PID 57
[   10.310000] UBIFS: recovery needed
[   10.760000] UBIFS error (pid 56): ubifs_recover_leb: corruption -3
[   10.760000] UBIFS error (pid 56): ubifs_scanned_corruption: corruption at LEB 524:37888
[   10.770000] UBIFS error (pid 56): ubifs_scanned_corruption: first 8192 bytes from LEB 524:37888
[   10.780000] 00000000: 06101831 d1618e92 b933884b 00000000 000005c9 00000001 0000007a 2000000a  1.....a.K.3.............z...... 
[   10.780000] 00000020: 00000000 00000000 00001000 00000001 a5e3540e b020c49b f7ced93f bba5e353  .................T.... .?...S...
[   10.780000] 00000040: 00c0003f 3d70a40b c0a3d70a 978d503f 2883126e 1d00001c e76c8b44 3fc1a9fb  ?.....p=....?P..n..(....D.l....?
[   10.780000] 00000060: 56041893 3fc22d0e eb851eb8 3f8eb851 ae147ae1 3fbae147 9fbe76c9 3fbd2f1a  ...V.-.?....Q..?.z..G..?.v.../.?
[   10.780000] 00000080: 4bc6a7f0 27c18937 a152013d 00fc3f05 83120100 45a1cac0 374c3fb6 e5604189  ...K7..'=.R..?.........E.?L7.A`.
[   10.780000] 000000a0: df3b3fa0 020d444f bc6a3fb2 020b4874 b4393fb6 060944c8 4dd33fba 39581062  .?;.OD...?j.tH...?9..D...?.Mb.X9
[   10.780000] 000000c0: b004ddb4 d8013c27 e9002014 31080018 5a1cac08 793fbb64 014926e9 001c27bc  ....'<... .....1...Zd.?y.&I..'..
[   10.780000] 000000e0: 22d04b76 500b5c28 fc049c03 91680d55 353f7ced e3543fbe 20c49ba5 089b3fc0  vK."(\.P....U.h..|?5.?T.... .?..
[   10.780000] 00000100: 703fbf3b 3750444e 59b909bc 007c279e 0c49ba05 a6872b02 0100503f b7ced916  ;.?pNDP7...Y.'|...I..+..?P......
[   10.780000] 00000120: 070c3c27 c28f5c29 3fbc28f5 0060999a 3fb90100 f3b645a2 3fb8d4fd f9db22d1  '<..)\...(.?..`....?.E.....?."..
[   10.780000] 00000140: 3fbc6a7e 706c7a71 01bf27bd 44d0e560 3fbe0103 61647efa aa3f6802 6045d2f1  ~j.?qzlp.'..`..D...?.~da.h?...E`
[   10.780000] 00000160: 016cdcb8 72b03fbe 3fbf1667 bc018121 9a01fc27 27ba1c1e 20fc01dc 7a190bfd  ..l..?.rg..?!...'......'... ...z
[   10.780000] 00000180: 27bdb275 75c101bd dc28f36f 2e76fc01 11fc0d40 3fbe1dbe 23fc08fc 11fc28fc  u..'...uo.(...v.@......?...#.(..
[   10.780000] 000001a0: 28fc05fc bf7c149a fc029c27 2e05fc0b 12fc001c 08fc0dfc 859b90fc 9a3fc2d0  ...(..|.'.....................?.
[   10.780000] 000001c0: 27c2b035 2ebe015c 92533fc7 28ef9db2 02fc001c 645a00fe 3fc78d66 05fc00fc  5..'\....?S....(......Zdf..?....
[   10.780000] 000001e0: 98459750 013c27c7 06fc03fc 1c2e03fc 81060300 6c8b4395 fc013c28 44105001  P.E..'<..............C.l(<...P.D
[   10.780000] 00000200: 013c28a0 fd005c2e 47825e03 03fc3fc7 af46ae50 44773fc7 27c6e978 02fc001c  .(<..\...^.G.?..P.F..?wDx..'....
[   10.780000] 00000220: 00fc27fc c6c8a397 87089b3f 01fc3fc6 0e001e2e 3f0e852d 0bfc08fc 00fc08fc  .'......?....?......-..?........
[   10.780000] 00000240: 3c2e04fc 6605fd01 5c280080 00bc2e02 00fc08fc be007c2e fc3fc6be fc0afc00  ...<...f..(\.........|....?.....
[   10.780000] 00000260: 6301fd15 27c64c81 3c2e063c fc18fc01 fc00fc06 9503fc29 3c284b1e fc02fc05  ...c.L.'<..<........)....K(<....
[   10.780000] 00000280: fc01fc09 2e08fc06 7c2e00dc 081c2e06 04fc09fc 9c2e47fc 005c2e00 7cbd4bfc  ...........|.........G....\..K.|
[   10.780000] 000002a0: 0afc27c8 07fc09fc d4fe03ff c87d4978 ddc882dd 1c27c78d 28ebbc00 01fc007c  .'..........xI}.......'....(|...
[   10.780000] 000002c0: 54a609fd 72b0019c 00fc3fc8 3c288cbc 4e02fd00 f63f21a3 c8986328 9b7a4a3f  ...T...r.?....(<...N.!?.(c..?Jz.
[   10.780000] 000002e0: 97ddc916 065c27c8 00fc03fc 9cbe06fc 01fc3fc8 00fd07fc 589a7af2 017c27c9  .....'\..........?.......z.X.'|.
[   10.780000] 00000300: be2e13fc 5bef9e00 3fc93768 804600fd 00dc2844 0afc08fc 09fc23fc 07fc02fc  .......[h7.?..F.D(.......#......
[   10.780000] 00000320: 01fc05fc 17fc00fc 02fc00fc 09fc05fc 00fc01fc dc3604fc fc02fc00 fc11fc16  ......................6.........
[   10.780000] 00000340: fc02fc09 bf00fc09 ee3fc9c5 ba5ed357 28c7dcc9 8242003d fc3fc9ad fc09fc00  ..........?.W.^....(=.B...?.....
[   10.780000] 00000360: fc0afc05 5004fc01 caaa4947 fd015c27 98549601 c9fbe701 fc00fc3f 5ee39b09  .......PGI..'\....T.....?......^
[   10.780000] 00000380: d29b3fca fc3fca7e 2400fc05 25ca269d ca0126bc 6624dd3f bc3fcb60 001c28ee  .?..~.?....$.&.%.&..?.$f`.?..(..
[   10.780000] 000003a0: 03fc09fc cb29be24 3092b83f 3f7d001f cc724935 cc01f8dc 80cccd3f ccdedd00  ....$.).?..0..}?5Ir.....?.......
[   10.780000] 000003c0: fe09fc27 2293750a decd2a41 2e3fcddb cabe003c e7773fcd 2fce353f 08fc001c  '....u."A*....?.<....?w.?5./....
[   10.780000] 000003e0: cef92a9a 3fceedde 1a2a1a23 001c27cf 5c286177 209e25cf ea9b3fcf 223fcf9d  .*.....?#.*..'..wa(\.%. .?....?"
[   10.780000] 00000400: 3b0221f4 583fcfdf 27cf2281 5d24027c dd25d021 6edcd02b bc001c30 3fd00170  .!.;..?X.".'|.$]!.%.+..n0...p..?
[   10.780000] 00000420: db6453f8 bd001c28 3c27d047 0147bc01 fdf43fd1 ded18161 bc3fd162 001d303d  .Sd.(...G.'<..G..?..a...b.?.=0..
[   10.780000] 00000440: 2ef62298 3ddcd1ca fc001c28 2d269a1d 2f3c25d2 3b001d30 d22e5d23 d22e7d25  .".....=(.....&-.%</0..;#]..%}..
[   10.780000] 00000460: 1c30eedc 2409fc00 3fd2203e d312069a bc001c2f 005d2842 d3008233 3159233f  ..0....$> .?..../...B(].3...?#Y1
[   10.780000] 00000480: 00dc28f1 00fc09fc dcd346bd 001e304b 4a641687 99005c28 3c28330a fc08fc00  .(.......F..K0....dJ(\...3(<....
[   10.780000] 000004a0: fc10fc00 fc15fc04 fc00fc01 8d05fd0e d2343923 fc063c27 9f3e9a09 d260ded2  ................#94.'<....>...`.
[   10.780000] 000004c0: 27d4223f d28f5c01 d267be3f 2799233f 057c283d 280c5b99 08fc003c 6bbd00fc  ?".'.\..?.g.?#.'=(|..[.(<......k
[   10.780000] 000004e0: 286ddcd2 e703001c d2f1a9fb 00dc284d 73bd37fc 3874dcd2 4b76027c 9c28b020  ..m(........M(...7.s..t8|.vK .(.
[   10.780000] 00000500: 00dc2e00 1cfc03fc 12fc39fc bc2e00fc 2b372304 fc3fd374 2401fc26 3fd3379b  .........9.......#7+t.?.&..$.7.?
[   10.780000] 00000520: d334832b 0123273f 1c27d42e 0709fc00 72b020c5 3fd59168 ce62f5c3 bfbf3fd5  +.4.?'#...'...... .rh..?..b..?..
[   10.780000] 00000540: 79173fd5 1c30e33a 2a1d2400 2a3e25d5 07fc3fd5 c7001e2e 28c6224b 00fe3fd5  .?.y:.0..$.*.%>*.?......K".(.?..
[   10.780000] 00000560: 3a672f1b 801d3fd5 005d28f1 d5838373 977a253f 2eddd48b 157c27ca ddc31abd  ./g:.?...(].s...?%z......'|.....
[   10.780000] 00000580: 7c27c31b 6c059911 fc279c28 fd1afcd7 22812300 286cdcc4 03fc2adc bd001c36  ..'|...l(.'......#."..l(.*..6...
[   10.780000] 000005a0: fdddb9c0 09dc2fb8 1abd06fc 8274dda5 a63d1d25 a8311d25 fc14dc27 e97905a8  ...../........t.%.=.%.1.'.....y.
[   10.780000] 000005c0: ac083126 00113fcc 03bc2700 e4f76605 06101831 b9cc44af b933884c 00000000  &1...?...'...f..1....D..L.3.....
[   10.780000] 000005e0: 0000040e 00000001 0000007a 2000000c 00000000 00000000 00001000 00000001  ........z...... ................
[   10.780000] 00000600: 6a7efa09 d09374bc 6a7efa3f 00007cbc 5c28f60e d0f5c28f 10624e3f d0b43958  ..~j.t..?.~j.|....(\....?Nb.X9..
[   10.780000] 00000620: b645a23f d0d4fdf3 89374c3f d0e56041 0503fc3f dd2f1aa0 3fd10624 d2f200ff  ?.E.....?L7.A`..?...../.$..?....
[   10.780000] 00000640: 0506444d c49c3fd1 6872b020 46001d28 78080778 8b443fd1 a9fbe76c 01fc3fd1  MD...?.. .rh(..Fx..x.?D.l....?..
[   10.780000] 00000660: 5e353f0d d20c49ba 3126e93f d21cac08 0801fc3f a3d70a3d 3fd23d70 487ced91  .?5^.I..?.&1....?...=...p=.?..|H
[   10.790000] 00000680: 001c3002 14441350 e33fd202 0d449ba5 ba001c28 fc3fd213 7ae10500 e147ae14  .0..P.D...?...D.(.....?....z..G.
[   10.790000] 000006a0: 0e983fd2 3fd2f108 978d4fdf 3fd3126e 81021650 3fd34395 5a010e74 763fd364  .?.....?.O..n..?P....C.?t..Zd.?v
[   10.790000] 000006c0: 28958118 02fc003c d9168707 d353f7ce 60f9db3f 007c2823 51eb8505 d3851eb8  ...(<.........S.?..`#(|....Q....
[   10.790000] 000006e0: 0103743f 3fd3a5e3 fc003c2e 3600fc02 0afc007c fc001c3e fc08fc13 fc00fc01  ?t.....?.<.....6|...>...........
[   10.790000] 00000700: fc08fc02 fc1cfc17 fc00fc1e 04ff2e23 4a22d0e5 fd3fd208 06803b00 0505fc28  ............#....."J..?..;..(...
[   10.790000] 00000720: 56041893 3fd22d0e d2f13853 005c284d c8b43903 309fbe76 34fc00dc 04fc00fc  ...V.-.?S8..M(\..9..v..0...4....
[   10.790000] 00000740: 31760efc 5c28c083 2e35fc06 05fc001c d302459a 4658424c 95001c29 5d282252  ..v1..(\..5......E..LBXF)...R"(]
[   10.790000] 00000760: 00803307 05065c28 ef9db22d 3fd3c6a7 830600fc 45a1cac0 2b3fd3b6 3fd33c83  .3..(\..-......?.......E..?+.<.?
[   10.790000] 00000780: 015d7829 d13fd428 6a011f78 787b3fd4 d47a0346 53f7cf3f 3fd40f4b 91597bc5  )x].(.?.x..j.?{xF.z.?..SK..?.{Y.
[   10.790000] 000007a0: 02983fd5 3fd61401 28538068 8012001d 3fd6010a 62629fbe 68763fd6 3c280418  .?.....?h.S(.......?..bb.?vh..(<
[   10.790000] 000007c0: c102fd00 d5f30e7b 6d00fd3f 3fd52983 b22a7a19 019e27d5 5b58f5c3 3fd5c201  ....{..0.790000] 00000980: 3fbe012b 2161fdf4 001c27c1 6d9a14fc 22dfc395 811f3fc4 1c2fc536 c426bd00  +..?..a!.'.....m...".?..6./...&.
[   10.790000] 000009a0: fc01bc27 00bc2e01 02fc0efc 16fc14fc dfbbc5bd 483fc244 ddc1a181 9c27a72a  '...................D.?H....*.'.
[   10.790000] 000009c0: b508bd08 ddb0f1dd bc27b473 206ed80d 00000000 00000000 11001810 05fc0000  ........s.'...n ................
[   10.790000] 000009e0: 06101831 fbd3434c b933884d 00000000 00000bda 00000001 0000007a 2000000d  1...LC..M.3.............z...... 
[   10.790000] 00000a00: 00000000 00000000 00001000 00000001 00000002 00200000 00009c00 11350600  ...................... .......5.
[   10.790000] 00000a20: 52bd3c36 26ca3f76 daffdd0c 2f3f3f84 c2b25002 07203f4a 75000b48 9d265dac  6<.Rv?.&.....??/.P..J? .H..u.]&.
[   10.790000] 00000a40: 3f65fb5b 5fd8adae 3f6e4f76 754839e4 3f94c527 0d1b7177 3f902de0 258bf257  [.e?..._vOn?.9Hu'..?wq...-.?W..%
[   10.790000] 00000a60: 3fa258bf d6c455be 3fa51a59 d265da95 3fafb5b9 56b2dbd2 3faf04c7 58793dda  .X.?.U..Y..?..e....?...V...?.=yX
[   10.790000] 00000a80: 3fad35a8 b98c7e29 3fa9096b 56d5cfa9 3f9b2fec 8e8a71e5 3f8ff2e4 bdeaf94d  .5.?)~..k..?...V./.?.q.....?M...
[   10.790000] 00000aa0: 3f9e6e0b 5a1cac09 3f9f3b64 066ac4e5 3f8bebcb 124ba3b4 3f3e955e 1506b0b0  .n.?...Zd;.?..j....?..K.^.>?....
[   10.790000] 00000ac0: 2791f442 1700009c 801179eb 3f961592 59f9b832 3f93103f 1fcff0b3 3fa344ad  B..'.....y.....?2..Y?..?.....D.?
[   10.790000] 00000ae0: 712fa66e 3fa7b6d1 807a5574 3f9a9701 090b9cdd da763f9f 740da740 888a3f9a  n./q...?tUz....?.....?v.@..t.?..
[   10.790000] 00000b00: 18000060 29c63fa8 7fcb923a d35b3fb0 1d14e3bc 36c23fb1 deaf94f5 6edc3fab  `....?.):....?[......?.6.....?.n
[   10.790000] 00000b20: 4e18d95c 09d43fac 786c2268 04503faa 7dbf4803 dc5c3fad 56270004 69675b11  \..N.?..h"lx.?P..H.}.?\...'V.[gi
[   10.790000] 00000b40: 9d3fb394 3e654ec7 c13fb50d c3a6faf2 553fb21d 62b6ae7d be3fa97f ea9073c7  ..?..Ne>..?.......?U}..b..?..s..
[   10.790000] 00000b60: 413faa4e 7f3fc2d5 8b3fa2b4 d0e56041 2a3f9b22 d4072e78 0a843f83 c0c8fa21  N.?A..?...?.A`..".?*x....?..!...
[   10.790000] 00000b80: 05dd2734 00049c44 063f7207 358564a0 693f60a8 24ba3b41 1b3f95e1 18fc5048  4'..D....r?..d.5.`?iA;.$..?.HP..
[   10.790000] 00000ba0: 9c278773 0034fc00 d3379405 8b68b897 f4aaf13f a52e0300 e282423f 86bb98c7  s.'...4...7...h.?.......?B......
[   10.790000] 00000bc0: fc009c2f 0700fc05 7cca9d90 3f920a1a 3760e3dd 3fa55800 4ea4a8c1 3fb11340  /..........|...?..`7.X.?...N@..?
[   10.790000] 00000be0: 6b9698a6 3fb4cde4 149dd521 3fb572d3 9374bc6c 3fb60418 62fc962e 3fb62fc9  ...k...?!....r.?l.t....?...b./.?
[   10.790000] 00000c00: 27983c14 3fb8dfea 97476831 3fbabc24 a5c06021 3fbc9976 bebcb06a 3fbf70e9  .<.'...?1hG.$..?!`..v..?j....p.?
[   10.790000] 00000c20: f788f165 3fc18d09 3d2abc25 3fc380c0 4bc6a7f0 3fc58937 8842a0d4 3fc8323e  e......?%.*=...?...K7..?..B.>2.?
[   10.790000] 00000c40: 0c004650 cb224515 4dd2f33f cd581062 212d7c3f ce6cf41f 3d4daf3f cef7abe5  PF...E".?..Mb.X.?|-!..l.?.M=....
[   10.790000] 00000c60: 06542b3f ed4b2400 70813fce 622adf18 4e3b3fcf fe5c91d1 0d843fcf 6594af4f  ?+T..$K..?.p..*b.?;N..\..?..O..e
[   10.790000] 00000c80: 288d3fd0 30be0ded ec573fd1 0f27bb2f 32cb3fd3 6e2eb1c4 ddde3fd5 27000060  .?.(...0.?W./.'..?.2...n.?..`..'
[   10.790000] 00000ca0: 2d533fd7 2b47f3fc f90b3fd9 eab367a0 e5cb3fd9 bedfa43f 96de3fda 78263ab5  .?S-..G+.?...g...?..?....?...:&x
[   10.790000] 00000cc0: b0893fcc b295e9e1 9df93fbc cf1efe39 c3ca3fb1 de69ad42 04bc3fb9 5f2026fc  .?.......?..9....?..B.i..?...& _
[   10.790000] 00000ce0: 2800001c d821dc3b 3fbec9cb 13f c815d867 63ee843f 2d3fcf71 9c0a6178  ....?.......?...g...?..cq.?-xa..
[   10.790000] 00001180: 18093fd1 265da970 c0cb3fd3 d6084960 03f59e3f da80e331 319cf33f 4e3fdf08  .?..p.]&.?..`I..?...1...?..1..?N
[   10.790000] 000011a0: 2bf6b73a 5f3fee8a c54a2957 e3c2dde1 3feb6ade 0c00d174 3feefc96 1b946969  :..+..?_W)J......j.?t......?ii..
[   10.790000] 000011c0: 3fe60b32 68db8bad 3fe96f00 19652bd5 3fe758e2 556391f3 234f3fdb 3fdc211f  2..?...h.o.?.+e..X.?..cU.?O#.!.?
[   10.790000] 000011e0: 000e9c2c 643fd711 a161e4f7 4a3fd8d6 872b020c 3f3fd916 080e3310 b63fd987  ,.....?d..a...?J..+...??.3....?.
[   10.790000] 00001200: eecbfb15 d93fd9c9 1700d49c a04b3fd6 2b8ddbae b2ba3fd9 cd589c31 b3453fd8  ......?......?K....+.?..1.X..?E.
[   10.790000] 00001220: d40948c5 db033fd9 7abe53d4 647d3fd9 cefc0a60 dc0820d0 0151bc18 0bdf3f9f  .H...?...S.z.?}d`.... ....Q..?..
[   10.790000] 00001240: c9093160 089a023f c95e9e1b 63f4433f d03fcb15 0100879c e46c3fcc 2e25f4cd  `1..?.....^.?C.c..?......?l...%.
[   10.790000] 00001260: 5d633fce 780346dc dc643fcf 587b0e5f 3bcd35a8 5d863fca b9af7201 de1c3fc0  .?c].F.x.?d._.{X.5.;.?.].r...?..
[   10.790000] 00001280: 60b6f96d 3fbb02a7 46bd1944 983fbc5f be76097f 6f006b3f c3c50481 4378ed3f  m..`...?D..F_.?...v.?k.o....?.xC
[   10.790000] 000012a0: 3fc9e409 fd44f307 3fc8a11b 08499c95 a9dc3fc6 20a1a7cc 784b3fcb c8bb0268  ...?..D....?..I..?..... .?Kxh...
[   10.790000] 000012c0: 60efc03f 3fae0792 b138636a 3fcac19a 1d036150 3fc8e8a7 4df97af3 259c25c0  ?..`...?jc8....?Pa.....?.z.M.%.%
[   10.790000] 000012e0: 3fbe0200 184d8d0c 3fb5ffba 568fe7f5 3fbad9a2 7f64da51 3fc10100 adce932e  ...?..M....?...V...?Q.d....?....
[   10.790000] 00001300: 3fc28afd 60cd589d 3fb37d79 00f9784e 3fa82e01 cfcdc177 3fc481fa 1bb75d42  ...?.X.`y}.?Nx.....?w......?B]..
[   10.790000] 00001320: 3fbe3657 01229823 b03fbbb5 d2036354 863fbf28 2a0022c6 3fba0200 d6e74996  W6.?#."...?.Tc..(.?..".*...?.I..
[   10.790000] 00001340: 3fb9457e fd21ff30 3fb875f6 52608b65 023fbe01 01ff644d 8f3b3fc0 0622c022  ~E.?0.!..u.?e.`R..?.Md...?;.".".
[   10.790000] 00001360: bac73fb2 f0068db8 05dc3f36 7ae14907 b947ae14 60b8df3f b5020038 3562713f  .?......6?...I.z..G.?..`8...?qb5
[   10.790000] 00001380: bdf5e583 b5ffba3f bd7ca7a9 606deb3f 3fbf0273 448b897d 3fc5018d 2b647c3e  ....?.....|.?.m`s..?}..D...?>|d+
[   10.790000] 000013a0: 3fc71800 5c4be99b 3fc5edb4 4309b1a0 3fc6bff7 9a6b50b1 3fc69c77 3f7ced90  ...?..K\...?...C...?.Pk.w..?..|?
[   10.790000] 000013c0: 3fc65e35 15928012 3fc6a0d6 00223823 3fc78812 f559b3d0 3fc6dab9 57a786c2  5^.?.......?#8"....?..Y....?...W
[   10.790000] 000013e0: 3fc832ca 1da0b323 3fc8925d ed05990d 3fc892e8 00227892 3fc9220a a2339c0e  .2.?#...]..?.......?.x"..".?..3.
[   10.790000] 00001400: 3fc837b4 45a1cac3 3fc9f3b6 f258bf26 3fcb258b 7f947bde 06983fcc cef01a00  .7.?...E...?&.X..%.?.{...?......
[   10.790000] 00001420: b5dcc93f cfd07c84 4c2f843f d1460aa6 541ac23f d247d108 7e90fe3f d2703afb  ?....|..?./L..F.?..T..G.?..~.:p.
[   10.790000] 00001440: aa87b73f d2fe7f85 e0788b3f d1930200 ceb6203f d23728d2 397b043f d222f3d9  ?.......?.x.....? ...(7.?.{9..".
[   10.790000] 00001460: 829cfc3f f13fd40a 2474538e 613fd597 6266d3c3 cc80de3f 173fd909 2d0e5604  ?.....?..St$..?a..fb?.....?..V.-
[   10.790000] 00001480: 873fd7b2 01ad60f4 a6073fd0 3fc73f67 201822ef c3c81300 622ade3f c28d2ceb  ..?..`...?..g?.?.". ....?.*b.,..
[   10.790000] 000014a0: b9f55b3f c1fd8ada 95a3fa3f c118b668 7bd5f43f c0fcdc17 639d043f dc3fc1a7  ?[......?...h...?..{....?..c..?.
[   10.790000] 000014c0: 2b006d54 3fc10481 6c8b4394 3fc1fbe7 c86e51a4 3fc3682c 3b874df4 3fc57b04  Tm.+..33031d27 ddb30081  ...?w`....;.....>..M....'..3....
[   10.790000] 000018c0: be27b824 651aa000 43dfc1d7 57a43fc0 c0a3d7a9 3fbc10df 01f554ec 3fc1eb85  $.'....e...C.?.W.......?.T.....?
[   10.790000] 000018e0: 0123b823 1b3fbe76 b581057a dcb31edd 06bc2830 ddb41ebd 9c27bb17 b555bd05  #.#.v.?.z.......0(........'...U.
[   10.790000] 00001900: 27ad63dd d7be00fc 139a3fb0 16ddb333 2810dcaf 7d24005c 7c27b023 205cbc00  .c.'.....?..3......(\.$}#.'|..\ 
[   10.790000] 00001920: 2018bc11 7f179d7f 25c48281 c301213c 6518933f 7c27c25e 2817bc06 a5bd067c  ... .......%<!..?..e^.'|...(|...
[   10.790000] 00001940: 05bc27bc ddba6fbd bc27b954 0a779a07 091c27b7 39fc01fc f5c34afe ddb58961  .'...o..T.'...w..'.....9.J..a...
[   10.790000] 00001960: 1e27b683 6249ba00 fc3fb673 3087bc06 09fc007c 09fc00fc b6041a9a 1c2863dc  ..'...Ibs.?....0|............c(.
[   10.790000] 00001980: b788be01 4f85763f 027c288d 0efc02fc 22aa13fd b8102b9a bd037c27 8eddb983  ....?v.O.(|........".+..'|......
[   10.790000] 000019a0: 09bc27ba 3fbcabbf 019454f0 3fc18937 ef221322 67ddc6a7 c720ddc6 ddc893dd  .'.....?.T..7..?"."....g.. .....
[   10.790000] 000019c0: bc27c958 287fbc19 ac74003c ca7ef901 bd00fc3f 23dec979 12bd3fc6 001c27c8  X.'....(<.t...~.?...y..#.?...'..
[   10.790000] 000019e0: c60215bc 9fbe773f 27c46c45 98bd071c 065d27bf b4888123 3fb1acde dda61dbd  ....?w..El.'.....'].#......?....
[   10.790000] 00001a00: 6ddda16e 8602dd95 dc748cdd 2041b47e 14f50000 00001100 06101831 80da3cba  n..m......t.~.A ........1....<..
[   10.790000] 00001a20: b933884f 00000000 00000728 00000001 0000007a 2000001c 00000000 00000000  O.3.....(.......z...... ........
[   10.790000] 00001a40: 00001000 00000001 00000002 e2200000 ba050000 2b020c49 fc3f9687 7efa0500  .............. .....I..+..?....~
[   10.790000] 00001a60: 9374bc6a 07203f68 7b050468 e147ae14 bc3f847a 880f0006 20c49c3f a16872b0  j.t.h? .h..{..G.z.?.....?.. .rh.
[   10.790000] 00001a80: 16872b3f a3f7ced9 45a1cb3f a4fdf3b6 3126e93f aa1cac08 b10903dc d4fdf43f  ?+......?..E....?.&1........?...
[   10.790000] 00001aa0: b126e978 60f9db3f b30f000e 8f5c293f ac28f5c2 d2f1aa3f a810624d 3b645a3f  x.&.?..`....?)\...(.?...Mb..?Zd;
[   10.790000] 00001ac0: 978d4fdf e76c8b3f a2f1a9fb 50001c27 e353020a bd3f9ba5 09dc740e 4c3fa108  .O..?.l.....'..P..S...?..t....?L
[   10.790000] 00001ae0: 60418937 793fa0e5 3f9c0d82 a26e0796 3fa708de 22d00377 003c27ab a3d70a04  7.A`..?y...?..n....?w..".'<.....
[   10.790000] 00001b00: a70a3d70 0700fc27 eb851eb8 3faeb851 016751ec 54d33fb1 39580410 a5e33fb4  p=..'.......Q..?.Qg..?.T..X9.?..
[   10.790000] 00001b20: b21a459b 010019dc 04193fb3 b22d0e56 39583fad be76c8b4 81333faf 1cdeb300  .E.......?..V.-..?X9..v..?3.....
[   10.790000] 00001b40: 27743fb4 b6041809 9168733f b53f7ced 7c09743f b122be0a bd0efc3f 14dda10c  .?t'....?sh..|?.?t.|..".?.......
[   10.790000] 00001b60: 7c16dd92 fc05dc27 8218bd1f fc03fc27 067c2e06 dd2f1b04 a5810624 27fd30dc  ...|'.......'.....|.../.$....0.'
[   10.790000] 00001b80: 013c27a7 fc00bc2e b026bd01 ff035c27 28f5c316 b5013244 6510623f 1c27b61d  .'<.......&.'\.....(D2..?b.e..'.
[   10.790000] 00001ba0: 0112bc00 7ae13fb7 ddba3f61 1cdfbc36 76f83fbe ddc0c433 34ddc226 011edcc4  .....?.za?..6....?.v3...&..4....
[   10.790000] 00001bc0: 43963fc7 c9073a64 8106253f cc8b4395 080b983f 603fce76 db22d0e5 9b3fcef9  .?.Cd:..?%...C..?...v.?`.."...?.
[   10.790000] 00001be0: 3fcf9d2b 10450f50 d017dfcf 2981523f d03cddd0 ded249dd 743fd40f d9160258  +..?P.E.....?R.)..<..I....?tX...
[   10.800000] 00001c00: a04a3fd6 983f0601 c083126e 743fd9ca 645a044e 93753fdb dd0b4b18 18831d3f  .?J...?.n.....?tN.Zd.?u..K..c089c27 3fd00193 2d6676c9 9f773fcd ddc7ae14  ..P.?.Q~....'......?.vf-.?w.....
[   10.800000] 00001d20: 4dddc12a b6a9ddbb 27b276dd a05010bc deaf1041 be3fb18e 503fb326 28194802  *..M.....v.'..P.A.....?.&.?P.H.(
[   10.800000] 00001d40: 62bd0d5c c11fdebe 5ca3773f 92ddc28f c624ddc4 3fc71ddf 017578f6 3d3fc8f5  \..b....?w.\......$....?.xu...?=
[   10.800000] 00001d60: dfca8c81 c53fcc38 cd91b17a 9c2873dc cd61bf0d ab786d3f 3fcdd202 375bcac1  ....8.?.z....s(...a.?mx....?..[7
[   10.800000] 00001d80: 9b3fcdf3 3fce3596 ddcf14bd 48ddcf25 c96bddd0 bd01fc27 a3ddc537 c3a1ddc3  ..?..5.?....%..H..k.'...7.......
[   10.800000] 00001da0: 3fc21ede c3d7ac9a bd0f9c27 bc27c71c be7efc01 983fc64a c6e9023e 61999a3f  ...?....'.....'...~.J.?.>...?..a
[   10.800000] 00001dc0: 32ddc900 ca31ddc9 3fca50de 3502ab74 f23fca5e c958c57a 3fca81de 5f495f50  ...2..1..P.?t..5^.?.z.X....?P_I_
[   10.800000] 00001de0: c32adddb ddb425dd 5c27be0f 74459a06 ac5cdda3 dd990ddd 96dd9551 001c2794  ..*..%....'\..Et..\.....Q....'..
[   10.800000] 00001e00: dd9716bd 39dd9d56 15bc279f 27af25bd 5c9a18fc 9eddb604 b914ddb7 debbd0dd  ....V..9.'...%.'...\............
[   10.800000] 00001e20: 9a3fbc0e ddbf7c76 e2ddbf09 053c27c1 81173afd 74dec55a f6503fcb ddc7ec41  ..?.v|.......'<..:..Z..t.?P.A...
[   10.800000] 00001e40: 3c27c746 c853bf00 eb7afe3f 5c27c831 7725fc08 cb020c7b ddcb10dd a3ddcc10  F.'<..S.?.z.1.'\..%w{...........
[   10.800000] 00001e60: 08dc27cd decba6bd 993fcabc 1c289fdd fcb8fc00 c8ffbd00 fc0c3c27 c978bd13  .'........?...(.........'<....x.
[   10.800000] 00001e80: bd0a1c27 43ddd1fe d492ddd2 27d94add ff24107c d13feb20 7e02c254 a23ff46a  '......C.....J.'|.$. .?.T..~j.?.
[   10.800000] 00001ea0: d4211a22 f51dddf2 3ff56ddf f6008166 ddf0c9dd 40ddf118 de3eddef dde01add  ".!......m.?f..........@..>.....
[   10.800000] 00001ec0: 49ddda0e d9d1ddda 27db98dd aa9a121c 0cdddab0 014bdcd9 b22d3fda dbc6ae5a  ...I.......'..........K..?-.Z...
[   10.800000] 00001ee0: 27dc4add 0720013c 6dfc18a4 dfd3adbd 273fd339 ded42e81 bd3fd5d3 3aded53d  .J.'<. ....m....9.?'......?.=..:
[   10.800000] 00001f00: ad983fd7 3fd64502 812278d5 15ddd423 0e5c27d3 ddcc02bd 9bddcb8f 0f3c2fcc  .?...E.?.x".#....'\........../<.
[   10.800000] 00001f20: be76f976 501d5d28 3fd0c183 239a22a6 9dddd072 cea0ddc4 24107c27 94cc255d  v.v.(].P...?.".#r.......'|.$]%..
[   10.800000] 00001f40: bd477cc3 badec8e5 bd243fc4 1c27c520 7782fc00 c624dda4 27c837dd ef99001c  .|G......?$. .'....w..$..7.'....
[   10.800000] 00001f60: 097d2885 c9818142 ddc810dd 1c27c3c8 277b230c 9a3fc2d0 27c24d95 de3e0ebc  .(}.B.........'..#{'..?..M.'..>.
[   10.800000] 00001f80: 6670a405 bc3fc0a2 3fc0021c 484bc6a8 001c2809 c523be24 bd19fc3f 2addc820  ..pf..?....?..KH.(..$.#.?... ..*
[   10.800000] 00001fa0: c74dddc8 bd0b5c27 7c27c780 9e06ff00 0b44a7ef 7712bc28 ca1cac34 fc284bdc  ..M.'\....'|......D.(..w4....K(.
[   10.800000] 00001fc0: fc68fc12 ccf6bd1f bd05bc27 c3ddd0db d2beddd1 ddd359dd 3c27d3da d3ecbd00  ..h.....'............Y....'<....
[   10.800000] 00001fe0: ddd3e0dd bc27d353 d62fbd08 27e78cdd 02bd0c3c 091c27de a5078b98 bc6b3fcb  ....S.'.../....'<....'.......?k.
[   10.800000] UBIFS error (pid 56): ubifs_recover_leb: LEB 524 scanning failed
[   10.810000] UBIFS: background thread "ubifs_bgt1_1" stops
[   23.790000] smsc95xx 1-1.1:1.0 eth0: link up, 100Mbps, full-duplex, lpa 0x4DE1
--
:wq
^X^Cy^K^X^C^C^C^C

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
