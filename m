Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8Up2-0008LC-Be
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 15:14:00 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Vitaly Wool <vitalywool@gmail.com>
Subject: [PATCH] mtd: nand: remove unused and buggy get_platform_nandchip()
 helper function
Date: Mon, 14 Dec 2015 16:13:31 +0100
Message-Id: <1450106011-25105-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nobody uses the get_platform_nandchip() helper function which is supposed
to return a pointer to a platform_nand_chip struct from an mtd_info
pointer.
Moreover, this function is buggy since the introduction of the plat_nand
layer (chip->priv is now storing a pointer to an intermediate
plat_nand_data structure allocated in plat_nand_probe(), and we have no
way to retrieve a pointer to the provided platform_nand_chip struct from
this plat_nand_data pointer).

While we are at it, remove the useless (and buggy, since it's pointing to
something stored on the stack) data->chip.priv assignment.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Cc: Vitaly Wool <vitalywool@gmail.com>
---
 drivers/mtd/nand/plat_nand.c | 1 -
 include/linux/mtd/nand.h     | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 06ac6c6..73cc94b 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -56,7 +56,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(data->io_base))
 		return PTR_ERR(data->io_base);
 
-	data->chip.priv = &data;
 	nand_set_flash_node(&data->chip, pdev->dev.of_node);
 	data->mtd.priv = &data->chip;
 	data->mtd.dev.parent = &pdev->dev;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index b614ed2..5491bda0 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -930,15 +930,6 @@ struct platform_nand_data {
 	struct platform_nand_ctrl ctrl;
 };
 
-/* Some helpers to access the data structures */
-static inline
-struct platform_nand_chip *get_platform_nandchip(struct mtd_info *mtd)
-{
-	struct nand_chip *chip = mtd->priv;
-
-	return chip->priv;
-}
-
 /* return the supported features. */
 static inline int onfi_feature(struct nand_chip *chip)
 {
-- 
2.1.4
