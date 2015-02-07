Received: from mail-qa0-f47.google.com ([209.85.216.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YK9Qg-0006Vi-DV
 for linux-mtd@lists.infradead.org; Sat, 07 Feb 2015 17:44:27 +0000
Received: by mail-qa0-f47.google.com with SMTP id n8so15570065qaq.6
 for <linux-mtd@lists.infradead.org>; Sat, 07 Feb 2015 09:44:03 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [RFC/PATCH] mtd: nand: Move the BBT interface to the BBM header
Date: Sat,  7 Feb 2015 14:41:44 -0300
Message-Id: <1423330904-20029-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to have a clear separatation between the NAND core and
the NAND Bad Block Management, let's move the NAND BBT interface
to the bbm.h header.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/diskonchip.c | 1 +
 drivers/mtd/nand/nand_base.c  | 1 +
 include/linux/mtd/bbm.h       | 7 +++++++
 include/linux/mtd/nand.h      | 7 -------
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index f68a7bc..1693d8d 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -27,6 +27,7 @@
 #include <asm/io.h>
 
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/bbm.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/doc2000.h>
 #include <linux/mtd/partitions.h>
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f6af969..c0c9772 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -40,6 +40,7 @@
 #include <linux/mm.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/bbm.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/nand_bch.h>
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 36bb6a5..4ad7d35 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -165,6 +165,13 @@ struct bbm_info {
 	void *priv;
 };
 
+/* NAND BBT interface */
+extern int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
+extern int nand_default_bbt(struct mtd_info *mtd);
+extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
+extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
+extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
+
 /* OneNAND BBT interface */
 extern int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
 extern int onenand_default_bbt(struct mtd_info *mtd);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3d4ea7e..fdc8b57 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -833,15 +833,8 @@ struct nand_manufacturers {
 extern struct nand_flash_dev nand_flash_ids[];
 extern struct nand_manufacturers nand_manuf_ids[];
 
-extern int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
-extern int nand_default_bbt(struct mtd_info *mtd);
-extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
-extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
 extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 			   int allowbbt);
-extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, uint8_t *buf);
 
 /**
  * struct platform_nand_chip - chip level device structure
-- 
2.2.1
