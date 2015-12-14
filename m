Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8Wi1-0008ME-7f
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 17:14:49 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] mtd: nand: bcm47xxnflash: fix bcm47xxnflash_remove()
Date: Mon, 14 Dec 2015 18:14:10 +0100
Message-Id: <1450113250-12036-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

bcm47xxnflash_remove() is supposed to unregister the NAND device previously
registered in bcm47xxnflash_probe(), but the current implementation just
test for the always NULL ->mtd platform data field (and does not call the
right function to unregister it).

Kill the useless ->mtd field in struct bcma_nflash, and release the real
NAND device in bcm47xxnflash_remove().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Fixes: a5401370c520 ("mtd: prepare place for BCMA NAND flash driver(s)")
Cc: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/main.c       | 7 ++++---
 include/linux/bcma/bcma_driver_chipcommon.h | 4 ----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 9ba0c0f..4a07e56 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -55,15 +55,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	platform_set_drvdata(pdev, b47n);
+
 	return 0;
 }
 
 static int bcm47xxnflash_remove(struct platform_device *pdev)
 {
-	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
+	struct bcm47xxnflash *b47n = platform_get_drvdata(pdev);
 
-	if (nflash->mtd)
-		mtd_device_unregister(nflash->mtd);
+	nand_release(nand_to_mtd(&b47n->nand_chip));
 
 	return 0;
 }
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index cf03843..3015432 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -592,13 +592,9 @@ struct bcma_sflash {
 #endif
 
 #ifdef CONFIG_BCMA_NFLASH
-struct mtd_info;
-
 struct bcma_nflash {
 	bool present;
 	bool boot;		/* This is the flash the SoC boots from */
-
-	struct mtd_info *mtd;
 };
 #endif
 
-- 
2.1.4
