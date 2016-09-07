Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhbs2-0004pA-Mu
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 12:22:28 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 7/7] mtd: nand: remove unnecessary 'extern' from function
 declarations
Date: Wed,  7 Sep 2016 14:21:42 +0200
Message-Id: <1473250902-31139-8-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1473250902-31139-1-git-send-email-s.hauer@pengutronix.de>
References: <1473250902-31139-1-git-send-email-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

'extern' is not necessary for function declarations. To prevent
people from adding the keyword to new declarations remove the
existing ones.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 include/linux/mtd/nand.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9f3d7be..7989178 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -29,26 +29,26 @@ struct nand_flash_dev;
 struct device_node;
 
 /* Scan and identify a NAND device */
-extern int nand_scan(struct mtd_info *mtd, int max_chips);
+int nand_scan(struct mtd_info *mtd, int max_chips);
 /*
  * Separate phases of nand_scan(), allowing board driver to intervene
  * and override command or ECC setup according to flash type.
  */
-extern int nand_scan_ident(struct mtd_info *mtd, int max_chips,
+int nand_scan_ident(struct mtd_info *mtd, int max_chips,
 			   struct nand_flash_dev *table);
-extern int nand_scan_tail(struct mtd_info *mtd);
+int nand_scan_tail(struct mtd_info *mtd);
 
 /* Free resources held by the NAND device */
-extern void nand_release(struct mtd_info *mtd);
+void nand_release(struct mtd_info *mtd);
 
 /* Internal helper for board drivers which need to override command function */
-extern void nand_wait_ready(struct mtd_info *mtd);
+void nand_wait_ready(struct mtd_info *mtd);
 
 /* locks all blocks present in the device */
-extern int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
 /* unlocks specified locked blocks */
-extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8
@@ -1013,14 +1013,14 @@ struct nand_manufacturers {
 extern struct nand_flash_dev nand_flash_ids[];
 extern struct nand_manufacturers nand_manuf_ids[];
 
-extern int nand_default_bbt(struct mtd_info *mtd);
-extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
-extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
-extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
-			   int allowbbt);
-extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, uint8_t *buf);
+int nand_default_bbt(struct mtd_info *mtd);
+int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
+int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
+int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
+int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
+		    int allowbbt);
+int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
+		 size_t *retlen, uint8_t *buf);
 
 /**
  * struct platform_nand_chip - chip level device structure
-- 
2.8.1
