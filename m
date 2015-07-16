Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFdht-0007ju-Gv
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2015 07:35:53 +0000
Received: by pdjr16 with SMTP id r16so39855981pdj.3
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2015 00:35:28 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: Fwd: Re: UBIFS errors when file-system is full
References: <55A74812.2020906@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: richard@nod.at
Message-ID: <55A75EBC.7020109@gmail.com>
Date: Thu, 16 Jul 2015 13:05:24 +0530
MIME-Version: 1.0
In-Reply-To: <55A74812.2020906@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-------- Forwarded Message --------

Subject: 	

Re: UBIFS errors when file-system is full

Date: 	

Thu, 16 Jul 2015 11:28:42 +0530

From: 	

Bhuvanchandra DV <bhuvanchandra.dv@gmail.com>

To: 	

Richard Weinberger <richard@nod.at>

On 07/14/2015 04:36 PM, Richard Weinberger wrote:

> Am 14.07.2015 um 12:08 schrieb Bhuvanchandra DV:
>> On 07/14/2015 02:12 PM, Richard Weinberger wrote:
>>
>>> Am 14.07.2015 um 10:29 schrieb Bhuvanchandra DV:
>>>> On 07/14/2015 12:02 PM, Richard Weinberger wrote:
>>>>
>>>>> Am 14.07.2015 um 08:30 schrieb Bhuvanchandra DV:
>>>>>> Reproduced the issue with a clean UBI image.
>>>>> On 4.1?
>>>>> How can you reproduce?
>>>> Flashed a clean UBI image with 4.1.
>>>> I can reproduce it by amost filling up the flash and doing a power resets for around ~200 cycles.
>>> And it really happens only if you're filling up the UBIFS?
>> The only thing observed so far during this tests is when the journactl log starts filling up the flash
>> memory and at some point of time fails to mount the ubifs.
> You mean filling up the filesystem? How and when does the power cut happen?
>
>> Flashed an Image which occupies less flash ~40-50%. Run the same tests for around 1200 power cycles
>> no issues observed during mounting but still there are few error messages:
>> ..
>> [    6.879643] ubi0 error: __wl_get_peb: no free eraseblocks
> This message cannot come from a recent kernel.
>
>> So came to an assumption that filling the flash to max lead to this issue.
>>
>> Could there be any other possibility for this issue apart from filling up the flash ?
>>
>>> If you set the UBI module parameter "fm_debug", does the EBA selfcheck trigger?
>> Yes, EBA selfcheck got triggered. Atleast i could see the debug printks added
>> in 'self_check_eba' method after setting the fm_debug parameter.
>>
>>>> During some point U-Boot cannot mount the ubifs partition and fails with:
>>>> "Error reading superblock on volume 'ubi0:rootfs' errno=-22!"
>>> How exactly is U-Boot involved? Does U-Boot touch UBI in any way?
>> kernel, device tree blobs are available in rootfs /boot. U-Boot mounts the ubi partition
>> and loads the kernel and device tree blob.
>>
>> Also U-Boot is involved during flashing the UBI image to flash.
> In you last mail you wrote
> "During some point U-Boot cannot mount the ubifs partition and fails with"..
>
> So, please reproduce from scratch(!) with a recent kernel (4.1 or newer) and provide all needed infos.
> Otherwise I see no way howto help you.
>
> Thanks,
> //richard
>
Power cut test with 4.1.2 kernel:

Preparing UBI image using mkfs.ubifs utility:

$ mkfs.ubifs -c 8112 -e 124KiB -m 2KiB -o ubifs.img -r rootfs/ -v


Flashing UBI image from U-Boot:

# fatload ${interface} 0:1 ${loadaddr} ubifs.img
reading ubifs.img
108691456 bytes read in 7139 ms (14.5 MiB/s)
# ubi part ubi && ubi check rootfs || ubi create rootfs
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
UBI: good PEBs: 1003, bad PEBs: 5, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 14/4, WL threshold: 4096, image sequence number: 0
UBI: available PEBs: 0, total reserved PEBs: 1003, PEBs reserved for bad PEB handling: 15
# ubi write ${loadaddr} rootfs ${filesize}
108691456 bytes written to volume rootfs

With 4.1.2 kernel after ~600 power cut cycles, no issues with mounting the ubifs,
but observed few stack traces.

Debug logs:

U-Boot 2015.04 (May 18 2015 - 15:37:34)

CPU: Freescale Vybrid VF500 at 396 MHz
Reset cause: POWER ON RESET
DRAM:  128 MiB
NAND:  128 MiB
MMC:   FSL_SDHC: 0
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Model: Toradex Colibri VF50 128MB V38.655341, Serial# 04833251
Net:   FEC
Hit any key to stop autoboot:  1  0
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
UBI: max/mean erase counter: 115/17, WL threshold: 4096, image sequence number: 0
UBI: available PEBs: 0, total reserved PEBs: 1004, PEBs reserved for bad PEB handling: 16
Loading file '/boot/zImage' to addr 0x82000000 with size 4433808 (0x0043a790)...
Done
Loading file '/boot/vf500-colibri-eval-v3.dtb' to addr 0x84000000 with size 21126 (0x00005286)...
Done
Kernel image @ 0x82000000 [ 0x000000 - 0x43a790 ]
## Flattened Device Tree blob at 84000000
    Booting using the fdt blob at 0x84000000
    Loading Device Tree to 876ff000, end 87707285 ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.1.2-00312-g796aee8 (dvb@dev) (gcc version 4.9.3 20141031 (prerelease) (Linaro GCC 2014.11) ) #4 Tue Jul 14 18:02:37 IST 2015
[    0.000000] CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] Machine model: Toradex Colibri VF50 on Colibri Evaluation Board
[    0.000000] cma: Reserved 16 MiB at 0x86400000
[    0.000000] Memory policy: Data cache writeback
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32004
[    0.000000] Kernel command line: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs ubi.fm_autoconvert=1 mtdparts=vf610_nfc:128k(vf-bcb)ro,1408k(u-boot)ro,512k(u-boot-env),-(ubi) console=tty1 console=ttyLP0,115200n8 consoleblank=0
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 103168K/129024K available (5719K kernel code, 201K rwdata, 1844K rodata, 216K init, 171K bss, 9472K reserved, 16384K cma-reserved)
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
[    0.000121] clocksource arm_global_timer: mask: 0xffffffffffffffff max_cycles: 0x1e7178659b, max_idle_ns: 440795204301 ns
[    0.000839] Console: colour dummy device 80x30
[    0.002013] console [tty1] enabled
[    0.002110] Calibrating delay loop... 262.96 BogoMIPS (lpj=1314816)
[    0.070301] pid_max: default: 32768 minimum: 301
[    0.070658] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.070770] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.072712] CPU: Testing write buffer coherency: ok
[    0.073658] Setting up static identity map for 0x80008200 - 0x80008258
[    0.077525] devtmpfs: initialized
[    0.093135] VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
[    0.094188] clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.097801] pinctrl core: initialized pinctrl subsystem
[    0.101219] NET: Registered protocol family 16
[    0.105104] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.108068] cpuidle: using governor menu
[    0.137632] hw-breakpoint: found 2 (+1 reserved) breakpoint and 1 watchpoint registers.
[    0.137788] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.138850] vf610-pinctrl 40048000.iomuxc: initialized IMX pinctrl driver
[    0.174198] SCSI subsystem initialized
[    0.175455] usbcore: registered new interface driver usbfs
[    0.175794] usbcore: registered new interface driver hub
[    0.176170] usbcore: registered new device driver usb
[    0.178816] i2c i2c-0: IMX I2C adapter registered
[    0.179100] i2c i2c-0: using dma0chan0 (tx) and dma0chan1 (rx) for DMA transfers
[    0.179575] Linux video capture interface: v2.00
[    0.180005] pps_core: LinuxPPS API ver. 1 registered
[    0.180089] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.180439] PTP clock support registered
[    0.181919] Advanced Linux Sound Architecture Driver Initialized.
[    0.184905] Switched to clocksource arm_global_timer
[    0.223577] NET: Registered protocol family 2
[    0.226136] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
[    0.226299] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.226412] TCP: Hash tables configured (established 1024 bind 1024)
[    0.226809] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.226943] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.227550] NET: Registered protocol family 1
[    0.228636] RPC: Registered named UNIX socket transport module.
[    0.228762] RPC: Registered udp transport module.
[    0.228832] RPC: Registered tcp transport module.
[    0.228895] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.234529] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.259291] NFS: Registering the id_resolver key type
[    0.259517] Key type id_resolver registered
[    0.259604] Key type id_legacy registered
[    0.259755] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.261592] ntfs: driver 2.1.32 [Flags: R/W].
[    0.263267] fuse init (API version 7.23)
[    0.272288] io scheduler noop registered
[    0.272427] io scheduler deadline registered
[    0.272651] io scheduler cfq registered (default)
[    0.284169] backlight supply power not found, using dummy regulator
[    0.306254] Console: switching to colour frame buffer device 80x30
[    0.318141] fb0: fb device registered successfully.
[    0.323589] fb1: fb device registered successfully.
[    0.328902] fb2: fb device registered successfully.
[    0.333947] fb3: fb device registered successfully.
[    0.338955] fb4: fb device registered successfully.
[    0.343640] fb5: fb device registered successfully.
[    0.349178] 40027000.serial: ttyLP0 at MMIO 0x40027000 (irq = 20, base_baud = 4125000) is a FSL_LPUART
[    0.892838] console [ttyLP0] enabled
[    0.901914] 40028000.serial: ttyLP1 at MMIO 0x40028000 (irq = 21, base_baud = 4125000) is a FSL_LPUART
[    0.921023] 40029000.serial: ttyLP2 at MMIO 0x40029000 (irq = 22, base_baud = 4125000) is a FSL_LPUART
[    0.959833] loop: module loaded
[    0.971087] nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xf1
[    0.981940] nand: Macronix NAND 128MiB 3,3V 8-bit
[    0.991078] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    1.007717] Bad block table found at page 65472, version 0x01
[    1.018356] Bad block table found at page 65408, version 0x01
[    1.029057] 4 cmdlinepart partitions found on MTD device vf610_nfc
[    1.039930] Creating 4 MTD partitions on "vf610_nfc":
[    1.049703] 0x000000000000-0x000000020000 : "vf-bcb"
[    1.060727] 0x000000020000-0x000000180000 : "u-boot"
[    1.071572] 0x000000180000-0x000000200000 : "u-boot-env"
[    1.082758] 0x000000200000-0x000008000000 : "ubi"
[    1.100289] 400d1000.ethernet supply phy not found, using dummy regulator
[    1.122026] libphy: fec_enet_mii_bus: probed
[    1.133190] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.146042] usbcore: registered new interface driver usb-storage
[    1.158133] usbcore: registered new interface driver usbserial
[    1.169262] usbcore: registered new interface driver usbserial_generic
[    1.180859] usbserial: USB Serial support registered for generic
[    1.192041] usbcore: registered new interface driver ftdi_sio
[    1.202848] usbserial: USB Serial support registered for FTDI USB Serial Device
[    1.219659] usbcore: registered new interface driver pl2303
[    1.230175] usbserial: USB Serial support registered for pl2303
[    1.250842] imx_usb 400b4000.usb: Can't register ci_hdrc platform device, err=-517
[    1.269902] mousedev: PS/2 mouse device common for all mice
[    1.282256] rtc-ds1307: probe of 0-0068 failed with error -5
[    1.294713] snvs_rtc 400a7034.snvs-rtc-lp: rtc core: registered 400a7034.snvs-rtc-l as rtc0
[    1.313066] i2c /dev entries driver
[    1.325910] imx2-wdt 4003e000.wdog: timeout 60 sec (nowayout=0)
[    1.337470] sdhci: Secure Digital Host Controller Interface driver
[    1.348776] sdhci: Copyright(c) Pierre Ossman
[    1.358357] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.370640] /soc/aips-bus@40080000/esdhc@400b2000: voltage-ranges unspecified
[    1.383491] sdhci-esdhc-imx 400b2000.esdhc: Got CD GPIO
[    1.394551] sdhci-esdhc-imx 400b2000.esdhc: No vmmc regulator found
[    1.406232] sdhci-esdhc-imx 400b2000.esdhc: No vqmmc regulator found
[    1.455030] mmc0: SDHCI controller on 400b2000.esdhc [400b2000.esdhc] using ADMA
[    1.478433] usbcore: registered new interface driver usbhid
[    1.489668] usbhid: USB HID core driver
[    1.500167] 4003b000.adc supply vref not found, using dummy regulator
[    1.517255] 400bb000.adc supply vref not found, using dummy regulator
[    1.534193] Netfilter messages via NETLINK v0.30.
[    1.545659] nfnl_acct: registering with nfnetlink.
[    1.555779] nf_conntrack version 0.5.0 (1868 buckets, 7472 max)
[    1.572189] nf_tables: (c) 2007-2009 Patrick McHardy <kaber@trash.net>
[    1.586113] ip_tables: (C) 2000-2006 Netfilter Core Team
[    1.599463] NET: Registered protocol family 10
[    1.613218] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    1.623982] sit: IPv6 over IPv4 tunneling driver
[    1.636845] NET: Registered protocol family 17
[    1.646637] bridge: automatic filtering via arp/ip/ip6tables has been deprecated. Update your scripts to load br_netfilter if you need this.
[    1.669574] Bridge firewalling registered
[    1.680245] 8021q: 802.1Q VLAN Support v1.8
[    1.691818] Key type dns_resolver registered
[    1.701660] Registering SWP/SWPB emulation handler
[    1.714822] registered taskstats version 1
[    1.731301] usbh_vbus: supplied by 5v0
[    1.744627] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    1.755851] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
[    1.785043] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    1.798152] hub 1-0:1.0: USB hub found
[    1.806943] hub 1-0:1.0: 1 port detected
[    1.819450] input: colibri-vf50-ts as /devices/platform/vf50_touchctrl/input/input0
[    1.839751] toradex,vf50_touchctrl vf50_touchctrl: Attached colibri-vf50-ts driver successfully
[    1.859364] ubi0: default fastmap pool size: 50
[    1.868992] ubi0: default fastmap WL pool size: 25
[    1.878648] ubi0: attaching mtd3
[    1.944886] ubi0: attached by fastmap
[    1.953386] ubi0: fastmap pool size: 50
[    1.961818] ubi0: fastmap WL pool size: 25
[    1.981616] ubi0: attached mtd3 (name "ubi", size 126 MiB)
[    1.991835] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    2.003327] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    2.014674] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    2.026229] ubi0: good PEBs: 1004, bad PEBs: 4, corrupted PEBs: 0
[    2.036951] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
[    2.053305] ubi0: max/mean erase counter: 115/11, WL threshold: 4096, image sequence number: 0
[    2.071614] ubi0: available PEBs: 0, total reserved PEBs: 1004, PEBs reserved for bad PEB handling: 16
[    2.091286] ubi0: background thread "ubi_bgt0d" started, PID 50
[    2.103973] snvs_rtc 400a7034.snvs-rtc-lp: setting system clock to 1970-01-01 00:12:04 UTC (724)
[    2.139189] ALSA device list:
[    2.147659]   No soundcards found.
[    2.186556] UBIFS (ubi0:0): recovery needed
[    2.215265] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    2.378103] hub 1-1:1.0: USB hub found
[    2.387452] hub 1-1:1.0: 4 ports detected
[    2.552203] UBIFS (ubi0:0): recovery deferred
[    2.561990] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs", R/O mode
[    2.580664] UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    2.601698] UBIFS (ubi0:0): FS size: 123293696 bytes (117 MiB, 971 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
[    2.623697] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
[    2.635373] UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID 8CD1C68E-FE03-420D-A522-9D1348A77201, small LPT model
[    2.659795] VFS: Mounted root (ubifs filesystem) readonly on device 0:14.
[    2.673917] devtmpfs: mounted
[    2.684499] Freeing unused kernel memory: 216K (8076c000 - 807a2000)
[    2.735477] usb 1-1.1: new high-speed USB device number 3 using ci_hdrc
[    2.860342] usb-storage 1-1.1:1.0: USB Mass Storage device detected
[    2.881163] scsi host0: usb-storage 1-1.1:1.0
[    3.047468] random: systemd urandom read with 35 bits of entropy available
[    3.091951] systemd[1]: systemd 218 running in system mode. (+PAM -AUDIT -SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP -GCRYPT +GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD +IDN)
[    3.130741] systemd[1]: Detected architecture 'arm'.

Welcome to The Ångström Distribution v2014.12!

[    3.167766] systemd[1]: Set hostname to <colibri-vf>.
[    3.689001] systemd[1]: Unit type .busname is not supported on this system.
[    3.897008] scsi 0:0:0:0: Direct-Access     Generic  Flash-Disk       1.05 PQ: 0 ANSI: 2
[    4.306965] systemd[1]: Cannot add dependency job for unit bootmisc.service, ignoring: Unit bootmisc.service is masked.
[    4.330580] systemd[1]: Cannot add dependency job for unit banner.service, ignoring: Unit banner.service is masked.
[    4.353712] systemd[1]: Cannot add dependency job for unit mountall.service, ignoring: Unit mountall.service is masked.
[    4.378435] systemd[1]: Cannot add dependency job for unit populate-volatile.service, ignoring: Unit populate-volatile.service is masked.
[    4.404195] systemd[1]: Cannot add dependency job for unit read-only-rootfs-hook.service, ignoring: Unit read-only-rootfs-hook.service is masked.
[    4.430216] systemd[1]: Cannot add dependency job for unit sysfs.service, ignoring: Unit sysfs.service is masked.
[    4.453515] systemd[1]: Cannot add dependency job for unit devpts.service, ignoring: Unit devpts.service is masked.
[    4.477877] systemd[1]: Cannot add dependency job for unit checkroot.service, ignoring: Unit checkroot.service is masked.
[    4.502421] systemd[1]: Cannot add dependency job for unit dmesg.service, ignoring: Unit dmesg.service is masked.
[    4.526224] systemd[1]: Cannot add dependency job for unit hostname.service, ignoring: Unit hostname.service is masked.
[    4.550765] systemd[1]: Cannot add dependency job for unit urandom.service, ignoring: Unit urandom.service is masked.
[    4.576608] systemd[1]: Cannot add dependency job for unit rmnologin.service, ignoring: Unit rmnologin.service is masked.
[    4.602803] systemd[1]: Cannot add dependency job for unit mountnfs.service, ignoring: Unit mountnfs.service is masked.
[    4.628138] systemd[1]: Cannot add dependency job for unit mountnfs.service, ignoring: Unit mountnfs.service is masked.
[    4.653227] systemd[1]: Cannot add dependency job for unit rmnologin.service, ignoring: Unit rmnologin.service is masked.
[    4.694217] systemd[1]: Starting Forward Password Requests to Wall Directory Watch.
[    4.718176] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    4.740225] systemd[1]: Expecting device dev-ttyLP0.device...
          Expecting device dev-ttyLP0.device...
[    4.775606] systemd[1]: Starting Root Slice.
[  OK  ] Created slice Root Slice.
[    4.805520] systemd[1]: Created slice Root Slice.
[    4.817591] systemd[1]: Starting System Slice.
[  OK  ] Created slice System Slice.
[    4.845485] systemd[1]: Created slice System Slice.
[    4.857452] systemd[1]: Starting system-getty.slice.
[  OK  ] Created slice system-getty.slice.
[    4.885514] systemd[1]: Created slice system-getty.slice.
[    4.897628] systemd[1]: Starting User and Session Slice.
[  OK  ] Created slice User and Session Slice.
[    4.925523] systemd[1]: Created slice User and Session Slice.
[    4.937782] systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[    4.975502] systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
[    4.988870] systemd[1]: Starting Delayed Shutdown Socket.
[  OK  ] Listening on Delayed Shutdown Socket.
[    5.025521] systemd[1]: Listening on Delayed Shutdown Socket.
[    5.037429] systemd[1]: Starting system-serial\x2dgetty.slice.
[  OK  ] Created slice system-serial\x2dgetty.slice.
[    5.065506] systemd[1]: Created slice system-serial\x2dgetty.slice.
[    5.077871] systemd[1]: Starting Dispatch Password Requests to Console Directory Watch.
[    5.097329] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    5.117637] systemd[1]: Starting Journal Socket (/dev/log).
[    5.129572] sd 0:0:0:0: [sda] 7761920 512-byte logical blocks: (3.97 GB/3.70 GiB)
[  OK  ] Listening on J[    5.150472] sd 0:0:0:0: [sda] Write Protect is off
ournal Socket (/dev/log).
[    5.163099] sd 0:0:0:0: [sda] No Caching mode page found
[    5.173454] sd 0:0:0:0: [sda] Assuming drive cache: write through
[    5.185085] systemd[1]: Listening on Journal Socket (/dev/log).
[    5.198892] systemd[1]: Expecting device dev-ttyGS0.device...
          Expecting device dev-ttyGS0.device...
[    5.217790]  sda: sda1
[    5.232267] sd 0:0:0:0: [sda] Attached SCSI removable disk
[    5.243642] systemd[1]: Starting Journal Socket.
[  OK  ] Listening on Journal Socket.
[    5.275646] systemd[1]: Listening on Journal Socket.
[    5.286378] systemd[1]: Starting (null)...
          Starting        ..
[    5.343585] systemd[1]: Started Load Kernel Modules.
[    5.358896] systemd[1]: Starting Apply Kernel Variab         Startingriables.ernel Variables...
[    5.396219] systemd[1]: Mounting FUSE Control File Sys         Mounting FUSE Control File System...
[    5.454009] systemd[1]: Mounting Configuration File System...
          Mounting Configuration File System...
[    5.546855] systemd[1]: Started Create list of required static device nodes for the current kernel.
[    5.590853] systemd[1]: Starting udev Control Socket.
[  OK  ] Listening on udev Control Socket.
[    5.621530] systemd[1]: Listening on udev Control Socket.
[    5.646880] systemd[1]: Mounted POSIX Message Queue File System.
[    5.674078] systemd[1]: Mounted Huge Pages File System.
[    5.847231] systemd[1]: Listening on Journal Audit Socket.
[    5.860268] systemd[1]: Starting Journal Service...
          Starting Journal Service...
[    5.901190] systemd[1]: Starting udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[    5.945608] systemd[1]: Listening on udev Kernel Socket.
[    5.960923] systemd[1]: Starting udev Coldplug all Devices...
          Starting udev Coldplug all Devices...
[    6.000942] systemd[1]: Starting Paths.
[  OK  ] Reached target Paths.
[    6.065500] systemd[1]: Reached target Paths.
[    6.086043] systemd[1]: Mounting Temporary Directory...
          Mounting Temporary Directory...
[    6.120796] systemd[1]: Starting Slices.
[  OK  ] Reached target Slices.
[    6.168419] systemd[1]: Reached target Slices.
[    6.184476] systemd[1]: Starting File System Check on Root Device...
          Starting File System Check on Root Device...
[    6.231118] systemd[1]: Starting Swap.
[  OK  ] Reached target Swap.
[    6.278976] systemd[1]: Reached target Swap.
[  OK  ] Mounted FUSE Control File System.
[    6.338579] systemd[1]: Mounted FUSE Control File System.
[  OK  ] Mounted Configuration File System.
[    6.385515] systemd[1]: Mounted Configuration File System.
[  OK  ] Mounted Temporary Directory.
[    6.435501] systemd[1]: Mounted Temporary Directory.
[  OK  ] Started (null).
[    6.515669] systemd[1]: Started (null).
[  OK  ] Started Apply Kernel Variables.
[    6.555838] systemd[1]: Started Apply Kernel Variables.
[  OK  ] Started File System Check on Root Device.
[    6.665743] systemd[1]: Started File System Check on Root Device.
[  OK  ] Started Journal Service.
[    7.085522] systemd[1]: Started Journal Service.
[  OK  ] Started udev Coldplug all Devices.
          Starting Remount Root and Kernel File Systems...
[    7.669256] UBIFS (ubi0:0): completing deferred recovery
[    7.989718] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 93
[    8.201567] random: nonblocking pool is initialized
[    8.440773] UBIFS error (ubi0:0 pid 89): ubifs_check_node: bad CRC: calculated 0x3e594a6c, read 0xfd9c1779
[    8.458517] UBIFS error (ubi0:0 pid 89): ubifs_check_node: bad node at LEB 957:1920
[    8.474556] 	magic          0x6101831
[    8.482579] 	crc            0xfd9c1779
[    8.490614] 	node_type      9 (indexing node)
[    8.499268] 	group_type     0 (no node group)
[    8.507927] 	sqnum          427384
[    8.515589] 	len            188
[    8.522902] 	child_cnt      8
[    8.530025] 	level          0
[    8.537043] 	Branches:
[    8.543287] 	0: LEB 902:4800 len 92 key (23325, data, 882)
[    8.552944] 	1: LEB 902:4896 len 92 key (23325, data, 883)
[    8.562534] 	2: LEB 902:4992 len 92 key (23325, data, 884)
[    8.572039] 	3: LEB 902:5088 len 92 key (23325, data, 885)
[    8.581477] 	4: LEB 902:5184 len 92 key (23325, data, 886)
[    8.590856] 	5: LEB 101718065:817737798 len 427374 key (0, inode)
[    8.600949] 	6: LEB 9:8 len 891 key (124792, inode)
[    8.609820] CPU: 0 PID: 89 Comm: mount Not tainted 4.1.2-00312-g796aee8 #4
[    8.620843] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[    8.631473] Backtrace:
[    8.638159] [<80012ab8>] (dump_backtrace) from [<80012cd8>] (show_stack+0x18/0x1c)
[    8.653694]  r7:881d4780 r6:87b53000 r5:00000780 r4:ffffff8b
[    8.664070] [<80012cc0>] (show_stack) from [<805982a8>] (dump_stack+0x24/0x28)
[    8.679119] [<80598284>] (dump_stack) from [<8022cddc>] (ubifs_check_node+0x1b8/0x2e4)
[    8.695402] [<8022cc24>] (ubifs_check_node) from [<80234340>] (ubifs_scan_a_node+0xcc/0x1e4)
[    8.712845]  r9:000003bd r8:00000000 r7:87b53000 r6:000003bd r5:87b53000 r4:881d4780
[    8.730997] [<80234274>] (ubifs_scan_a_node) from [<80234838>] (ubifs_scan+0x60/0x39c)
[    8.749411]  r6:881d4780 r5:00000780 r4:0001e880
[    8.760074] [<802347d8>] (ubifs_scan) from [<8023e0d0>] (ubifs_tnc_start_commit+0x6b8/0xab8)
[    8.779783]  r10:ffffffe4 r9:000000f5 r8:00000000 r7:87b53000 r6:0001f000 r5:00000001
[    8.800496]  r4:000003bd
[    8.809485] [<8023da18>] (ubifs_tnc_start_commit) from [<80237ac4>] (do_commit+0x140/0x4dc)
[    8.830491]  r10:00008020 r9:00000020 r8:87b4ed44 r7:00000003 r6:87b53130 r5:00000000
[    8.851929]  r4:87b53000
[    8.861020] [<80237984>] (do_commit) from [<80238060>] (ubifs_run_commit+0x74/0xb4)
[    8.881320]  r8:00000000 r7:87b537a8 r6:87b4ec00 r5:87b531a4 r4:87b53000
[    8.895426] [<80237fec>] (ubifs_run_commit) from [<80246d88>] (ubifs_rcvry_gc_commit+0x7c/0x1ec)
[    8.916989]  r5:87b537ec r4:87b53000
[    8.927248] [<80246d0c>] (ubifs_rcvry_gc_commit) from [<80228e28>] (ubifs_remount_fs+0x440/0x744)
[    8.948618]  r7:87b537a8 r6:00000000 r5:87b537ec r4:87b53000
[    8.961318] [<802289e8>] (ubifs_remount_fs) from [<800c4cbc>] (do_remount_sb+0x6c/0x1c4)
[    8.981687]  r9:00000020 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:87b47c00
[    9.002500] [<800c4c50>] (do_remount_sb) from [<800df390>] (do_mount+0x5a8/0x9b4)
[    9.022463]  r8:87b47c00 r7:87b47c40 r6:00000000 r5:00000000 r4:87b086d0
[    9.036416] [<800dede8>] (do_mount) from [<800dfad8>] (SyS_mount+0x7c/0xa8)
[    9.049829]  r10:00000000 r9:85cce000 r8:c0ed8020 r7:008ed1e8 r6:00000000 r5:85c5ee40
[    9.070954]  r4:85c5ef00
[    9.079921] [<800dfa5c>] (SyS_mount) from [<8000f5c0>] (ret_fast_syscall+0x0/0x3c)
[    9.099814]  r8:8000f764 r7:00000015 r6:00000000 r5:008ed158 r4:00000000
[    9.113569] UBIFS error (ubi0:0 pid 89): ubifs_scan: bad node
[    9.125801] UBIFS error (ubi0:0 pid 89): ubifs_scanned_corruption: corruption at LEB 957:1920
[    9.146679] UBIFS error (ubi0:0 pid 89): ubifs_scanned_corruption: first 8192 bytes from LEB 957:1920
[    9.179238] UBIFS error (ubi0:0 pid 89): ubifs_scan: LEB 957 scanning failed
[    9.192828] UBIFS error (ubi0:0 pid 89): do_commit: commit failed, error -117
[    9.206460] UBIFS warning (ubi0:0 pid 89): ubifs_ro_mode: switched to read-only mode, error -117
[    9.227664] CPU: 0 PID: 89 Comm: mount Not tainted 4.1.2-00312-g796aee8 #4
[    9.241015] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[    9.253900] Backtrace:
[    9.262769] [<80012ab8>] (dump_backtrace) from [<80012cd8>] (show_stack+0x18/0x1c)
[    9.282622]  r7:00000003 r6:87b53130 r5:00000010 r4:85d18980
[    9.295256] [<80012cc0>] (show_stack) from [<805982a8>] (dump_stack+0x24/0x28)
[    9.314631] [<80598284>] (dump_stack) from [<8022c50c>] (ubifs_ro_mode.part.9+0x7c/0x84)
[    9.335027] [<8022c490>] (ubifs_ro_mode.part.9) from [<8022c624>] (ubifs_ro_mode+0x1c/0x20)
[    9.355855]  r5:ffffff8b r4:87b53000
[    9.366062] [<8022c608>] (ubifs_ro_mode) from [<80237e50>] (do_commit+0x4cc/0x4dc)
[    9.386052] [<80237984>] (do_commit) from [<80238060>] (ubifs_run_commit+0x74/0xb4)
[    9.406342]  r8:00000000 r7:87b537a8 r6:87b4ec00 r5:87b531a4 r4:87b53000
[    9.420346] [<80237fec>] (ubifs_run_commit) from [<80246d88>] (ubifs_rcvry_gc_commit+0x7c/0x1ec)
[    9.441865]  r5:87b537ec r4:87b53000
[    9.452097] [<80246d0c>] (ubifs_rcvry_gc_commit) from [<80228e28>] (ubifs_remount_fs+0x440/0x744)
[    9.473678]  r7:87b537a8 r6:00000000 r5:87b537ec r4:87b53000
[    9.486526] [<802289e8>] (ubifs_remount_fs) from [<800c4cbc>] (do_remount_sb+0x6c/0x1c4)
[    9.507262]  r9:00000020 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:87b47c00
[    9.528476] [<800c4c50>] (do_remount_sb) from [<800df390>] (do_mount+0x5a8/0x9b4)
[    9.548833]  r8:87b47c00 r7:87b47c40 r6:00000000 r5:00000000 r4:87b086d0
[    9.562946] [<800dede8>] (do_mount) from [<800dfad8>] (SyS_mount+0x7c/0xa8)
[    9.576599]  r10:00000000 r9:85cce000 r8:c0ed8020 r7:008ed1e8 r6:00000000 r5:85c5ee40
[    9.597950]  r4:85c5ef00
[    9.606978] [<800dfa5c>] (SyS_mount) from [<8000f5c0>] (ret_fast_syscall+0x0/0x3c)
[    9.627131]  r8:8000f764 r7:00000015 r6:00000000 r5:008ed158 r4:00000000
[    9.645229] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops
[FAILED] Failed to start Remount Root and Kernel File Systems.
...


Best regards,
Bhuvan
