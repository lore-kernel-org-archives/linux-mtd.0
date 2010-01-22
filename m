Received: from mail.theptrgroup.com ([71.178.251.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NY9nq-0006dQ-F0
	for linux-mtd@lists.infradead.org; Fri, 22 Jan 2010 03:03:22 +0000
Received: from [10.11.13.114] (unknown [10.11.13.114])
	by mail.theptrgroup.com (Postfix) with ESMTP id 36D7C1E001
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Jan 2010 22:02:10 -0500 (EST)
Message-ID: <4B591573.60602@theptrgroup.com>
Date: Thu, 21 Jan 2010 22:03:15 -0500
From: Jeff Angielski <jeff@theptrgroup.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS assert failed in ubifs_dirty_inode
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I am trying use an UBIFS root filesystem on my PowerPC MPC8544 but I am 
seeing some intermitent problems with "UBIFS assert failed in 
ubifs_dirty_inode" errors.

On the first boot after I program the NAND with a fresh UBI image, 
everything seems to work ok.

After that, on subsequent powercycles or reboots, I sometimes see a boot 
with the following error:

[    5.984232] UBIFS assert failed in ubifs_dirty_inode at 377 (pid 1011)

If that message occurs, in less than 1 or 2 minutes, the system is 
unresponsive and I start to see infinite messages of:

[   55.072791] UBIFS assert failed in ubifs_release_budget at 566 (pid 974)
[   55.079502] Call Trace:
[   55.081960] [df187ce0] [c00070f8] show_stack+0x3c/0x17c (unreliable)
[   55.088334] [df187d20] [c0196a44] ubifs_release_budget+0x3e0/0x5d0
[   55.094533] [df187d30] [c01752d4] release_existing_page_budget+0x30/0x40
[   55.101241] [df187d60] [c01765ac] do_writepage+0xd0/0x1e4
[   55.106652] [df187da0] [c00786e0] __writepage+0x24/0x80
[   55.111884] [df187db0] [c0078b14] write_cache_pages+0x184/0x310
[   55.117817] [df187e50] [c00c5cb0] writeback_single_inode+0xac/0x288
[   55.124092] [df187e80] [c00c6608] writeback_inodes_wb+0x2d4/0x458
[   55.130193] [df187ed0] [c00c68b8] wb_writeback+0x12c/0x200
[   55.135686] [df187f40] [c00c6cb0] wb_do_writeback+0x224/0x244
[   55.141439] [df187f80] [c00c6d38] bdi_writeback_task+0x68/0xa8
[   55.147282] [df187fa0] [c0086430] bdi_start_fn+0x80/0x104
[   55.152691] [df187fc0] [c0050cc4] kthread+0x78/0x7c
[   55.157581] [df187ff0] [c000fac8] kernel_thread+0x4c/0x68
[   55.163362] UBIFS assert failed in ubifs_budget_space at 463 (pid 1139)
[   55.169984] Call Trace:
[   55.172427] [df19dcf0] [c00070f8] show_stack+0x3c/0x17c (unreliable)
[   55.178795] [df19dd30] [c019735c] ubifs_budget_space+0x650/0xa30
[   55.184818] [df19dd90] [c01753dc] ubifs_aio_write+0xb0/0x1e8
[   55.190488] [df19ddf0] [c00a41e8] do_sync_readv_writev+0xa0/0x114
[   55.196588] [df19de90] [c00a49e0] do_readv_writev+0xb4/0x1d8
[   55.202255] [df19df10] [c00a5658] sys_writev+0x4c/0x90
[   55.207401] [df19df40] [c000fd48] ret_from_syscall+0x0/0x3c
[   55.213212] UBIFS assert failed in ubifs_release_budget at 566 (pid 1139)
[   55.220007] Call Trace:
[   55.222459] [df19dd10] [c00070f8] show_stack+0x3c/0x17c (unreliable)
[   55.228834] [df19dd50] [c0196a44] ubifs_release_budget+0x3e0/0x5d0
[   55.235027] [df19dd60] [c01752d4] release_existing_page_budget+0x30/0x40
[   55.241736] [df19dd90] [c01765ac] do_writepage+0xd0/0x1e4
[   55.247144] [df19ddd0] [c00786e0] __writepage+0x24/0x80
[   55.252376] [df19dde0] [c0078b14] write_cache_pages+0x184/0x310
[   55.258303] [df19de80] [c0072294] __filemap_fdatawrite_range+0x7c/0x90
[   55.264843] [df19dee0] [c00722fc] filemap_write_and_wait_range+0x54/0x98
[   55.271550] [df19df00] [c00ca844] vfs_fsync_range+0x60/0xc4
[   55.277129] [df19df20] [c00ca94c] do_fsync+0x30/0x54
[   55.282101] [df19df40] [c000fd48] ret_from_syscall+0x0/0x3c
[   55.287712] UBIFS assert failed in ubifs_release_budget at 566 (pid 974)
[   55.294416] Call Trace:
[   55.296865] [df187db0] [c00070f8] show_stack+0x3c/0x17c (unreliable)
[   55.303232] [df187df0] [c0196a44] ubifs_release_budget+0x3e0/0x5d0
[   55.309420] [df187e00] [c0196c74] 
ubifs_release_dirty_inode_budget+0x40/0x50
[   55.316475] [df187e30] [c017e360] ubifs_write_inode+0xb0/0x1d4
[   55.322320] [df187e50] [c00c5e3c] writeback_single_inode+0x238/0x288
[   55.328680] [df187e80] [c00c6608] writeback_inodes_wb+0x2d4/0x458
[   55.334781] [df187ed0] [c00c68b8] wb_writeback+0x12c/0x200
[   55.340274] [df187f40] [c00c6cb0] wb_do_writeback+0x224/0x244
[   55.346027] [df187f80] [c00c6d38] bdi_writeback_task+0x68/0xa8
[   55.351869] [df187fa0] [c0086430] bdi_start_fn+0x80/0x104
[   55.357277] [df187fc0] [c0050cc4] kthread+0x78/0x7c

... Goes on forever, or at least the target becomes unresponsive and I 
need to power cycle.

It occurs in both the DENX 2.6.31 and the DENX 2.6.33-rc4 (which was 
merged the infradead kernel on December 10th).

I have the latest and greatest mtd-utils which I needed to fix my 
ubiformat problem.

It occurs no matter whether I ubiformat an ubi image on the target or 
whether I install the rootfs via untaring to a ubifs mount point.

Here are the boot messages of one where the ubifs fails:


[    0.000000] Using theCore machine description
[    0.000000] Memory CAM mapping: 256/256 Mb, residual: 0Mb
[    0.000000] Linux version 2.6.33-rc4 (user@ubuntu) (gcc version 
4.2.2) #1 PREEMPT Thu Jan 21 20:03:54 EST 2010
[    0.000000] bootconsole [udbg0] enabled 

setup_arch: bootmem 

thecore_setup_arch() 

[    0.000000] Found FSL PCI host bridge at 0x00000000e0008000. Firmware 
bus number: 0->0
[    0.000000] PCI host bridge /pci@e0008000 (primary) ranges: 

[    0.000000]  MEM 0x00000000c0000000..0x00000000dfffffff -> 
0x00000000c0000000
[    0.000000] /pci@e0008000: PCICSRBAR @ 0xfff00000 

arch: exit 

[    0.000000] Zone PFN ranges: 

[    0.000000]   DMA      0x00000000 -> 0x00020000 

[    0.000000]   Normal   0x00020000 -> 0x00020000 

[    0.000000] Movable zone start PFN for each node 

[    0.000000] early_node_map[1] active PFN ranges 

[    0.000000]     0: 0x00000000 -> 0x00020000 

[    0.000000] MMU: Allocated 1088 bytes of context maps for 255 
contexts
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on. 
Total pages: 130048
[    0.000000] Kernel command line: ubi.mtd=8 root=ubi0:fs1 rw 
rootfstype=ubifs 
ip=192.168.0.251:192.168.0.61:192.168.0.61:255.255.0.0:thecore:eth0:off 
console=ttyS0,115200
[    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes) 
 

[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 
bytes) 

[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 
bytes) 

[    0.000000] Memory: 514560k/524288k available (4564k kernel code, 
9396k reserved, 152k data, 124k bss, 152k init) 

[    0.000000] Kernel virtual memory layout: 
 

[    0.000000]   * 0xfffdf000..0xfffff000  : fixmap 
 

[    0.000000]   * 0xfdffc000..0xfe000000  : early ioremap 
 

[    0.000000]   * 0xe1000000..0xfdffc000  : vmalloc & ioremap 
 

[    0.000000] SLUB: Genslabs=13, HWalign=32, Order=0-3, MinObjects=0, 
CPUs=1, Nodes=1 

[    0.000000] Hierarchical RCU implementation. 
 

[    0.000000] NR_IRQS:512 nr_irqs:512 
 

[    0.000000] mpic: Setting up MPIC " OpenPIC  " version 1.2 at 
e0040000, max 1 CPUs 

[    0.000000] mpic: ISU size: 80, shift: 7, mask: 7f 
 

[    0.000000] mpic: Initializing for 80 sources 
 

[    0.000000] clocksource: timebase mult[5000000] shift[22] registered 
 

[    0.000000] Console: colour dummy device 80x25 
 

[    0.010749] Mount-cache hash table entries: 512 
 

[    0.016754] NET: Registered protocol family 16 
 

 
 

[    0.023479] PCI: Probing PCI hardware 
 

[    0.027190] PCI: I/O resource not set for host bridge /pci@e0008000 
(domain 0) 

[    0.040419] bio: create slab <bio-0> at 0 
 

[    0.044938] vgaarb: loaded 
 

[    0.047926] SCSI subsystem initialized 
 

[    0.052046] usbcore: registered new interface driver usbfs 
 

[    0.057642] usbcore: registered new interface driver hub 
 

[    0.062999] usbcore: registered new device driver usb 
 

[    0.068417] Switching to clocksource timebase 
 

[    0.073628] NET: Registered protocol family 2 
 

[    0.078052] IP route cache hash table entries: 4096 (order: 2, 16384 
bytes) 

[    0.085376] TCP established hash table entries: 16384 (order: 5, 
131072 bytes) 

[    0.092728] TCP bind hash table entries: 16384 (order: 4, 65536 
bytes) 

[    0.099268] TCP: Hash tables configured (established 16384 bind 
16384) 

[    0.105707] TCP reno registered 
 

[    0.108834] UDP hash table entries: 256 (order: 0, 4096 bytes) 
 

[    0.114655] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes) 
 

[    0.121016] NET: Registered protocol family 1 
 

[    0.125490] RPC: Registered udp transport module. 
 

[    0.130165] RPC: Registered tcp transport module. 
 

[    0.134794] RPC: Registered tcp NFSv4.1 backchannel transport module. 
 

[    0.152607] squashfs: version 4.0 (2009/01/31) Phillip Lougher 
 

[    0.159456] JFFS2 version 2.2. (NAND) ?© 2001-2006 Red Hat, Inc. 
 

[    0.165994] msgmni has been set to 1005 
 

[    0.170026] io scheduler noop registered 
 

[    0.173876] io scheduler deadline registered 
 

[    0.178439] io scheduler cfq registered (default) 
 

[    0.279675] Generic RTC Driver v1.07 
 

[    0.283397] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled 
 

[    0.291300] serial8250.0: ttyS0 at MMIO 0xe0004500 (irq = 42) is a 
16550A 

[    0.298039] console [ttyS0] enabled, bootconsole disabled 
 

[    0.298039] console [ttyS0] enabled, bootconsole disabled 
 

[    0.309463] serial8250.0: ttyS1 at MMIO 0xe0004600 (irq = 42) is a 
16550A 

[    0.320944] brd: module loaded 
 

[    0.326258] loop: module loaded 
 

[    0.332367] f8000000.nor: Found 1 x16 devices at 0x0 in 16-bit bank 
 

[    0.338727]  Amd/Fujitsu Extended Query Table at 0x0040 
 

[    0.343971] f8000000.nor: CFI does not contain boot bank location. 
Assuming top. 

[    0.351368] number of CFI chips: 1 
 

[    0.354910] RedBoot partition parsing not available 
 

[    0.359830] Creating 8 MTD partitions on "f8000000.nor": 
 

[    0.365146] 0x000000000000-0x000000020000 : "config" 
 

[    0.370900] 0x000000020000-0x000000280000 : "kernel" 
 

[    0.376521] 0x000000280000-0x0000002a0000 : "fdt" 
 

[    0.381879] 0x0000002a0000-0x0000008a0000 : "tinyfs" 
 

[    0.387502] 0x0000008a0000-0x000007f40000 : "rootfs" 
 

[    0.393163] 0x000007f40000-0x000007f60000 : "u-boot-env-r" 
 

[    0.399312] 0x000007f60000-0x000007f80000 : "u-boot-env" 
 

[    0.405300] 0x000007f80000-0x000008000000 : "u-boot" 
 

[    0.411185] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xd3 (Micron 
NAND 1GiB 3,3V 8-bit) 

[    0.419580] Scanning device for bad blocks 
 

[    0.429316] Bad eraseblock 72 at 0x000001200000 
 

[    0.500043] Bad eraseblock 930 at 0x00000e880000 
 

[    0.575322] Bad eraseblock 1846 at 0x00001cd80000 
 

[    0.650842] Bad eraseblock 2764 at 0x00002b300000 
 

[    0.690347] Bad eraseblock 3215 at 0x0000323c0000 
 

[    0.715104] Bad eraseblock 3475 at 0x0000364c0000 
 

[    0.727215] Bad eraseblock 3571 at 0x000037cc0000 
 

[    0.772356] Creating 2 MTD partitions on "f4000000.nand": 
 

[    0.777757] 0x000000000000-0x000020000000 : "fs1" 
 

[    0.783226] 0x000020000000-0x000040000000 : "fs2" 
 

[    0.789135] UBI: attaching mtd8 to ubi0 
 

[    0.793054] UBI: physical eraseblock size:   262144 bytes (256 KiB) 
 

[    0.799321] UBI: logical eraseblock size:    258048 bytes 
 

[    0.804719] UBI: smallest flash I/O unit:    4096 
 

[    0.809421] UBI: sub-page size:              1024 
 

[    0.814124] UBI: VID header offset:          1024 (aligned 1024) 
 

[    0.820129] UBI: data offset:                4096 
 

[    1.899933] UBI: attached mtd8 to ubi0 
 

[    1.903706] UBI: MTD device name:            "fs1" 
 

[    1.908496] UBI: MTD device size:            512 MiB 
 

[    1.913460] UBI: number of good PEBs:        2045 
 

[    1.918163] UBI: number of bad PEBs:         3 
 

[    1.922605] UBI: max. allowed volumes:       128 
 

[    1.927220] UBI: wear-leveling threshold:    4096 
 

[    1.931922] UBI: number of internal volumes: 1 
 

[    1.936364] UBI: number of user volumes:     1 
 

[    1.940806] UBI: available PEBs:             0 
 

[    1.945247] UBI: total number of reserved PEBs: 2045 
 

[    1.950210] UBI: number of PEBs reserved for bad PEB handling: 20 
 

[    1.956302] UBI: max/mean erase counter: 31/18 
 

[    1.960745] UBI: image sequence number: 86187995 
 

[    1.965428] UBI: background thread "ubi_bgt0d" started, PID 918 
 

[    1.972655] eth0: Gianfar Ethernet Controller Version 1.2, 
00:11:44:00:00:00 

[    1.979722] eth0: Running with NAPI enabled 
 

[    1.983905] eth0: :RX BD ring size for Q[0]: 256 
 

[    1.988522] eth0:TX BD ring size for Q[0]: 256 
 

[    1.993730] eth1: Gianfar Ethernet Controller Version 1.2, 
00:11:44:00:80:00 

[    2.000824] eth1: Running with NAPI enabled 
 

[    2.005007] eth1: :RX BD ring size for Q[0]: 256 
 

[    2.009622] eth1:TX BD ring size for Q[0]: 256 
 

[    2.014447] Freescale PowerQUICC MII Bus: probed 
 

[    2.020076] Freescale PowerQUICC MII Bus: probed 
 

[    2.025095] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver 
 

[    2.031421] Initializing USB Mass Storage driver... 
 

[    2.036401] usbcore: registered new interface driver usb-storage 
 

[    2.042423] USB Mass Storage support registered. 
 

[    2.047239] usbcore: registered new interface driver usbserial 
 

[    2.053083] usbserial: USB Serial Driver core 
 

[    2.060270] usbcore: registered new interface driver usbhid 
 

[    2.065871] usbhid: USB HID core driver 
 

[    2.070612] TCP cubic registered 
 

[    2.073892] Initializing XFRM netlink socket 
 

[    2.078170] NET: Registered protocol family 17 
 

[    3.588981] IP-Config: Complete: 
 

[    3.592033]      device=eth0, addr=192.168.0.251, mask=255.255.0.0, 
gw=192.168.0.61, 

[    3.599723]      host=thecore, domain=, nis-domain=(none), 
 

[    3.605212]      bootserver=192.168.0.61, rootserver=192.168.0.61, 
rootpath= 

[    3.979134] UBIFS: mounted UBI device 0, volume 0, name "fs1" 
 

[    3.984903] UBIFS: file system size:   518934528 bytes (506772 KiB, 
494 MiB, 2011 LEBs) 

[    3.992908] UBIFS: journal size:       9420800 bytes (9200 KiB, 8 
MiB, 37 LEBs) 

[    4.000217] UBIFS: media format:       w4/r0 (latest is w4/r0) 
 

[    4.006049] UBIFS: default compressor: lzo 
 

[    4.010144] UBIFS: reserved for root:  0 bytes (0 KiB) 
 

[    4.016825] VFS: Mounted root (ubifs filesystem) on device 0:12. 
 

[    4.022851] Freeing unused kernel memory: 152k init 
 

INIT: version 2.86 booting 
 

                 Welcome to DENX Embedded Linux Environment 
 

                 Press 'I' to enter interactive startup. 
 

Timed out waiting for time change. 
 

Setting clock : Thu Jan  1 01:00:05 CET 1970 [  OK  ] 
 

Building the cache [  OK  ] 
 

Setting hostname thecore:  [  OK  ] 
 

Checking filesystems 
 

Checking all file systems. 
 

[  OK  ] 
 

Mounting local filesystems:  [  OK  ] 
 

[    5.783968] UBIFS assert failed in ubifs_dirty_inode at 377 (pid 
1011)


-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
