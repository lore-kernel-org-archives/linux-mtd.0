Received: from p01c11o149.mxlogic.net ([208.65.144.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7T81-0007G9-PT
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 17:36:35 +0000
From: Akshay Bhat <abhat@lutron.com>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 16 Jul 2014 13:31:33 -0400
Subject: RE: UBIFS Panic
Message-ID: <CE1A3161FE28A24FA02F0C9A95F25FA3AEA99BB6F0@MB003.cb.intra.lutron.com>
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
 <53B15F8E.3030309@lutron.com>
 <CAFLxGvzQpaLvLda8dXdVzvc00EYc9TpsLjJhsCjEBy28RsL=_w@mail.gmail.com>
 <53B19D09.2000007@lutron.com> <53B20A42.6020008@huawei.com>
 <53B267E6.7060708@nod.at> <53B2C321.4050407@lutron.com>
 <53B2C682.7080605@nod.at> <53B2C9BA.2090507@lutron.com>
 <53B2CC06.3000205@nod.at>
 <53BF07E4.4010302@lutron.com>,<53C04D02.9080002@nod.at>
In-Reply-To: <53C04D02.9080002@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>>
>> Hi Richard, wanted to check if you got a chance to dig into this? Thanks=
.

> Can you please rerun with the attached patch applied?
> Maybe it can give use a hint. :)

I ran the tests with the patch, below is the dmesg log (note: the first ker=
nel panic resulted in the log running over since I wasn't around, so I had =
to reboot and re-run the test to capture a new panic).

# dmesg
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.8.13-004-ts-armv7l (abhat@PC0008690) (gcc ve=
rsion 4.7.3 (Timesys 20130916) ) #3 SMP Tue Jul 15 16:01:55 EDT 2014
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=3D50c=
5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] Machine: Generic AM33XX (Flattened Device Tree), model: Lutr=
on Ethernet Bridge
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 65280
[    0.000000] free_area_init_node: node 0, pgdat c04a3c80, node_mem_map c0=
4f2000
[    0.000000]   Normal zone: 512 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 64768 pages, LIFO batch:15
[    0.000000] AM335X ES1.0 (neon )
[    0.000000] PERCPU: Embedded 8 pages/cpu @c06fd000 s8896 r8192 d15680 u3=
2768
[    0.000000] pcpu-alloc: s8896 r8192 d15680 u32768 alloc=3D8*4096
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Tota=
l pages: 64768
[    0.000000] Kernel command line: console=3DttyO0,115200n8 noinitrd mem=
=3D256M root=3Dubi0:rootfs rw ubi.mtd=3D11,2048 rootfstype=3Dubifs rootwait=
=3D1 ip=3Dnone quiet loglevel=3D3 panic=3D3
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 byt=
es)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes=
)
[    0.000000] __ex_table already sorted, skipping sort
[    0.000000] allocated 524288 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=3Dmemory' option if you don't wan=
t memory cgroups
[    0.000000] Memory: 255MB =3D 255MB total
[    0.000000] Memory: 253196k/253196k available, 8948k reserved, 0K highme=
m
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xd0800000 - 0xff000000   ( 744 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf800000 - 0xbfe00000   (   6 MB)
[    0.000000]       .text : 0xc0008000 - 0xc04157fc   (4150 kB)
[    0.000000]       .init : 0xc0416000 - 0xc04442c0   ( 185 kB)
[    0.000000]       .data : 0xc0446000 - 0xc04a4b40   ( 379 kB)
[    0.000000]        .bss : 0xc04a4b40 - 0xc04f1b1c   ( 308 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D1.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 int=
errupts
[    0.000000] Total of 128 interrupts on 1 active controller
[    0.000000] OMAP clockevent source: GPTIMER1 at 26000000 Hz
[    0.000000] sched_clock: 32 bits at 26MHz, resolution 38ns, wraps every =
165191ms
[    0.000000] OMAP clocksource: GPTIMER2 at 26000000 Hz
[    0.000000] Console: colour dummy device 80x30
[    0.000355] Calibrating delay loop... 545.07 BogoMIPS (lpj=3D531968)
[    0.015437] pid_max: default: 32768 minimum: 301
[    0.015667] Security Framework initialized
[    0.015762] Mount-cache hash table entries: 512
[    0.024043] Initializing cgroup subsys cpuacct
[    0.024078] Initializing cgroup subsys memory
[    0.024141] Initializing cgroup subsys blkio
[    0.024278] CPU: Testing write buffer coherency: ok
[    0.024773] CPU0: thread -1, cpu 0, socket -1, mpidr 0
[    0.024847] Setting up static identity map for 0x80273580 - 0x802735cc
[    0.026239] Brought up 1 CPUs
[    0.026263] SMP: Total of 1 processors activated (545.07 BogoMIPS).
[    0.052585] omap_hwmod: wd_timer2: _wait_target_disable failed
[    0.107753] pinctrl core: initialized pinctrl subsystem
[    0.107976] rstctl core: initialized rstctl subsystem
[    0.108461] regulator-dummy: no parameters
[    0.108950] NET: Registered protocol family 16
[    0.109807] DMA: preallocated 256 KiB pool for atomic coherent allocatio=
ns
[    0.119591] pinctrl-single 44e10800.pinmux: 142 pins at pa f9e10800 size=
 568
[    0.120352] platform 49000000.edma: alias fck already exists
[    0.120387] platform 49000000.edma: alias fck already exists
[    0.120416] platform 49000000.edma: alias fck already exists
[    0.121590] gpiochip_add: registered GPIOs 0 to 31 on device: gpio
[    0.121768] OMAP GPIO hardware version 0.1
[    0.123185] gpiochip_add: registered GPIOs 32 to 63 on device: gpio
[    0.124427] gpiochip_add: registered GPIOs 64 to 95 on device: gpio
[    0.125742] gpiochip_add: registered GPIOs 96 to 127 on device: gpio
[    0.129563] omap-gpmc 50000000.gpmc: unable to select pin group
[    0.130407] omap-gpmc 50000000.gpmc: GPMC revision 6.0
[    0.130941] omap-gpmc 50000000.gpmc: loaded OK
[    0.133390] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.135240] cpsw.0: No hwaddr in dt. Using 1c:ba:8c:9d:62:23 from efuse
[    0.135272] cpsw.1: No hwaddr in dt. Using 1c:ba:8c:9d:62:25 from efuse
[    0.143652] bio: create slab <bio-0> at 0
[    0.155361] edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine driver
[    0.158058] usbcore: registered new interface driver usbfs
[    0.158184] usbcore: registered new interface driver hub
[    0.158444] usbcore: registered new device driver usb
[    0.159413] pps_core: LinuxPPS API ver. 1 registered
[    0.159432] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.160960] Switching to clocksource gp_timer
[    0.173382] NET: Registered protocol family 2
[    0.174361] TCP established hash table entries: 2048 (order: 2, 16384 by=
tes)
[    0.174451] TCP bind hash table entries: 2048 (order: 3, 40960 bytes)
[    0.174544] TCP: Hash tables configured (established 2048 bind 2048)
[    0.174637] TCP: reno registered
[    0.174664] UDP hash table entries: 256 (order: 1, 12288 bytes)
[    0.174786] UDP-Lite hash table entries: 256 (order: 1, 12288 bytes)
[    0.175215] NET: Registered protocol family 1
[    0.175798] RPC: Registered named UNIX socket transport module.
[    0.175819] RPC: Registered udp transport module.
[    0.175834] RPC: Registered tcp transport module.
[    0.175849] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.176982] CPU PMU: probing PMU on CPU 0
[    0.177012] hw perfevents: enabled with ARMv7 Cortex-A8 PMU driver, 5 co=
unters available
[    0.177470] omap2_mbox_probe: platform not supported
[    0.181673] VFS: Disk quotas dquot_6.5.2
[    0.181906] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.182745] NFS: Registering the id_resolver key type
[    0.182837] Key type id_resolver registered
[    0.182855] Key type id_legacy registered
[    0.182954] msgmni has been set to 494
[    0.185794] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 250)
[    0.185820] io scheduler noop registered
[    0.185837] io scheduler deadline registered
[    0.185889] io scheduler cfq registered (default)
[    0.187357] ecap 48300100.ecap: unable to select pin group
[    0.188100] ehrpwm 48300200.ehrpwm: unable to select pin group
[    0.188985] ecap 48302100.ecap: unable to select pin group
[    0.189653] ehrpwm 48302200.ehrpwm: unable to select pin group
[    0.190625] ecap 48304100.ecap: unable to select pin group
[    0.191343] ehrpwm 48304200.ehrpwm: unable to select pin group
[    0.191951] pwm_test pwm_test.5: unable to request PWM
[    0.192005] pwm_test: probe of pwm_test.5 failed with error -2
[    0.192804] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.195080] 44e09000.serial: ttyO0 at MMIO 0x44e09000 (irq =3D 88) is a =
OMAP UART0
[    0.195878] console [ttyO0] enabled
[    0.196730] 48022000.serial: ttyO1 at MMIO 0x48022000 (irq =3D 89) is a =
OMAP UART1
[    0.209845] brd: module loaded
[    0.216494] loop: module loaded
[    0.218721] ONFI param page 0 valid
[    0.218744] ONFI flash detected
[    0.218772] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xaa (Micron MT=
29F2G08ABBEAH4), 256MiB, page size: 2048, OOB size: 64
[    0.218789] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
[    0.218909] 12 ofpart partitions found on MTD device omap2-nand.0
[    0.218927] Creating 12 MTD partitions on "omap2-nand.0":
[    0.218953] 0x000000000000-0x000000020000 : "SPL1"
[    0.220496] 0x000000020000-0x000000040000 : "SPL2"
[    0.221962] 0x000000040000-0x000000060000 : "SPL3"
[    0.223336] 0x000000060000-0x000000080000 : "SPL4"
[    0.224841] 0x000000080000-0x000000180000 : "U-boot"
[    0.227046] 0x000000180000-0x000000280000 : "U-boot Backup"
[    0.229270] 0x000000280000-0x0000002a0000 : "U-Boot Environment"
[    0.230794] 0x0000002a0000-0x0000007a0000 : "Kernel"
[    0.236489] 0x0000007a0000-0x000000ca0000 : "Kernel Backup"
[    0.242060] 0x000000ca0000-0x000000d20000 : "Device Tree"
[    0.243819] 0x000000d20000-0x000000da0000 : "Device Tree Backup"
[    0.245576] 0x000000da0000-0x000010000000 : "RFS"
[    0.452697] edma-dma-engine edma-dma-engine.0: allocated channel for 0:1=
7
[    0.452788] edma-dma-engine edma-dma-engine.0: allocated channel for 0:1=
6
[    0.454697] usbcore: registered new interface driver asix
[    0.454823] usbcore: registered new interface driver cdc_ether
[    0.454945] usbcore: registered new interface driver smsc95xx
[    0.455031] usbcore: registered new interface driver net1080
[    0.455117] usbcore: registered new interface driver cdc_subset
[    0.455275] usbcore: registered new interface driver cdc_ncm
[    0.456135] musb-hdrc: version 6.0, ?dma?, otg (peripheral+host)
[    0.456901] omap_rtc 44e3e000.rtc: rtc core: registered 44e3e000.rtc as =
rtc0
[    0.456965] 44e3e000.rtc: already running
[    0.457245] i2c /dev entries driver
[    0.457585] pps_ldisc: PPS line discipline registered
[    0.458707] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout 60 s=
ec
[    0.459040] cpuidle: using governor ladder
[    0.459061] cpuidle: using governor menu
[    0.459257] ledtrig-cpu: registered to indicate activity on CPUs
[    0.459662] edma-dma-engine edma-dma-engine.0: allocated channel for 0:3=
6
[    0.459735] omap-sham 53100000.sham: hw accel on OMAP rev 4.3
[    0.461924] omap-aes 53500000.aes: OMAP AES hw accel rev: 3.2
[    0.462053] edma-dma-engine edma-dma-engine.0: allocated channel for 0:5
[    0.462134] edma-dma-engine edma-dma-engine.0: allocated channel for 0:6
[    0.464080] TCP: cubic registered
[    0.464100] Initializing XFRM netlink socket
[    0.464146] NET: Registered protocol family 17
[    0.464226] NET: Registered protocol family 15
[    0.464364] Key type dns_resolver registered
[    0.464594] VFP support v0.3: implementor 41 architecture 3 part 30 vari=
ant c rev 3
[    0.464630] ThumbEE CPU extension supported.
[    0.464673] Registering SWP/SWPB emulation handler
[    0.465335] registered taskstats version 1
[    0.466851] UBI: default fastmap pool size: 95
[    0.466872] UBI: default fastmap WL pool size: 25
[    0.466889] UBI: attaching mtd11 to ubi0
[    1.683659] UBI: scanning is finished
[    1.696028] UBI: attached mtd11 (name "RFS", size 242 MiB) to ubi0
[    1.696054] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 byte=
s
[    1.696072] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
[    1.696089] UBI: VID header offset: 2048 (aligned 2048), data offset: 40=
96
[    1.696105] UBI: good PEBs: 1939, bad PEBs: 0, corrupted PEBs: 0
[    1.696122] UBI: user volume: 6, internal volumes: 1, max. volumes count=
: 128
[    1.696143] UBI: max/mean erase counter: 159/97, WL threshold: 64, image=
 sequence number: 1213918928
[    1.696160] UBI: available PEBs: 0, total reserved PEBs: 1939, PEBs rese=
rved for bad PEB handling: 40
[    1.710847] UBI: background thread "ubi_bgt0d" started, PID 54
[    1.710955] UBI error: get_peb_for_wl: WL pool is empty!
[    1.745110] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6
[    1.745137] davinci_mdio 4a101000.mdio: detected phy mask fffffffe
[    1.746108] libphy: 4a101000.mdio: probed
[    1.746140] davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00,=
 driver unknown
[    1.746340] Detected MACID =3D 1c:ba:8c:9d:62:23
[    1.746444] cpsw 4a100000.ethernet: NAPI disabled
[    1.747976] of_get_named_gpio_flags exited with status 13
[    1.748626] input: gpio-keys.6 as /devices/ocp.2/gpio-keys.6/input/input=
0
[    1.749327] omap_rtc 44e3e000.rtc: setting system clock to 2000-01-01 00=
:00:00 UTC (946684800)
[    1.774884] UBIFS: background thread "ubifs_bgt0_0" started, PID 57
[    1.826833] UBIFS: mounted UBI device 0, volume 0, name "rootfs"(null)
[    1.826864] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit =
sizes: 2048 bytes/2048 bytes
[    1.826888] UBIFS: FS size: 103485440 bytes (98 MiB, 815 LEBs), journal =
size 9023488 bytes (8 MiB, 72 LEBs)
[    1.826904] UBIFS: reserved for root: 0 bytes (0 KiB)
[    1.826929] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 44CF8C71-=
DD52-400D-920E-D4385BF511A6, small LPT model
[    1.828014] VFS: Mounted root (ubifs filesystem) on device 0:11.
[    1.828413] Freeing init memory: 184K
[    2.459362] UBIFS: background thread "ubifs_bgt0_4" started, PID 74
[    2.478501] UBIFS: recovery needed
[    2.689992] UBIFS: recovery completed
[    2.690225] UBIFS: mounted UBI device 0, volume 4, name "logging"(null)
[    2.690248] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit =
sizes: 2048 bytes/2048 bytes
[    2.690270] UBIFS: FS size: 6094848 bytes (5 MiB, 48 LEBs), journal size=
 1015809 bytes (0 MiB, 6 LEBs)
[    2.690286] UBIFS: reserved for root: 287874 bytes (281 KiB)
[    2.690311] UBIFS: media format: w4/r0 (latest is w4/r0), UUID C61E74EF-=
7167-4498-B4F4-493D82776AF3, small LPT model
[    2.733136] UBIFS: background thread "ubifs_bgt0_2" started, PID 76
[    2.757661] UBIFS: recovery needed
[    3.180476] UBIFS: recovery completed
[    3.180794] UBIFS: mounted UBI device 0, volume 2, name "database"(null)
[    3.180817] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit =
sizes: 2048 bytes/2048 bytes
[    3.180839] UBIFS: FS size: 6094848 bytes (5 MiB, 48 LEBs), journal size=
 1015809 bytes (0 MiB, 6 LEBs)
[    3.180855] UBIFS: reserved for root: 287874 bytes (281 KiB)
[    3.180881] UBIFS: media format: w4/r0 (latest is w4/r0), UUID EBDF7BE1-=
E887-40A6-9CE3-AC4DBCE47745, small LPT model
[    5.496941] net eth0: initializing cpsw version 1.12 (0)
[    5.499227] net eth0: phy found : id is : 0x221560
[    5.499261] libphy: PHY 4a101000.mdio:01 not found
[    5.499283] net eth0: phy 4a101000.mdio:01 not found on slave 1
[    6.073996] NET: Registered protocol family 10
[    6.078839] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[    7.505536] libphy: 4a101000.mdio:00 - Link is Up - 100/Full
[    7.505601] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  985.959083] UBI error: get_peb_for_wl: WL pool is empty!
[ 1003.199570] UBI error: get_peb_for_wl: WL pool is empty!
[ 1036.210666] UBI error: get_peb_for_wl: WL pool is empty!
[ 1054.821942] UBI error: get_peb_for_wl: WL pool is empty!
[ 1093.320619] UBI error: get_peb_for_wl: WL pool is empty!
[ 1121.904358] UBI error: get_peb_for_wl: WL pool is empty!
[ 1214.922847] UBI error: get_peb_for_wl: WL pool is empty!
[ 1255.932050] UBI error: get_peb_for_wl: WL pool is empty!
[ 1288.346109] UBI error: get_peb_for_wl: WL pool is empty!
[ 1314.810886] UBI error: get_peb_for_wl: WL pool is empty!
[ 1324.222522] UBI error: get_peb_for_wl: WL pool is empty!
[ 1409.435290] UBI error: get_peb_for_wl: WL pool is empty!
[ 1443.234302] UBI error: get_peb_for_wl: WL pool is empty!
[ 1461.921623] UBI error: get_peb_for_wl: WL pool is empty!
[ 1508.373858] UBI error: get_peb_for_wl: WL pool is empty!
[ 1520.062908] UBI error: get_peb_for_wl: WL pool is empty!
[ 1531.391419] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1531.533398] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1531.880750] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1532.280971] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1532.637379] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1533.006858] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1533.377138] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1533.720499] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1534.102098] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1534.463482] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1534.836984] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1535.189263] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1535.559109] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1535.931087] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1536.290380] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1536.650297] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1537.106535] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1537.121018] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1537.627255] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1539.003036] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1539.204165] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1539.411251] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1539.656223] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1539.795953] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1540.053808] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1540.335017] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1540.809342] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1541.249917] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1541.512227] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1541.879117] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1542.194330] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1542.596129] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1542.954970] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1543.317284] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1543.681753] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1544.034243] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1544.404248] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1544.761860] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1544.968691] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1545.337708] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1545.875617] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1546.151633] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1546.304892] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1546.459485] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1546.618697] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1546.845616] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1546.993368] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1547.168828] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1547.325286] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1547.491399] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1547.844732] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1548.366688] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1548.715912] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1549.030371] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1549.366938] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1549.678733] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1550.190265] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1550.388567] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1550.752373] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1551.105251] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1551.470484] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1551.831356] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1552.195188] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1552.505822] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1552.912960] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1553.281028] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1553.495567] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1553.712645] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1553.909300] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1554.109519] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1554.372473] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1554.480515] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1554.777829] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1554.885781] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1555.130785] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1555.312802] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1555.541779] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1555.861228] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1556.154005] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1556.488280] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1556.833147] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1557.355272] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1557.688029] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1557.992720] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1558.323269] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1558.657243] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.178866] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.537006] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.572526] UBI error: get_peb_for_wl: WL pool is empty!
[ 1559.572593] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.572708] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.578182] UBI error: get_peb_for_wl: WL pool is empty!
[ 1559.578246] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.584656] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.589583] UBI error: get_peb_for_wl: WL pool is empty!
[ 1559.589646] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.589765] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.728270] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.875135] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.904174] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1559.911222] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.082067] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.082140] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.090233] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.090297] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.092849] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.092907] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.093030] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.100330] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.100387] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.104935] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.104987] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.105103] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.109683] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.109740] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.207529] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.287510] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.288633] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.291605] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.291668] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.463373] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.508987] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.509061] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.510458] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.510502] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.510610] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.516025] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.516091] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.518365] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.525751] UBI error: get_peb_for_wl: WL pool is empty!
[ 1560.525825] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.648892] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.786797] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1560.828216] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.002383] UBI error: get_peb_for_wl: WL pool is empty!
[ 1561.002458] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.005317] UBI error: get_peb_for_wl: WL pool is empty!
[ 1561.005374] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.007267] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.028342] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.104100] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.206861] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.377667] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.404110] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.420765] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.582438] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.721016] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.764390] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.836516] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1561.867453] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1562.266052] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1562.449091] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1562.604589] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1562.820018] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1562.927094] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1563.145924] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1563.290279] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1563.525201] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1563.700422] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1563.738667] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1563.760820] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1563.903381] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.081820] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.088477] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.263451] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.282318] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.393783] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.458506] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.689287] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.760210] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.784221] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1564.888638] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.070054] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.093654] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.261488] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.277811] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.399477] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.443987] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.616996] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.730463] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.738395] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.746952] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.805743] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.810076] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1565.980949] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1566.036032] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1566.165815] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1566.167779] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1566.181500] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1566.218603] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1566.982974] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1567.114776] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1567.605403] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1568.008874] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1568.337114] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1568.636018] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1569.151240] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1569.547332] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1569.764730] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1569.911190] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1570.161940] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1570.311715] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1570.552132] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1570.696319] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1570.948349] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1570.956860] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.075746] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.085176] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.149690] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.163941] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.180767] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.216362] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.329202] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.338966] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.367128] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.367159] UBI error: ubi_wl_get_peb: User WL pool is empty!
[ 1571.367182] UBIFS error (pid 792): ubifs_leb_map: mapping LEB 35 failed,=
 error -28
[ 1571.367201] UBIFS warning (pid 792): ubifs_ro_mode: switched to read-onl=
y mode, error -28
[ 1571.367269] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c00ff329>] (=
ubifs_leb_map+0x7d/0xb4)
[ 1571.367306] [<c00ff329>] (ubifs_leb_map+0x7d/0xb4) from [<c01051e7>] (ub=
ifs_add_bud_to_log+0x1bf/0x214)
[ 1571.367339] [<c01051e7>] (ubifs_add_bud_to_log+0x1bf/0x214) from [<c00f7=
605>] (make_reservation+0x12d/0x274)
[ 1571.367372] [<c00f7605>] (make_reservation+0x12d/0x274) from [<c00f7e73>=
] (ubifs_jnl_write_inode+0x57/0x138)
[ 1571.367404] [<c00f7e73>] (ubifs_jnl_write_inode+0x57/0x138) from [<c00fc=
22d>] (ubifs_write_inode+0x69/0xcc)
[ 1571.367435] [<c00fc22d>] (ubifs_write_inode+0x69/0xcc) from [<c00f9b95>]=
 (ubifs_writepage+0x11d/0x140)
[ 1571.367476] [<c00f9b95>] (ubifs_writepage+0x11d/0x140) from [<c0077117>]=
 (__writepage+0xb/0x26)
[ 1571.367510] [<c0077117>] (__writepage+0xb/0x26) from [<c0077413>] (write=
_cache_pages+0x151/0x1e8)
[ 1571.367543] [<c0077413>] (write_cache_pages+0x151/0x1e8) from [<c00774cb=
>] (generic_writepages+0x21/0x36)
[ 1571.367576] [<c00774cb>] (generic_writepages+0x21/0x36) from [<c0072fc3>=
] (__filemap_fdatawrite_range+0x3b/0x42)
[ 1571.367607] [<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42) from [<c=
0073049>] (filemap_write_and_wait_range+0x21/0x4a)
[ 1571.367638] [<c0073049>] (filemap_write_and_wait_range+0x21/0x4a) from [=
<c00f9be1>] (ubifs_fsync+0x29/0x6c)
[ 1571.367671] [<c00f9be1>] (ubifs_fsync+0x29/0x6c) from [<c00abb23>] (vfs_=
fsync_range+0x1b/0x24)
[ 1571.367701] [<c00abb23>] (vfs_fsync_range+0x1b/0x24) from [<c00abb95>] (=
generic_write_sync+0x4d/0x54)
[ 1571.367731] [<c00abb95>] (generic_write_sync+0x4d/0x54) from [<c00734d5>=
] (generic_file_aio_write+0x71/0x8a)
[ 1571.367762] [<c00734d5>] (generic_file_aio_write+0x71/0x8a) from [<c00f9=
1ab>] (ubifs_aio_write+0xff/0x10c)
[ 1571.367805] [<c00f91ab>] (ubifs_aio_write+0xff/0x10c) from [<c0093ef5>] =
(do_sync_write+0x61/0x8c)
[ 1571.367840] [<c0093ef5>] (do_sync_write+0x61/0x8c) from [<c0094397>] (vf=
s_write+0x5f/0x100)
[ 1571.367871] [<c0094397>] (vfs_write+0x5f/0x100) from [<c00945a3>] (sys_w=
rite+0x27/0x44)
[ 1571.367911] [<c00945a3>] (sys_write+0x27/0x44) from [<c000c681>] (ret_fa=
st_syscall+0x1/0x46)
[ 1571.367945] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c00ff32d>] (=
ubifs_leb_map+0x81/0xb4)
[ 1571.367975] [<c00ff32d>] (ubifs_leb_map+0x81/0xb4) from [<c01051e7>] (ub=
ifs_add_bud_to_log+0x1bf/0x214)
[ 1571.368006] [<c01051e7>] (ubifs_add_bud_to_log+0x1bf/0x214) from [<c00f7=
605>] (make_reservation+0x12d/0x274)
[ 1571.368037] [<c00f7605>] (make_reservation+0x12d/0x274) from [<c00f7e73>=
] (ubifs_jnl_write_inode+0x57/0x138)
[ 1571.368069] [<c00f7e73>] (ubifs_jnl_write_inode+0x57/0x138) from [<c00fc=
22d>] (ubifs_write_inode+0x69/0xcc)
[ 1571.368209] [<c00fc22d>] (ubifs_write_inode+0x69/0xcc) from [<c00f9b95>]=
 (ubifs_writepage+0x11d/0x140)
[ 1571.368245] [<c00f9b95>] (ubifs_writepage+0x11d/0x140) from [<c0077117>]=
 (__writepage+0xb/0x26)
[ 1571.368277] [<c0077117>] (__writepage+0xb/0x26) from [<c0077413>] (write=
_cache_pages+0x151/0x1e8)
[ 1571.368310] [<c0077413>] (write_cache_pages+0x151/0x1e8) from [<c00774cb=
>] (generic_writepages+0x21/0x36)
[ 1571.368341] [<c00774cb>] (generic_writepages+0x21/0x36) from [<c0072fc3>=
] (__filemap_fdatawrite_range+0x3b/0x42)
[ 1571.368371] [<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42) from [<c=
0073049>] (filemap_write_and_wait_range+0x21/0x4a)
[ 1571.368402] [<c0073049>] (filemap_write_and_wait_range+0x21/0x4a) from [=
<c00f9be1>] (ubifs_fsync+0x29/0x6c)
[ 1571.368433] [<c00f9be1>] (ubifs_fsync+0x29/0x6c) from [<c00abb23>] (vfs_=
fsync_range+0x1b/0x24)
[ 1571.368462] [<c00abb23>] (vfs_fsync_range+0x1b/0x24) from [<c00abb95>] (=
generic_write_sync+0x4d/0x54)
[ 1571.368491] [<c00abb95>] (generic_write_sync+0x4d/0x54) from [<c00734d5>=
] (generic_file_aio_write+0x71/0x8a)
[ 1571.368522] [<c00734d5>] (generic_file_aio_write+0x71/0x8a) from [<c00f9=
1ab>] (ubifs_aio_write+0xff/0x10c)
[ 1571.368554] [<c00f91ab>] (ubifs_aio_write+0xff/0x10c) from [<c0093ef5>] =
(do_sync_write+0x61/0x8c)
[ 1571.368586] [<c0093ef5>] (do_sync_write+0x61/0x8c) from [<c0094397>] (vf=
s_write+0x5f/0x100)
[ 1571.368618] [<c0094397>] (vfs_write+0x5f/0x100) from [<c00945a3>] (sys_w=
rite+0x27/0x44)
[ 1571.368650] [<c00945a3>] (sys_write+0x27/0x44) from [<c000c681>] (ret_fa=
st_syscall+0x1/0x46)
[ 1571.372140] UBIFS error (pid 6493): make_reservation: cannot reserve 76 =
bytes in jhead 2, error -30
[ 1571.372172] UBIFS error (pid 6493): do_writepage: cannot write page 106 =
of inode 82, error -30
[ 1571.380069] UBIFS error (pid 792): do_commit: commit failed, error -30
[ 1571.380104] UBIFS error (pid 792): ubifs_write_inode: can't write inode =
81, error -30
[ 1571.454203] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 1571.454236] UBI error: ubi_wl_get_peb: User WL pool is empty!
[ 1571.454262] UBIFS error (pid 6464): ubifs_leb_write: writing 2048 bytes =
to LEB 3:0 failed, error -28
[ 1571.454282] UBIFS warning (pid 6464): ubifs_ro_mode: switched to read-on=
ly mode, error -28
[ 1571.454351] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c00ff0e7>] (=
ubifs_leb_write+0x8b/0xd8)
[ 1571.454388] [<c00ff0e7>] (ubifs_leb_write+0x8b/0xd8) from [<c0105341>] (=
ubifs_log_start_commit+0x105/0x268)
[ 1571.454420] [<c0105341>] (ubifs_log_start_commit+0x105/0x268) from [<c01=
05d55>] (do_commit+0x147/0x3da)
[ 1571.454451] [<c0105d55>] (do_commit+0x147/0x3da) from [<c00f76d3>] (make=
_reservation+0x1fb/0x274)
[ 1571.454484] [<c00f76d3>] (make_reservation+0x1fb/0x274) from [<c00f7d6d>=
] (ubifs_jnl_write_data+0xf5/0x1a4)
[ 1571.454516] [<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4) from [<c00f99=
bd>] (do_writepage+0x73/0x12e)
[ 1571.454556] [<c00f99bd>] (do_writepage+0x73/0x12e) from [<c0077117>] (__=
writepage+0xb/0x26)
[ 1571.454590] [<c0077117>] (__writepage+0xb/0x26) from [<c0077413>] (write=
_cache_pages+0x151/0x1e8)
[ 1571.454623] [<c0077413>] (write_cache_pages+0x151/0x1e8) from [<c00774cb=
>] (generic_writepages+0x21/0x36)
[ 1571.454655] [<c00774cb>] (generic_writepages+0x21/0x36) from [<c0072fc3>=
] (__filemap_fdatawrite_range+0x3b/0x42)
[ 1571.454687] [<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42) from [<c=
0073049>] (filemap_write_and_wait_range+0x21/0x4a)
[ 1571.454719] [<c0073049>] (filemap_write_and_wait_range+0x21/0x4a) from [=
<c00f9be1>] (ubifs_fsync+0x29/0x6c)
[ 1571.454752] [<c00f9be1>] (ubifs_fsync+0x29/0x6c) from [<c00abb23>] (vfs_=
fsync_range+0x1b/0x24)
[ 1571.454784] [<c00abb23>] (vfs_fsync_range+0x1b/0x24) from [<c00abb95>] (=
generic_write_sync+0x4d/0x54)
[ 1571.454814] [<c00abb95>] (generic_write_sync+0x4d/0x54) from [<c00734d5>=
] (generic_file_aio_write+0x71/0x8a)
[ 1571.454846] [<c00734d5>] (generic_file_aio_write+0x71/0x8a) from [<c00f9=
1ab>] (ubifs_aio_write+0xff/0x10c)
[ 1571.454888] [<c00f91ab>] (ubifs_aio_write+0xff/0x10c) from [<c0093ef5>] =
(do_sync_write+0x61/0x8c)
[ 1571.454923] [<c0093ef5>] (do_sync_write+0x61/0x8c) from [<c0094397>] (vf=
s_write+0x5f/0x100)
[ 1571.454955] [<c0094397>] (vfs_write+0x5f/0x100) from [<c00945a3>] (sys_w=
rite+0x27/0x44)
[ 1571.454995] [<c00945a3>] (sys_write+0x27/0x44) from [<c000c681>] (ret_fa=
st_syscall+0x1/0x46)
[ 1571.455030] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c00ff0eb>] (=
ubifs_leb_write+0x8f/0xd8)
[ 1571.455063] [<c00ff0eb>] (ubifs_leb_write+0x8f/0xd8) from [<c0105341>] (=
ubifs_log_start_commit+0x105/0x268)
[ 1571.455092] [<c0105341>] (ubifs_log_start_commit+0x105/0x268) from [<c01=
05d55>] (do_commit+0x147/0x3da)
[ 1571.455122] [<c0105d55>] (do_commit+0x147/0x3da) from [<c00f76d3>] (make=
_reservation+0x1fb/0x274)
[ 1571.455154] [<c00f76d3>] (make_reservation+0x1fb/0x274) from [<c00f7d6d>=
] (ubifs_jnl_write_data+0xf5/0x1a4)
[ 1571.455185] [<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4) from [<c00f99=
bd>] (do_writepage+0x73/0x12e)
[ 1571.455217] [<c00f99bd>] (do_writepage+0x73/0x12e) from [<c0077117>] (__=
writepage+0xb/0x26)
[ 1571.455248] [<c0077117>] (__writepage+0xb/0x26) from [<c0077413>] (write=
_cache_pages+0x151/0x1e8)
[ 1571.455328] [<c0077413>] (write_cache_pages+0x151/0x1e8) from [<c00774cb=
>] (generic_writepages+0x21/0x36)
[ 1571.455363] [<c00774cb>] (generic_writepages+0x21/0x36) from [<c0072fc3>=
] (__filemap_fdatawrite_range+0x3b/0x42)
[ 1571.455394] [<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42) from [<c=
0073049>] (filemap_write_and_wait_range+0x21/0x4a)
[ 1571.455425] [<c0073049>] (filemap_write_and_wait_range+0x21/0x4a) from [=
<c00f9be1>] (ubifs_fsync+0x29/0x6c)
[ 1571.455456] [<c00f9be1>] (ubifs_fsync+0x29/0x6c) from [<c00abb23>] (vfs_=
fsync_range+0x1b/0x24)
[ 1571.455486] [<c00abb23>] (vfs_fsync_range+0x1b/0x24) from [<c00abb95>] (=
generic_write_sync+0x4d/0x54)
[ 1571.455516] [<c00abb95>] (generic_write_sync+0x4d/0x54) from [<c00734d5>=
] (generic_file_aio_write+0x71/0x8a)
[ 1571.455548] [<c00734d5>] (generic_file_aio_write+0x71/0x8a) from [<c00f9=
1ab>] (ubifs_aio_write+0xff/0x10c)
[ 1571.455581] [<c00f91ab>] (ubifs_aio_write+0xff/0x10c) from [<c0093ef5>] =
(do_sync_write+0x61/0x8c)
[ 1571.455614] [<c0093ef5>] (do_sync_write+0x61/0x8c) from [<c0094397>] (vf=
s_write+0x5f/0x100)
[ 1571.455647] [<c0094397>] (vfs_write+0x5f/0x100) from [<c00945a3>] (sys_w=
rite+0x27/0x44)
[ 1571.455680] [<c00945a3>] (sys_write+0x27/0x44) from [<c000c681>] (ret_fa=
st_syscall+0x1/0x46)
[ 1571.455703] UBIFS error (pid 6464): do_commit: commit failed, error -28
[ 1571.455729] UBIFS error (pid 6464): do_writepage: cannot write page 435 =
of inode 71, error -28
[ 1598.409896] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1598.409987] UBIFS error (pid 324): do_writepage: cannot write page 508 o=
f inode 71, error -30
[ 1603.409961] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1603.409997] UBIFS error (pid 324): do_writepage: cannot write page 509 o=
f inode 71, error -30
[ 1603.410087] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1603.410112] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1603.410536] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1603.410559] UBIFS error (pid 324): do_writepage: cannot write page 510 o=
f inode 71, error -30
[ 1603.411004] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1603.411028] UBIFS error (pid 324): do_writepage: cannot write page 511 o=
f inode 71, error -30
[ 1603.876156] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1603.876191] UBIFS error (pid 529): do_writepage: cannot write page 107 o=
f inode 82, error -30
[ 1608.411246] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1608.411282] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1608.411902] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1608.411930] UBIFS error (pid 324): do_writepage: cannot write page 436 o=
f inode 71, error -30
[ 1608.412470] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1608.412495] UBIFS error (pid 324): do_writepage: cannot write page 437 o=
f inode 71, error -30
[ 1613.411827] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1613.411864] UBIFS error (pid 324): do_writepage: cannot write page 438 o=
f inode 71, error -30
[ 1613.412000] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1613.412024] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1613.412416] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1613.412441] UBIFS error (pid 324): do_writepage: cannot write page 439 o=
f inode 71, error -30
[ 1618.411910] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1618.411946] UBIFS error (pid 324): do_writepage: cannot write page 440 o=
f inode 71, error -30
[ 1618.412028] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1618.412051] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1618.412432] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1618.412457] UBIFS error (pid 324): do_writepage: cannot write page 441 o=
f inode 71, error -30
[ 1623.411873] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1623.411910] UBIFS error (pid 324): do_writepage: cannot write page 442 o=
f inode 71, error -30
[ 1623.411994] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1623.412017] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1623.412405] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1623.412429] UBIFS error (pid 324): do_writepage: cannot write page 443 o=
f inode 71, error -30
[ 1628.411872] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1628.411909] UBIFS error (pid 324): do_writepage: cannot write page 444 o=
f inode 71, error -30
[ 1628.412002] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1628.412024] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1628.412416] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1628.412440] UBIFS error (pid 324): do_writepage: cannot write page 445 o=
f inode 71, error -30
[ 1633.411856] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1633.411894] UBIFS error (pid 324): do_writepage: cannot write page 446 o=
f inode 71, error -30
[ 1633.412003] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1633.412027] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1633.412403] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1633.412492] UBIFS error (pid 324): do_writepage: cannot write page 447 o=
f inode 71, error -30
[ 1633.412961] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1633.413086] UBIFS error (pid 324): do_writepage: cannot write page 448 o=
f inode 71, error -30
[ 1633.876152] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1633.876188] UBIFS error (pid 529): do_writepage: cannot write page 108 o=
f inode 82, error -30
[ 1638.413166] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1638.413201] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1638.413838] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1638.413868] UBIFS error (pid 324): do_writepage: cannot write page 449 o=
f inode 71, error -30
[ 1638.414416] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1638.414442] UBIFS error (pid 324): do_writepage: cannot write page 450 o=
f inode 71, error -30
[ 1643.413768] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1643.413806] UBIFS error (pid 324): do_writepage: cannot write page 451 o=
f inode 71, error -30
[ 1643.413891] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1643.413915] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1643.414411] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1643.414436] UBIFS error (pid 324): do_writepage: cannot write page 452 o=
f inode 71, error -30
[ 1648.413841] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1648.413881] UBIFS error (pid 324): do_writepage: cannot write page 453 o=
f inode 71, error -30
[ 1648.413965] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1648.413988] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1648.414542] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1648.414568] UBIFS error (pid 324): do_writepage: cannot write page 454 o=
f inode 71, error -30
[ 1653.413879] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1653.413917] UBIFS error (pid 324): do_writepage: cannot write page 455 o=
f inode 71, error -30
[ 1653.414004] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1653.414028] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1653.414472] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1653.414496] UBIFS error (pid 324): do_writepage: cannot write page 456 o=
f inode 71, error -30
[ 1658.413832] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1658.413870] UBIFS error (pid 324): do_writepage: cannot write page 457 o=
f inode 71, error -30
[ 1658.413961] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1658.413984] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1658.414561] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1658.414588] UBIFS error (pid 324): do_writepage: cannot write page 458 o=
f inode 71, error -30
[ 1663.413793] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1663.413831] UBIFS error (pid 324): do_writepage: cannot write page 459 o=
f inode 71, error -30
[ 1663.413926] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1663.414002] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1663.414414] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1663.414437] UBIFS error (pid 324): do_writepage: cannot write page 460 o=
f inode 71, error -30
[ 1663.414829] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1663.414852] UBIFS error (pid 324): do_writepage: cannot write page 461 o=
f inode 71, error -30
[ 1663.876181] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1663.876215] UBIFS error (pid 529): do_writepage: cannot write page 109 o=
f inode 82, error -30
[ 1668.413789] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1668.413826] UBIFS error (pid 324): do_writepage: cannot write page 462 o=
f inode 71, error -30
[ 1668.413919] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1668.413941] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1668.414487] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1668.414512] UBIFS error (pid 324): do_writepage: cannot write page 463 o=
f inode 71, error -30
[ 1673.413819] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1673.413856] UBIFS error (pid 324): do_writepage: cannot write page 464 o=
f inode 71, error -30
[ 1673.413936] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1673.413959] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1673.414358] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1673.414382] UBIFS error (pid 324): do_writepage: cannot write page 465 o=
f inode 71, error -30
[ 1678.413863] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1678.413900] UBIFS error (pid 324): do_writepage: cannot write page 466 o=
f inode 71, error -30
[ 1678.413989] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1678.414012] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1678.414413] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1678.414437] UBIFS error (pid 324): do_writepage: cannot write page 467 o=
f inode 71, error -30
[ 1683.413771] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1683.413810] UBIFS error (pid 324): do_writepage: cannot write page 468 o=
f inode 71, error -30
[ 1683.413883] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1683.413905] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1683.414358] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1683.414383] UBIFS error (pid 324): do_writepage: cannot write page 469 o=
f inode 71, error -30
[ 1688.413806] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1688.413844] UBIFS error (pid 324): do_writepage: cannot write page 470 o=
f inode 71, error -30
[ 1688.413934] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1688.413957] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1688.414344] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1688.414368] UBIFS error (pid 324): do_writepage: cannot write page 471 o=
f inode 71, error -30
[ 1693.413834] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1693.413871] UBIFS error (pid 324): do_writepage: cannot write page 472 o=
f inode 71, error -30
[ 1693.413975] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1693.413999] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1693.414377] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1693.414400] UBIFS error (pid 324): do_writepage: cannot write page 473 o=
f inode 71, error -30
[ 1693.414783] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1693.414806] UBIFS error (pid 324): do_writepage: cannot write page 474 o=
f inode 71, error -30
[ 1693.876184] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1693.876219] UBIFS error (pid 529): do_writepage: cannot write page 110 o=
f inode 82, error -30
[ 1698.413810] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1698.413847] UBIFS error (pid 324): do_writepage: cannot write page 475 o=
f inode 71, error -30
[ 1703.413758] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1703.413797] UBIFS error (pid 324): do_writepage: cannot write page 476 o=
f inode 71, error -30
[ 1703.413930] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1703.413955] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1703.414348] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1703.414372] UBIFS error (pid 324): do_writepage: cannot write page 477 o=
f inode 71, error -30
[ 1708.413850] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1708.413887] UBIFS error (pid 324): do_writepage: cannot write page 478 o=
f inode 71, error -30
[ 1708.413979] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1708.414001] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1708.414393] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1708.414417] UBIFS error (pid 324): do_writepage: cannot write page 479 o=
f inode 71, error -30
[ 1713.413807] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1713.413845] UBIFS error (pid 324): do_writepage: cannot write page 480 o=
f inode 71, error -30
[ 1713.413916] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1713.413938] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1713.414324] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1713.414347] UBIFS error (pid 324): do_writepage: cannot write page 481 o=
f inode 71, error -30
[ 1718.413867] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1718.413904] UBIFS error (pid 324): do_writepage: cannot write page 482 o=
f inode 71, error -30
[ 1718.413990] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1718.414013] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1718.414402] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1718.414426] UBIFS error (pid 324): do_writepage: cannot write page 483 o=
f inode 71, error -30
[ 1723.413820] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1723.413857] UBIFS error (pid 324): do_writepage: cannot write page 484 o=
f inode 71, error -30
[ 1723.413962] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1723.413985] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1723.414391] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1723.414414] UBIFS error (pid 324): do_writepage: cannot write page 485 o=
f inode 71, error -30
[ 1723.414816] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1723.414838] UBIFS error (pid 324): do_writepage: cannot write page 486 o=
f inode 71, error -30
[ 1723.876189] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1723.876224] UBIFS error (pid 529): do_writepage: cannot write page 111 o=
f inode 82, error -30
[ 1728.413877] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1728.413914] UBIFS error (pid 324): do_writepage: cannot write page 487 o=
f inode 71, error -30
[ 1728.413997] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1728.414020] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1728.414467] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1728.414491] UBIFS error (pid 324): do_writepage: cannot write page 488 o=
f inode 71, error -30
[ 1733.413852] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1733.413889] UBIFS error (pid 324): do_writepage: cannot write page 489 o=
f inode 71, error -30
[ 1733.413967] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1733.413989] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1733.414487] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1733.414512] UBIFS error (pid 324): do_writepage: cannot write page 490 o=
f inode 71, error -30
[ 1738.413808] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1738.413846] UBIFS error (pid 324): do_writepage: cannot write page 491 o=
f inode 71, error -30
[ 1738.413989] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1738.414013] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1738.414445] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1738.414469] UBIFS error (pid 324): do_writepage: cannot write page 492 o=
f inode 71, error -30
[ 1743.413775] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1743.413815] UBIFS error (pid 324): do_writepage: cannot write page 493 o=
f inode 71, error -30
[ 1743.413901] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1743.413923] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1743.414474] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1743.414499] UBIFS error (pid 324): do_writepage: cannot write page 494 o=
f inode 71, error -30
[ 1748.413860] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1748.413897] UBIFS error (pid 324): do_writepage: cannot write page 495 o=
f inode 71, error -30
[ 1748.413976] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1748.413998] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1748.414393] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1748.414418] UBIFS error (pid 324): do_writepage: cannot write page 496 o=
f inode 71, error -30
[ 1753.413839] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1753.413876] UBIFS error (pid 324): do_writepage: cannot write page 497 o=
f inode 71, error -30
[ 1753.413979] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1753.414002] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1753.414382] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1753.414406] UBIFS error (pid 324): do_writepage: cannot write page 498 o=
f inode 71, error -30
[ 1753.414809] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1753.414833] UBIFS error (pid 324): do_writepage: cannot write page 499 o=
f inode 71, error -30
[ 1753.876220] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1753.876255] UBIFS error (pid 529): do_writepage: cannot write page 112 o=
f inode 82, error -30
[ 1758.413756] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1758.413793] UBIFS error (pid 324): do_writepage: cannot write page 500 o=
f inode 71, error -30
[ 1758.413866] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1758.413889] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1758.414419] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1758.414445] UBIFS error (pid 324): do_writepage: cannot write page 501 o=
f inode 71, error -30
[ 1763.413831] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1763.413868] UBIFS error (pid 324): do_writepage: cannot write page 502 o=
f inode 71, error -30
[ 1763.413959] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1763.413982] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1763.414373] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1763.414397] UBIFS error (pid 324): do_writepage: cannot write page 503 o=
f inode 71, error -30
[ 1768.413821] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1768.413858] UBIFS error (pid 324): do_writepage: cannot write page 504 o=
f inode 71, error -30
[ 1768.413935] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1768.413958] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1768.414352] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1768.414376] UBIFS error (pid 324): do_writepage: cannot write page 505 o=
f inode 71, error -30
[ 1773.413814] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1773.413850] UBIFS error (pid 324): do_writepage: cannot write page 506 o=
f inode 71, error -30
[ 1773.413937] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1773.413960] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1773.414345] UBIFS error (pid 324): make_reservation: cannot reserve 4144=
 bytes in jhead 2, error -30
[ 1773.414369] UBIFS error (pid 324): do_writepage: cannot write page 507 o=
f inode 71, error -30
[ 1783.876195] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1783.876230] UBIFS error (pid 529): do_writepage: cannot write page 113 o=
f inode 82, error -30
[ 1803.422949] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1803.422985] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1813.876257] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1813.876291] UBIFS error (pid 529): do_writepage: cannot write page 114 o=
f inode 82, error -30
[ 1833.438582] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1833.438617] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1843.876181] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1843.876216] UBIFS error (pid 529): do_writepage: cannot write page 115 o=
f inode 82, error -30
[ 1863.454188] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1863.454223] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1873.876173] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1873.876209] UBIFS error (pid 529): do_writepage: cannot write page 116 o=
f inode 82, error -30
[ 1893.469808] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1893.469842] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1903.876160] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1903.876194] UBIFS error (pid 529): do_writepage: cannot write page 117 o=
f inode 82, error -30
[ 1923.485482] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1923.485518] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1933.876180] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1933.876216] UBIFS error (pid 529): do_writepage: cannot write page 118 o=
f inode 82, error -30
[ 1953.501084] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1953.501120] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
[ 1963.876133] UBIFS error (pid 529): make_reservation: cannot reserve 76 b=
ytes in jhead 2, error -30
[ 1963.876168] UBIFS error (pid 529): do_writepage: cannot write page 119 o=
f inode 82, error -30
[ 1983.516694] UBIFS error (pid 324): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[ 1983.516730] UBIFS error (pid 324): ubifs_write_inode: can't write inode =
73, error -30
