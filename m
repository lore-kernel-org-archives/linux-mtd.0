Received: from mx3.aruba.it ([62.149.128.132])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aiqd8-0004uH-Sm
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 07:48:58 +0000
From: Andrea Galbusera <andrea.galbusera@teamware.it>
To: Thorsten Reimers <thorsten@treimers.net>
In-Reply-To: <400C1C7E.2090404@treimers.net>
References: <400C1C7E.2090404@treimers.net>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1074585028.3939.5.camel@andreagal>
Mime-Version: 1.0
Date: 20 Jan 2004 08:50:28 +0100
Content-Transfer-Encoding: 8bit
cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Problem booting from DiskOnChip 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thorsten!

http://www.linuxdevices.com/files/misc/DiskOnChipDevelopment-HOWTO.pdf

I think this doc can help you. If you get in trouble to find it contact
me and I can send you the file.

Hope this help!
AndreA

Il lun, 2004-01-19 alle 19:05, Thorsten Reimers ha scritto:
> Hi all,
> 
> I have a board with a DiskOnChip 200 module from M-System. I have been able, to 
> start the driver as a module and partitioning and fromatting the chip. I am 
> struggling to boot from it, does anybody have an idea?
> 
> Find below the messages from my Bios and from Linux during boot (from floppy).
> 
> BIOS Messages
> =============
> 
> DOC Socket Services - Version 0.2
> (C) Copyright 1992-1996, M-Systems Ltd.
> 
> TrueFFF-BIOS -- Version 3.3.9 for DiskOnChip 2000 (V4.3)
> Copryright (C) M-Systems, 1992-2001
> 
> Linux Boot Messages
> ===================
> Using /opt/files/lib/modules/2.4.23/kernel/drivers/mtd/mtdcore.o
> Using /opt/files/lib/modules/2.4.23/kernel/drivers/mtd/nand/nand_ids.o
> Using /opt/files/lib/modules/2.4.23/kernel/drivers/mtd/devices/docecc.o
> Using /opt/files/lib/modules/2.4.23/kernel/drivers/mtd/devices/doc2000.o
> Using /opt/files/lib/modules/2.4.23/kernel/drivers/mtd/mtd_bkl_devs.o
> DiskOnChip 2000 found at address 0xD8000
> Flash chip foind: Manufacturer ID: 98, Chip ID: E6 (Toshiba: NAND 8MiB 3,3V)
> 3 flash chips found. Total DiskOnChip size: 24 MiB
> Ignoring DiskOnChip 2000 at 0xDA000 - already configured
> Ignoring DiskOnChip 2000 at 0xDC000 - already configured
> Ignoring DiskOnChip 2000 at 0xDE000 - already configured
> Using /opt/files/lib/modules/2.4.23/kernel/drivers/devices/docprobe.o
> NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34 $
> NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think we know 
> what it means ...
> 
> During boot it stop's after sending out only some characters from linux load:
> SYSLINUX 1.76 0x3d93445f
> 
> Maybe I should clean the chip by a tool, maybe I should install a new
> firmware on the chip? I tried it together with a hard disk with Windows and the
> disk-on-chip tools from MSystem. This worked really fine so I decided to
> install Linux now.
> 
> And, last but not least: Dave Woodhouse, I would like to apologize for sending 
> out an email to you (which you did answer nevertheless). I just discovered this 
> mailing list and how to get help.
> 
> Thorsten
> 
> Wer krank wird, erfährt als erstes, dass er selber Schuld hat. - Eugen Drewermann
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
