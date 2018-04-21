Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9woj-0007sq-4M
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2018 18:01:00 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 01/11] mtd: rawnand: docg4: fix the probe function error
 path
Date: Sat, 21 Apr 2018 20:00:33 +0200
Message-Id: <20180421180043.18366-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180421180043.18366-1-miquel.raynal@bootlin.com>
References: <20180421180043.18366-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_release() should not be called on an MTD device that has not been
registered. While it should work thanks to the checks done in
mtd_device_unregister() it's a bad practice to cleanup/release
something that has not previously been initialized/allocated.

Rework the error path to follow this rule.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/docg4.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
index 1314aa99b9ab..bb96cb33cd6b 100644
--- a/drivers/mtd/nand/raw/docg4.c
+++ b/drivers/mtd/nand/raw/docg4.c
@@ -1341,7 +1341,7 @@ static int __init probe_docg4(struct platform_device *pdev)
 	nand = kzalloc(len, GFP_KERNEL);
 	if (nand == NULL) {
 		retval = -ENOMEM;
-		goto fail_unmap;
+		goto unmap;
 	}
 
 	mtd = nand_to_mtd(nand);
@@ -1357,7 +1357,7 @@ static int __init probe_docg4(struct platform_device *pdev)
 	doc->bch = init_bch(DOCG4_M, DOCG4_T, DOCG4_PRIMITIVE_POLY);
 	if (doc->bch == NULL) {
 		retval = -EINVAL;
-		goto fail;
+		goto free_nand;
 	}
 
 	platform_set_drvdata(pdev, doc);
@@ -1366,30 +1366,32 @@ static int __init probe_docg4(struct platform_device *pdev)
 	retval = read_id_reg(mtd);
 	if (retval == -ENODEV) {
 		dev_warn(dev, "No diskonchip G4 device found.\n");
-		goto fail;
+		goto free_bch;
 	}
 
 	retval = nand_scan_tail(mtd);
 	if (retval)
-		goto fail;
+		goto free_bch;
 
 	retval = read_factory_bbt(mtd);
 	if (retval)
-		goto fail;
+		goto cleanup_nand;
 
 	retval = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
 	if (retval)
-		goto fail;
+		goto cleanup_nand;
 
 	doc->mtd = mtd;
+
 	return 0;
 
-fail:
-	nand_release(mtd); /* deletes partitions and mtd devices */
+cleanup_nand:
+	nand_cleanup(nand);
+free_bch:
 	free_bch(doc->bch);
+free_nand:
 	kfree(nand);
-
-fail_unmap:
+unmap:
 	iounmap(virtadr);
 
 	return retval;
-- 
2.14.1
