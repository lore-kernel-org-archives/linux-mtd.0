Received: from web02.manitu.net ([217.11.48.102])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BHh0S-0007Gg-TM
	for linux-mtd@lists.infradead.org; Sun, 25 Apr 2004 11:37:04 +0100
Message-ID: <408B94CC.4070002@treimers.net>
Date: Sun, 25 Apr 2004 12:37:00 +0200
From: Thorsten Reimers <thorsten@treimers.net>
MIME-Version: 1.0
To: Thorsten Reimers <thorsten@treimers.net>
References: <400C1C7E.2090404@treimers.net>
In-Reply-To: <400C1C7E.2090404@treimers.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problem booting from DiskOnChip 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have been able to fix the problem by downloading the DiskOnChip tools from 
M-System (www.m-sys.com) by reformatting the chip and rewriting the True-FFS Bios.

Thorsten

Thorsten Reimers wrote:

> Hi all,
> 
> I have a board with a DiskOnChip 200 module from M-System. I have been 
> able, to start the driver as a module and partitioning and fromatting 
> the chip. I am struggling to boot from it, does anybody have an idea?
> 
> Find below the messages from my Bios and from Linux during boot (from 
> floppy).
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
> Flash chip foind: Manufacturer ID: 98, Chip ID: E6 (Toshiba: NAND 8MiB 
> 3,3V)
> 3 flash chips found. Total DiskOnChip size: 24 MiB
> Ignoring DiskOnChip 2000 at 0xDA000 - already configured
> Ignoring DiskOnChip 2000 at 0xDC000 - already configured
> Ignoring DiskOnChip 2000 at 0xDE000 - already configured
> Using /opt/files/lib/modules/2.4.23/kernel/drivers/devices/docprobe.o
> NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34 $
> NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think 
> we know what it means ...
> 
> During boot it stop's after sending out only some characters from linux 
> load:
> SYSLINUX 1.76 0x3d93445f
> 
> Maybe I should clean the chip by a tool, maybe I should install a new
> firmware on the chip? I tried it together with a hard disk with Windows 
> and the
> disk-on-chip tools from MSystem. This worked really fine so I decided to
> install Linux now.
> 
> And, last but not least: Dave Woodhouse, I would like to apologize for 
> sending out an email to you (which you did answer nevertheless). I just 
> discovered this mailing list and how to get help.
> 
> Thorsten
> 
> Wer krank wird, erfährt als erstes, dass er selber Schuld hat. - Eugen 
> Drewermann
> 
> 

-- 
________________________________________
Thorsten Reimers
Software-Engineering Consulting Training
www.treimers.net
Mobile: 0177 / 3265157
