Received: from mail.jpberlin.de ([213.203.238.11])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbT2I-0001qQ-GT
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 09:25:32 +0000
Message-ID: <50ADEF7D.2080503@jpberlin.de>
Date: Thu, 22 Nov 2012 10:25:17 +0100
From: Thomas Bechtold <thomasbechtold@jpberlin.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS always readonly - ubifs_iget: failed to read inode 11414,
 error -22
References: <50ADDF4A.90506@jpberlin.de>
 <1353575323.2701.25.camel@sauron.fi.intel.com>
In-Reply-To: <1353575323.2701.25.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22/11/12 10:08, Artem Bityutskiy wrote:
> On Thu, 2012-11-22 at 09:16 +0100, Thomas Bechtold wrote:
>> Hi,
>>
>> I use UBIFS with upstream kernel 3.2.32 on an ARMv5 (Stamp9G20) and NAND
>> Flash. When the device starts, the root-fs is mounted readonly. I can
>> not remount the FS. The FAQ [1] told me that I can ask here for help.
>> The device is remote and only accessable over ssh. It's expensive to go
>> there so it would be nice if something could be done to repair the FS
>> remotely.
>>
>> The output from dmesg is:
>>
>> #################### BEGIN #########################
>> # dmesg |grep -i ubi
>> Kernel command line: console=ttyS0,115200 mem=128M
>> mtdparts=atmel_nand:128k(bootstrap)ro,256k(uboot),128k(env1),128k(env2),2M(linux),-(root)rw
>> ubi.mtd=5 root=ubi0_0 rootfstype=ubifs boardtype=revC
>> UBI: attaching mtd5 to ubi0
>> UBI: physical eraseblock size:   131072 bytes (128 KiB)
>> UBI: logical eraseblock size:    129024 bytes
>> UBI: smallest flash I/O unit:    2048
>> UBI: sub-page size:              512
>> UBI: VID header offset:          512 (aligned 512)
>> UBI: data offset:                2048
>> UBI: max. sequence number:       5115
>> UBI: attached mtd5 to ubi0
>> UBI: MTD device name:            "root"
>> UBI: MTD device size:            509 MiB
>> UBI: number of good PEBs:        4064
>> UBI: number of bad PEBs:         11
>> UBI: number of corrupted PEBs:   0
>> UBI: max. allowed volumes:       128
>> UBI: wear-leveling threshold:    4096
>> UBI: number of internal volumes: 1
>> UBI: number of user volumes:     1
>> UBI: available PEBs:             119
>> UBI: total number of reserved PEBs: 3945
>> UBI: number of PEBs reserved for bad PEB handling: 40
>> UBI: max/mean erase counter: 39/1
>> UBI: image sequence number:  -393607928
>> UBI: background thread "ubi_bgt0d" started, PID 248
>> TCP cubic registered
>> UBIFS: recovery needed
>> UBIFS: recovery completed
>> UBIFS: mounted UBI device 0, volume 0, name "m40rootfs"
>> UBIFS: file system size:   501387264 bytes (489636 KiB, 478 MiB, 3886 LEBs)
>> UBIFS: journal size:       25159680 bytes (24570 KiB, 23 MiB, 195 LEBs)
>> UBIFS: media format:       w4/r0 (latest is w4/r0)
>> UBIFS: default compressor: lzo
>> UBIFS: reserved for root:  4952683 bytes (4836 KiB)
>> VFS: Mounted root (ubifs filesystem) on device 0:10.
>> UBIFS error (pid 1): read_znode: bad indexing node at LEB 3174:70736,
>> error 6
>> UBIFS error (pid 1): ubifs_iget: failed to read inode 11414, error -22
>> UBIFS error (pid 1): ubifs_lookup: dead directory entry
>> 'custom-loco.conf', error -22
> 
> Is this reproducible?

I get the messages every time I reboot. Here's a more verbose version of
the output:

################## BEGIN #########################
# dmesg
Linux version 3.2.32 (root@devel) (gcc version 4.3.5 (Debian 4.3.5-2) )
#1 PREEMPT Tue Oct 30 14:05:49 CET 2012
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
CPU: VIVT data cache, VIVT instruction cache
Machine: taskit Stamp9G20
Memory policy: ECC disabled, Data cache writeback
AT91: Detected soc type: at91sam9g20
AT91: Detected soc subtype: Unknown
AT91: sram at 0x200000 of 0x4000 mapped at 0xfef74000
AT91: sram at 0x300000 of 0x4000 mapped at 0xfef70000
On node 0 totalpages: 32768
free_area_init_node: node 0, pgdat c0362ce8, node_mem_map c0371000
  Normal zone: 256 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 32512 pages, LIFO batch:7
Clocks: CPU 396 MHz, master 132 MHz, main 18.432 MHz
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: console=ttyS0,115200 mem=128M
mtdparts=atmel_nand:128k(bootstrap)ro,256k(uboot),128k(env1),128k(env2),2M(linux),-(root)rw
ubi.mtd=5 root=ubi0_0 rootfstype=ubifs boardtype=revC
Meteo-40 revC logger detected
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 128MB = 128MB total
Memory: 126384k/126384k available, 4688k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    vmalloc : 0xc8800000 - 0xfee00000   ( 870 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc03282d4   (3201 kB)
      .init : 0xc0329000 - 0xc0344000   ( 108 kB)
      .data : 0xc0344000 - 0xc0363380   ( 125 kB)
       .bss : 0xc03633a4 - 0xc0370a7c   (  54 kB)
NR_IRQS:192
AT91: 96 gpio irqs in 3 banks
Console: colour dummy device 80x30
Calibrating delay loop... 197.01 BogoMIPS (lpj=985088)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
Rev C: added ttyS1 uart
AT91: Power Management (with slow clock mode)
AT91: Starting after software reset
bio: create slab <bio-0> at 0
Switching to clocksource pit
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
JFFS2 version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
msgmni has been set to 246
io scheduler noop registered
io scheduler cfq registered (default)
atmel_usart.0: ttyS0 at MMIO 0xfffff200 (irq = 1) is a ATMEL_SERIAL
console [ttyS0] enabled
atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq = 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq = 7) is a ATMEL_SERIAL
atmel_usart.4: ttyS4 at MMIO 0xfffd0000 (irq = 23) is a ATMEL_SERIAL
m40-lcd display driver ready
loop: module loaded
atmel_nand atmel_nand: No DMA support for NAND access.
ONFI flash detected
ONFI param page 0 valid
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xac (Micron MT29F4G08ABBDAHC)
Scanning device for bad blocks
Bad eraseblock 528 at 0x000004200000
Bad eraseblock 611 at 0x000004c60000
Bad eraseblock 1120 at 0x000008c00000
Bad eraseblock 1454 at 0x00000b5c0000
Bad eraseblock 1946 at 0x00000f340000
Bad eraseblock 2327 at 0x0000122e0000
Bad eraseblock 2499 at 0x000013860000
Bad eraseblock 2901 at 0x000016aa0000
Bad eraseblock 3322 at 0x000019f40000
Bad eraseblock 3757 at 0x00001d5a0000
Bad eraseblock 4034 at 0x00001f840000
mtd: bad character after partition (r)
6 cmdlinepart partitions found on MTD device atmel_nand
Creating 6 MTD partitions on "atmel_nand":
0x000000000000-0x000000020000 : "bootstrap"
0x000000020000-0x000000060000 : "uboot"
0x000000060000-0x000000080000 : "env1"
0x000000080000-0x0000000a0000 : "env2"
0x0000000a0000-0x0000002a0000 : "linux"
0x0000002a0000-0x000020000000 : "root"
UBI: attaching mtd5 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: max. sequence number:       5124
UBI: attached mtd5 to ubi0
UBI: MTD device name:            "root"
UBI: MTD device size:            509 MiB
UBI: number of good PEBs:        4064
UBI: number of bad PEBs:         11
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             119
UBI: total number of reserved PEBs: 3945
UBI: number of PEBs reserved for bad PEB handling: 40
UBI: max/mean erase counter: 39/1
UBI: image sequence number:  -393607928
UBI: background thread "ubi_bgt0d" started, PID 248
MACB_mii_bus: probed
eth0: no PHY found
udc: at91_udc version 3 May 2006
mousedev: PS/2 mouse device common for all mice
rtc-at91sam9 at91_rtt.0: rtc core: registered at91_rtt as rtc0
Driver for 1-wire Dallas network protocol.
AT91SAM9 Watchdog: sorry, watchdog is disabled
at91_wdt: probe of at91_wdt failed with error -5
cpuidle: using governor ladder
cpuidle: using governor menu
TCP cubic registered
NET: Registered protocol family 17
input: gpio-keys as /devices/platform/gpio-keys/input/input0
rtc-at91sam9 at91_rtt.0: setting system clock to 2012-11-22 09:20:20 UTC
(1353576020)
atmel_mci atmel_mci: version: 0x210
atmel_mci atmel_mci: using PDC
atmel_mci atmel_mci: Atmel MCI controller at 0xfffa8000 irq 9, 1 slots
UBIFS: recovery needed
mmc0: host does not support reading read-only switch. assuming write-enable.
mmc0: new SD card at address b368
mmcblk0: mmc0:b368 H1685 1.91 GiB
 mmcblk0: unknown partition table
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "m40rootfs"
UBIFS: file system size:   501387264 bytes (489636 KiB, 478 MiB, 3886 LEBs)
UBIFS: journal size:       25159680 bytes (24570 KiB, 23 MiB, 195 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  4952683 bytes (4836 KiB)
VFS: Mounted root (ubifs filesystem) on device 0:10.
Freeing init memory: 108K
UBIFS error (pid 1): read_znode: bad indexing node at LEB 3174:70736,
error 6
UBIFS error (pid 1): ubifs_iget: failed to read inode 11414, error -22
UBIFS error (pid 1): ubifs_lookup: dead directory entry
'custom-loco.conf', error -22
UBIFS warning (pid 1): ubifs_ro_mode: switched to read-only mode, error -22
[<c000d4ec>] (unwind_backtrace+0x0/0xec) from [<c010d098>]
(ubifs_lookup+0xf4/0x140)
[<c010d098>] (ubifs_lookup+0xf4/0x140) from [<c0089af8>]
(d_alloc_and_lookup+0x44/0x60)
[<c0089af8>] (d_alloc_and_lookup+0x44/0x60) from [<c0089fa0>]
(do_lookup+0x204/0x308)
[<c0089fa0>] (do_lookup+0x204/0x308) from [<c008b6a8>]
(path_lookupat+0x10c/0x6dc)
[<c008b6a8>] (path_lookupat+0x10c/0x6dc) from [<c008bc98>]
(do_path_lookup+0x20/0x68)
[<c008bc98>] (do_path_lookup+0x20/0x68) from [<c008bda4>]
(user_path_at_empty+0x58/0x8c)
[<c008bda4>] (user_path_at_empty+0x58/0x8c) from [<c008bdec>]
(user_path_at+0x14/0x1c)
[<c008bdec>] (user_path_at+0x14/0x1c) from [<c0084508>]
(vfs_fstatat+0x38/0x68)
[<c0084508>] (vfs_fstatat+0x38/0x68) from [<c0084610>]
(sys_stat64+0x14/0x34)
[<c0084610>] (sys_stat64+0x14/0x34) from [<c00093c0>]
(ret_fast_syscall+0x0/0x2c)
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 20, io mem 0x00500000
usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: AT91 OHCI
usb usb1: Manufacturer: Linux 3.2.32 ohci_hcd
usb usb1: SerialNumber: at91
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
usb 1-2: new full-speed USB device number 2 using at91_ohci
usb 1-2: New USB device found, idVendor=114f, idProduct=1234
usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=5
usb 1-2: Product: USB MODEM
usb 1-2: Manufacturer: SIERRA WIRELESS
usb 1-2: SerialNumber: BH2060043208100
cdc_acm 1-2:1.0: ttyACM0: USB ACM device
usbcore: registered new interface driver cdc_acm
cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
UBIFS error (pid 458): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 458): ubifs_write_inode: can't write inode 19562, error -30
usb0: MAC 8c:8e:76:00:0a:53
usb0: HOST MAC 0a:8e:76:00:0a:53
g_ether gadget: Ethernet Gadget, version: Memorial Day 2008
g_ether gadget: g_ether ready
UBIFS error (pid 560): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 560): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 563): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 563): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 568): make_reservation: cannot reserve 384 bytes in
jhead 1, error -30
UBIFS error (pid 568): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 612): make_reservation: cannot reserve 384 bytes in
jhead 1, error -30
UBIFS error (pid 612): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 634): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 636): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
NET: Registered protocol family 10
ADDRCONF(NETDEV_UP): usb0: link is not ready
sshd (741): /proc/741/oom_adj is deprecated, please use
/proc/741/oom_score_adj instead.
UBIFS error (pid 764): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 764): ubifs_write_inode: can't write inode 9615, error -30
UBIFS error (pid 765): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 765): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 765): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 806): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
UBIFS error (pid 807): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
UBIFS error (pid 809): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 809): ubifs_write_inode: can't write inode 11568, error -30
UBIFS error (pid 811): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 811): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 811): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 814): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 814): ubifs_create: cannot create regular file, error -30
PPP generic driver version 2.4.2
UBIFS error (pid 848): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 848): ubifs_mkdir: cannot create directory, error -30
UBIFS error (pid 712): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 712): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 712): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 712): ubifs_write_inode: can't write inode 19593, error -30
UBIFS error (pid 712): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 712): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 712): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 712): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 712): ubifs_write_inode: can't write inode 19594, error -30
UBIFS error (pid 712): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 835): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
UBIFS error (pid 924): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 924): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 926): make_reservation: cannot reserve 408 bytes in
jhead 1, error -30
UBIFS error (pid 926): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 712): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 712): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 712): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
UBIFS error (pid 712): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 712): ubifs_create: cannot create regular file, error -30

##################### END ###############################

But I can not reproduce the case which results in this situation.
