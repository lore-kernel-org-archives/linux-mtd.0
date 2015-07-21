Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHQfj-0008Ox-22
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 06:05:02 +0000
Received: by pacan13 with SMTP id an13so114629039pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2015 23:04:37 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: Re: UBIFS errors when file-system is full
To: Richard Weinberger <richard@nod.at>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at>
Cc: linux-mtd@lists.infradead.org
Message-ID: <55ADE0F1.9090809@gmail.com>
Date: Tue, 21 Jul 2015 11:34:33 +0530
MIME-Version: 1.0
In-Reply-To: <55A75A05.7040603@nod.at>
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

On 07/16/2015 12:45 PM, Richard Weinberger wrote:

> Am 16.07.2015 um 09:11 schrieb Bhuvanchandra DV:
>> On 07/16/2015 12:19 PM, Richard Weinberger wrote:
>>
>>> Am 16.07.2015 um 08:09 schrieb Richard Weinberger:
>>>> Am 16.07.2015 um 07:58 schrieb Bhuvanchandra DV:
>>>>> Power cut test with 4.1.2 kernel:
>>>>>
>>>>> Preparing UBI image using mkfs.ubifs utility:
>>>>>
>>>>> $ mkfs.ubifs -c 8112 -e 124KiB -m 2KiB -o ubifs.img -r rootfs/ -v
>>>>>
>>>>>
>>>>> Flashing UBI image from U-Boot:
>>>>>
>>>>> # fatload ${interface} 0:1 ${loadaddr} ubifs.img
>>>>> reading ubifs.img
>>>>> 108691456 bytes read in 7139 ms (14.5 MiB/s)
>>>>> # ubi part ubi && ubi check rootfs || ubi create rootfs
>>>>> UBI: default fastmap pool size: 50
>>>>> UBI: default fastmap WL pool size: 25
>>>>> UBI: attaching mtd1 to ubi0
>>>>> UBI: attached by fastmap
>>>>> UBI: fastmap pool size: 50
>>>>> UBI: fastmap WL pool size: 25
>>>>> UBI: attached mtd1 (name "mtd=3", size 126 MiB) to ubi0
>>>>> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>>>>> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>>>>> UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>>>>> UBI: good PEBs: 1003, bad PEBs: 5, corrupted PEBs: 0
>>>>> UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
>>>>> UBI: max/mean erase counter: 14/4, WL threshold: 4096, image sequence number: 0
>>>>> UBI: available PEBs: 0, total reserved PEBs: 1003, PEBs reserved for bad PEB handling: 15
>>>>> # ubi write ${loadaddr} rootfs ${filesize}
>>>>> 108691456 bytes written to volume rootfs
>>>>>
>>>>> With 4.1.2 kernel after ~600 power cut cycles, no issues with mounting the ubifs,
>>>>> but observed few stack traces.
>>>> But your kernel log shows an issue. It is not clear whether it comes from fastmap.
>>> BTW: I forgot to ask one thing, did you test using fm_debug?
>> No, if needed i can do the test again with fm_debug enabled.
>> Enabled fm_debug now with the corrupted ubifs, no addiditional debug logs observed.
> Okay. So far it does not really sound like a fastmap issue.
> But please double check using fm_debug.

Ran the power cut tests with fm_debug enabled, no additional logs are observed.
After few hundred power cuts U-Boot fails to mount with -22 and kernel fails
mounting with stack trace when reading the node.

Log:
  
U-Boot 2015.04 (May 18 2015 - 15:37:34)

CPU: Freescale Vybrid VF500 at 396 MHz
Reset cause: WDOG A5
DRAM:  128 MiB
NAND:  128 MiB
MMC:   FSL_SDHC: 0
In:    serial
Out:   serial
Err:   serial
Model: Toradex Colibri VF50 128MB V38.655341, Serial# 04833251
Net:   FEC
Hit any key to stop autoboot:  0
Colibri VFxx #
Colibri VFxx #
Colibri VFxx # boot
Booting from NAND...
UBI: default fastmap pool size: 50
UBI: default fastmap WL pool size: 25
UBI: attaching mtd1 to ubi0
UBI: attached by fastmap
UBI: fastmap pool size: 50
UBI: fastmap WL pool size: 25
UBI: attached mtd1 (name "mtd=3", size 126 MiB) to ubi0
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
UBI: good PEBs: 1004, bad PEBs: 4, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 185/29, WL threshold: 4096, image sequence number: 0
UBI: available PEBs: 0, total reserved PEBs: 1004, PEBs reserved for bad PEB handling: 16
Error reading superblock on volume 'ubi0:rootfs' errno=-22!
ubifsmount - mount UBIFS volume

Usage:
ubifsmount <volume-name>
     - mount 'volume-name' volume
Colibri VFxx # setenv bootargs ${defargs} ${ubiargs} ${mtdparts} ${setupargs} ${vidargs}
Colibri VFxx # dhcp ${kernel_addr_r} && tftp ${fdt_addr_r} ${soc}-colibri-${fdt_board}.dtb && bootz ${kernel_addr_r} - ${fdt_addr_r}
BOOTP broadcast 1
DHCP client bound to address 10.18.0.139 (5 ms)
Using FEC device
TFTP from server 10.18.0.132; our IP address is 10.18.0.139
Filename 'zImage'.
Load address: 0x82000000
Loading: #################################################################
          #################################################################
          #################################################################
          #################################################################
          ###########################################
          1.2 MiB/s
done
Bytes transferred = 4433808 (43a790 hex)
Using FEC device
TFTP from server 10.18.0.132; our IP address is 10.18.0.139
Filename 'vf500-colibri-eval-v3.dtb'.
Load address: 0x84000000
Loading: ##
          588.9 KiB/s
done
Bytes transferred = 21126 (5286 hex)
Kernel image @ 0x82000000 [ 0x000000 - 0x43a790 ]
## Flattened Device Tree blob at 84000000
    Booting using the fdt blob at 0x84000000
    Loading Device Tree to 876ff000, end 87707285 ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.1.2-00312-g796aee8 (dvb@dev) (gcc version 4.9.3 20141031 (prerelease) (Linaro GCC 2014.11) ) #4 Tue Jul 14 18:02:37 I5
[    0.000000] CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] Machine model: Toradex Colibri VF50 on Colibri Evaluation Board
[    0.000000] cma: Reserved 16 MiB at 0x86400000
[    0.000000] Memory policy: Data cache writeback
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32004
[    0.000000] Kernel command line: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs ubi.fm_autoconvert=1 ubi.fm_debug=1 mtdparts=vf610_nfc:128k(vf-bcb0
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 103168K/129024K available (5719K kernel code, 201K rwdata, 1844K rodata, 216K init, 171K bss, 9472K reserved, 16384K cma-rese)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0x88000000 - 0xff000000   (1904 MB)
[    0.000000]     lowmem  : 0x80000000 - 0x87e00000   ( 126 MB)
[    0.000000]     modules : 0x7f000000 - 0x80000000   (  16 MB)
[    0.000000]       .text : 0x80008000 - 0x8076b04c   (7565 kB)
[    0.000000]       .init : 0x8076c000 - 0x807a2000   ( 216 kB)
[    0.000000]       .data : 0x807a2000 - 0x807d44e0   ( 202 kB)
[    0.000000]        .bss : 0x807d44e0 - 0x807ff1d0   ( 172 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] L2C: failed to init: -19
[    0.000054] sched_clock: 64 bits at 132MHz, resolution 7ns, wraps every 2199023255551ns
[    0.000124] clocksource arm_global_timer: mask: 0xffffffffffffffff max_cycles: 0x1e7178659b, max_idle_ns: 440795204301 ns
[    0.000841] Console: colour dummy device 80x30
[    0.002050] console [tty1] enabled
[    0.002147] Calibrating delay loop... 262.96 BogoMIPS (lpj=1314816)
[    0.070305] pid_max: default: 32768 minimum: 301
[    0.070664] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.070779] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.072721] CPU: Testing write buffer coherency: ok
[    0.073666] Setting up static identity map for 0x80008200 - 0x80008258
[    0.077519] devtmpfs: initialized
[    0.093174] VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
[    0.094210] clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.097837] pinctrl core: initialized pinctrl subsystem
[    0.101264] NET: Registered protocol family 16
[    0.105157] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.108118] cpuidle: using governor menu
[    0.137763] hw-breakpoint: found 2 (+1 reserved) breakpoint and 1 watchpoint registers.
[    0.137919] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.138989] vf610-pinctrl 40048000.iomuxc: initialized IMX pinctrl driver
[    0.174491] SCSI subsystem initialized
[    0.175762] usbcore: registered new interface driver usbfs
[    0.176105] usbcore: registered new interface driver hub
[    0.176478] usbcore: registered new device driver usb
[    0.179128] i2c i2c-0: IMX I2C adapter registered
[    0.179415] i2c i2c-0: using dma0chan0 (tx) and dma0chan1 (rx) for DMA transfers
[    0.179894] Linux video capture interface: v2.00
[    0.180453] pps_core: LinuxPPS API ver. 1 registered
[    0.180544] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.180774] PTP clock support registered
[    0.182240] Advanced Linux Sound Architecture Driver Initialized.
[    0.185232] Switched to clocksource arm_global_timer
[    0.223890] NET: Registered protocol family 2
[    0.226465] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
[    0.226631] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.226744] TCP: Hash tables configured (established 1024 bind 1024)
[    0.227141] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.227273] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.227890] NET: Registered protocol family 1
[    0.228993] RPC: Registered named UNIX socket transport module.
[    0.229121] RPC: Registered udp transport module.
[    0.229190] RPC: Registered tcp transport module.
[    0.229252] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.234875] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.259703] NFS: Registering the id_resolver key type
[    0.259925] Key type id_resolver registered
[    0.260013] Key type id_legacy registered
[    0.260168] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.262003] ntfs: driver 2.1.32 [Flags: R/W].
[    0.263686] fuse init (API version 7.23)
[    0.272665] io scheduler noop registered
[    0.272800] io scheduler deadline registered
[    0.273025] io scheduler cfq registered (default)
[    0.284568] backlight supply power not found, using dummy regulator
[    0.306663] Console: switching to colour frame buffer device 80x30
[    0.318568] fb0: fb device registered successfully.
[    0.324027] fb1: fb device registered successfully.
[    0.329358] fb2: fb device registered successfully.
[    0.334407] fb3: fb device registered successfully.
[    0.339438] fb4: fb device registered successfully.
[    0.344143] fb5: fb device registered successfully.
[    0.349692] 40027000.serial: ttyLP0 at MMIO 0x40027000 (irq = 20, base_baud = 4125000) is a FSL_LPUART
[    0.894689] console [ttyLP0] enabled
[    0.903762] 40028000.serial: ttyLP1 at MMIO 0x40028000 (irq = 21, base_baud = 4125000) is a FSL_LPUART
[    0.922873] 40029000.serial: ttyLP2 at MMIO 0x40029000 (irq = 22, base_baud = 4125000) is a FSL_LPUART
[    0.961752] loop: module loaded
[    0.973019] nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xf1
[    0.983874] nand: Macronix NAND 128MiB 3,3V 8-bit
[    0.993009] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    1.009656] Bad block table found at page 65472, version 0x01
[    1.020289] Bad block table found at page 65408, version 0x01
[    1.030998] 4 cmdlinepart partitions found on MTD device vf610_nfc
[    1.041879] Creating 4 MTD partitions on "vf610_nfc":
[    1.051654] 0x000000000000-0x000000020000 : "vf-bcb"
[    1.062715] 0x000000020000-0x000000180000 : "u-boot"
[    1.073559] 0x000000180000-0x000000200000 : "u-boot-env"
[    1.084735] 0x000000200000-0x000008000000 : "ubi"
[    1.102282] 400d1000.ethernet supply phy not found, using dummy regulator
[    1.123935] libphy: fec_enet_mii_bus: probed
[    1.135101] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.147887] usbcore: registered new interface driver usb-storage
[    1.159979] usbcore: registered new interface driver usbserial
[    1.171122] usbcore: registered new interface driver usbserial_generic
[    1.182724] usbserial: USB Serial support registered for generic
[    1.193912] usbcore: registered new interface driver ftdi_sio
[    1.204717] usbserial: USB Serial support registered for FTDI USB Serial Device
[    1.221540] usbcore: registered new interface driver pl2303
[    1.232067] usbserial: USB Serial support registered for pl2303
[    1.252895] imx_usb 400b4000.usb: Can't register ci_hdrc platform device, err=-517
[    1.271955] mousedev: PS/2 mouse device common for all mice
[    1.284327] rtc-ds1307: probe of 0-0068 failed with error -5
[    1.296958] snvs_rtc 400a7034.snvs-rtc-lp: rtc core: registered 400a7034.snvs-rtc-l as rtc0
[    1.315370] i2c /dev entries driver
[    1.328192] imx2-wdt 4003e000.wdog: timeout 60 sec (nowayout=0)
[    1.339765] sdhci: Secure Digital Host Controller Interface driver
[    1.351087] sdhci: Copyright(c) Pierre Ossman
[    1.360675] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.372955] /soc/aips-bus@40080000/esdhc@400b2000: voltage-ranges unspecified
[    1.385812] sdhci-esdhc-imx 400b2000.esdhc: Got CD GPIO
[    1.396871] sdhci-esdhc-imx 400b2000.esdhc: No vmmc regulator found
[    1.408545] sdhci-esdhc-imx 400b2000.esdhc: No vqmmc regulator found
[    1.455367] mmc0: SDHCI controller on 400b2000.esdhc [400b2000.esdhc] using ADMA
[    1.478770] usbcore: registered new interface driver usbhid
[    1.490006] usbhid: USB HID core driver
[    1.500507] 4003b000.adc supply vref not found, using dummy regulator
[    1.517613] 400bb000.adc supply vref not found, using dummy regulator
[    1.534556] Netfilter messages via NETLINK v0.30.
[    1.546012] nfnl_acct: registering with nfnetlink.
[    1.556142] nf_conntrack version 0.5.0 (1868 buckets, 7472 max)
[    1.572515] nf_tables: (c) 2007-2009 Patrick McHardy <kaber@trash.net>
[    1.586430] ip_tables: (C) 2000-2006 Netfilter Core Team
[    1.599772] NET: Registered protocol family 10
[    1.613556] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    1.624325] sit: IPv6 over IPv4 tunneling driver
[    1.637185] NET: Registered protocol family 17
[    1.646985] bridge: automatic filtering via arp/ip/ip6tables has been deprecated. Update your scripts to load br_netfilter if you need this.
[    1.669933] Bridge firewalling registered
[    1.680590] 8021q: 802.1Q VLAN Support v1.8
[    1.692142] Key type dns_resolver registered
[    1.702005] Registering SWP/SWPB emulation handler
[    1.715193] registered taskstats version 1
[    1.730262] usbh_vbus: supplied by 5v0
[    1.744936] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    1.754998] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
[    1.785483] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    1.801830] hub 1-0:1.0: USB hub found
[    1.810607] hub 1-0:1.0: 1 port detected
[    1.823065] input: colibri-vf50-ts as /devices/platform/vf50_touchctrl/input/input0
[    1.842329] toradex,vf50_touchctrl vf50_touchctrl: Attached colibri-vf50-ts driver successfully
[    1.862105] ubi0: default fastmap pool size: 50
[    1.871770] ubi0: default fastmap WL pool size: 25
[    1.881478] ubi0: attaching mtd3
[    1.962475] ubi0: attached by fastmap
[    1.970933] ubi0: fastmap pool size: 50
[    1.979367] ubi0: fastmap WL pool size: 25
[    2.135517] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    2.298663] hub 1-1:1.0: USB hub found
[    2.307624] hub 1-1:1.0: 4 ports detected
[    2.433347] ubi0: scanning is finished
[    2.446548] ubi0: attached mtd3 (name "ubi", size 126 MiB)
[    2.456528] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    2.467905] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    2.479213] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    2.490787] ubi0: good PEBs: 1004, bad PEBs: 4, corrupted PEBs: 0
[    2.501544] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
[    2.518002] ubi0: max/mean erase counter: 185/19, WL threshold: 4096, image sequence number: 0
[    2.536247] ubi0: available PEBs: 0, total reserved PEBs: 1004, PEBs reserved for bad PEB handling: 16
[    2.556011] ubi0: background thread "ubi_bgt0d" started, PID 51
[    2.568689] snvs_rtc 400a7034.snvs-rtc-lp: setting system clock to 1970-01-01 00:00:01 UTC (1)
[    2.604265] ALSA device list:
[    2.612344]   No soundcards found.
[    2.645776] usb 1-1.3: new high-speed USB device number 3 using ci_hdrc
[    2.657942] UBIFS (ubi0:0): recovery needed
[    2.779547] usb-storage 1-1.3:1.0: USB Mass Storage device detected
[    2.799038] scsi host0: usb-storage 1-1.3:1.0
[    2.847326] UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (255 but expected 3)
[    2.866839] UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB 981:70368, LEB mapping status 1
[    2.887961] Not a node, first 24 bytes:
[    2.891864] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................
[    2.922636] CPU: 0 PID: 1 Comm: swapper Not tainted 4.1.2-00312-g796aee8 #4
[    2.935771] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[    2.948373] Backtrace:
[    2.956951] [<80012ab8>] (dump_backtrace) from [<80012cd8>] (show_stack+0x18/0x1c)
[    2.976494]  r7:00000000 r6:00000000 r5:000003d5 r4:000112e0
[    2.988441] [<80012cc0>] (show_stack) from [<805982a8>] (dump_stack+0x24/0x28)
[    3.007490] [<80598284>] (dump_stack) from [<8022e45c>] (ubifs_read_node+0x294/0x310)
[    3.027250] [<8022e1c8>] (ubifs_read_node) from [<8022e580>] (ubifs_read_node_wbuf+0xa8/0x2fc)
[    3.047959]  r10:000003d5 r9:00000049 r8:87bfbc00 r7:00000003 r6:87b54000 r5:87bc3f20
[    3.068618]  r4:000112e0
[    3.077490] [<8022e4d8>] (ubifs_read_node_wbuf) from [<8024bc10>] (ubifs_tnc_read_node+0x50/0x140)
[    3.099047]  r10:85c05700 r9:87bfbc00 r8:85c05700 r7:00000003 r6:87bfbc00 r5:87b54000
[    3.119822]  r4:85c05730
[    3.128608] [<8024bbc0>] (ubifs_tnc_read_node) from [<8022f4b0>] (tnc_read_node_nm+0xcc/0x1e4)
[    3.149628]  r8:85c05700 r7:87b541c0 r6:87b54000 r5:87bfbc00 r4:85c05730
[    3.163055] [<8022f3e4>] (tnc_read_node_nm) from [<80232ff8>] (ubifs_tnc_next_ent+0x140/0x1a4)
[    3.184179]  r7:87b541c0 r6:87b54000 r5:87849c38 r4:00000030
[    3.196516] [<80232eb8>] (ubifs_tnc_next_ent) from [<80233110>] (ubifs_tnc_remove_ino+0xb4/0x144)
[    3.217959]  r10:87b54000 r9:00006961 r8:ffffffff r7:00000000 r6:000003d5 r5:87b54000
[    3.238613]  r4:87bddf60
[    3.247434] [<8023305c>] (ubifs_tnc_remove_ino) from [<80235cdc>] (ubifs_replay_journal+0xe9c/0x1490)
[    3.269059]  r10:87b54000 r9:87849d08 r8:87bddf40 r7:87b54930 r6:000003d5 r5:00000000
[    3.289546]  r4:87bddf60
[    3.298171] [<80234e40>] (ubifs_replay_journal) from [<8022a890>] (ubifs_mount+0x10f8/0x1740)
[    3.318665]  r10:87b54190 r9:00000000 r8:0001e5a0 r7:87bd0400 r6:87b54000 r5:00000000
[    3.339106]  r4:00000000
[    3.347742] [<80229798>] (ubifs_mount) from [<800c5064>] (mount_fs+0x1c/0xac)
[    3.361078]  r10:00008001 r9:00000060 r8:807b3428 r7:807b3428 r6:00008001 r5:87bc2d00
[    3.381290]  r4:87b086c0
[    3.389932] [<800c5048>] (mount_fs) from [<800dc2b8>] (vfs_kern_mount+0x50/0xfc)
[    3.409213]  r8:00000000 r7:807b3428 r6:00008001 r5:87bc2d00 r4:87b086c0
[    3.422307] [<800dc268>] (vfs_kern_mount) from [<800def84>] (do_mount+0x19c/0x9b4)
[    3.441758]  r9:00000060 r8:87bc2cc0 r7:87bc2d00 r6:807ab698 r5:00000000 r4:807b3428
[    3.461842] [<800dede8>] (do_mount) from [<800dfad8>] (SyS_mount+0x7c/0xa8)
[    3.475003]  r10:87b9b000 r9:807982e8 r8:00008001 r7:806c98b0 r6:00000000 r5:87bc2d00
[    3.495279]  r4:87bc2cc0
[    3.503823] [<800dfa5c>] (SyS_mount) from [<8076d1f4>] (mount_block_root+0x144/0x270)
[    3.523579]  r8:87de9360 r7:87b9b000 r6:807982d8 r5:87b9b000 r4:00008001
[    3.536745] [<8076d0b0>] (mount_block_root) from [<8076d4e8>] (prepare_namespace+0xb0/0x1a4)
[    3.557450]  r10:807982b4 r9:8076c5ec r8:00000097 r7:807d4500 r6:807d4500 r5:807982e8
[    3.577758]  r4:807982d8
[    3.586342] [<8076d438>] (prepare_namespace) from [<8076ce9c>] (kernel_init_freeable+0x1bc/0x1d0)
[    3.607503]  r5:00000008 r4:807a0c60
[    3.617295] [<8076cce0>] (kernel_init_freeable) from [<805959b0>] (kernel_init+0x18/0xf0)
[    3.637662]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80595998
[    3.658098]  r4:807d4500
[    3.666783] [<80595998>] (kernel_init) from [<8000f668>] (ret_from_fork+0x14/0x2c)
[    3.686456]  r5:80595998 r4:00000000
[    3.698481] List of all partitions:
[    3.707956] No filesystem could mount root, tried:  ubifs
[    3.719340] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    3.738887] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

>
> P.s: Why are you writing me privately?
>
> Thanks,
> //richard

Best regards,
Bhuvan
