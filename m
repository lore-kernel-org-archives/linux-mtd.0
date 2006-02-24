Received: from srv26.vktv.no ([84.16.208.26] helo=banan.dataparty-mn.biz)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FCaJW-000702-WA
	for linux-mtd@lists.infradead.org; Fri, 24 Feb 2006 05:36:47 -0500
Received: from [10.0.0.54] (ti500710a080-0732.bb.online.no [85.167.130.220])
	by banan.dataparty-mn.biz (Postfix) with ESMTP id B277D13C338
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Feb 2006 11:11:53 +0100 (CET)
Message-ID: <43FEDC51.2070700@repvik.org>
Date: Fri, 24 Feb 2006 11:13:37 +0100
From: =?ISO-8859-1?Q?=D8yvind_Repvik?= <oyvind@repvik.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: DoC and IXP4xx
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

	I've finally gotten the DiskOnChip Millennium Plus working on the 
IXP420. But I'm apparently still not there. Is there anyone who can help 
me figure out why the partitions are not set up correctly?
There's (iirc) 7 partitions on the DoC chip. I end up with two.
Also, what is causing the many errors I get (at the end of dmesg)?
dmesg below.

Regards,
Øyvind Repvik

--------------------------------------------------

Uncompressing 
Linux................................................................................ 
done, booting the kernel.Linux version 2.6.16-rc2-git8 (repvik@Ximinez) 
(gcc version 3.4.4) #12 Thu Feb 23 05:31:44 CET 2006
CPU: XScale-IXP42x Family [690541f1] revision 1 (ARMv5TE)
Machine: Synology DiskStation DS101
Warning: bad configuration page, trying to continue
Ignoring unrecognised tag 0x00000000
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Built 1 zonelists
Kernel command line: root=/dev/sda1 rootfstype=ext3 init=/sbin/init 
rtc-rs5c372.probe=0,0x32 root=/dev/sda2 ro noinitrd noir0PID hash table 
entries: 512 (order: 9, 8192 bytes)
IXP4xx: FREQ=66666600 COUNT=666665
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 64MB = 64MB total
Memory: 62268KB available (2037K code, 416K data, 80K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
IXP4xx: Using 16MiB expansion bus window size
PCI: IXP4xx is host
PCI: IXP4xx Using direct access for memory space
PCI: bus0: Fast back to back transfers disabled
dmabounce: registered device 0000:00:01.0 on pci bus
dmabounce: registered device 0000:00:02.0 on pci bus
dmabounce: registered device 0000:00:02.1 on pci bus
dmabounce: registered device 0000:00:02.2 on pci bus
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
DiskStation DS101 button driver v0.2
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (SUMMARY)  (C) 2001-2003 Red Hat, Inc.
Initializing Cryptographic API
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
IXP4xx Watchdog Timer: heartbeat 60 sec
Serial: 8250/16550 driver $Revision: 1.90 $ 2 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0xc8000000 (irq = 15) is a XScale
serial8250.0: ttyS1 at MMIO 0xc8001000 (irq = 13) is a XScale
PCI: enabling device 0000:00:01.0 (0140 -> 0141)
ata1: PATA max UDMA/100 cmd 0x1050 ctl 0x1062 bmdma 0x1040 irq 28
ata2: PATA max UDMA/100 cmd 0x1058 ctl 0x1066 bmdma 0x1048 irq 28
ata1: dev 0 ATA-7, max UDMA/133, 312581808 sectors: LBA48
ata1: dev 0 configured for UDMA/100
scsi0 : pata_artop
ATA: abnormal status 0x7F on port 0x105F
ata2: disabling port
scsi1 : pata_artop
   Vendor: ATA       Model: Maxtor 6L160P0    Rev: BAH4
   Type:   Direct-Access                      ANSI SCSI revision: 05
SCSI device sda: 312581808 512-byte hdwr sectors (160042 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write back w/ FUA
SCSI device sda: 312581808 512-byte hdwr sectors (160042 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write back w/ FUA
  sda: sda1 sda2
sd 0:0:0:0: Attached scsi disk sda
NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c $Revision: 1.41 $
INFTL: inftlcore.c $Revision: 1.19 $, inftlmount.c $Revision: 1.18 $
Using configured DiskOnChip probe address 0x50000000
DiskOnChip found at 0x50000000
NAND device: Manufacturer ID: 0x98, Chip ID: 0x73 (Toshiba NAND 16MiB 
3,3V 8-bit)
Found DiskOnChip BNAND Media Header at 0x14000
     bootRecordID          = BNAND
     NoOfBootImageBlocks   = -1
     NoOfBinaryPartitions  = 1
     NoOfBDTLPartitions    = 1
     BlockMultiplerBits    = 0
     FormatFlgs            = 1
     OsakVersion           = 5.1.4.0
     PercentUsed           = 95
     PARTITION[0] ->
         virtualUnits    = 967
         firstUnit       = 6
         lastUnit        = 972
         flags           = 0x20000000
         spareUnits      = 0
     PARTITION[1] ->
         virtualUnits    = 1
         firstUnit       = 974
         lastUnit        = 1023
         flags           = 0xc0000000
         spareUnits      = 2
  inftla: unknown partition table
Could not find valid boot record
NFTL: could not mount device
Creating 2 MTD partitions on "DiskOnChip Millennium Plus":
0x00018000-0x00f34000 : " DiskOnChip BDK partition"
0x00f38000-0x01000000 : " DiskOnChip BDTL partition"
PCI: enabling device 0000:00:02.2 (0140 -> 0142)
PCI: Via IRQ fixup for 0000:00:02.2, from 26 to 10
ehci_hcd 0000:00:02.2: EHCI Host Controller
ehci_hcd 0000:00:02.2: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:02.2: irq 26, io mem 0x48010000
ehci_hcd 0000:00:02.2: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 4 ports detected
USB Universal Host Controller Interface driver v2.3
PCI: enabling device 0000:00:02.0 (0140 -> 0141)
PCI: Via IRQ fixup for 0000:00:02.0, from 27 to 11
uhci_hcd 0000:00:02.0: UHCI Host Controller
uhci_hcd 0000:00:02.0: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:02.0: irq 27, io base 0x00001000
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
PCI: enabling device 0000:00:02.1 (0140 -> 0141)
PCI: Via IRQ fixup for 0000:00:02.1, from 27 to 11
uhci_hcd 0000:00:02.1: UHCI Host Controller
uhci_hcd 0000:00:02.1: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:02.1: irq 27, io base 0x00001020
usb usb3: configuration #1 chosen from 1 choice
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usb 3-1: new full speed USB device using uhci_hcd and address 2
usb 3-1: configuration #1 chosen from 1 choice
usbcore: registered new driver usb-storage
USB Mass Storage support registered.
usbcore: registered new driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial support registered for generic
usbcore: registered new driver usbserial_generic
drivers/usb/serial/usb-serial.c: USB Serial Driver core
drivers/usb/serial/usb-serial.c: USB Serial support registered for pl2303
pl2303 3-1:1.0: pl2303 converter detected
usb 3-1: pl2303 converter now attached to ttyUSB0
usbcore: registered new driver pl2303
drivers/usb/serial/pl2303.c: Prolific PL2303 USB to serial adaptor driver
i2c /dev entries driver
rs5c372 0-0032: chip found, driver version 0.2
rs5c372 0-0032: rtc intf: sysfs
rs5c372 0-0032: rtc intf: proc
rs5c372 0-0032: rtc intf: dev (254:0)
rs5c372 0-0032: rtc core: registered rs5c372 as rtc0
Registered led device: power
Registered led device: usbcopy-solid
Registered led device: usbcopy-blink
Registered led device: status-ready
Registered led device: status-error
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 4096 (order: 2, 16384 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
rs5c372 0-0032: setting the system clock to 2006-02-24 02:12:38 (1140747158)
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing init memory: 80K
INIT: version 2.86 booting
SlugOS booting...
Creating initial device nodes...
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
EXT3-fs warning: maximal mount count reached, running e2fsck is recommended
EXT3 FS on sda2, internal journal
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
end_request: I/O error, dev mtdblock0, sector 0
Starting syslogd/klogd: done
