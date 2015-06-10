Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2Uom-00063t-Cx
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 01:28:40 +0000
Message-ID: <557791DF.9040501@huawei.com>
Date: Wed, 10 Jun 2015 09:24:47 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: cyl <cyl665236@126.com>, mtd mailing list <linux-mtd@lists.infradead.org>
Subject: Re: ubifs problem
References: <2b88f8ae.15caa.14ddab0368e.Coremail.cyl665236@126.com>
In-Reply-To: <2b88f8ae.15caa.14ddab0368e.Coremail.cyl665236@126.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 6/10/2015 7:38 AM, cyl wrote:
> 
> Hi
> The kernel Im using is 2.6.35.3  .  Sometimes when I restart it , the kernel panics like this:
> 
> 
> 
> 
> U-Boot 2009.08 (Dec 03 2014 - 21:04:20)
> 
> 
> Freescale i.MX28 family
> 
> 
> CPU:   454 MHz
> 
> 
> BUS:   151 MHz
> 
> 
> EMI:   205 MHz
> 
> 
> GPMI:   24 MHz
> 
> 
> DRAM:  128 MB
> 
> 
> NAND:  Manufacturer      : Samsung (0xec)
> 
> 
> Device Code       : 0xd3
> 
> 
> Cell Technology   : MLC
> 
> 
> Chip Size         : 1 GiB
> 
> 
> Pages per Block   : 128
> 
> 
> Page Geometry     : 2048+64
> 
> 
> ECC Strength      : 4 bits
> 
> 
> ECC Size          : 512 B
> 
> 
> Data Setup Time   : 20 ns
> 
> 
> Data Hold Time    : 15 ns
> 
> 
> Address Setup Time: 20 ns
> 
> 
> GPMI Sample Delay : 6 ns
> 
> 
> tREA              : Unknown
> 
> 
> tRLOH             : Unknown
> 
> 
> tRHOH             : Unknown
> 
> 
> Description       : K9G8G08U0M, K9HAG08U1M
> 
> 
> 1024 MiB
> 
> 
> *** Warning - bad CRC or NAND, using default environment
> 
> 
> 
> 
> In:    serial
> 
> 
> Out:   serial
> 
> 
> Err:   serial
> 
> 
> Net:   got MAC address from IIM: 00:04:00:00:00:00
> 
> 
> FEC0
> 
> 
> Hit any key to stop autoboot:  3  2  1  0 
> 
> 
> 
> 
> NAND read: device 0 offset 0x300000, size 0x300000
> 
> 
>  3145728 bytes read: OK
> 
> 
> ## Booting kernel from Legacy Image at 42000000 ...
> 
> 
>    Image Name:   Linux-2.6.35.3-670-g914558e
> 
> 
>    Image Type:   ARM Linux Kernel Image (uncompressed)
> 
> 
>    Data Size:    2647320 Bytes =  2.5 MB
> 
> 
>    Load Address: 40008000
> 
> 
>    Entry Point:  40008000
> 
> 
>    Verifying Checksum ... OK
> 
> 
>    Loading Kernel Image ... OK
> 
> 
> OK
> 
> 
> 
> 
> Starting kernel ...
> 
> 
> Uncompressing Linux... done, booting the kernel.
> Linux version 2.6.35.3-670-g914558e (aaa@ubuntu) (gcc version 4.4.4 (4.4.4_09.06.2010) ) #76 Sun May 3 14:58:33 PDT 2015
> 
> 
> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
> 
> 
> CPU: VIVT data cache, VIVT instruction cache
> 
> 
> Machine: Freescale MX28EVK board
> 
> 
> Memory policy: ECC disabled, Data cache writeback
> 
> 
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
> 
> 
> Kernel command line: console=ttyAM0,115200 ubi.mtd=1 root=ubi0:rootfs0 rootfstype=ubifs gpmi rw rootwait ip=none
> 
> 
> PID hash table entries: 512 (order: -1, 2048 bytes)
> 
> 
> Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> 
> 
> Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> 
> 
> Memory: 128MB = 128MB total
> 
> 
> Memory: 124136k/124136k available, 6936k reserved, 0K highmem
> 
> 
> Virtual kernel memory layout:
> 
> 
>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> 
> 
>     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
> 
> 
>     DMA     : 0xfde00000 - 0xffe00000   (  32 MB)
> 
> 
>     vmalloc : 0xc8800000 - 0xf0000000   ( 632 MB)
> 
> 
>     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
> 
> 
>     modules : 0xbf000000 - 0xc0000000   (  16 MB)
> 
> 
>       .init : 0xc0008000 - 0xc008c000   ( 528 kB)
> 
> 
>       .text : 0xc008c000 - 0xc0523000   (4700 kB)
> 
> 
>       .data : 0xc0524000 - 0xc0562620   ( 250 kB)
> 
> 
> SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> 
> 
> Hierarchical RCU implementation.
> 
> 
> 	RCU-based detection of stalled CPUs is disabled.
> 
> 
> 	Verbose stalled-CPUs detection is disabled.
> 
> 
> NR_IRQS:288
> 
> 
> Console: colour dummy device 80x30
> 
> 
> console [ttyAM0] enabled
> 
> 
> Calibrating delay loop... 226.09 BogoMIPS (lpj=1130496)
> 
> 
> pid_max: default: 32768 minimum: 301
> 
> 
> Security Framework initialized
> 
> 
> SELinux:  Initializing.
> 
> 
> Mount-cache hash table entries: 512
> 
> 
> CPU: Testing write buffer coherency: ok
> 
> 
> regulator: core version 0.5
> 
> 
> NET: Registered protocol family 16
> 
> 
> regulator: vddd: 800 <--> 1575 mV at 1500 mV fast normal 
> 
> 
> regulator: vdddbo: 800 <--> 1575 mV fast normal 
> 
> 
> regulator: vdda: 1500 <--> 2275 mV at 1800 mV fast normal 
> 
> 
> vddio = 3380000, val=10
> 
> 
> regulator: vddio: 2880 <--> 3680 mV at 3380 mV fast normal 
> 
> 
> regulator: overall_current: fast normal 
> 
> 
> regulator: vbus5v: 
> 
> 
> regulator: mxs-duart-1: fast normal 
> 
> 
> regulator: mxs-bl-1: fast normal 
> 
> 
> regulator: mxs-i2c-1: fast normal 
> 
> 
> regulator: mmc_ssp-1: fast normal 
> 
> 
> regulator: mmc_ssp-2: fast normal 
> 
> 
> regulator: charger-1: fast normal 
> 
> 
> regulator: power-test-1: fast normal 
> 
> 
> regulator: cpufreq-1: fast normal 
> 
> 
> i.MX IRAM pool: 124 KB@0xc8820000
> 
> 
> Initializing GPMI pins
> 
> 
> mx28_init_duart
> usb DR wakeup device is registered
> 
> 
> IMX usb wakeup probe
> 
> 
> audit: cannot initialize inotify handle
> 
> 
> bio: create slab <bio-0> at 0
> 
> 
> SCSI subsystem initialized
> 
> 
> Freescale USB OTG Driver loaded, $Revision: 1.55 $
> 
> 
> usbcore: registered new interface driver usbfs
> 
> 
> usbcore: registered new interface driver hub
> 
> 
> usbcore: registered new device driver usb
> 
> 
> Advanced Linux Sound Architecture Driver Version 1.0.23.
> 
> 
> Switching to clocksource mxs clock source
> 
> 
> NET: Registered protocol family 2
> 
> 
> IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
> 
> 
> TCP established hash table entries: 4096 (order: 3, 32768 bytes)
> 
> 
> TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
> 
> 
> TCP: Hash tables configured (established 4096 bind 4096)
> 
> 
> TCP reno registered
> 
> 
> UDP hash table entries: 256 (order: 0, 4096 bytes)
> 
> 
> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> 
> 
> NET: Registered protocol family 1
> 
> 
> RPC: Registered udp transport module.
> 
> 
> RPC: Registered tcp transport module.
> 
> 
> RPC: Registered tcp NFSv4.1 backchannel transport module.
> 
> 
> Bus freq driver module loaded
> 
> 
> IMX usb wakeup probe
> 
> 
> usb h1 wakeup device is registered
> 
> 
> mxs_cpu_init: cpufreq init finished
> 
> 
> audit: initializing netlink socket (disabled)
> 
> 
> type=2000 audit(0.600:1): initialized
> 
> 
> VFS: Disk quotas dquot_6.5.2
> 
> 
> Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> 
> 
> JFFS2 version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
> 
> 
> msgmni has been set to 242
> 
> 
> alg: No test for stdrng (krng)
> 
> 
> cryptodev: driver loaded.
> 
> 
> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
> 
> 
> io scheduler noop registered
> 
> 
> io scheduler deadline registered
> 
> 
> io scheduler cfq registered (default)
> 
> 
> brightness 100
> 
> 
> Console: switching to colour frame buffer device 100x30
> 
> 
> brightness 100
> 
> 
> sc16is752 - uart_register_driver
> 
> 
> sc16is752 SPI serial expander initialized
> 
> 
> mxs-duart.0: ttyAM0 at MMIO 0x80074000 (irq = 47) is a DebugUART
> 
> 
> mxs-auart.0: ttySP0 at MMIO 0x8006a000 (irq = 112) is a mxs-auart.0
> 
> 
> Found APPUART 3.1.0
> 
> 
> mxs-auart.1: ttySP1 at MMIO 0x8006c000 (irq = 113) is a mxs-auart.1
> 
> 
> Found APPUART 3.1.0
> 
> 
> mxs-auart.2: ttySP2 at MMIO 0x8006e000 (irq = 114) is a mxs-auart.2
> 
> 
> Found APPUART 3.1.0
> 
> 
> mxs-auart.3: ttySP3 at MMIO 0x80070000 (irq = 115) is a mxs-auart.3
> 
> 
> Found APPUART 3.1.0
> 
> 
> mxs-auart.4: ttySP4 at MMIO 0x80072000 (irq = 116) is a mxs-auart.4
> 
> 
> Found APPUART 3.1.0
> 
> 
> brd: module loaded
> 
> 
> loop: module loaded
> 
> 
> i.MX GPMI NFC
> 
> 
> NFC: Version 1, 8-chip GPMI and BCH
> 
> 
> Boot ROM: Version 1, Single-chip boot area, block mark swapping supported
> 
> 
> Scanning for NAND Flash chips...
> 
> 
> NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit)
> 
> 
> -----------------------------
> 
> 
> NAND Flash Device Information
> 
> 
> -----------------------------
> 
> 
> Manufacturer      : Samsung (0xec)
> 
> 
> Device Code       : 0xd3
> 
> 
> Cell Technology   : MLC
> 
> 
> Chip Size         : 1 GiB
> 
> 
> Pages per Block   : 128
> 
> 
> Page Geometry     : 2048+64
> 
> 
> ECC Strength      : 4 bits
> 
> 
> ECC Size          : 512 B
> 
> 
> Data Setup Time   : 20 ns
> 
> 
> Data Hold Time    : 15 ns
> 
> 
> Address Setup Time: 20 ns
> 
> 
> GPMI Sample Delay : 6 ns
> 
> 
> tREA              : Unknown
> 
> 
> tRLOH             : Unknown
> 
> 
> tRHOH             : Unknown
> 
> 
> Description       : K9G8G08U0M, K9HAG08U1M
> 
> 
> -----------------
> 
> 
> Physical Geometry
> 
> 
> -----------------
> 
> 
> Chip Count             : 1
> 
> 
> Page Data Size in Bytes: 2048 (0x800)
> 
> 
> Page OOB Size in Bytes : 64
> 
> 
> Block Size in Bytes    : 262144 (0x40000)
> 
> 
> Block Size in Pages    : 128 (0x80)
> 
> 
> Chip Size in Bytes     : 1073741824 (0x40000000)
> 
> 
> Chip Size in Pages     : 524288 (0x80000)
> 
> 
> Chip Size in Blocks    : 4096 (0x1000)
> 
> 
> Medium Size in Bytes   : 1073741824 (0x40000000)
> 
> 
> ------------
> 
> 
> NFC Geometry
> 
> 
> ------------
> 
> 
> ECC Algorithm          : BCH
> 
> 
> ECC Strength           : 8
> 
> 
> Page Size in Bytes     : 2112
> 
> 
> Metadata Size in Bytes : 10
> 
> 
> ECC Chunk Size in Bytes: 512
> 
> 
> ECC Chunk Count        : 4
> 
> 
> Payload Size in Bytes  : 2048
> 
> 
> Auxiliary Size in Bytes: 16
> 
> 
> Auxiliary Status Offset: 12
> 
> 
> Block Mark Byte Offset : 1999
> 
> 
> Block Mark Bit Offset  : 0
> 
> 
> -----------------
> 
> 
> Boot ROM Geometry
> 
> 
> -----------------
> 
> 
> Boot Area Count            : 1
> 
> 
> Boot Area Size in Bytes    : 20971520 (0x1400000)
> 
> 
> Stride Size in Pages       : 64
> 
> 
> Search Area Stride Exponent: 2
> 
> 
> Boot area protection is enabled.
> 
> 
> Creating 2 MTD partitions on "gpmi-nfc-main":
> 
> 
> 0x000000000000-0x000001400000 : "gpmi-nfc-0-boot"
> 
> 
> 0x000001400000-0x000040000000 : "gpmi-nfc-general-use"
> 
> 
> UBI: attaching mtd1 to ubi0
> 
> 
> UBI: physical eraseblock size:   262144 bytes (256 KiB)
> 
> 
> UBI: logical eraseblock size:    258048 bytes
> 
> 
> UBI: smallest flash I/O unit:    2048
> 
> 
> UBI: VID header offset:          2048 (aligned 2048)
> 
> 
> UBI: data offset:                4096
> 
> 
> UBI: attached mtd1 to ubi0
> 
> 
> UBI: MTD device name:            "gpmi-nfc-general-use"
> 
> 
> UBI: MTD device size:            1004 MiB
> 
> 
> UBI: number of good PEBs:        4016
> 
> 
> UBI: number of bad PEBs:         0
> 
> 
> UBI: max. allowed volumes:       128
> 
> 
> UBI: wear-leveling threshold:    4096
> 
> 
> UBI: number of internal volumes: 1
> 
> 
> UBI: number of user volumes:     1
> 
> 
> UBI: available PEBs:             0
> 
> 
> UBI: total number of reserved PEBs: 4016
> 
> 
> UBI: number of PEBs reserved for bad PEB handling: 40
> 
> 
> UBI: max/mean erase counter: 12/9
> 
> 
> UBI: image sequence number: 0
> 
> 
> UBI: background thread "ubi_bgt0d" started, PID 1012
> 
> 
>  ubiblka: unknown partition table
> 
> 
> mxs-spi mxs-spi.0: Max possible speed 24000 = 24000000/2 kHz
> mxs-spi mxs-spi.0: at 0x80014000 mapped to 0xF0014000, irq=84, bus 1, DMA ver_major 4
> 
> 
> vcan: Virtual CAN interface driver
> 
> 
> Freescale FlexCAN Driver 
> 
> 
> FEC Ethernet Driver
> 
> 
> fec_enet_mii_bus: probed
> 
> 
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> 
> 
> fsl-ehci fsl-ehci: Freescale On-Chip EHCI Host Controller
> 
> 
> fsl-ehci fsl-ehci: new USB bus registered, assigned bus number 1
> 
> 
> fsl-ehci fsl-ehci: irq 93, io base 0x80080000
> 
> 
> fsl-ehci fsl-ehci: USB 2.0 started, EHCI 1.00
> 
> 
> hub 1-0:1.0: USB hub found
> 
> 
> hub 1-0:1.0: 1 port detected
> 
> 
> fsl-ehci fsl-ehci.0: Freescale On-Chip EHCI Host Controller
> 
> 
> fsl-ehci fsl-ehci.0: new USB bus registered, assigned bus number 2
> 
> 
> fsl-ehci fsl-ehci.0: irq 92, io base 0x80090000
> 
> 
> fsl-ehci fsl-ehci.0: USB 2.0 started, EHCI 1.00
> 
> 
> hub 2-0:1.0: USB hub found
> 
> 
> hub 2-0:1.0: 1 port detected
> 
> 
> Initializing USB Mass Storage driver...
> 
> 
> usbcore: registered new interface driver usb-storage
> 
> 
> USB Mass Storage support registered.
> 
> 
> ARC USBOTG Device Controller driver (1 August 2005)
> 
> 
> mice: PS/2 mouse device common for all mice
> 
> 
> input: mxs-kbd as /devices/platform/mxs-kbd.0/input/input0
> 
> 
> input: MXS touchscreen as /devices/virtual/input/input1
> 
> 
> rtc-isl1208 0-006f: chip found, driver version 0.3
> 
> 
> rtc-isl1208 0-006f: rtc core: registered rtc-isl1208 as rtc0
> 
> 
> MXS RTC driver v1.0 hardware v2.3.0
> 
> 
> mxs-rtc mxs-rtc.0: rtc core: registered mxs-rtc as rtc1
> 
> 
> i2c /dev entries driver
> 
> 
> IR NEC protocol handler initialized
> 
> 
> IR RC5(x) protocol handler initialized
> 
> 
> IR RC6 protocol handler initialized
> 
> 
> IR JVC protocol handler initialized
> 
> 
> IR Sony protocol handler initialized
> 
> 
> Linux video capture interface: v2.00
> 
> 
> mxs-pxp mxs-pxp.0: initialized
> 
> 
> WARNING : No battery connected !
> 
> 
> Aborting power driver initialization
> 
> 
> mxs-battery: probe of mxs-battery.0 failed with error 1
> 
> 
> mxs watchdog: initialized, heartbeat 19 sec
> 
> 
> mxs-mmc: MXS SSP Controller MMC Interface driver
> 
> 
> dcp dcp.0: DCP crypto enabled.!
> 
> 
> usbcore: registered new interface driver hiddev
> 
> 
> usbcore: registered new interface driver usbhid
> 
> 
> usbhid: USB HID core driver
> 
> 
> mxs-spdif mxs-spdif.0: MXS SPDIF Audio Transmitter
> 
> 
> No device for codec mxs spdif
> 
> 
> No device for DAI mxs spdif
> 
> 
> No device for DAI mxs-saif
> 
> 
> No device for DAI mxs-spdif
> 
> 
> asoc: mxs spdif <-> mxs-spdif mapping ok
> 
> 
> ALSA device list:
> 
> 
>   #0: mxs-evk (mxs spdif)
> 
> 
> TCP cubic registered
> 
> 
> NET: Registered protocol family 17
> 
> 
> can: controller area network core (rev 20090105 abi 8)
> 
> 
> NET: Registered protocol family 29
> 
> 
> can: raw protocol (rev 20090105)
> 
> 
> can: broadcast manager protocol (rev 20090105 t)
> 
> 
> regulator_init_complete: incomplete constraints, leaving vbus5v on
> 
> 
> rtc-isl1208 0-006f: setting system clock to 2015-06-10 05:52:53 UTC (1433915573)
> 
> 
> UBI error: ubi_io_read: error -74 while reading 258048 bytes from PEB 3029:4096, read 258048 bytes
> 
> 
> UBI error: ubi_io_read: error -74 while reading 258048 bytes from PEB 3029:4096, read 258048 bytes
> 
> 
> UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master node
> 
It seems you got an ECC error when reading master node. For ECC error, there is
no easy way to recover it. Maybe you could dump the bad LEB to see what is wrong
with `ubidump', and fix it by hand.

thanks,
Sheng
> 
> List of all partitions:
> 
> 
> 1f00           20480 mtdblock0 (driver?)
> 
> 
> 1f01         1028096 mtdblock1 (driver?)
> 
> 
> fe00         1000944 ubiblka (driver?)
> 
> 
> No filesystem could mount root, tried:  ubifs
> 
> 
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> 
> 
> Backtrace: 
> 
> 
> [<c0090284>] (dump_backtrace+0x0/0x114) from [<c03f3b6c>] (dump_stack+0x18/0x1c)
> 
> 
>  r7:c0029a24 r6:00008000 r5:c7509006 r4:c0563578
> 
> 
> [<c03f3b54>] (dump_stack+0x0/0x1c) from [<c03f3bd0>] (panic+0x60/0xdc)
> 
> 
> [<c03f3b70>] (panic+0x0/0xdc) from [<c0008fe4>] (mount_block_root+0x1d8/0x218)
> 
> 
>  r3:00000000 r2:00000020 r1:c7c27f78 r0:c04a5765
> 
> 
> [<c0008e0c>] (mount_block_root+0x0/0x218) from [<c00091b4>] (prepare_namespace+0x94/0x1c4)
> 
> 
> [<c0009120>] (prepare_namespace+0x0/0x1c4) from [<c00084e8>] (kernel_init+0x118/0x158)
> 
> 
>  r5:c0028b28 r4:c05626a0
> 
> 
> [<c00083d0>] (kernel_init+0x0/0x158) from [<c00aa5ec>] (do_exit+0x0/0x608)
> 
> 
>  r5:c00083d0 r4:00000000
> 
> 
> 
> 
> 
> 
> Is there anyway to fix this?
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
