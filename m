Received: from kraken.cctechnol.com ([65.208.62.35])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMvXN-0000Dc-UE
	for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2003 20:36:26 +0000
Received: from thor ([65.208.62.147] helo=thor.cctechnol.com.cctechnol.com)
	by kraken.cctechnol.com with esmtp (Exim 3.34 #1)
	id 1AMvUy-0006Ri-00
	for linux-mtd@lists.infradead.org; Thu, 20 Nov 2003 20:33:56 +0000
Sender: avc@thor.cctechnol.com
To: linux-mtd@lists.infradead.org
From: Al Cousson <avc@cctechnol.com>
Date: 20 Nov 2003 14:33:55 -0600
Message-ID: <7iu14yeq4s.fsf@thor.cctechnol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: DiskOnChip 2000 TSOP bad blocks table
Reply-To: avc@cctechnol.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I received this x86 compatible SBC computer with a DiskOnChip 2000
TSOP for eval the other day.

I got the latest snapshot of the MTD source, compiled it with the
latest 2.4.22 kernel and it recognized the chip.  It does produce a
few curious messages at bootup though:

INTFL: corrupt block 390 in chain 390, chain length 0, erase mark 0x0?
INTFL: formatting chain at block 390
INTFL: formatting block 390
Error erasing at 0x618000
INTFL: error while formatting block 390
INTFL: cannot calculate a geometry to match size of 0x3ea60.
INTFL: using C:1002 H:16 S:16 (== 0x3ea00 sects)

I fdisk'ed it, made an ext2 filesystem on it and copied my files onto
it.  So far, so good.  Then I attempted to install grub on it,
following the directions in the latest MTD source.  Running
doc_loadbios totally hosed the DiskOnChip.  The driver no longer
recognized any DiskOnChips at bootup.

The M-Systems dformat utility failed with "Error - Unreadable bad
blocks table."  The M-Systems tech support told me to RMA it with my
vendor.  I got a replacement DiskOnChip 2000 TSOP in.

During bootup, I get the same INTFL messages.  Actually, the above
messages are from the second chip.  The numbers may have been slightly
different for the first one.  I haven't attempted the doc_loadbios on
it, fearing the corrupted bad blocks table thing.  I never mounted or
even fdisk'ed this second chip.

But, the M-Systems utilities are again reporting "Unreadable bad
blocks table".

So, finally to my questions:

1.  Is it possible that the INFTL driver is corrupting the bad blocks
    table?

2.  Does doc_loadbios need to be updated to work on the DiskOnChip
    2000 TSOP? 

3.  Or, did I just get 2 bad DiskOnChips?


Thanks,
Al Cousson

-----------------------------------------------------------------
Al Cousson, Systems Engineer     |  Phone: (337) 261-0660
C & C Technologies, Inc.         |  Fax:   (337) 261-0192
730 E. Kaliste Saloom Road       |  mail:  avc@cctechnol.com             
Lafayette, LA 70508              |  
-----------------------------------------------------------------
