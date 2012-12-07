Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Th4Cr-0000hv-5Q
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2012 20:07:34 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: nand/docg4: fix and improve read of factory bbt
Date: Fri,  7 Dec 2012 12:07:23 -0800
Message-Id: <1354910843-5598-4-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
References: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch does two things related to reading the factory badblock table during
initialization: (1) fix error where a non-zero return code from
docg4_read_page() is assumed to be an error (it was later changed to be
max_bitflips; thanks to Brian Norris for bringing this to my attention a while
back), and (2) if there is an error reading the factory bbt, it tries reading
another (redundant) factory bbt table.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/docg4.c |   24 +++++++++++++++++++-----
 1 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 04e5fa9..18fa448 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -212,6 +212,7 @@ struct docg4_priv {
 #define DOCG4_T                4   /* BCH alg corrects up to 4 bit errors */
 
 #define DOCG4_FACTORY_BBT_PAGE 16 /* page where read-only factory bbt lives */
+#define DOCG4_REDUNDANT_BBT_PAGE 24 /* page where redundant factory bbt lives */
 
 /*
  * Bytes 0, 1 are used as badblock marker.
@@ -1020,16 +1021,15 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 	struct docg4_priv *doc = nand->priv;
 	uint32_t g4_addr = mtd_to_docg4_address(DOCG4_FACTORY_BBT_PAGE, 0);
 	uint8_t *buf;
-	int i, block, status;
+	int i, block;
+	__u32 eccfailed_stats = mtd->ecc_stats.failed;
 
 	buf = kzalloc(DOCG4_PAGE_SIZE, GFP_KERNEL);
 	if (buf == NULL)
 		return -ENOMEM;
 
 	read_page_prologue(mtd, g4_addr);
-	status = docg4_read_page(mtd, nand, buf, 0, DOCG4_FACTORY_BBT_PAGE);
-	if (status)
-		goto exit;
+	docg4_read_page(mtd, nand, buf, 0, DOCG4_FACTORY_BBT_PAGE);
 
 	/*
 	 * If no memory-based bbt was created, exit.  This will happen if module
@@ -1041,6 +1041,20 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 	if (nand->bbt == NULL)  /* no memory-based bbt */
 		goto exit;
 
+	if (mtd->ecc_stats.failed > eccfailed_stats) {
+		/*
+		 * Whoops, an ecc failure ocurred reading the factory bbt.
+		 * It is stored redundantly, so we get another chance.
+		 */
+		eccfailed_stats = mtd->ecc_stats.failed;
+		docg4_read_page(mtd, nand, buf, 0, DOCG4_REDUNDANT_BBT_PAGE);
+		if (mtd->ecc_stats.failed > eccfailed_stats) {
+			dev_warn(doc->dev,
+				 "The factory bbt could not be read!\n");
+			goto exit;
+		}
+	}
+
 	/*
 	 * Parse factory bbt and update memory-based bbt.  Factory bbt format is
 	 * simple: one bit per block, block numbers increase left to right (msb
@@ -1060,7 +1074,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 	}
  exit:
 	kfree(buf);
-	return status;
+	return 0;
 }
 
 static int docg4_block_markbad(struct mtd_info *mtd, loff_t ofs)
-- 
1.7.8.6
