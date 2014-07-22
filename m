Received: from p02c12o144.mxlogic.net ([208.65.145.77])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9eyg-0004Z4-4E
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 18:39:58 +0000
Message-ID: <53CEAFC4.10108@lutron.com>
Date: Tue, 22 Jul 2014 14:39:00 -0400
From: Akshay Bhat <abhat@lutron.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
 <53B15F8E.3030309@lutron.com>
 <CAFLxGvzQpaLvLda8dXdVzvc00EYc9TpsLjJhsCjEBy28RsL=_w@mail.gmail.com>
 <53B19D09.2000007@lutron.com> <53B20A42.6020008@huawei.com>
 <53B267E6.7060708@nod.at> <53B2C321.4050407@lutron.com>
 <53B2C682.7080605@nod.at> <53B2C9BA.2090507@lutron.com>
 <53B2CC06.3000205@nod.at> <53BF07E4.4010302@lutron.com>
 <53C04D02.9080002@nod.at>
 <CE1A3161FE28A24FA02F0C9A95F25FA3AEA99BB6F0@MB003.cb.intra.lutron.com>
 <53C6E800.1030409@nod.at>
In-Reply-To: <53C6E800.1030409@nod.at>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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



On Wed 16 Jul 2014 05:00:48 PM EDT, Richard Weinberger wrote:
> Akshay,
>
> Am 16.07.2014 19:31, schrieb Akshay Bhat:
>>
>>>>
>>>> Hi Richard, wanted to check if you got a chance to dig into this? Thanks.
>>
>>> Can you please rerun with the attached patch applied?
>>> Maybe it can give use a hint. :)
>>
>> I ran the tests with the patch, below is the dmesg log (note: the first kernel panic resulted in the log running over since I wasn't around, so I had to reboot and re-run the test to capture a new panic).
>
> Thanks a lot for the log!
>
>> # dmesg
>> [ 1571.338966] UBI error: refill_wl_pool: didn't get all pebs I wanted!
>> [ 1571.367128] UBI error: refill_wl_pool: didn't get all pebs I wanted!
>> [ 1571.367159] UBI error: ubi_wl_get_peb: User WL pool is empty!
>
> This is interesting.
> Looks like a race in ubi_wl_get_peb(), two threads enter the function and the pool needs refilling.
> While T1 triggers a ubi_refill_pools(), T2 goes immediately to " if (!pool->size) {" this triggers
> as T1 resets pool->size to 0 while refilling.
>
> Please test the updated debug patch.

Still see an error:

# dmesg
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.8.13-004-ts-armv7l (abhat@PC0008690) 
(gcc version 4.7.3 (Timesys 20130916) ) #4 SMP Thu Jul 17 14:37:18 EDT 
2014
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), 
cr=50c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing 
instruction cache
[    0.000000] Machine: Generic AM33XX (Flattened Device Tree), model: 
Lutron Ethernet Bridge
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 65280
[    0.000000] free_area_init_node: node 0, pgdat c04a3c80, 
node_mem_map c04f2000
[    0.000000]   Normal zone: 512 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 64768 pages, LIFO batch:15
[    0.000000] AM335X ES1.0 (neon )
[    0.000000] PERCPU: Embedded 8 pages/cpu @c06fd000 s8896 r8192 
d15680 u32768
[    0.000000] pcpu-alloc: s8896 r8192 d15680 u32768 alloc=8*4096
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  
Total pages: 64768
[    0.000000] Kernel command line: console=ttyO0,115200n8 noinitrd 
mem=256M root=ubi0:rootfs rw ubi.mtd=11,2048 rootfstype=ubifs 
rootwait=1 ip=none quiet loglevel=3 panic=3
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 
bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 
bytes)
[    0.000000] __ex_table already sorted, skipping sort
[    0.000000] allocated 524288 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=memory' option if you don't 
want memory cgroups
[    0.000000] Memory: 255MB = 255MB total
[    0.000000] Memory: 253196k/253196k available, 8948k reserved, 0K 
highmem
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
[    0.000000]  RCU restricting CPUs from NR_CPUS=4 to nr_cpu_ids=1.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 
interrupts
[    0.000000] Total of 128 interrupts on 1 active controller
[    0.000000] OMAP clockevent source: GPTIMER1 at 26000000 Hz
[    0.000000] sched_clock: 32 bits at 26MHz, resolution 38ns, wraps 
every 165191ms
[    0.000000] OMAP clocksource: GPTIMER2 at 26000000 Hz
[    0.000000] Console: colour dummy device 80x30
[    0.000355] Calibrating delay loop... 545.07 BogoMIPS (lpj=531968)
[    0.015440] pid_max: default: 32768 minimum: 301
[    0.015669] Security Framework initialized
[    0.015764] Mount-cache hash table entries: 512
[    0.024064] Initializing cgroup subsys cpuacct
[    0.024096] Initializing cgroup subsys memory
[    0.024160] Initializing cgroup subsys blkio
[    0.024294] CPU: Testing write buffer coherency: ok
[    0.024793] CPU0: thread -1, cpu 0, socket -1, mpidr 0
[    0.024867] Setting up static identity map for 0x80273580 - 
0x802735cc
[    0.026260] Brought up 1 CPUs
[    0.026284] SMP: Total of 1 processors activated (545.07 BogoMIPS).
[    0.052593] omap_hwmod: wd_timer2: _wait_target_disable failed
[    0.107693] pinctrl core: initialized pinctrl subsystem
[    0.107916] rstctl core: initialized rstctl subsystem
[    0.108403] regulator-dummy: no parameters
[    0.108894] NET: Registered protocol family 16
[    0.109746] DMA: preallocated 256 KiB pool for atomic coherent 
allocations
[    0.119532] pinctrl-single 44e10800.pinmux: 142 pins at pa f9e10800 
size 568
[    0.120292] platform 49000000.edma: alias fck already exists
[    0.120327] platform 49000000.edma: alias fck already exists
[    0.120356] platform 49000000.edma: alias fck already exists
[    0.121530] gpiochip_add: registered GPIOs 0 to 31 on device: gpio
[    0.121706] OMAP GPIO hardware version 0.1
[    0.123120] gpiochip_add: registered GPIOs 32 to 63 on device: gpio
[    0.124370] gpiochip_add: registered GPIOs 64 to 95 on device: gpio
[    0.125686] gpiochip_add: registered GPIOs 96 to 127 on device: gpio
[    0.129500] omap-gpmc 50000000.gpmc: unable to select pin group
[    0.130346] omap-gpmc 50000000.gpmc: GPMC revision 6.0
[    0.130878] omap-gpmc 50000000.gpmc: loaded OK
[    0.133321] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.135169] cpsw.0: No hwaddr in dt. Using 1c:ba:8c:9d:55:29 from 
efuse
[    0.135201] cpsw.1: No hwaddr in dt. Using 1c:ba:8c:9d:55:2b from 
efuse
[    0.143580] bio: create slab <bio-0> at 0
[    0.155298] edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine 
driver
[    0.157950] usbcore: registered new interface driver usbfs
[    0.158123] usbcore: registered new interface driver hub
[    0.158389] usbcore: registered new device driver usb
[    0.159350] pps_core: LinuxPPS API ver. 1 registered
[    0.159370] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
[    0.160895] Switching to clocksource gp_timer
[    0.173329] NET: Registered protocol family 2
[    0.174305] TCP established hash table entries: 2048 (order: 2, 
16384 bytes)
[    0.174393] TCP bind hash table entries: 2048 (order: 3, 40960 bytes)
[    0.174485] TCP: Hash tables configured (established 2048 bind 2048)
[    0.174577] TCP: reno registered
[    0.174605] UDP hash table entries: 256 (order: 1, 12288 bytes)
[    0.174727] UDP-Lite hash table entries: 256 (order: 1, 12288 bytes)
[    0.175152] NET: Registered protocol family 1
[    0.175735] RPC: Registered named UNIX socket transport module.
[    0.175755] RPC: Registered udp transport module.
[    0.175771] RPC: Registered tcp transport module.
[    0.175786] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.176915] CPU PMU: probing PMU on CPU 0
[    0.176945] hw perfevents: enabled with ARMv7 Cortex-A8 PMU driver, 
5 counters available
[    0.177406] omap2_mbox_probe: platform not supported
[    0.181589] VFS: Disk quotas dquot_6.5.2
[    0.181819] Dquot-cache hash table entries: 1024 (order 0, 4096 
bytes)
[    0.182653] NFS: Registering the id_resolver key type
[    0.182747] Key type id_resolver registered
[    0.182765] Key type id_legacy registered
[    0.182863] msgmni has been set to 494
[    0.185706] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 250)
[    0.185731] io scheduler noop registered
[    0.185748] io scheduler deadline registered
[    0.185800] io scheduler cfq registered (default)
[    0.187267] ecap 48300100.ecap: unable to select pin group
[    0.188018] ehrpwm 48300200.ehrpwm: unable to select pin group
[    0.188891] ecap 48302100.ecap: unable to select pin group
[    0.189562] ehrpwm 48302200.ehrpwm: unable to select pin group
[    0.190538] ecap 48304100.ecap: unable to select pin group
[    0.191253] ehrpwm 48304200.ehrpwm: unable to select pin group
[    0.191865] pwm_test pwm_test.5: unable to request PWM
[    0.191919] pwm_test: probe of pwm_test.5 failed with error -2
[    0.192717] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.194993] 44e09000.serial: ttyO0 at MMIO 0x44e09000 (irq = 88) is 
a OMAP UART0
[    0.195793] console [ttyO0] enabled
[    0.196641] 48022000.serial: ttyO1 at MMIO 0x48022000 (irq = 89) is 
a OMAP UART1
[    0.209751] brd: module loaded
[    0.216399] loop: module loaded
[    0.218631] ONFI param page 0 valid
[    0.218653] ONFI flash detected
[    0.218680] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xaa 
(Micron MT29F2G08ABBEAH4), 256MiB, page size: 2048, OOB size: 64
[    0.218698] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
[    0.218816] 12 ofpart partitions found on MTD device omap2-nand.0
[    0.218835] Creating 12 MTD partitions on "omap2-nand.0":
[    0.218860] 0x000000000000-0x000000020000 : "SPL1"
[    0.220395] 0x000000020000-0x000000040000 : "SPL2"
[    0.221864] 0x000000040000-0x000000060000 : "SPL3"
[    0.223244] 0x000000060000-0x000000080000 : "SPL4"
[    0.224748] 0x000000080000-0x000000180000 : "U-boot"
[    0.226952] 0x000000180000-0x000000280000 : "U-boot Backup"
[    0.229178] 0x000000280000-0x0000002a0000 : "U-Boot Environment"
[    0.230701] 0x0000002a0000-0x0000007a0000 : "Kernel"
[    0.236392] 0x0000007a0000-0x000000ca0000 : "Kernel Backup"
[    0.241960] 0x000000ca0000-0x000000d20000 : "Device Tree"
[    0.243710] 0x000000d20000-0x000000da0000 : "Device Tree Backup"
[    0.245468] 0x000000da0000-0x000010000000 : "RFS"
[    0.452874] edma-dma-engine edma-dma-engine.0: allocated channel for 
0:17
[    0.452965] edma-dma-engine edma-dma-engine.0: allocated channel for 
0:16
[    0.454862] usbcore: registered new interface driver asix
[    0.454986] usbcore: registered new interface driver cdc_ether
[    0.455107] usbcore: registered new interface driver smsc95xx
[    0.455193] usbcore: registered new interface driver net1080
[    0.455279] usbcore: registered new interface driver cdc_subset
[    0.455437] usbcore: registered new interface driver cdc_ncm
[    0.456306] musb-hdrc: version 6.0, ?dma?, otg (peripheral+host)
[    0.457055] omap_rtc 44e3e000.rtc: rtc core: registered 44e3e000.rtc 
as rtc0
[    0.457384] i2c /dev entries driver
[    0.457727] pps_ldisc: PPS line discipline registered
[    0.458835] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout 
60 sec
[    0.459159] cpuidle: using governor ladder
[    0.459179] cpuidle: using governor menu
[    0.459378] ledtrig-cpu: registered to indicate activity on CPUs
[    0.459791] edma-dma-engine edma-dma-engine.0: allocated channel for 
0:36
[    0.459998] omap-sham 53100000.sham: hw accel on OMAP rev 4.3
[    0.462062] omap-aes 53500000.aes: OMAP AES hw accel rev: 3.2
[    0.462186] edma-dma-engine edma-dma-engine.0: allocated channel for 
0:5
[    0.462267] edma-dma-engine edma-dma-engine.0: allocated channel for 
0:6
[    0.464167] TCP: cubic registered
[    0.464189] Initializing XFRM netlink socket
[    0.464235] NET: Registered protocol family 17
[    0.464315] NET: Registered protocol family 15
[    0.464463] Key type dns_resolver registered
[    0.464699] VFP support v0.3: implementor 41 architecture 3 part 30 
variant c rev 3
[    0.464735] ThumbEE CPU extension supported.
[    0.464780] Registering SWP/SWPB emulation handler
[    0.465446] registered taskstats version 1
[    0.466886] UBI: default fastmap pool size: 95
[    0.466906] UBI: default fastmap WL pool size: 25
[    0.466923] UBI: attaching mtd11 to ubi0
[    1.683740] UBI: scanning is finished
[    1.696100] UBI: attached mtd11 (name "RFS", size 242 MiB) to ubi0
[    1.696182] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 
bytes
[    1.696202] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 
512
[    1.696219] UBI: VID header offset: 2048 (aligned 2048), data 
offset: 4096
[    1.696235] UBI: good PEBs: 1939, bad PEBs: 0, corrupted PEBs: 0
[    1.696253] UBI: user volume: 6, internal volumes: 1, max. volumes 
count: 128
[    1.696273] UBI: max/mean erase counter: 152/101, WL threshold: 64, 
image sequence number: 366298915
[    1.696291] UBI: available PEBs: 0, total reserved PEBs: 1939, PEBs 
reserved for bad PEB handling: 40
[    1.710932] UBI: background thread "ubi_bgt0d" started, PID 54
[    1.711080] UBI error: get_peb_for_wl: WL pool is empty!
[    1.745041] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6
[    1.745066] davinci_mdio 4a101000.mdio: detected phy mask fffffffe
[    1.746060] libphy: 4a101000.mdio: probed
[    1.746092] davinci_mdio 4a101000.mdio: phy[0]: device 
4a101000.mdio:00, driver unknown
[    1.746297] Detected MACID = 1c:ba:8c:9d:55:29
[    1.746405] cpsw 4a100000.ethernet: NAPI disabled
[    1.747937] of_get_named_gpio_flags exited with status 13
[    1.748583] input: gpio-keys.6 as 
/devices/ocp.2/gpio-keys.6/input/input0
[    1.749285] omap_rtc 44e3e000.rtc: setting system clock to 
2000-01-01 00:00:00 UTC (946684800)
[    1.774832] UBIFS: background thread "ubifs_bgt0_0" started, PID 57
[    1.792271] UBIFS: recovery needed
[    1.983513] UBIFS: recovery completed
[    1.983758] UBIFS: mounted UBI device 0, volume 0, name 
"rootfs"(null)
[    1.983781] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O 
unit sizes: 2048 bytes/2048 bytes
[    1.983805] UBIFS: FS size: 103485440 bytes (98 MiB, 815 LEBs), 
journal size 9023488 bytes (8 MiB, 72 LEBs)
[    1.983821] UBIFS: reserved for root: 0 bytes (0 KiB)
[    1.983846] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 
44CF8C71-DD52-400D-920E-D4385BF511A6, small LPT model
[    1.984590] VFS: Mounted root (ubifs filesystem) on device 0:11.
[    1.984988] Freeing init memory: 184K
[    2.619389] UBIFS: background thread "ubifs_bgt0_4" started, PID 74
[    2.638503] UBIFS: recovery needed
[    2.875910] UBIFS: recovery completed
[    2.876153] UBIFS: mounted UBI device 0, volume 4, name 
"logging"(null)
[    2.876175] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O 
unit sizes: 2048 bytes/2048 bytes
[    2.876197] UBIFS: FS size: 6094848 bytes (5 MiB, 48 LEBs), journal 
size 1015809 bytes (0 MiB, 6 LEBs)
[    2.876213] UBIFS: reserved for root: 287874 bytes (281 KiB)
[    2.876238] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 
D886D287-9A0B-466C-87A2-4C7F014783E3, small LPT model
[    2.916494] UBIFS: background thread "ubifs_bgt0_2" started, PID 76
[    2.927778] UBIFS: recovery needed
[    3.063093] UBIFS: recovery completed
[    3.063403] UBIFS: mounted UBI device 0, volume 2, name 
"database"(null)
[    3.063426] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O 
unit sizes: 2048 bytes/2048 bytes
[    3.063448] UBIFS: FS size: 6094848 bytes (5 MiB, 48 LEBs), journal 
size 1015809 bytes (0 MiB, 6 LEBs)
[    3.063464] UBIFS: reserved for root: 287874 bytes (281 KiB)
[    3.063490] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 
94414355-A36D-405B-A9CC-0C43B5EE2F32, small LPT model
[    5.381843] net eth0: initializing cpsw version 1.12 (0)
[    5.387460] net eth0: phy found : id is : 0x221560
[    5.387503] libphy: PHY 4a101000.mdio:01 not found
[    5.387610] net eth0: phy 4a101000.mdio:01 not found on slave 1
[    5.962950] NET: Registered protocol family 10
[    5.967845] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[    7.392197] libphy: 4a101000.mdio:00 - Link is Up - 100/Full
[    7.392264] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  226.871952] UBI error: get_peb_for_wl: WL pool is empty!
[  948.507808] UBI error: get_peb_for_wl: WL pool is empty!
[  964.267421] UBI error: get_peb_for_wl: WL pool is empty!
[ 2713.598888] UBI error: get_peb_for_wl: WL pool is empty!
[ 3163.587848] UBI: scrubbed PEB 562 (LEB 2:53), data moved to PEB 1101
[ 3169.387175] UBI error: get_peb_for_wl: WL pool is empty!
[ 3171.366744] UBI error: get_peb_for_wl: WL pool is empty!
[ 3171.850681] UBI: scrubbed PEB 542 (LEB 2:22), data moved to PEB 1926
[ 3179.179937] UBI error: get_peb_for_wl: WL pool is empty!
[ 3179.467549] UBI: scrubbed PEB 1858 (LEB 4:29), data moved to PEB 1797
[ 3181.503910] UBI error: get_peb_for_wl: WL pool is empty!
[ 3181.738543] UBI: scrubbed PEB 1933 (LEB 4:13), data moved to PEB 1925
[ 3182.681096] UBI: scrubbed PEB 544 (LEB 2:38), data moved to PEB 1176
[ 3186.414570] UBI error: get_peb_for_wl: WL pool is empty!
[ 3186.833616] UBI: scrubbed PEB 501 (LEB 4:25), data moved to PEB 1921
[ 3188.021276] UBI error: get_peb_for_wl: WL pool is empty!
[ 3188.462113] UBI: scrubbed PEB 331 (LEB 4:55), data moved to PEB 1860
[ 3189.117887] UBI: scrubbed PEB 400 (LEB 4:30), data moved to PEB 1917
[ 3189.496218] UBI error: get_peb_for_wl: WL pool is empty!
[ 3189.755589] UBI: scrubbed PEB 1890 (LEB 2:53), data moved to PEB 1840
[ 3191.326605] UBI error: get_peb_for_wl: WL pool is empty!
[ 3191.526829] UBI: scrubbed PEB 223 (LEB 4:29), data moved to PEB 1840
[ 3192.478363] UBI: scrubbed PEB 396 (LEB 4:13), data moved to PEB 1391
[ 3192.637519] UBI: scrubbed PEB 221 (LEB 4:22), data moved to PEB 1174
[ 3196.000079] UBI error: get_peb_for_wl: WL pool is empty!
[ 3196.583955] UBI: scrubbed PEB 1207 (LEB 4:25), data moved to PEB 1772
[ 3197.063390] UBI error: get_peb_for_wl: WL pool is empty!
[ 3197.493860] UBI: scrubbed PEB 331 (LEB 4:19), data moved to PEB 1178
[ 3198.605318] UBI: scrubbed PEB 546 (LEB 2:34), data moved to PEB 1867
[ 3202.529169] UBI: scrubbed PEB 1330 (LEB 4:29), data moved to PEB 1508
[ 3203.107524] UBI error: get_peb_for_wl: WL pool is empty!
[ 3209.398545] UBI: scrubbed PEB 183 (LEB 4:10), data moved to PEB 1481
[ 3210.299449] UBI error: get_peb_for_wl: WL pool is empty!
[ 3210.662360] UBI: scrubbed PEB 1196 (LEB 4:55), data moved to PEB 1176
[ 3213.646517] UBI error: get_peb_for_wl: WL pool is empty!
[ 3214.953139] UBI error: get_peb_for_wl: WL pool is empty!
[ 3215.442068] UBI: scrubbed PEB 1207 (LEB 2:53), data moved to PEB 1925
[ 3223.488744] UBI: scrubbed PEB 876 (LEB 4:55), data moved to PEB 1144
[ 3223.706006] UBI error: get_peb_for_wl: WL pool is empty!
[ 3225.010216] UBI: scrubbed PEB 1207 (LEB 4:46), data moved to PEB 1359
[ 3226.377734] UBI error: get_peb_for_wl: WL pool is empty!
[ 3226.695611] UBI: scrubbed PEB 1196 (LEB 4:30), data moved to PEB 1798
[ 3227.445865] UBI: scrubbed PEB 1394 (LEB 2:30), data moved to PEB 1456
[ 3228.508325] UBI error: get_peb_for_wl: WL pool is empty!
[ 3228.985518] UBI: scrubbed PEB 1190 (LEB 4:19), data moved to PEB 1926
[ 3232.322614] UBI error: get_peb_for_wl: WL pool is empty!
[ 3234.855286] UBI: scrubbed PEB 869 (LEB 4:30), data moved to PEB 1116
[ 3235.176539] UBI error: get_peb_for_wl: WL pool is empty!
[ 3236.711453] UBI: scrubbed PEB 1190 (LEB 4:22), data moved to PEB 1125
[ 3238.735118] UBI: scrubbed PEB 679 (LEB 4:10), data moved to PEB 1466
[ 3241.768587] UBI error: get_peb_for_wl: WL pool is empty!
[ 3244.513696] UBI error: get_peb_for_wl: WL pool is empty!
[ 3244.835041] UBI: scrubbed PEB 870 (LEB 4:22), data moved to PEB 1925
[ 3246.380082] UBI: scrubbed PEB 873 (LEB 4:21), data moved to PEB 1792
[ 3246.899732] UBI error: get_peb_for_wl: WL pool is empty!
[ 3248.132762] UBI: scrubbed PEB 1145 (LEB 2:15), data moved to PEB 1171
[ 3250.153584] UBI error: get_peb_for_wl: WL pool is empty!
[ 3252.751397] UBI error: get_peb_for_wl: WL pool is empty!
[ 3253.245123] UBI error: get_peb_for_wl: WL pool is empty!
[ 3253.361413] UBI: scrubbed PEB 868 (LEB 4:13), data moved to PEB 1797
[ 3255.672294] UBI error: get_peb_for_wl: WL pool is empty!
[ 3257.771034] UBI error: get_peb_for_wl: WL pool is empty!
[ 3258.023000] UBI: scrubbed PEB 863 (LEB 4:22), data moved to PEB 1454
[ 3261.421750] UBI: scrubbed PEB 1195 (LEB 4:25), data moved to PEB 1005
[ 3261.666261] UBI: scrubbed PEB 1189 (LEB 2:28), data moved to PEB 979
[ 3263.986744] UBI error: get_peb_for_wl: WL pool is empty!
[ 3264.370750] UBI: scrubbed PEB 555 (LEB 4:55), data moved to PEB 648
[ 3296.946212] UBI error: get_peb_for_wl: WL pool is empty!
[ 3297.616817] UBI: scrubbed PEB 38 (LEB 2:43), data moved to PEB 1467
[ 3298.754258] UBI error: get_peb_for_wl: WL pool is empty!
[ 3304.111213] UBI error: get_peb_for_wl: WL pool is empty!
[ 3308.200639] UBI: scrubbed PEB 1190 (LEB 4:22), data moved to PEB 981
[ 3308.330233] UBI error: get_peb_for_wl: WL pool is empty!
[ 3328.782661] UBI error: get_peb_for_wl: WL pool is empty!
[ 3329.004125] UBI: scrubbed PEB 306 (LEB 2:54), data moved to PEB 265
[ 3348.018142] UBI: scrubbed PEB 2 (LEB 4:23), data moved to PEB 1049
[ 3348.331609] UBI error: get_peb_for_wl: WL pool is empty!
[ 3350.723301] UBI error: get_peb_for_wl: WL pool is empty!
[ 3351.206788] UBI: scrubbed PEB 867 (LEB 4:22), data moved to PEB 1453
[ 3352.002646] UBI error: get_peb_for_wl: WL pool is empty!
[ 3352.339500] UBI: scrubbed PEB 876 (LEB 4:13), data moved to PEB 1778
[ 3361.246224] UBI: scrubbed PEB 1188 (LEB 2:46), data moved to PEB 959
[ 3361.815902] UBI error: get_peb_for_wl: WL pool is empty!
[ 3366.045576] UBI error: get_peb_for_wl: WL pool is empty!
[ 3401.088184] UBI error: get_peb_for_wl: WL pool is empty!
[ 3401.437188] UBI: scrubbed PEB 864 (LEB 4:22), data moved to PEB 912
[ 3406.130784] UBI error: get_peb_for_wl: WL pool is empty!
[ 3441.749699] UBI error: get_peb_for_wl: WL pool is empty!
[ 3442.284397] UBI: scrubbed PEB 10 (LEB 2:23), data moved to PEB 1926
[ 3445.213692] UBI error: get_peb_for_wl: WL pool is empty!
[ 3445.335194] UBI: scrubbed PEB 865 (LEB 4:19), data moved to PEB 1925
[ 3450.061740] UBI error: get_peb_for_wl: WL pool is empty!
[ 3450.470342] UBI: scrubbed PEB 1133 (LEB 2:54), data moved to PEB 674
[ 3454.297963] UBI error: get_peb_for_wl: WL pool is empty!
[ 3488.359145] UBI error: get_peb_for_wl: WL pool is empty!
[ 3488.487293] UBI: scrubbed PEB 13 (LEB 4:46), data moved to PEB 1926
[ 3490.768415] UBI error: get_peb_for_wl: WL pool is empty!
[ 3495.913087] UBI: scrubbed PEB 1395 (LEB 4:49), data moved to PEB 652
[ 3531.710394] UBI: scrubbed PEB 34 (LEB 2:36), data moved to PEB 857
[ 3534.116906] UBI error: get_peb_for_wl: WL pool is empty!
[ 3536.436828] UBI error: get_peb_for_wl: WL pool is empty!
[ 3541.144011] UBI: scrubbed PEB 1209 (LEB 2:25), data moved to PEB 651
[ 3583.359978] UBI error: get_peb_for_wl: WL pool is empty!
[ 3583.606508] UBI: scrubbed PEB 241 (LEB 4:21), data moved to PEB 992
[ 3585.766637] UBI error: get_peb_for_wl: WL pool is empty!
[ 3585.891228] UBI: scrubbed PEB 1207 (LEB 2:56), data moved to PEB 625
[ 3621.394395] UBI error: get_peb_for_wl: WL pool is empty!
[ 3621.700961] UBI: scrubbed PEB 38 (LEB 4:23), data moved to PEB 1926
[ 3622.091682] UBI error: get_peb_for_wl: WL pool is empty!
[ 3622.413061] UBI: scrubbed PEB 27 (LEB 4:10), data moved to PEB 1711
[ 3624.433903] UBI error: get_peb_for_wl: WL pool is empty!
[ 3625.004360] UBI: scrubbed PEB 3 (LEB 4:29), data moved to PEB 1467
[ 3628.582549] UBI error: get_peb_for_wl: WL pool is empty!
[ 3630.884872] UBI error: get_peb_for_wl: WL pool is empty!
[ 3631.226581] UBI: scrubbed PEB 1207 (LEB 2:12), data moved to PEB 642
[ 3671.425101] UBI error: get_peb_for_wl: WL pool is empty!
[ 3671.535484] UBI: scrubbed PEB 240 (LEB 4:21), data moved to PEB 1926
[ 3674.609732] UBI error: get_peb_for_wl: WL pool is empty!
[ 3677.259297] UBI error: get_peb_for_wl: WL pool is empty!
[ 3693.265639] UBI error: get_peb_for_wl: WL pool is empty!
[ 3716.106487] UBI error: get_peb_for_wl: WL pool is empty!
[ 3716.384899] UBI: scrubbed PEB 236 (LEB 4:29), data moved to PEB 1012
[ 3717.235591] UBI: scrubbed PEB 121 (LEB 4:10), data moved to PEB 973
[ 3718.527381] UBI: scrubbed PEB 1579 (LEB 4:19), data moved to PEB 648
[ 3720.548481] UBI: scrubbed PEB 797 (LEB 4:13), data moved to PEB 334
[ 3720.678878] UBI error: get_peb_for_wl: WL pool is empty!
[ 3758.789232] UBI error: get_peb_for_wl: WL pool is empty!
[ 3759.977114] UBI: scrubbed PEB 867 (LEB 4:19), data moved to PEB 973
[ 3759.999051] UBI error: get_peb_for_wl: WL pool is empty!
[ 3760.223871] UBI: scrubbed PEB 238 (LEB 2:43), data moved to PEB 1039
[ 3761.414981] UBI: scrubbed PEB 234 (LEB 4:10), data moved to PEB 650
[ 3761.417674] UBI error: get_peb_for_wl: WL pool is empty!
[ 3762.430600] UBI: scrubbed PEB 1932 (LEB 2:17), data moved to PEB 666
[ 3765.059363] UBI error: get_peb_for_wl: WL pool is empty!
[ 3799.407809] UBI: scrubbed PEB 33 (LEB 4:25), data moved to PEB 622
[ 3801.259161] UBI: scrubbed PEB 13 (LEB 4:11), data moved to PEB 1456
[ 3801.301235] UBI error: get_peb_for_wl: WL pool is empty!
[ 3801.889182] UBI: scrubbed PEB 8 (LEB 2:57), data moved to PEB 1798
[ 3802.124754] UBI: scrubbed PEB 2 (LEB 2:44), data moved to PEB 1711
[ 3804.260101] UBI error: get_peb_for_wl: WL pool is empty!
[ 3813.190139] UBI: scrubbed PEB 1395 (LEB 2:23), data moved to PEB 644
[ 3815.504314] UBI error: get_peb_for_wl: WL pool is empty!
[ 3849.541610] UBI: scrubbed PEB 27 (LEB 4:23), data moved to PEB 1921
[ 3851.562397] UBI error: get_peb_for_wl: WL pool is empty!
[ 3851.679355] UBI: scrubbed PEB 5 (LEB 2:52), data moved to PEB 1711
[ 3854.748851] UBI error: get_peb_for_wl: WL pool is empty!
[ 3856.314510] UBI error: get_peb_for_wl: WL pool is empty!
[ 3856.863271] UBI: scrubbed PEB 1548 (LEB 2:57), data moved to PEB 644
[ 3895.048841] UBI error: get_peb_for_wl: WL pool is empty!
[ 3895.400407] UBI: scrubbed PEB 3 (LEB 2:51), data moved to PEB 670
[ 3896.978798] UBI error: get_peb_for_wl: WL pool is empty!
[ 3898.650450] UBI error: get_peb_for_wl: WL pool is empty!
[ 3898.754720] UBI: scrubbed PEB 239 (LEB 4:13), data moved to PEB 1917
[ 3922.055690] UBI error: get_peb_for_wl: WL pool is empty!
[ 3944.892061] UBI error: get_peb_for_wl: WL pool is empty!
[ 3951.030595] UBI error: get_peb_for_wl: WL pool is empty!
[ 3983.243550] UBI error: get_peb_for_wl: WL pool is empty!
[ 3983.730162] UBI: scrubbed PEB 861 (LEB 2:45), data moved to PEB 1798
[ 3984.829053] UBI: scrubbed PEB 236 (LEB 2:33), data moved to PEB 644
[ 3998.842808] UBI: scrubbed PEB 513 (LEB 2:51), data moved to PEB 286
[ 3999.136413] UBI: scrubbed PEB 517 (LEB 4:11), data moved to PEB 12
[ 4022.859708] UBI error: get_peb_for_wl: WL pool is empty!
[ 4028.172279] UBI error: get_peb_for_wl: WL pool is empty!
[ 4028.645516] UBI: scrubbed PEB 237 (LEB 2:48), data moved to PEB 1798
[ 4031.884300] UBI error: get_peb_for_wl: WL pool is empty!
[ 4035.128101] UBI error: get_peb_for_wl: WL pool is empty!
[ 4110.158791] UBI error: get_peb_for_wl: WL pool is empty!
[ 4146.294400] UBI: scrubbed PEB 60 (LEB 4:44), data moved to PEB 661
[ 4147.648658] UBI error: get_peb_for_wl: WL pool is empty!
[ 4149.457704] UBI: scrubbed PEB 158 (LEB 4:11), data moved to PEB 1038
[ 4189.002471] UBI error: get_peb_for_wl: WL pool is empty!
[ 4189.305407] UBI: scrubbed PEB 30 (LEB 4:10), data moved to PEB 1456
[ 4190.435918] UBI: scrubbed PEB 10 (LEB 4:21), data moved to PEB 648
[ 4274.368722] UBI: scrubbed PEB 518 (LEB 4:29), data moved to PEB 410
[ 4275.679155] UBI error: get_peb_for_wl: WL pool is empty!
[ 4323.828151] UBI error: get_peb_for_wl: WL pool is empty!
[ 4342.684249] UBI error: get_peb_for_wl: WL pool is empty!
[ 4355.636263] UBI error: get_peb_for_wl: WL pool is empty!
[ 4356.118602] UBI error: get_peb_for_wl: WL pool is empty!
[ 4356.659373] UBI: scrubbed PEB 8 (LEB 4:55), data moved to PEB 1317
[ 4369.381698] UBI error: get_peb_for_wl: WL pool is empty!
[ 4378.908349] UBI error: get_peb_for_wl: WL pool is empty!
[ 4381.308754] UBI error: get_peb_for_wl: WL pool is empty!
[ 4383.342003] UBI: scrubbed PEB 3 (LEB 4:22), data moved to PEB 40
[ 4388.285793] UBI error: get_peb_for_wl: WL pool is empty!
[ 4407.516936] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4413.909496] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4414.112199] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4414.308961] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4414.507716] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4414.606793] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4414.811759] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4415.013178] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4415.242645] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4415.594145] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4415.744040] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4416.000767] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4416.402072] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4416.705505] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4417.186341] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4417.544133] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4417.769550] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4418.637420] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4418.684298] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4419.042088] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4419.401790] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4419.768537] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4421.839218] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4422.194049] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4422.458851] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4422.679981] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4422.983158] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4423.105967] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4423.226706] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4423.514118] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4423.648586] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4423.820411] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4424.010306] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4424.195718] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4424.394994] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4424.567974] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4424.669157] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4424.752216] UBI error: get_peb_for_wl: WL pool is empty!
[ 4424.752289] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4424.753666] UBI error: get_peb_for_wl: WL pool is empty!
[ 4424.753708] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4424.758002] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4424.784938] UBI error: get_peb_for_wl: WL pool is empty!
[ 4424.785009] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4425.068522] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4425.894464] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4426.252189] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4426.769527] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4427.132794] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4427.611097] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4427.970473] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4428.251522] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4428.780309] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4429.136434] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4429.401325] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4429.699199] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4430.232353] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4430.413879] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4430.638959] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4430.870159] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.074319] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.277710] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.488604] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.742211] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.915334] UBI error: get_peb_for_wl: WL pool is empty!
[ 4431.915423] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.940874] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.958715] UBI error: get_peb_for_wl: WL pool is empty!
[ 4431.958788] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.958871] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.965118] UBI error: get_peb_for_wl: WL pool is empty!
[ 4431.965180] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4431.966443] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.058742] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.147926] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.163859] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.261475] UBI error: get_peb_for_wl: WL pool is empty!
[ 4432.261552] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.267382] UBI error: get_peb_for_wl: WL pool is empty!
[ 4432.267454] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.267540] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.275362] UBI error: get_peb_for_wl: WL pool is empty!
[ 4432.275424] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.279752] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.364669] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.374139] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.472956] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.480919] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.480948] UBI error: ubi_wl_get_peb: User WL pool is empty!
[ 4432.480972] UBIFS error (pid 15156): ubifs_leb_map: mapping LEB 29 
failed, error -28
[ 4432.480991] UBIFS warning (pid 15156): ubifs_ro_mode: switched to 
read-only mode, error -28
[ 4432.481060] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from 
[<c00ff329>] (ubifs_leb_map+0x7d/0xb4)
[ 4432.481097] [<c00ff329>] (ubifs_leb_map+0x7d/0xb4) from [<c01051e7>] 
(ubifs_add_bud_to_log+0x1bf/0x214)
[ 4432.481130] [<c01051e7>] (ubifs_add_bud_to_log+0x1bf/0x214) from 
[<c00f7605>] (make_reservation+0x12d/0x274)
[ 4432.481163] [<c00f7605>] (make_reservation+0x12d/0x274) from 
[<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4)
[ 4432.481194] [<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4) from 
[<c00f99bd>] (do_writepage+0x73/0x12e)
[ 4432.481235] [<c00f99bd>] (do_writepage+0x73/0x12e) from [<c0077117>] 
(__writepage+0xb/0x26)
[ 4432.481270] [<c0077117>] (__writepage+0xb/0x26) from [<c0077413>] 
(write_cache_pages+0x151/0x1e8)
[ 4432.481303] [<c0077413>] (write_cache_pages+0x151/0x1e8) from 
[<c00774cb>] (generic_writepages+0x21/0x36)
[ 4432.481335] [<c00774cb>] (generic_writepages+0x21/0x36) from 
[<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42)
[ 4432.481366] [<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42) from 
[<c0073049>] (filemap_write_and_wait_range+0x21/0x4a)
[ 4432.481397] [<c0073049>] (filemap_write_and_wait_range+0x21/0x4a) 
from [<c00f9be1>] (ubifs_fsync+0x29/0x6c)
[ 4432.481430] [<c00f9be1>] (ubifs_fsync+0x29/0x6c) from [<c00abb23>] 
(vfs_fsync_range+0x1b/0x24)
[ 4432.481462] [<c00abb23>] (vfs_fsync_range+0x1b/0x24) from 
[<c00abb95>] (generic_write_sync+0x4d/0x54)
[ 4432.481492] [<c00abb95>] (generic_write_sync+0x4d/0x54) from 
[<c00734d5>] (generic_file_aio_write+0x71/0x8a)
[ 4432.481524] [<c00734d5>] (generic_file_aio_write+0x71/0x8a) from 
[<c00f91ab>] (ubifs_aio_write+0xff/0x10c)
[ 4432.481567] [<c00f91ab>] (ubifs_aio_write+0xff/0x10c) from 
[<c0093ef5>] (do_sync_write+0x61/0x8c)
[ 4432.481602] [<c0093ef5>] (do_sync_write+0x61/0x8c) from [<c0094397>] 
(vfs_write+0x5f/0x100)
[ 4432.481635] [<c0094397>] (vfs_write+0x5f/0x100) from [<c00945a3>] 
(sys_write+0x27/0x44)
[ 4432.481674] [<c00945a3>] (sys_write+0x27/0x44) from [<c000c681>] 
(ret_fast_syscall+0x1/0x46)
[ 4432.481708] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from 
[<c00ff32d>] (ubifs_leb_map+0x81/0xb4)
[ 4432.481739] [<c00ff32d>] (ubifs_leb_map+0x81/0xb4) from [<c01051e7>] 
(ubifs_add_bud_to_log+0x1bf/0x214)
[ 4432.481770] [<c01051e7>] (ubifs_add_bud_to_log+0x1bf/0x214) from 
[<c00f7605>] (make_reservation+0x12d/0x274)
[ 4432.481801] [<c00f7605>] (make_reservation+0x12d/0x274) from 
[<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4)
[ 4432.481832] [<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4) from 
[<c00f99bd>] (do_writepage+0x73/0x12e)
[ 4432.481863] [<c00f99bd>] (do_writepage+0x73/0x12e) from [<c0077117>] 
(__writepage+0xb/0x26)
[ 4432.481894] [<c0077117>] (__writepage+0xb/0x26) from [<c0077413>] 
(write_cache_pages+0x151/0x1e8)
[ 4432.481927] [<c0077413>] (write_cache_pages+0x151/0x1e8) from 
[<c00774cb>] (generic_writepages+0x21/0x36)
[ 4432.481958] [<c00774cb>] (generic_writepages+0x21/0x36) from 
[<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42)
[ 4432.481988] [<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42) from 
[<c0073049>] (filemap_write_and_wait_range+0x21/0x4a)
[ 4432.482019] [<c0073049>] (filemap_write_and_wait_range+0x21/0x4a) 
from [<c00f9be1>] (ubifs_fsync+0x29/0x6c)
[ 4432.482049] [<c00f9be1>] (ubifs_fsync+0x29/0x6c) from [<c00abb23>] 
(vfs_fsync_range+0x1b/0x24)
[ 4432.482079] [<c00abb23>] (vfs_fsync_range+0x1b/0x24) from 
[<c00abb95>] (generic_write_sync+0x4d/0x54)
[ 4432.482109] [<c00abb95>] (generic_write_sync+0x4d/0x54) from 
[<c00734d5>] (generic_file_aio_write+0x71/0x8a)
[ 4432.482139] [<c00734d5>] (generic_file_aio_write+0x71/0x8a) from 
[<c00f91ab>] (ubifs_aio_write+0xff/0x10c)
[ 4432.482171] [<c00f91ab>] (ubifs_aio_write+0xff/0x10c) from 
[<c0093ef5>] (do_sync_write+0x61/0x8c)
[ 4432.482204] [<c0093ef5>] (do_sync_write+0x61/0x8c) from [<c0094397>] 
(vfs_write+0x5f/0x100)
[ 4432.482236] [<c0094397>] (vfs_write+0x5f/0x100) from [<c00945a3>] 
(sys_write+0x27/0x44)
[ 4432.482268] [<c00945a3>] (sys_write+0x27/0x44) from [<c000c681>] 
(ret_fast_syscall+0x1/0x46)
[ 4432.482306] UBIFS error (pid 15156): do_commit: commit failed, error 
-30
[ 4432.482331] UBIFS error (pid 15156): do_writepage: cannot write page 
231 of inode 71, error -30
[ 4432.558187] UBI error: get_peb_for_wl: WL pool is empty!
[ 4432.558266] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.559693] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.564610] UBI error: get_peb_for_wl: WL pool is empty!
[ 4432.564720] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.568733] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.588338] UBI error: refill_wl_pool: didn't get all pebs I wanted!
[ 4432.588369] UBI error: ubi_wl_get_peb: User WL pool is empty!
[ 4432.588392] UBIFS error (pid 15134): ubifs_leb_map: mapping LEB 57 
failed, error -28
[ 4432.588412] UBIFS warning (pid 15134): ubifs_ro_mode: switched to 
read-only mode, error -28
[ 4432.588480] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from 
[<c00ff329>] (ubifs_leb_map+0x7d/0xb4)
[ 4432.588517] [<c00ff329>] (ubifs_leb_map+0x7d/0xb4) from [<c01051e7>] 
(ubifs_add_bud_to_log+0x1bf/0x214)
[ 4432.588550] [<c01051e7>] (ubifs_add_bud_to_log+0x1bf/0x214) from 
[<c00f7605>] (make_reservation+0x12d/0x274)
[ 4432.588582] [<c00f7605>] (make_reservation+0x12d/0x274) from 
[<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4)
[ 4432.588614] [<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4) from 
[<c00f99bd>] (do_writepage+0x73/0x12e)
[ 4432.588654] [<c00f99bd>] (do_writepage+0x73/0x12e) from [<c0077117>] 
(__writepage+0xb/0x26)
[ 4432.588688] [<c0077117>] (__writepage+0xb/0x26) from [<c0077413>] 
(write_cache_pages+0x151/0x1e8)
[ 4432.588721] [<c0077413>] (write_cache_pages+0x151/0x1e8) from 
[<c00774cb>] (generic_writepages+0x21/0x36)
[ 4432.588753] [<c00774cb>] (generic_writepages+0x21/0x36) from 
[<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42)
[ 4432.588786] [<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42) from 
[<c0073049>] (filemap_write_and_wait_range+0x21/0x4a)
[ 4432.588817] [<c0073049>] (filemap_write_and_wait_range+0x21/0x4a) 
from [<c00f9be1>] (ubifs_fsync+0x29/0x6c)
[ 4432.588850] [<c00f9be1>] (ubifs_fsync+0x29/0x6c) from [<c00abb23>] 
(vfs_fsync_range+0x1b/0x24)
[ 4432.588881] [<c00abb23>] (vfs_fsync_range+0x1b/0x24) from 
[<c00abb95>] (generic_write_sync+0x4d/0x54)
[ 4432.588912] [<c00abb95>] (generic_write_sync+0x4d/0x54) from 
[<c00734d5>] (generic_file_aio_write+0x71/0x8a)
[ 4432.588943] [<c00734d5>] (generic_file_aio_write+0x71/0x8a) from 
[<c00f91ab>] (ubifs_aio_write+0xff/0x10c)
[ 4432.588987] [<c00f91ab>] (ubifs_aio_write+0xff/0x10c) from 
[<c0093ef5>] (do_sync_write+0x61/0x8c)
[ 4432.589021] [<c0093ef5>] (do_sync_write+0x61/0x8c) from [<c0094397>] 
(vfs_write+0x5f/0x100)
[ 4432.589054] [<c0094397>] (vfs_write+0x5f/0x100) from [<c00945a3>] 
(sys_write+0x27/0x44)
[ 4432.589094] [<c00945a3>] (sys_write+0x27/0x44) from [<c000c681>] 
(ret_fast_syscall+0x1/0x46)
[ 4432.589128] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from 
[<c00ff32d>] (ubifs_leb_map+0x81/0xb4)
[ 4432.589159] [<c00ff32d>] (ubifs_leb_map+0x81/0xb4) from [<c01051e7>] 
(ubifs_add_bud_to_log+0x1bf/0x214)
[ 4432.589189] [<c01051e7>] (ubifs_add_bud_to_log+0x1bf/0x214) from 
[<c00f7605>] (make_reservation+0x12d/0x274)
[ 4432.589220] [<c00f7605>] (make_reservation+0x12d/0x274) from 
[<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4)
[ 4432.589251] [<c00f7d6d>] (ubifs_jnl_write_data+0xf5/0x1a4) from 
[<c00f99bd>] (do_writepage+0x73/0x12e)
[ 4432.589284] [<c00f99bd>] (do_writepage+0x73/0x12e) from [<c0077117>] 
(__writepage+0xb/0x26)
[ 4432.589315] [<c0077117>] (__writepage+0xb/0x26) from [<c0077413>] 
(write_cache_pages+0x151/0x1e8)
[ 4432.589348] [<c0077413>] (write_cache_pages+0x151/0x1e8) from 
[<c00774cb>] (generic_writepages+0x21/0x36)
[ 4432.589379] [<c00774cb>] (generic_writepages+0x21/0x36) from 
[<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42)
[ 4432.589410] [<c0072fc3>] (__filemap_fdatawrite_range+0x3b/0x42) from 
[<c0073049>] (filemap_write_and_wait_range+0x21/0x4a)
[ 4432.589441] [<c0073049>] (filemap_write_and_wait_range+0x21/0x4a) 
from [<c00f9be1>] (ubifs_fsync+0x29/0x6c)
[ 4432.589471] [<c00f9be1>] (ubifs_fsync+0x29/0x6c) from [<c00abb23>] 
(vfs_fsync_range+0x1b/0x24)
[ 4432.589501] [<c00abb23>] (vfs_fsync_range+0x1b/0x24) from 
[<c00abb95>] (generic_write_sync+0x4d/0x54)
[ 4432.589530] [<c00abb95>] (generic_write_sync+0x4d/0x54) from 
[<c00734d5>] (generic_file_aio_write+0x71/0x8a)
[ 4432.589561] [<c00734d5>] (generic_file_aio_write+0x71/0x8a) from 
[<c00f91ab>] (ubifs_aio_write+0xff/0x10c)
[ 4432.589593] [<c00f91ab>] (ubifs_aio_write+0xff/0x10c) from 
[<c0093ef5>] (do_sync_write+0x61/0x8c)
[ 4432.589627] [<c0093ef5>] (do_sync_write+0x61/0x8c) from [<c0094397>] 
(vfs_write+0x5f/0x100)
[ 4432.589659] [<c0094397>] (vfs_write+0x5f/0x100) from [<c00945a3>] 
(sys_write+0x27/0x44)
[ 4432.589690] [<c00945a3>] (sys_write+0x27/0x44) from [<c000c681>] 
(ret_fast_syscall+0x1/0x46)
[ 4432.589769] UBIFS error (pid 1259): make_reservation: cannot reserve 
67 bytes in jhead 2, error -30
[ 4432.589795] UBIFS error (pid 1259): do_writepage: cannot write page 
0 of inode 82, error -30
[ 4432.599975] UBIFS error (pid 15134): do_commit: commit failed, error 
-30
[ 4432.600013] UBIFS error (pid 15134): do_writepage: cannot write page 
405 of inode 81, error -30
[ 4433.066881] UBIFS error (pid 323): make_reservation: cannot reserve 
76 bytes in jhead 2, error -30
[ 4433.066917] UBIFS error (pid 323): do_writepage: cannot write page 
482 of inode 71, error -30
[ 4438.066923] UBIFS error (pid 323): make_reservation: cannot reserve 
160 bytes in jhead 1, error -30
[ 4438.067004] UBIFS error (pid 323): ubifs_write_inode: can't write 
inode 73, error -30
[ 4447.442854] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4447.442891] UBIFS error (pid 1193): do_writepage: cannot write page 
505 of inode 81, error -30
[ 4452.442956] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4452.442994] UBIFS error (pid 1193): do_writepage: cannot write page 
506 of inode 81, error -30
[ 4457.443149] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4457.443186] UBIFS error (pid 1193): do_writepage: cannot write page 
507 of inode 81, error -30
[ 4462.443211] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4462.443248] UBIFS error (pid 1193): do_writepage: cannot write page 
508 of inode 81, error -30
[ 4463.067691] UBIFS error (pid 323): make_reservation: cannot reserve 
76 bytes in jhead 2, error -30
[ 4463.067727] UBIFS error (pid 323): do_writepage: cannot write page 
483 of inode 71, error -30
[ 4467.443433] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4467.443470] UBIFS error (pid 1193): do_writepage: cannot write page 
509 of inode 81, error -30
[ 4472.443597] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4472.443635] UBIFS error (pid 1193): do_writepage: cannot write page 
510 of inode 81, error -30
[ 4473.067876] UBIFS error (pid 323): make_reservation: cannot reserve 
160 bytes in jhead 1, error -30
[ 4473.067911] UBIFS error (pid 323): ubifs_write_inode: can't write 
inode 73, error -30
[ 4477.443674] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4477.443712] UBIFS error (pid 1193): do_writepage: cannot write page 
511 of inode 81, error -30
[ 4482.443788] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4482.443826] UBIFS error (pid 1193): do_writepage: cannot write page 
406 of inode 81, error -30
[ 4487.443921] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4487.443958] UBIFS error (pid 1193): do_writepage: cannot write page 
407 of inode 81, error -30
[ 4492.443981] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4492.444018] UBIFS error (pid 1193): do_writepage: cannot write page 
408 of inode 81, error -30
[ 4493.068604] UBIFS error (pid 323): make_reservation: cannot reserve 
76 bytes in jhead 2, error -30
[ 4493.068640] UBIFS error (pid 323): do_writepage: cannot write page 
484 of inode 71, error -30
[ 4497.444212] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4497.444249] UBIFS error (pid 1193): do_writepage: cannot write page 
409 of inode 81, error -30
[ 4502.444272] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4502.444308] UBIFS error (pid 1193): do_writepage: cannot write page 
410 of inode 81, error -30
[ 4507.444432] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4507.444470] UBIFS error (pid 1193): do_writepage: cannot write page 
411 of inode 81, error -30
[ 4508.068867] UBIFS error (pid 323): make_reservation: cannot reserve 
160 bytes in jhead 1, error -30
[ 4508.068903] UBIFS error (pid 323): ubifs_write_inode: can't write 
inode 73, error -30
[ 4512.444605] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4512.444642] UBIFS error (pid 1193): do_writepage: cannot write page 
412 of inode 81, error -30
[ 4517.444735] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4517.444774] UBIFS error (pid 1193): do_writepage: cannot write page 
413 of inode 81, error -30
[ 4522.444927] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4522.444965] UBIFS error (pid 1193): do_writepage: cannot write page 
414 of inode 81, error -30
[ 4523.069388] UBIFS error (pid 323): make_reservation: cannot reserve 
76 bytes in jhead 2, error -30
[ 4523.069423] UBIFS error (pid 323): do_writepage: cannot write page 
485 of inode 71, error -30
[ 4527.445013] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4527.445052] UBIFS error (pid 1193): do_writepage: cannot write page 
415 of inode 81, error -30
[ 4532.445136] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4532.445173] UBIFS error (pid 1193): do_writepage: cannot write page 
416 of inode 81, error -30
[ 4537.445320] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4537.445358] UBIFS error (pid 1193): do_writepage: cannot write page 
417 of inode 81, error -30
[ 4542.445417] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4542.445456] UBIFS error (pid 1193): do_writepage: cannot write page 
418 of inode 81, error -30
[ 4543.069848] UBIFS error (pid 323): make_reservation: cannot reserve 
160 bytes in jhead 1, error -30
[ 4543.069883] UBIFS error (pid 323): ubifs_write_inode: can't write 
inode 73, error -30
[ 4547.445623] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4547.445659] UBIFS error (pid 1193): do_writepage: cannot write page 
419 of inode 81, error -30
[ 4552.445692] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4552.445730] UBIFS error (pid 1193): do_writepage: cannot write page 
420 of inode 81, error -30
[ 4553.070260] UBIFS error (pid 323): make_reservation: cannot reserve 
76 bytes in jhead 2, error -30
[ 4553.070296] UBIFS error (pid 323): do_writepage: cannot write page 
486 of inode 71, error -30
[ 4557.445890] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4557.445928] UBIFS error (pid 1193): do_writepage: cannot write page 
421 of inode 81, error -30
[ 4562.446059] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4562.446095] UBIFS error (pid 1193): do_writepage: cannot write page 
422 of inode 81, error -30
[ 4567.446190] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4567.446229] UBIFS error (pid 1193): do_writepage: cannot write page 
423 of inode 81, error -30
[ 4572.446339] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4572.446378] UBIFS error (pid 1193): do_writepage: cannot write page 
424 of inode 81, error -30
[ 4577.446513] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4577.446552] UBIFS error (pid 1193): do_writepage: cannot write page 
425 of inode 81, error -30
[ 4578.070870] UBIFS error (pid 323): make_reservation: cannot reserve 
160 bytes in jhead 1, error -30
[ 4578.070942] UBIFS error (pid 323): ubifs_write_inode: can't write 
inode 73, error -30
[ 4582.446581] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4582.446619] UBIFS error (pid 1193): do_writepage: cannot write page 
426 of inode 81, error -30
[ 4583.071122] UBIFS error (pid 323): make_reservation: cannot reserve 
76 bytes in jhead 2, error -30
[ 4583.071157] UBIFS error (pid 323): do_writepage: cannot write page 
487 of inode 71, error -30
[ 4587.446762] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4587.446801] UBIFS error (pid 1193): do_writepage: cannot write page 
427 of inode 81, error -30
[ 4592.446864] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4592.446901] UBIFS error (pid 1193): do_writepage: cannot write page 
428 of inode 81, error -30
[ 4597.447057] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4597.447095] UBIFS error (pid 1193): do_writepage: cannot write page 
429 of inode 81, error -30
[ 4602.447200] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4602.447237] UBIFS error (pid 1193): do_writepage: cannot write page 
430 of inode 81, error -30
[ 4607.447375] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4607.447412] UBIFS error (pid 1193): do_writepage: cannot write page 
431 of inode 81, error -30
[ 4612.447511] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4612.447548] UBIFS error (pid 1193): do_writepage: cannot write page 
432 of inode 81, error -30
[ 4613.071898] UBIFS error (pid 323): make_reservation: cannot reserve 
160 bytes in jhead 1, error -30
[ 4613.071933] UBIFS error (pid 323): ubifs_write_inode: can't write 
inode 73, error -30
[ 4613.072083] UBIFS error (pid 323): make_reservation: cannot reserve 
76 bytes in jhead 2, error -30
[ 4613.072108] UBIFS error (pid 323): do_writepage: cannot write page 
488 of inode 71, error -30
[ 4613.072260] UBIFS error (pid 323): make_reservation: cannot reserve 
76 bytes in jhead 2, error -30
[ 4613.072283] UBIFS error (pid 323): do_writepage: cannot write page 
489 of inode 71, error -30
[ 4617.447582] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4617.447617] UBIFS error (pid 1193): do_writepage: cannot write page 
433 of inode 81, error -30
[ 4618.072122] UBIFS error (pid 323): make_reservation: cannot reserve 
76 bytes in jhead 2, error -30
[ 4618.072157] UBIFS error (pid 323): do_writepage: cannot write page 
490 of inode 71, error -30
[ 4622.447741] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4622.447779] UBIFS error (pid 1193): do_writepage: cannot write page 
434 of inode 81, error -30
[ 4627.447963] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4627.448000] UBIFS error (pid 1193): do_writepage: cannot write page 
435 of inode 81, error -30
[ 4632.448098] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4632.448135] UBIFS error (pid 1193): do_writepage: cannot write page 
436 of inode 81, error -30
[ 4637.448172] UBIFS error (pid 1193): make_reservation: cannot reserve 
4144 bytes in jhead 2, error -30
[ 4637.448210] UBIFS error (pid 1193): do_writepage: cannot write page 
437 of inode 81, error -30

> Can you also please share your test script with me?
> So far none of my boards run into that issue. :(

Below are the 3 scripts run in background:
Script1:
while [ true ]
do
        dd if=/dev/urandom of=/var/db/test bs=2M count=1 2> /dev/null
done

Script2:
#!/bin/sh
while [ true ]
do
        dd if=/dev/zero of=/var/log/test.log bs=2M count=1 2> /dev/null
done

Script3:
#!/bin/sh
while [ true ]
do
        echo "hskjfwehjfiojwiojo" > /var/db/test.db
done

Details regarding the filesystem:
# mount
rootfs on / type rootfs (rw)
ubi0:rootfs on / type ubifs (rw,relatime)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
tmpfs on /tmp type tmpfs (rw,relatime)
none on /dev/pts type devpts (rw,relatime,mode=600)
tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
tmpfs on /var/run type tmpfs (rw,relatime,mode=777)
ubi0:logging on /var/log type ubifs (rw,sync,relatime)
ubi0:database on /var/db type ubifs (rw,sync,relatime)
tmpfs on /var/spool/cron type tmpfs (rw,relatime,mode=755)
tmpfs on /var/sftp type tmpfs (rw,relatime,mode=755)

> Thanks,
> //richard
