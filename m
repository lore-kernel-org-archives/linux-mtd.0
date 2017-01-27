Received: from mail4.hitachi.co.jp ([133.145.228.5])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWvTZ-0006M0-2t
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2017 01:37:19 +0000
Received: from mlsw1.hitachi.co.jp (unknown [133.144.234.166])
 by mail4.hitachi.co.jp (Postfix) with ESMTP id B5B032CF4C2
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2017 10:36:48 +0900 (JST)
Received: from vshuts02.hitachi.co.jp (vshuts02.hitachi.co.jp [10.201.6.84])
 by mfilter2.hitachi.co.jp (Switch-3.3.4/Switch-3.3.4) with ESMTP id
 v0R1alkI007740
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2017 10:36:48 +0900
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
To: linux-mtd@lists.infradead.org
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
Subject: [PATCH] mtd: Fix typo: "occured" -> "occurred"
Date: Fri, 27 Jan 2017 10:36:38 +0900
Message-Id: <1485480998-5292-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trivial typo fix in comment.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
---
 drivers/mtd/mtdchar.c         | 2 +-
 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index ce5ccc573a9c..3568294d4854 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -451,7 +451,7 @@ static int mtdchar_readoob(struct file *file, struct mtd_info *mtd,
 	 * data. For our userspace tools it is important to dump areas
 	 * with ECC errors!
 	 * For kernel internal usage it also might return -EUCLEAN
-	 * to signal the caller that a bitflip has occured and has
+	 * to signal the caller that a bitflip has occurred and has
 	 * been corrected by the ECC algorithm.
 	 *
 	 * Note: currently the standard NAND function, nand_read_oob_std,
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a2a6922e356f..5fb144bdeca6 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -122,7 +122,7 @@ static int read_fsr(struct spi_nor *nor)
 /*
  * Read configuration register, returning its value in the
  * location. Return the configuration register value.
- * Returns negative if error occured.
+ * Returns negative if error occurred.
  */
 static int read_cr(struct spi_nor *nor)
 {
@@ -1237,7 +1237,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
  * Write status Register and configuration register with 2 bytes
  * The first byte will be written to the status register, while the
  * second byte will be written to the configuration register.
- * Return negative if error occured.
+ * Return negative if error occurred.
  */
 static int write_sr_cr(struct spi_nor *nor, u16 val)
 {
-- 
2.11.0
