Received: from pu90.internetdsl.tpnet.pl ([80.55.20.90]
	helo=evo.evopolska.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NVuF-0004Q8-9i
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 11:54:11 +0100
Received: from evo.evopolska.com (localhost.localdomain [127.0.0.1])
	by evo.evopolska.com (8.12.5/8.12.5) with ESMTP id h54AubTe013521
	for <linux-mtd@lists.infradead.org>; Wed, 4 Jun 2003 12:56:37 +0200
Received: from localhost (angainor@localhost)h54AuX51013517
	for <linux-mtd@lists.infradead.org>; Wed, 4 Jun 2003 12:56:35 +0200
Date: Wed, 4 Jun 2003 12:56:33 +0200 (CEST)
From: angainor@evo.evopolska.com
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0306041127320.8546-100000@evo.evopolska.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: MTD drivers for DoC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I'm trying to set up a single boot solution based
on DiscOnChip Millenium Plus and Linux (yeah, I
know... I should use a flash chip instead ;)
not up to me.) No real problems when doing that 
with M-Systems binary linux driver, still my boss 
would rather use a GPLd driver. 
I have experienced some problems with doc2001plus 
and inftl drivers and I hoped you could help me out. 
And yes, I know that the inftl driver is quite new...
I could work on it for some time, if it wouldn't be
too much time and if I knew where to start.

First of all, docprobe successfuly identifies DOCMP,
but total size of the DoC is only half of its actual
size (64MiB chip is identified as 32MiB).
I have studied the "DiskOnChip 2000 128Mb problem"
thread here on list and tried to change the
MAX_CHIPS_MPLUS define to something else than 1.
Well, this way I got an 128MiB disk, then a
256MiB one, and so on... :). way too many chips found.
I am able to correctly read the /dev/mtd0 device
(char) with doc2001plus driver. However, 
insmod inftl has no effect. Looking into the code
and little debugging showed that:

1. inftlcore.c

        if (mtd->ecctype != MTD_ECC_RS_DiskOnChip)
                return;

   does indeed return. I guess it shouldn't...
   I don't yet understand the full architecture
   of linux MTD driver, but a quick grep showed,
   that mtd->ecctype is never actually set, except
   for mtd->ecctype = MTD_ECC_SW; in nand.c.
   Is this value acquired from the chip directly?
   If so, there must be something wrong there.
   I commented out that part to see what's next ;)

	Jun  4 13:36:43 (none) syslog.warn klogd: INFTL: Media Header ->
	Jun  4 13:36:43 (none) syslog.warn klogd:     bootRecordID          = BNAND
	Jun  4 13:36:43 (none) syslog.warn klogd:     NoOfBootImageBlocks   = -1
	Jun  4 13:36:43 (none) syslog.warn klogd:     NoOfBinaryPartitions  = 1
	Jun  4 13:36:43 (none) syslog.warn klogd:     NoOfBDTLPartitions    = 1
	Jun  4 13:36:43 (none) syslog.warn klogd:     BlockMultiplerBits    = 0
	Jun  4 13:36:43 (none) syslog.warn klogd:     FormatFlgs            = 1
	Jun  4 13:36:43 (none) syslog.warn klogd:     OsakVersion           = 0x30343135
	Jun  4 13:36:43 (none) syslog.warn klogd:     PercentUsed           = 98
	Jun  4 13:36:43 (none) syslog.warn klogd:     PARTITION[0] ->
	Jun  4 13:36:43 (none) syslog.warn klogd:         virtualUnits    = 10
	Jun  4 13:36:43 (none) syslog.warn klogd:         firstUnit       = 0
	Jun  4 13:36:43 (none) syslog.warn klogd:         lastUnit        = 0
	Jun  4 13:36:43 (none) syslog.warn klogd:         flags           = 0x20000000
	Jun  4 13:36:43 (none) syslog.warn klogd:         spareUnits      = 0
	Jun  4 13:36:43 (none) syslog.warn klogd: INFTL: Media Header Parition 0 
sanity check failed
	Jun  4 13:36:43 (none) syslog.warn klogd:     firstUnit 0 : lastUnit 0  >  
virtualUnits 0
	Jun  4 13:36:43 (none) syslog.warn klogd: INFTL: could not find valid boot record?
	Jun  4 13:36:43 (none) syslog.warn klogd: INFTL: could not mount device	
   
   Basically, the start is ok and does reflect the
   reality. So what goes wrong afterwards?

2. doc2000.h
   
   I found the following definition:

	#define DoC_Mplus_OutputControl         0x1002

   Shouldn't this be rather:

	#define DoC_Mplus_OutputControl         0x100c

   This is what I found in DOC_Millennium_Plus_DS_Rev1.7.pdf.
   0x1002 is actually NOP. I don't think this will help me
   much though ;)
