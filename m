Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EEmKa-0000Kb-Gq
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2005 07:18:52 -0400
Date: Mon, 12 Sep 2005 15:12:44 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20050912151244.3e512086.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [PATCH] power management for NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,
the patch inlined below allows to suspend/resume NAND flash.
It's similar to what is implemented for NOR flashes in cfi_cmdset_0001.c/cfi_cmdset_0002.c.
It's based on 2.6.10 kernel but applies to the current CVS snapshot.

Best regards,
   Vitaly

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
@@ -153,7 +155,7 @@
 #define nand_verify_pages(...) (0)
 #endif
 		
-static void nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state);
+static int nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state);
 
 /**
  * nand_release_device - [GENERIC] release chip
@@ -755,7 +757,7 @@
  *
  * Get the device and lock it for exclusive access
  */
-static void nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
+static int nand_get_device (struct nand_chip *this, struct mtd_info *mtd, int new_state)
 {
 	struct nand_chip *active;
 	spinlock_t *lock;
@@ -778,7 +780,11 @@
 	if (active == this && this->state == FL_READY) {
 		this->state = new_state;
 		spin_unlock(lock);
-		return;
+		return 0;
+	}
+	if (new_state == FL_PM_SUSPENDED) {
+		spin_unlock(lock);
+		return (this->state == FL_PM_SUSPENDED) ? 0 : -EAGAIN;
 	}
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	add_wait_queue(wq, &wait);
@@ -2284,6 +2290,34 @@
 }
 
 /**
+ * nand_suspend - [MTD Interface] Suspend the NAND flash
+ * @mtd:	MTD device structure
+ */
+static int nand_suspend(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+
+	return nand_get_device (this, mtd, FL_PM_SUSPENDED);
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
@@ -2642,8 +2676,8 @@
 	mtd->sync = nand_sync;
 	mtd->lock = NULL;
 	mtd->unlock = NULL;
-	mtd->suspend = NULL;
-	mtd->resume = NULL;
+	mtd->suspend = nand_suspend;
+	mtd->resume = nand_resume;
 	mtd->block_isbad = nand_block_isbad;
 	mtd->block_markbad = nand_block_markbad;
 
