Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtEme-000880-Uu
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 08:14:03 +0000
Received: by gyh20 with SMTP id 20so3886503gyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 01:13:58 -0700 (PDT)
MIME-Version: 1.0
Sender: vipals@gmail.com
In-Reply-To: <1313424117.8691.19.camel@sauron>
References: <CAKa7sPRir5YTdPCYAHEYvPGA5GhfTuyv0Z9ynDUtEmy=YHA2XQ@mail.gmail.com>
	<1313424117.8691.19.camel@sauron>
From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Tue, 16 Aug 2011 11:13:18 +0300
Message-ID: <CAKa7sPSscs-_2q0Ea5EL4h4LNaA6tR0DT_FWF1ts_mPAvnS61Q@mail.gmail.com>
Subject: Re: UBI FS on 2MiB eraseblock Hynix MLC NAND
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here are logs:

First boot:

U-Boot 2011.06-svn936 (Aug 03 2011 - 18:31:46)
Promwad-WTPlug

SoC:   Kirkwood 88F6282_?? RevID 0x01
DRAM:  1 GiB
NAND:  2048 MiB
In:    serial
Out:   serial
Err:   serial
Net:   egiga0, egiga1
88E1121 Initialized on egiga0, devadr 0
88E1121 Initialized on egiga1, devadr 1
Hit any key to stop autoboot:  0

NAND read: device 0 offset 0x400000, size 0x400000
 4194304 bytes read: OK
## Booting kernel from Legacy Image at 06400000 ...
   Image Name:   Linux-2.6.39.2-svn928
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2664652 Bytes =3D 2.5 MiB
   Load Address: 00008000
   Entry Point:  00008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.39.2-svn928 (vic@ws-024) (gcc version 4.4.1
(Sourcery G++ Lite 2009q3-68) ) #14 PREEMPT Thu Aug 4 09:14:55 EEST
2011
CPU: Feroceon 88FR131 [56251311] revision 1 (ARMv5TE), cr=3D00053977
CPU: VIVT data cache, VIVT instruction cache
Machine: Promwad WTPlug Reference Board
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 260096
Kernel command line: console=3DttyS0,115200 init=3D/etc/preinit ubi.mtd=3D2
root=3Dubi0:rootfs rootfstype=3Dubifs
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 1024MB =3D 1024MB total
Memory: 1034028k/1034028k available, 14548k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
    vmalloc : 0xc0800000 - 0xfe800000   ( 992 MB)
    lowmem  : 0x80000000 - 0xc0000000   (1024 MB)
    modules : 0x7f000000 - 0x80000000   (  16 MB)
      .init : 0x80008000 - 0x80026000   ( 120 kB)
      .text : 0x80026000 - 0x804a739c   (4613 kB)
      .data : 0x804a8000 - 0x804d5a80   ( 183 kB)
SLUB: Genslabs=3D13, HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
Preemptable hierarchical RCU implementation.
        RCU-based detection of stalled CPUs is disabled.
        Verbose stalled-CPUs detection is disabled.
NR_IRQS:114
sched_clock: 32 bits at 200MHz, resolution 5ns, wraps every 21474ms
Console: colour dummy device 80x30
Calibrating delay loop... 990.41 BogoMIPS (lpj=3D4952064)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
Kirkwood: MV88F6282-Rev-Unsupported, TCLK=3D200000000.
Feroceon L2: Cache support initialised.
Kirkwood PCIe port 0:
link down, ignoring
bio: create slab <bio-0> at 0
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Switching to clocksource orion_clocksource
Switched to NOHz mode on CPU #0
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
UDP hash table entries: 512 (order: 1, 8192 bytes)
UDP-Lite hash table entries: 512 (order: 1, 8192 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
JFFS2 version 2.2. (NAND) =EF=BF=BD=C2=A9 2001-2006 Red Hat, Inc.
msgmni has been set to 2019
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0xf1012000 (irq =3D 33) is a 16550A
console [ttyS0] enabled
loop: module loaded
NAND device: Manufacturer ID: 0xad, Chip ID: 0xd7 (Hynix NAND 4GiB 3,3V 8-b=
it)
Scanning device for bad blocks
Creating 4 MTD partitions on "orion_nand":
0x000000000000-0x000000400000 : "u-boot"
mtd: Giving out device 0 to u-boot
0x000000400000-0x000000800000 : "uImage"
mtd: Giving out device 1 to uImage
0x000000800000-0x000019800000 : "rootfs"
mtd: Giving out device 2 to rootfs
0x000019800000-0x000100000000 : "auxfs"
mtd: Giving out device 3 to auxfs
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   2097152 bytes (2048 KiB)
UBI: logical eraseblock size:    2080768 bytes
UBI: smallest flash I/O unit:    8192
UBI: VID header offset:          8192 (aligned 8192)
UBI: data offset:                16384
UBI: max. sequence number:       0
UBI: volume 0 ("rootfs") re-sized from 147 to 194 LEBs
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "rootfs"
UBI: MTD device size:            400 MiB
UBI: number of good PEBs:        200
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 200
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 1/0
UBI: image sequence number:  620376764
UBI: background thread "ubi_bgt0d" started, PID 407
mv643xx_eth: MV-643xx 10/100/1000 ethernet driver version 1.4
mv643xx_eth smi: probed
mv643xx_eth_port mv643xx_eth_port.0: eth0: port 0 with MAC address
02:50:43:f0:26:2f
mv643xx_eth_port mv643xx_eth_port.1: eth1: port 0 with MAC address
02:50:43:0e:42:ed
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
orion-ehci orion-ehci.0: Marvell Orion EHCI
orion-ehci orion-ehci.0: new USB bus registered, assigned bus number 1
orion-ehci orion-ehci.0: irq 19, io mem 0xf1050000
orion-ehci orion-ehci.0: USB 2.0 started, EHCI 1.00
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver ums-datafab
usbcore: registered new interface driver ums-freecom
usbcore: registered new interface driver ums-jumpshot
usbcore: registered new interface driver ums-sddr09
usbcore: registered new interface driver ums-sddr55
mousedev: PS/2 mouse device common for all mice
rtc-mv rtc-mv: rtc core: registered rtc-mv as rtc0
i2c /dev entries driver
Software Watchdog Timer: 0.07 initialized. soft_noboot=3D0
soft_margin=3D60 sec soft_panic=3D0 (nowayout=3D 1)
cpuidle: using governor ladder
cpuidle: using governor menu
mv_xor_shared mv_xor_shared.0: Marvell shared XOR driver
mv_xor_shared mv_xor_shared.1: Marvell shared XOR driver
mv_xor mv_xor.0: Marvell XOR: ( xor cpy )
mv_xor mv_xor.1: Marvell XOR: ( xor fill cpy )
mv_xor mv_xor.2: Marvell XOR: ( xor cpy )
mv_xor mv_xor.3: Marvell XOR: ( xor fill cpy )
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
TCP cubic registered
NET: Registered protocol family 17
lib80211: common routines for IEEE802.11 drivers
rtc-mv rtc-mv: setting system clock to 2000-02-26 02:35:26 UTC (951532526)
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: file system size:   382861312 bytes (373888 KiB, 365 MiB, 184 LEBs)
UBIFS: journal size:       18726913 bytes (18288 KiB, 17 MiB, 9 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: zlib
UBIFS: reserved for root:  0 bytes (0 KiB)
VFS: Mounted root (ubifs filesystem) on device 0:13.
Freeing init memory: 120K
- preinit -
Press the [f] key and hit [enter] to enter failsafe mode
- regular preinit -
UBI error: ubi_io_write: error -5 while writing 8192 bytes to PEB
3:32768, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write data to PEB 3
UBI: recover PEB 3, move data to PEB 80
UBI: run torture test for PEB 3
UBI: data was successfully recovered
UBI error: ubi_io_write: error -5 while writing 8192 bytes to PEB
4:32768, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write data to PEB 4
UBI: recover PEB 4, move data to PEB 81
UBI: PEB 3 passed torture test, do not mark it a bad
UBI: data was successfully recovered
UBI: run torture test for PEB 4
MTD_open
MTD_ioctl
MTD_ioctl
MTD_close
- init -

Please press Enter to activate this console.

BusyBox v1.18.5 (2011-07-28 14:33:34 EEST) built-in shell (ash)
Enter 'help' for a list of built-in commands.

  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 ATTITUDE ADJUSTMENT (bleeding edge, r951) ----------
  * 1/4 oz Vodka      Pour all ingredients into mixing
  * 1/4 oz Gin        tin with ice, strain into glass.
  * 1/4 oz Amaretto
  * 1/4 oz Triple sec
  * 1/4 oz Peach schnapps
  * 1/4 oz Sour mix
  * 1 splash Cranberry juice
 -----------------------------------------------------
root@OpenWrt:/# UBI: PEB 4 passed torture test, do not mark it a bad
mv643xx_eth_port mv643xx_eth_port.0: eth0: link up, 1000 Mb/s, full
duplex, flow control disabled
UBI error: ubi_io_write: error -5 while writing 8192 bytes to PEB
12:1277952, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write data to PEB 12
UBI: recover PEB 12, move data to PEB 82
UBI: run torture test for PEB 12
UBI: data was successfully recovered
UBI: PEB 12 passed torture test, do not mark it a bad

Second boot:

U-Boot 2011.06-svn936 (Aug 03 2011 - 18:31:46)
Promwad-WTPlug

SoC:   Kirkwood 88F6282_?? RevID 0x01
DRAM:  1 GiB
NAND:  2048 MiB
In:    serial
Out:   serial
Err:   serial
Net:   egiga0, egiga1
88E1121 Initialized on egiga0, devadr 0
88E1121 Initialized on egiga1, devadr 1
Hit any key to stop autoboot:  0

NAND read: device 0 offset 0x400000, size 0x400000
 4194304 bytes read: OK
## Booting kernel from Legacy Image at 06400000 ...
   Image Name:   Linux-2.6.39.2-svn928
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2675704 Bytes =3D 2.6 MiB
   Load Address: 00008000
   Entry Point:  00008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.39.2-svn928 (vic@ws-024) (gcc version 4.4.1
(Sourcery G++ Lite 2009q3-68) ) #29 PREEMPT Thu Aug 4 16:19:24 EEST
2011
CPU: Feroceon 88FR131 [56251311] revision 1 (ARMv5TE), cr=3D00053977
CPU: VIVT data cache, VIVT instruction cache
Machine: Promwad WTPlug Reference Board
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 260096
Kernel command line: console=3DttyS0,115200 init=3D/etc/preinit ubi.mtd=3D2
root=3Dubi0:rootfs rootfstype=3Dubifs
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 1024MB =3D 1024MB total
Memory: 1034012k/1034012k available, 14564k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
    vmalloc : 0xc0800000 - 0xfe800000   ( 992 MB)
    lowmem  : 0x80000000 - 0xc0000000   (1024 MB)
    modules : 0x7f000000 - 0x80000000   (  16 MB)
      .init : 0x80008000 - 0x80026000   ( 120 kB)
      .text : 0x80026000 - 0x804ab41c   (4630 kB)
      .data : 0x804ac000 - 0x804d9a80   ( 183 kB)
SLUB: Genslabs=3D13, HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
Preemptable hierarchical RCU implementation.
        RCU-based detection of stalled CPUs is disabled.
        Verbose stalled-CPUs detection is disabled.
NR_IRQS:114
sched_clock: 32 bits at 200MHz, resolution 5ns, wraps every 21474ms
Console: colour dummy device 80x30
Calibrating delay loop... 990.41 BogoMIPS (lpj=3D4952064)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
Kirkwood: MV88F6282-Rev-Unsupported, TCLK=3D200000000.
Feroceon L2: Cache support initialised.
Kirkwood PCIe port 0:
link down, ignoring
bio: create slab <bio-0> at 0
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Switching to clocksource orion_clocksource
Switched to NOHz mode on CPU #0
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
UDP hash table entries: 512 (order: 1, 8192 bytes)
UDP-Lite hash table entries: 512 (order: 1, 8192 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
JFFS2 version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
msgmni has been set to 2019
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0xf1012000 (irq =3D 33) is a 16550A
console [ttyS0] enabled
loop: module loaded
NAND device: Manufacturer ID: 0xad, Chip ID: 0xd7 (Hynix NAND 4GiB 3,3V 8-b=
it)
Scanning device for bad blocks
Creating 4 MTD partitions on "orion_nand":
0x000000000000-0x000000400000 : "u-boot"
0x000000400000-0x000000800000 : "uImage"
0x000000800000-0x000019800000 : "rootfs"
0x000019800000-0x000100000000 : "auxfs"
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   2097152 bytes (2048 KiB)
UBI: logical eraseblock size:    2080768 bytes
UBI: smallest flash I/O unit:    8192
UBI: VID header offset:          8192 (aligned 8192)
UBI: data offset:                16384
UBI: max. sequence number:       10
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "rootfs"
UBI: MTD device size:            400 MiB
UBI: number of good PEBs:        200
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 200
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 4/1
UBI: image sequence number:  934388287
UBI: background thread "ubi_bgt0d" started, PID 407
mv643xx_eth: MV-643xx 10/100/1000 ethernet driver version 1.4
mv643xx_eth smi: probed
mv643xx_eth_port mv643xx_eth_port.0: eth0: port 0 with MAC address
02:50:43:f0:26:2f
mv643xx_eth_port mv643xx_eth_port.1: eth1: port 0 with MAC address
02:50:43:0e:42:ed
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
orion-ehci orion-ehci.0: Marvell Orion EHCI
orion-ehci orion-ehci.0: new USB bus registered, assigned bus number 1
orion-ehci orion-ehci.0: irq 19, io mem 0xf1050000
orion-ehci orion-ehci.0: USB 2.0 started, EHCI 1.00
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver ums-datafab
usbcore: registered new interface driver ums-freecom
usbcore: registered new interface driver ums-jumpshot
usbcore: registered new interface driver ums-sddr09
usbcore: registered new interface driver ums-sddr55
mousedev: PS/2 mouse device common for all mice
rtc-mv rtc-mv: rtc core: registered rtc-mv as rtc0
i2c /dev entries driver
Software Watchdog Timer: 0.07 initialized. soft_noboot=3D0
soft_margin=3D60 sec soft_panic=3D0 (nowayout=3D 1)
cpuidle: using governor ladder
cpuidle: using governor menu
mv_xor_shared mv_xor_shared.0: Marvell shared XOR driver
mv_xor_shared mv_xor_shared.1: Marvell shared XOR driver
mv_xor mv_xor.0: Marvell XOR: ( xor cpy )
mv_xor mv_xor.1: Marvell XOR: ( xor fill cpy )
mv_xor mv_xor.2: Marvell XOR: ( xor cpy )
mv_xor mv_xor.3: Marvell XOR: ( xor fill cpy )
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
TCP cubic registered
NET: Registered protocol family 17
lib80211: common routines for IEEE802.11 drivers
rtc-mv rtc-mv: setting system clock to 2000-02-26 02:34:28 UTC (951532468)
UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master no=
de
List of all partitions:
1f00            4096 mtdblock0  (driver?)
1f01            4096 mtdblock1  (driver?)
1f02          409600 mtdblock2  (driver?)
1f03         3776512 mtdblock3  (driver?)
No filesystem could mount root, tried:  ubifs
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0=
,0)
[<8002c2f0>] (unwind_backtrace+0x0/0x10c) from [<803b2410>] (panic+0x74/0x1=
a0)
[<803b2410>] (panic+0x74/0x1a0) from [<80008e08>] (mount_block_root+0x1e8/0=
x228)
[<80008e08>] (mount_block_root+0x1e8/0x228) from [<80008f98>]
(prepare_namespace+0x8c/0x17c)
[<80008f98>] (prepare_namespace+0x8c/0x17c) from [<80008470>]
(kernel_init+0x100/0x13c)
[<80008470>] (kernel_init+0x100/0x13c) from [<80027b64>]
(kernel_thread_exit+0x0/0x8)

Best regards,
Viktar Palstsiuk

On Mon, Aug 15, 2011 at 7:01 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Thu, 2011-08-04 at 16:59 +0300, Viktar Palstsiuk wrote:
>> Hello,
>>
>> While trying to use UBI FS on Hynix MLC NAND (2MiB eraseblock, 8k
>> pagesize) I faced with the problem that root mounts well only during
>> first boot after it was flashed.
>> On the second boot it reports that it failed to recover master node.
>> If some one has tested UBI FS on devices with large eraseblock?
>
> Well, in theory it should work, but I've never heard about such huge
> eraseblock so probably you are the first trying it, and probably there
> is a bug.
>
>> NET: Registered protocol family 17
>> lib80211: common routines for IEEE802.11 drivers
>> rtc-mv rtc-mv: setting system clock to 2000-02-26 02:34:28 UTC (95153246=
8)
>> UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master=
 node
>
> Could you please enable UBIFS debugging, reproduce the issue and send me
> all the kernel output - e.g., by typing dmesg or booting with the
> ignore_loglevel kernel option?
>
> --
> Best Regards,
> Artem Bityutskiy
>
>
