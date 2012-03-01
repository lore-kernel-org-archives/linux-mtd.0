Received: from mail-qy0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S34wN-0002ry-6m
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 12:17:00 +0000
Received: by qcsu28 with SMTP id u28so205169qcs.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Mar 2012 04:16:57 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 1 Mar 2012 13:16:57 +0100
Message-ID: <CAHMF36F1Vd6=3YuQhKE_qEXm3hjGbbm=mmuMbQdt1i6Z=66zNQ@mail.gmail.com>
Subject: Problems with mtd_oobtest
From: Matej Kupljen <matej.kupljen@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: mikedunn@newsguy.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear list, Mike

>> I can run mtd_speedtest, mtd_stresstest, mtd_readtest, mtd_pagetest with=
out the
>> problems, but when I start the mtd_oobtest it fails, basically on every =
page!
>
>
>Your flash device probably does not support writing oob-only.  This is tru=
e of
>some NAND devices.  I wouldn't worry about this test.  This failure is pro=
bably
>unrelated to your ubifs problems.

Well, I haven't found that anywhere, so I was wondering in the dark :)
I was looking at the code, but could find anything.

>> I can use JFFS2 on this device, and for some time even UBIFS, but then
>> it just fails.
>
>
>What is the nature of the ubifs failure?  The kernel log should tell you. =
 It
>may be the same problem I experience, where over time too many erase bocks=
 are
>marked as bad.  This is due to the unforgiving nature of ubi wrt corrected
>bitflips, and tends to be a problem on NAND flash devices with high bit er=
rors,
>for which the device compensates with strong ecc.  I'm working on some pat=
ches
>that should fix this.

I re-flashed the UBFS image to my FLASH and have booted the device.
It boots without the problem and here is the log (Please note, that is
uses sub pages):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Uncompressing Linux... done, booting the kernel.
[    0.000000] Linux version 2.6.33 (matej@OrionNew) (gcc version
4.2.4) #31 Fri Feb 10 11:12:09 CET 2012
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053=
177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: OBU4G
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 16256
[    0.000000] Kernel command line: console=3DttyS0,115200n8 ubi.mtd=3D1
root=3Dubi0:ubi_rootfs nohlt rootfstype=3Dubifs meM
[    0.000000] PID hash table entries: 256 (order: -2, 1024 bytes)
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes=
)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Memory: 64MB =3D 64MB total
[    0.000000] Memory: 61152KB available (3248K code, 220K data, 116K
init, 0K highmem)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:40
[    0.000000] irq=3D30 Event=3D0x67 bank:3 bit:7 type:3
[    0.000000] irq=3D31 Event=3D0x7a bank:3 bit:26 type:2
[    0.000000] irq=3D32 Event=3D0x77 bank:3 bit:23 type:2
[    0.000000] irq=3D33 Event=3D0x7b bank:3 bit:27 type:0
[    0.000000] irq=3D34 Event=3D0x60 bank:3 bit:0 type:0
[    0.000000] irq=3D35 Event=3D0x61 bank:3 bit:1 type:1
[    0.000000] irq=3D36 Event=3D0x43 bank:2 bit:3 type:3
[    0.000000] irq=3D37 Event=3D0x44 bank:2 bit:4 type:2
[    0.000000] irq=3D38 Event=3D0x45 bank:2 bit:5 type:2
[    0.000000] irq=3D39 Event=3D0x4d bank:2 bit:13 type:0
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [ttyS0] enabled
[    0.008000] Calibrating delay loop... 89.34 BogoMIPS (lpj=3D178688)
[    0.088000] Mount-cache hash table entries: 512
[    0.092000] CPU: Testing write buffer coherency: ok
[    0.104000] NET: Registered protocol family 16
[    0.148000] Registering USB host 0x00203020 0x0ec00005 (3)
[    0.156000] LPC31: Power Management init.
[    0.240000] bio: create slab <bio-0> at 0
[    0.252000] SCSI subsystem initialized
[    0.260000] usbcore: registered new interface driver usbfs
[    0.264000] usbcore: registered new interface driver hub
[    0.268000] usbcore: registered new device driver usb
[    0.312000] NET: Registered protocol family 2
[    0.316000] IP route cache hash table entries: 1024 (order: 0, 4096 byte=
s)
[    0.320000] TCP established hash table entries: 2048 (order: 2, 16384 by=
tes)
[    0.324000] TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
[    0.328000] TCP: Hash tables configured (established 2048 bind 2048)
[    0.332000] TCP reno registered
[    0.336000] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.340000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.344000] NET: Registered protocol family 1
[    0.352000] RPC: Registered udp transport module.
[    0.356000] RPC: Registered tcp transport module.
[    0.360000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.372000] PSU_probe
[    0.372000] lpc3152-psu 1-000c: setting platform data
[    0.376000] PSU_probe 1
[    0.380000] NetWinder Floating Point Emulator V0.97 (double precision)
[    0.396000] JFFS2 version 2.2. (NAND) =EF=BF=BD=C2=A9 2001-2006 Red Hat,=
 Inc.
[    0.400000] ROMFS MTD (C) 2007 Red Hat, Inc.
[    0.404000] msgmni has been set to 119
[    0.408000] io scheduler noop registered (default)
[    0.532000] lpc313x-rng lpc313x-rng: rng initialized
[    0.540000] Serial: 8250/16550 driver, 1 ports, IRQ sharing disabled
[    0.548000] serial8250: ttyS0 at MMIO 0x15001000 (irq =3D 10) is a NXP16=
750
=EF=BF=BD[    0.556000] serial8250.0: ttyS0 at MMIO 0x15001000 (irq =3D 10)=
 is a NXP16750
[    0.632000] brd: module loaded
[    0.644000] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xa1
(Micron NAND 128MiB 1,8V 8-bit)
[    0.652000] Creating 2 MTD partitions on "lpc313x_nand":
[    0.656000] 0x000000060000-0x000000080000 : "u-boot envirnment"
[    0.668000] 0x0000014c0000-0x000008000000 : "lpc313x-rootfs"
[    0.684000] UBI: attaching mtd1 to ubi0
[    0.688000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    0.692000] UBI: logical eraseblock size:    129024 bytes
[    0.696000] UBI: smallest flash I/O unit:    2048
[    0.700000] UBI: sub-page size:              512
[    0.704000] UBI: VID header offset:          512 (aligned 512)
[    0.708000] UBI: data offset:                2048
[    1.192000] UBI: max. sequence number:       0
[    1.228000] UBI: volume 0 ("ubi_rootfs") re-sized from 204 to 842 LEBs
[    1.236000] UBI: attached mtd1 to ubi0
[    1.240000] UBI: MTD device name:            "lpc313x-rootfs"
[    1.244000] UBI: MTD device size:            107 MiB
[    1.248000] UBI: number of good PEBs:        854
[    1.252000] UBI: number of bad PEBs:         4
[    1.256000] UBI: number of corrupted PEBs:   0
[    1.260000] UBI: max. allowed volumes:       128
[    1.264000] UBI: wear-leveling threshold:    4096
[    1.268000] UBI: number of internal volumes: 1
[    1.272000] UBI: number of user volumes:     1
[    1.276000] UBI: available PEBs:             0
[    1.280000] UBI: total number of reserved PEBs: 854
[    1.284000] UBI: number of PEBs reserved for bad PEB handling: 8
[    1.288000] UBI: max/mean erase counter: 1/0
[    1.292000] UBI: image sequence number:  837312525
[    1.296000] UBI: background thread "ubi_bgt0d" started, PID 285
[    1.304000] spi_lpc313x spi_lpc313x.0: LPC313x SPI driver
[    1.312000] PPP generic driver version 2.4.2
[    1.320000] PPP Deflate Compression module registered
[    1.328000] PPP BSD Compression module registered
[    1.336000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.340000] lpc-ehci lpc-ehci.0: LPC EHCI Host Controller
[    1.344000] lpc-ehci lpc-ehci.0: new USB bus registered, assigned
bus number 1
[    1.372000] lpc-ehci lpc-ehci.0: irq 27, io mem 0x19000000
[    1.388000] lpc-ehci lpc-ehci.0: USB 2.0 started, EHCI 1.00
[    1.392000] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[    1.396000] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.400000] usb usb1: Product: LPC EHCI Host Controller
[    1.404000] usb usb1: Manufacturer: Linux 2.6.33 ehci_hcd
[    1.408000] usb usb1: SerialNumber: lpc-ehci.0
[    1.420000] hub 1-0:1.0: USB hub found
[    1.424000] hub 1-0:1.0: 1 port detected
[    1.436000] usbcore: registered new interface driver cdc_acm
[    1.440000] cdc_acm: v0.26:USB Abstract Control Model driver for
USB modems and ISDN adapters
[    1.444000] Initializing USB Mass Storage driver...
[    1.452000] usbcore: registered new interface driver usb-storage
[    1.456000] USB Mass Storage support registered.
[    1.464000] i2c i2c-1: rtc core: registered lpc31xx-rtc as rtc0
[    1.468000] i2c /dev entries driver
[    1.488000] lpc313x-wdt lpc313x-wdt: Watchdog device driver initialized.
[    1.496000] cpuidle: using governor ladder
[    1.508000] lpc313x_mmc lpc313x_mmc.0: LPC313x MMC controller at irq 26
[    1.516000] TCP cubic registered
[    1.520000] NET: Registered protocol family 10
[    1.528000] IPv6 over IPv4 tunneling driver
[    1.568000] i2c i2c-1: setting system clock to 1970-01-01 00:04:05 UTC (=
245)
[    1.604000] mmc0: new SDHC card at address b368
[    1.612000] mmcblk0: mmc0:b368 NCard 7.47 GiB
[    1.620000]  mmcblk0: p1
[    1.736000] UBIFS: mounted UBI device 0, volume 0, name "ubi_rootfs"
[    1.740000] UBIFS: file system size:   107218944 bytes (104706 KiB,
102 MiB, 831 LEBs)
[    1.744000] UBIFS: journal size:       9033728 bytes (8822 KiB, 8
MiB, 71 LEBs)
[    1.748000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    1.752000] UBIFS: default compressor: lzo
[    1.756000] UBIFS: reserved for root:  0 bytes (0 KiB)
[    1.768000] VFS: Mounted root (ubifs filesystem) on device 0:13.
[    1.772000] Freeing init memory: 116K
INIT: version 2.86 booting
Starting udev and populating dev cache
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Now, I'll do some intentional power cuts, and when the problem
appears, I'll post a kernel log here.

Thank you for the help and new information.
Maybe, someone could put this on the Linux MTD WEB page, I mean if the
mtd_oobtest start to
print out so many errors?

Thanks,
Matej
