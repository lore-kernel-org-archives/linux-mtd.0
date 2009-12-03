Received: from ipmail02.adl6.internode.on.net ([203.16.214.140])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NG3Of-00031S-Ji
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 04:34:36 +0000
Received: from [192.168.14.33] ([192.168.14.33])
	(authenticated user iwo@call-direct.com.au)
	by mail.call-direct.com.au (Kerio MailServer 6.7.0)
	for linux-mtd@lists.infradead.org; Thu, 3 Dec 2009 15:28:09 +1100
Message-ID: <4B173FC4.5020901@call-direct.com.au>
Date: Thu, 03 Dec 2009 15:34:12 +1100
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Looks like a UBIFS bug...
References: <4B173CEB.5050103@call-direct.com.au>
In-Reply-To: <4B173CEB.5050103@call-direct.com.au>
Content-Type: multipart/mixed; boundary="------------010903020202060604090704"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010903020202060604090704
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Iwo Mergler wrote:
> Hi all,
> 
> I've got some weird UBIFS-related behaviour. I'd welcome
> any suggestions.
> 
> This is an ARM927-based embedded system with NAND FLASH,
> Kernel 2.6.32-rc8 with a custom MTD NAND driver.
> 
> While attempting to write a file to a UBIFS volume, UBIFS claims 
> 
> UBIFS error (pid 866): check_lpt_type: invalid type (15) in LPT node type 0
> 
> followed by "cannot reserve n bytes" messages every second or so.
> After this point the fs is read-only.
> 
> I don't know how to trigger it reliably, but while experimenting
> with different mtd partition sizes and debug levels, I was able
> to catch it with debug level 2 enabled. The full log is attached.

...well, should have been. Here it is.

Iwo




--------------010903020202060604090704
Content-Type: text/x-log;
 name="ubifs.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="ubifs.log"

Jan  1 00:00:09 r888 user.notice kernel: [    0.000000] Linux version 2.6.32-rc8 (iwo@iwo-linux) (gcc version 4.2.3) #1 Wed Dec 2 16:07:02 EST 2009
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] CPU: VIVT data cache, VIVT instruction cache
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] Machine: Atmel AT91SAM9x - Bovine
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] Memory policy: ECC disabled, Data cache writeback
Jan  1 00:00:09 r888 user.debug kernel: [    0.000000] On node 0 totalpages: 8192
Jan  1 00:00:09 r888 user.debug kernel: [    0.000000] free_area_init_node: node 0, pgdat c03600e0, node_mem_map c0904000
Jan  1 00:00:09 r888 user.debug kernel: [    0.000000]   Normal zone: 72 pages used for memmap
Jan  1 00:00:09 r888 user.debug kernel: [    0.000000]   Normal zone: 0 pages reserved
Jan  1 00:00:09 r888 user.debug kernel: [    0.000000]   Normal zone: 8120 pages, LIFO batch:0
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] Clocks: CPU 396 MHz, master 132 MHz, main 18.432 MHz
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 8120
Jan  1 00:00:09 r888 user.notice kernel: [    0.000000] Kernel command line: mem=32M console=ttyS0,115200 root=mtd:rfs user_debug=31 rootfstype=jffs2 rw emergency=kernel_crc mtdparts=at91_nand:0x00100000(S1S2EN),0x00400000(rkern),0x00b00000(rfs),0x00400000(kernel),0x0
Jan  1 00:00:09 r888 user.info kernel: [    0.000000] PID hash table entries: 128 (order: -3, 512 bytes)
Jan  1 00:00:09 r888 user.info kernel: [    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Jan  1 00:00:09 r888 user.info kernel: [    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Jan  1 00:00:09 r888 user.info kernel: [    0.000000] Memory: 32MB = 32MB total
Jan  1 00:00:09 r888 user.notice kernel: [    0.000000] Memory: 23216KB available (3052K code, 5946K data, 100K init, 0K highmem)
Jan  1 00:00:09 r888 user.info kernel: [    0.000000] SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Jan  1 00:00:09 r888 user.info kernel: [    0.000000] Hierarchical RCU implementation.
Jan  1 00:00:09 r888 user.info kernel: [    0.000000] NR_IRQS:192
Jan  1 00:00:09 r888 user.info kernel: [    0.000000] AT91: 96 gpio irqs in 3 banks
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] Console: colour dummy device 80x30
Jan  1 00:00:09 r888 user.info kernel: [    0.000000] console [ttyS0] enabled
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] ... MAX_LOCK_DEPTH:          48
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] ... CLASSHASH_SIZE:          4096
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] ... MAX_LOCKDEP_ENTRIES:     16384
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] ... MAX_LOCKDEP_CHAINS:      32768
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000] ... CHAINHASH_SIZE:          16384
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000]  memory used by lock dependency info: 3695 kB
Jan  1 00:00:09 r888 user.warn kernel: [    0.000000]  per task-struct memory footprint: 1152 bytes
Jan  1 00:00:09 r888 user.debug kernel: [    0.000000] ODEBUG: 3 of 3 active objects replaced
Jan  1 00:00:09 r888 user.info kernel: [    0.180000] Calibrating delay loop... 197.42 BogoMIPS (lpj=987136)
Jan  1 00:00:09 r888 user.warn kernel: [    0.390000] Mount-cache hash table entries: 512
Jan  1 00:00:09 r888 user.info kernel: [    0.400000] CPU: Testing write buffer coherency: ok
Jan  1 00:00:09 r888 user.info kernel: [    0.430000] NET: Registered protocol family 16
Jan  1 00:00:09 r888 user.info kernel: [    0.450000] Bovine fixups
Jan  1 00:00:09 r888 user.info kernel: [    0.460000] NAND Timing: STP=00010002, PLS=05030502, CYC=00060006, MDE=00030003
Jan  1 00:00:09 r888 user.info kernel: [    0.460000] Slew rate: slow, [AT91_MATRIX_EBICSA] => 3000a
Jan  1 00:00:09 r888 user.warn kernel: [    0.540000] bio: create slab <bio-0> at 0
Jan  1 00:00:09 r888 user.info kernel: [    0.550000] usbcore: registered new interface driver usbfs
Jan  1 00:00:09 r888 user.info kernel: [    0.560000] usbcore: registered new interface driver hub
Jan  1 00:00:09 r888 user.info kernel: [    0.570000] usbcore: registered new device driver usb
Jan  1 00:00:09 r888 user.info kernel: [    0.590000] cfg80211: Calling CRDA to update world regulatory domain
Jan  1 00:00:09 r888 user.info kernel: [    0.600000] Switching to clocksource pit
Jan  1 00:00:09 r888 user.info kernel: [    0.620000] NET: Registered protocol family 2
Jan  1 00:00:09 r888 user.info kernel: [    0.620000] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
Jan  1 00:00:09 r888 user.info kernel: [    0.640000] TCP established hash table entries: 1024 (order: 1, 8192 bytes)
Jan  1 00:00:09 r888 user.info kernel: [    0.650000] TCP bind hash table entries: 1024 (order: 3, 32768 bytes)
Jan  1 00:00:09 r888 user.info kernel: [    0.650000] TCP: Hash tables configured (established 1024 bind 1024)
Jan  1 00:00:09 r888 user.info kernel: [    0.660000] TCP reno registered
Jan  1 00:00:09 r888 user.info kernel: [    0.670000] NET: Registered protocol family 1
Jan  1 00:00:09 r888 user.info kernel: [    0.670000] RPC: Registered udp transport module.
Jan  1 00:00:09 r888 user.info kernel: [    0.680000] RPC: Registered tcp transport module.
Jan  1 00:00:09 r888 user.info kernel: [    0.680000] RPC: Registered tcp NFSv4.1 backchannel transport module.
Jan  1 00:00:09 r888 user.info kernel: [    0.810000] JFFS2 version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
Jan  1 00:00:09 r888 user.info kernel: [    0.820000] msgmni has been set to 45
Jan  1 00:00:09 r888 user.info kernel: [    0.840000] alg: No test for stdrng (krng)
Jan  1 00:00:09 r888 user.info kernel: [    0.850000] io scheduler noop registered
Jan  1 00:00:09 r888 user.info kernel: [    0.850000] io scheduler deadline registered (default)
Jan  1 00:00:09 r888 user.info kernel: [    1.000000] atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a ATMEL_SERIAL
Jan  1 00:00:09 r888 user.info kernel: [    1.020000] atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq = 6) is a ATMEL_SERIAL
Jan  1 00:00:09 r888 user.info kernel: [    1.030000] atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq = 7) is a ATMEL_SERIAL
Jan  1 00:00:09 r888 user.info kernel: [    1.070000] loop: module loaded
Jan  1 00:00:09 r888 user.info kernel: [    1.090000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB 3,3V 8-bit)
Jan  1 00:00:09 r888 user.info kernel: [    1.090000] NAND: Setting ECC page size to 2048
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] Bad block table found at page 131008, version 0x00
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x000002440000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x000002460000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x000004700000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x000004880000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x0000048a0000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x000004b40000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x0000089c0000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x0000089e0000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x000009b80000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x00000a460000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x00000ba80000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x00000c700000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x00000c880000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x00000c8a0000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x00000cb40000
Jan  1 00:00:09 r888 user.debug kernel: [    1.100000] nand_read_bbt: Bad block at 0x00000e3a0000
Jan  1 00:00:09 r888 user.notice kernel: [    1.100000] 7 cmdlinepart partitions found on MTD device at91_nand
Jan  1 00:00:09 r888 user.notice kernel: [    1.110000] Creating 7 MTD partitions on "at91_nand":
Jan  1 00:00:09 r888 user.notice kernel: [    1.120000] 0x000000000000-0x000000100000 : "S1S2EN"
Jan  1 00:00:09 r888 user.notice kernel: [    1.130000] 0x000000100000-0x000000500000 : "rkern"
Jan  1 00:00:09 r888 user.notice kernel: [    1.130000] 0x000000500000-0x000001000000 : "rfs"
Jan  1 00:00:09 r888 user.notice kernel: [    1.140000] 0x000001000000-0x000001400000 : "kernel"
Jan  1 00:00:09 r888 user.notice kernel: [    1.150000] 0x000001400000-0x000003440000 : "root"
Jan  1 00:00:09 r888 user.notice kernel: [    1.160000] 0x000003440000-0x0000080c0000 : "usr"
Jan  1 00:00:09 r888 user.notice kernel: [    1.170000] 0x0000080c0000-0x000010000000 : "opt"
Jan  1 00:00:09 r888 user.info kernel: [    1.250000] MACB_mii_bus: probed
Jan  1 00:00:09 r888 user.info kernel: [    1.250000] eth0: Atmel MACB at 0xfffc4000 irq 21 (02:00:78:e3:04:0f)
Jan  1 00:00:09 r888 user.info kernel: [    1.260000] eth0: attached PHY driver [SMSC LAN8700] (mii_bus:phy_addr=ffffffff:1f, irq=-1)
Jan  1 00:00:09 r888 user.info kernel: [    1.270000] udc: at91_udc version 3 May 2006
Jan  1 00:00:09 r888 user.info kernel: [    1.280000] i2c /dev entries driver
Jan  1 00:00:09 r888 user.info kernel: [    1.290000] AT91SAM9 Watchdog enabled (heartbeat=15 sec, nowayout=1)
Jan  1 00:00:09 r888 user.info kernel: [    1.290000] Reset registers:
Jan  1 00:00:09 r888 user.info kernel: [    1.300000] SR: 00010300
Jan  1 00:00:09 r888 user.info kernel: [    1.300000] MR: 00000C01
Jan  1 00:00:09 r888 user.info kernel: [    1.300000] WDT registers:
Jan  1 00:00:09 r888 user.info kernel: [    1.310000] MR: 1FFF61FF
Jan  1 00:00:09 r888 user.info kernel: [    1.310000] SR: 00000000
Jan  1 00:00:09 r888 user.info kernel: [    1.310000] Registered led device: power
Jan  1 00:00:09 r888 user.info kernel: [    1.320000] Registered led device: wwan
Jan  1 00:00:09 r888 user.info kernel: [    1.320000] Registered led device: dcd
Jan  1 00:00:09 r888 user.info kernel: [    1.330000] Registered led device: service
Jan  1 00:00:09 r888 user.info kernel: [    1.340000] Registered led device: rssi
Jan  1 00:00:09 r888 user.info kernel: [    1.350000] GRE over IPv4 tunneling driver
Jan  1 00:00:09 r888 user.info kernel: [    1.360000] TCP cubic registered
Jan  1 00:00:09 r888 user.info kernel: [    1.370000] NET: Registered protocol family 17
Jan  1 00:00:09 r888 user.notice kernel: [    1.370000] Bridge firewalling registered
Jan  1 00:00:09 r888 user.warn kernel: [    1.380000] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
Jan  1 00:00:09 r888 user.info kernel: [    1.490000] NAND/ECC 00DFA000: ECC==0, skipping ECC
Jan  1 00:00:09 r888 user.info kernel: [    1.490000] NAND/ECC 00DFA800: ECC==0, skipping ECC
Jan  1 00:00:09 r888 user.info kernel: [    1.500000] NAND/ECC 00DFB000: ECC==0, skipping ECC
Jan  1 00:00:09 r888 user.info kernel: [    1.500000] NAND/ECC 00DFB800: ECC==0, skipping ECC (last message)
Jan  1 00:00:09 r888 user.warn kernel: [    1.510000] Empty flash at 0x008f9dc8 ends at 0x008fa000
Jan  1 00:00:09 r888 user.info kernel: [    1.520000] NAND/ECC 00E1F800: ignoring erased page
Jan  1 00:00:09 r888 user.info kernel: [    1.530000] NAND/ECC 00E00000: ignoring erased page
Jan  1 00:00:09 r888 user.info kernel: [    1.530000] NAND/ECC 00E3F800: ignoring erased page
Jan  1 00:00:09 r888 user.info kernel: [    1.540000] NAND/ECC 00E20000: ignoring erased page (last message)
Jan  1 00:00:09 r888 user.notice kernel: [    1.560000] JFFS2 notice: (1) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
Jan  1 00:00:09 r888 user.warn kernel: [    1.580000] VFS: Mounted root (jffs2 filesystem) on device 31:2.
Jan  1 00:00:09 r888 user.info kernel: [    1.590000] Freeing init memory: 100K
Jan  1 00:00:09 r888 user.warn kernel: [    5.000000] cdcs_DD: module license 'CDCS Proprietary' taints kernel.
Jan  1 00:00:09 r888 user.warn kernel: [    5.000000] Disabling lock d
Jan  1 00:00:09 r888 user.info kernel: ebugging due to kernel taint
Jan  1 00:00:09 r888 user.info kernel: [    5.040000] Start cdcsDD, compiled Dec  3 2009 09:17:42
Jan  1 00:00:09 r888 user.info kernel: [    8.250000] eth0: link up (100/Full)
Jan  1 00:00:09 r888 user.info kernel: [    8.300000] ledtrig-cdcs: Registering CDCS LED trigger group. (Dec  2 2009 16:05:21)
Jan  1 00:00:09 r888 user.info kernel: [    9.110000] usbcore: registered new interface driver sierra_net
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/nf_conntrack
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/nf_conntrack
Jan  1 00:00:10 r888 user.warn kernel: [   10.070000] nf_conntrack version 0.5.0 (364 buckets, 1456 max)
Jan  1 00:00:10 r888 user.notice hotplug: add, /kernel/slab/nf_conntrack
Jan  1 00:00:10 r888 user.notice hotplug: add, /kernel/slab/nf_conntrack
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/x_tables
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/x_tables
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/nf_defrag_ipv4
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/nf_conntrack_ipv4
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/nf_defrag_ipv4
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/nf_conntrack_ipv4
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/nf_nat
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/nf_nat
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/ipt_MASQUERADE
Jan  1 00:00:10 r888 user.notice hotplug: add, /module/ipt_MASQUERADE
Jan  1 00:00:11 r888 user.info kernel: [   11.170000] ip_tables: (C) 2000-2006 Netfilter Core Team
Jan  1 00:00:11 r888 user.notice hotplug: add, /module/ip_tables
Jan  1 00:00:11 r888 user.notice hotplug: add, /module/ip_tables
Jan  1 00:00:11 r888 user.notice hotplug: add, /module/iptable_nat
Jan  1 00:00:11 r888 user.notice hotplug: add, /module/iptable_nat
Jan  1 00:00:29 r888 auth.info login[694]: root login on 'pts/0'
Jan  1 00:00:56 r888 user.notice hotplug: add, /module/crc16
Jan  1 00:00:56 r888 user.notice hotplug: add, /module/crc16
Jan  1 00:00:56 r888 user.notice hotplug: add, /module/ubi
Jan  1 00:00:57 r888 user.notice hotplug: add, /module/ubi
Jan  1 00:00:57 r888 user.notice hotplug: add, /class/misc/ubi_ctrl
Jan  1 00:00:57 r888 user.notice hotplug: add, /class/ubi
Jan  1 00:00:57 r888 user.notice hotplug: add, /class/ubi
Jan  1 00:00:57 r888 user.notice hotplug: add, /class/misc/ubi_ctrl
Jan  1 00:00:57 r888 user.notice hotplug: add, /module/ubifs
Jan  1 00:00:57 r888 user.notice hotplug: add, /module/ubifs
Jan  1 00:00:57 r888 user.notice hotplug: add, /kernel/slab/ubifs_inode_slab
Jan  1 00:00:57 r888 user.notice hotplug: add, /kernel/slab/ubifs_inode_slab
Jan  1 00:00:57 r888 user.notice hotplug: add, /module/lzo_decompress
Jan  1 00:00:57 r888 user.notice hotplug: add, /module/lzo_compress
Jan  1 00:00:57 r888 user.notice hotplug: add, /module/lzo_decompress
Jan  1 00:00:58 r888 user.notice hotplug: add, /module/lzo_compress
Jan  1 00:00:58 r888 user.notice hotplug: add, /module/lzo
Jan  1 00:00:58 r888 user.notice hotplug: add, /module/lzo
Jan  1 00:00:58 r888 user.notice hotplug: add, /module/deflate
Jan  1 00:00:58 r888 user.notice hotplug: add, /module/deflate
Jan  1 00:00:58 r888 user.notice kernel: [   58.800000] UBI: attaching mtd5 to ubi0
Jan  1 00:00:58 r888 user.notice kernel: [   58.800000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
Jan  1 00:00:58 r888 user.notice kernel: [   58.810000] UBI: logical eraseblock size:    126976 bytes
Jan  1 00:00:58 r888 user.notice kernel: [   58.810000] UBI: smallest flash I/O unit:    2048
Jan  1 00:00:58 r888 user.notice kernel: [   58.820000] UBI: VID header offset:          2048 (aligned 2048)
Jan  1 00:00:58 r888 user.notice kernel: [   58.820000] UBI: data offset:                4096
Jan  1 00:00:58 r888 user.notice kernel: [   58.970000] UBI: empty MTD device detected
Jan  1 00:00:58 r888 user.notice kernel: [   58.970000] UBI: create volume table (copy #1)
Jan  1 00:00:58 r888 user.notice kernel: [   58.980000] UBI: create volume table (copy #2)
Jan  1 00:00:59 r888 user.notice kernel: [   59.010000] UBI: attached mtd5 to ubi0
Jan  1 00:00:59 r888 user.notice kernel: [   59.010000] UBI: MTD device name:            "usr"
Jan  1 00:00:59 r888 user.notice kernel: [   59.020000] UBI: MTD device size:            76 MiB
Jan  1 00:00:59 r888 user.notice kernel: [   59.020000] UBI: number of good PEBs:        608
Jan  1 00:00:59 r888 user.notice kernel: [   59.030000] UBI: number of bad PEBs:         4
Jan  1 00:00:59 r888 user.notice kernel: [   59.030000] UBI: max. allowed volumes:       128
Jan  1 00:00:59 r888 user.notice kernel: [   59.030000] UBI: wear-leveling threshold:    4096
Jan  1 00:00:59 r888 user.notice kernel: [   59.040000] UBI: number of internal volumes: 1
Jan  1 00:00:59 r888 user.notice kernel: [   59.040000] UBI: number of user volumes:     0
Jan  1 00:00:59 r888 user.notice kernel: [   59.050000] UBI: available PEBs:             598
Jan  1 00:00:59 r888 user.notice kernel: [   59.050000] UBI: total number of reserved PEBs: 10
Jan  1 00:00:59 r888 user.notice kernel: [   59.060000] UBI: number of PEBs reserved for bad PEB handling: 6
Jan  1 00:00:59 r888 user.notice kernel: [   59.060000] UBI: max/mean erase counter: 0/0
Jan  1 00:00:59 r888 user.notice kernel: [   59.070000] UBI: image sequence number: 0
Jan  1 00:00:59 r888 user.notice kernel: [   59.080000] UBI: background thread "ubi_bgt0d" started, PID 779
Jan  1 00:00:59 r888 user.notice hotplug: add, /class/ubi/ubi0
Jan  1 00:00:59 r888 user.notice hotplug: add, /class/ubi/ubi0
Jan  1 00:00:59 r888 user.notice kernel: [   59.240000] UBI: attaching mtd6 to ubi1
Jan  1 00:00:59 r888 user.notice kernel: [   59.240000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
Jan  1 00:00:59 r888 user.notice kernel: [   59.250000] UBI: logical eraseblock size:    126976 bytes
Jan  1 00:00:59 r888 user.notice kernel: [   59.250000] UBI: smallest flash I/O unit:    2048
Jan  1 00:00:59 r888 user.notice kernel: [   59.260000] UBI: VID header offset:          2048 (aligned 2048)
Jan  1 00:00:59 r888 user.notice kernel: [   59.260000] UBI: data offset:                4096
Jan  1 00:00:59 r888 user.notice kernel: [   59.730000] UBI: empty MTD device detected
Jan  1 00:00:59 r888 user.notice kernel: [   59.740000] UBI: create volume table (copy #1)
Jan  1 00:00:59 r888 user.notice kernel: [   59.750000] UBI: create volume table (copy #2)
Jan  1 00:00:59 r888 user.notice kernel: [   59.780000] UBI: attached mtd6 to ubi1
Jan  1 00:00:59 r888 user.notice kernel: [   59.780000] UBI: MTD device name:            "opt"
Jan  1 00:00:59 r888 user.notice kernel: [   59.790000] UBI: MTD device size:            127 MiB
Jan  1 00:00:59 r888 user.notice kernel: [   59.790000] UBI: number of good PEBs:        1004
Jan  1 00:00:59 r888 user.notice kernel: [   59.800000] UBI: number of bad PEBs:         14
Jan  1 00:00:59 r888 user.notice kernel: [   59.800000] UBI: max. allowed volumes:       128
Jan  1 00:00:59 r888 user.notice kernel: [   59.810000] UBI: wear-leveling threshold:    4096
Jan  1 00:00:59 r888 user.notice kernel: [   59.810000] UBI: number of internal volumes: 1
Jan  1 00:00:59 r888 user.notice kernel: [   59.810000] UBI: number of user volumes:     0
Jan  1 00:00:59 r888 user.notice kernel: [   59.820000] UBI: available PEBs:             990
Jan  1 00:00:59 r888 user.notice kernel: [   59.820000] UBI: total number of reserved PEBs: 14
Jan  1 00:00:59 r888 user.notice kernel: [   59.830000] UBI: number of PEBs reserved for bad PEB handling: 10
Jan  1 00:00:59 r888 user.notice kernel: [   59.830000] UBI: max/mean erase counter: 0/0
Jan  1 00:00:59 r888 user.notice kernel: [   59.840000] UBI: image sequence number: 0
Jan  1 00:00:59 r888 user.notice kernel: [   59.850000] UBI: background thread "ubi_bgt1d" started, PID 785
Jan  1 00:00:59 r888 user.notice hotplug: add, /class/ubi/ubi1
Jan  1 00:01:00 r888 user.notice hotplug: add, /class/ubi/ubi1
Jan  1 00:01:00 r888 user.notice hotplug: add, /class/ubi/ubi0/ubi0_0
Jan  1 00:01:00 r888 user.notice hotplug: add, /class/ubi/ubi0/ubi0_0
Jan  1 00:01:01 r888 user.notice hotplug: add, /class/ubi/ubi1/ubi1_0
Jan  1 00:01:01 r888 user.debug kernel: [   61.110000] UBIFS DBG (pid 800): ubifs_get_sb: name ubi0:usrl, flags 0x20008000
Jan  1 00:01:01 r888 user.debug kernel: [   61.110000] UBIFS DBG (pid 800): ubifs_get_sb: opened ubi0_0
Jan  1 00:01:01 r888 user.notice hotplug: add, /class/ubi/ubi1/ubi1_0
Jan  1 00:01:01 r888 user.debug kernel: [   61.140000] UBIFS DBG (pid 800): create_default_filesystem: LEB Properties Tree created (LEBs 6-7)
Jan  1 00:01:01 r888 user.debug kernel: [   61.140000] UBIFS DBG (pid 800): create_default_filesystem: default superblock created at LEB 0:0
Jan  1 00:01:01 r888 user.debug kernel: [   61.150000] UBIFS DBG (pid 800): create_default_filesystem: default master node created at LEB 1:0
Jan  1 00:01:01 r888 user.debug kernel: [   61.150000] UBIFS DBG (pid 800): create_default_filesystem: default root indexing node created LEB 10:0
Jan  1 00:01:01 r888 user.debug kernel: [   61.180000] UBIFS DBG (pid 800): create_default_filesystem: root inode created at LEB 11:0
Jan  1 00:01:01 r888 user.notice kernel: [   61.180000] UBIFS: default file-system created
Jan  1 00:01:01 r888 user.debug kernel: [   61.200000] UBIFS DBG (pid 805): ubifs_bg_thread: background thread "ubifs_bgt0_0" started, PID 805
Jan  1 00:01:01 r888 user.debug kernel: [   61.240000] UBIFS DBG (pid 800): ubifs_replay_journal: start replaying the journal
Jan  1 00:01:01 r888 user.debug kernel: [   61.240000] UBIFS DBG (pid 800): replay_log_leb: replay log LEB 3:0
Jan  1 00:01:01 r888 user.notice hotplug: add, /class/bdi/ubifs_0_0
Jan  1 00:01:01 r888 user.debug kernel: [   61.270000] UBIFS DBG (pid 800): replay_log_leb: commit start sqnum 7
Jan  1 00:01:01 r888 user.debug kernel: [   61.270000] UBIFS DBG (pid 800): replay_log_leb: replay log LEB 4:0
Jan  1 00:01:01 r888 user.debug kernel: [   61.270000] UBIFS DBG (pid 800): ubifs_replay_journal: finished, log head LEB 3:2048, max_sqnum 7, highest_inum 64
Jan  1 00:01:01 r888 user.notice hotplug: add, /class/bdi/ubifs_0_0
Jan  1 00:01:02 r888 user.notice kernel: [   62.260000] UBIFS: mounted UBI device 0, volume 0, name "usrl"
Jan  1 00:01:02 r888 user.notice kernel: [   62.270000] UBIFS: file system size:   74661888 bytes (72912 KiB, 71 MiB, 588 LEBs)
Jan  1 00:01:02 r888 user.notice kernel: [   62.270000] UBIFS: journal size:       3682304 bytes (3596 KiB, 3 MiB, 29 LEBs)
Jan  1 00:01:02 r888 user.notice kernel: [   62.280000] UBIFS: media format:       w4/r0 (latest is w4/r0)
Jan  1 00:01:02 r888 user.notice kernel: [   62.290000] UBIFS: default compressor: lzo
Jan  1 00:01:02 r888 user.notice kernel: [   62.290000] UBIFS: reserved for root:  3526465 bytes (3443 KiB)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: compiled on:         Dec  3 2009 at 12:36:00
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: min. I/O unit size:  2048 bytes
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: LEB size:            126976 bytes (124 KiB)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: data journal heads:  1
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: UUID:                59C4B920-D2DC-4060-8C0A-ADD178DB0055
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: big_lpt              0
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: log LEBs:            3 (3 - 5)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: LPT area LEBs:       2 (6 - 7)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: orphan area LEBs:    2 (8 - 9)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: main area LEBs:      588 (10 - 597)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: index LEBs:          1
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: total index bytes:   48 (0 KiB, 0 MiB)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: key hash type:       0
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: tree fanout:         8
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: reserved GC LEB:     12
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: first main LEB:      10
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: max. znode size      240
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: max. index node size 192
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: node sizes:          data 48, inode 160, dentry 56
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: node sizes:          trun 56, sb 4096, master 512
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: node sizes:          ref 64, cmt. start 32, orph 32
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: max. node sizes:     data 4144, inode 4256 dentry 312
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: dead watermark:      2048
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: dark watermark:      6144
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: LEB overhead:        2656
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: max. dark space:     3612672 (3528 KiB, 3 MiB)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: maximum bud bytes:   3301376 (3224 KiB, 3 MiB)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: BG commit bud bytes: 2682368 (2619 KiB, 2 MiB)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: current bud bytes    0 (0 KiB, 0 MiB)
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: max. seq. number:    7
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): mount_ubifs: commit number:       0
Jan  1 00:01:02 r888 user.debug kernel: [   62.300000] UBIFS DBG (pid 800): ubifs_iget: inode 1
Jan  1 00:01:02 r888 user.debug kernel: [   62.350000] UBIFS DBG (pid 809): ubifs_get_sb: name ubi1:opt, flags 0x20008000
Jan  1 00:01:02 r888 user.debug kernel: [   62.350000] UBIFS DBG (pid 809): ubifs_get_sb: opened ubi1_0
Jan  1 00:01:02 r888 user.debug kernel: [   62.380000] UBIFS DBG (pid 809): create_default_filesystem: LEB Properties Tree created (LEBs 7-8)
Jan  1 00:01:02 r888 user.debug kernel: [   62.410000] UBIFS DBG (pid 809): create_default_filesystem: default superblock created at LEB 0:0
Jan  1 00:01:02 r888 user.debug kernel: [   62.410000] UBIFS DBG (pid 809): create_default_filesystem: default master node created at LEB 1:0
Jan  1 00:01:02 r888 user.debug kernel: [   62.410000] UBIFS DBG (pid 809): create_default_filesystem: default root indexing node created LEB 11:0
Jan  1 00:01:02 r888 user.debug kernel: [   62.410000] UBIFS DBG (pid 809): create_default_filesystem: root inode created at LEB 12:0
Jan  1 00:01:02 r888 user.notice kernel: [   62.410000] UBIFS: default file-system created
Jan  1 00:01:02 r888 user.notice hotplug: add, /class/bdi/ubifs_1_0
Jan  1 00:01:02 r888 user.debug kernel: [   62.440000] UBIFS DBG (pid 813): ubifs_bg_thread: background thread "ubifs_bgt1_0" started, PID 813
Jan  1 00:01:02 r888 user.debug kernel: [   62.480000] UBIFS DBG (pid 809): ubifs_replay_journal: start replaying the journal
Jan  1 00:01:02 r888 user.debug kernel: [   62.480000] UBIFS DBG (pid 809): replay_log_leb: replay log LEB 3:0
Jan  1 00:01:02 r888 user.notice hotplug: add, /class/bdi/ubifs_1_0
Jan  1 00:01:02 r888 user.debug kernel: [   62.520000] UBIFS DBG (pid 809): replay_log_leb: commit start sqnum 7
Jan  1 00:01:02 r888 user.debug kernel: [   62.520000] UBIFS DBG (pid 809): replay_log_leb: replay log LEB 4:0
Jan  1 00:01:02 r888 user.debug kernel: [   62.520000] UBIFS DBG (pid 809): ubifs_replay_journal: finished, log head LEB 3:2048, max_sqnum 7, highest_inum 64
Jan  1 00:01:04 r888 user.notice kernel: [   64.090000] UBIFS: mounted UBI device 1, volume 0, name "opt"
Jan  1 00:01:04 r888 user.notice kernel: [   64.100000] UBIFS: file system size:   124309504 bytes (121396 KiB, 118 MiB, 979 LEBs)
Jan  1 00:01:04 r888 user.notice kernel: [   64.100000] UBIFS: journal size:       6221824 bytes (6076 KiB, 5 MiB, 49 LEBs)
Jan  1 00:01:04 r888 user.notice kernel: [   64.110000] UBIFS: media format:       w4/r0 (latest is w4/r0)
Jan  1 00:01:04 r888 user.notice kernel: [   64.120000] UBIFS: default compressor: lzo
Jan  1 00:01:04 r888 user.notice kernel: [   64.120000] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: compiled on:         Dec  3 2009 at 12:36:00
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: min. I/O unit size:  2048 bytes
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: LEB size:            126976 bytes (124 KiB)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: data journal heads:  1
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: UUID:                88DFCAAE-0623-4446-BDE0-066D5BE64A4A
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: big_lpt              0
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: log LEBs:            4 (3 - 6)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: LPT area LEBs:       2 (7 - 8)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: orphan area LEBs:    2 (9 - 10)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: main area LEBs:      979 (11 - 989)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: index LEBs:          1
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: total index bytes:   48 (0 KiB, 0 MiB)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: key hash type:       0
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: tree fanout:         8
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: reserved GC LEB:     13
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: first main LEB:      11
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: max. znode size      240
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: max. index node size 192
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: node sizes:          data 48, inode 160, dentry 56
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: node sizes:          trun 56, sb 4096, master 512
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: node sizes:          ref 64, cmt. start 32, orph 32
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: max. node sizes:     data 4144, inode 4256 dentry 312
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: dead watermark:      2048
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: dark watermark:      6144
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: LEB overhead:        2656
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: max. dark space:     6014976 (5874 KiB, 5 MiB)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: maximum bud bytes:   5713920 (5580 KiB, 5 MiB)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: BG commit bud bytes: 4642560 (4533 KiB, 4 MiB)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: current bud bytes    0 (0 KiB, 0 MiB)
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: max. seq. number:    7
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): mount_ubifs: commit number:       0
Jan  1 00:01:04 r888 user.debug kernel: [   64.130000] UBIFS DBG (pid 809): ubifs_iget: inode 1
Jan  1 00:01:04 r888 user.debug kernel: [   64.220000] UBIFS DBG (pid 817): ubifs_lookup: 'flashtoolMsg.txt' in dir ino 1
Jan  1 00:01:04 r888 user.debug kernel: [   64.220000] UBIFS DBG (pid 817): ubifs_lookup: not found
Jan  1 00:01:06 r888 user.debug kernel: [   66.500000] UBIFS DBG (pid 836): ubifs_get_sb: name ubi0:usrl, flags 0x20008000
Jan  1 00:01:06 r888 user.debug kernel: [   66.500000] UBIFS DBG (pid 836): ubifs_get_sb: opened ubi0_0
Jan  1 00:01:06 r888 user.debug kernel: [   66.500000] UBIFS DBG (pid 836): ubifs_get_sb: this ubi volume is already mounted
Jan  1 00:01:06 r888 user.debug kernel: [   66.520000] UBIFS DBG (pid 837): ubifs_get_sb: name ubi1:opt, flags 0x20008000
Jan  1 00:01:06 r888 user.debug kernel: [   66.520000] UBIFS DBG (pid 837): ubifs_get_sb: opened ubi1_0
Jan  1 00:01:06 r888 user.debug kernel: [   66.520000] UBIFS DBG (pid 837): ubifs_get_sb: this ubi volume is already mounted
Jan  1 00:01:06 r888 user.debug kernel: [   66.590000] UBIFS DBG (pid 839): ubifs_statfs: free space 114245390 bytes (27891 blocks)
Jan  1 00:01:06 r888 user.debug kernel: [   66.630000] UBIFS DBG (pid 841): ubifs_lookup: 'cdcs' in dir ino 1
Jan  1 00:01:06 r888 user.debug kernel: [   66.630000] UBIFS DBG (pid 841): ubifs_lookup: not found
Jan  1 00:01:06 r888 user.debug kernel: [   66.630000] UBIFS DBG (pid 841): ubifs_mkdir: dent 'cdcs', mode 0x1ed in dir ino 1
Jan  1 00:01:06 r888 user.debug kernel: [   66.630000] UBIFS DBG (pid 841): ubifs_jnl_update: ino 65, dent 'cdcs', data len 0 in dir ino 1
Jan  1 00:01:06 r888 user.debug kernel: [   66.630000] UBIFS DBG (pid 841): ubifs_find_free_space: min_space 384
Jan  1 00:01:06 r888 user.debug kernel: [   66.630000] UBIFS DBG (pid 841): ubifs_find_free_space: found LEB 12, free 124928
Jan  1 00:01:06 r888 user.debug kernel: [   66.630000] UBIFS DBG (pid 841): write_head: jhead 1 (base), LEB 12:2048, len 384
Jan  1 00:01:06 r888 user.debug kernel: [   66.630000] UBIFS DBG (pid 841): ubifs_setattr: ino 65, mode 0x41ed, ia_valid 0x41
Jan  1 00:01:06 r888 user.debug kernel: [   66.630000] UBIFS DBG (pid 841): ubifs_dirty_inode: inode 65
Jan  1 00:01:06 r888 user.debug kernel: [   66.680000] UBIFS DBG (pid 843): ubifs_lookup: 'upload' in dir ino 65
Jan  1 00:01:06 r888 user.debug kernel: [   66.680000] UBIFS DBG (pid 843): ubifs_lookup: not found
Jan  1 00:01:06 r888 user.debug kernel: [   66.680000] UBIFS DBG (pid 843): ubifs_mkdir: dent 'upload', mode 0x1ed in dir ino 65
Jan  1 00:01:06 r888 user.debug kernel: [   66.680000] UBIFS DBG (pid 843): ubifs_jnl_update: ino 66, dent 'upload', data len 0 in dir ino 65
Jan  1 00:01:06 r888 user.debug kernel: [   66.680000] UBIFS DBG (pid 843): write_head: jhead 1 (base), LEB 12:2432, len 384
Jan  1 00:01:06 r888 user.debug kernel: [   66.680000] UBIFS DBG (pid 843): ubifs_setattr: ino 66, mode 0x41ed, ia_valid 0x41
Jan  1 00:01:06 r888 user.debug kernel: [   66.680000] UBIFS DBG (pid 843): ubifs_dirty_inode: inode 66
Jan  1 00:01:06 r888 user.debug kernel: [   66.720000] UBIFS DBG (pid 845): ubifs_readdir: dir ino 66, f_pos 0x0
Jan  1 00:01:06 r888 user.debug kernel: [   66.720000] UBIFS DBG (pid 845): ubifs_readdir: dir ino 66, f_pos 0x2
Jan  1 00:01:07 r888 user.debug kernel: [   67.560000] UBIFS DBG (pid 862): ubifs_get_sb: name ubi0:usrl, flags 0x20008000
Jan  1 00:01:07 r888 user.debug kernel: [   67.560000] UBIFS DBG (pid 862): ubifs_get_sb: opened ubi0_0
Jan  1 00:01:07 r888 user.debug kernel: [   67.560000] UBIFS DBG (pid 862): ubifs_get_sb: this ubi volume is already mounted
Jan  1 00:01:07 r888 user.debug kernel: [   67.590000] UBIFS DBG (pid 863): ubifs_get_sb: name ubi1:opt, flags 0x20008000
Jan  1 00:01:07 r888 user.debug kernel: [   67.590000] UBIFS DBG (pid 863): ubifs_get_sb: opened ubi1_0
Jan  1 00:01:07 r888 user.debug kernel: [   67.590000] UBIFS DBG (pid 863): ubifs_get_sb: this ubi volume is already mounted

************************* Start file write *****************************

Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): ubifs_lookup: 'MPR_547_6.tmp' in dir ino 66
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): ubifs_lookup: not found
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): ubifs_create: dent 'MPR_547_6.tmp', mode 0x81a4 in dir ino 66
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): ubifs_jnl_update: ino 67, dent 'MPR_547_6.tmp', data len 0 in dir ino 66
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): write_head: jhead 1 (base), LEB 12:4096, len 392
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): ubifs_setattr: ino 67, mode 0x81a4, ia_valid 0x8068
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): do_setattr: size 0 -> 0
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): ubifs_dirty_inode: inode 67
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 0, i_size 0, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 0, pg 0, len 3854, copied 3854, i_size 0
Jan  1 00:01:26 r888 user.debug kernel: [   86.290000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 3854, pg 0, len 242, copied 242, i_size 3854
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 1, i_size 4096, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 4096, pg 1, len 3854, copied 3854, i_size 4096
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 7950, pg 1, len 242, copied 242, i_size 7950
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 2, i_size 8192, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 8192, pg 2, len 3854, copied 3854, i_size 8192
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 12046, pg 2, len 242, copied 242, i_size 12046
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 3, i_size 12288, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 12288, pg 3, len 3854, copied 3854, i_size 12288
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 16142, pg 3, len 242, copied 242, i_size 16142
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 4, i_size 16384, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 16384, pg 4, len 3854, copied 3854, i_size 16384
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 20238, pg 4, len 242, copied 242, i_size 20238
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 5, i_size 20480, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 20480, pg 5, len 3854, copied 3854, i_size 20480
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 24334, pg 5, len 242, copied 242, i_size 24334
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 6, i_size 24576, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.310000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 24576, pg 6, len 3854, copied 3854, i_size 24576
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 28430, pg 6, len 242, copied 242, i_size 28430
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 7, i_size 28672, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 28672, pg 7, len 3854, copied 3854, i_size 28672
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 32526, pg 7, len 242, copied 242, i_size 32526
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 8, i_size 32768, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 32768, pg 8, len 3854, copied 3854, i_size 32768
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 36622, pg 8, len 242, copied 242, i_size 36622
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 9, i_size 36864, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 36864, pg 9, len 3854, copied 3854, i_size 36864
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 40718, pg 9, len 242, copied 242, i_size 40718
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 10, i_size 40960, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 40960, pg 10, len 3854, copied 3854, i_size 40960
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 44814, pg 10, len 242, copied 242, i_size 44814
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 11, i_size 45056, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 45056, pg 11, len 3854, copied 3854, i_size 45056
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 48910, pg 11, len 242, copied 242, i_size 48910
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 12, i_size 49152, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 49152, pg 12, len 3854, copied 3854, i_size 49152
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 53006, pg 12, len 242, copied 242, i_size 53006
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 13, i_size 53248, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 53248, pg 13, len 3854, copied 3854, i_size 53248
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 57102, pg 13, len 242, copied 242, i_size 57102
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 14, i_size 57344, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 57344, pg 14, len 3854, copied 3854, i_size 57344
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 61198, pg 14, len 242, copied 242, i_size 61198
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 15, i_size 61440, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 61440, pg 15, len 3854, copied 3854, i_size 61440
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 65294, pg 15, len 242, copied 242, i_size 65294
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 16, i_size 65536, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 65536, pg 16, len 3854, copied 3854, i_size 65536
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 69390, pg 16, len 242, copied 242, i_size 69390
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 17, i_size 69632, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 69632, pg 17, len 3854, copied 3854, i_size 69632
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 73486, pg 17, len 242, copied 242, i_size 73486
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 18, i_size 73728, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 73728, pg 18, len 3854, copied 3854, i_size 73728
Jan  1 00:01:26 r888 user.debug kernel: [   86.380000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 77582, pg 18, len 242, copied 242, i_size 77582
Jan  1 00:01:26 r888 user.debug kernel: [   86.380000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 19, i_size 77824, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.380000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 77824, pg 19, len 3854, copied 3854, i_size 77824
Jan  1 00:01:26 r888 user.debug kernel: [   86.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 81678, pg 19, len 242, copied 242, i_size 81678
Jan  1 00:01:26 r888 user.debug kernel: [   86.390000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 20, i_size 81920, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 81920, pg 20, len 3854, copied 3854, i_size 81920
Jan  1 00:01:26 r888 user.debug kernel: [   86.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 85774, pg 20, len 242, copied 242, i_size 85774
Jan  1 00:01:26 r888 user.debug kernel: [   86.390000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 21, i_size 86016, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 86016, pg 21, len 3854, copied 3854, i_size 86016
Jan  1 00:01:26 r888 user.debug kernel: [   86.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 89870, pg 21, len 242, copied 242, i_size 89870
Jan  1 00:01:26 r888 user.debug kernel: [   86.390000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 22, i_size 90112, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 90112, pg 22, len 3854, copied 3854, i_size 90112
Jan  1 00:01:26 r888 user.debug kernel: [   86.400000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 93966, pg 22, len 242, copied 242, i_size 93966
Jan  1 00:01:26 r888 user.debug kernel: [   86.400000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 23, i_size 94208, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.400000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 94208, pg 23, len 3854, copied 3854, i_size 94208
Jan  1 00:01:26 r888 user.debug kernel: [   86.400000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 98062, pg 23, len 242, copied 242, i_size 98062
Jan  1 00:01:26 r888 user.debug kernel: [   86.400000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 24, i_size 98304, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.400000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 98304, pg 24, len 3854, copied 3854, i_size 98304
Jan  1 00:01:26 r888 user.debug kernel: [   86.400000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 102158, pg 24, len 242, copied 242, i_size 102158
Jan  1 00:01:26 r888 user.debug kernel: [   86.400000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 25, i_size 102400, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 102400, pg 25, len 3854, copied 3854, i_size 102400
Jan  1 00:01:26 r888 user.debug kernel: [   86.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 106254, pg 25, len 242, copied 242, i_size 106254
Jan  1 00:01:26 r888 user.debug kernel: [   86.410000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 26, i_size 106496, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 106496, pg 26, len 3854, copied 3854, i_size 106496
Jan  1 00:01:26 r888 user.debug kernel: [   86.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 110350, pg 26, len 242, copied 242, i_size 110350
Jan  1 00:01:26 r888 user.debug kernel: [   86.410000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 27, i_size 110592, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 110592, pg 27, len 3854, copied 3854, i_size 110592
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 114446, pg 27, len 242, copied 242, i_size 114446
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 28, i_size 114688, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 114688, pg 28, len 3854, copied 3854, i_size 114688
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 118542, pg 28, len 242, copied 242, i_size 118542
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 29, i_size 118784, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 118784, pg 29, len 3854, copied 3854, i_size 118784
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 122638, pg 29, len 242, copied 242, i_size 122638
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 30, i_size 122880, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 122880, pg 30, len 3854, copied 3854, i_size 122880
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 126734, pg 30, len 242, copied 242, i_size 126734
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 31, i_size 126976, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.420000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 126976, pg 31, len 3854, copied 3854, i_size 126976
Jan  1 00:01:26 r888 user.debug kernel: [   86.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 130830, pg 31, len 242, copied 242, i_size 130830
Jan  1 00:01:26 r888 user.debug kernel: [   86.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 32, i_size 131072, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 131072, pg 32, len 3854, copied 3854, i_size 131072
Jan  1 00:01:26 r888 user.debug kernel: [   86.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 134926, pg 32, len 242, copied 242, i_size 134926
Jan  1 00:01:26 r888 user.debug kernel: [   86.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 33, i_size 135168, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 135168, pg 33, len 3854, copied 3854, i_size 135168
Jan  1 00:01:26 r888 user.debug kernel: [   86.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 139022, pg 33, len 242, copied 242, i_size 139022
Jan  1 00:01:26 r888 user.debug kernel: [   86.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 34, i_size 139264, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 139264, pg 34, len 3854, copied 3854, i_size 139264
Jan  1 00:01:26 r888 user.debug kernel: [   86.440000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 143118, pg 34, len 242, copied 242, i_size 143118
Jan  1 00:01:26 r888 user.debug kernel: [   86.440000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 35, i_size 143360, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.440000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 143360, pg 35, len 3854, copied 3854, i_size 143360
Jan  1 00:01:26 r888 user.debug kernel: [   86.440000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 147214, pg 35, len 242, copied 242, i_size 147214
Jan  1 00:01:26 r888 user.debug kernel: [   86.440000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 36, i_size 147456, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.440000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 147456, pg 36, len 3854, copied 3854, i_size 147456
Jan  1 00:01:26 r888 user.debug kernel: [   86.440000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 151310, pg 36, len 242, copied 242, i_size 151310
Jan  1 00:01:26 r888 user.debug kernel: [   86.440000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 37, i_size 151552, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.440000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 151552, pg 37, len 3854, copied 3854, i_size 151552
Jan  1 00:01:26 r888 user.debug kernel: [   86.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 155406, pg 37, len 242, copied 242, i_size 155406
Jan  1 00:01:26 r888 user.debug kernel: [   86.450000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 38, i_size 155648, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 155648, pg 38, len 3854, copied 3854, i_size 155648
Jan  1 00:01:26 r888 user.debug kernel: [   86.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 159502, pg 38, len 242, copied 242, i_size 159502
Jan  1 00:01:26 r888 user.debug kernel: [   86.450000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 39, i_size 159744, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 159744, pg 39, len 3854, copied 3854, i_size 159744
Jan  1 00:01:26 r888 user.debug kernel: [   86.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 163598, pg 39, len 242, copied 242, i_size 163598
Jan  1 00:01:26 r888 user.debug kernel: [   86.450000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 40, i_size 163840, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 163840, pg 40, len 3854, copied 3854, i_size 163840
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 167694, pg 40, len 242, copied 242, i_size 167694
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 41, i_size 167936, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 167936, pg 41, len 3854, copied 3854, i_size 167936
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 171790, pg 41, len 242, copied 242, i_size 171790
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 42, i_size 172032, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 172032, pg 42, len 3854, copied 3854, i_size 172032
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 175886, pg 42, len 242, copied 242, i_size 175886
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 43, i_size 176128, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.460000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 176128, pg 43, len 3854, copied 3854, i_size 176128
Jan  1 00:01:26 r888 user.debug kernel: [   86.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 179982, pg 43, len 242, copied 242, i_size 179982
Jan  1 00:01:26 r888 user.debug kernel: [   86.470000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 44, i_size 180224, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 180224, pg 44, len 3854, copied 3854, i_size 180224
Jan  1 00:01:26 r888 user.debug kernel: [   86.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 184078, pg 44, len 242, copied 242, i_size 184078
Jan  1 00:01:26 r888 user.debug kernel: [   86.470000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 45, i_size 184320, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 184320, pg 45, len 3854, copied 3854, i_size 184320
Jan  1 00:01:26 r888 user.debug kernel: [   86.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 188174, pg 45, len 242, copied 242, i_size 188174
Jan  1 00:01:26 r888 user.debug kernel: [   86.470000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 46, i_size 188416, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 188416, pg 46, len 3854, copied 3854, i_size 188416
Jan  1 00:01:26 r888 user.debug kernel: [   86.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 192270, pg 46, len 242, copied 242, i_size 192270
Jan  1 00:01:26 r888 user.debug kernel: [   86.480000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 47, i_size 192512, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 192512, pg 47, len 3854, copied 3854, i_size 192512
Jan  1 00:01:26 r888 user.debug kernel: [   86.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 196366, pg 47, len 242, copied 242, i_size 196366
Jan  1 00:01:26 r888 user.debug kernel: [   86.480000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 48, i_size 196608, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 196608, pg 48, len 3854, copied 3854, i_size 196608
Jan  1 00:01:26 r888 user.debug kernel: [   86.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 200462, pg 48, len 242, copied 242, i_size 200462
Jan  1 00:01:26 r888 user.debug kernel: [   86.480000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 49, i_size 200704, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 200704, pg 49, len 3854, copied 3854, i_size 200704
Jan  1 00:01:26 r888 user.debug kernel: [   86.490000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 204558, pg 49, len 242, copied 242, i_size 204558
Jan  1 00:01:26 r888 user.debug kernel: [   86.490000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 50, i_size 204800, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.490000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 204800, pg 50, len 3854, copied 3854, i_size 204800
Jan  1 00:01:26 r888 user.debug kernel: [   86.490000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 208654, pg 50, len 242, copied 242, i_size 208654
Jan  1 00:01:26 r888 user.debug kernel: [   86.490000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 51, i_size 208896, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.490000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 208896, pg 51, len 3854, copied 3854, i_size 208896
Jan  1 00:01:26 r888 user.debug kernel: [   86.490000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 212750, pg 51, len 242, copied 242, i_size 212750
Jan  1 00:01:26 r888 user.debug kernel: [   86.490000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 52, i_size 212992, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.490000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 212992, pg 52, len 3854, copied 3854, i_size 212992
Jan  1 00:01:26 r888 user.debug kernel: [   86.500000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 216846, pg 52, len 242, copied 242, i_size 216846
Jan  1 00:01:26 r888 user.debug kernel: [   86.500000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 53, i_size 217088, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.500000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 217088, pg 53, len 3854, copied 3854, i_size 217088
Jan  1 00:01:26 r888 user.debug kernel: [   86.500000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 220942, pg 53, len 242, copied 242, i_size 220942
Jan  1 00:01:26 r888 user.debug kernel: [   86.500000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 54, i_size 221184, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.500000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 221184, pg 54, len 3854, copied 3854, i_size 221184
Jan  1 00:01:26 r888 user.debug kernel: [   86.500000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 225038, pg 54, len 242, copied 242, i_size 225038
Jan  1 00:01:26 r888 user.debug kernel: [   86.500000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 55, i_size 225280, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.500000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 225280, pg 55, len 3854, copied 3854, i_size 225280
Jan  1 00:01:26 r888 user.debug kernel: [   86.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 229134, pg 55, len 242, copied 242, i_size 229134
Jan  1 00:01:26 r888 user.debug kernel: [   86.510000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 56, i_size 229376, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 229376, pg 56, len 3854, copied 3854, i_size 229376
Jan  1 00:01:26 r888 user.debug kernel: [   86.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 233230, pg 56, len 242, copied 242, i_size 233230
Jan  1 00:01:26 r888 user.debug kernel: [   86.510000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 57, i_size 233472, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 233472, pg 57, len 3854, copied 3854, i_size 233472
Jan  1 00:01:26 r888 user.debug kernel: [   86.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 237326, pg 57, len 242, copied 242, i_size 237326
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 58, i_size 237568, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 237568, pg 58, len 3854, copied 3854, i_size 237568
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 241422, pg 58, len 242, copied 242, i_size 241422
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 59, i_size 241664, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 241664, pg 59, len 3854, copied 3854, i_size 241664
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 245518, pg 59, len 242, copied 242, i_size 245518
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 60, i_size 245760, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 245760, pg 60, len 3854, copied 3854, i_size 245760
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 249614, pg 60, len 242, copied 242, i_size 249614
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 61, i_size 249856, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.520000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 249856, pg 61, len 3854, copied 3854, i_size 249856
Jan  1 00:01:26 r888 user.debug kernel: [   86.530000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 253710, pg 61, len 242, copied 242, i_size 253710
Jan  1 00:01:26 r888 user.debug kernel: [   86.530000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 62, i_size 253952, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.530000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 253952, pg 62, len 3854, copied 3854, i_size 253952
Jan  1 00:01:26 r888 user.debug kernel: [   86.530000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 257806, pg 62, len 242, copied 242, i_size 257806
Jan  1 00:01:26 r888 user.debug kernel: [   86.530000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 63, i_size 258048, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.530000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 258048, pg 63, len 3854, copied 3854, i_size 258048
Jan  1 00:01:26 r888 user.debug kernel: [   86.530000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 261902, pg 63, len 242, copied 242, i_size 261902
Jan  1 00:01:26 r888 user.debug kernel: [   86.530000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 64, i_size 262144, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.530000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 262144, pg 64, len 3854, copied 3854, i_size 262144
Jan  1 00:01:26 r888 user.debug kernel: [   86.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 265998, pg 64, len 242, copied 242, i_size 265998
Jan  1 00:01:26 r888 user.debug kernel: [   86.540000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 65, i_size 266240, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 266240, pg 65, len 3854, copied 3854, i_size 266240
Jan  1 00:01:26 r888 user.debug kernel: [   86.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 270094, pg 65, len 242, copied 242, i_size 270094
Jan  1 00:01:26 r888 user.debug kernel: [   86.540000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 66, i_size 270336, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 270336, pg 66, len 3854, copied 3854, i_size 270336
Jan  1 00:01:26 r888 user.debug kernel: [   86.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 274190, pg 66, len 242, copied 242, i_size 274190
Jan  1 00:01:26 r888 user.debug kernel: [   86.540000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 67, i_size 274432, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 274432, pg 67, len 3854, copied 3854, i_size 274432
Jan  1 00:01:26 r888 user.debug kernel: [   86.550000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 278286, pg 67, len 242, copied 242, i_size 278286
Jan  1 00:01:26 r888 user.debug kernel: [   86.550000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 68, i_size 278528, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.550000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 278528, pg 68, len 3854, copied 3854, i_size 278528
Jan  1 00:01:26 r888 user.debug kernel: [   86.550000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 282382, pg 68, len 242, copied 242, i_size 282382
Jan  1 00:01:26 r888 user.debug kernel: [   86.550000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 69, i_size 282624, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.550000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 282624, pg 69, len 3854, copied 3854, i_size 282624
Jan  1 00:01:26 r888 user.debug kernel: [   86.550000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 286478, pg 69, len 242, copied 242, i_size 286478
Jan  1 00:01:26 r888 user.debug kernel: [   86.550000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 70, i_size 286720, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.550000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 286720, pg 70, len 3854, copied 3854, i_size 286720
Jan  1 00:01:26 r888 user.debug kernel: [   86.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 290574, pg 70, len 242, copied 242, i_size 290574
Jan  1 00:01:26 r888 user.debug kernel: [   86.560000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 71, i_size 290816, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 290816, pg 71, len 3854, copied 3854, i_size 290816
Jan  1 00:01:26 r888 user.debug kernel: [   86.570000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 294670, pg 71, len 242, copied 242, i_size 294670
Jan  1 00:01:26 r888 user.debug kernel: [   86.570000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 72, i_size 294912, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.570000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 294912, pg 72, len 3854, copied 3854, i_size 294912
Jan  1 00:01:26 r888 user.debug kernel: [   86.570000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 298766, pg 72, len 242, copied 242, i_size 298766
Jan  1 00:01:26 r888 user.debug kernel: [   86.570000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 73, i_size 299008, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.570000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 299008, pg 73, len 3854, copied 3854, i_size 299008
Jan  1 00:01:26 r888 user.debug kernel: [   86.570000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 302862, pg 73, len 242, copied 242, i_size 302862
Jan  1 00:01:26 r888 user.debug kernel: [   86.580000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 74, i_size 303104, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 303104, pg 74, len 3854, copied 3854, i_size 303104
Jan  1 00:01:26 r888 user.debug kernel: [   86.590000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 306958, pg 74, len 242, copied 242, i_size 306958
Jan  1 00:01:26 r888 user.debug kernel: [   86.590000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 75, i_size 307200, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.590000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 307200, pg 75, len 3854, copied 3854, i_size 307200
Jan  1 00:01:26 r888 user.debug kernel: [   86.590000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 311054, pg 75, len 242, copied 242, i_size 311054
Jan  1 00:01:26 r888 user.debug kernel: [   86.590000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 76, i_size 311296, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.590000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 311296, pg 76, len 3854, copied 3854, i_size 311296
Jan  1 00:01:26 r888 user.debug kernel: [   86.590000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 315150, pg 76, len 242, copied 242, i_size 315150
Jan  1 00:01:26 r888 user.debug kernel: [   86.590000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 77, i_size 315392, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.590000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 315392, pg 77, len 3854, copied 3854, i_size 315392
Jan  1 00:01:26 r888 user.debug kernel: [   86.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 319246, pg 77, len 242, copied 242, i_size 319246
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 78, i_size 319488, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 319488, pg 78, len 3854, copied 3854, i_size 319488
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 323342, pg 78, len 242, copied 242, i_size 323342
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 79, i_size 323584, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 323584, pg 79, len 3854, copied 3854, i_size 323584
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 327438, pg 79, len 242, copied 242, i_size 327438
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 80, i_size 327680, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 327680, pg 80, len 3854, copied 3854, i_size 327680
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 331534, pg 80, len 242, copied 242, i_size 331534
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 81, i_size 331776, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.610000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 331776, pg 81, len 3854, copied 3854, i_size 331776
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 335630, pg 81, len 242, copied 242, i_size 335630
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 82, i_size 335872, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 335872, pg 82, len 3854, copied 3854, i_size 335872
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 339726, pg 82, len 242, copied 242, i_size 339726
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 83, i_size 339968, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 339968, pg 83, len 3854, copied 3854, i_size 339968
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 343822, pg 83, len 242, copied 242, i_size 343822
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 84, i_size 344064, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 344064, pg 84, len 3854, copied 3854, i_size 344064
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 347918, pg 84, len 242, copied 242, i_size 347918
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 85, i_size 348160, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 348160, pg 85, len 3854, copied 3854, i_size 348160
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 352014, pg 85, len 242, copied 242, i_size 352014
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 86, i_size 352256, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 352256, pg 86, len 3854, copied 3854, i_size 352256
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 356110, pg 86, len 242, copied 242, i_size 356110
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 87, i_size 356352, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.630000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 356352, pg 87, len 3854, copied 3854, i_size 356352
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 360206, pg 87, len 242, copied 242, i_size 360206
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 88, i_size 360448, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 360448, pg 88, len 3854, copied 3854, i_size 360448
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 364302, pg 88, len 242, copied 242, i_size 364302
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 89, i_size 364544, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 364544, pg 89, len 3854, copied 3854, i_size 364544
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 368398, pg 89, len 242, copied 242, i_size 368398
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 90, i_size 368640, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 368640, pg 90, len 3854, copied 3854, i_size 368640
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 372494, pg 90, len 242, copied 242, i_size 372494
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 91, i_size 372736, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 372736, pg 91, len 3854, copied 3854, i_size 372736
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 376590, pg 91, len 242, copied 242, i_size 376590
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 92, i_size 376832, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 376832, pg 92, len 3854, copied 3854, i_size 376832
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 380686, pg 92, len 242, copied 242, i_size 380686
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 93, i_size 380928, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.650000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 380928, pg 93, len 3854, copied 3854, i_size 380928
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 384782, pg 93, len 242, copied 242, i_size 384782
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 94, i_size 385024, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 385024, pg 94, len 3854, copied 3854, i_size 385024
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 388878, pg 94, len 242, copied 242, i_size 388878
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 95, i_size 389120, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 389120, pg 95, len 3854, copied 3854, i_size 389120
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 392974, pg 95, len 242, copied 242, i_size 392974
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 96, i_size 393216, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 393216, pg 96, len 3854, copied 3854, i_size 393216
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 397070, pg 96, len 242, copied 242, i_size 397070
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 97, i_size 397312, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 397312, pg 97, len 3854, copied 3854, i_size 397312
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 401166, pg 97, len 242, copied 242, i_size 401166
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 98, i_size 401408, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 401408, pg 98, len 3854, copied 3854, i_size 401408
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 405262, pg 98, len 242, copied 242, i_size 405262
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 99, i_size 405504, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 405504, pg 99, len 3854, copied 3854, i_size 405504
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 409358, pg 99, len 242, copied 242, i_size 409358
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 100, i_size 409600, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 409600, pg 100, len 3854, copied 3854, i_size 409600
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 413454, pg 100, len 242, copied 242, i_size 413454
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 101, i_size 413696, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 413696, pg 101, len 3854, copied 3854, i_size 413696
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 417550, pg 101, len 242, copied 242, i_size 417550
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 102, i_size 417792, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 417792, pg 102, len 3854, copied 3854, i_size 417792
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 421646, pg 102, len 242, copied 242, i_size 421646
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 103, i_size 421888, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 421888, pg 103, len 3854, copied 3854, i_size 421888
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 425742, pg 103, len 242, copied 242, i_size 425742
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 104, i_size 425984, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.690000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 425984, pg 104, len 3854, copied 3854, i_size 425984
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 429838, pg 104, len 242, copied 242, i_size 429838
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 105, i_size 430080, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 430080, pg 105, len 3854, copied 3854, i_size 430080
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 433934, pg 105, len 242, copied 242, i_size 433934
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 106, i_size 434176, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 434176, pg 106, len 3854, copied 3854, i_size 434176
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 438030, pg 106, len 242, copied 242, i_size 438030
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 107, i_size 438272, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 438272, pg 107, len 3854, copied 3854, i_size 438272
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 442126, pg 107, len 242, copied 242, i_size 442126
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 108, i_size 442368, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.710000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 442368, pg 108, len 3854, copied 3854, i_size 442368
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 446222, pg 108, len 242, copied 242, i_size 446222
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 109, i_size 446464, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 446464, pg 109, len 3854, copied 3854, i_size 446464
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 450318, pg 109, len 242, copied 242, i_size 450318
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 110, i_size 450560, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 450560, pg 110, len 3854, copied 3854, i_size 450560
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 454414, pg 110, len 242, copied 242, i_size 454414
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 111, i_size 454656, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 454656, pg 111, len 3854, copied 3854, i_size 454656
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 458510, pg 111, len 242, copied 242, i_size 458510
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 112, i_size 458752, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 458752, pg 112, len 3854, copied 3854, i_size 458752
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 462606, pg 112, len 242, copied 242, i_size 462606
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 113, i_size 462848, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 462848, pg 113, len 3854, copied 3854, i_size 462848
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 466702, pg 113, len 242, copied 242, i_size 466702
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 114, i_size 466944, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 466944, pg 114, len 3854, copied 3854, i_size 466944
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 470798, pg 114, len 242, copied 242, i_size 470798
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 115, i_size 471040, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.740000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 471040, pg 115, len 3854, copied 3854, i_size 471040
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 474894, pg 115, len 242, copied 242, i_size 474894
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 116, i_size 475136, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 475136, pg 116, len 3854, copied 3854, i_size 475136
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 478990, pg 116, len 242, copied 242, i_size 478990
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 117, i_size 479232, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 479232, pg 117, len 3854, copied 3854, i_size 479232
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 483086, pg 117, len 242, copied 242, i_size 483086
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 118, i_size 483328, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 483328, pg 118, len 3854, copied 3854, i_size 483328
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 487182, pg 118, len 242, copied 242, i_size 487182
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 119, i_size 487424, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.760000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 487424, pg 119, len 3854, copied 3854, i_size 487424
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 491278, pg 119, len 242, copied 242, i_size 491278
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 120, i_size 491520, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 491520, pg 120, len 3854, copied 3854, i_size 491520
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 495374, pg 120, len 242, copied 242, i_size 495374
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 121, i_size 495616, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 495616, pg 121, len 3854, copied 3854, i_size 495616
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 499470, pg 121, len 242, copied 242, i_size 499470
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 122, i_size 499712, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 499712, pg 122, len 3854, copied 3854, i_size 499712
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 503566, pg 122, len 242, copied 242, i_size 503566
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 123, i_size 503808, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 503808, pg 123, len 3854, copied 3854, i_size 503808
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 507662, pg 123, len 242, copied 242, i_size 507662
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 124, i_size 507904, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 507904, pg 124, len 3854, copied 3854, i_size 507904
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 511758, pg 124, len 242, copied 242, i_size 511758
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 125, i_size 512000, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.780000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 512000, pg 125, len 3854, copied 3854, i_size 512000
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 515854, pg 125, len 242, copied 242, i_size 515854
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 126, i_size 516096, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 516096, pg 126, len 3854, copied 3854, i_size 516096
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 519950, pg 126, len 242, copied 242, i_size 519950
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 127, i_size 520192, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 520192, pg 127, len 3854, copied 3854, i_size 520192
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 524046, pg 127, len 242, copied 242, i_size 524046
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 128, i_size 524288, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 524288, pg 128, len 3854, copied 3854, i_size 524288
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 528142, pg 128, len 242, copied 242, i_size 528142
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 129, i_size 528384, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 528384, pg 129, len 3854, copied 3854, i_size 528384
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 532238, pg 129, len 242, copied 242, i_size 532238
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 130, i_size 532480, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 532480, pg 130, len 3854, copied 3854, i_size 532480
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 536334, pg 130, len 242, copied 242, i_size 536334
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 131, i_size 536576, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 536576, pg 131, len 3854, copied 3854, i_size 536576
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 540430, pg 131, len 242, copied 242, i_size 540430
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 132, i_size 540672, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 540672, pg 132, len 3854, copied 3854, i_size 540672
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 544526, pg 132, len 242, copied 242, i_size 544526
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 133, i_size 544768, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 544768, pg 133, len 3854, copied 3854, i_size 544768
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 548622, pg 133, len 242, copied 242, i_size 548622
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 134, i_size 548864, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 548864, pg 134, len 3854, copied 3854, i_size 548864
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 552718, pg 134, len 242, copied 242, i_size 552718
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 135, i_size 552960, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 552960, pg 135, len 3854, copied 3854, i_size 552960
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 556814, pg 135, len 242, copied 242, i_size 556814
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 136, i_size 557056, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 557056, pg 136, len 3854, copied 3854, i_size 557056
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 560910, pg 136, len 242, copied 242, i_size 560910
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 137, i_size 561152, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.820000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 561152, pg 137, len 3854, copied 3854, i_size 561152
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 565006, pg 137, len 242, copied 242, i_size 565006
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 138, i_size 565248, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 565248, pg 138, len 3854, copied 3854, i_size 565248
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 569102, pg 138, len 242, copied 242, i_size 569102
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 139, i_size 569344, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 569344, pg 139, len 3854, copied 3854, i_size 569344
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 573198, pg 139, len 242, copied 242, i_size 573198
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 140, i_size 573440, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 573440, pg 140, len 3854, copied 3854, i_size 573440
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 577294, pg 140, len 242, copied 242, i_size 577294
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 141, i_size 577536, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 577536, pg 141, len 3854, copied 3854, i_size 577536
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 581390, pg 141, len 242, copied 242, i_size 581390
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 142, i_size 581632, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 581632, pg 142, len 3854, copied 3854, i_size 581632
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 585486, pg 142, len 242, copied 242, i_size 585486
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 143, i_size 585728, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 585728, pg 143, len 3854, copied 3854, i_size 585728
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 589582, pg 143, len 242, copied 242, i_size 589582
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 144, i_size 589824, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.840000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 589824, pg 144, len 3854, copied 3854, i_size 589824
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 593678, pg 144, len 242, copied 242, i_size 593678
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 145, i_size 593920, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 593920, pg 145, len 3854, copied 3854, i_size 593920
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 597774, pg 145, len 242, copied 242, i_size 597774
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 146, i_size 598016, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 598016, pg 146, len 3854, copied 3854, i_size 598016
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 601870, pg 146, len 242, copied 242, i_size 601870
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 147, i_size 602112, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 602112, pg 147, len 3854, copied 3854, i_size 602112
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 605966, pg 147, len 242, copied 242, i_size 605966
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 148, i_size 606208, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 606208, pg 148, len 3854, copied 3854, i_size 606208
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 610062, pg 148, len 242, copied 242, i_size 610062
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 149, i_size 610304, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 610304, pg 149, len 3854, copied 3854, i_size 610304
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 614158, pg 149, len 242, copied 242, i_size 614158
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 150, i_size 614400, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.860000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 614400, pg 150, len 3854, copied 3854, i_size 614400
Jan  1 00:01:26 r888 user.debug kernel: [   86.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 618254, pg 150, len 242, copied 242, i_size 618254
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 151, i_size 618496, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 618496, pg 151, len 3854, copied 3854, i_size 618496
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 622350, pg 151, len 242, copied 242, i_size 622350
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 152, i_size 622592, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 622592, pg 152, len 3854, copied 3854, i_size 622592
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 626446, pg 152, len 242, copied 242, i_size 626446
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 153, i_size 626688, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 626688, pg 153, len 3854, copied 3854, i_size 626688
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 630542, pg 153, len 242, copied 242, i_size 630542
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 154, i_size 630784, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 630784, pg 154, len 3854, copied 3854, i_size 630784
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 634638, pg 154, len 242, copied 242, i_size 634638
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 155, i_size 634880, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 634880, pg 155, len 3854, copied 3854, i_size 634880
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 638734, pg 155, len 242, copied 242, i_size 638734
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 156, i_size 638976, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 638976, pg 156, len 3854, copied 3854, i_size 638976
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 642830, pg 156, len 242, copied 242, i_size 642830
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 157, i_size 643072, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.880000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 643072, pg 157, len 3854, copied 3854, i_size 643072
Jan  1 00:01:26 r888 user.debug kernel: [   86.900000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 646926, pg 157, len 242, copied 242, i_size 646926
Jan  1 00:01:26 r888 user.debug kernel: [   86.900000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 158, i_size 647168, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.900000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 647168, pg 158, len 3854, copied 3854, i_size 647168
Jan  1 00:01:26 r888 user.debug kernel: [   86.900000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 651022, pg 158, len 242, copied 242, i_size 651022
Jan  1 00:01:26 r888 user.debug kernel: [   86.900000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 159, i_size 651264, flags 0x21
Jan  1 00:01:26 r888 user.debug kernel: [   86.900000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 651264, pg 159, len 3854, copied 3854, i_size 651264
Jan  1 00:01:26 r888 user.debug kernel: [   86.900000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 655118, pg 159, len 242, copied 242, i_size 655118
Jan  1 00:01:26 r888 user.debug kernel: [   86.900000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 160, i_size 655360, flags 0x1
Jan  1 00:01:26 r888 user.debug kernel: [   86.900000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 655360, pg 160, len 3854, copied 3854, i_size 655360
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 659214, pg 160, len 242, copied 242, i_size 659214
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 161, i_size 659456, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 659456, pg 161, len 3854, copied 3854, i_size 659456
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 663310, pg 161, len 242, copied 242, i_size 663310
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 162, i_size 663552, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 663552, pg 162, len 3854, copied 3854, i_size 663552
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 667406, pg 162, len 242, copied 242, i_size 667406
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 163, i_size 667648, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 667648, pg 163, len 3854, copied 3854, i_size 667648
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 671502, pg 163, len 242, copied 242, i_size 671502
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 164, i_size 671744, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 671744, pg 164, len 3854, copied 3854, i_size 671744
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 675598, pg 164, len 242, copied 242, i_size 675598
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 165, i_size 675840, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 675840, pg 165, len 3854, copied 3854, i_size 675840
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 679694, pg 165, len 242, copied 242, i_size 679694
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 166, i_size 679936, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 679936, pg 166, len 3854, copied 3854, i_size 679936
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 683790, pg 166, len 242, copied 242, i_size 683790
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 167, i_size 684032, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 684032, pg 167, len 3854, copied 3854, i_size 684032
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 687886, pg 167, len 242, copied 242, i_size 687886
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 168, i_size 688128, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 688128, pg 168, len 3854, copied 3854, i_size 688128
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 691982, pg 168, len 242, copied 242, i_size 691982
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 169, i_size 6922
Jan  1 00:01:27 r888 user.info kernel: 24, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 692224, pg 169, len 3854, copied 3854, i_size 692224
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 696078, pg 169, len 242, copied 242, i_size 696078
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 170, i_size 696320, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 696320, pg 170, len 3854, copied 3854, i_size 696320
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 700174, pg 170, len 242, copied 242, i_size 700174
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 171, i_size 700416, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 700416, pg 171, len 3854, copied 3854, i_size 700416
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 704270, pg 171, len 242, copied 242, i_size 704270
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 172, i_size 704512, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 704512, pg 172, len 3854, copied 3854, i_size 704512
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 708366, pg 172, len 242, copied 242, i_size 708366
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 173, i_size 708608, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 708608, pg 173, len 3854, copied 3854, i_size 708608
Jan  1 00:01:27 r888 user.debug kernel: [   86.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 712462, pg 173, len 242, copied 242, i_size 712462
Jan  1 00:01:27 r888 user.debug kernel: [   86.970000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 174, i_size 712704, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 712704, pg 174, len 3854, copied 3854, i_size 712704
Jan  1 00:01:27 r888 user.debug kernel: [   86.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 716558, pg 174, len 242, copied 242, i_size 716558
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 175, i_size 716800, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 716800, pg 175, len 3854, copied 3854, i_size 716800
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 720654, pg 175, len 242, copied 242, i_size 720654
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 176, i_size 720896, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 720896, pg 176, len 3854, copied 3854, i_size 720896
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 724750, pg 176, len 242, copied 242, i_size 724750
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 177, i_size 724992, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 724992, pg 177, len 3854, copied 3854, i_size 724992
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 728846, pg 177, len 242, copied 242, i_size 728846
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 178, i_size 729088, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 729088, pg 178, len 3854, copied 3854, i_size 729088
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 732942, pg 178, len 242, copied 242, i_size 732942
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 179, i_size 733184, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 733184, pg 179, len 3854, copied 3854, i_size 733184
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 737038, pg 179, len 242, copied 242, i_size 737038
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 180, i_size 737280, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 737280, pg 180, len 3854, copied 3854, i_size 737280
Jan  1 00:01:27 r888 user.debug kernel: [   86.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 741134, pg 180, len 242, copied 242, i_size 741134
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 181, i_size 741376, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 741376, pg 181, len 3854, copied 3854, i_size 741376
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 745230, pg 181, len 242, copied 242, i_size 745230
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 182, i_size 745472, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 745472, pg 182, len 3854, copied 3854, i_size 745472
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 749326, pg 182, len 242, copied 242, i_size 749326
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 183, i_size 749568, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 749568, pg 183, len 3854, copied 3854, i_size 749568
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 753422, pg 183, len 242, copied 242, i_size 753422
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 184, i_size 753664, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 753664, pg 184, len 3854, copied 3854, i_size 753664
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 757518, pg 184, len 242, copied 242, i_size 757518
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 185, i_size 757760, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 757760, pg 185, len 3854, copied 3854, i_size 757760
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 761614, pg 185, len 242, copied 242, i_size 761614
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 186, i_size 761856, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 761856, pg 186, len 3854, copied 3854, i_size 761856
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 765710, pg 186, len 242, copied 242, i_size 765710
Jan  1 00:01:27 r888 user.debug kernel: [   87.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 187, i_size 765952, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.020000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 765952, pg 187, len 3854, copied 3854, i_size 765952
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 769806, pg 187, len 242, copied 242, i_size 769806
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 188, i_size 770048, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 770048, pg 188, len 3854, copied 3854, i_size 770048
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 773902, pg 188, len 242, copied 242, i_size 773902
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 189, i_size 774144, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 774144, pg 189, len 3854, copied 3854, i_size 774144
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 777998, pg 189, len 242, copied 242, i_size 777998
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 190, i_size 778240, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 778240, pg 190, len 3854, copied 3854, i_size 778240
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 782094, pg 190, len 242, copied 242, i_size 782094
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 191, i_size 782336, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 782336, pg 191, len 3854, copied 3854, i_size 782336
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 786190, pg 191, len 242, copied 242, i_size 786190
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 192, i_size 786432, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 786432, pg 192, len 3854, copied 3854, i_size 786432
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 790286, pg 192, len 242, copied 242, i_size 790286
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 193, i_size 790528, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 790528, pg 193, len 3854, copied 3854, i_size 790528
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 794382, pg 193, len 242, copied 242, i_size 794382
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 194, i_size 794624, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 794624, pg 194, len 3854, copied 3854, i_size 794624
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 798478, pg 194, len 242, copied 242, i_size 798478
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 195, i_size 798720, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 798720, pg 195, len 3854, copied 3854, i_size 798720
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 802574, pg 195, len 242, copied 242, i_size 802574
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 196, i_size 802816, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 802816, pg 196, len 3854, copied 3854, i_size 802816
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 806670, pg 196, len 242, copied 242, i_size 806670
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 197, i_size 806912, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 806912, pg 197, len 3854, copied 3854, i_size 806912
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 810766, pg 197, len 242, copied 242, i_size 810766
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 198, i_size 811008, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 811008, pg 198, len 3854, copied 3854, i_size 811008
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 814862, pg 198, len 242, copied 242, i_size 814862
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 199, i_size 815104, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 815104, pg 199, len 3854, copied 3854, i_size 815104
Jan  1 00:01:27 r888 user.debug kernel: [   87.060000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 818958, pg 199, len 242, copied 242, i_size 818958
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 200, i_size 819200, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 819200, pg 200, len 3854, copied 3854, i_size 819200
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 823054, pg 200, len 242, copied 242, i_size 823054
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 201, i_size 823296, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 823296, pg 201, len 3854, copied 3854, i_size 823296
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 827150, pg 201, len 242, copied 242, i_size 827150
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 202, i_size 827392, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 827392, pg 202, len 3854, copied 3854, i_size 827392
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 831246, pg 202, len 242, copied 242, i_size 831246
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 203, i_size 831488, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 831488, pg 203, len 3854, copied 3854, i_size 831488
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 835342, pg 203, len 242, copied 242, i_size 835342
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 204, i_size 835584, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 835584, pg 204, len 3854, copied 3854, i_size 835584
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 839438, pg 204, len 242, copied 242, i_size 839438
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 205, i_size 839680, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 839680, pg 205, len 3854, copied 3854, i_size 839680
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 843534, pg 205, len 242, copied 242, i_size 843534
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 206, i_size 843776, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 843776, pg 206, len 3854, copied 3854, i_size 843776
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 847630, pg 206, len 242, copied 242, i_size 847630
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 207, i_size 847872, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 847872, pg 207, len 3854, copied 3854, i_size 847872
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 851726, pg 207, len 242, copied 242, i_size 851726
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 208, i_size 851968, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 851968, pg 208, len 3854, copied 3854, i_size 851968
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 855822, pg 208, len 242, copied 242, i_size 855822
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 209, i_size 856064, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 856064, pg 209, len 3854, copied 3854, i_size 856064
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 859918, pg 209, len 242, copied 242, i_size 859918
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 210, i_size 860160, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 860160, pg 210, len 3854, copied 3854, i_size 860160
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 864014, pg 210, len 242, copied 242, i_size 864014
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 211, i_size 864256, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 864256, pg 211, len 3854, copied 3854, i_size 864256
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 868110, pg 211, len 242, copied 242, i_size 868110
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 212, i_size 868352, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 868352, pg 212, len 3854, copied 3854, i_size 868352
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 872206, pg 212, len 242, copied 242, i_size 872206
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 213, i_size 872448, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 872448, pg 213, len 3854, copied 3854, i_size 872448
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 876302, pg 213, len 242, copied 242, i_size 876302
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 214, i_size 876544, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 876544, pg 214, len 3854, copied 3854, i_size 876544
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 880398, pg 214, len 242, copied 242, i_size 880398
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 215, i_size 880640, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 880640, pg 215, len 3854, copied 3854, i_size 880640
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 884494, pg 215, len 242, copied 242, i_size 884494
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 216, i_size 884736, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 884736, pg 216, len 3854, copied 3854, i_size 884736
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 888590, pg 216, len 242, copied 242, i_size 888590
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 217, i_size 888832, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 888832, pg 217, len 3854, copied 3854, i_size 888832
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 892686, pg 217, len 242, copied 242, i_size 892686
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 218, i_size 8929
Jan  1 00:01:27 r888 user.info kernel: 28, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.120000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 892928, pg 218, len 3854, copied 3854, i_size 892928
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 896782, pg 218, len 242, copied 242, i_size 896782
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 219, i_size 897024, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 897024, pg 219, len 3854, copied 3854, i_size 897024
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 900878, pg 219, len 242, copied 242, i_size 900878
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 220, i_size 901120, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 901120, pg 220, len 3854, copied 3854, i_size 901120
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 904974, pg 220, len 242, copied 242, i_size 904974
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 221, i_size 905216, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 905216, pg 221, len 3854, copied 3854, i_size 905216
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 909070, pg 221, len 242, copied 242, i_size 909070
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 222, i_size 909312, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 909312, pg 222, len 3854, copied 3854, i_size 909312
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 913166, pg 222, len 242, copied 242, i_size 913166
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 223, i_size 913408, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 913408, pg 223, len 3854, copied 3854, i_size 913408
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 917262, pg 223, len 242, copied 242, i_size 917262
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 224, i_size 917504, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 917504, pg 224, len 3854, copied 3854, i_size 917504
Jan  1 00:01:27 r888 user.debug kernel: [   87.140000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 921358, pg 224, len 242, copied 242, i_size 921358
Jan  1 00:01:27 r888 user.debug kernel: [   87.150000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 225, i_size 921600, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.150000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 921600, pg 225, len 3854, copied 3854, i_size 921600
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 925454, pg 225, len 242, copied 242, i_size 925454
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 226, i_size 925696, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 925696, pg 226, len 3854, copied 3854, i_size 925696
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 929550, pg 226, len 242, copied 242, i_size 929550
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 227, i_size 929792, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 929792, pg 227, len 3854, copied 3854, i_size 929792
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 933646, pg 227, len 242, copied 242, i_size 933646
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 228, i_size 933888, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 933888, pg 228, len 3854, copied 3854, i_size 933888
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 937742, pg 228, len 242, copied 242, i_size 937742
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 229, i_size 937984, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 937984, pg 229, len 3854, copied 3854, i_size 937984
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 941838, pg 229, len 242, copied 242, i_size 941838
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 230, i_size 942080, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 942080, pg 230, len 3854, copied 3854, i_size 942080
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 945934, pg 230, len 242, copied 242, i_size 945934
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 231, i_size 946176, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 946176, pg 231, len 3854, copied 3854, i_size 946176
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 950030, pg 231, len 242, copied 242, i_size 950030
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 232, i_size 950272, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 950272, pg 232, len 3854, copied 3854, i_size 950272
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 954126, pg 232, len 242, copied 242, i_size 954126
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 233, i_size 954368, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 954368, pg 233, len 3854, copied 3854, i_size 954368
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 958222, pg 233, len 242, copied 242, i_size 958222
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 234, i_size 958464, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 958464, pg 234, len 3854, copied 3854, i_size 958464
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 962318, pg 234, len 242, copied 242, i_size 962318
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 235, i_size 962560, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 962560, pg 235, len 3854, copied 3854, i_size 962560
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 966414, pg 235, len 242, copied 242, i_size 966414
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 236, i_size 966656, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 966656, pg 236, len 3854, copied 3854, i_size 966656
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 970510, pg 236, len 242, copied 242, i_size 970510
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 237, i_size 970752, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.180000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 970752, pg 237, len 3854, copied 3854, i_size 970752
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 974606, pg 237, len 242, copied 242, i_size 974606
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 238, i_size 974848, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 974848, pg 238, len 3854, copied 3854, i_size 974848
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 978702, pg 238, len 242, copied 242, i_size 978702
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 239, i_size 978944, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 978944, pg 239, len 3854, copied 3854, i_size 978944
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 982798, pg 239, len 242, copied 242, i_size 982798
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 240, i_size 983040, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 983040, pg 240, len 3854, copied 3854, i_size 983040
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 986894, pg 240, len 242, copied 242, i_size 986894
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 241, i_size 987136, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 987136, pg 241, len 3854, copied 3854, i_size 987136
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 990990, pg 241, len 242, copied 242, i_size 990990
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 242, i_size 991232, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 991232, pg 242, len 3854, copied 3854, i_size 991232
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67,
Jan  1 00:01:27 r888 user.info kernel: pos 995086, pg 242, len 242, copied 242, i_size 995086
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 243, i_size 995328, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 995328, pg 243, len 3854, copied 3854, i_size 995328
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 999182, pg 243, len 242, copied 242, i_size 999182
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 244, i_size 999424, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.200000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 999424, pg 244, len 3854, copied 3854, i_size 999424
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1003278, pg 244, len 242, copied 242, i_size 1003278
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 245, i_size 1003520, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1003520, pg 245, len 3854, copied 3854, i_size 1003520
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1007374, pg 245, len 242, copied 242, i_size 1007374
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 246, i_size 1007616, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1007616, pg 246, len 3854, copied 3854, i_size 1007616
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1011470, pg 246, len 242, copied 242, i_size 1011470
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 247, i_size 1011712, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1011712, pg 247, len 3854, copied 3854, i_size 1011712
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1015566, pg 247, len 242, copied 242, i_size 1015566
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 248, i_size 1015808, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1015808, pg 248, len 3854, copied 3854, i_size 1015808
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1019662, pg 248, len 242, copied 242, i_size 1019662
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 249, i_size 1019904, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1019904, pg 249, len 3854, copied 3854, i_size 1019904
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1023758, pg 249, len 242, copied 242, i_size 1023758
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 250, i_size 1024000, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1024000, pg 250, len 3854, copied 3854, i_size 1024000
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1027854, pg 250, len 242, copied 242, i_size 1027854
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 251, i_size 1028096, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1028096, pg 251, len 3854, copied 3854, i_size 1028096
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1031950, pg 251, len 242, copied 242, i_size 1031950
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 252, i_size 1032192, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1032192, pg 252, len 3854, copied 3854, i_size 1032192
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1036046, pg 252, len 242, copied 242, i_size 1036046
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 253, i_size 1036288, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1036288, pg 253, len 3854, copied 3854, i_size 1036288
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1040142, pg 253, len 242, copied 242, i_size 1040142
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 254, i_size 1040384, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1040384, pg 254, len 3854, copied 3854, i_size 1040384
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1044238, pg 254, len 242, copied 242, i_size 1044238
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 255, i_size 1044480, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1044480, pg 255, len 3854, copied 3854, i_size 1044480
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1048334, pg 255, len 242, copied 242, i_size 1048334
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 256, i_size 1048576, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.240000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1048576, pg 256, len 3854, copied 3854, i_size 1048576
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1052430, pg 256, len 242, copied 242, i_size 1052430
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 257, i_size 1052672, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1052672, pg 257, len 3854, copied 3854, i_size 1052672
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1056526, pg 257, len 242, copied 242, i_size 1056526
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 258, i_size 1056768, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1056768, pg 258, len 3854, copied 3854, i_size 1056768
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1060622, pg 258, len 242, copied 242, i_size 1060622
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 259, i_size 1060864, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1060864, pg 259, len 3854, copied 3854, i_size 1060864
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1064718, pg 259, len 242, copied 242, i_size 1064718
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 260, i_size 1064960, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1064960, pg 260, len 3854, copied 3854, i_size 1064960
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1068814, pg 260, len 242, copied 242, i_size 1068814
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 261, i_size 1069056, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1069056, pg 261, len 3854, copied 3854, i_size 1069056
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1072910, pg 261, len 242, copied 242, i_size 1072910
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 262, i_size 1073152, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1073152, pg 262, len 3854, copied 3854, i_size 1073152
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1077006, pg 262, len 242, copied 242, i_size 1077006
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 263, i_size 1077248, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.260000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1077248, pg 263, len 3854, copied 3854, i_size 1077248
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1081102, pg 263, len 242, copied 242, i_size 1081102
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 264, i_size 1081344, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1081344, pg 264, len 3854, copied 3854, i_size 1081344
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1085198, pg 264, len 242, copied 242, i_size 1085198
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 265, i_size 1085440, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1085440, pg 265, len 3854, copied 3854, i_size 1085440
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1089294, pg 265, len 242, copied 242, i_size 1089294
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 266, i_size 1089536, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1089536, pg 266, len 3854, copied 3854, i_size 1089536
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1093390, pg 266, len 242, copied 242, i_size 1093390
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pi
Jan  1 00:01:27 r888 user.info kernel: d 704): do_readpage: ino 67, pg 267, i_size 1093632, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1093632, pg 267, len 3854, copied 3854, i_size 1093632
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1097486, pg 267, len 242, copied 242, i_size 1097486
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 268, i_size 1097728, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1097728, pg 268, len 3854, copied 3854, i_size 1097728
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1101582, pg 268, len 242, copied 242, i_size 1101582
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 269, i_size 1101824, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1101824, pg 269, len 3854, copied 3854, i_size 1101824
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1105678, pg 269, len 242, copied 242, i_size 1105678
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 270, i_size 1105920, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1105920, pg 270, len 3854, copied 3854, i_size 1105920
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1109774, pg 270, len 242, copied 242, i_size 1109774
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 271, i_size 1110016, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1110016, pg 271, len 3854, copied 3854, i_size 1110016
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1113870, pg 271, len 242, copied 242, i_size 1113870
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 272, i_size 1114112, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1114112, pg 272, len 3854, copied 3854, i_size 1114112
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1117966, pg 272, len 242, copied 242, i_size 1117966
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 273, i_size 1118208, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.300000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1118208, pg 273, len 3854, copied 3854, i_size 1118208
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1122062, pg 273, len 242, copied 242, i_size 1122062
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 274, i_size 1122304, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1122304, pg 274, len 3854, copied 3854, i_size 1122304
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1126158, pg 274, len 242, copied 242, i_size 1126158
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 275, i_size 1126400, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1126400, pg 275, len 3854, copied 3854, i_size 1126400
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1130254, pg 275, len 242, copied 242, i_size 1130254
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 276, i_size 1130496, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1130496, pg 276, len 3854, copied 3854, i_size 1130496
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1134350, pg 276, len 242, copied 242, i_size 1134350
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 277, i_size 1134592, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.320000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1134592, pg 277, len 3854, copied 3854, i_size 1134592
Jan  1 00:01:27 r888 user.debug kernel: [   87.330000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1138446, pg 277, len 242, copied 242, i_size 1138446
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 278, i_size 1138688, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1138688, pg 278, len 3854, copied 3854, i_size 1138688
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1142542, pg 278, len 242, copied 242, i_size 1142542
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 279, i_size 1142784, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1142784, pg 279, len 3854, copied 3854, i_size 1142784
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1146638, pg 279, len 242, copied 242, i_size 1146638
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 280, i_size 1146880, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1146880, pg 280, len 3854, copied 3854, i_size 1146880
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1150734, pg 280, len 242, copied 242, i_size 1150734
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 281, i_size 1150976, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1150976, pg 281, len 3854, copied 3854, i_size 1150976
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1154830, pg 281, len 242, copied 242, i_size 1154830
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 282, i_size 1155072, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1155072, pg 282, len 3854, copied 3854, i_size 1155072
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1158926, pg 282, len 242, copied 242, i_size 1158926
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 283, i_size 1159168, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1159168, pg 283, len 3854, copied 3854, i_size 1159168
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1163022, pg 283, len 242, copied 242, i_size 1163022
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 284, i_size 1163264, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1163264, pg 284, len 3854, copied 3854, i_size 1163264
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1167118, pg 284, len 242, copied 242, i_size 1167118
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 285, i_size 1167360, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.340000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1167360, pg 285, len 3854, copied 3854, i_size 1167360
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1171214, pg 285, len 242, copied 242, i_size 1171214
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 286, i_size 1171456, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1171456, pg 286, len 3854, copied 3854, i_size 1171456
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1175310, pg 286, len 242, copied 242, i_size 1175310
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 287, i_size 1175552, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1175552, pg 287, len 3854, copied 3854, i_size 1175552
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1179406, pg 287, len 242, copied 242, i_size 1179406
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 288, i_size 1179648, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1179648, pg 288, len 3854, copied 3854, i_size 1179648
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1183502, pg 288, len 242, copied 242, i_size 1183502
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 289, i_size 1183744, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1183744, pg 289, len 3854, copied 3854, i_size 1183744
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1187598, pg 289, len 242, copied 242, i_size 1187598
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 290, i_size 1187840, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1187840, pg 290, len 3854, copied 3854, i_size 1187840
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1191694, pg 290, len 242, copied 242, i_size 1191694
Jan  1 00:01:27 r888 user.debug kernel: [   87.360000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 291, i_size 1191936, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.36000
Jan  1 00:01:27 r888 user.info kernel: 0] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1191936, pg 291, len 3854, copied 3854, i_size 1191936
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1195790, pg 291, len 242, copied 242, i_size 1195790
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 292, i_size 1196032, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1196032, pg 292, len 3854, copied 3854, i_size 1196032
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1199886, pg 292, len 242, copied 242, i_size 1199886
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 293, i_size 1200128, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1200128, pg 293, len 3854, copied 3854, i_size 1200128
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1203982, pg 293, len 242, copied 242, i_size 1203982
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 294, i_size 1204224, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1204224, pg 294, len 3854, copied 3854, i_size 1204224
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1208078, pg 294, len 242, copied 242, i_size 1208078
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 295, i_size 1208320, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1208320, pg 295, len 3854, copied 3854, i_size 1208320
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1212174, pg 295, len 242, copied 242, i_size 1212174
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 296, i_size 1212416, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1212416, pg 296, len 3854, copied 3854, i_size 1212416
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1216270, pg 296, len 242, copied 242, i_size 1216270
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 297, i_size 1216512, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.390000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1216512, pg 297, len 3854, copied 3854, i_size 1216512
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1220366, pg 297, len 242, copied 242, i_size 1220366
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 298, i_size 1220608, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1220608, pg 298, len 3854, copied 3854, i_size 1220608
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1224462, pg 298, len 242, copied 242, i_size 1224462
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 299, i_size 1224704, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1224704, pg 299, len 3854, copied 3854, i_size 1224704
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1228558, pg 299, len 242, copied 242, i_size 1228558
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 300, i_size 1228800, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1228800, pg 300, len 3854, copied 3854, i_size 1228800
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1232654, pg 300, len 242, copied 242, i_size 1232654
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 301, i_size 1232896, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1232896, pg 301, len 3854, copied 3854, i_size 1232896
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1236750, pg 301, len 242, copied 242, i_size 1236750
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 302, i_size 1236992, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1236992, pg 302, len 3854, copied 3854, i_size 1236992
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1240846, pg 302, len 242, copied 242, i_size 1240846
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 303, i_size 1241088, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1241088, pg 303, len 3854, copied 3854, i_size 1241088
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1244942, pg 303, len 242, copied 242, i_size 1244942
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 304, i_size 1245184, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.410000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1245184, pg 304, len 3854, copied 3854, i_size 1245184
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1249038, pg 304, len 242, copied 242, i_size 1249038
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 305, i_size 1249280, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1249280, pg 305, len 3854, copied 3854, i_size 1249280
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1253134, pg 305, len 242, copied 242, i_size 1253134
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 306, i_size 1253376, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1253376, pg 306, len 3854, copied 3854, i_size 1253376
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1257230, pg 306, len 242, copied 242, i_size 1257230
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 307, i_size 1257472, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1257472, pg 307, len 3854, copied 3854, i_size 1257472
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1261326, pg 307, len 242, copied 242, i_size 1261326
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 308, i_size 1261568, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1261568, pg 308, len 3854, copied 3854, i_size 1261568
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1265422, pg 308, len 242, copied 242, i_size 1265422
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 309, i_size 1265664, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1265664, pg 309, len 3854, copied 3854, i_size 1265664
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1269518, pg 309, len 242, copied 242, i_size 1269518
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 310, i_size 1269760, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1269760, pg 310, len 3854, copied 3854, i_size 1269760
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1273614, pg 310, len 242, copied 242, i_size 1273614
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 311, i_size 1273856, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.430000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1273856, pg 311, len 3854, copied 3854, i_size 1273856
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1277710, pg 311, len 242, copied 242, i_size 1277710
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 312, i_size 1277952, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1277952, pg 312, len 3854, copied 3854, i_size 1277952
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1281806, pg 312, len 242, copied 242, i_size 1281806
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 313, i_size 1282048, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1282048, pg 313, len 3854, copied 3854, i_size 1282048
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1285902, pg 313, len 242, copied 242, i_size 1285902
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 314, i_size 1286144, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1286144, pg 314, len 3854, copied 3854, i_size 1286144
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1289998, pg 314, len 242, copied 242, i_size 1289998
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 315, i_size 1290240, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1290240, pg 315, len 3854,
Jan  1 00:01:27 r888 user.info kernel:  copied 3854, i_size 1290240
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1294094, pg 315, len 242, copied 242, i_size 1294094
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 316, i_size 1294336, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1294336, pg 316, len 3854, copied 3854, i_size 1294336
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1298190, pg 316, len 242, copied 242, i_size 1298190
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 317, i_size 1298432, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.450000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1298432, pg 317, len 3854, copied 3854, i_size 1298432
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1302286, pg 317, len 242, copied 242, i_size 1302286
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 318, i_size 1302528, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1302528, pg 318, len 3854, copied 3854, i_size 1302528
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1306382, pg 318, len 242, copied 242, i_size 1306382
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 319, i_size 1306624, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1306624, pg 319, len 3854, copied 3854, i_size 1306624
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1310478, pg 319, len 242, copied 242, i_size 1310478
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 320, i_size 1310720, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1310720, pg 320, len 3854, copied 3854, i_size 1310720
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1314574, pg 320, len 242, copied 242, i_size 1314574
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 321, i_size 1314816, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1314816, pg 321, len 3854, copied 3854, i_size 1314816
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1318670, pg 321, len 242, copied 242, i_size 1318670
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 322, i_size 1318912, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1318912, pg 322, len 3854, copied 3854, i_size 1318912
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1322766, pg 322, len 242, copied 242, i_size 1322766
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 323, i_size 1323008, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.470000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1323008, pg 323, len 3854, copied 3854, i_size 1323008
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1326862, pg 323, len 242, copied 242, i_size 1326862
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 324, i_size 1327104, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1327104, pg 324, len 3854, copied 3854, i_size 1327104
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1330958, pg 324, len 242, copied 242, i_size 1330958
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 325, i_size 1331200, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1331200, pg 325, len 3854, copied 3854, i_size 1331200
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1335054, pg 325, len 242, copied 242, i_size 1335054
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 326, i_size 1335296, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1335296, pg 326, len 3854, copied 3854, i_size 1335296
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1339150, pg 326, len 242, copied 242, i_size 1339150
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 327, i_size 1339392, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1339392, pg 327, len 3854, copied 3854, i_size 1339392
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1343246, pg 327, len 242, copied 242, i_size 1343246
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 328, i_size 1343488, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1343488, pg 328, len 3854, copied 3854, i_size 1343488
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1347342, pg 328, len 242, copied 242, i_size 1347342
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 329, i_size 1347584, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.480000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1347584, pg 329, len 3854, copied 3854, i_size 1347584
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1351438, pg 329, len 242, copied 242, i_size 1351438
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 330, i_size 1351680, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1351680, pg 330, len 3854, copied 3854, i_size 1351680
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1355534, pg 330, len 242, copied 242, i_size 1355534
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 331, i_size 1355776, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1355776, pg 331, len 3854, copied 3854, i_size 1355776
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1359630, pg 331, len 242, copied 242, i_size 1359630
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 332, i_size 1359872, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1359872, pg 332, len 3854, copied 3854, i_size 1359872
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1363726, pg 332, len 242, copied 242, i_size 1363726
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 333, i_size 1363968, flags 0x21
Jan  1 00:01:27 r888 user.debug kernel: [   87.510000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1363968, pg 333, len 3854, copied 3854, i_size 1363968
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1367822, pg 333, len 242, copied 242, i_size 1367822
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 334, i_size 1368064, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1368064, pg 334, len 3854, copied 3854, i_size 1368064
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1371918, pg 334, len 242, copied 242, i_size 1371918
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 335, i_size 1372160, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1372160, pg 335, len 3854, copied 3854, i_size 1372160
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1376014, pg 335, len 242, copied 242, i_size 1376014
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 336, i_size 1376256, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1376256, pg 336, len 3854, copied 3854, i_size 1376256
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1380110, pg 336, len 242, copied 242, i_size 1380110
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 337, i_size 1380352, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.540000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1380352, pg 337, len 3854, copied 3854, i_size 1380352
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1384206, pg 337, len 242, copied 242, i_size 1384206
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 338, i_size 1384448, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1384448, pg 338, len 3854, copied 3854, i_size 1384448
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1388302, pg 338, len 242, copied 242, i_size 1388302
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 339, i_size 1388544, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1388544, pg 339, len 3854, copied 3854, i_size 1388544
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_writ
Jan  1 00:01:27 r888 user.info kernel: e_end: ino 67, pos 1392398, pg 339, len 242, copied 242, i_size 1392398
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 340, i_size 1392640, flags 0x1
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1392640, pg 340, len 3854, copied 3854, i_size 1392640
Jan  1 00:01:27 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1396494, pg 340, len 242, copied 242, i_size 1396494
Jan  1 00:01:28 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 341, i_size 1396736, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1396736, pg 341, len 3854, copied 3854, i_size 1396736
Jan  1 00:01:28 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1400590, pg 341, len 242, copied 242, i_size 1400590
Jan  1 00:01:28 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 342, i_size 1400832, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.560000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1400832, pg 342, len 3854, copied 3854, i_size 1400832
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1404686, pg 342, len 242, copied 242, i_size 1404686
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 343, i_size 1404928, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1404928, pg 343, len 3854, copied 3854, i_size 1404928
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1408782, pg 343, len 242, copied 242, i_size 1408782
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 344, i_size 1409024, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1409024, pg 344, len 3854, copied 3854, i_size 1409024
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1412878, pg 344, len 242, copied 242, i_size 1412878
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 345, i_size 1413120, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1413120, pg 345, len 3854, copied 3854, i_size 1413120
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1416974, pg 345, len 242, copied 242, i_size 1416974
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 346, i_size 1417216, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1417216, pg 346, len 3854, copied 3854, i_size 1417216
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1421070, pg 346, len 242, copied 242, i_size 1421070
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 347, i_size 1421312, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1421312, pg 347, len 3854, copied 3854, i_size 1421312
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1425166, pg 347, len 242, copied 242, i_size 1425166
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 348, i_size 1425408, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.580000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1425408, pg 348, len 3854, copied 3854, i_size 1425408
Jan  1 00:01:28 r888 user.debug kernel: [   87.590000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1429262, pg 348, len 242, copied 242, i_size 1429262
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 349, i_size 1429504, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1429504, pg 349, len 3854, copied 3854, i_size 1429504
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1433358, pg 349, len 242, copied 242, i_size 1433358
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 350, i_size 1433600, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1433600, pg 350, len 3854, copied 3854, i_size 1433600
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1437454, pg 350, len 242, copied 242, i_size 1437454
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 351, i_size 1437696, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1437696, pg 351, len 3854, copied 3854, i_size 1437696
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1441550, pg 351, len 242, copied 242, i_size 1441550
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 352, i_size 1441792, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1441792, pg 352, len 3854, copied 3854, i_size 1441792
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1445646, pg 352, len 242, copied 242, i_size 1445646
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 353, i_size 1445888, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1445888, pg 353, len 3854, copied 3854, i_size 1445888
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1449742, pg 353, len 242, copied 242, i_size 1449742
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 354, i_size 1449984, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1449984, pg 354, len 3854, copied 3854, i_size 1449984
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1453838, pg 354, len 242, copied 242, i_size 1453838
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 355, i_size 1454080, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.600000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1454080, pg 355, len 3854, copied 3854, i_size 1454080
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1457934, pg 355, len 242, copied 242, i_size 1457934
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 356, i_size 1458176, flags 0x21
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1458176, pg 356, len 3854, copied 3854, i_size 1458176
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1462030, pg 356, len 242, copied 242, i_size 1462030
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 357, i_size 1462272, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1462272, pg 357, len 3854, copied 3854, i_size 1462272
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1466126, pg 357, len 242, copied 242, i_size 1466126
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 358, i_size 1466368, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1466368, pg 358, len 3854, copied 3854, i_size 1466368
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1470222, pg 358, len 242, copied 242, i_size 1470222
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 359, i_size 1470464, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1470464, pg 359, len 3854, copied 3854, i_size 1470464
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1474318, pg 359, len 242, copied 242, i_size 1474318
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 360, i_size 1474560, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1474560, pg 360, len 3854, copied 3854, i_size 1474560
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1478414, pg 360, len 242, copied 242, i_size 1478414
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 361, i_size 1478656, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1478656, pg 361, len 3854, copied 3854, i_size 1478656
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1482510, pg 361, len 242, copied 242, i_size 1482510
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 362, i_size 1482752, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.620000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1482752, pg 362, len 3854, copied 3854, i_size 1482752
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1486606, pg 362, len 242, copied 242, i_size 1486606
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 363, i_size 1486848, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1486848, pg 363, len 3854, copied 3854, i_size 1486848
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1490702, pg 363, len 242, copied 242, i_size 1490702
Jan  1 00:01:28 r888 user.debug kernel: [
Jan  1 00:01:28 r888 user.info kernel: 87.640000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 364, i_size 1490944, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1490944, pg 364, len 3854, copied 3854, i_size 1490944
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1494798, pg 364, len 242, copied 242, i_size 1494798
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 365, i_size 1495040, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1495040, pg 365, len 3854, copied 3854, i_size 1495040
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1498894, pg 365, len 242, copied 242, i_size 1498894
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 366, i_size 1499136, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1499136, pg 366, len 3854, copied 3854, i_size 1499136
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1502990, pg 366, len 242, copied 242, i_size 1502990
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 367, i_size 1503232, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1503232, pg 367, len 3854, copied 3854, i_size 1503232
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1507086, pg 367, len 242, copied 242, i_size 1507086
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 368, i_size 1507328, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.640000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1507328, pg 368, len 3854, copied 3854, i_size 1507328
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1511182, pg 368, len 242, copied 242, i_size 1511182
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 369, i_size 1511424, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1511424, pg 369, len 3854, copied 3854, i_size 1511424
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1515278, pg 369, len 242, copied 242, i_size 1515278
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 370, i_size 1515520, flags 0x21
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1515520, pg 370, len 3854, copied 3854, i_size 1515520
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1519374, pg 370, len 242, copied 242, i_size 1519374
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 371, i_size 1519616, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1519616, pg 371, len 3854, copied 3854, i_size 1519616
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1523470, pg 371, len 242, copied 242, i_size 1523470
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 372, i_size 1523712, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1523712, pg 372, len 3854, copied 3854, i_size 1523712
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1527566, pg 372, len 242, copied 242, i_size 1527566
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 373, i_size 1527808, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1527808, pg 373, len 3854, copied 3854, i_size 1527808
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1531662, pg 373, len 242, copied 242, i_size 1531662
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 374, i_size 1531904, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1531904, pg 374, len 3854, copied 3854, i_size 1531904
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1535758, pg 374, len 242, copied 242, i_size 1535758
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 375, i_size 1536000, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1536000, pg 375, len 3854, copied 3854, i_size 1536000
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1539854, pg 375, len 242, copied 242, i_size 1539854
Jan  1 00:01:28 r888 user.debug kernel: [   87.660000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 376, i_size 1540096, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.670000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1540096, pg 376, len 3854, copied 3854, i_size 1540096
Jan  1 00:01:28 r888 user.debug kernel: [   87.680000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1543950, pg 376, len 242, copied 242, i_size 1543950
Jan  1 00:01:28 r888 user.debug kernel: [   87.680000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 377, i_size 1544192, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.680000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1544192, pg 377, len 3854, copied 3854, i_size 1544192
Jan  1 00:01:28 r888 user.debug kernel: [   87.680000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1548046, pg 377, len 242, copied 242, i_size 1548046
Jan  1 00:01:28 r888 user.debug kernel: [   87.680000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 378, i_size 1548288, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.680000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1548288, pg 378, len 3854, copied 3854, i_size 1548288
Jan  1 00:01:28 r888 user.debug kernel: [   87.680000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1552142, pg 378, len 242, copied 242, i_size 1552142
Jan  1 00:01:28 r888 user.debug kernel: [   87.680000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 379, i_size 1552384, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.680000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1552384, pg 379, len 3854, copied 3854, i_size 1552384
Jan  1 00:01:28 r888 user.debug kernel: [   87.700000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1556238, pg 379, len 242, copied 242, i_size 1556238
Jan  1 00:01:28 r888 user.debug kernel: [   87.700000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 380, i_size 1556480, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.700000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1556480, pg 380, len 3854, copied 3854, i_size 1556480
Jan  1 00:01:28 r888 user.debug kernel: [   87.700000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1560334, pg 380, len 242, copied 242, i_size 1560334
Jan  1 00:01:28 r888 user.debug kernel: [   87.700000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 381, i_size 1560576, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.700000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1560576, pg 381, len 3854, copied 3854, i_size 1560576
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1564430, pg 381, len 242, copied 242, i_size 1564430
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 382, i_size 1564672, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1564672, pg 382, len 3854, copied 3854, i_size 1564672
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1568526, pg 382, len 242, copied 242, i_size 1568526
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 383, i_size 1568768, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1568768, pg 383, len 3854, copied 3854, i_size 1568768
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1572622, pg 383, len 242, copied 242, i_size 1572622
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 384, i_size 1572864, flags 0x21
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1572864, pg 384, len 3854, copied 3854, i_size 1572864
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1576718, pg 384, len 242, copied 242, i_size 1576718
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 385, i_size 1576960, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.720000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1576960, pg 385, len 3854, copied 3854, i_size 1576960
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1580814, pg 385, len 242, copied 242, i_size 1580814
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 386, i_size 1581056, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1581056, pg 386, len 3854, copied 3854, i_size 1581056
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1584910, pg 386, len 242, copied 242, i_size 1584910
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 387, i_size 1585152, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1585152, pg 387, len 3854, copied 3854, i_size 1585152
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1589006, pg 387, len 242, copied 242, i_size 1589006
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 388, i_size 1589248, f
Jan  1 00:01:28 r888 user.info kernel: lags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1589248, pg 388, len 3854, copied 3854, i_size 1589248
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1593102, pg 388, len 242, copied 242, i_size 1593102
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 389, i_size 1593344, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.750000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1593344, pg 389, len 3854, copied 3854, i_size 1593344
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1597198, pg 389, len 242, copied 242, i_size 1597198
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 390, i_size 1597440, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1597440, pg 390, len 3854, copied 3854, i_size 1597440
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1601294, pg 390, len 242, copied 242, i_size 1601294
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 391, i_size 1601536, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1601536, pg 391, len 3854, copied 3854, i_size 1601536
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1605390, pg 391, len 242, copied 242, i_size 1605390
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 392, i_size 1605632, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1605632, pg 392, len 3854, copied 3854, i_size 1605632
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1609486, pg 392, len 242, copied 242, i_size 1609486
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 393, i_size 1609728, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.770000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1609728, pg 393, len 3854, copied 3854, i_size 1609728
Jan  1 00:01:28 r888 user.debug kernel: [   87.790000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1613582, pg 393, len 242, copied 242, i_size 1613582
Jan  1 00:01:28 r888 user.debug kernel: [   87.790000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 394, i_size 1613824, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.790000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1613824, pg 394, len 3854, copied 3854, i_size 1613824
Jan  1 00:01:28 r888 user.debug kernel: [   87.790000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1617678, pg 394, len 242, copied 242, i_size 1617678
Jan  1 00:01:28 r888 user.debug kernel: [   87.790000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 395, i_size 1617920, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.790000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1617920, pg 395, len 3854, copied 3854, i_size 1617920
Jan  1 00:01:28 r888 user.debug kernel: [   87.790000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1621774, pg 395, len 242, copied 242, i_size 1621774
Jan  1 00:01:28 r888 user.debug kernel: [   87.790000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 396, i_size 1622016, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.790000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1622016, pg 396, len 3854, copied 3854, i_size 1622016
Jan  1 00:01:28 r888 user.debug kernel: [   87.800000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1625870, pg 396, len 242, copied 242, i_size 1625870
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 397, i_size 1626112, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1626112, pg 397, len 3854, copied 3854, i_size 1626112
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1629966, pg 397, len 242, copied 242, i_size 1629966
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 398, i_size 1630208, flags 0x21
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1630208, pg 398, len 3854, copied 3854, i_size 1630208
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1634062, pg 398, len 242, copied 242, i_size 1634062
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 399, i_size 1634304, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1634304, pg 399, len 3854, copied 3854, i_size 1634304
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1638158, pg 399, len 242, copied 242, i_size 1638158
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 400, i_size 1638400, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1638400, pg 400, len 3854, copied 3854, i_size 1638400
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1642254, pg 400, len 242, copied 242, i_size 1642254
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 401, i_size 1642496, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.810000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1642496, pg 401, len 3854, copied 3854, i_size 1642496
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1646350, pg 401, len 242, copied 242, i_size 1646350
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 402, i_size 1646592, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1646592, pg 402, len 3854, copied 3854, i_size 1646592
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1650446, pg 402, len 242, copied 242, i_size 1650446
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 403, i_size 1650688, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1650688, pg 403, len 3854, copied 3854, i_size 1650688
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1654542, pg 403, len 242, copied 242, i_size 1654542
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 404, i_size 1654784, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1654784, pg 404, len 3854, copied 3854, i_size 1654784
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1658638, pg 404, len 242, copied 242, i_size 1658638
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 405, i_size 1658880, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.830000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1658880, pg 405, len 3854, copied 3854, i_size 1658880
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1662734, pg 405, len 242, copied 242, i_size 1662734
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 406, i_size 1662976, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1662976, pg 406, len 3854, copied 3854, i_size 1662976
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1666830, pg 406, len 242, copied 242, i_size 1666830
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 407, i_size 1667072, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1667072, pg 407, len 3854, copied 3854, i_size 1667072
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1670926, pg 407, len 242, copied 242, i_size 1670926
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 408, i_size 1671168, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1671168, pg 408, len 3854, copied 3854, i_size 1671168
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1675022, pg 408, len 242, copied 242, i_size 1675022
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 409, i_size 1675264, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1675264, pg 409, len 3854, copied 3854, i_size 1675264
Jan  1 00:01:28 r888 user.debug kernel: [   87.850000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1679118, pg 409, len 242, copied 242, i_size 1679118
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 410, i_size 1679360, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1679360, pg 410, len 3854, copied 3854, i_size 1679360
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1683214, pg 410, len 242, copied 242, i_size 1683214
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 411, i_size 1683456, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1683456, pg 411, len 3854, copied 3854, i_size 1683456
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1687310, pg 411, len 242, copied 242, i_size 1687310
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 412, i_size 1687552, flags 0x21
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1
Jan  1 00:01:28 r888 user.info kernel: 687552, pg 412, len 3854, copied 3854, i_size 1687552
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1691406, pg 412, len 242, copied 242, i_size 1691406
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 413, i_size 1691648, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1691648, pg 413, len 3854, copied 3854, i_size 1691648
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1695502, pg 413, len 242, copied 242, i_size 1695502
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 414, i_size 1695744, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.870000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1695744, pg 414, len 3854, copied 3854, i_size 1695744
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1699598, pg 414, len 242, copied 242, i_size 1699598
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 415, i_size 1699840, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1699840, pg 415, len 3854, copied 3854, i_size 1699840
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1703694, pg 415, len 242, copied 242, i_size 1703694
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 416, i_size 1703936, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1703936, pg 416, len 3854, copied 3854, i_size 1703936
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1707790, pg 416, len 242, copied 242, i_size 1707790
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 417, i_size 1708032, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1708032, pg 417, len 3854, copied 3854, i_size 1708032
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1711886, pg 417, len 242, copied 242, i_size 1711886
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 418, i_size 1712128, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.890000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1712128, pg 418, len 3854, copied 3854, i_size 1712128
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1715982, pg 418, len 242, copied 242, i_size 1715982
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 419, i_size 1716224, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1716224, pg 419, len 3854, copied 3854, i_size 1716224
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1720078, pg 419, len 242, copied 242, i_size 1720078
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 420, i_size 1720320, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1720320, pg 420, len 3854, copied 3854, i_size 1720320
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1724174, pg 420, len 242, copied 242, i_size 1724174
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 421, i_size 1724416, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1724416, pg 421, len 3854, copied 3854, i_size 1724416
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1728270, pg 421, len 242, copied 242, i_size 1728270
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 422, i_size 1728512, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1728512, pg 422, len 3854, copied 3854, i_size 1728512
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1732366, pg 422, len 242, copied 242, i_size 1732366
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 423, i_size 1732608, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1732608, pg 423, len 3854, copied 3854, i_size 1732608
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1736462, pg 423, len 242, copied 242, i_size 1736462
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 424, i_size 1736704, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1736704, pg 424, len 3854, copied 3854, i_size 1736704
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1740558, pg 424, len 242, copied 242, i_size 1740558
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 425, i_size 1740800, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.910000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1740800, pg 425, len 3854, copied 3854, i_size 1740800
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1744654, pg 425, len 242, copied 242, i_size 1744654
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 426, i_size 1744896, flags 0x21
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1744896, pg 426, len 3854, copied 3854, i_size 1744896
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1748750, pg 426, len 242, copied 242, i_size 1748750
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 427, i_size 1748992, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1748992, pg 427, len 3854, copied 3854, i_size 1748992
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1752846, pg 427, len 242, copied 242, i_size 1752846
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 428, i_size 1753088, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1753088, pg 428, len 3854, copied 3854, i_size 1753088
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1756942, pg 428, len 242, copied 242, i_size 1756942
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 429, i_size 1757184, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1757184, pg 429, len 3854, copied 3854, i_size 1757184
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1761038, pg 429, len 242, copied 242, i_size 1761038
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 430, i_size 1761280, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1761280, pg 430, len 3854, copied 3854, i_size 1761280
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1765134, pg 430, len 242, copied 242, i_size 1765134
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 431, i_size 1765376, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1765376, pg 431, len 3854, copied 3854, i_size 1765376
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1769230, pg 431, len 242, copied 242, i_size 1769230
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 432, i_size 1769472, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.930000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1769472, pg 432, len 3854, copied 3854, i_size 1769472
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1773326, pg 432, len 242, copied 242, i_size 1773326
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 433, i_size 1773568, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1773568, pg 433, len 3854, copied 3854, i_size 1773568
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1777422, pg 433, len 242, copied 242, i_size 1777422
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 434, i_size 1777664, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1777664, pg 434, len 3854, copied 3854, i_size 1777664
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1781518, pg 434, len 242, copied 242, i_size 1781518
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 435, i_size 1781760, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1781760, pg 435, len 3854, copied 3854, i_size 1781760
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1785614, pg 435, len 242, copied 242, i_size 1785614
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 436, i_size 1785856, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1785856, pg 436, len 3854, copied 3854, i_size 1785856
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS D
Jan  1 00:01:28 r888 user.info kernel: BG (pid 704): ubifs_write_end: ino 67, pos 1789710, pg 436, len 242, copied 242, i_size 1789710
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 437, i_size 1789952, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.950000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1789952, pg 437, len 3854, copied 3854, i_size 1789952
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1793806, pg 437, len 242, copied 242, i_size 1793806
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 438, i_size 1794048, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1794048, pg 438, len 3854, copied 3854, i_size 1794048
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1797902, pg 438, len 242, copied 242, i_size 1797902
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 439, i_size 1798144, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1798144, pg 439, len 3854, copied 3854, i_size 1798144
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1801998, pg 439, len 242, copied 242, i_size 1801998
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 440, i_size 1802240, flags 0x21
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1802240, pg 440, len 3854, copied 3854, i_size 1802240
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1806094, pg 440, len 242, copied 242, i_size 1806094
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 441, i_size 1806336, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1806336, pg 441, len 3854, copied 3854, i_size 1806336
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1810190, pg 441, len 242, copied 242, i_size 1810190
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 442, i_size 1810432, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1810432, pg 442, len 3854, copied 3854, i_size 1810432
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1814286, pg 442, len 242, copied 242, i_size 1814286
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 443, i_size 1814528, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1814528, pg 443, len 3854, copied 3854, i_size 1814528
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1818382, pg 443, len 242, copied 242, i_size 1818382
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 444, i_size 1818624, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.970000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1818624, pg 444, len 3854, copied 3854, i_size 1818624
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1822478, pg 444, len 242, copied 242, i_size 1822478
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 445, i_size 1822720, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1822720, pg 445, len 3854, copied 3854, i_size 1822720
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1826574, pg 445, len 242, copied 242, i_size 1826574
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 446, i_size 1826816, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1826816, pg 446, len 3854, copied 3854, i_size 1826816
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1830670, pg 446, len 242, copied 242, i_size 1830670
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 447, i_size 1830912, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1830912, pg 447, len 3854, copied 3854, i_size 1830912
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1834766, pg 447, len 242, copied 242, i_size 1834766
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 448, i_size 1835008, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1835008, pg 448, len 3854, copied 3854, i_size 1835008
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1838862, pg 448, len 242, copied 242, i_size 1838862
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 449, i_size 1839104, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1839104, pg 449, len 3854, copied 3854, i_size 1839104
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1842958, pg 449, len 242, copied 242, i_size 1842958
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 450, i_size 1843200, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   87.990000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1843200, pg 450, len 3854, copied 3854, i_size 1843200
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1847054, pg 450, len 242, copied 242, i_size 1847054
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 451, i_size 1847296, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1847296, pg 451, len 3854, copied 3854, i_size 1847296
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1851150, pg 451, len 242, copied 242, i_size 1851150
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 452, i_size 1851392, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1851392, pg 452, len 3854, copied 3854, i_size 1851392
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1855246, pg 452, len 242, copied 242, i_size 1855246
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 453, i_size 1855488, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1855488, pg 453, len 3854, copied 3854, i_size 1855488
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1859342, pg 453, len 242, copied 242, i_size 1859342
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 454, i_size 1859584, flags 0x21
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1859584, pg 454, len 3854, copied 3854, i_size 1859584
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1863438, pg 454, len 242, copied 242, i_size 1863438
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 455, i_size 1863680, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1863680, pg 455, len 3854, copied 3854, i_size 1863680
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1867534, pg 455, len 242, copied 242, i_size 1867534
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 456, i_size 1867776, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1867776, pg 456, len 3854, copied 3854, i_size 1867776
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1871630, pg 456, len 242, copied 242, i_size 1871630
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 457, i_size 1871872, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   88.010000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1871872, pg 457, len 3854, copied 3854, i_size 1871872
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1875726, pg 457, len 242, copied 242, i_size 1875726
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 458, i_size 1875968, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1875968, pg 458, len 3854, copied 3854, i_size 1875968
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1879822, pg 458, len 242, copied 242, i_size 1879822
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 459, i_size 1880064, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1880064, pg 459, len 3854, copied 3854, i_size 1880064
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1883918, pg 459, len 242, copied 242, i_size 1883918
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 460, i_size 1884160, flags 0x1
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1884160, pg 460, len 3854, copied 3854, i_size 1884160
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 0, pg flags 0xb2d
Jan  1 00:01:28 r888 user.debug kernel: [   88.030000]
Jan  1 00:01:29 r888 user.info kernel: UBIFS DBG (pid 866): ubifs_write_inode: inode 67, mode 0x81a4, nlink 1
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_jnl_write_inode: ino 67, nlink 1
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): write_head: jhead 1 (base), LEB 12:4488, len 160
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 0, len 4096, key (67, data, 0)
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_find_free_space: min_space 76
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_find_free_space: found LEB 14, free 126976
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:0, len 76
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 1, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 1, len 4096, key (67, data, 1)
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:80, len 76
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 2, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 2, len 4096, key (67, data, 2)
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:160, len 76
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 3, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 3, len 4096, key (67, data, 3)
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:240, len 76
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 4, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 4, len 4096, key (67, data, 4)
Jan  1 00:01:29 r888 user.debug kernel: [   88.030000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:320, len 76
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 5, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 5, len 4096, key (67, data, 5)
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:400, len 76
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 6, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 6, len 4096, key (67, data, 6)
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:480, len 76
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 7, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 7, len 4096, key (67, data, 7)
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:560, len 76
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 8, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 8, len 4096, key (67, data, 8)
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:640, len 351
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 9, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 9, len 4096, key (67, data, 9)
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:992, len 238
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 10, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 10, len 4096, key (67, data, 10)
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:1232, len 229
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 11, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 11, len 4096, key (67, data, 11)
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:1464, len 779
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1888014, pg 460, len 242, copied 242, i_size 1888014
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 704): ubifs_dirty_inode: inode 67
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 461, i_size 1888256, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1888256, pg 461, len 3854, copied 3854, i_size 1888256
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1892110, pg 461, len 242, copied 242, i_size 1892110
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 462, i_size 1892352, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.040000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1892352, pg 462, len 3854, copied 3854, i_size 1892352
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 12, pg flags 0xb69
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 12, len 4096, key (67, data, 12)
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:2248, len 533
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 13, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 13, len 4096, key (67, data, 13)
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:2784, len 185
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 14, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 14, len 4096, key (67, data, 14)
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:2976, len 208
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 15, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 15, len 4096, key (67, data, 15)
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:3184, len 328
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 16, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 16, len 4096, key (67, data, 16)
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:3512, len 574
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 17, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 17, len 4096, key (67, data, 17)
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:4088, len 341
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 18, pg flags 0xb69
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 18, len 4096, key (67, data, 18)
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:4432, len 185
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 19, pg flags 0xb69
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 19, len 4096, key (67, data, 19)
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:4624, len 281
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 20, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 20, len 4096, key (67, data, 20)
Jan  1 00:01:29 r888 user.debug kernel: [   88.060000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:4912, len 397
Jan  1 00:01:29 r888 user.debug kernel: [   88.070000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 21, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.070000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 21, len 4096, key (67, data, 21)
Jan  1 00:01:29 r888 user.debug kernel: [   88.070000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:5312, len 678
Jan  1 00:01:29 r888 user.debug kernel: [   88.070000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 22, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.070000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 22, len 4096, key (67, data, 22)
Jan  1 00:01:29 r888 user.debug kernel: [   88.070000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:5992, len 2880
Jan  1 00:01:29 r888 user.debug kernel: [   88.080000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1896206, pg 462, len 242, copied 242, i_size 1896206
Jan  1 00:01:29 r888 user.debug kernel: [   88.090000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 23, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.090000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 23, len 4096, key (67, data, 23)
Jan  1 00:01:29 r888 user.debug kernel: [   88.090000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:8872, len 4077
Jan  1 00:01:29 r888 user.debug kernel: [   88.090000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 24, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.090000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 24, len 4096, key (67, data, 24)
Jan  1 00:01:29 r888 user.debug kernel: [   88.090000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:12952, len 4059
Jan  1 00:01:29 r888 user.debug kernel: [   88.090000] UBIFS DBG (pid 866): ubifs_writepage: ino
Jan  1 00:01:29 r888 user.info kernel: 67, pg 25, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.090000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 25, len 4096, key (67, data, 25)
Jan  1 00:01:29 r888 user.debug kernel: [   88.090000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:17016, len 3975
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 26, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 26, len 4096, key (67, data, 26)
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:20992, len 4050
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 463, i_size 1896448, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1896448, pg 463, len 3854, copied 3854, i_size 1896448
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1900302, pg 463, len 242, copied 242, i_size 1900302
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 464, i_size 1900544, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1900544, pg 464, len 3854, copied 3854, i_size 1900544
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1904398, pg 464, len 242, copied 242, i_size 1904398
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 465, i_size 1904640, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1904640, pg 465, len 3854, copied 3854, i_size 1904640
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1908494, pg 465, len 242, copied 242, i_size 1908494
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 466, i_size 1908736, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1908736, pg 466, len 3854, copied 3854, i_size 1908736
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1912590, pg 466, len 242, copied 242, i_size 1912590
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 467, i_size 1912832, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.100000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1912832, pg 467, len 3854, copied 3854, i_size 1912832
Jan  1 00:01:29 r888 user.debug kernel: [   88.120000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 27, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.120000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 27, len 4096, key (67, data, 27)
Jan  1 00:01:29 r888 user.debug kernel: [   88.120000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:25048, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.120000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 28, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.120000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 28, len 4096, key (67, data, 28)
Jan  1 00:01:29 r888 user.debug kernel: [   88.120000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:29192, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.120000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 29, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.120000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 29, len 4096, key (67, data, 29)
Jan  1 00:01:29 r888 user.debug kernel: [   88.120000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:33336, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 30, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 30, len 4096, key (67, data, 30)
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:37480, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1916686, pg 467, len 242, copied 242, i_size 1916686
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 468, i_size 1916928, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1916928, pg 468, len 3854, copied 3854, i_size 1916928
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1920782, pg 468, len 242, copied 242, i_size 1920782
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 469, i_size 1921024, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1921024, pg 469, len 3854, copied 3854, i_size 1921024
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1924878, pg 469, len 242, copied 242, i_size 1924878
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 470, i_size 1925120, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1925120, pg 470, len 3854, copied 3854, i_size 1925120
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1928974, pg 470, len 242, copied 242, i_size 1928974
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 471, i_size 1929216, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1929216, pg 471, len 3854, copied 3854, i_size 1929216
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1933070, pg 471, len 242, copied 242, i_size 1933070
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 472, i_size 1933312, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.130000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1933312, pg 472, len 3854, copied 3854, i_size 1933312
Jan  1 00:01:29 r888 user.debug kernel: [   88.150000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 31, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.150000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 31, len 4096, key (67, data, 31)
Jan  1 00:01:29 r888 user.debug kernel: [   88.150000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:41624, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.150000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 32, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.150000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 32, len 4096, key (67, data, 32)
Jan  1 00:01:29 r888 user.debug kernel: [   88.150000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:45768, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.150000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 33, pg flags 0xb69
Jan  1 00:01:29 r888 user.debug kernel: [   88.150000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 33, len 4096, key (67, data, 33)
Jan  1 00:01:29 r888 user.debug kernel: [   88.150000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:49912, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 34, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 34, len 4096, key (67, data, 34)
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:54056, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1937166, pg 472, len 242, copied 242, i_size 1937166
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 473, i_size 1937408, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1937408, pg 473, len 3854, copied 3854, i_size 1937408
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1941262, pg 473, len 242, copied 242, i_size 1941262
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 474, i_size 1941504, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1941504, pg 474, len 3854, copied 3854, i_size 1941504
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1945358, pg 474, len 242, copied 242, i_size 1945358
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 475, i_size 1945600, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1945600, pg 475, len 3854, copied 3854, i_size 1945600
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1949454, pg 475, len 242, copied 242, i_size 1949454
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 476, i_size 1949696, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1949696, pg 476, len 3854, copied 3854, i_size 1949696
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1953550, pg 476, len 242, copied 242, i_size 1953550
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 477, i_size 1953792, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.160000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1953792, pg 477, len 3854, copied 3854, i_size 1953792
Jan  1 00:01:29 r888 user.debug kernel: [   88.180000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 35, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.180000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 35, len 4096, key (67, data, 35)
Jan  1 00:01:29 r888 user.debug kernel: [   88.180000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:58200, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.180000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 36, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.180000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 36, len 4096, key (67, data, 36)
Jan  1 00:01:29 r888 user.debug kernel: [   88
Jan  1 00:01:29 r888 user.info kernel: .180000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:62344, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.180000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 37, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.180000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 37, len 4096, key (67, data, 37)
Jan  1 00:01:29 r888 user.debug kernel: [   88.180000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:66488, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 38, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 38, len 4096, key (67, data, 38)
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:70632, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1957646, pg 477, len 242, copied 242, i_size 1957646
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 478, i_size 1957888, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1957888, pg 478, len 3854, copied 3854, i_size 1957888
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1961742, pg 478, len 242, copied 242, i_size 1961742
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 479, i_size 1961984, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1961984, pg 479, len 3854, copied 3854, i_size 1961984
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1965838, pg 479, len 242, copied 242, i_size 1965838
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 480, i_size 1966080, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1966080, pg 480, len 3854, copied 3854, i_size 1966080
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1969934, pg 480, len 242, copied 242, i_size 1969934
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 481, i_size 1970176, flags 0x21
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1970176, pg 481, len 3854, copied 3854, i_size 1970176
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1974030, pg 481, len 242, copied 242, i_size 1974030
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 482, i_size 1974272, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.190000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1974272, pg 482, len 3854, copied 3854, i_size 1974272
Jan  1 00:01:29 r888 user.debug kernel: [   88.210000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 39, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.210000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 39, len 4096, key (67, data, 39)
Jan  1 00:01:29 r888 user.debug kernel: [   88.210000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:74776, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.210000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 40, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.210000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 40, len 4096, key (67, data, 40)
Jan  1 00:01:29 r888 user.debug kernel: [   88.210000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:78920, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.210000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 41, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.210000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 41, len 4096, key (67, data, 41)
Jan  1 00:01:29 r888 user.debug kernel: [   88.210000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:83064, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1978126, pg 482, len 242, copied 242, i_size 1978126
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 483, i_size 1978368, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1978368, pg 483, len 3854, copied 3854, i_size 1978368
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1982222, pg 483, len 242, copied 242, i_size 1982222
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 484, i_size 1982464, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1982464, pg 484, len 3854, copied 3854, i_size 1982464
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1986318, pg 484, len 242, copied 242, i_size 1986318
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 485, i_size 1986560, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1986560, pg 485, len 3854, copied 3854, i_size 1986560
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1990414, pg 485, len 242, copied 242, i_size 1990414
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 486, i_size 1990656, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1990656, pg 486, len 3854, copied 3854, i_size 1990656
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1994510, pg 486, len 242, copied 242, i_size 1994510
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 487, i_size 1994752, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1994752, pg 487, len 3854, copied 3854, i_size 1994752
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1998606, pg 487, len 242, copied 242, i_size 1998606
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 488, i_size 1998848, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 1998848, pg 488, len 3854, copied 3854, i_size 1998848
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2002702, pg 488, len 242, copied 242, i_size 2002702
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 489, i_size 2002944, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.220000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2002944, pg 489, len 3854, copied 3854, i_size 2002944
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 42, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 42, len 4096, key (67, data, 42)
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:87208, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 43, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 43, len 4096, key (67, data, 43)
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:91352, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 44, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 44, len 4096, key (67, data, 44)
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:95496, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 45, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.240000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 45, len 4096, key (67, data, 45)
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:99640, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2006798, pg 489, len 242, copied 242, i_size 2006798
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 490, i_size 2007040, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2007040, pg 490, len 3854, copied 3854, i_size 2007040
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2010894, pg 490, len 242, copied 242, i_size 2010894
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 491, i_size 2011136, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2011136, pg 491, len 3854, copied 3854, i_size 2011136
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2014990, pg 491, len 242, copied 242, i_size 2014990
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 492, i_size 2015232, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2015232, pg 492, len 3854, copied 3854, i_size 2015232
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2019086, pg 492, len 242, copied 242, i_size 2019086
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 493, i_size 2019328, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2019328, pg 493, len 3854, copied 3854, i_size 2019328
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2023182, pg 493, len 242, copied 242, i_size 2023182
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): do_r
Jan  1 00:01:29 r888 user.info kernel: eadpage: ino 67, pg 494, i_size 2023424, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2023424, pg 494, len 3854, copied 3854, i_size 2023424
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2027278, pg 494, len 242, copied 242, i_size 2027278
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 495, i_size 2027520, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.250000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2027520, pg 495, len 3854, copied 3854, i_size 2027520
Jan  1 00:01:29 r888 user.debug kernel: [   88.270000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 46, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.270000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 46, len 4096, key (67, data, 46)
Jan  1 00:01:29 r888 user.debug kernel: [   88.270000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:103784, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.270000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 47, pg flags 0xb69
Jan  1 00:01:29 r888 user.debug kernel: [   88.270000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 47, len 4096, key (67, data, 47)
Jan  1 00:01:29 r888 user.debug kernel: [   88.270000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:107928, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.270000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 48, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.270000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 48, len 4096, key (67, data, 48)
Jan  1 00:01:29 r888 user.debug kernel: [   88.270000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:112072, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 49, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 49, len 4096, key (67, data, 49)
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:116216, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2031374, pg 495, len 242, copied 242, i_size 2031374
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 496, i_size 2031616, flags 0x21
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2031616, pg 496, len 3854, copied 3854, i_size 2031616
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2035470, pg 496, len 242, copied 242, i_size 2035470
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 497, i_size 2035712, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2035712, pg 497, len 3854, copied 3854, i_size 2035712
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2039566, pg 497, len 242, copied 242, i_size 2039566
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 498, i_size 2039808, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2039808, pg 498, len 3854, copied 3854, i_size 2039808
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2043662, pg 498, len 242, copied 242, i_size 2043662
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 499, i_size 2043904, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2043904, pg 499, len 3854, copied 3854, i_size 2043904
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2047758, pg 499, len 242, copied 242, i_size 2047758
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): do_readpage: ino 67, pg 500, i_size 2048000, flags 0x1
Jan  1 00:01:29 r888 user.debug kernel: [   88.280000] UBIFS DBG (pid 704): ubifs_write_end: ino 67, pos 2048000, pg 500, len 3854, copied 3854, i_size 2048000
Jan  1 00:01:29 r888 user.debug kernel: [   88.300000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 50, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.300000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 50, len 4096, key (67, data, 50)
Jan  1 00:01:29 r888 user.debug kernel: [   88.300000] UBIFS DBG (pid 866): write_node: jhead 2 (data), LEB 14:120360, len 4144
Jan  1 00:01:29 r888 user.debug kernel: [   88.300000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 51, pg flags 0xb2d
Jan  1 00:01:29 r888 user.debug kernel: [   88.300000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 51, len 4096, key (67, data, 51)
Jan  1 00:01:29 r888 user.debug kernel: [   88.300000] UBIFS DBG (pid 866): ubifs_find_free_space: min_space 4144
Jan  1 00:01:29 r888 user.err kernel: [   88.310000] UBIFS error (pid 866): check_lpt_type: invalid type (15) in LPT node type 0
Jan  1 00:01:29 r888 user.warn kernel: [   88.310000] [<c002789c>] (unwind_backtrace+0x0/0xe0) from [<bf0bca5c>] (check_lpt_type+0x58/0x70 [ubifs])
Jan  1 00:01:29 r888 user.warn kernel: [   88.320000] [<bf0bca5c>] (check_lpt_type+0x58/0x70 [ubifs]) from [<bf0bdd88>] (unpack_pnode+0x38/0x104 [ubifs])
Jan  1 00:01:29 r888 user.warn kernel: [   88.330000] [<bf0bdd88>] (unpack_pnode+0x38/0x104 [ubifs]) from [<bf0bdff0>] (scan_get_pnode+0x19c/0x21c [ubifs])
Jan  1 00:01:29 r888 user.warn kernel: [   88.350000] [<bf0bdff0>] (scan_get_pnode+0x19c/0x21c [ubifs]) from [<bf0c0480>] (ubifs_lpt_scan_nolock+0x414/0x460 [ubifs])
Jan  1 00:01:29 r888 user.warn kernel: [   88.360000] [<bf0c0480>] (ubifs_lpt_scan_nolock+0x414/0x460 [ubifs]) from [<bf0ba24c>] (ubifs_find_free_space+0x1ec/0x678 [ubifs])
Jan  1 00:01:29 r888 user.warn kernel: [   88.370000] [<bf0ba24c>] (ubifs_find_free_space+0x1ec/0x678 [ubifs]) from [<bf099710>] (make_reservation+0xe0/0x5f4 [ubifs])
Jan  1 00:01:29 r888 user.warn kernel: [   88.380000] [<bf099710>] (make_reservation+0xe0/0x5f4 [ubifs]) from [<bf09a690>] (ubifs_jnl_write_data+0x1c4/0x308 [ubifs])
Jan  1 00:01:29 r888 user.warn kernel: [   88.390000] [<bf09a690>] (ubifs_jnl_write_data+0x1c4/0x308 [ubifs]) from [<bf09d068>] (do_writepage+0xcc/0x220 [ubifs])
Jan  1 00:01:29 r888 user.warn kernel: [   88.400000] [<bf09d068>] (do_writepage+0xcc/0x220 [ubifs]) from [<c006b448>] (__writepage+0x14/0x64)
Jan  1 00:01:29 r888 user.warn kernel: [   88.410000] [<c006b448>] (__writepage+0x14/0x64) from [<c006b8e4>] (write_cache_pages+0x24c/0x3bc)
Jan  1 00:01:29 r888 user.warn kernel: [   88.420000] [<c006b8e4>] (write_cache_pages+0x24c/0x3bc) from [<c00a9e5c>] (writeback_single_inode+0xc0/0x218)
Jan  1 00:01:29 r888 user.warn kernel: [   88.430000] [<c00a9e5c>] (writeback_single_inode+0xc0/0x218) from [<c00aa7b0>] (writeback_inodes_wb+0x370/0x428)
Jan  1 00:01:29 r888 user.warn kernel: [   88.440000] [<c00aa7b0>] (writeback_inodes_wb+0x370/0x428) from [<c00aa9b4>] (wb_writeback+0x14c/0x1d0)
Jan  1 00:01:29 r888 user.warn kernel: [   88.450000] [<c00aa9b4>] (wb_writeback+0x14c/0x1d0) from [<c00aab74>] (wb_do_writeback+0x70/0x1ec)
Jan  1 00:01:29 r888 user.warn kernel: [   88.460000] [<c00aab74>] (wb_do_writeback+0x70/0x1ec) from [<c00aad1c>] (bdi_writeback_task+0x2c/0x94)
Jan  1 00:01:29 r888 user.warn kernel: [   88.470000] [<c00aad1c>] (bdi_writeback_task+0x2c/0x94) from [<c00767c0>] (bdi_start_fn+0x70/0xdc)
Jan  1 00:01:29 r888 user.warn kernel: [   88.480000] [<c00767c0>] (bdi_start_fn+0x70/0xdc) from [<c0046d38>] (kthread+0x7c/0x84)
Jan  1 00:01:29 r888 user.warn kernel: [   88.490000] [<c0046d38>] (kthread+0x7c/0x84) from [<c0022e98>] (kernel_thread_exit+0x0/0x8)
Jan  1 00:01:29 r888 user.err kernel: [   88.490000] UBIFS error (pid 866): make_reservation: cannot reserve 4144 bytes in jhead 2, error -22
Jan  1 00:01:29 r888 user.err kernel: [   88.500000] UBIFS error (pid 866): do_writepage: cannot write page 51 of inode 67, error -22
Jan  1 00:01:29 r888 user.warn kernel: [   88.510000] UBIFS warning (pid 866): ubifs_ro_mode: switched to read-only mode, error -22
Jan  1 00:01:29 r888 user.warn kernel: [   88.520000] [<c002789c>] (unwind_backtrace+0x0/0xe0) from [<bf09d0c4>] (do_writepage+0x128/0x220 [ubifs])
Jan  1 00:01:29 r888 user.warn kernel: [   88.530000] [<bf09d0c4>] (do_writepage+0x128/0x220 [ubifs]) from [<c006b448>] (__writepage+0x14/0x64)
Jan  1 00:01:29 r888 user.warn kernel: [   88.540000] [<c006b448>] (__writepage+0x14/0x64) from [<c006b8e4>] (write_cache_pages+0x24c/0x3bc)
Jan  1 00:01:29 r888 user.warn kernel: [   88.550000] [<c006b8e4>] (write_cache_pages+0x24c/0x3bc) from [<c00a9e5c>] (writeback_single_inode+0xc0/0x218)
Jan  1 00:01:29 r888 user.warn kernel: [   88.560000] [<c00a9e5c>] (writeback_single_inode+0xc0/0x218) from [<c00aa7b0>] (writeback_inodes_wb+0x370/0x428)
Jan  1 00:01:29 r888 user.warn kernel: [   88.570000] [<c00aa7b0>] (writeback_inodes_wb+0x370/0x428) from [<c00aa9b4>] (wb_writeback+0x14c/0x1d0)
Jan  1 00:01:29 r888 user.warn kernel: [   88.580000] [<c00aa9b4>] (wb_writeback+0x14c/0x1d0) from [<c00aab74>] (wb_do_writeback+0x70/0x1ec)
Jan  1 00:01:29 r888 user.warn kernel: [   88.590000] [<c00aab74>] (wb_do_writeback+0x70/0x1ec) from [<c00aad1c>] (bdi_writeback_task+0x2c/0x94)
Jan  1 00:01:29 r888 user.warn kernel: [   88.600000] [<c00aad1c>] (bdi_writeback_task+0x2c/0x94) from [<c00767c0>] (bdi_start_fn+0x70/0xdc)
Jan  1 00:01:29 r888 user.warn kernel: [   88.610000] [<c00767c0>] (bdi_start_fn+0x70/0xdc) from [<c0046d38>] (kthread+0x7c/0x84)
Jan  1 00:01:29 r888 user.warn kernel: [   88.610000] [<c0046d38>] (kthread+0x7c/0x84) from [<c0022e98>] (kernel_thread_exit+0x0/0x8)
Jan  1 00:01:29 r888 user.debug kernel: [   88.630000] UBIFS DBG (pid 704): ubifs_unlink: dent 'MPR_547_6.tmp' from ino 67 (nlink 1) in dir ino 66
Jan  1 00:01:29 r888 user.debug kernel: [   88.630000] UBIFS DBG (pid 704): ubifs_jnl_update: ino 67, dent 'MPR_547_6.tmp', data len 0 in dir ino 66
Jan  1 00:01:29 r888 user.err kernel: [   88.630000] UBIFS error (pid 704): make_reservation: cannot reserve 392 bytes in jhead 1, error -30
Jan  1 00:01:29 r888 user.debug kernel: [   89.370000] UBIFS DBG (pid 866): ubifs_write_inode: inode 67, mode 0x81a4, nlink 1
Jan  1 00:01:29 r888 user.debug kernel: [   89.370000] UBIFS DBG (pid 866): ubifs_jnl_write_inode: ino 67, nlink 1
Jan  1 00:01:29 r888 user.err kernel: [   89.370000] UBIFS error (pid 866): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
Jan  1 00:01:29 r888 user.err kernel: [   89.370000] UBIFS error (pid 866): ubifs_write_
Jan  1 00:01:29 r888 user.info kernel: inode: can't write inode 67, error -30

Jan  1 00:01:59 r888 user.debug kernel: [  119.400000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 52, pg flags 0xb2d
Jan  1 00:01:59 r888 user.debug kernel: [  119.400000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 52, len 4096, key (67, data, 52)
Jan  1 00:01:59 r888 user.err kernel: [  119.400000] UBIFS error (pid 866): make_reservation: cannot reserve 4040 bytes in jhead 2, error -30
Jan  1 00:01:59 r888 user.err kernel: [  119.410000] UBIFS error (pid 866): do_writepage: cannot write page 52 of inode 67, error -30
Jan  1 00:02:04 r888 user.debug kernel: [  124.420000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 53, pg flags 0xb2d
Jan  1 00:02:04 r888 user.debug kernel: [  124.420000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 53, len 4096, key (67, data, 53)
Jan  1 00:02:04 r888 user.err kernel: [  124.420000] UBIFS error (pid 866): make_reservation: cannot reserve 1539 bytes in jhead 2, error -30
Jan  1 00:02:04 r888 user.err kernel: [  124.430000] UBIFS error (pid 866): do_writepage: cannot write page 53 of inode 67, error -30
Jan  1 00:02:09 r888 user.debug kernel: [  129.440000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 54, pg flags 0xb2d
Jan  1 00:02:09 r888 user.debug kernel: [  129.440000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 54, len 4096, key (67, data, 54)
Jan  1 00:02:09 r888 user.err kernel: [  129.440000] UBIFS error (pid 866): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
Jan  1 00:02:09 r888 user.err kernel: [  129.450000] UBIFS error (pid 866): do_writepage: cannot write page 54 of inode 67, error -30
Jan  1 00:02:14 r888 user.debug kernel: [  134.460000] UBIFS DBG (pid 866): ubifs_writepage: ino 67, pg 55, pg flags 0xb2d
Jan  1 00:02:14 r888 user.debug kernel: [  134.460000] UBIFS DBG (pid 866): ubifs_jnl_write_data: ino 67, blk 55, len 4096, key (67, data, 55)
Jan  1 00:02:14 r888 user.err kernel: [  134.460000] UBIFS error (pid 866): make_reservation: cannot reserve 4062 bytes in jhead 2, error -30
Jan  1 00:02:14 r888 user.err kernel: [  134.470000] UBIFS error (pid 866): do_writepage: cannot write page 55 of inode 67, error -30
...

--------------010903020202060604090704--
