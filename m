Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Coq6m-0003JL-7l
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 16:32:54 -0500
Message-ID: <41E59642.2040508@redhat.com>
Date: Wed, 12 Jan 2005 15:27:30 -0600
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: multipart/mixed; boundary="------------070709000600090407070209"
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: AG-AND requested changes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070709000600090407070209
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Thomas:

I've been working on a couple of issues using the HN29V1G91T-30 (AG-AND) 
chips, and have a possible solution (patch attached).  The issues are:

1) if a block contains static data (not rewritten), but other blocks in 
the same 256 block group are rewritten many times, some of the bits in 
the static data may be flipped resulting in data loss.  I believe the 
wear leveling in JFFS2 will prevent this from occurring on the file 
system partition, but not for the Bad Block Table.

To address this, I have set up a 'mask' that will match other blocks in 
the same 256 block group as the Bad Block Table, and added code to 
rewrite the Bad Block Table when any of these blocks is erased.  This 
should ensure that the Bad Block Table is also rewritten periodically so 
as not to lose data.

2) according to the chip documentation, if power is suddenly removed 
during an erase operation, a 'device recovery' procedure must be 
performed when power is reapplied in order to ensure correct device 
operation.  This procedure involves applying a command sequence at a 
specific address.

To facilitate this, I have added some additional command definitions, 
and modified the nand_command_lp routine to use them.


Note: I have two additional comments regarding the proposed solutions.

1) The code changes use an array of bad block table addresses (one for 
each chip) in case the erase spans multiple chips and BBT per chip is 
used.  Based on my testing I don't think this ever occurs (at least for 
this device).  If we could assume that it would never occur, the code 
for this could be simplified (no array or loops required).

2) The command for 'device recovery' is a two cycle command, but the 
first command byte is 0x00 (same as for READ0).  Since the process 
requires that we can distinguish between a recovery and a read 
operation, I added a high order bit to the initial command (0x100) to 
make it unique and masked it off when actually sending the command. 
Please let me know if you have a more elegant (or acceptable) solution.


Thank you,

d.marlin


--------------070709000600090407070209
Content-Type: text/plain;
 name="ag-and-02.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ag-and-02.patch"

Index: include/linux/mtd/nand.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/nand.h,v
retrieving revision 1.68
diff -u -r1.68 nand.h
--- include/linux/mtd/nand.h	12 Nov 2004 10:40:37 -0000	1.68
+++ include/linux/mtd/nand.h	12 Jan 2005 19:46:13 -0000
@@ -115,6 +115,25 @@
 #define NAND_CMD_READSTART	0x30
 #define NAND_CMD_CACHEDPROG	0x15
 
+/* Extended commands for AG-AND device */
+/* 
+ * Note: the command for NAND_CMD_DEPLETE1 is really 0x00 but 
+ *       there is no way to distinguish that from NAND_CMD_READ0
+ *       until the remaining sequence of commands has been completed
+ *       so add a high order bit and mask it off in the command.
+ */
+#define NAND_CMD_DEPLETE1	0x100
+#define NAND_CMD_DEPLETE2	0x38
+#define NAND_CMD_STATUS_MULTI	0x71
+#define NAND_CMD_STATUS_ERROR	0x72
+/* multi-bank error status (banks 0-3) */
+#define NAND_CMD_STATUS_ERROR0	0x73
+#define NAND_CMD_STATUS_ERROR1	0x74
+#define NAND_CMD_STATUS_ERROR2	0x75
+#define NAND_CMD_STATUS_ERROR3	0x76
+#define NAND_CMD_STATUS_RESET	0x7f
+#define NAND_CMD_STATUS_CLEAR	0xff
+
 /* Status bits */
 #define NAND_STATUS_FAIL	0x01
 #define NAND_STATUS_FAIL_N1	0x02
Index: drivers/mtd/nand/nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.126
diff -u -r1.126 nand_base.c
--- drivers/mtd/nand/nand_base.c	13 Dec 2004 11:22:25 -0000	1.126
+++ drivers/mtd/nand/nand_base.c	12 Jan 2005 19:46:33 -0000
@@ -28,6 +28,20 @@
  *		among multiple independend devices. Suggestions and initial patch
  *		from Ben Dooks <ben-mtd@fluff.org>
  *
+ *  12-05-2004	dmarlin: add workaround for Renesas AG-AND chips "disturb" issue.
+ *		Basically, any block not rewritten may lose data when surrounding blocks
+ *		are rewritten many times.  JFFS2 ensures this doesn't happen for blocks 
+ *		it uses, but the Bad Block Table(s) may not be rewritten.  To ensure they
+ *		do not lose data, force them to be rewritten when some of the surrounding
+ *		blocks are erased.  Rather than tracking a specific nearby block (which 
+ *		could itself go bad), use a page address 'mask' to select several blocks 
+ *		in the same area, and rewrite the BBT when any of them are erased.
+ *
+ *  01-03-2005	dmarlin: added support for the device recovery command sequence for Renesas 
+ *		AG-AND chips.  If there was a sudden loss of power during an erase operation,
+ * 		a "device recovery" operation must be performed when power is restored
+ * 		to ensure correct operation.
+ *
  * Credits:
  *	David Woodhouse for adding multichip support  
  *	
@@ -41,7 +55,7 @@
  *	The AG-AND chips have nice features for speed improvement,
  *	which are not supported yet. Read / program 4 pages in one go.
  *
- * $Id: nand_base.c,v 1.126 2004/12/13 11:22:25 lavinen Exp $
+ * $Id: nand_base.c,v 1.126 2004/12/13 11:22:25 lavinen Exp $ 
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -619,7 +633,7 @@
 	/* Begin command latch cycle */
 	this->hwcontrol(mtd, NAND_CTL_SETCLE);
 	/* Write out the command to the device. */
-	this->write_byte(mtd, command);
+	this->write_byte(mtd, (command & 0xff));
 	/* End command latch cycle */
 	this->hwcontrol(mtd, NAND_CTL_CLRCLE);
 
@@ -647,8 +661,8 @@
 	
 	/* 
 	 * program and erase have their own busy handlers 
-	 * status and sequential in needs no delay
-	*/
+	 * status, sequential in, and deplete1 need no delay
+	 */
 	switch (command) {
 			
 	case NAND_CMD_CACHEDPROG:
@@ -657,8 +671,19 @@
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_STATUS:
+	case NAND_CMD_DEPLETE1:
 		return;
 
+	/* 
+	 * read error status commands require only a short delay
+	 */
+	case NAND_CMD_STATUS_ERROR:
+	case NAND_CMD_STATUS_ERROR0:
+	case NAND_CMD_STATUS_ERROR1:
+	case NAND_CMD_STATUS_ERROR2:
+	case NAND_CMD_STATUS_ERROR3:
+		udelay(10);
+		return;
 
 	case NAND_CMD_RESET:
 		if (this->dev_ready)	
@@ -1051,7 +1076,7 @@
 	}
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device (this, mtd ,FL_READING);
+	nand_get_device (this, mtd, FL_READING);
 
 	/* use userspace supplied oobinfo, if zero */
 	if (oobsel == NULL)
@@ -1987,6 +2012,7 @@
 	return nand_erase_nand (mtd, instr, 0);
 }
  
+#define BBT_PAGE_MASK	0xffffff3f
 /**
  * nand_erase_intern - [NAND Interface] erase block(s)
  * @mtd:	MTD device structure
@@ -1999,6 +2025,10 @@
 {
 	int page, len, status, pages_per_block, ret, chipnr;
 	struct nand_chip *this = mtd->priv;
+	int rewrite_bbt[NAND_MAX_CHIPS]={0};	/* flags to indicate the page, if bbt needs to be rewritten */
+	unsigned int bbt_masked_page;		/* bbt mask to compare to page being erased */
+						/* used to see if current page is in same 256 block */
+						/* group in the same bank as the bbt */
 
 	DEBUG (MTD_DEBUG_LEVEL3,
 	       "nand_erase: start = 0x%08x, len = %i\n", (unsigned int) instr->addr, (unsigned int) instr->len);
@@ -2044,6 +2074,13 @@
 		goto erase_exit;
 	}
 
+	/* if AG-AND, set the BBT page mask to see if the BBT should be rewritten */
+	if (this->options & NAND_IS_AND) {
+		bbt_masked_page = this->bbt_td->pages[chipnr] & BBT_PAGE_MASK;
+	} else {
+		bbt_masked_page = 0xffffffff;	/* should not match anything */
+	}
+
 	/* Loop through the pages */
 	len = instr->len;
 
@@ -2073,6 +2110,14 @@
 			instr->fail_addr = (page << this->page_shift);
 			goto erase_exit;
 		}
+
+		/* if AG-AND, set the BBT rewrite flag to the page being erased */
+		if (this->options & NAND_IS_AND) {
+			if (((page & BBT_PAGE_MASK) == bbt_masked_page) && 
+			     (page != this->bbt_td->pages[chipnr])) {
+				rewrite_bbt[chipnr] = (page << this->page_shift);
+			}
+		}
 		
 		/* Increment page address and decrement length */
 		len -= (1 << this->phys_erase_shift);
@@ -2083,6 +2128,12 @@
 			chipnr++;
 			this->select_chip(mtd, -1);
 			this->select_chip(mtd, chipnr);
+
+			/* if AG-AND and BBT-PERCHIP, set the BBT page mask to see if this BBT should be rewritten */
+			if ((this->options & NAND_IS_AND) && (this->bbt_td->options & NAND_BBT_PERCHIP)) {
+				bbt_masked_page = this->bbt_td->pages[chipnr] & BBT_PAGE_MASK;
+			}
+
 		}
 	}
 	instr->state = MTD_ERASE_DONE;
@@ -2097,6 +2148,17 @@
 	/* Deselect and wake up anyone waiting on the device */
 	nand_release_device(mtd);
 
+	if (!ret) {
+		for (chipnr = 0; chipnr < this->numchips; chipnr++) {
+			if (rewrite_bbt[chipnr]) {
+				/* update the BBT for chip */
+				DEBUG (MTD_DEBUG_LEVEL0, "nand_erase_nand: nand_update_bbt (%d:0x%0x 0x%0x)\n", 
+					chipnr, rewrite_bbt[chipnr], this->bbt_td->pages[chipnr]);
+				nand_update_bbt (mtd, rewrite_bbt[chipnr]);
+			}
+		}
+	}
+
 	/* Return more or less happy */
 	return ret;
 }

--------------070709000600090407070209--
