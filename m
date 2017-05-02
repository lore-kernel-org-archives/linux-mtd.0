Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5LJo-0001uG-QE
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 00:05:31 +0000
Received: by mail-pf0-x241.google.com with SMTP id o68so10653546pfj.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 17:05:08 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] mtd: nand: free vendor-specific resources in init failure
 paths
Date: Mon,  1 May 2017 17:04:53 -0700
Message-Id: <20170502000455.13240-4-computersforpeace@gmail.com>
In-Reply-To: <20170502000455.13240-1-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we fail any time after calling nand_detect(), then we don't call the
vendor-specific ->cleanup() callback, and we'll leak any resources the
vendor-specific code might have allocated.

Mark the "fix" against the first commit that started allocating anything
in ->init().

Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Fixes: 626994e07480 ("mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs")
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Compile tested only

 drivers/mtd/nand/nand_base.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2adcc8cdedf1..978242b1213f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4300,7 +4300,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	/* Initialize the ->data_interface field. */
 	ret = nand_init_data_interface(chip);
 	if (ret)
-		return ret;
+		goto err_nand_init;
 
 	/*
 	 * Setup the data interface correctly on the chip and controller side.
@@ -4312,7 +4312,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	 */
 	ret = nand_setup_data_interface(chip);
 	if (ret)
-		return ret;
+		goto err_nand_init;
 
 	nand_maf_id = chip->id.data[0];
 	nand_dev_id = chip->id.data[1];
@@ -4343,6 +4343,12 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	mtd->size = i * chip->chipsize;
 
 	return 0;
+
+err_nand_init:
+	/* Free manufacturer priv data. */
+	nand_manufacturer_cleanup(chip);
+
+	return ret;
 }
 EXPORT_SYMBOL(nand_scan_ident);
 
@@ -4513,18 +4519,23 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
 	if (WARN_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
-		   !(chip->bbt_options & NAND_BBT_USE_FLASH)))
-		return -EINVAL;
+		   !(chip->bbt_options & NAND_BBT_USE_FLASH))) {
+		ret = -EINVAL;
+		goto err_ident;
+	}
 
 	if (invalid_ecc_page_accessors(chip)) {
 		pr_err("Invalid ECC page accessors setup\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_ident;
 	}
 
 	if (!(chip->options & NAND_OWN_BUFFERS)) {
 		nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
-		if (!nbuf)
-			return -ENOMEM;
+		if (!nbuf) {
+			ret = -ENOMEM;
+			goto err_ident;
+		}
 
 		nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
 		if (!nbuf->ecccalc) {
@@ -4547,8 +4558,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 		chip->buffers = nbuf;
 	} else {
-		if (!chip->buffers)
-			return -ENOMEM;
+		if (!chip->buffers) {
+			ret = -ENOMEM;
+			goto err_ident;
+		}
 	}
 
 	/* Set the internal oob buffer location, just after the page data */
@@ -4789,6 +4802,13 @@ int nand_scan_tail(struct mtd_info *mtd)
 		kfree(nbuf->ecccalc);
 		kfree(nbuf);
 	}
+
+err_ident:
+	/* Clean up nand_scan_ident(). */
+
+	/* Free manufacturer priv data. */
+	nand_manufacturer_cleanup(chip);
+
 	return ret;
 }
 EXPORT_SYMBOL(nand_scan_tail);
-- 
2.13.0.rc1.294.g07d810a77f-goog
