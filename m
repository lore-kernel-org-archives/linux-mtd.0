Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17k3Et-0003xY-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2002 14:52:07 +0100
Received: from henrik.marasystems.com (henrik.marasystems.com [192.168.1.53])
	by filer.marasystems.com (8.11.6/8.11.6) with ESMTP id g7SDq7h14806
	for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2002 15:52:07 +0200
Content-Type: text/plain;
  charset="us-ascii"
From: Henrik Nordstrom <hno@marasystems.com>
To: linux-mtd@lists.infradead.org
Subject: DOC2000, Linux-2.4.18
Date: Wed, 28 Aug 2002 15:52:05 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208281552.05987.hno@marasystems.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi.

I am trying to get some grips on how to access a DOC2000 from Linux, but I do 
not have much luck..

The chip gets detected properly by the driver and I can access the flash as a 
char device, but NFTL does not like what it sees

DiskOnChip 2000 found at address 0xD6000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
3 flash chips found. Total DiskOnChip size: 24 MiB

NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
Sorry, we don't support UnitSizeFactor of != 1 yet.
Could not find valid boot record
Could not mount NFTL device


Same thing for the DOC patch to GRUB.



I found in the CVS tree that there is some pending fixes related to this in 
the kernel sources (but not the GRUB patch), but when I try to upgrade the 
kernel with the mtd CVS sources then it cannot compile, failing on 
recalc_sigpending IIRC.  (RedHat-7.3 system). Unfortunately I have lost the 
exact compiler error message. Can recreate it if there is need to..

Regards
Henrik
