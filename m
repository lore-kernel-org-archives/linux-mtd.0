Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAGvH-0007T9-Rh
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 13:52:20 +0000
Date: Fri, 25 Nov 2016 14:51:52 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [BUG?] ubi.fm_autoconvert=1 on first boot
Message-ID: <20161125135152.f4npajnz5x76f5x7@pengutronix.de>
References: <20161125113412.3ozyc7bjjecjahnb@pengutronix.de>
 <4d53ffff-a294-8238-bab1-004416e8d7be@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d53ffff-a294-8238-bab1-004416e8d7be@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard!

On Fri, Nov 25, 2016 at 02:14:16PM +0100, Richard Weinberger wrote:
> Steffen,
> 
> On 25.11.2016 12:34, Steffen Trumtrar wrote:
> > Hi!
> > 
> > I'm trying to use ubi.fm_autoconvert=1 with the current (v4.9-rc6) mainline kernel.
> > I have the following setup:
> > 
> > - kernel commandline:
> > 	(...) root=ubi0:root ubi.mtd=nand0.root1 ubi.mtd=nand0.data rootfstype=ubifs rw ubi.fm_autoconvert=1
> > 	mtdparts=gpmi-nand:(...),6M(nand0.kernel1),6M(nand0.kernel2),68M(nand0.root1),68M(nand0.root2),-(nand0.data)
> > 
> > - root1 partition: (is not empty when flashed)
> > 
> > 	mtdinfo /dev/mtd6
> > 	mtd6
> > 	Name:                           nand0.root1
> > 	Type:                           nand
> > 	Eraseblock size:                131072 bytes, 128.0 KiB
> > 	Amount of eraseblocks:          544 (71303168 bytes, 68.0 MiB)
> > 	Minimum input/output unit size: 2048 bytes
> > 	Sub-page size:                  2048 bytes
> > 	OOB size:                       64 bytes
> > 	Character device major/minor:   90:12
> > 	Bad blocks are allowed:         true
> > 	Device is writable:             true
> > 
> > - data partition: (is empty when flashed)
> > 
> > 	mtdinfo /dev/mtd8
> > 	mtd8
> > 	Name:                           nand0.data
> > 	Type:                           nand
> > 	Eraseblock size:                131072 bytes, 128.0 KiB
> > 	Amount of eraseblocks:          846 (110886912 bytes, 105.8 MiB)
> > 	Minimum input/output unit size: 2048 bytes
> > 	Sub-page size:                  2048 bytes
> > 	OOB size:                       64 bytes
> > 	Character device major/minor:   90:16
> > 	Bad blocks are allowed:         true
> > 	Device is writable:             true
> > 
> > - bootlog:
> > (...)
> > 
> > As you can see mtd8 can not be autoresized and attached.
> > What works however is: booting first with ubi.fm_autoconvert=0 and then enabling
> > it on the second boot.
> > 
> > Am I holding it wrong or is this a bug?
> 
> A bug. :(
> What you're trying to do used to work and works also here on my test bed.
> Can you please share the kernel logs verbatim?
> I miss some infos from UBI.

Actually, that is everything there is in respect to UBI.
Nevertheless the whole (anonymized) bootlog is:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.9.0-rc6 (str@ptx) (gcc version 5.4.0 (OSELAS.Toolchain-2016.06.0) ) #45 Fri Nov 25 11:02:38 CET 2016
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] OF: fdt:Machine model: XXXXX
[    0.000000] Memory policy: Data cache writeback
[    0.000000] On node 0 totalpages: 32768
[    0.000000] free_area_init_node: node 0, pgdat c04805e0, node_mem_map c7efb000
[    0.000000]   Normal zone: 256 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 32768 pages, LIFO batch:7
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
[    0.000000] Kernel command line: console=ttyAMA0,115200 resetsource=RST debug watchdog.activate_first=0 watchdog.limit_fallback=4 watchdog.limit_off=8 last_update=2015-01-28_15:06:27 watchdog.reset_ct=0  root=ubi0:root ubi.mtd=nand0.root1 ubi.mtd=nand0.data rootfstype=ubifs rw ubi.fm_autoconvert=1 earlyprintk mtdparts=gpmi-nand:1M(nand0.bcb)ro,512k(nand0.uboot),384k(nand0.env0),384k(nand0.env1),6M(nand0.kernel1),6M(nand0.kernel2),68M(nand0.root1),68M(nand0.root2),-(nand0.data)
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 125092K/131072K available (3333K kernel code, 114K rwdata, 876K rodata, 144K init, 109K bss, 5980K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xc8800000 - 0xff800000   ( 880 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0349ac8   (3335 kB)
[    0.000000]       .init : 0xc0440000 - 0xc0464000   ( 144 kB)
[    0.000000]       .data : 0xc0464000 - 0xc0480be0   ( 115 kB)
[    0.000000]        .bss : 0xc0480be0 - 0xc049c248   ( 110 kB)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] clocksource: mxs_timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 ns
[    0.000021] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
[    0.000270] Calibrating delay loop... 226.09 BogoMIPS (lpj=1130496)
[    0.080280] pid_max: default: 32768 minimum: 301
[    0.080521] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.080562] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.082015] CPU: Testing write buffer coherency: ok
[    0.082765] Setting up static identity map for 0x40008400 - 0x4000843c
[    0.086102] devtmpfs: initialized
[    0.102891] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.103183] pinctrl core: initialized pinctrl subsystem
[    0.105167] NET: Registered protocol family 16
[    0.106744] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.109493] cpuidle: using governor ladder
[    0.109538] cpuidle: using governor menu
[    0.115535] imx28-pinctrl 80018000.pinctrl: function nodes must be grouped by name (failed for: auart1)
[    0.121691] gpio gpiochip0: (80018000.pinctrl:gpio@0): added GPIO chardev (254:0)
[    0.122439] gpiochip_setup_dev: registered GPIOs 0 to 31 on device: gpiochip0 (80018000.pinctrl:gpio@0)
[    0.127048] gpio gpiochip1: (80018000.pinctrl:gpio@1): added GPIO chardev (254:1)
[    0.127793] gpiochip_setup_dev: registered GPIOs 32 to 63 on device: gpiochip1 (80018000.pinctrl:gpio@1)
[    0.132181] gpio gpiochip2: (80018000.pinctrl:gpio@2): added GPIO chardev (254:2)
[    0.132894] gpiochip_setup_dev: registered GPIOs 64 to 95 on device: gpiochip2 (80018000.pinctrl:gpio@2)
[    0.137215] gpio gpiochip3: (80018000.pinctrl:gpio@3): added GPIO chardev (254:3)
[    0.137919] gpiochip_setup_dev: registered GPIOs 96 to 127 on device: gpiochip3 (80018000.pinctrl:gpio@3)
[    0.142563] gpio gpiochip4: (80018000.pinctrl:gpio@4): added GPIO chardev (254:4)
[    0.143285] gpiochip_setup_dev: registered GPIOs 128 to 159 on device: gpiochip4 (80018000.pinctrl:gpio@4)
[    0.161868] Serial: AMBA PL011 UART driver
[    0.162712] 80074000.serial: ttyAMA0 at MMIO 0x80074000 (irq = 231, base_baud = 0) is a PL011 rev2
[    0.583724] console [ttyAMA0] enabled
[    0.604098] mxs-dma 80004000.dma-apbh: initialized
[    0.612576] mxs-dma 80024000.dma-apbx: initialized
[    0.618136] of_get_named_gpiod_flags: can't parse 'gpio' property of node '/regulators/14p0v[0]'
[    0.627715] of_get_named_gpiod_flags: can't parse 'gpio' property of node '/regulators/5p0v[0]'
[    0.637042] of_get_named_gpiod_flags: can't parse 'gpio' property of node '/regulators/3p5v[0]'
[    0.646673] of_get_named_gpiod_flags: parsed 'gpio' property of node '/regulators/usb0_vbus[0]' - status (0)
[    0.658218] usbcore: registered new interface driver usbfs
[    0.663943] usbcore: registered new interface driver hub
[    0.669577] usbcore: registered new device driver usb
[    0.677656] clocksource: Switched to clocksource mxs_timer
[    0.687153] NET: Registered protocol family 2
[    0.693015] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
[    0.700167] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.706570] TCP: Hash tables configured (established 1024 bind 1024)
[    0.713179] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.719161] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.725801] NET: Registered protocol family 1
[    0.731378] RPC: Registered named UNIX socket transport module.
[    0.737335] RPC: Registered udp transport module.
[    0.742158] RPC: Registered tcp transport module.
[    0.746888] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.755476] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.762217] workingset: timestamp_bits=30 max_order=15 bucket_order=0
[    0.789998] io scheduler noop registered (default)
[    0.804778] random: fast init done
[    0.810747] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    0.817126] nand: Micron MT29F2G08ABAEAH4
[    0.821262] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    0.829057] Scanning device for bad blocks
[    1.263905] 9 cmdlinepart partitions found on MTD device gpmi-nand
[    1.270206] Creating 9 MTD partitions on "gpmi-nand":
[    1.275297] 0x000000000000-0x000000100000 : "nand0.bcb"
[    1.283458] 0x000000100000-0x000000180000 : "nand0.uboot"
[    1.291810] 0x000000180000-0x0000001e0000 : "nand0.env0"
[    1.300036] 0x0000001e0000-0x000000240000 : "nand0.env1"
[    1.308296] 0x000000240000-0x000000840000 : "nand0.kernel1"
[    1.317013] 0x000000840000-0x000000e40000 : "nand0.kernel2"
[    1.325820] 0x000000e40000-0x000005240000 : "nand0.root1"
[    1.336979] 0x000005240000-0x000009640000 : "nand0.root2"
[    1.348380] 0x000009640000-0x000010000000 : "nand0.data"
[    1.361062] gpmi-nand 8000c000.gpmi-nand: driver registered.
[    1.389912] libphy: Fixed MDIO Bus: probed
[    1.394041] vcan: Virtual CAN interface driver
[    1.398614] CAN device driver interface
[    1.402946] 80032000.can supply xceiver not found, using dummy regulator
[    1.411683] flexcan 80032000.can: device registered (reg_base=c8890000, irq=210)
[    1.419542] 80034000.can supply xceiver not found, using dummy regulator
[    1.428294] flexcan 80034000.can: device registered (reg_base=c8894000, irq=211)
[    1.436034] PPP generic driver version 2.4.2
[    1.440951] PPP BSD Compression module registered
[    1.445686] PPP Deflate Compression module registered
[    1.451082] usbcore: registered new interface driver asix
[    1.456665] usbcore: registered new interface driver ax88179_178a
[    1.462884] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.469720] usbcore: registered new interface driver cdc_acm
[    1.475405] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    1.483838] usbcore: registered new interface driver usbserial
[    1.489935] usbcore: registered new interface driver cp210x
[    1.495668] usbserial: USB Serial support registered for cp210x
[    1.501849] usbcore: registered new interface driver ftdi_sio
[    1.507846] usbserial: USB Serial support registered for FTDI USB Serial Device
[    1.522931] 80090000.usb supply vbus not found, using dummy regulator
[    1.533277] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    1.538383] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
[    1.567823] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    1.575526] hub 1-0:1.0: USB hub found
[    1.579550] hub 1-0:1.0: 1 port detected
[    1.584978] using random self ethernet address
[    1.589568] using random host ethernet address
[    1.595542] usb0: HOST MAC 5e:d7:0b:7f:2d:6f
[    1.600069] usb0: MAC d2:b2:16:f9:a2:9c
[    1.604004] using random self ethernet address
[    1.608567] using random host ethernet address
[    1.613200] g_ether gadget: Ethernet Gadget, version: Memorial Day 2008
[    1.619934] g_ether gadget: g_ether ready
[    1.628253] stmp3xxx-rtc 80056000.rtc: rtc core: registered 80056000.rtc as rtc0
[    1.637200] stmp3xxx_rtc_wdt stmp3xxx_rtc_wdt: initialized watchdog with heartbeat 19s
[    1.652021] NET: Registered protocol family 17
[    1.656540] can: controller area network core (rev 20120528 abi 9)
[    1.663086] NET: Registered protocol family 29
[    1.667734] can: raw protocol (rev 20120528)
[    1.672034] can: broadcast manager protocol (rev 20160617 t)
[    1.677810] can: netlink gateway (rev 20130117) max_hops=1
[    1.686057] registered taskstats version 1
[    1.697223] ubi0: default fastmap pool size: 25
[    1.701908] ubi0: default fastmap WL pool size: 12
[    1.706725] ubi0: attaching mtd6
[    1.937814] usb 1-1: new full-speed USB device number 2 using ci_hdrc
[    2.138140] cdc_acm 1-1:1.0: ttyACM0: USB ACM device
[    2.154041] g_ether gadget: high-speed config #1: CDC Ethernet (ECM)
[    2.476067] ubi0: scanning is finished
[    2.499649] ubi0: attached mtd6 (name "nand0.root1", size 68 MiB)
[    2.505785] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    2.512780] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    2.519657] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    2.526640] ubi0: good PEBs: 544, bad PEBs: 0, corrupted PEBs: 0
[    2.532721] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
[    2.540025] ubi0: max/mean erase counter: 2/0, WL threshold: 4096, image sequence number: 666882056
[    2.549164] ubi0: available PEBs: 0, total reserved PEBs: 544, PEBs reserved for bad PEB handling: 40
[    2.558509] ubi0: background thread "ubi_bgt0d" started, PID 39
[    2.564508] ubi1: default fastmap pool size: 40
[    2.569135] ubi1: default fastmap WL pool size: 20
[    2.573950] ubi1: attaching mtd8
[    2.955640] random: crng init done
[    3.167543] ubi1: scanning is finished
[    3.190860] ubi1 error: ubi_refill_pools: no free eraseblocks
[    3.196670] ubi1 error: ubi_update_fastmap: could not find any anchor PEB
[    3.203608] ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
[    3.211299] ubi1 error: ubi_refill_pools: no free eraseblocks
[    3.217082] ubi1 error: ubi_update_fastmap: could not find any anchor PEB
[    3.223965] ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
[    3.231632] ubi1 error: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
[    3.239320] ubi1 warning: ubi_eba_atomic_leb_change: switch to read-only mode
[    3.246484] CPU: 0 PID: 1 Comm: swapper Not tainted 4.9.0-rc6 #45
[    3.255341] Hardware name: Freescale MXS (Device Tree)
[    3.260616] [<c000ed60>] (unwind_backtrace) from [<c000d0a4>] (show_stack+0x10/0x14)
[    3.268483] [<c000d0a4>] (show_stack) from [<c020d364>] (ubi_eba_atomic_leb_change+0x3c4/0x3e0)
[    3.277232] [<c020d364>] (ubi_eba_atomic_leb_change) from [<c020470c>] (ubi_update_layout_vol+0x38/0x54)
[    3.286826] [<c020470c>] (ubi_update_layout_vol) from [<c0204e00>] (ubi_change_vtbl_record+0x8c/0x110)
[    3.296247] [<c0204e00>] (ubi_change_vtbl_record) from [<c0206a60>] (ubi_resize_volume+0x158/0x2e0)
[    3.305406] [<c0206a60>] (ubi_resize_volume) from [<c02079f4>] (autoresize+0x68/0x130)
[    3.313437] [<c02079f4>] (autoresize) from [<c0208518>] (ubi_attach_mtd_dev+0x4c4/0xd54)
[    3.321641] [<c0208518>] (ubi_attach_mtd_dev) from [<c0452828>] (ubi_init+0x1bc/0x25c)
[    3.329688] [<c0452828>] (ubi_init) from [<c0009594>] (do_one_initcall+0x3c/0x17c)
[    3.337306] [<c0009594>] (do_one_initcall) from [<c0440cf0>] (kernel_init_freeable+0x108/0x1d0)
[    3.346123] [<c0440cf0>] (kernel_init_freeable) from [<c0345a98>] (kernel_init+0x8/0xf8)
[    3.354331] [<c0345a98>] (kernel_init) from [<c000a2d0>] (ret_from_fork+0x14/0x24)
[    3.362017] ubi1 error: autoresize: cannot auto-resize volume 0
[    3.369308] UBI error: cannot attach mtd8[    3.373284] stmp3xxx-rtc 80056000.rtc: setting system clock to 1970-01-01 00:57:18 UTC (3438)
[    3.382547] usb0_vbus: disabling
[    3.386189] uart-pl011 80074000.serial: no DMA platform data
[    3.394947] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 40
[    3.482996] UBIFS (ubi0:0): recovery needed
[    3.739605] UBIFS (ubi0:0): recovery completed
[    3.744224] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "root"
[    3.751583] UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    3.761600] UBIFS (ubi0:0): FS size: 61837312 bytes (58 MiB, 487 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
[    3.772122] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
[    3.778051] UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID 79048B39-39D6-4BA2-89CF-8F2A0C699060, small LPT model
[    3.791974] VFS: Mounted root (ubifs filesystem) on device 0:14.
[    3.801380] devtmpfs: mounted
[    3.805096] Freeing unused kernel memory: 144K (c0440000 - c0464000)
[    3.811571] This architecture does not have kernel memory protection.
mounting filesystems...[    4.463895] UBIFS error (pid: 44): cannot open "ubi1:data", error -19done.


Should I maybe enable some DEBUG messages in the kernel?
I think I could also send you the empty data.ubi, that I flashed,
if it helps. It's only 2MiB.


Thanks,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
