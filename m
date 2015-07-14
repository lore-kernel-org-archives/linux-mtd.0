Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEvb6-00012X-Nt
 for linux-mtd@lists.infradead.org; Tue, 14 Jul 2015 08:29:54 +0000
Received: by pactm7 with SMTP id tm7so214510pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jul 2015 01:29:31 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: Re: UBIFS errors when file-system is full
To: Richard Weinberger <richard@nod.at>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <55A4C866.2010400@gmail.com>
Date: Tue, 14 Jul 2015 13:59:26 +0530
MIME-Version: 1.0
In-Reply-To: <55A4ACEF.20307@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/14/2015 12:02 PM, Richard Weinberger wrote:

> Am 14.07.2015 um 08:30 schrieb Bhuvanchandra DV:
>> Reproduced the issue with a clean UBI image.
> On 4.1?
> How can you reproduce?

Flashed a clean UBI image with 4.1.
I can reproduce it by amost filling up the flash and doing a power resets for around ~200 cycles.
During some point U-Boot cannot mount the ubifs partition and fails with:
"Error reading superblock on volume 'ubi0:rootfs' errno=-22!"

Tried to mount the same ubifs partition via tftp, got stack trace when trying to mount the ubifs.

Complete debug log when booting with tftp:

Colibri VFxx # setenv bootargs ${defargs} ${ubiargs} ${mtdparts} ${setupargs} ${vidargs}
Colibri VFxx # dhcp ${kernel_addr_r} && tftp ${fdt_addr_r} ${soc}-colibri-${fdt_board}.dtb && bootz ${kernel_addr_r} - ${fdt_addr_r}
BOOTP broadcast 1
DHCP client bound to address 10.18.0.144 (3 ms)
Using FEC device
TFTP from server 10.18.0.132; our IP address is 10.18.0.144
Filename 'zImage'.
Load address: 0x82000000
Loading: #################################################################
          #################################################################
          #################################################################
          #################################################################
          ##########################################
          760.7 KiB/s
done
Bytes transferred = 4431512 (439e98 hex)
Using FEC device
TFTP from server 10.18.0.132; our IP address is 10.18.0.144
Filename 'vf500-colibri-eval-v3.dtb'.
Load address: 0x84000000
Loading: ##
          256.8 KiB/s
done
Bytes transferred = 20846 (516e hex)
Kernel image @ 0x82000000 [ 0x000000 - 0x439e98 ]
## Flattened Device Tree blob at 84000000
    Booting using the fdt blob at 0x84000000
    Loading Device Tree to 876ff000, end 8770716d ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.1.1-00245-g4a73219 (dvb@dev) (gcc version 4.9.3 20141031 (prerelease) (Linaro GCC 2014.11) ) #2 Tue Jul 14 13:01:16 I5
[    0.000000] CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] Machine model: Toradex Colibri VF50 on Colibri Evaluation Board
[    0.000000] cma: Reserved 16 MiB at 0x86400000
[    0.000000] Memory policy: Data cache writeback
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32004
[    0.000000] Kernel command line: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs ubi.fm_autoconvert=1 mtdparts=vf610_nfc:128k(vf-bcb)ro,1408k(u-boo0
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 103176K/129024K available (5715K kernel code, 201K rwdata, 1840K rodata, 216K init, 171K bss, 9464K reserved, 16384K cma-rese)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0x88000000 - 0xff000000   (1904 MB)
[    0.000000]     lowmem  : 0x80000000 - 0x87e00000   ( 126 MB)
[    0.000000]     modules : 0x7f000000 - 0x80000000   (  16 MB)
[    0.000000]       .text : 0x80008000 - 0x8076904c   (7557 kB)
[    0.000000]       .init : 0x8076a000 - 0x807a0000   ( 216 kB)
[    0.000000]       .data : 0x807a0000 - 0x807d24a0   ( 202 kB)
[    0.000000]        .bss : 0x807d24a0 - 0x807fd0d0   ( 172 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] L2C: failed to init: -19
[    0.000054] sched_clock: 64 bits at 132MHz, resolution 7ns, wraps every 2199023255551ns
[    0.000125] clocksource arm_global_timer: mask: 0xffffffffffffffff max_cycles: 0x1e7178659b, max_idle_ns: 440795204301 ns
[    0.000849] Console: colour dummy device 80x30
[    0.002020] console [tty1] enabled
[    0.002121] Calibrating delay loop... 262.96 BogoMIPS (lpj=1314816)
[    0.070303] pid_max: default: 32768 minimum: 301
[    0.070668] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.070779] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.072749] CPU: Testing write buffer coherency: ok
[    0.073687] Setting up static identity map for 0x80008200 - 0x80008258
[    0.077538] devtmpfs: initialized
[    0.090865] VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
[    0.091928] clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.095527] pinctrl core: initialized pinctrl subsystem
[    0.098746] NET: Registered protocol family 16
[    0.102859] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.105728] cpuidle: using governor menu
[    0.134103] hw-breakpoint: found 2 (+1 reserved) breakpoint and 1 watchpoint registers.
[    0.134261] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.135299] vf610-pinctrl 40048000.iomuxc: initialized IMX pinctrl driver
[    0.171433] SCSI subsystem initialized
[    0.172626] usbcore: registered new interface driver usbfs
[    0.172993] usbcore: registered new interface driver hub
[    0.173374] usbcore: registered new device driver usb
[    0.175965] i2c i2c-0: IMX I2C adapter registered
[    0.176207] i2c i2c-0: using dma0chan0 (tx) and dma0chan1 (rx) for DMA transfers
[    0.176666] Linux video capture interface: v2.00
[    0.177092] pps_core: LinuxPPS API ver. 1 registered
[    0.177173] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.177397] PTP clock support registered
[    0.178934] Advanced Linux Sound Architecture Driver Initialized.
[    0.182091] Switched to clocksource arm_global_timer
[    0.220933] NET: Registered protocol family 2
[    0.223441] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
[    0.223620] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.223734] TCP: Hash tables configured (established 1024 bind 1024)
[    0.224144] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.224276] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.224870] NET: Registered protocol family 1
[    0.225936] RPC: Registered named UNIX socket transport module.
[    0.226064] RPC: Registered udp transport module.
[    0.226135] RPC: Registered tcp transport module.
[    0.226199] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.230980] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.255535] NFS: Registering the id_resolver key type
[    0.255804] Key type id_resolver registered
[    0.255890] Key type id_legacy registered
[    0.256040] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.257822] ntfs: driver 2.1.32 [Flags: R/W].
[    0.259474] fuse init (API version 7.23)
[    0.268197] io scheduler noop registered
[    0.268343] io scheduler deadline registered
[    0.268620] io scheduler cfq registered (default)
[    0.280233] backlight supply power not found, using dummy regulator
[    0.301896] Console: switching to colour frame buffer device 80x30
[    0.313909] fb0: fb device registered successfully.
[    0.319322] fb1: fb device registered successfully.
[    0.324671] fb2: fb device registered successfully.
[    0.329643] fb3: fb device registered successfully.
[    0.334724] fb4: fb device registered successfully.
[    0.339378] fb5: fb device registered successfully.
[    0.344996] 40027000.serial: ttyLP0 at MMIO 0x40027000 (irq = 19, base_baud = 4125000) is a FSL_LPUART
[    0.888645] console [ttyLP0] enabled
[    0.897621] 40028000.serial: ttyLP1 at MMIO 0x40028000 (irq = 20, base_baud = 4125000) is a FSL_LPUART
[    0.916706] 40029000.serial: ttyLP2 at MMIO 0x40029000 (irq = 21, base_baud = 4125000) is a FSL_LPUART
[    0.955586] loop: module loaded
[    0.966803] nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xf1
[    0.977644] nand: Macronix NAND 128MiB 3,3V 8-bit
[    0.986782] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    1.003429] Bad block table found at page 65472, version 0x01
[    1.014062] Bad block table found at page 65408, version 0x01
[    1.024768] 4 cmdlinepart partitions found on MTD device vf610_nfc
[    1.035640] Creating 4 MTD partitions on "vf610_nfc":
[    1.045408] 0x000000000000-0x000000020000 : "vf-bcb"
[    1.056418] 0x000000020000-0x000000180000 : "u-boot"
[    1.067310] 0x000000180000-0x000000200000 : "u-boot-env"
[    1.078436] 0x000000200000-0x000008000000 : "ubi"
[    1.095947] 400d1000.ethernet supply phy not found, using dummy regulator
[    1.117728] libphy: fec_enet_mii_bus: probed
[    1.128873] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.141625] usbcore: registered new interface driver usb-storage
[    1.153688] usbcore: registered new interface driver usbserial
[    1.164859] usbcore: registered new interface driver usbserial_generic
[    1.176470] usbserial: USB Serial support registered for generic
[    1.187664] usbcore: registered new interface driver ftdi_sio
[    1.198481] usbserial: USB Serial support registered for FTDI USB Serial Device
[    1.215340] usbcore: registered new interface driver pl2303
[    1.225866] usbserial: USB Serial support registered for pl2303
[    1.246498] imx_usb 400b4000.usb: Can't register ci_hdrc platform device, err=-517
[    1.265515] mousedev: PS/2 mouse device common for all mice
[    1.277903] rtc-ds1307: probe of 0-0068 failed with error -5
[    1.290355] snvs_rtc 400a7034.snvs-rtc-lp: rtc core: registered 400a7034.snvs-rtc-l as rtc0
[    1.308688] i2c /dev entries driver
[    1.321359] imx2-wdt 4003e000.wdog: timeout 60 sec (nowayout=0)
[    1.333032] sdhci: Secure Digital Host Controller Interface driver
[    1.344317] sdhci: Copyright(c) Pierre Ossman
[    1.353809] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.366082] /soc/aips-bus@40080000/esdhc@400b2000: voltage-ranges unspecified
[    1.378925] sdhci-esdhc-imx 400b2000.esdhc: Got CD GPIO
[    1.389963] sdhci-esdhc-imx 400b2000.esdhc: No vmmc regulator found
[    1.401634] sdhci-esdhc-imx 400b2000.esdhc: No vqmmc regulator found
[    1.452220] mmc0: SDHCI controller on 400b2000.esdhc [400b2000.esdhc] using ADMA
[    1.475559] usbcore: registered new interface driver usbhid
[    1.486806] usbhid: USB HID core driver
[    1.497384] 4003b000.adc supply vref not found, using dummy regulator
[    1.514460] 400bb000.adc supply vref not found, using dummy regulator
[    1.531429] Netfilter messages via NETLINK v0.30.
[    1.542908] nfnl_acct: registering with nfnetlink.
[    1.553034] nf_conntrack version 0.5.0 (1868 buckets, 7472 max)
[    1.569452] nf_tables: (c) 2007-2009 Patrick McHardy <kaber@trash.net>
[    1.583336] ip_tables: (C) 2000-2006 Netfilter Core Team
[    1.596707] NET: Registered protocol family 10
[    1.610419] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    1.621187] sit: IPv6 over IPv4 tunneling driver
[    1.634053] NET: Registered protocol family 17
[    1.643852] bridge: automatic filtering via arp/ip/ip6tables has been deprecated. Update your scripts to load br_netfilter if you need this.
[    1.666816] Bridge firewalling registered
[    1.677391] 8021q: 802.1Q VLAN Support v1.8
[    1.689062] Key type dns_resolver registered
[    1.698929] Registering SWP/SWPB emulation handler
[    1.712281] registered taskstats version 1
[    1.728415] usbh_vbus: supplied by 5v0
[    1.741823] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    1.752957] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
[    1.782224] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    1.795354] hub 1-0:1.0: USB hub found
[    1.804157] hub 1-0:1.0: 1 port detected
[    1.816698] input: colibri-vf50-ts as /devices/platform/vf50_touchctrl/input/input0
[    1.836924] toradex,vf50_touchctrl vf50_touchctrl: Attached colibri-vf50-ts driver successfully
[    1.856553] ubi0: default fastmap pool size: 50
[    1.866179] ubi0: default fastmap WL pool size: 25
[    1.875836] ubi0: attaching mtd3
[    1.975937] ubi0: attached by fastmap
[    1.984411] ubi0: fastmap pool size: 50
[    1.992859] ubi0: fastmap WL pool size: 25
[    2.012913] ubi0: attached mtd3 (name "ubi", size 126 MiB)
[    2.023140] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    2.034658] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    2.046015] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    2.057546] ubi0: good PEBs: 1004, bad PEBs: 4, corrupted PEBs: 0
[    2.068348] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
[    2.084771] ubi0: max/mean erase counter: 29/6, WL threshold: 4096, image sequence number: 0
[    2.102911] ubi0: available PEBs: 0, total reserved PEBs: 1004, PEBs reserved for bad PEB handling: 16
[    2.122563] ubi0: background thread "ubi_bgt0d" started, PID 50
[    2.135081] snvs_rtc 400a7034.snvs-rtc-lp: setting system clock to 2015-07-14 08:17:11 UTC (1436861831)
[    2.170929] ALSA device list:
[    2.179354]   No soundcards found.
[    2.192343] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    2.227211] UBIFS (ubi0:0): recovery needed
[    2.355517] hub 1-1:1.0: USB hub found
[    2.365430] hub 1-1:1.0: 4 ports detected
[    2.410558] UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (10 but expected 3)
[    2.429359] UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB 908:29408, LEB mapping status 1
[    2.450012] Not a node, first 24 bytes:
[    2.453975] 00000000: dc 06 05 48 11 b3 9a 28 d9 b4 f1 90 1a 70 00 de 05 98 d2 bc 0a 68 02 6c                          ...H...(.....p.......h.l
[    2.483992] CPU: 0 PID: 1 Comm: swapper Not tainted 4.1.1-00245-g4a73219 #2
[    2.496932] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[    2.509317] Backtrace:
[    2.517656] [<80012ab8>] (dump_backtrace) from [<80012cd8>] (show_stack+0x18/0x1c)
[    2.536748]  r7:00000000 r6:00000000 r5:0000038c r4:000072e0
[    2.548497] [<80012cc0>] (show_stack) from [<80597828>] (dump_stack+0x24/0x28)
[    2.567075] [<80597804>] (dump_stack) from [<8022dbe8>] (ubifs_read_node+0x294/0x310)
[    2.586390] [<8022d954>] (ubifs_read_node) from [<8022dd0c>] (ubifs_read_node_wbuf+0xa8/0x2fc)
[    2.606659]  r10:0000038c r9:00000049 r8:87be6380 r7:00000003 r6:87b53000 r5:87b4db20
[    2.626990]  r4:000072e0
[    2.635632] [<8022dc64>] (ubifs_read_node_wbuf) from [<8024b39c>] (ubifs_tnc_read_node+0x50/0x140)
[    2.657072]  r10:87bd7a00 r9:87be6380 r8:87bd7a00 r7:00000003 r6:87be6380 r5:87b53000
[    2.677875]  r4:87bd7a30
[    2.686669] [<8024b34c>] (ubifs_tnc_read_node) from [<8022ec3c>] (tnc_read_node_nm+0xcc/0x1e4)
[    2.707690]  r8:87bd7a00 r7:87b531c0 r6:87b53000 r5:87be6380 r4:87bd7a30
[    2.721103] [<8022eb70>] (tnc_read_node_nm) from [<80232784>] (ubifs_tnc_next_ent+0x140/0x1a4)
[    2.742233]  r7:87b531c0 r6:87b53000 r5:87849c38 r4:00000030
[    2.754489] [<80232644>] (ubifs_tnc_next_ent) from [<8023289c>] (ubifs_tnc_remove_ino+0xb4/0x144)
[    2.775956]  r10:87b53000 r9:00003ee1 r8:ffffffff r7:00000000 r6:000003b3 r5:87b53000
[    2.796730]  r4:87bddde0
[    2.805546] [<802327e8>] (ubifs_tnc_remove_ino) from [<80235468>] (ubifs_replay_journal+0xe9c/0x1490)
[    2.827195]  r10:87b53000 r9:87849d08 r8:87bdddc0 r7:87b53930 r6:000003b3 r5:00000000
[    2.847754]  r4:87bddde0
[    2.856397] [<802345cc>] (ubifs_replay_journal) from [<8022a01c>] (ubifs_mount+0x10f8/0x1740)
[    2.876909]  r10:87b53190 r9:00000000 r8:0001e5a0 r7:87b47c00 r6:87b53000 r5:00000000
[    2.897398]  r4:00000000
[    2.906044] [<80228f24>] (ubifs_mount) from [<800c47c0>] (mount_fs+0x1c/0xac)
[    2.919382]  r10:00008001 r9:00000060 r8:807b13e8 r7:807b13e8 r6:00008001 r5:87b58a00
[    2.939597]  r4:87b0a600
[    2.948224] [<800c47a4>] (mount_fs) from [<800dba54>] (vfs_kern_mount+0x50/0xfc)
[    2.967514]  r8:00000000 r7:807b13e8 r6:00008001 r5:87b58a00 r4:87b0a600
[    2.980635] [<800dba04>] (vfs_kern_mount) from [<800de720>] (do_mount+0x19c/0x9b4)
[    3.000129]  r9:00000060 r8:87b589c0 r7:87b58a00 r6:807a9658 r5:00000000 r4:807b13e8
[    3.020237] [<800de584>] (do_mount) from [<800df274>] (SyS_mount+0x7c/0xa8)
[    3.033423]  r10:87ba7000 r9:807962b8 r8:00008001 r7:806c83f0 r6:00000000 r5:87b58a00
[    3.053626]  r4:87b589c0
[    3.062280] [<800df1f8>] (SyS_mount) from [<8076b1f4>] (mount_block_root+0x144/0x270)
[    3.082062]  r8:87de94e0 r7:87ba7000 r6:807962a8 r5:87ba7000 r4:00008001
[    3.095233] [<8076b0b0>] (mount_block_root) from [<8076b4e8>] (prepare_namespace+0xb0/0x1a4)
[    3.115944]  r10:80796284 r9:8076a5ec r8:00000097 r7:807d24c0 r6:807d24c0 r5:807962b8
[    3.136353]  r4:807962a8
[    3.144950] [<8076b438>] (prepare_namespace) from [<8076ae9c>] (kernel_init_freeable+0x1bc/0x1d0)
[    3.166110]  r5:00000008 r4:8079ec3c
[    3.175907] [<8076ace0>] (kernel_init_freeable) from [<80594f30>] (kernel_init+0x18/0xf0)
[    3.196270]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80594f18
[    3.216825]  r4:807d24c0
[    3.225507] [<80594f18>] (kernel_init) from [<8000f668>] (ret_from_fork+0x14/0x2c)
[    3.245180]  r5:80594f18 r4:00000000
[    3.258206] List of all partitions:
[    3.267753] No filesystem could mount root, tried:  ubifs
[    3.279225] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    3.298764] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

>
> Thanks,
> //richard
>
Best regards,

Bhuvan
