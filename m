Received: from webbox687.server-home.net ([195.149.74.151])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOBzq-0003zX-Io
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 15:54:47 +0000
Received: from comm.systec-electronic.de (178-25-112-77-dynip.superkabel.de
	[178.25.112.77])
	by webbox687.server-home.net (Postfix) with ESMTP id 40C83788010
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jun 2010 17:54:41 +0200 (CEST)
Received: from ws-stein.localnet (ws-stein.systec-electronic.de
	[192.168.10.93])
	by comm.systec-electronic.de (Postfix) with ESMTP id CE8FE97C068
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jun 2010 17:54:35 +0200 (CEST)
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2: inflate returned -5
Date: Mon, 14 Jun 2010 17:54:34 +0200
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201006141754.34912.alexander.stein@systec-electronic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I recently got a kernel panic during boot while accessing a JFFS2 filesyste=
m=20
on NOR flash. There was an error message as stated in the topic ' inflate=20
returned -5'. The board is using an AT91SAM9G20.
I checked the source and this seems to be fs/jffs2/comp_zlib.c:180. But wha=
t=20
I'm wondering about is that zlib_inflate is called with flush =3D Z_FINISH =
which=20
means that not enough room for data or no progress is possible, according t=
o=20
the zlib headers.
In which cases can this occur? I think there should be enough memory availa=
ble=20
(32MB attached).

Here is the full kernel log:
Uncompressing=20
Linux......................................................................=
=2E...............................=20
done, booting the kernel.
Linux version 2.6.31.12 (alex@ws-stein) (gcc version 4.4.1 (Sourcery G++ Li=
te=20
2009q3-67) ) #72 Mon Jun 14 16:00:39 CEST 2010
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
CPU: VIVT data cache, VIVT instruction cache
Machine: SYS TEC ECUcore-9G20
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 396 MHz, master 132 MHz, main 18.432 MHz
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 8128
Kernel command line: console=3DttyS0,115200 root=3D/dev/mtdblock3 rootfstyp=
e=3Djffs2=20
mtdparts=3Dphysmap-flash.0:384k(uboot)ro,128k(ubootenv),4M(home),-(root)
PID hash table entries: 128 (order: 7, 512 bytes)
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 32MB =3D 32MB total
Memory: 25288KB available (2796K code, 4146K data, 112K init, 0K highmem)
SLUB: Genslabs=3D11, HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
RCU-based detection of stalled CPUs is enabled.
NR_IRQS:192
AT91: 96 gpio irqs in 3 banks
Console: colour dummy device 80x30
console [ttyS0] enabled
Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
=2E.. MAX_LOCKDEP_SUBCLASSES:  8
=2E.. MAX_LOCK_DEPTH:          48
=2E.. MAX_LOCKDEP_KEYS:        8191
=2E.. CLASSHASH_SIZE:          4096
=2E.. MAX_LOCKDEP_ENTRIES:     16384
=2E.. MAX_LOCKDEP_CHAINS:      32768
=2E.. CHAINHASH_SIZE:          16384
 memory used by lock dependency info: 3615 kB
 per task-struct memory footprint: 1152 bytes
Calibrating delay loop... 197.42 BogoMIPS (lpj=3D987136)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
regulator: core version 0.5
NET: Registered protocol family 16
AT91: Power Management
AT91: Starting after software reset
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 1024 (order: 1, 8192 bytes)
TCP bind hash table entries: 1024 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP reno registered
NET: Registered protocol family 1
Initializing RT-Tester: OK
squashfs: version 4.0 (2009/01/31) Phillip Lougher
JFFS2 version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.
msgmni has been set to 49
io scheduler noop registered
io scheduler anticipatory registered (default)
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq =3D 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq =3D 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq =3D 7) is a ATMEL_SERIAL
atmel_usart.3: ttyS3 at MMIO 0xfffb8000 (irq =3D 8) is a ATMEL_SERIAL
brd: module loaded
loop: module loaded
ssc ssc.0: Atmel SSC device at 0xc2888000 (irq 14)
MACB_mii_bus: probed
eth0: Atmel MACB at 0xfffc4000 irq 21 (00:50:c2:39:37:07)
eth0: attached PHY driver [KS8721BL] (mii_bus:phy_addr=3Dffffffff:01, irq=
=3D-1)
physmap platform flash device: 01000000 at 10000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
physmap-flash.0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
4 cmdlinepart partitions found on MTD device physmap-flash.0
Creating 4 MTD partitions on "physmap-flash.0":
0x000000000000-0x000000060000 : "uboot"
0x000000060000-0x000000080000 : "ubootenv"
0x000000080000-0x000000480000 : "home"
0x000000480000-0x000001000000 : "root"
atmel_spi atmel_spi.1: Atmel SPI Controller at 0xfffcc000 (irq 13)
at25 spi1.0: 2 KByte at25160 eeprom, pagesize 32
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 20, io mem 0x00500000
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: AT91 OHCI
usb usb1: Manufacturer: Linux 2.6.31.12 ohci_hcd
usb usb1: SerialNumber: at91
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
udc: at91_udc version 3 May 2006
g_serial gadget: Gadget Serial v2.4
g_serial gadget: g_serial ready
mice: PS/2 mouse device common for all mice
i2c /dev entries driver
rtc-pcf8563 0-0051: chip found, driver version 0.4.3
rtc-pcf8563 0-0051: rtc core: registered rtc-pcf8563 as rtc0
i2c-gpio i2c-gpio: using pins 55 (SDA) and 56 (SCL)
lm75 0-0048: hwmon0: sensor 'tmp101'
usbcore: registered new interface driver usbhid
usbhid: v2.6:USB HID core driver
TCP cubic registered
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
rtc-pcf8563 0-0051: setting system clock to 2010-06-14 14:07:49 UTC=20
(1276524469)
VFS: Mounted root (jffs2 filesystem) on device 31:3.
=46reeing init memory: 112K
inflate returned -5
Kernel panic - not syncing: Attempted to kill init!
[<c002986c>] (unwind_backtrace+0x0/0xd4) from [<c022cf1c>] (panic+0x40/0x11=
8)
[<c022cf1c>] (panic+0x40/0x118) from [<c0037550>] (find_new_reaper+0x6c/0x8=
8)
[<c0037550>] (find_new_reaper+0x6c/0x88) from [<c00387d4>]=20
(forget_original_parent+0x24/0x100)
[<c00387d4>] (forget_original_parent+0x24/0x100) from [<c00388c0>]=20
(exit_notify+0x10/0x148)
[<c00388c0>] (exit_notify+0x10/0x148) from [<c0038bc0>] (do_exit+0x1c8/0x25=
4)
[<c0038bc0>] (do_exit+0x1c8/0x254) from [<c0038cdc>] (do_group_exit+0x90/0x=
c4)
[<c0038cdc>] (do_group_exit+0x90/0xc4) from [<c0042b8c>]=20
(get_signal_to_deliver+0x248/0x278)
[<c0042b8c>] (get_signal_to_deliver+0x248/0x278) from [<c002729c>]=20
(do_signal+0x74/0x160)
[<c002729c>] (do_signal+0x74/0x160) from [<c0024d4c>] (work_pending+0x1c/0x=
20)
INFO: RCU detected CPU 0 stall (t=3D4294938571/1000 jiffies)
[<c002986c>] (unwind_backtrace+0x0/0xd4) from [<c0066668>]=20
(print_cpu_stall+0x30/0x98)
[<c0066668>] (print_cpu_stall+0x30/0x98) from [<c0066728>]=20
(__rcu_pending+0x10/0xa0)
[<c0066728>] (__rcu_pending+0x10/0xa0) from [<c00667c8>]=20
(rcu_pending+0x10/0x44)
[<c00667c8>] (rcu_pending+0x10/0x44) from [<c003f328>]=20
(update_process_times+0x30/0x58)
[<c003f328>] (update_process_times+0x30/0x58) from [<c00549ac>]=20
(tick_sched_timer+0x88/0xc4)
[<c00549ac>] (tick_sched_timer+0x88/0xc4) from [<c004c558>]=20
(__run_hrtimer+0x50/0xa4)
[<c004c558>] (__run_hrtimer+0x50/0xa4) from [<c004d0f4>]=20
(hrtimer_interrupt+0x17c/0x1f8)
[<c004d0f4>] (hrtimer_interrupt+0x17c/0x1f8) from [<c01ae4ec>]=20
(ch2_irq+0x20/0x28)
[<c01ae4ec>] (ch2_irq+0x20/0x28) from [<c0063ba8>]=20
(handle_IRQ_event+0x24/0xc4)
[<c0063ba8>] (handle_IRQ_event+0x24/0xc4) from [<c0065478>]=20
(handle_level_irq+0xb0/0x114)
[<c0065478>] (handle_level_irq+0xb0/0x114) from [<c0024068>]=20
(asm_do_IRQ+0x68/0x90)
[<c0024068>] (asm_do_IRQ+0x68/0x90) from [<c0024994>] (__irq_svc+0x34/0x60)
Exception stack(0xc1c1fdf0 to 0xc1c1fe38)
fde0:                                     0000c31b 00000000 000003c4 c031db=
60
fe00: 000026ca c1c20000 00000001 c1c1ff04 c1c01200 c1d41580 c1c1ffb0 000000=
00
fe20: c1c20328 c1c1fe38 c022cfd4 c0128fe0 20000013 ffffffff
[<c0024994>] (__irq_svc+0x34/0x60) from [<c0128fe0>] (__delay+0x0/0xc)

Best regards
Alexander
