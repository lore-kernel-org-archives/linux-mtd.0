Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eydNy-0001WC-Tz
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 13:02:40 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 03/16] mtd: rawnand: davinci: fix probe function error path
Date: Wed, 21 Mar 2018 14:01:44 +0100
Message-Id: <20180321130157.9524-4-miquel.raynal@bootlin.com>
In-Reply-To: <20180321130157.9524-1-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An error after nand_scan_tail() should trigger a nand_cleanup().
The helper mtd_device_register() returns an error code that should
be checked and nand_cleanup() called accordingly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index ccc8c43abcff..ccc51dc65f35 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -826,7 +826,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret < 0)
-		goto err;
+		goto cleanup_nand;
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -834,14 +834,16 @@ static int nand_davinci_probe(struct platform_device *pdev)
 
 	return 0;
 
+cleanup_nand:
+	nand_cleanup(&info->chip);
 err:
 	clk_disable_unprepare(info->clk);
-
 err_clk_enable:
 	spin_lock_irq(&davinci_nand_lock);
 	if (info->chip.ecc.mode == NAND_ECC_HW_SYNDROME)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
+
 	return ret;
 }
 
-- 
2.14.1
