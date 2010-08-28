Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OpS54-0007Hu-Mv
	for linux-mtd@lists.infradead.org; Sat, 28 Aug 2010 20:32:51 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: Blackfin NFC: fix invalid free in remove()
Date: Sat, 28 Aug 2010 16:42:04 -0400
Message-Id: <1283028125-6027-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since info->mtd isn't dynamically allocated, we shouldn't attempt to
kfree() it.  Otherwise we get random fun corruption when unloading
the driver built as a module.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
note: this should be merged for 2.6.36 and probably sent to stable trees

 drivers/mtd/nand/bf5xx_nand.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 162c5ea..6fbeefa 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -682,7 +682,6 @@ static int __devinit bf5xx_nand_add_partition(struct bf5xx_nand_info *info)
 static int __devexit bf5xx_nand_remove(struct platform_device *pdev)
 {
 	struct bf5xx_nand_info *info = to_nand_info(pdev);
-	struct mtd_info *mtd = NULL;
 
 	platform_set_drvdata(pdev, NULL);
 
@@ -690,11 +689,7 @@ static int __devexit bf5xx_nand_remove(struct platform_device *pdev)
 	 * and their partitions, then go through freeing the
 	 * resources used
 	 */
-	mtd = &info->mtd;
-	if (mtd) {
-		nand_release(mtd);
-		kfree(mtd);
-	}
+	nand_release(&info->mtd);
 
 	peripheral_free_list(bfin_nfc_pin_req);
 	bf5xx_nand_dma_remove(info);
-- 
1.7.2.2
