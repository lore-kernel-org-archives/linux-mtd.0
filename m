Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CpYMR-0004Bu-Aj
	for linux-mtd@lists.infradead.org; Fri, 14 Jan 2005 15:48:01 -0500
Message-ID: <41E82FE1.7040701@redhat.com>
Date: Fri, 14 Jan 2005 14:47:29 -0600
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41E59642.2040508@redhat.com>	<1105606708.3116.20.camel@lap02.tec.linutronix.de>
	<41E646B4.2000101@redhat.com>
In-Reply-To: <41E646B4.2000101@redhat.com>
Content-Type: multipart/mixed; boundary="------------030906060605090901060203"
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: AG-AND requested changes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030906060605090901060203
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Updated patch attached.


d.marlin
=========


David A. Marlin wrote:
> 
> Thomas Gleixner wrote:
> 
>> 1) . . .  Please do not
>> make it dependent on NAND_IS_AND, invent a new option like
>> BBT_AUTO_REFRESH or what ever nice symbol you imagine.
> 
> Will do.
> 
>> 2) . . .
>> Looks sane. You call this from the board driver I guess ?
> 
> Yes, I call it from the driver's init routine, after performing nand_scan.
> 
> I'll update the code and post a revised patch.
> 
> 
> Thank you,
> 
> d.marlin

--------------030906060605090901060203
Content-Type: text/plain;
 name="ag-and-03.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ag-and-03.patch"

Index: include/linux/mtd/nand.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/nand.h,v
retrieving revision 1.68
diff -u -r1.68 nand.h
--- include/linux/mtd/nand.h	12 Nov 2004 10:40:37 -0000	1.68
+++ include/linux/mtd/nand.h	14 Jan 2005 20:30:31 -0000
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
@@ -170,6 +189,10 @@
 /* Chip has a array of 4 pages which can be read without
  * additional ready /busy waits */
 #define NAND_4PAGE_ARRAY	0x00000040 
+/* Chip requires that BBT is periodically rewritten to prevent
+ * bits from adjacent blocks from 'leaking' and altering data.
+ * This happens with the Renesas AG-AND chips, possibly others.  */
+#define BBT_AUTO_REFRESH	0x00000080
 
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS \
Index: drivers/mtd/nand/nand_ids.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_ids.c,v
retrieving revision 1.10
diff -u -r1.10 nand_ids.c
--- drivers/mtd/nand/nand_ids.c	26 May 2004 13:40:12 -0000	1.10
+++ drivers/mtd/nand/nand_ids.c	14 Jan 2005 20:30:39 -0000
@@ -103,7 +103,7 @@
 	 * Anyway JFFS2 would increase the eraseblock size so we chose a combined one which can be erased in one go
 	 * There are more speed improvements for reads and writes possible, but not implemented now 
 	 */
-	{"AND 128MiB 3,3V 8-bit",	0x01, 2048, 128, 0x4000, NAND_IS_AND | NAND_NO_AUTOINCR | NAND_4PAGE_ARRAY},
+	{"AND 128MiB 3,3V 8-bit",	0x01, 2048, 128, 0x4000, NAND_IS_AND | NAND_NO_AUTOINCR | NAND_4PAGE_ARRAY | BBT_AUTO_REFRESH},
 
 	{NULL,}
 };
Index: drivers/mtd/nand/nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.126
diff -u -r1.126 nand_base.c
--- drivers/mtd/nand/nand_base.c	13 Dec 2004 11:22:25 -0000	1.126
+++ drivers/mtd/nand/nand_base.c	14 Jan 2005 20:30:49 -0000
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
+	int rewrite_bbt[NAND_MAX_CHIPS]={0};	/* flags to indicate the page, if bbt needs to be rewritten. */
+	unsigned int bbt_masked_page;		/* bbt mask to compare to page being erased. */
+						/* It is used to see if the current page is in the same */
+						/*   256 block group and the same bank as the bbt. */
 
 	DEBUG (MTD_DEBUG_LEVEL3,
 	       "nand_erase: start = 0x%08x, len = %i\n", (unsigned int) instr->addr, (unsigned int) instr->len);
@@ -2044,6 +2074,13 @@
 		goto erase_exit;
 	}
 
+	/* if BBT requires refresh, set the BBT page mask to see if the BBT should be rewritten */
+	if (this->options & BBT_AUTO_REFRESH) {
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
+		/* if BBT requires refresh, set the BBT rewrite flag to the page being erased */
+		if (this->options & BBT_AUTO_REFRESH) {
+			if (((page & BBT_PAGE_MASK) == bbt_masked_page) && 
+			     (page != this->bbt_td->pages[chipnr])) {
+				rewrite_bbt[chipnr] = (page << this->page_shift);
+			}
+		}
 		
 		/* Increment page address and decrement length */
 		len -= (1 << this->phys_erase_shift);
@@ -2083,6 +2128,13 @@
 			chipnr++;
 			this->select_chip(mtd, -1);
 			this->select_chip(mtd, chipnr);
+
+			/* if BBT requires refresh and BBT-PERCHIP, 
+			 *   set the BBT page mask to see if this BBT should be rewritten */
+			if ((this->options & BBT_AUTO_REFRESH) && (this->bbt_td->options & NAND_BBT_PERCHIP)) {
+				bbt_masked_page = this->bbt_td->pages[chipnr] & BBT_PAGE_MASK;
+			}
+
 		}
 	}
 	instr->state = MTD_ERASE_DONE;
@@ -2097,6 +2149,18 @@
 	/* Deselect and wake up anyone waiting on the device */
 	nand_release_device(mtd);
 
+	/* if BBT requires refresh and erase was successful, rewrite any selected bad block tables */
+	if ((this->options & BBT_AUTO_REFRESH) && (!ret)) {
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

--------------030906060605090901060203--
