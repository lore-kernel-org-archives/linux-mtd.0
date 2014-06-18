Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wx7kB-0000JT-Bn
 for linux-mtd@lists.infradead.org; Wed, 18 Jun 2014 04:45:18 +0000
Received: by mail-pa0-f42.google.com with SMTP id lj1so309108pab.29
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jun 2014 21:44:45 -0700 (PDT)
Received: from gmail.com (62.218.233.220.static.exetel.com.au.
 [220.233.218.62])
 by mx.google.com with ESMTPSA id xc1sm4003170pab.39.2014.06.17.21.44.41
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
 Tue, 17 Jun 2014 21:44:43 -0700 (PDT)
Date: Wed, 18 Jun 2014 14:44:37 +1000
From: Matt Hevern <matt.hevern@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBIFS becomes read-only when written, then fails to mount
Message-ID: <20140618044434.GA9331@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,


I am running UBIFS on freescale i.MX28, kernel 2.6.35.3, based on
freescale's IMX tree:
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/?h=imx_2.6.35_maintain
The flash is NAND, Micron 256MiB (MT29F2G08)

The main mtd partition has 5 UBI volumes on it, one of which is around
20MB UBIFS. This is used as the writeable backing store for a unionfs
filesystem which is mounted over various areas of the readonly root squashfs area.

I noticed on one device which I was testing, that on bootup the whole
UBIFS volume had gone read-only, and I'm trying to figure out why, and if
there is anything that can be done to recover.
I built a kernel with UBIFS debuging and have attached various logs to this email,
I don't currently have access to a console on this device.

What I have seen is that when I mount it, it mounts successfully,
but when I attempt to write a file to it, then it will fail to write
and then remount read-only. This happened on a number of successive ocasions
while i was recording log files, and then later it failed to mount at all.
I don't know what exactly led to this occuring, at the time there was
logging to the UBIFS occuring every 5 seconds, and the device will hard
power down when the battery level drops, which happens regularly.

Does anyone have an idea what is happening here, or any options to
prevent this from happening ?

Thanks in advance,

Matt

------dmesg
UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd1 to ubi0
UBI: MTD device name:            "system"
UBI: MTD device size:            248 MiB
UBI: number of good PEBs:        1982
UBI: number of bad PEBs:         2
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     5
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1982
UBI: number of PEBs reserved for bad PEB handling: 19
UBI: max/mean erase counter: 80/60
UBI: image sequence number: 1793180392
UBI: background thread "ubi_bgt0d" started, PID 492
 ubiblka: unknown partition table
 ubiblkb: unknown partition table
 ubiblkc: unknown partition table
 ubiblkd: unknown partition table
 ubiblke: unknown partition table
....
....
UBIFS: mounted UBI device 0, volume 5, name "config"
UBIFS: file system size:   20697088 bytes (20212 KiB, 19 MiB, 163 LEBs)
UBIFS: journal size:       4444160 bytes (4340 KiB, 4 MiB, 35 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS error (pid 616): ubifs_leb_unmap: unmap LEB -1 failed, error -22
UBIFS warning (pid 616): ubifs_ro_mode: switched to read-only mode, error -22
UBIFS error (pid 616): make_reservation: cannot reserve 160 bytes in jhead 1, error -22
UBIFS error (pid 616): ubifs_write_inode: can't write inode 69, error -22

----



--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="dmesg_boot.txt"
Content-Transfer-Encoding: 8bit

Linux version 2.6.35.3 (matt@matt-pc) (gcc version 4.6.3 (Timesys 20120917) ) #2 Fri Jun 13 09:50:08 EST 2014
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
CPU: VIVT data cache, VIVT instruction cache
Machine: Freescale MX28
Memory policy: ECC disabled, Data cache writeback
On node 0 totalpages: 32768
free_area_init_node: node 0, pgdat c0501924, node_mem_map c057f000
  DMA zone: 32 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 4064 pages, LIFO batch:0
  Normal zone: 224 pages used for memmap
  Normal zone: 28448 pages, LIFO batch:7
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: console=ttyAM0,115200n8 ubi.mtd=1 root=/dev/ubiblkb rootfstype=squashfs rw rootwait panic=15 gpmi
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 128MB = 128MB total
Memory: 124320k/124320k available, 6752k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xfde00000 - 0xffe00000   (  32 MB)
    vmalloc : 0xc8800000 - 0xf0000000   ( 632 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .init : 0xc0008000 - 0xc0039000   ( 196 kB)
      .text : 0xc0039000 - 0xc04d1000   (4704 kB)
      .data : 0xc04d2000 - 0xc0505d00   ( 208 kB)
SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Hierarchical RCU implementation.
        RCU-based detection of stalled CPUs is disabled.
        Verbose stalled-CPUs detection is disabled.
NR_IRQS:288
Console: colour dummy device 80x30
console [ttyAM0] enabled
ODEBUG: 0 of 0 active objects replaced
Calibrating delay loop... 178.99 BogoMIPS (lpj=894976)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
devtmpfs: initialized
regulator: core version 0.5
NET: Registered protocol family 16
regulator: vddd: 800 <--> 1575 mV at 1500 mV fast normal
regulator: vdddbo: 800 <--> 1575 mV fast normal
regulator: vdda: 1500 <--> 2275 mV at 1800 mV fast normal
vddio = 3380000, val=10
regulator: vddio: 2880 <--> 3680 mV at 3380 mV fast normal
regulator: overall_current: fast normal
regulator: vbus5v:
regulator: mxs-duart-1: fast normal
regulator: mxs-bl-1: fast normal
regulator: mxs-i2c-1: fast normal
regulator: mmc_ssp-1: fast normal
regulator: mmc_ssp-2: fast normal
regulator: charger-1: fast normal
regulator: power-test-1: fast normal
regulator: cpufreq-1: fast normal
maxwell_init_machine: starting...
i.MX IRAM pool: 124 KB@0xc8820000
Initializing GPMI pins
Initializing GPIO pins
9523 FULL_PW_EN on
9523 powered off
mx28_init_mmc: ......adding device
hdq_init:gpio_request 124
hdq_init:IRQ 252
battery_gauge_init: Adding bq27x00
maxwell_init_machine: done...
usb DR wakeup device is registered
IMX usb wakeup probe
the wakeup pdata is 0xc04da38c
audit: cannot initialize inotify handle
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Advanced Linux Sound Architecture Driver Version 1.0.23.
cfg80211: Calling CRDA to update world regulatory domain
Switching to clocksource mxs clock source
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
Bus freq driver module loaded
mxs_cpu_init: cpufreq init finished
audit: initializing netlink socket (disabled)
type=2000 audit(1.010:1): initialized
squashfs: version 4.0 (2009/01/31) Phillip Lougher
Registering unionfs 2.5.11 (for 2.6.35.14)
JFFS2 version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
fuse init (API version 7.14)
msgmni has been set to 242
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered (default)
Console: switching to colour frame buffer device 100x30
mxs-duart.0: ttyAM0 at MMIO 0x80074000 (irq = 47) is a DebugUART
mxs-auart.0: ttySP0 at MMIO 0x8006a000 (irq = 112) is a mxs-auart.0
Found APPUART 3.1.0
mxs-auart.1: ttySP1 at MMIO 0x8006c000 (irq = 113) is a mxs-auart.1
Found APPUART 3.1.0
mxs-auart.2: ttySP2 at MMIO 0x8006e000 (irq = 114) is a mxs-auart.2
Found APPUART 3.1.0
brd: module loaded
loop: module loaded
Loading iSCSI transport class v2.0-870.
i.MX GPMI NFC
NFC: Version 1, 8-chip GPMI and BCH
Boot ROM: Version 1, Single-chip boot area, block mark swapping supported
Scanning for NAND Flash chips...
-----------------------------
NAND Flash Device Information
-----------------------------
Manufacturer      : Micron (0x2c)
Device Code       : 0xda
Cell Technology   : SLC
Chip Size         : 256 MiB
Pages per Block   : 64
Page Geometry     : 2048+64
ECC Strength      : 4 bits
ECC Size          : 512 B
Data Setup Time   : 20 ns
Data Hold Time    : 10 ns
Address Setup Time: 10 ns
GPMI Sample Delay : 6 ns
tREA              : Unknown
tRLOH             : Unknown
tRHOH             : Unknown
Description       : MT29F2G08
------------
NFC Geometry
------------
ECC Algorithm          : BCH
ECC Strength           : 8
Page Size in Bytes     : 2112
Metadata Size in Bytes : 10
ECC Chunk Size in Bytes: 512
ECC Chunk Count        : 4
Payload Size in Bytes  : 2048
Auxiliary Size in Bytes: 16
Auxiliary Status Offset: 12
Block Mark Byte Offset : 1999
Block Mark Bit Offset  : 0
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron NAND 256MiB 3,3V 8-bit)
-----------------
Boot ROM Geometry
-----------------
Boot Area Count            : 1
Boot Area Size in Bytes    : 4194304 (0x400000)
Stride Size in Pages       : 64
Search Area Stride Exponent: 2
Scanning device for bad blocks
Bad eraseblock 100 at 0x000000c80000
Bad eraseblock 101 at 0x000000ca0000
Boot area protection is enabled.
Creating 3 MTD partitions on "gpmi-nfc-main":
0x000000000000-0x000000400000 : "bootloader"
0x000000400000-0x00000fc00000 : "system"
0x00000fc00000-0x000010000000 : "mfg"
UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd1 to ubi0
UBI: MTD device name:            "system"
UBI: MTD device size:            248 MiB
UBI: number of good PEBs:        1982
UBI: number of bad PEBs:         2
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     5
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1982
UBI: number of PEBs reserved for bad PEB handling: 19
UBI: max/mean erase counter: 80/60
UBI: image sequence number: 1793180392
UBI: background thread "ubi_bgt0d" started, PID 492
 ubiblka: unknown partition table
 ubiblkb: unknown partition table
 ubiblkc: unknown partition table
 ubiblkd: unknown partition table
 ubiblke: unknown partition table
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
PPP MPPE Compression module registered
usbcore: registered new interface driver zd1201
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ARC USBOTG Device Controller driver (1 August 2005)
mice: PS/2 mouse device common for all mice
input: gpio-keys as /devices/platform/gpio-keys.0/input/input0
input: gpio-keys as /devices/platform/gpio-keys.1/input/input1
MXS RTC driver v1.0 hardware v2.3.0
mxs-rtc mxs-rtc.0: rtc core: registered mxs-rtc as rtc0
i2c /dev entries driver
bq27000-battery bq27000-battery.0: support ver. 1.2.0 enabled
mxs watchdog: initialized, heartbeat 19 sec
cpuidle: using governor ladder
mxs-mmc: MXS SSP Controller MMC Interface driver
mxs-mmc mxs-mmc.0: mmc0: MXS SSP MMC DMAIRQ 82 ERRIRQ 96
Registered led device: led:red:status
Registered led device: led:green:status
sgtl5000-i2c 0-000a: SGTL5000 revision 17
mmc0: new high speed SDIO card at address 0001
No device for DAI mxs-saif
asoc: SGTL5000 <-> mxs-saif mapping ok
ALSA device list:
  #0: mxs-audiodev (SGTL5000)
oprofile: hardware counters not available
oprofile: using timer interrupt.
Netfilter messages via NETLINK v0.30.
TCP cubic registered
NET: Registered protocol family 17
input: power_button as /devices/virtual/input/input2
kmemleak: Kernel memory leak detector initialized
kmemleak: Automatic memory scanning thread started
mxs-rtc mxs-rtc.0: setting system clock to 2014-06-16 04:06:38 UTC (1402891598)
VFS: Mounted root (squashfs filesystem) readonly on device 254:8.
devtmpfs: mounted
Freeing init memory: 196K
UBI: attaching mtd2 to ubi1
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd2 to ubi1
UBI: MTD device name:            "mfg"
UBI: MTD device size:            4 MiB
UBI: number of good PEBs:        32
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 32
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 4/1
UBI: image sequence number: 0
UBI: background thread "ubi_bgt1d" started, PID 594
 ubiblkf: unknown partition table
UBIFS: mounted UBI device 1, volume 0, name "mfg"
UBIFS: mounted read-only
UBIFS: file system size:   2031616 bytes (1984 KiB, 1 MiB, 16 LEBs)
UBIFS: journal size:       1142785 bytes (1116 KiB, 1 MiB, 8 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 5, name "config"
UBIFS: file system size:   20697088 bytes (20212 KiB, 19 MiB, 163 LEBs)
UBIFS: journal size:       4444160 bytes (4340 KiB, 4 MiB, 35 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS error (pid 616): ubifs_leb_unmap: unmap LEB -1 failed, error -22
UBIFS warning (pid 616): ubifs_ro_mode: switched to read-only mode, error -22
UBIFS error (pid 616): make_reservation: cannot reserve 160 bytes in jhead 1, error -22
UBIFS error (pid 616): ubifs_write_inode: can't write inode 69, error -22

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg_with_attach_and_mount_max_errlevel.txt"

UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd1 to ubi0
UBI: MTD device name:            "system"
UBI: MTD device size:            248 MiB
UBI: number of good PEBs:        1982
UBI: number of bad PEBs:         2
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     5
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1982
UBI: number of PEBs reserved for bad PEB handling: 19
UBI: max/mean erase counter: 80/60
UBI: image sequence number: 1793180392
UBI: background thread "ubi_bgt0d" started, PID 1120
 ubiblka: unknown partition table
 ubiblkb: unknown partition table
 ubiblkc: unknown partition table
 ubiblkd: unknown partition table
 ubiblke: unknown partition table
\u@\h \w$ mount -t ubifs ubi0:config /tmp/config
\u@\h \w$ dmesg
ode: LEB 69:109312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:113456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:117600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:121744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:99032, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:99032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:103176, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:103176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:107320, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:107320, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:111464, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:111464, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:115608, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:115608, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:119752, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:119752, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:62160, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:66304, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:70448, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:74592, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:78736, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:82880, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:87024, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:91168, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:95312, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 171:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 99:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 20:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:121072, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 69:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 89:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 41:120832, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 148:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 146:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 164:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 164:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 151:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 151:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 151:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 151:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 151:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 151:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 151:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 151:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:43008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:47152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:51296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:55440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:59584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:63728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:67872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:72016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:76160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:80304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:84448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:88592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:92736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:96880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:101024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:105168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:109312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:113456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:117600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:121744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 168:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:112880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:117024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:121168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 155:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 108:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 112:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 96:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 95:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 135:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 83:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:0, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:4144, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:8288, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:12432, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:16576, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:20720, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:24864, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:29008, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:33152, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:37296, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:41440, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:45584, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:49728, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:53872, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:58016, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:62160, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:66304, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:70448, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:74592, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 156:78736, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 156:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 63:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 78:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 164:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 164:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 164:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:12432, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:16576, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:20720, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:24864, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:29008, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:33152, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:37296, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:41440, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:45584, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:49728, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:53872, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:58016, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:62160, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:66304, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:70448, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:74592, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:78736, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:82880, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:87024, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 128:91168, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 128:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 91:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 55:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:20720, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:24864, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:29008, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:33152, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:37296, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:41440, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:45584, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:49728, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:53872, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:58016, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 86:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 82:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 98:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 44:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 93:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:112640, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:116784, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:120928, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 65:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:99456, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:103600, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:107744, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:111888, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:116032, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 110:120176, data node, length 4144, jhead 0 (GC)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 110:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 85:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 85:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 85:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 85:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 47:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 57:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 145:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 15:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:112880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:117024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:121168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 80:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 80:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 80:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 80:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 80:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 80:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 80:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 46:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:112640, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:116784, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 117:120928, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:0, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:4144, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:8288, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:12432, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:16576, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:20720, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:24864, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:29008, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:33152, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:37296, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:41440, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:45584, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:49728, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:53872, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:58016, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:62160, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 84:66304, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 84:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 40:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 35:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 53:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 157:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:108544, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:112688, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:116832, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:120976, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 36:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 137:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 39:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:6144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:12288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:18432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:24576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:30720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:36864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:43008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:49152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:55296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:61440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:67584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:73728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:79872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:86016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:92160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:98304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:104448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:110592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 165:116736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:6144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:12288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:18432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:24576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:30720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:36864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:43008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:49152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:55296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:61440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:67584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:73728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:79872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:86016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:92160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:98304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:104448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:110592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 67:116736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:6144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:12288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:18432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:24576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:30720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:36864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:43008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:49152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:55296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:61440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:67584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:73728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:79872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:86016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:92160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:98304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:104448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:110592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 101:116736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:6144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:12288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:18432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:24576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:30720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:36864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:43008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:49152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:55296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:61440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:67584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:73728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:79872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:86016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:92160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:98304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:104448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:110592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 33:116736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 143:120176, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:0, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:4144, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:8288, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:12432, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:16576, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:6144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:12288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:18432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:24576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:30720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:36864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:43008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:49152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:55296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:61440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:67584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:73728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:79872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:86016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:92160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:98304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:104448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:110592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 97:116736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:94208, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:94208, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:98352, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:98352, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:102496, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:102496, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:106640, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:106640, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:110784, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:110784, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:114928, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:114928, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 109:119072, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 109:119072, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:0, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:4144, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:4144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:8288, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:12432, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:16576, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:20720, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:24864, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:29008, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:33152, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:37296, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:41440, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:45584, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 43:49728, data node, length 4144, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 43:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:0, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:6144, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:12288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:18432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:24576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:30720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:36864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:43008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:49152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:55296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:61440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:67584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:73728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:79872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:86016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:92160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:98304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:104448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:110592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 141:116736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 11:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:91168, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 147:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:8288, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:12432, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:16576, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:20720, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:24864, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:29008, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:33152, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:37296, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:41440, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:45584, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:49728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:53872, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:58016, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:62160, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:66304, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:70448, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:74592, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:78736, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:82880, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 58:87024, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 144:95312, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 144:99456, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 144:103600, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 144:107744, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 144:111888, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 144:116032, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node: LEB 144:120176, data node, length 1699
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 102:124928, inode node, length 160, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 102:124928, inode node, length 160
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 134:73728, data node, length 4144, jhead 2 (data)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 134:73728, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 134:114688, data node, length 4144, jhead 2 (data)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 134:114688, data node, length 4144
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 134:122880, data node, length 628, jhead 2 (data)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 134:122880, data node, length 628
UBIFS DBG (pid 1137): ubifs_read_node_wbuf: LEB 122:125008, inode node, length 160, jhead 1 (base)
UBIFS DBG (pid 1137): ubifs_read_node: LEB 122:125008, inode node, length 160
UBIFS: mounted UBI device 0, volume 5, name "config"
UBIFS: file system size:   20697088 bytes (20212 KiB, 19 MiB, 163 LEBs)
UBIFS: journal size:       4444160 bytes (4340 KiB, 4 MiB, 35 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS DBG (pid 1137): mount_ubifs: compiled on:         Jun 18 2014 at 11:10:35
UBIFS DBG (pid 1137): mount_ubifs: min. I/O unit size:  2048 bytes
UBIFS DBG (pid 1137): mount_ubifs: LEB size:            126976 bytes (124 KiB)
UBIFS DBG (pid 1137): mount_ubifs: data journal heads:  1
UBIFS DBG (pid 1137): mount_ubifs: UUID:                1F9E33F3-E508-4938-BCD4-250E6EB4243A
UBIFS DBG (pid 1137): mount_ubifs: big_lpt              0
UBIFS DBG (pid 1137): mount_ubifs: log LEBs:            4 (3 - 6)
UBIFS DBG (pid 1137): mount_ubifs: LPT area LEBs:       2 (7 - 8)
UBIFS DBG (pid 1137): mount_ubifs: orphan area LEBs:    1 (9 - 9)
UBIFS DBG (pid 1137): mount_ubifs: main area LEBs:      163 (10 - 172)
UBIFS DBG (pid 1137): mount_ubifs: index LEBs:          5
UBIFS DBG (pid 1137): mount_ubifs: total index bytes:   109936 (107 KiB, 0 MiB)
UBIFS DBG (pid 1137): mount_ubifs: key hash type:       0
UBIFS DBG (pid 1137): mount_ubifs: tree fanout:         8
UBIFS DBG (pid 1137): mount_ubifs: reserved GC LEB:     -1
UBIFS DBG (pid 1137): mount_ubifs: first main LEB:      10
UBIFS DBG (pid 1137): mount_ubifs: max. znode size      240
UBIFS DBG (pid 1137): mount_ubifs: max. index node size 192
UBIFS DBG (pid 1137): mount_ubifs: node sizes:          data 48, inode 160, dentry 56
UBIFS DBG (pid 1137): mount_ubifs: node sizes:          trun 56, sb 4096, master 512
UBIFS DBG (pid 1137): mount_ubifs: node sizes:          ref 64, cmt. start 32, orph 32
UBIFS DBG (pid 1137): mount_ubifs: max. node sizes:     data 4144, inode 4256 dentry 312
UBIFS DBG (pid 1137): mount_ubifs: dead watermark:      2048
UBIFS DBG (pid 1137): mount_ubifs: dark watermark:      6144
UBIFS DBG (pid 1137): mount_ubifs: LEB overhead:        2656
UBIFS DBG (pid 1137): mount_ubifs: max. dark space:     1001472 (978 KiB, 0 MiB)
UBIFS DBG (pid 1137): mount_ubifs: maximum bud bytes:   3936256 (3844 KiB, 3 MiB)
UBIFS DBG (pid 1137): mount_ubifs: BG commit bud bytes: 3198208 (3123 KiB, 3 MiB)
UBIFS DBG (pid 1137): mount_ubifs: current bud bytes    47104 (46 KiB, 0 MiB)
UBIFS DBG (pid 1137): mount_ubifs: max. seq. number:    156798
UBIFS DBG (pid 1137): mount_ubifs: commit number:       131
UBIFS DBG (pid 1137): ubifs_iget: inode 1
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, inode)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 1137): fallible_read_node: LEB 131:79000, key (1, inode)
UBIFS DBG (pid 1137): try_read_node: LEB 131:79000, inode node, length 160
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: (lowest) (1, direntry, 0x000000)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x000000)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 0, lvl 0, n 0
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83000, direntry node, length 60
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: bin (1, direntry, 0x23605a)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x23605a)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5b00, n 1
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83064, direntry node, length 60
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: etc (1, direntry, 0x24a603)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x24a603)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5b00, n 2
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83128, direntry node, length 60
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: lib (1, direntry, 0x2697fa)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x2697fa)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 3
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5b00, n 3
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83192, direntry node, length 60
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: var (1, direntry, 0x29ab98)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x29ab98)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 4
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5b00, n 4
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83256, direntry node, length 60
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: usr (1, direntry, 0x29e101)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x29e101)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 5
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5b00, n 5
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83320, direntry node, length 78
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: .enable_usb_access.sh (1, direntry, 0x43dba9)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x43dba9)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 6
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5b00, n 6
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83400, direntry node, length 61
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: sbin (1, direntry, 0x1c000e1)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x1c000e1)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 7
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5b00, n 7
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83464, direntry node, length 61
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: root (1, direntry, 0x1c0d8cc)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x1c0d8cc)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 0
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5c00, n 0
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83528, direntry node, length 62
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: .next (1, direntry, 0x8c4efda)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x8c4efda)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 1
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5c00, n 1
UBIFS DBG (pid 1137): ubifs_read_node: LEB 131:83592, direntry node, length 62
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: cores (1, direntry, 0x10f9ee90)
UBIFS DBG (pid 1137): ubifs_lookup_level0: search key (1, direntry, 0x10f9ee90)
UBIFS DBG (pid 1137): ubifs_lookup_level0: found 1, lvl 0, n 2
UBIFS DBG (pid 1137): ubifs_tnc_next_ent: rc returned 1, znode c6fc5c00, n 2
\
--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg_with_file_create_fail.txt"

UBI: background thread "ubi_bgt0d" started, PID 1120
 ubiblka: unknown partition table
 ubiblkb: unknown partition table
 ubiblkc: unknown partition table
 ubiblkd: unknown partition table
 ubiblke: unknown partition table
UBIFS DBG (pid 1138): ubifs_get_sb: name ubi0:config, flags 0x8000
UBIFS DBG (pid 1138): ubifs_get_sb: opened ubi0_5
UBIFS DBG (pid 1140): ubifs_bg_thread: background thread "ubifs_bgt0_5" started, PID 1140
UBIFS: recovery needed
UBIFS DBG (pid 1138): ubifs_replay_journal: start replaying the journal
UBIFS DBG (pid 1138): replay_log_leb: replay log LEB 6:0
UBIFS DBG (pid 1138): replay_log_leb: commit start sqnum 156587
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 110:124928, head 0
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 134:124928, head 2
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 43:124928, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 156:124928, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 128:124928, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 84:124928, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 79:124928, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 72:124928, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 109:124928, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 17:124928, head 2
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 42:122880, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 90:122880, head 2
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 32:122880, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 76:122880, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 123:122880, head 2
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 102:122880, head 1
UBIFS DBG (pid 1138): add_replay_bud: add replay bud LEB 122:124928, head 1
UBIFS DBG (pid 1138): replay_log_leb: replay log LEB 3:0
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 110, head 0
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 110:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 134, head 2
UBIFS DBG (pid 1138): insert_node: add LEB 134:124928, key (84, data, 697)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 134:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 43, head 1
UBIFS DBG (pid 1138): insert_node: add LEB 43:124928, key (69, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 43:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 156, head 1
UBIFS DBG (pid 1138): insert_node: add LEB 156:124928, key (84, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 156:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 128, head 1
UBIFS DBG (pid 1138): insert_node: add LEB 128:124928, key (84, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 128:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 84, head 1
UBIFS DBG (pid 1138): insert_node: add LEB 84:124928, key (86, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 84:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 79, head 1
UBIFS DBG (pid 1138): insert_node: add LEB 79:124928, key (373, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 79:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 72, head 1
UBIFS DBG (pid 1138): insert_dent: add LEB 72:124928, key (87, direntry, 0x15e3ffdf)
UBIFS DBG (pid 1138): insert_node: add LEB 72:125008, key (374, inode)
UBIFS DBG (pid 1138): insert_node: add LEB 72:125168, key (87, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 72:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 109, head 1
UBIFS DBG (pid 1138): insert_dent: add LEB 109:124928, key (87, direntry, 0x15e3ffdf)
UBIFS DBG (pid 1138): insert_node: add LEB 109:125008, key (374, inode)
UBIFS DBG (pid 1138): insert_node: add LEB 109:125168, key (87, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 109:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 17, head 2
UBIFS DBG (pid 1138): insert_node: add LEB 17:124928, key (374, data, 0)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 17:124928
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 42, head 1
UBIFS DBG (pid 1138): insert_dent: add LEB 42:122880, key (87, direntry, 0x1420b682)
UBIFS DBG (pid 1138): insert_node: add LEB 42:122960, key (375, inode)
UBIFS DBG (pid 1138): insert_node: add LEB 42:123120, key (87, inode)
UBIFS DBG (pid 1138): insert_dent: add LEB 42:124928, key (87, direntry, 0x1420b682)
UBIFS DBG (pid 1138): insert_node: add LEB 42:125008, key (375, inode)
UBIFS DBG (pid 1138): insert_node: add LEB 42:125168, key (87, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 42:122880
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 90, head 2
UBIFS DBG (pid 1138): insert_node: add LEB 90:122880, key (375, data, 0)
UBIFS DBG (pid 1138): insert_node: add LEB 90:124928, key (375, data, 0)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 90:122880
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 32, head 1
UBIFS DBG (pid 1138): insert_node: add LEB 32:122880, key (373, inode)
UBIFS DBG (pid 1138): insert_node: add LEB 32:124928, key (69, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 32:122880
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 76, head 1
UBIFS DBG (pid 1138): insert_node: add LEB 76:122880, key (84, inode)
UBIFS DBG (pid 1138): insert_node: add LEB 76:124928, key (84, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 76:122880
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 123, head 2
UBIFS DBG (pid 1138): insert_node: add LEB 123:122880, key (84, data, 697)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 123:122880
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 102, head 1
UBIFS DBG (pid 1138): insert_node: add LEB 102:122880, key (86, inode)
UBIFS DBG (pid 1138): insert_node: add LEB 102:124928, key (373, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 102:122880
UBIFS DBG (pid 1138): replay_bud: replay bud LEB 122, head 1
UBIFS DBG (pid 1138): insert_dent: add LEB 122:124928, key (87, direntry, 0x19c6cdcd)
UBIFS DBG (pid 1138): insert_node: add LEB 122:125008, key (376, inode)
UBIFS DBG (pid 1138): insert_node: add LEB 122:125168, key (87, inode)
UBIFS DBG (pid 1138): insert_ref_node: add ref LEB 122:124928
UBIFS DBG (pid 1138): apply_replay_entry: LEB 110:124928 len 0 flgs 2 sqnum 156588 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 134:124928 len 0 flgs 2 sqnum 156589 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 43:124928 len 0 flgs 2 sqnum 156750 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 43:124928 len 160 flgs 0 sqnum 156751 (69, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 156:124928 len 0 flgs 2 sqnum 156752 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 156:124928 len 160 flgs 0 sqnum 156753 (84, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 128:124928 len 0 flgs 2 sqnum 156754 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 128:124928 len 160 flgs 0 sqnum 156755 (84, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 134:124928 len 2039 flgs 0 sqnum 156756 (84, data, 697)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 84:124928 len 0 flgs 2 sqnum 156757 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 84:124928 len 160 flgs 0 sqnum 156758 (86, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 79:124928 len 0 flgs 2 sqnum 156759 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 79:124928 len 160 flgs 0 sqnum 156760 (373, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 72:124928 len 0 flgs 2 sqnum 156762 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 72:124928 len 79 flgs 0 sqnum 156763 (87, direntry, 0x15e3ffdf)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 72:125008 len 160 flgs 0 sqnum 156764 (374, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 72:125168 len 160 flgs 0 sqnum 156765 (87, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 109:124928 len 0 flgs 2 sqnum 156766 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 109:124928 len 79 flgs 1 sqnum 156767 (87, direntry, 0x15e3ffdf)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 109:125008 len 160 flgs 1 sqnum 156768 (374, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 109:125168 len 160 flgs 0 sqnum 156769 (87, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 17:124928 len 0 flgs 2 sqnum 156770 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 17:124928 len 560 flgs 0 sqnum 156771 (374, data, 0)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 42:122880 len 0 flgs 2 sqnum 156773 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 42:122880 len 79 flgs 0 sqnum 156774 (87, direntry, 0x1420b682)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 42:122960 len 160 flgs 0 sqnum 156775 (375, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 42:123120 len 160 flgs 0 sqnum 156776 (87, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 42:124928 len 79 flgs 1 sqnum 156777 (87, direntry, 0x1420b682)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 42:125008 len 160 flgs 1 sqnum 156778 (375, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 42:125168 len 160 flgs 0 sqnum 156779 (87, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 90:122880 len 0 flgs 2 sqnum 156780 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 90:122880 len 52 flgs 0 sqnum 156781 (375, data, 0)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 90:124928 len 1076 flgs 0 sqnum 156782 (375, data, 0)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 32:122880 len 0 flgs 2 sqnum 156783 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 32:122880 len 160 flgs 0 sqnum 156784 (373, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 32:124928 len 160 flgs 0 sqnum 156785 (69, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 76:122880 len 0 flgs 2 sqnum 156786 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 76:122880 len 160 flgs 0 sqnum 156787 (84, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 76:124928 len 160 flgs 0 sqnum 156788 (84, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 123:122880 len 0 flgs 2 sqnum 156789 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 123:122880 len 2210 flgs 0 sqnum 156790 (84, data, 697)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 102:122880 len 0 flgs 2 sqnum 156791 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 102:122880 len 160 flgs 0 sqnum 156792 (86, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 102:124928 len 160 flgs 0 sqnum 156793 (373, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 122:124928 len 0 flgs 2 sqnum 156795 (0, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 122:124928 len 79 flgs 0 sqnum 156796 (87, direntry, 0x19c6cdcd)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 122:125008 len 160 flgs 0 sqnum 156797 (376, inode)
UBIFS DBG (pid 1138): apply_replay_entry: LEB 122:125168 len 160 flgs 0 sqnum 156798 (87, inode)
UBIFS DBG (pid 1138): ubifs_replay_journal: finished, log head LEB 6:32768, max_sqnum 156798, highest_inum 376
UBIFS DBG (pid 1138): ubifs_find_dirty_leb: scanning LPT for a dirty LEB
UBIFS error (pid 1138): ubifs_rcvry_gc_commit: could not find a dirty LEB
UBIFS: recovery completed
UBIFS assert failed in mount_ubifs at 1358 (pid 1138)
Backtrace:
[<c0039750>] (dump_backtrace+0x0/0x118) from [<c03d2d3c>] (dump_stack+0x20/0x24)
 r6:00000000 r5:c6fc5000 r4:00000000 r3:00000000
[<c03d2d1c>] (dump_stack+0x0/0x24) from [<c01ad754>] (ubifs_get_sb+0x1268/0x1a1c)
[<c01ac4ec>] (ubifs_get_sb+0x0/0x1a1c) from [<c00d864c>] (vfs_kern_mount+0x64/0x12c)
[<c00d85e8>] (vfs_kern_mount+0x0/0x12c) from [<c00d8780>] (do_kern_mount+0x44/0xf0)
 r8:00008000 r7:c32b0c00 r6:00000000 r5:c32b0a80 r4:c051e7ac
[<c00d873c>] (do_kern_mount+0x0/0xf0) from [<c00ef578>] (do_mount+0x5e4/0x654)
 r8:00000000 r7:00000000 r6:00000000 r5:c32b0c00 r4:00000020
r3:00000000
[<c00eef94>] (do_mount+0x0/0x654) from [<c00ef840>] (sys_mount+0x94/0xd4)
[<c00ef7ac>] (sys_mount+0x0/0xd4) from [<c0035dc0>] (ret_fast_syscall+0x0/0x2c)
 r7:00000015 r6:4001fb20 r5:00008000 r4:00000000
UBIFS: mounted UBI device 0, volume 5, name "config"
UBIFS: file system size:   20697088 bytes (20212 KiB, 19 MiB, 163 LEBs)
UBIFS: journal size:       4444160 bytes (4340 KiB, 4 MiB, 35 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS DBG (pid 1138): mount_ubifs: compiled on:         Jun 18 2014 at 10:37:20
UBIFS DBG (pid 1138): mount_ubifs: min. I/O unit size:  2048 bytes
UBIFS DBG (pid 1138): mount_ubifs: LEB size:            126976 bytes (124 KiB)
UBIFS DBG (pid 1138): mount_ubifs: data journal heads:  1
UBIFS DBG (pid 1138): mount_ubifs: UUID:                1F9E33F3-E508-4938-BCD4-250E6EB4243A
UBIFS DBG (pid 1138): mount_ubifs: big_lpt              0
UBIFS DBG (pid 1138): mount_ubifs: log LEBs:            4 (3 - 6)
UBIFS DBG (pid 1138): mount_ubifs: LPT area LEBs:       2 (7 - 8)
UBIFS DBG (pid 1138): mount_ubifs: orphan area LEBs:    1 (9 - 9)
UBIFS DBG (pid 1138): mount_ubifs: main area LEBs:      163 (10 - 172)
UBIFS DBG (pid 1138): mount_ubifs: index LEBs:          5
UBIFS DBG (pid 1138): mount_ubifs: total index bytes:   109936 (107 KiB, 0 MiB)
UBIFS DBG (pid 1138): mount_ubifs: key hash type:       0
UBIFS DBG (pid 1138): mount_ubifs: tree fanout:         8
UBIFS DBG (pid 1138): mount_ubifs: reserved GC LEB:     -1
UBIFS DBG (pid 1138): mount_ubifs: first main LEB:      10
UBIFS DBG (pid 1138): mount_ubifs: max. znode size      240
UBIFS DBG (pid 1138): mount_ubifs: max. index node size 192
UBIFS DBG (pid 1138): mount_ubifs: node sizes:          data 48, inode 160, dentry 56
UBIFS DBG (pid 1138): mount_ubifs: node sizes:          trun 56, sb 4096, master 512
UBIFS DBG (pid 1138): mount_ubifs: node sizes:          ref 64, cmt. start 32, orph 32
UBIFS DBG (pid 1138): mount_ubifs: max. node sizes:     data 4144, inode 4256 dentry 312
UBIFS DBG (pid 1138): mount_ubifs: dead watermark:      2048
UBIFS DBG (pid 1138): mount_ubifs: dark watermark:      6144
UBIFS DBG (pid 1138): mount_ubifs: LEB overhead:        2656
UBIFS DBG (pid 1138): mount_ubifs: max. dark space:     1001472 (978 KiB, 0 MiB)
UBIFS DBG (pid 1138): mount_ubifs: maximum bud bytes:   3936256 (3844 KiB, 3 MiB)
UBIFS DBG (pid 1138): mount_ubifs: BG commit bud bytes: 3198208 (3123 KiB, 3 MiB)
UBIFS DBG (pid 1138): mount_ubifs: current bud bytes    47104 (46 KiB, 0 MiB)
UBIFS DBG (pid 1138): mount_ubifs: max. seq. number:    156798
UBIFS DBG (pid 1138): mount_ubifs: commit number:       131
UBIFS DBG (pid 1138): ubifs_iget: inode 1
UBIFS DBG (pid 1144): ubifs_statfs: free space 2842510 bytes (693 blocks)
UBIFS DBG (pid 1145): ubifs_readdir: dir ino 1, f_pos 0x0
UBIFS DBG (pid 1145): ubifs_readdir: feed 'bin', ino 65, new f_pos 0x23605a
UBIFS DBG (pid 1145): ubifs_readdir: feed 'etc', ino 67, new f_pos 0x24a603
UBIFS DBG (pid 1145): ubifs_readdir: feed 'lib', ino 72, new f_pos 0x2697fa
UBIFS DBG (pid 1145): ubifs_readdir: feed 'var', ino 71, new f_pos 0x29ab98
UBIFS DBG (pid 1145): ubifs_readdir: feed 'usr', ino 68, new f_pos 0x29e101
UBIFS DBG (pid 1145): ubifs_readdir: feed '.enable_usb_access.sh', ino 70, new f_pos 0x43dba9
UBIFS DBG (pid 1145): ubifs_readdir: feed 'sbin', ino 73, new f_pos 0x1c000e1
UBIFS DBG (pid 1145): ubifs_readdir: feed 'root', ino 69, new f_pos 0x1c0d8cc
UBIFS DBG (pid 1145): ubifs_readdir: feed '.next', ino 66, new f_pos 0x8c4efda
UBIFS DBG (pid 1145): ubifs_readdir: feed 'cores', ino 114, new f_pos 0x10f9ee90
UBIFS DBG (pid 1145): ubifs_lookup: 'bin' in dir ino 1
UBIFS DBG (pid 1145): ubifs_iget: inode 65
UBIFS DBG (pid 1145): ubifs_lookup: 'etc' in dir ino 1
UBIFS DBG (pid 1145): ubifs_iget: inode 67
UBIFS DBG (pid 1145): ubifs_lookup: 'lib' in dir ino 1
UBIFS DBG (pid 1145): ubifs_iget: inode 72
UBIFS DBG (pid 1145): ubifs_lookup: 'var' in dir ino 1
UBIFS DBG (pid 1145): ubifs_iget: inode 71
UBIFS DBG (pid 1145): ubifs_lookup: 'usr' in dir ino 1
UBIFS DBG (pid 1145): ubifs_iget: inode 68
UBIFS DBG (pid 1145): ubifs_lookup: 'sbin' in dir ino 1
UBIFS DBG (pid 1145): ubifs_iget: inode 73
UBIFS DBG (pid 1145): ubifs_lookup: 'root' in dir ino 1
UBIFS DBG (pid 1145): ubifs_iget: inode 69
UBIFS DBG (pid 1145): ubifs_lookup: 'cores' in dir ino 1
UBIFS DBG (pid 1145): ubifs_iget: inode 114
UBIFS DBG (pid 1145): ubifs_readdir: dir ino 1, f_pos 0x2
UBIFS DBG (pid 1146): ubifs_lookup: 'blah' in dir ino 1
UBIFS DBG (pid 1146): ubifs_lookup: not found
UBIFS DBG (pid 1146): ubifs_create: dent 'blah', mode 0x81a4 in dir ino 1
UBIFS DBG (pid 1146): ubifs_jnl_update: ino 377, dent 'blah', data len 0 in dir ino 1
UBIFS DBG (pid 1146): ubifs_find_free_space: min_space 384
UBIFS DBG (pid 1146): reserve_space: no free space in jhead 1 (base), run GC
UBIFS DBG (pid 1146): ubifs_gc_should_commit: commit not requested
UBIFS DBG (pid 1146): ubifs_gc_should_commit: commit not requested
UBIFS DBG (pid 1146): ubifs_find_dirty_leb: found LEB 116, free 0, dirty 119952, flags 0x22
UBIFS DBG (pid 1146): ubifs_garbage_collect: found LEB 116: free 0, dirty 119952, sum 119952 (min. space 2048)
UBIFS assert failed in ubifs_garbage_collect_leb at 431 (pid 1146)
Backtrace:
[<c0039750>] (dump_backtrace+0x0/0x118) from [<c03d2d3c>] (dump_stack+0x20/0x24)
 r6:c32c6000 r5:c32c7cb8 r4:c6fc5000 r3:00000000
[<c03d2d1c>] (dump_stack+0x0/0x24) from [<c01bd6b0>] (ubifs_garbage_collect_leb+0x90/0x7ec)
[<c01bd620>] (ubifs_garbage_collect_leb+0x0/0x7ec) from [<c01be18c>] (ubifs_garbage_collect+0x380/0x760)
[<c01bde0c>] (ubifs_garbage_collect+0x0/0x760) from [<c01a2a70>] (make_reservation+0x158/0x540)
[<c01a2918>] (make_reservation+0x0/0x540) from [<c01a355c>] (ubifs_jnl_update+0x1e8/0x608)
[<c01a3374>] (ubifs_jnl_update+0x0/0x608) from [<c01a9f10>] (ubifs_create+0x138/0x1ec)
[<c01a9dd8>] (ubifs_create+0x0/0x1ec) from [<c00e0f64>] (vfs_create+0x88/0xb8)
[<c00e0edc>] (vfs_create+0x0/0xb8) from [<c00e2610>] (do_last.isra.44+0x2c0/0x5a0)
 r8:00000026 r7:c7b50a80 r6:00020042 r5:c32c7f28 r4:c32c7ed0
[<c00e2350>] (do_last.isra.44+0x0/0x5a0) from [<c00e2a68>] (do_filp_open+0x178/0x4bc)
[<c00e28f0>] (do_filp_open+0x0/0x4bc) from [<c00d65fc>] (do_sys_open+0x6c/0xf4)
[<c00d6590>] (do_sys_open+0x0/0xf4) from [<c00d66b4>] (sys_open+0x30/0x34)
[<c00d6684>] (sys_open+0x0/0x34) from [<c0035dc0>] (ret_fast_syscall+0x0/0x2c)
UBIFS DBG (pid 1146): ubifs_garbage_collect_leb: indexing LEB 116 (free 0, dirty 119952)
UBIFS DBG (pid 1146): ubifs_garbage_collect: indexing LEB 116 freed, continue
UBIFS DBG (pid 1146): ubifs_gc_should_commit: commit not requested
UBIFS DBG (pid 1146): ubifs_find_dirty_leb: found LEB 81, free 0, dirty 64816, flags 0x1
UBIFS DBG (pid 1146): ubifs_garbage_collect: found LEB 81: free 0, dirty 64816, sum 64816 (min. space 2048)
UBIFS assert failed in ubifs_garbage_collect_leb at 431 (pid 1146)
Backtrace:
[<c0039750>] (dump_backtrace+0x0/0x118) from [<c03d2d3c>] (dump_stack+0x20/0x24)
 r6:c32c6000 r5:c32c7cb8 r4:c6fc5000 r3:00000000
[<c03d2d1c>] (dump_stack+0x0/0x24) from [<c01bd6b0>] (ubifs_garbage_collect_leb+0x90/0x7ec)
[<c01bd620>] (ubifs_garbage_collect_leb+0x0/0x7ec) from [<c01be18c>] (ubifs_garbage_collect+0x380/0x760)
[<c01bde0c>] (ubifs_garbage_collect+0x0/0x760) from [<c01a2a70>] (make_reservation+0x158/0x540)
[<c01a2918>] (make_reservation+0x0/0x540) from [<c01a355c>] (ubifs_jnl_update+0x1e8/0x608)
[<c01a3374>] (ubifs_jnl_update+0x0/0x608) from [<c01a9f10>] (ubifs_create+0x138/0x1ec)
[<c01a9dd8>] (ubifs_create+0x0/0x1ec) from [<c00e0f64>] (vfs_create+0x88/0xb8)
[<c00e0edc>] (vfs_create+0x0/0xb8) from [<c00e2610>] (do_last.isra.44+0x2c0/0x5a0)
 r8:00000026 r7:c7b50a80 r6:00020042 r5:c32c7f28 r4:c32c7ed0
[<c00e2350>] (do_last.isra.44+0x0/0x5a0) from [<c00e2a68>] (do_filp_open+0x178/0x4bc)
[<c00e28f0>] (do_filp_open+0x0/0x4bc) from [<c00d65fc>] (do_sys_open+0x6c/0xf4)
[<c00d6590>] (do_sys_open+0x0/0xf4) from [<c00d66b4>] (sys_open+0x30/0x34)
[<c00d6684>] (sys_open+0x0/0x34) from [<c0035dc0>] (ret_fast_syscall+0x0/0x2c)
UBIFS DBG (pid 1146): ubifs_garbage_collect_leb: data LEB 81 (free 0, dirty 64816)
UBIFS assert failed in switch_gc_head at 86 (pid 1146)
Backtrace:
[<c0039750>] (dump_backtrace+0x0/0x118) from [<c03d2d3c>] (dump_stack+0x20/0x24)
 r6:ffffffff r5:c6fc5000 r4:c6fc5000 r3:00000000
[<c03d2d1c>] (dump_stack+0x0/0x24) from [<c01bd504>] (switch_gc_head+0x64/0x180)
[<c01bd4a0>] (switch_gc_head+0x0/0x180) from [<c01bdc90>] (ubifs_garbage_collect_leb+0x670/0x7ec)
 r7:c3323100 r6:c333bd00 r5:c32c7c68 r4:c6fc5000
[<c01bd620>] (ubifs_garbage_collect_leb+0x0/0x7ec) from [<c01be18c>] (ubifs_garbage_collect+0x380/0x760)
[<c01bde0c>] (ubifs_garbage_collect+0x0/0x760) from [<c01a2a70>] (make_reservation+0x158/0x540)
[<c01a2918>] (make_reservation+0x0/0x540) from [<c01a355c>] (ubifs_jnl_update+0x1e8/0x608)
[<c01a3374>] (ubifs_jnl_update+0x0/0x608) from [<c01a9f10>] (ubifs_create+0x138/0x1ec)
[<c01a9dd8>] (ubifs_create+0x0/0x1ec) from [<c00e0f64>] (vfs_create+0x88/0xb8)
[<c00e0edc>] (vfs_create+0x0/0xb8) from [<c00e2610>] (do_last.isra.44+0x2c0/0x5a0)
 r8:00000026 r7:c7b50a80 r6:00020042 r5:c32c7f28 r4:c32c7ed0
[<c00e2350>] (do_last.isra.44+0x0/0x5a0) from [<c00e2a68>] (do_filp_open+0x178/0x4bc)
[<c00e28f0>] (do_filp_open+0x0/0x4bc) from [<c00d65fc>] (do_sys_open+0x6c/0xf4)
[<c00d6590>] (do_sys_open+0x0/0xf4) from [<c00d66b4>] (sys_open+0x30/0x34)
[<c00d6684>] (sys_open+0x0/0x34) from [<c0035dc0>] (ret_fast_syscall+0x0/0x2c)
UBIFS DBG (pid 1146): switch_gc_head: switch GC head from LEB 110:124928 to LEB -1 (waste 2048 bytes)
UBIFS error (pid 1146): ubifs_leb_unmap: unmap LEB -1 failed, error -22
UBIFS warning (pid 1146): ubifs_ro_mode: switched to read-only mode, error -22
Backtrace:
[<c0039750>] (dump_backtrace+0x0/0x118) from [<c03d2d3c>] (dump_stack+0x20/0x24)
 r6:c32c6000 r5:c6fc5000 r4:ffffffea r3:00000000
[<c03d2d1c>] (dump_stack+0x0/0x24) from [<c01af7e4>] (ubifs_ro_mode+0x7c/0x8c)
[<c01af768>] (ubifs_ro_mode+0x0/0x8c) from [<c01be4bc>] (ubifs_garbage_collect+0x6b0/0x760)
[<c01bde0c>] (ubifs_garbage_collect+0x0/0x760) from [<c01a2a70>] (make_reservation+0x158/0x540)
[<c01a2918>] (make_reservation+0x0/0x540) from [<c01a355c>] (ubifs_jnl_update+0x1e8/0x608)
[<c01a3374>] (ubifs_jnl_update+0x0/0x608) from [<c01a9f10>] (ubifs_create+0x138/0x1ec)
[<c01a9dd8>] (ubifs_create+0x0/0x1ec) from [<c00e0f64>] (vfs_create+0x88/0xb8)
[<c00e0edc>] (vfs_create+0x0/0xb8) from [<c00e2610>] (do_last.isra.44+0x2c0/0x5a0)
 r8:00000026 r7:c7b50a80 r6:00020042 r5:c32c7f28 r4:c32c7ed0
[<c00e2350>] (do_last.isra.44+0x0/0x5a0) from [<c00e2a68>] (do_filp_open+0x178/0x4bc)
[<c00e28f0>] (do_filp_open+0x0/0x4bc) from [<c00d65fc>] (do_sys_open+0x6c/0xf4)
[<c00d6590>] (do_sys_open+0x0/0xf4) from [<c00d66b4>] (sys_open+0x30/0x34)
[<c00d6684>] (sys_open+0x0/0x34) from [<c0035dc0>] (ret_fast_syscall+0x0/0x2c)
UBIFS error (pid 1146): make_reservation: cannot reserve 384 bytes in jhead 1, error -22
UBIFS error (pid 1146): ubifs_create: cannot create regular file, error -22
UBIFS DBG (pid 1147): ubifs_readdir: dir ino 1, f_pos 0x0
UBIFS DBG (pid 1147): ubifs_readdir: feed 'bin', ino 65, new f_pos 0x23605a
UBIFS DBG (pid 1147): ubifs_readdir: feed 'etc', ino 67, new f_pos 0x24a603
UBIFS DBG (pid 1147): ubifs_readdir: feed 'lib', ino 72, new f_pos 0x2697fa
UBIFS DBG (pid 1147): ubifs_readdir: feed 'var', ino 71, new f_pos 0x29ab98
UBIFS DBG (pid 1147): ubifs_readdir: feed 'usr', ino 68, new f_pos 0x29e101
UBIFS DBG (pid 1147): ubifs_readdir: feed '.enable_usb_access.sh', ino 70, new f_pos 0x43dba9
UBIFS DBG (pid 1147): ubifs_readdir: feed 'sbin', ino 73, new f_pos 0x1c000e1
UBIFS DBG (pid 1147): ubifs_readdir: feed 'root', ino 69, new f_pos 0x1c0d8cc
UBIFS DBG (pid 1147): ubifs_readdir: feed '.next', ino 66, new f_pos 0x8c4efda
UBIFS DBG (pid 1147): ubifs_readdir: feed 'cores', ino 114, new f_pos 0x10f9ee90
UBIFS DBG (pid 1147): ubifs_readdir: dir ino 1, f_pos 0x2
UBIFS DBG (pid 1149): ubifs_readdir: dir ino 1, f_pos 0x0
UBIFS DBG (pid 1149): ubifs_readdir: feed 'bin', ino 65, new f_pos 0x23605a
UBIFS DBG (pid 1149): ubifs_readdir: feed 'etc', ino 67, new f_pos 0x24a603
UBIFS DBG (pid 1149): ubifs_readdir: feed 'lib', ino 72, new f_pos 0x2697fa
UBIFS DBG (pid 1149): ubifs_readdir: feed 'var', ino 71, new f_pos 0x29ab98
UBIFS DBG (pid 1149): ubifs_readdir: feed 'usr', ino 68, new f_pos 0x29e101
UBIFS DBG (pid 1149): ubifs_readdir: feed '.enable_usb_access.sh', ino 70, new f_pos 0x43dba9
UBIFS DBG (pid 1149): ubifs_readdir: feed 'sbin', ino 73, new f_pos 0x1c000e1
UBIFS DBG (pid 1149): ubifs_readdir: feed 'root', ino 69, new f_pos 0x1c0d8cc
UBIFS DBG (pid 1149): ubifs_readdir: feed '.next', ino 66, new f_pos 0x8c4efda
UBIFS DBG (pid 1149): ubifs_readdir: feed 'cores', ino 114, new f_pos 0x10f9ee90
UBIFS DBG (pid 1149): ubifs_readdir: dir ino 1, f_pos 0x2
UBIFS DBG (pid 1107): ubifs_readdir: dir ino 1, f_pos 0x0
UBIFS DBG (pid 1107): ubifs_readdir: feed 'bin', ino 65, new f_pos 0x23605a
UBIFS DBG (pid 1107): ubifs_readdir: feed 'etc', ino 67, new f_pos 0x24a603
UBIFS DBG (pid 1107): ubifs_readdir: feed 'lib', ino 72, new f_pos 0x2697fa
UBIFS DBG (pid 1107): ubifs_readdir: feed 'var', ino 71, new f_pos 0x29ab98
UBIFS DBG (pid 1107): ubifs_readdir: feed 'usr', ino 68, new f_pos 0x29e101
UBIFS DBG (pid 1107): ubifs_readdir: feed '.enable_usb_access.sh', ino 70, new f_pos 0x43dba9
UBIFS DBG (pid 1107): ubifs_readdir: feed 'sbin', ino 73, new f_pos 0x1c000e1
UBIFS DBG (pid 1107): ubifs_readdir: feed 'root', ino 69, new f_pos 0x1c0d8cc
UBIFS DBG (pid 1107): ubifs_readdir: feed '.next', ino 66, new f_pos 0x8c4efda
UBIFS DBG (pid 1107): ubifs_readdir: feed 'cores', ino 114, new f_pos 0x10f9ee90
UBIFS DBG (pid 1107): ubifs_readdir: dir ino 1, f_pos 0x2
UBIFS DBG (pid 1150): ubifs_lookup: 'al' in dir ino 67
UBIFS DBG (pid 1150): ubifs_lookup: not found
UBIFS DBG (pid 1151): ubifs_remount_fs: old flags 0x60008401, new flags 0x8000
UBIFS: parse 0
UBIFS error (pid 1151): ubifs_parse_options: unrecognized mount option "0" or missing value
UBIFS error (pid 1151): ubifs_remount_fs: invalid or unknown remount parameter
\
--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg_with_mount_fail.txt"

UBIFS DBG (pid 1133): ubifs_get_sb: name ubi0:config, flags 0x8000
UBIFS DBG (pid 1133): ubifs_get_sb: opened ubi0_5
UBIFS DBG (pid 1133): ubifs_read_node: LEB 0:0, superblock node, length 4096
UBIFS DBG (pid 1133): ubifs_start_scan: scan LEB 1:0
UBIFS DBG (pid 1135): ubifs_bg_thread: background thread "ubifs_bgt0_5" started, PID 1135
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:0 (126976 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:512 (126464 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 2048
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:2048 (124928 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:2560 (124416 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 4096
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:4096 (122880 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:4608 (122368 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 6144
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:6144 (120832 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:6656 (120320 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 8192
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:8192 (118784 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:8704 (118272 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 10240
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:10240 (116736 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:10752 (116224 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 12288
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:12288 (114688 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:12800 (114176 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 14336
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:14336 (112640 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:14848 (112128 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 16384
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:16384 (110592 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:16896 (110080 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 18432
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:18432 (108544 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:18944 (108032 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 20480
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:20480 (106496 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:20992 (105984 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 22528
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 1:22528 (104448 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1133): ubifs_end_scan: stop scanning LEB 1 at offset 22528
UBIFS DBG (pid 1133): ubifs_start_scan: scan LEB 2:0
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:0 (126976 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:512 (126464 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 2048
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:2048 (124928 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:2560 (124416 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 4096
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:4096 (122880 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:4608 (122368 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 6144
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:6144 (120832 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:6656 (120320 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 8192
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:8192 (118784 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:8704 (118272 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 10240
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:10240 (116736 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:10752 (116224 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 12288
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:12288 (114688 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:12800 (114176 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 14336
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:14336 (112640 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:14848 (112128 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 16384
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:16384 (110592 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:16896 (110080 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 18432
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:18432 (108544 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:18944 (108032 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 20480
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:20480 (106496 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:20992 (105984 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1133): ubifs_scan_a_node: 1508 bytes padded, offset now 22528
UBIFS DBG (pid 1133): ubifs_scan: look at LEB 2:22528 (104448 bytes left)
UBIFS DBG (pid 1133): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1133): ubifs_end_scan: stop scanning LEB 2 at offset 22528
UBIFS error (pid 1133): validate_master: bad master node at offset 20480 error 7
        magic          0x6101831
        crc            0x3bc3dd3d
        node_type      7 (master node)
        group_type     0 (no node group)
        sqnum          156822
        len            512
        highest_inum   376
        commit number  132
        flags          0x2
        log_lnum       3
        root_lnum      152
        root_offs      24648
        root_len       88
        gc_lnum        4294967295
        ihead_lnum     152
        ihead_offs     26624
        index_size     109968
        lpt_lnum       7
        lpt_offs       16857
        nhead_lnum     7
        nhead_offs     18432
        ltab_lnum      7
        ltab_offs      16384
        lsave_lnum     0
        lsave_offs     0
        lscan_lnum     12
        leb_cnt        173
        empty_lebs     0
        idx_lebs       5
        total_free     102400
        total_dirty    4656000
        total_used     15828720
        total_dead     0
        total_dark     837352
UBIFS DBG (pid 1135): ubifs_bg_thread: background thread "ubifs_bgt0_5" stops
\
--VbJkn9YxBvnuCH5J--
