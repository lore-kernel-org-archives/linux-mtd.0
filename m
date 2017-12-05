Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eM8th-000443-BK
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 08:48:15 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 2/3] mtd: nand: remove unused NAND_OWN_BUFFERS flag
Date: Tue,  5 Dec 2017 17:47:15 +0900
Message-Id: <1512463636-28934-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1512463636-28934-1-git-send-email-yamada.masahiro@socionext.com>
References: <1512463636-28934-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The last/only user of NAND_OWN_BUFFERS (cafe_nand.c) has been reworked.
This flag is no longer needed.

Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/nand_base.c | 45 ++++++++++++++++++++------------------------
 include/linux/mtd/rawnand.h  |  5 -----
 2 files changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6135d00..0cc61b1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4646,35 +4646,30 @@ int nand_scan_tail(struct mtd_info *mtd)
 		return -EINVAL;
 	}
 
-	if (!(chip->options & NAND_OWN_BUFFERS)) {
-		nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
-		if (!nbuf)
-			return -ENOMEM;
-
-		nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
-		if (!nbuf->ecccalc) {
-			ret = -ENOMEM;
-			goto err_free_nbuf;
-		}
+	nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
+	if (!nbuf)
+		return -ENOMEM;
 
-		nbuf->ecccode = kmalloc(mtd->oobsize, GFP_KERNEL);
-		if (!nbuf->ecccode) {
-			ret = -ENOMEM;
-			goto err_free_nbuf;
-		}
+	nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
+	if (!nbuf->ecccalc) {
+		ret = -ENOMEM;
+		goto err_free_nbuf;
+	}
 
-		nbuf->databuf = kmalloc(mtd->writesize + mtd->oobsize,
-					GFP_KERNEL);
-		if (!nbuf->databuf) {
-			ret = -ENOMEM;
-			goto err_free_nbuf;
-		}
+	nbuf->ecccode = kmalloc(mtd->oobsize, GFP_KERNEL);
+	if (!nbuf->ecccode) {
+		ret = -ENOMEM;
+		goto err_free_nbuf;
+	}
 
-		chip->buffers = nbuf;
-	} else if (!chip->buffers) {
-		return -ENOMEM;
+	nbuf->databuf = kmalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
+	if (!nbuf->databuf) {
+		ret = -ENOMEM;
+		goto err_free_nbuf;
 	}
 
+	chip->buffers = nbuf;
+
 	/*
 	 * FIXME: some NAND manufacturer drivers expect the first die to be
 	 * selected when manufacturer->init() is called. They should be fixed
@@ -5032,7 +5027,7 @@ void nand_cleanup(struct nand_chip *chip)
 
 	/* Free bad block table memory */
 	kfree(chip->bbt);
-	if (!(chip->options & NAND_OWN_BUFFERS) && chip->buffers) {
+	if (chip->buffers) {
 		kfree(chip->buffers->databuf);
 		kfree(chip->buffers->ecccode);
 		kfree(chip->buffers->ecccalc);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 749bb08..5b24a8e 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -191,11 +191,6 @@ enum nand_ecc_algo {
 /* Non chip related options */
 /* This option skips the bbt scan during initialization. */
 #define NAND_SKIP_BBTSCAN	0x00010000
-/*
- * This option is defined if the board driver allocates its own buffers
- * (e.g. because it needs them DMA-coherent).
- */
-#define NAND_OWN_BUFFERS	0x00020000
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	0x00040000
 /*
-- 
2.7.4
