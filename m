Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MLxWe-0001d1-S6
	for linux-mtd@lists.infradead.org; Wed, 01 Jul 2009 10:59:03 +0000
Subject: Re: about ubiformat mtdblock
From: tommy <jiujin.hong@mid-fun.com>
To: dedekind@infradead.org
In-Reply-To: <1246445133.20721.15.camel@localhost.localdomain>
References: <1246010592.12367.0.camel@tommy-desktop>
	<1246013172.9487.66.camel@localhost.localdomain>
	<1246074583.4250.4.camel@tommy-desktop>
	<1246102372.9487.80.camel@localhost.localdomain>
	<1246241677.7834.5.camel@tommy-desktop>
	<1246373466.20721.12.camel@localhost.localdomain>
	<1246409674.6221.1.camel@tommy-desktop>
	<1246441852.20721.13.camel@localhost.localdomain>
	<1246445026.10830.0.camel@tommy-desktop>
	<1246445133.20721.15.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2009 18:58:51 +0800
Message-Id: <1246445931.10969.4.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Uncompressing
Linux.........................................................................................
Linux version 2.6.24.2 (root@tommy-desktop) (gcc version 4.1.2) #123 Wed
Jul 1 11:54:02 CST 2009
CPU: ARMv6-compatible processor [410fb766] revision 6 (ARMv7),
cr=00c5387f
Machine: SMDK6410
Ignoring unrecognised tag 0x00000000
Memory policy: ECC disabled, Data cache writeback
....................
CPU0: D VIPT write-back cache
CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
26924
Kernel command line: root=ubi0:rootfs rootfstype=ubifs ubi.mtd=2
console=ttySAC0,115200
Trying to install chained interrupt handler for IRQ0
Trying to install chained interrupt handler for IRQ1
Trying to install chained interrupt handler for IRQ32
Trying to install chained interrupt handler for IRQ33
PID hash table entries: 512 (order: 9, 2048 bytes)
timer tcon=00600d00, tcnt 103c3, tcfg 00000450,00000040, usec 00001340
Console: colour dummy device 80x30
console [ttySAC0] enabled
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 106MB = 106MB total
Memory: 103552KB available (3452K code, 307K data, 104K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 64 bytes
NET: Registered protocol family 16
S3C DMA-pl080 Controller Driver, (c) 2006-2007 Samsung Electronics
Total 32 DMA channels will be initialized.
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP reno registered
Power Domain Framework initialized
kdpmd created
NetWinder Floating Point Emulator V0.97 (extended precision)
Kernel DPM daemon thread started
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
PWM channel 1 set g_tcnt = 1000, g_tcmp = 250 
S3C_LCD clock got enabled :: 133.000 Mhz
LCD TYPE :: LTE480WV will be initialized
Window[0] - FB1: map_video_memory: clear ff200000:000bb800
            FB1: map_video_memory: dma=56100000 cpu=ff200000
size=000bb800
Console: switching to colour frame buffer device 100x30
fb0: s3cfb frame buffer device
Window[1] - FB1: map_video_memory: clear ff2bd000:000bb800
            FB1: map_video_memory: dma=56200000 cpu=ff2bd000
size=000bb800
fb1: s3cfb frame buffer device
S3C ADC driver, (c) 2007 Samsung Electronics
S3C ADC driver successfully probed !
s3c-uart.0: s3c_serial0 at MMIO 0x7f005000 (irq = 37) is a S3C
s3c-uart.1: s3c_serial1 at MMIO 0x7f005400 (irq = 38) is a S3C
s3c-uart.2: s3c_serial2 at MMIO 0x7f005800 (irq = 39) is a S3C
s3c-uart.3: s3c_serial3 at MMIO 0x7f005c00 (irq = 40) is a S3C
dm9000 Ethernet Driver
dm9000: read correct id 0x90000a46
eth0: dm9000 at f7600300,f7600304 IRQ 74 MAC: 00:22:44:66:88:aa
Driver 'sd' needs updating - please use bus_type methods
S3C NAND Driver, (c) 2007 Samsung Electronics
S3C NAND Driver is using hardware ECC.
NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB
3,3V 8-bit)
Creating 4 MTD partitions on "NAND 1GiB 3,3V 8-bit":
0x00000000-0x00040000 : "Bootloader"
0x00040000-0x00840000 : "Kernel"
0x00840000-0x13440000 : "ubi"
0x13440000-0x40000000 : "data"
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    258048 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "ubi"
UBI: MTD device size:            300 MiB
UBI: number of good PEBs:        1200
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             5
UBI: total number of reserved PEBs: 1195
UBI: number of PEBs reserved for bad PEB handling: 12
UBI: max/mean erase counter: 2/1
UBI: background thread "ubi_bgt0d" started, PID 220
s3c2410-ohci s3c2410-ohci: S3C OHCI
s3c2410-ohci s3c2410-ohci: new USB bus registered, assigned bus number 1
s3c2410-ohci s3c2410-ohci: irq 47, io mem 0x74300000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...

USB Mass Storage support registered.
usbcore: registered new interface driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial support registered for
generic
usbcore: registered new interface driver usbserial_generic
drivers/usb/serial/usb-serial.c: USB Serial Driver core
mice: PS/2 mouse device common for all mice
S3C24XX RTC, (c) 2004,2006 Simtec Electronics
s3c2410-rtc s3c2410-rtc: rtc disabled, re-enabling
s3c2410-rtc s3c2410-rtc: rtc core: registered s3c as rtc0
S3C PWM Driver, (c) 2006-2007 Samsung Electronics
i2c /dev entries driver
[s3c_hsmmc_probe]: s3c-hsmmc.0: at 0xc7800000 with irq 56. clk src:
sclk_DOUTmpll_mmc0
s3c-hsmmc: card inserted.
[s3c_hsmmc_probe]: s3c-hsmmc.1: at 0xc7a00000 with irq 57. clk src:
sclk_DOUTmpll_mmc1
can NOT find sdio card! 
usbcore: registered new interface driver usbhid
drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
Advanced Linux Sound Architecture Driver Version 1.0.15 (Tue Nov 20
19:16:42 2007 UTC).
ASoC version 0.13.1
WM9713/WM9714 SoC Audio Codec 0.12
...................
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
NET: Registered protocol family 15
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
ieee80211: 802.11 data/management/control stack, git-1.1.13
ieee80211: Copyright (C) 2004-2005 Intel Corporation
<jketreno@linux.intel.com>
VFP support v0.3: implementor 41 architecture 1 part 20 variant b rev 5
s3c2410-rtc s3c2410-rtc: setting system clock to 2022-01-02 19:30:22 UTC
(1641151822)
open_ubi name ubi0:rootfs<5>UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: file system size:   301916160 bytes (294840 KiB, 287 MiB, 1170
LEBs)
UBIFS: journal size:       14966784 bytes (14616 KiB, 14 MiB, 58 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  4952683 bytes (4836 KiB)
VFS: Mounted root (ubifs filesystem).
Freeing init memory: 104K
mmc1: new SDIO card at address 0001
INIT: version 2.86 booting
.udev/ already exists on the static /dev!
Starting the hotplug events dispatcher udevd
Synthesizing the initial hotplug events
Waiting for /dev to be fully populated
mount: mounting proc on /proc failed: Device or resource busy
WARNING: Couldn't open directory /lib/modules/2.6.24.2: No such file or
directory
FATAL: Could not open /lib/modules/2.6.24.2/modules.dep.temp for
writing: No such file or directory
modprobe: FATAL: Could not load /lib/modules/2.6.24.2/modules.dep: No
such file or directory

Starting portmap daemon: portmap.
Nothing to be done
INIT: Entering runlevel: 5
Starting Dropbear SSH server: modprobe: FATAL: Could not
load /lib/modules/2.6.24.2/modules.dep: No such fiy

dropbear.
modprobe: FATAL: Could not load /lib/modules/2.6.24.2/modules.dep: No
such file or directory

Starting system message bus: dbus.
Starting Hardware abstraction layer hald
Starting NetworkManager daemon: NetworkManager.
Starting syslogd/klogd: done
slim script starting...
/usr/sbin/alsactl: set_control:989: warning: name mismatch (PCM Playback
Volume/Line In Volume) for control5
/usr/sbin/alsactl: set_control:991: warning: index mismatch (0/0) for
control #5
mount file name: /
mount file name: /
mount file name: /proc
mount file name: /mnt/.psplash
mount file name: /sys
mount file name: /dev/.static/dev
mount file name: /dev
mount file name: /var
jhr******:zapit: /mnt/.psplash
jhr******:umount rlt 0
Creating Server Authority...

mid-linux (red) 1.0 
 s3c_serial0

mid-fun login:  



ps:

if my board nfs boot ,not ubifs boot,following is ok!
nfs@root:ubiattach /dev/ubi_ctrl -m 2
nfs@root:mount -t ubifs ubi0_0 /mnt /
it it ok!

but i don't know /etc/fstab 's rootfs mount can cause ubifs say error!
On 三, 2009-07-01 at 13:45 +0300, Artem Bityutskiy wrote:
> On Wed, 2009-07-01 at 18:43 +0800, tommy wrote:
> > my kernel command line is booting from ubif0_0 (rootfs),can't mount
> > again ,because ubifs0_0 is also in / 
> 
> Here you may find a way to mount UBIFS via kernel boot parameters:
> 
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mount_ubifs
> 
