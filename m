Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGf7-0000Pj-Rq
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:05:20 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 05/13] mtd: nand: fsmc: remove ->select_bank() from
 fsmc_nand_platform_data
Date: Tue, 21 Mar 2017 11:03:57 +0100
Message-Id: <1490090645-8576-6-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit 4404d7d821c3 ("mtd: nand: fsmc: remove stale non-DT probe
path"), only DT probing is used for the fsmc_nand driver. Due to this,
the ->select_bank() field of fsmc_nand_platform_data is never used, so
this commit gets rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index bc1c764..928ff98 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -141,7 +141,6 @@ enum access_mode {
  * @options: different options for the driver
  * @width: bus width
  * @bank: default bank
- * @select_bank: callback to select a certain bank, this is
  * platform-specific. If the controller only supports one bank
  * this may be set to NULL
  */
@@ -154,8 +153,6 @@ struct fsmc_nand_platform_data {
 
 	enum access_mode	mode;
 
-	void			(*select_bank)(uint32_t bank, uint32_t busw);
-
 	/* priv structures for dma accesses */
 	void			*read_dma_priv;
 	void			*write_dma_priv;
@@ -1035,7 +1032,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		 AMBA_REV_BITS(pid), AMBA_CONFIG_BITS(pid));
 
 	host->bank = pdata->bank;
-	host->select_chip = pdata->select_bank;
 	host->partitions = pdata->partitions;
 	host->nr_partitions = pdata->nr_partitions;
 	host->dev = &pdev->dev;
-- 
2.7.4
