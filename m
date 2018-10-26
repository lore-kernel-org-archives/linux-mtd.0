Received: from mta.witecom.ch ([2a05:4880:0:100::20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gG5FH-0000WL-0r
 for linux-mtd@lists.infradead.org; Fri, 26 Oct 2018 16:46:01 +0000
Received: from localhost (localhost [127.0.0.1])
 by mta.witecom.ch (Postfix) with ESMTP id 49D5D441D63
 for <linux-mtd@lists.infradead.org>; Fri, 26 Oct 2018 18:21:39 +0200 (CEST)
Received: from mta.witecom.ch ([127.0.0.1])
 by localhost (mta.witecom.ch [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYA5iTmgNonu for <linux-mtd@lists.infradead.org>;
 Fri, 26 Oct 2018 18:21:38 +0200 (CEST)
Received: from smtp.wifx.net (unknown [172.31.130.8])
 by mta.witecom.ch (Postfix) with ESMTPSA id 6F0F9441D61
 for <linux-mtd@lists.infradead.org>; Fri, 26 Oct 2018 18:21:38 +0200 (CEST)
From: Yannick Lanz <yannick.lanz@wifx.net>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: bad block table erased by u-boot's ubi part command
Date: Fri, 26 Oct 2018 16:21:37 +0000
Message-ID: <A5CEBF07E04C514A9C56312C6027F32186A8C57B@SWIFXDC01.lan.wifx.net>
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using a linux kernel (linux-at91 4.4.39) including UBI support.=20
The partition table is defined as follow in U-Boot:
device nand0 <atmel_nand>, # parts =3D 6
 #: name                size            offset          mask_flags
 0: bootstrap           0x00040000      0x00000000      1
 1: uboot               0x000c0000      0x00040000      1
 2: env                 0x00080000      0x00100000      0
 3: dtb                 0x00080000      0x00180000      0
 4: kernel              0x00600000      0x00200000      1
 5: rootfs              0x0f800000      0x00800000      0

The rootfs partition is UBI, my bootargs is
console=3DttyS0,115200 earlyprintk cma=3D0 root=3Dubi0:rootfs ubi.mtd=3D5 r=
ootfstype=3Dubifs
and my bootcmd is=20
bootcmd=3Dnand read 0x21000000 0x180000 0x80000;nand read 0x22000000 0x2000=
00 0x600000;bootz 0x22000000 - 0x21000000

All is working well with these parameters and the kernel boots correctly:
NAND read: device 0 offset 0x180000, size 0x80000
 524288 bytes read: OK

NAND read: device 0 offset 0x200000, size 0x600000
 6291456 bytes read: OK
## Flattened Device Tree blob at 21000000
   Booting using the fdt blob at 0x21000000
   Loading Device Tree to 27b46000, end 27b514ca ... OK

Starting kernel ...

Booting Linux on physical CPU 0x0
Linux version 4.4.39-00530-g1abdece (xxx@xxx) (gcc version 5.3.0 (GCC) ) #1=
 Sun Sep 2 15:10:05 CEST 2018
CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=3D10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 32512
Kernel command line: console=3DttyS0,115200 earlyprintk cma=3D0 root=3Dubi0=
:rootfs ubi.mtd=3D5 rootfstype=3Dubifs
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 123704K/131072K available (4214K kernel code, 159K rwdata, 1276K ro=
data, 204K init, 166K bss, 7368K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xc8800000 - 0xff800000   ( 880 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc0564dd0   (5492 kB)
      .init : 0xc0565000 - 0xc0598000   ( 204 kB)
      .data : 0xc0598000 - 0xc05bfed0   ( 160 kB)
       .bss : 0xc05bfed0 - 0xc05e97dc   ( 167 kB)
NR_IRQS:16 nr_irqs:16 16
L2C-310 ID prefetch enabled, offset 2 lines
L2C-310 dynamic clock gating enabled, standby mode enabled
L2C-310 cache controller enabled, 8 ways, 128 kB
L2C-310: CACHE_ID 0x410000c9, AUX_CTRL 0x36020000
clocksource: pit: mask: 0x7ffffff max_cycles: 0x7ffffff, max_idle_ns: 95563=
02164 ns
sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 21474836=
475000000ns
Console: colour dummy device 80x30
Calibrating delay loop... 398.13 BogoMIPS (lpj=3D1990656)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
Initializing cgroup subsys net_cls
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x20008200 - 0x20008234
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:=
 19112604462750000 ns
pinctrl core: initialized pinctrl subsystem
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cpuidle: using governor menu
AT91: Detected SoC family: sama5d4
AT91: Detected SoC: sama5d41, revision 0
gpio-at91 fc06a000.gpio: at address c885c000
gpio-at91 fc06b000.gpio: at address c885e000
gpio-at91 fc06c000.gpio: at address c8872000
gpio-at91 fc068000.gpio: at address c8874000
gpio-at91 fc06d000.gpio: at address c8876000
pinctrl-at91 ahb:apb:pinctrl@fc06a000: initialized AT91 pinctrl driver
clocksource: tcb_clksrc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_=
ns: 152900835740 ns
at_xdmac f0004000.dma-controller: 16 channels, mapped at 0xc887c000
at_xdmac f0014000.dma-controller: 16 channels, mapped at 0xc887e000
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
at91_i2c f8014000.i2c: using dma0chan0 (tx) and dma0chan1 (rx) for DMA tran=
sfers
at91_i2c f8014000.i2c: AT91 i2c bus driver (hw version: 0x502).
at91_i2c f8024000.i2c: using dma0chan2 (tx) and dma0chan3 (rx) for DMA tran=
sfers
at91_i2c f8024000.i2c: AT91 i2c bus driver (hw version: 0x502).
at91_i2c fc038000.i2c: using dma1chan0 (tx) and dma1chan1 (rx) for DMA tran=
sfers
at91_i2c fc038000.i2c: AT91 i2c bus driver (hw version: 0x502).
clocksource: Switched to clocksource tcb_clksrc
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
futex hash table entries: 256 (order: -1, 3072 bytes)
io scheduler noop registered (default)
fc00c000.serial: ttyS0 at MMIO 0xfc00c000 (irq =3D 36, base_baud =3D 625000=
0) is a ATMEL_SERIAL
console [ttyS0] enabled
brd: module loaded
loop: module loaded
atmel_nand_nfc 90000000.nfc: NFC is probed.
atmel_nand 80000000.nand: Cannot get PMECC lookup table offset, will build =
a lookup table in runtime.
atmel_nand 80000000.nand: Use On Flash BBT
atmel_nand 80000000.nand: Using dma0chan4 for DMA transfers.
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAH4
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
atmel_nand 80000000.nand: minimum ECC: 4 bits in 512 bytes
atmel_nand 80000000.nand: Initialize PMECC params, cap: 4, sector: 512
atmel_nand 80000000.nand: Using NFC Sram read and write
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
6 ofpart partitions found on MTD device atmel_nand
Creating 6 MTD partitions on "atmel_nand":
0x000000000000-0x000000040000 : "at91bootstrap"
0x000000040000-0x0000000c0000 : "bootloader"
0x0000000c0000-0x000000180000 : "bootloader env"
0x000000180000-0x000000200000 : "device tree"
0x000000200000-0x000000800000 : "kernel"
0x000000800000-0x000010000000 : "rootfs"
atmel_spi f8010000.spi: version: 0x221
atmel_spi f8010000.spi: Using dma0chan5 (tx) and dma0chan6 (rx) for DMA tra=
nsfers
atmel_spi f8010000.spi: Atmel SPI Controller at 0xf8010000 (irq 30)
macb f8020000.ethernet: invalid hw address, using random
libphy: MACB_mii_bus: probed
macb f8020000.ethernet eth0: Cadence GEM rev 0x00020120 at 0xf8020000 irq 3=
3 (6e:bf:3e:f5:2c:eb)
macb f8020000.ethernet eth0: attached PHY driver [Micrel KSZ8081 or KSZ8091=
] (mii_bus:phy_addr=3Df8020000.etherne:01, irq=3D177)
rtc rtc0: alarm rollover not handled
rtc rtc0: invalid alarm value: 1900-1-1 0:0:0
at91_rtc fc0686b0.rtc: rtc core: registered fc0686b0.rtc as rtc0
at91_rtc fc0686b0.rtc: AT91 Real Time Clock driver.
i2c /dev entries driver
i2c-mux-gpio i2cmux: 1 port mux on AT91 adapter
AT91: Starting after user reset
lm75 0-004d: hwmon0: sensor 'lm75'
sama5d4_wdt fc068640.watchdog: initialized (timeout =3D 16 sec, nowayout =
=3D 0)
atmel_aes fc044000.aes: version: 0x201
atmel_aes fc044000.aes: Atmel AES - Using dma1chan2, dma1chan3 for DMA tran=
sfers
atmel_sha fc050000.sha: version: 0x420
atmel_sha fc050000.sha: using dma1chan4 for DMA transfers
atmel_sha fc050000.sha: Atmel SHA1/SHA256/SHA224/SHA384/SHA512
atmel_tdes fc04c000.tdes: version: 0x702
atmel_tdes fc04c000.tdes: using dma1chan5, dma1chan6 for DMA transfers
atmel_tdes fc04c000.tdes: Atmel DES/TDES
NET: Registered protocol family 10
sit: IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
ubi0: attaching mtd5
random: nonblocking pool is initialized
ubi0: scanning is finished
ubi0: attached mtd5 (name "rootfs", size 248 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 1980, bad PEBs: 4, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 2/0, WL threshold: 4096, image sequence numbe=
r: 847654145
ubi0: available PEBs: 0, total reserved PEBs: 1980, PEBs reserved for bad P=
EB handling: 36
ubi0: background thread "ubi_bgt0d" started, PID 584
at91_rtc fc0686b0.rtc: setting system clock to 2018-10-26 15:59:03 UTC (154=
0569543)
UBIFS (ubi0:0): recovery needed
UBIFS (ubi0:0): recovery deferred
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs", R/O m=
ode
UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes:=
 2048 bytes/2048 bytes
UBIFS (ubi0:0): FS size: 244936704 bytes (233 MiB, 1929 LEBs), journal size=
 9023488 bytes (8 MiB, 72 LEBs)
UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID 653D84F9-B2AA-4=
7B6-BA17-233A37FDC59E, small LPT model
VFS: Mounted root (ubifs filesystem) readonly on device 0:13.
devtmpfs: mounted
Freeing unused kernel memory: 204K (c0565000 - c0598000)
INIT: version 2.88 booting
Starting udev
ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -16
ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -16
UBIFS (ubi0:0): completing deferred recovery
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 655
UBIFS (ubi0:0): deferred recovery completed
[...]

My problems comes when I boot following a UBI attach in U-Boot since I woul=
d=20
like to load the device tree and the kernel from the UBIFS rootfs volume.

In U-Boot:
U-Boot 2018.09 (Oct 26 2018 - 09:48:13 +0000)

CPU: SAMA5D41
Crystal frequency:       12 MHz
CPU clock        :      600 MHz
Master clock     :      200 MHz
DRAM:  128 MiB
NAND:  256 MiB
MMC:   Atmel mci: 0
Loading Environment from NAND... OK
In:    serial
Out:   serial
Err:   serial
Hit any key to stop autoboot:  0
=3D> ubi part rootfs
ubi0: attaching mtd1
ubi0: scanning is finished
ubi0: attached mtd1 (name "mtd=3D5", size 248 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 1984, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 2/0, WL threshold: 4096, image sequence numbe=
r: 847654145
ubi0: available PEBs: 0, total reserved PEBs: 1984, PEBs reserved for bad P=
EB handling: 40
=3D> ubi detach
ubi0: detaching mtd1
ubi0: mtd1 is detached
=3D> boot

NAND read: device 0 offset 0x180000, size 0x80000
 524288 bytes read: OK

NAND read: device 0 offset 0x200000, size 0x600000
 6291456 bytes read: OK
## Flattened Device Tree blob at 21000000
   Booting using the fdt blob at 0x21000000
   Loading Device Tree to 27b46000, end 27b514ca ... OK

Starting kernel ...

Booting Linux on physical CPU 0x0
Linux version 4.4.39-00530-g1abdece (xxx@xxx) (gcc version 5.3.0 (GCC) ) #1=
 Sun Sep 2 15:10:05 CEST 2018
CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=3D10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 32512
Kernel command line: console=3DttyS0,115200 earlyprintk cma=3D0 root=3Dubi0=
:rootfs ubi.mtd=3D5 rootfstype=3Dubifs
[...]
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
random: nonblocking pool is initialized
Bad block table written to 0x00000ffe0000, version 0x01
Bad block table written to 0x00000ffc0000, version 0x01
6 ofpart partitions found on MTD device atmel_nand
Creating 6 MTD partitions on "atmel_nand":
0x000000000000-0x000000040000 : "at91bootstrap"
0x000000040000-0x0000000c0000 : "bootloader"
0x0000000c0000-0x000000180000 : "bootloader env"
0x000000180000-0x000000200000 : "device tree"
0x000000200000-0x000000800000 : "kernel"
0x000000800000-0x000010000000 : "rootfs"
[...]
ubi0: attaching mtd5
ubi0: scanning is finished
ubi0: attached mtd5 (name "rootfs", size 248 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 1980, bad PEBs: 4, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 2/0, WL threshold: 4096, image sequence numbe=
r: 847654145
ubi0: available PEBs: 0, total reserved PEBs: 1980, PEBs reserved for bad P=
EB handling: 36
ubi0: background thread "ubi_bgt0d" started, PID 584
UBIFS (ubi0:0): recovery needed
UBIFS (ubi0:0): recovery deferred
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs", R/O m=
ode
UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes:=
 2048 bytes/2048 bytes
UBIFS (ubi0:0): FS size: 244936704 bytes (233 MiB, 1929 LEBs), journal size=
 9023488 bytes (8 MiB, 72 LEBs)
UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID 653D84F9-B2AA-4=
7B6-BA17-233A37FDC59E, small LPT model
[...]
ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -16
ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -16
UBIFS (ubi0:0): completing deferred recovery
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 656
UBIFS (ubi0:0): deferred recovery completed

If a mount the UBI partition in U-Boot, then the bad block table is never f=
ound=20
in the kernel and always recreated. The other strange point is that U-Boot=
=20
doesn't find the 4 bad block found by the kernel.

If I reboot without mounting the UBI partition in U-Boot, then the bad bloc=
k=20
table is directly discovered by the kernel following its creation on latest=
 boot.
It seems that U-Boot is destroying the bad block table.

Do you have any idea what's happening ?

Best regards,=20
Yannick
