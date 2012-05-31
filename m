Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sa5vN-0004P4-R5
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 14:00:26 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1Sa5v3-0000je-Aw
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 16:00:05 +0200
Received: from ram94-11-88-187-113-157.fbx.proxad.net ([88.187.113.157])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 31 May 2012 16:00:05 +0200
Received: from romain.izard.pro by ram94-11-88-187-113-157.fbx.proxad.net with
 local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 31 May 2012 16:00:05 +0200
To: linux-mtd@lists.infradead.org
From: Romain Izard <romain.izard.pro@gmail.com>
Subject: UBIFS master node corruption
Date: Thu, 31 May 2012 13:52:27 +0000 (UTC)
Message-ID: <jq7t2r$md2$1@dough.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sirs,

While using a system based on UBI and UBIFS, I am encountering a rare
but regular occurence of corruption of the master node of the UBIFS
partitions.

This is happening on a device using a MLC flash with a 8 KiB write
pages, 2 MiB erase blocks, and an embedded hardware controller ensuring
a 24bit/KiB BCH error correction. The flash is split in multiple MTD
partitions and UBI/UBIFS is only used on some partitions. Because the
system is reusing a legacy bootloader, other MTD partitions are used as
raw MTD areas, or as UBI containing static cramfs volumes.

The system is derived from the BSP provided by my IC vendor, based on
linux-2.6.32 with android patches, upon which were added various
bugfixes and additional features, as well as the UBI and UBIFS bugfixes
from the ubifs-v2.6.32 repository.

The most common corruption I observe is that LEB 1 & 2, containing the
master nodes, are not synchronized anymore: one of the LEBs contains
many additional versions of the master node, just as if the other LEB
had been recovered from the past. I can see that by analyzing the
contents of the LEB from the beginning, as the only difference for each
written node in the beginning of the erase block is the sequence number
and the crc.  Thus it does not look like the shorter LEB has been
corrupted, only cut short. Unfortunatly, due to the difficulty of
reproducing the issue, I do not have any trace of what happened that led
to this. I only get the information from the fact that the kernel
refuses to mount the file system.

Have you ever encountered this kind of issue before ?
Do you have an idea of what could be happenning that triggers this
problem ?

If you could provide any help on this issue, I'd be glad to accept it.

Regards,
-- 
Romain Izard
