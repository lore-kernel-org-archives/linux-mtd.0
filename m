Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3bCB-0006Q2-1E
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2005 11:11:45 -0400
Date: Fri, 12 Aug 2005 19:11:46 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: tglx@linutronix.de
Message-Id: <20050812191146.2e38ed1c.vwool@ru.mvista.com>
In-Reply-To: <1123772959.23647.24.camel@tglx.tec.linutronix.de>
References: <42FB5E72.2010402@ru.mvista.com>
	<1123772959.23647.24.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: power management routines for NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,
please find the patch below.

Best regards,
   Vitaly

P. S. Is it reasonable to send the use case (i. e. the NAND driver I'm working at that uses the simple framework introduced)?

File: nand-pm.patch
Type: Enhancement
Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>
Description:

	Add LDM-compliant power management support for NAND flashes.

Index: linux-2.6.10/include/linux/mtd/nand.h
===================================================================
--- linux-2.6.10.orig/include/linux/mtd/nand.h
+++ linux-2.6.10/include/linux/mtd/nand.h
@@ -244,6 +244,7 @@
 	FL_ERASING,
 	FL_SYNCING,
 	FL_CACHEDPRG,
+	FL_PM_SUSPENDED,
 } nand_state_t;
 
 /* Keep gcc happy */
Index: linux-2.6.10/drivers/mtd/nand/nand_base.c
===================================================================
--- linux-2.6.10.orig/drivers/mtd/nand/nand_base.c
+++ linux-2.6.10/drivers/mtd/nand/nand_base.c
@@ -46,6 +46,8 @@
  *		perform extra error status checks on erase and write failures.  This required
  *		adding a wrapper function for nand_read_ecc.
  *
+ * 08-20-2005	vwool: suspend/resume added
+ *
  * Credits:
  *	David Woodhouse for adding multichip support  
  *	
@@ -2284,6 +2286,45 @@
 }
 
 /**
+ * nand_suspend - [MTD Interface] Suspend the NAND flash
+ * @mtd:	MTD device structure
+ */
+static int nand_suspend(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+	int ret = 0;
+
+	switch(this->state) {
+		case FL_READY:
+			nand_get_device (this, mtd, FL_PM_SUSPENDED);
+		case FL_PM_SUSPENDED:
+			break;
+
+		default:
+			ret = -EAGAIN;
+			break;
+	}
+	return ret;
+}
+
+/**
+ * nand_resume - [MTD Interface] Resume the NAND flash
+ * @mtd:	MTD device structure
+ */
+static void nand_resume(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+
+	if (this->state == FL_PM_SUSPENDED)
+		nand_release_device(mtd);
+	else
+		printk(KERN_ERR "resume() called for the chip which is not "
+				"in suspended state\n");
+
+}
+
+
+/**
  * nand_scan - [NAND Interface] Scan for the NAND device
  * @mtd:	MTD device structure
  * @maxchips:	Number of chips to scan for
@@ -2642,8 +2683,8 @@
 	mtd->sync = nand_sync;
 	mtd->lock = NULL;
 	mtd->unlock = NULL;
-	mtd->suspend = NULL;
-	mtd->resume = NULL;
+	mtd->suspend = nand_suspend;
+	mtd->resume = nand_resume;
 	mtd->block_isbad = nand_block_isbad;
 	mtd->block_markbad = nand_block_markbad;
 
