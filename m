Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLdD5-0006z5-Iq
	for linux-mtd@lists.infradead.org; Thu, 06 May 2004 08:22:24 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i467Rbc23861
	for <linux-mtd@lists.infradead.org>;
	Thu, 6 May 2004 10:27:37 +0300 (EEST)
Message-ID: <4099E4DC.6030401@intracom.gr>
Date: Thu, 06 May 2004 10:10:20 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
   Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Content-Type: multipart/mixed;
 boundary="------------060109020808030909010706"
Subject: [PATCH] Various fixes for NAND.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060109020808030909010706
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello

The following patch does two things.

1. Adds an erase_shift member to the nand_chip structure
   so that we can avoid multiplications and divisions.

2. Makes the autoob the default oobinfo so that when no access
   from user space is made to fill it, it doesn't default to no ECC.

Regards

Pantelis

--------------060109020808030909010706
Content-Type: text/x-patch;
 name="various.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="various.diff"

diff -ruN mtd-original/drivers/mtd/mtdpart.c mtd-work/drivers/mtd/mtdpart.c
--- mtd-original/drivers/mtd/mtdpart.c	2004-03-30 01:00:17.000000000 +0300
+++ mtd-work/drivers/mtd/mtdpart.c	2004-05-06 10:00:40.449248560 +0300
@@ -485,6 +485,9 @@
 				parts[i].name);
 		}
 
+		/* copy oobinfo from master */ 
+		memcpy(&slave->mtd.oobinfo, &master->oobinfo, sizeof(slave->mtd.oobinfo));
+
 		if(parts[i].mtdp)
 		{	/* store the object pointer (caller may or may not register it */
 			*parts[i].mtdp = &slave->mtd;
diff -ruN mtd-original/drivers/mtd/nand/nand.c mtd-work/drivers/mtd/nand/nand.c
--- mtd-original/drivers/mtd/nand/nand.c	2004-05-05 01:00:35.000000000 +0300
+++ mtd-work/drivers/mtd/nand/nand.c	2004-05-06 10:01:55.231879872 +0300
@@ -1163,7 +1163,7 @@
 	/* Check, if the buffer must be filled with ff again */
 	if (this->oobdirty) {	
 		memset (this->oob_buf, 0xff, 
-			mtd->oobsize * (mtd->erasesize / mtd->oobblock));
+			mtd->oobsize << (this->erase_shift - this->page_shift));
 		this->oobdirty = 0;
 	}	
 	
@@ -1671,7 +1671,7 @@
 	chipnr = (int)((unsigned long)instr->addr / this->chipsize);
 
 	/* Calculate pages in each block */
-	pages_per_block = mtd->erasesize / mtd->oobblock;
+	pages_per_block = 1 << (this->erase_shift - this->page_shift);
 
 	/* Select the NAND device */
 	this->select_chip(mtd, chipnr);
@@ -1941,6 +1941,7 @@
 		
 		/* Calculate the address shift from the page size */	
 		this->page_shift = ffs(mtd->oobblock) - 1;
+		this->erase_shift = ffs(mtd->erasesize) - 1;
 
 		/* Set the bad block position */
 		this->badblockpos = mtd->oobblock > 512 ? 
@@ -1994,7 +1995,7 @@
 	/* Convert chipsize to number of pages per chip -1. */
 	this->pagemask = (this->chipsize >> this->page_shift) - 1;
 	/* Preset the internal oob buffer */
-	memset(this->oob_buf, 0xff, mtd->oobsize * (mtd->erasesize / mtd->oobblock));	
+	memset(this->oob_buf, 0xff, mtd->oobsize << (this->erase_shift - this->page_shift));
 
 	/* If no default placement scheme is given, select an
 	 * appropriate one */
@@ -2120,6 +2121,10 @@
 	mtd->resume = NULL;
 	mtd->block_isbad = nand_block_isbad;
 	mtd->block_markbad = nand_block_markbad;
+
+	/* and make the autooob the default one */
+	memcpy(&mtd->oobinfo, this->autooob, sizeof(mtd->oobinfo));
+
 	mtd->owner = THIS_MODULE;
 
 	/* Return happy */
diff -ruN mtd-original/include/linux/mtd/nand.h mtd-work/include/linux/mtd/nand.h
--- mtd-original/include/linux/mtd/nand.h	2004-04-17 01:00:05.000000000 +0300
+++ mtd-work/include/linux/mtd/nand.h	2004-05-06 09:59:30.404896920 +0300
@@ -235,6 +235,7 @@
 	wait_queue_head_t wq;
 	nand_state_t 	state;
 	int 		page_shift;
+	int		erase_shift;
 	u_char 		*data_buf;
 	u_char		*oob_buf;
 	int		oobdirty;

--------------060109020808030909010706
Content-Type: text/plain;
 name="various.diffstat"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="various.diffstat"

 drivers/mtd/mtdpart.c    |    3 +++
 drivers/mtd/nand/nand.c  |   11 ++++++++---
 include/linux/mtd/nand.h |    1 +
 3 files changed, 12 insertions(+), 3 deletions(-)

--------------060109020808030909010706--
