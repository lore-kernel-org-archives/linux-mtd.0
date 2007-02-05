Received: from darwaza.gdatech.com ([66.237.41.98])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HDubx-00023J-BP
	for linux-mtd@lists.infradead.org; Sun, 04 Feb 2007 22:34:00 -0500
Message-ID: <003501c748d6$b44ffa50$99c8a8c0@jrakeshsw>
From: "Jagota Rakesh" <jrakesh@gdatech.com>
To: <axel.lin@mitac-mtc.com.tw>, <linux-mtd@lists.infradead.org>
References: <427d64720702041910o2cc7c5d2q32e467be6a1ae5fd@mail.gmail.com>
Subject: Re: Failed to mount jffs2 on mtd device
Date: Sun, 4 Feb 2007 19:35:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="utf-8"; reply-type=original
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Please check you nand flash driver and jffs2 file system which you have=20
created.

Regards,
Rakesh Jagota
----- Original Message -----=20
From: "axel lin" <axel.lin@gmail.com>
To: <linux-mtd@lists.infradead.org>
Sent: Sunday, February 04, 2007 7:10 PM
Subject: Failed to mount jffs2 on mtd device


> hi list,
>        I'm working on a customized monahans dev board.
>        I have some trouble about mount jffs2 on mtd device during boot.
>        Below is the error messages.
>        Does someone know this problem?
>
>        Thanks in advance,
> Axel
>
>
> blob> boot root=3D/dev/mtdblock2 rootfstype=3Djffs2
> ip=3D192.168.1.101:192.168.100.222::255.255.255.0::eth0:on
> console=3DttyS0,38400 console=3Dtty0 mem=3D64M
>
> Starting kernel at 0x80008000...
>
> Uncompressing=20
> Linux..................................................................=
.......................................
> done, booting the kernel.
> Linux version 2.6.14-intc1 (axel@kdc.example.com) (gcc version 3.4.3)
> #1 PREEMPT Fri Feb 2 13:24:51 CST 2007
> CPU: XScale3-monahans [69056825] revision 5 (ARMv5TE)
> Machine: Intel Monahans Development Platform (aka Zylonite)
> Memory policy: ECC disabled, Data cache writeback
> Run Mode Clock: 312MHz
> Turbo Mode Clock: 624MHz
> High Speed I/O Bus Clock: 208MHz
> CPU0: D VIVT undefined 5 cache
> CPU0: I cache: 32768 bytes, associativity 4, 32 byte lines, 256 sets
> CPU0: D cache: 32768 bytes, associativity 4, 32 byte lines, 256 sets
> Built 1 zonelists
> Kernel command line: root=3D/dev/mtdblock2 rootfstype=3Djffs2
> ip=3D192.168.1.101:192.168.100.222::255.255.255.0::eth0:on
> console=3DttyS0,38400 console=3Dtty0 mem=3D64M
> PID hash table entries: 512 (order: 9, 8192 bytes)
> Console: colour dummy device 80x30
> Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> Memory: 64MB =3D 64MB total
> Memory: 61440KB available (2741K code, 540K data, 108K init)
> Mount-cache hash table entries: 512
> CPU: Testing write buffer coherency: ok
> softlockup thread 0 started up.
> NET: Registered protocol family 16
> SCSI subsystem initialized
> usbcore: registered new driver usbfs
> usbcore: registered new driver hub
> NET: Registe.......=EF=BF=BD=EF=BF=BD.=EF=BF=BDPs....=EF=BF=BD=EF=BF=BD=
Register device ipmc successgul.
> Initialize IPM performance perfiler.
> Monahans Dynamic Power Management
> Intel(c) Memory Management - SRAM Allocation
> Intel(c) Memory Management - L2 Cache Locking
> Intel(c) Memory Management - Page Attribute Manipulation
> Intel(c) Memory Management is now Enabled
> NetWinder Floating Point Emulator V0.97 (double precision)
> JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
> JFFS2: default compression mode: priority
> Initializing Cryptographic API
> Initialize ARAVA failed
> pxa2xx-fb pxa2xx-fb: machine LCCR3 setting contains illegal bits: 00300=
000
> Console: switching to colour frame buffer device 30x20
> Load PXA Overlay driver successfully!
> PXA Real Time Clock driver v1.02
> ttyS0 at MMIO 0x40100000 (irq =3D 22) is a FFUART
> ttyS1 at MMIO 0x40200000 (irq =3D 21) is a BTUART
> io scheduler noop registered
> io scheduler anticipatory registered
> io scheduler deadline registered
> io scheduler cfq registered
> RAMDISK driver initialized: 4 RAM disks of 16384K size 1024 blocksize
> loop: loaded (max 8 devices)
> smc91x: not found (-19).
> Linux video capture interface: v1.00
> PXA_CAMERA: PXA Camera driver loaded for/dev/video0
> Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
> ide: Assuming 50MHz system bus speed for PIO modes; override with=20
> idebus=3Dxx
> true_ide_init:true_ide_init_module
> Detect a micro disk inserted into the CF socket!
> true_ide_init: true ide disk register failed!
> trueide-microdisk: probe of trueide-microdisk failed with error -5
> id:0xf1ec, chipid:0x46ec
> id:0xf1ec, chipid:0xa12c
> id:0xf1ec, chipid:0xf1ec
> Try to allocate data buffer(len:2112)
> NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 128MiB
> 3,3V 8-bit)
> Relocation table recognized, totally 57 block relocated
> Block 0x1 relocate to Block 0x:3ff
> Block 0x2 relocate to Block 0x:3fe
> Block 0x4 relocate to Block 0x:3fd
> Block 0xe relocate to Block 0x:3fc
> Block 0xf relocate to Block 0x:3fb
> Block 0x10 relocate to Block 0x:3fa
> Block 0x11 relocate to Block 0x:3f9
> Block 0x92 relocate to Block 0x:3f8
> Block 0x93 relocate to Block 0x:3f7
> Block 0x94 relocate to Block 0x:3f6
> Block 0x95 relocate to Block 0x:3f5
> Block 0x96 relocate to Block 0x:3f4
> Block 0x97 relocate to Block 0x:3f3
> Block 0x98 relocate to Block 0x:3f2
> Block 0x99 relocate to Block 0x:3f1
> Block 0x9a relocate to Block 0x:3f0
> Block 0x9b relocate to Block 0x:3ef
> Block 0x9c relocate to Block 0x:3ee
> Block 0x9d relocate to Block 0x:3ed
> Block 0x9e relocate to Block 0x:3ec
> Block 0x9f relocate to Block 0x:3eb
> Block 0xa0 relocate to Block 0x:3ea
> Block 0xa1 relocate to Block 0x:3e9
> Block 0xa2 relocate to Block 0x:3e8
> Block 0xa3 relocate to Block 0x:3e7
> Block 0xa4 relocate to Block 0x:3e6
> Block 0xa5 relocate to Block 0x:3e5
> Block 0xa6 relocate to Block 0x:3e4
> Block 0xa7 relocate to Block 0x:3e3
> Block 0xa8 relocate to Block 0x:3e2
> Block 0xaa relocate to Block 0x:3e0
> Block 0xab relocate to Block 0x:3df
> Block 0xac relocate to Block 0x:3de
> Block 0xad relocate to Block 0x:3dd
> Block 0xae relocate to Block 0x:3dc
> Block 0xaf relocate to Block 0x:3db
> Block 0xb0 relocate to Block 0x:3da
> Block 0xb1 relocate to Block 0x:3d9
> Block 0xb2 relocate to Block 0x:3d8
> Block 0xb3 relocate to Block 0x:3d7
> Block 0xb4 relocate to Block 0x:3d6
> Block 0xb5 relocate to Block 0x:3d5
> Block 0xb6 relocate to Block 0x:3d4
> Block 0xb7 relocate to Block 0x:3d3
> Block 0xb8 relocate to Block 0x:3d2
> Block 0xb9 relocate to Block 0x:3d1
> Block 0xba relocate to Block 0x:3d0
> Block 0xbb relocate to Block 0x:3cf
> Block 0xbc relocate to Block 0x:3ce
> Block 0xbd relocate to Block 0x:3cd
> Block 0xbe relocate to Block 0x:3cc
> Block 0xbf relocate to Block 0x:3cb
> Block 0xc0 relocate to Block 0x:3ca
> Block 0xc1 relocate to Block 0x:3c9
> Block 0xc2 relocate to Block 0x:3c8
> Block 0xc3 relocate to Block 0x:3c7
> Flash size is 0x7020000 bytes
> Creating 5 MTD partitions on "NAND 128MiB 3,3V 8-bit":
> 0x00000000-0x00040000 : "Bootloader"
> mtd: Giving out device 0 to Bootloader
> 0x00040000-0x00240000 : "Kernel"
> mtd: Giving out device 1 to Kernel
> 0x00240000-0x01240000 : "Filesystem"
> mtd: Giving out device 2 to Filesystem
> 0x01240000-0x06f80000 : "MassStorage"
> mtd: Giving out device 3 to MassStorage
> 0x06f80000-0x07020000 : "BBT"
> mtd: Giving out device 4 to BBT
> usbmon: debugfs is not available
> pxa-ohci pxa-ohci: PXA27x OHCI
> pxa-ohci pxa-ohci: new USB bus registered, assigned bus number 1
> pxa-ohci pxa-ohci: irq 3, io mem 0x4c000000
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 3 ports detected
> usbcore: registered new driver cdc_acm
> drivers/usb/class/cdc-acm.c: v0.23:USB Abstract Control Model driver
> for USB modems and ISDN adapters
> Initializing USB Mass Storage driver...
> usbcore: registered new driver usb-storage
> USB Mass Storage support registered.
> usbcore: registered new driver usbhid
> drivers/usb/input/hid-core.c: v2.6:USB HID core driver
> pxa27x_udc: version 01-Jul-2005
> mice: PS/2 mouse device common for all mice
> input: zylonite touch screen device!
> platform bus: zylonite touch screen device!
> platform bus: zylonite touch driver!
> reset failed (no 1-wire responsed)!
> totally found 0 1-wire rom(s)
> Successful probe one-wire device
> Advanced Linux Sound Architecture Driver Version 1.0.10rc1 (Mon Sep 12
> 08:13:09 2005 UTC).
> ALSA device list:
>  #0: pxa2xx-ac97 ()
> NET: Registered protocol family 2
> IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
> TCP established hash table entries: 4096 (order: 4, 65536 bytes)
> TCP bind hash table entries: 4096 (order: 4, 81920 bytes)
> TCP: Hash tables configured (established 4096 bind 4096)
> TCP reno registered
> TCP bic registered
> NET: Registered protocol family 1
> copy_obm: back up obm to :0xc3ed0000
> copy_obm: back up obm to :0xc3ed0008
> IP-Config: Device `eth0' not found.
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00000000
> OOB at 00000000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> e3 6b a8 ad 4f 0f fd 21 3f 2a 9d 0a dc 89 e5 88 9d 06 0d a3 70 c3 28
> 0c
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00020000
> OOB at 00020000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> b9 ae 2d fb 3e 0e 42 31 42 af 73 0f a0 6f 47 bd 8e 04 63 d9 48 f2 9c
> 08
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00040000
> OOB at 00040000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 24 5a 45 dc 03 04 37 e7 98 98 6c 03 91 80 ec 8e 8a 01 cd 44 71 33 51
> 0c
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00060000
> OOB at 00060000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> db 4e 28 49 ec 05 38 94 d3 f1 1a 0b 07 67 51 6b f3 0e b9 df c7 44 5d
> 0b
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00080000
> OOB at 00080000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 7a 91 65 a1 9b 06 08 9a ea 7d 59 05 9d b3 4f e7 ec 03 bd e2 47 af f8
> 01
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 000a0000
> OOB at 000a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 4d ba b5 6c 91 02 ae 7f fe be ca 0a 84 63 5c b4 4d 02 cd ba f9 19 c4
> 04
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 000c0000
> OOB at 000c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> fe 86 f2 ea f4 09 b1 9b 39 b9 33 0b 89 36 1e f7 d8 02 d5 ef 8a 0a 44
> 0d
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 000e0000
> OOB at 000e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 73 57 7c 76 bf 05 91 a9 ee ce 00 01 12 a1 a6 44 a8 09 03 c7 2e 3f 4e
> 04
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00100000
> OOB at 00100000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 59 2a 1c c3 5f 02 1d 0d ff ed 69 05 be 7c 44 d0 e0 0e b5 00 35 78 15
> 08
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00120000
> OOB at 00120000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 19 a5 7e 46 a9 0f f9 74 be c1 62 00 0a 8d b0 42 23 0c 16 38 b0 05 0e
> 0c
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00140000
> OOB at 00140000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 8f f4 7e 89 17 05 c6 eb 13 5b 50 0e b6 53 87 ed d4 01 05 be 60 81 2f
> 08
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00160000
> OOB at 00160000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> fb a5 6a d4 03 00 d0 ba e3 4b 11 07 9a 01 78 99 ff 01 b7 02 f6 ad 80
> 0d
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00180000
> OOB at 00180000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> bf e7 92 ba ec 01 02 47 12 6a 3b 0e e3 b5 62 d2 07 02 76 fc 29 b7 d5
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 001a0000
> OOB at 001a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 4d 2a ac 6c f5 04 bd 47 e8 45 bb 00 2a 8d d4 1f 76 00 2e 62 ec de 4d
> 0e
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 001c0000
> OOB at 001c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 16 49 eb 10 87 0f fd c6 73 bf f1 0c ba 9a ac ae 26 0b a5 f6 07 fc a8
> 04
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 001e0000
> OOB at 001e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> b4 01 76 38 d5 08 40 4a bb 3a 78 04 8d 30 28 76 59 0f 81 f8 c0 8a 94
> 0a
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00200000
> OOB at 00200000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> cc 61 da 8c 67 09 59 39 fe fc 24 05 a8 2b 56 bf df 00 18 da 3b 86 f6
> 0e
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00220000
> OOB at 00220000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 27 4d 84 1c 46 04 6f d8 12 e4 49 0b 01 76 9f 7f 22 08 68 6d de a5 64
> 08
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00240000
> OOB at 00240000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> a6 0d c2 3c d6 05 7a 60 3a b4 32 04 30 4c 73 59 86 09 79 f6 eb 34 57
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00260000
> OOB at 00260000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ef 19 63 d1 6c 02 ae 34 ea 7e d8 0f c9 78 26 67 cb 0c fc a9 2d 7f 6a
> 0b
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00280000
> OOB at 00280000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> c0 e5 e2 8f 46 07 bf 99 be 3a f3 0a 9c 75 63 32 88 0d 78 d5 af f4 5f
> 01
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 002a0000
> OOB at 002a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 40 46 06 90 91 01 c8 6e d5 4d a4 0a 09 ae d6 28 01 0f cc fe 9f 19 55
> 0d
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 002c0000
> OOB at 002c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> eb 86 57 10 4b 0f fb 18 3a c1 79 01 97 ee 40 0f 91 0a 30 9d 37 4c e7
> 0d
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 002e0000
> OOB at 002e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> dd 06 f3 1d 6b 06 24 62 a5 23 f2 03 06 b7 c9 94 38 07 a3 1f 1e 17 78
> 08
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00300000
> OOB at 00300000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 12 a4 93 04 e9 04 7d 05 b0 a0 fe 03 a6 1d c8 3c 52 07 c6 7e 83 b1 df
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00320000
> OOB at 00320000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 30 f8 57 59 ab 00 5c 67 85 7d f3 0b 78 4b 40 8b 47 05 e6 c9 6f 86 0d
> 04
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00340000
> OOB at 00340000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 18 cd af ec 59 01 b0 de 99 06 dd 0c cf b1 82 26 f9 05 64 7d 0a 59 9f
> 02
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00360000
> OOB at 00360000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 5f 1e 10 68 f8 0b 9a 18 5b d9 39 09 56 93 24 7f 8e 03 7c 0d 0b 5f c3
> 02
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00380000
> OOB at 00380000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 69 d6 f9 30 df 04 a0 0c c4 d7 fc 0e 87 e4 5a 8b 13 0c 9c 46 46 f2 c4
> 04
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 003a0000
> OOB at 003a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> b3 89 8f 39 b7 06 55 a3 35 80 3d 08 d2 81 8f 74 e0 03 77 6e de 9d 9b
> 07
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 003c0000
> OOB at 003c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> c6 b4 5d ce 92 08 1a 57 35 6c ff 07 87 1c a6 74 d2 0c d0 a2 fc 4b d7
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 003e0000
> OOB at 003e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 61 e5 d6 f2 13 0f 24 75 d9 b6 a2 09 c6 ed 39 db d1 04 86 12 63 5e 3b
> 07
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00400000
> OOB at 00400000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 8c a9 86 c9 00 0b 8f 69 b9 36 0f 0b ac 12 82 01 2e 0a 08 a0 32 02 a8
> 0c
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00420000
> OOB at 00420000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 91 43 7a e4 90 0e ed d8 e0 91 9c 02 f0 17 5c a9 50 02 03 b6 fc 80 2d
> 0f
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00440000
> OOB at 00440000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 30 89 c9 b3 9d 0d 8f 9a 71 09 cc 06 49 b3 96 2d 53 0a 4e 11 33 f9 6e
> 06
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00460000
> OOB at 00460000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 76 6c 3e b7 31 05 1c 5e 6e d2 c2 0e 5e ce 8a 97 b3 02 bf 33 5a 45 26
> 0c
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00480000
> OOB at 00480000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 86 96 a0 a1 25 08 da cb 86 f6 b2 01 32 8d 0a e6 09 08 ea de 80 ba 37
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 004a0000
> OOB at 004a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 1c a9 f7 b8 15 02 46 c8 0a bb 18 08 22 bb 7e 37 51 00 12 f3 33 6e 56
> 06
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 004c0000
> OOB at 004c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> e5 bc 5c 39 2f 07 9d a1 f2 cd 02 06 e3 86 9a ed f4 03 66 b1 1b f3 46
> 0c
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 004e0000
> OOB at 004e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x004e0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00500000
> OOB at 00500000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00500000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00520000
> OOB at 00520000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00520000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00540000
> OOB at 00540000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00540000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00560000
> OOB at 00560000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00560000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00580000
> OOB at 00580000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00580000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 005a0000
> OOB at 005a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x005a0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 005c0000
> OOB at 005c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x005c0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 005e0000
> OOB at 005e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x005e0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00600000
> OOB at 00600000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00600000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00620000
> OOB at 00620000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00620000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00640000
> OOB at 00640000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00640000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00660000
> OOB at 00660000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00660000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00680000
> OOB at 00680000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00680000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 006a0000
> OOB at 006a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x006a0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 006c0000
> OOB at 006c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x006c0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 006e0000
> OOB at 006e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x006e0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00700000
> OOB at 00700000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00700000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00720000
> OOB at 00720000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00720000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00740000
> OOB at 00740000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00740000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00760000
> OOB at 00760000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00760000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00780000
> OOB at 00780000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00780000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 007a0000
> OOB at 007a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x007a0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 007c0000
> OOB at 007c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x007c0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 007e0000
> OOB at 007e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x007e0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00800000
> OOB at 00800000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00800000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00820000
> OOB at 00820000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00820000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00840000
> OOB at 00840000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00840000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00860000
> OOB at 00860000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00860000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00880000
> OOB at 00880000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00880000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 008a0000
> OOB at 008a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x008a0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 008c0000
> OOB at 008c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x008c0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 008e0000
> OOB at 008e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x008e0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00900000
> OOB at 00900000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00900000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00920000
> OOB at 00920000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00920000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00940000
> OOB at 00940000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00940000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00960000
> OOB at 00960000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00960000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00980000
> OOB at 00980000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00980000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 009a0000
> OOB at 009a0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x009a0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 009c0000
> OOB at 009c0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x009c0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 009e0000
> OOB at 009e0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x009e0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00a00000
> OOB at 00a00000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00a00000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00a20000
> OOB at 00a20000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00a20000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00a40000
> OOB at 00a40000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00a40000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00a60000
> OOB at 00a60000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00a60000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00a80000
> OOB at 00a80000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00a80000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00aa0000
> OOB at 00aa0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00ac0000
> OOB at 00ac0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00ac0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00ae0000
> OOB at 00ae0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00ae0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00b00000
> OOB at 00b00000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00b00000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00b20000
> OOB at 00b20000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00b20000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00b40000
> OOB at 00b40000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00b40000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00b60000
> OOB at 00b60000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00b60000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00b80000
> OOB at 00b80000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00b80000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00ba0000
> OOB at 00ba0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00ba0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00bc0000
> OOB at 00bc0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00bc0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00be0000
> OOB at 00be0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00be0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00c00000
> OOB at 00c00000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00c00000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00c20000
> OOB at 00c20000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00c20000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00c40000
> OOB at 00c40000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00c40000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00c60000
> OOB at 00c60000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00c60000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00c80000
> OOB at 00c80000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00c80000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00ca0000
> OOB at 00ca0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00ca0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00cc0000
> OOB at 00cc0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00cc0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00ce0000
> OOB at 00ce0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00ce0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00d00000
> OOB at 00d00000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00d00000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00d20000
> OOB at 00d20000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00d20000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00d40000
> OOB at 00d40000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00d40000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00d60000
> OOB at 00d60000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00d60000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00d80000
> OOB at 00d80000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00d80000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00da0000
> OOB at 00da0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00da0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00dc0000
> OOB at 00dc0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00dc0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00de0000
> OOB at 00de0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00de0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00e00000
> OOB at 00e00000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00e00000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00e20000
> OOB at 00e20000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00e20000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00e40000
> OOB at 00e40000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00e40000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00e60000
> OOB at 00e60000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00e60000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00e80000
> OOB at 00e80000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00e80000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00ea0000
> OOB at 00ea0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00ea0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00ec0000
> OOB at 00ec0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00ec0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00ee0000
> OOB at 00ee0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00ee0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00f00000
> OOB at 00f00000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00f00000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00f20000
> OOB at 00f20000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00f20000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00f40000
> OOB at 00f40000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00f40000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00f60000
> OOB at 00f60000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00f60000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00f80000
> OOB at 00f80000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00f80000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00fa0000
> OOB at 00fa0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00fa0000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00fc0000
> OOB at 00fc0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00fe0000
> OOB at 00fe0000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00
> jffs_check_nand_cleanmarker returned 1
> jffs2_check_oob_empty returned 1
> JFFS2: Erase block at 0x00fe0000 is not formatted. It will be erased
> VFS: Mounted root (jffs2 filesystem).
> Freeing init memory: 108K
> nand_erase: Device is write protected!!!
> Erase at 0x008c0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x008a0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00880000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00860000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00840000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00820000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00800000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x007e0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x007c0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x007a0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00780000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00760000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00740000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00720000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00700000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x006e0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x006c0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x006a0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00680000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00660000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00640000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00620000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00600000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x005e0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x005c0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x005a0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00580000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00560000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00540000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00520000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00500000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x004e0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00fe0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00fc0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00fa0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00f80000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00f60000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00f40000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00f20000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00f00000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00ee0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00ec0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00ea0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00e80000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00e60000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00e40000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00e20000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00e00000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00de0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00dc0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00da0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00d80000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00d60000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00d40000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00d20000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00d00000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00ce0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00cc0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00ca0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00c80000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00c60000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00c40000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00c20000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00c00000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00be0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00bc0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00ba0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00b80000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00b60000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00b40000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00b20000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00b00000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00ae0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00ac0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00aa0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00a80000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00a60000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00a40000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00a20000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00a00000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x009e0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x009c0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x009a0000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00980000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00960000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00940000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00920000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x00900000 failed immediately: errno -5
> nand_erase: Device is write protected!!!
> Erase at 0x008e0000 failed immediately: errno -5
> jffs2_flush_wbuf(): Write failed with -5
> About to refile bad block at 004c0000
> Refiling block at 004c0000 to bad_used_list
> Argh. No free space left for GC. nr_erasing_blocks is 0.
> nr_free_blocks is 0. (erasableempty: yes, erasingempty: yes,
> erasependingempty: yes)
> Failed to allocate space for wbuf recovery. Data loss ensues.
> jffs2_flush_wbuf(): Write failed with -5
> About to refile bad block at 004c0000
> Refiling block at 004c0000 to bad_used_list
> Argh. No free space left for GC. nr_erasing_blocks is 0.
> nr_free_blocks is 0. (erasableempty: yes, erasingempty: yes,
> erasependingempty: yes)
> Failed to allocate space for wbuf recovery. Data loss ensues.
> serial_pxa_startup: power mode =3D 0
> uart_pxa_dma_init: enter, with power_mode =3D 0
> jffs2_flush_wbuf(): Write failed with -5
> About to refile bad block at 004c0000
> Refiling block at 004c0000 to bad_used_list
> Argh. No free space left for GC. nr_erasing_blocks is 0.
> nr_free_blocks is 0. (erasableempty: yes, erasingempty: yes,
> erasependingempty: yes)
> Failed to allocate space for wbuf recovery. Data loss ensues.
> jffs2_flush_wbuf(): Write failed with -5
> About to refile bad block at 004c0000
> Refiling block at 004c0000 to bad_used_list
> Argh. No free space left for GC. nr_erasing_blocks is 0.
> nr_free_blocks is 0. (erasableempty: yes, erasingempty: yes,
> erasependingempty: yes)
> Failed to allocate space for wbuf recovery. Data loss ensues.
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
