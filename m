Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxdIq-0004xg-Nq
	for linux-mtd@lists.infradead.org; Tue, 13 Oct 2009 09:04:26 +0000
Subject: NAND: Add flags to the probe calls to control scan behaviour
Message-Id: <20091013090019.091262272@fluff.org.uk>
From: Ben Dooks <ben@simtec.co.uk>
To: linux-mtd@lists.infradead.org
Content-Disposition: inline; filename=nand-update-probe2.patch
Date: Tue, 13 Oct 2009 10:00:19 +0100
Cc: Simtec Linux Team <linux@simtec.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a flags field to the two scan calls to control the behaviour of the
scan process. Currently the only flag we define is NAND_PROBE_SPECULATIVE
to stop the user-worrying messages 'No NAND device found!!!'. This message
often worries users (was three exclamation marks really necessary?) and is
even worse in systems such as the Simtec Osiris where there may be optional
NAND devices which are not known until probe time.

The approach is to change nand_scan_ident and nand_scan to have a new flags
field, and add wrapper functions to the header files so that we do not have
to get around all the drivers doing a search and replace. If we where to
change all the call sites for nand_scan() and nand_scan_ident() we would
touch about 40 drivers.

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

---
 drivers/mtd/nand/nand_base.c |   18 ++++++++++--------
 include/linux/mtd/nand.h     |   32 ++++++++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 10 deletions(-)

Index: b/drivers/mtd/nand/nand_base.c
===================================================================
--- a/drivers/mtd/nand/nand_base.c	2009-10-12 19:12:56.000000000 +0100
+++ b/drivers/mtd/nand/nand_base.c	2009-10-12 19:23:41.000000000 +0100
@@ -2615,7 +2615,7 @@ static struct nand_flash_dev *nand_get_f
 }
 
 /**
- * nand_scan_ident - [NAND Interface] Scan for the NAND device
+ * nand_scan_ident_flags - [NAND Interface] Scan for the NAND device
  * @mtd:	     MTD device structure
  * @maxchips:	     Number of chips to scan for
  *
@@ -2624,7 +2624,7 @@ static struct nand_flash_dev *nand_get_f
  *
  * The mtd->owner field must be set to the module of the caller.
  */
-int nand_scan_ident(struct mtd_info *mtd, int maxchips)
+int nand_scan_ident_flags(struct mtd_info *mtd, int maxchips, unsigned flags)
 {
 	int i, busw, nand_maf_id;
 	struct nand_chip *chip = mtd->priv;
@@ -2639,7 +2639,8 @@ int nand_scan_ident(struct mtd_info *mtd
 	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id);
 
 	if (IS_ERR(type)) {
-		printk(KERN_WARNING "No NAND device found!!!\n");
+		if (!(flags & NAND_PROBE_SPECULATIVE))
+			printk(KERN_WARNING "No NAND device found!!!\n");
 		chip->select_chip(mtd, -1);
 		return PTR_ERR(type);
 	}
@@ -2903,9 +2904,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 #endif
 
 /**
- * nand_scan - [NAND Interface] Scan for the NAND device
+ * nand_scan_flags - [NAND Interface] Scan for the NAND device
  * @mtd:	MTD device structure
  * @maxchips:	Number of chips to scan for
+ * @flags:	The flags to pass to nand_scan_ident_flags().
  *
  * This fills out all the uninitialized function pointers
  * with the defaults.
@@ -2914,7 +2916,7 @@ int nand_scan_tail(struct mtd_info *mtd)
  * The mtd->owner field must be set to the module of the caller
  *
  */
-int nand_scan(struct mtd_info *mtd, int maxchips)
+int nand_scan_flags(struct mtd_info *mtd, int maxchips, unsigned flags)
 {
 	int ret;
 
@@ -2925,7 +2927,7 @@ int nand_scan(struct mtd_info *mtd, int 
 		BUG();
 	}
 
-	ret = nand_scan_ident(mtd, maxchips);
+	ret = nand_scan_ident_flags(mtd, maxchips, flags);
 	if (!ret)
 		ret = nand_scan_tail(mtd);
 	return ret;
@@ -2952,8 +2954,8 @@ void nand_release(struct mtd_info *mtd)
 		kfree(chip->buffers);
 }
 
-EXPORT_SYMBOL_GPL(nand_scan);
-EXPORT_SYMBOL_GPL(nand_scan_ident);
+EXPORT_SYMBOL_GPL(nand_scan_flags);
+EXPORT_SYMBOL_GPL(nand_scan_ident_flags);
 EXPORT_SYMBOL_GPL(nand_scan_tail);
 EXPORT_SYMBOL_GPL(nand_release);
 
Index: b/include/linux/mtd/nand.h
===================================================================
--- a/include/linux/mtd/nand.h	2009-10-12 19:13:45.000000000 +0100
+++ b/include/linux/mtd/nand.h	2009-10-12 19:23:14.000000000 +0100
@@ -22,14 +22,42 @@
 #include <linux/spinlock.h>
 #include <linux/mtd/mtd.h>
 
+/* probe is only looking for the possibility of a chip, do not print
+ * authorative errors, etc. */
+#define NAND_PROBE_SPECULATIVE (1 << 0)
+
 struct mtd_info;
 /* Scan and identify a NAND device */
-extern int nand_scan (struct mtd_info *mtd, int max_chips);
+extern int nand_scan_flags(struct mtd_info *mtd, int max_chips, unsigned flags);
 /* Separate phases of nand_scan(), allowing board driver to intervene
  * and override command or ECC setup according to flash type */
-extern int nand_scan_ident(struct mtd_info *mtd, int max_chips);
+extern int nand_scan_ident_flags(struct mtd_info *mtd, int max_chips, unsigned flags);
 extern int nand_scan_tail(struct mtd_info *mtd);
 
+/**
+ * nand_scan - [NAND Interface] Scan for the NAND device
+ * @mtd:	MTD device structure
+ * @maxchips:	Number of chips to scan for
+ *
+ * Wrapper for nand_scan_flags() with flags set to zero (nothing).
+ */
+static inline int nand_scan(struct mtd_info *mtd, int max_chips)
+{
+	return nand_scan_flags(mtd, max_chips, 0);
+}
+
+/**
+ * nand_scan_ident - [NAND Interface] Scan for the NAND device
+ * @mtd:	     MTD device structure
+ * @maxchips:	     Number of chips to scan for
+ *
+ * Wrapper for nand_scan_ident_flags() with flags set to zero (nothing).
+ */
+static inline int nand_scan_ident(struct mtd_info *mtd, int maxchips)
+{
+	return nand_scan_ident_flags(mtd, maxchips, 0);
+}
+
 /* Free resources held by the NAND device */
 extern void nand_release (struct mtd_info *mtd);
 

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
