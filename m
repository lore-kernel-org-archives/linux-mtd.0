Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Lpp6-0002oX-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 17:04:36 +0000
Received: from awpi.com
	([204.241.40.2] helo=sisko.awpi.com ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Lpp4-0002oQ-00
	for mtd@infradead.org; Thu, 25 Jan 2001 17:04:34 +0000
Received: from despav (ip50.austin18.tx.pub-ip.psi.net [38.27.176.50])
	by sisko.awpi.com (8.9.0/8.9.0) with SMTP id LAA28945
	for <mtd@infradead.org>; Thu, 25 Jan 2001 11:04:26 -0600
From: " Brian Michalk" <michalk@awpi.com>
To: <mtd@infradead.org>
Subject: fdisk problems
Date: Thu, 25 Jan 2001 10:48:16 -0600
Message-ID: <NEBBLKIBMLGPAFMHEJICGEMICEAA.michalk@awpi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <19215.980352455@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

After reviewing the archives, and going over the steps, I found that I
should be able to fdisk /dev/nftla device.  When I do:
embed: fdisk /dev/nftla
Unable to open /dev/nftla

embed: fdisk /dev/nftla1
Unable to open /dev/nftla1

I am not using modules, as I will be booting the DOC.
Here is the relevant information in my .config file.

CONFIG_MTD=y
CONFIG_MTD_DOC2000=y
CONFIG_MTD_DOCPROBE_ADDRESS=0
CONFIG_MTD_DOCPROBE_HIGH=n
CONFIG_MTD_DOCPROBE_55AA=y
CONFIG_FTL=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y

This is an edited dump of dmesg:
Linux version 2.4.0 (root@embed) (gcc version 2.95.2 19991024 (release)) #2
SMP Wed Jan 24 10:29:15 CST 2001
Kernel command line: auto BOOT_IMAGE=mtdkern1 ro root=303
Detected 133.637 MHz processor.
SMP motherboard not detected. Using dummy APIC emulation.
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
SIS5513: IDE controller on PCI bus 00 dev 09
SIS5513: chipset revision 193
SIS5513: not 100% native mode: will probe irqs later
hda: ST36422A, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hda: 12500460 sectors (6400 MB) w/256KiB Cache, CHS=778/255/63
JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip 2000 found at address 0xE0000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
9 flash chips found. Total DiskOnChip size: 72 Mb
DiskOnChip 2000 found at address 0xE2000
Flash chip found: Manufacturer ID: EC, Chip ID: E6 (Samsung KM29U64000)
9 flash chips found. Total DiskOnChip size: 72 Mb
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
Could not find valid boot record
Could not mount NFTL device
Could not find valid boot record
Could not mount NFTL device



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
