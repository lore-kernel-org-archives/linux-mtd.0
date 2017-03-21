Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGf7-0000Pq-Rw
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:05:23 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 08/13] mtd: nand: fsmc: kill {nr_, }partitions structure fields
Date: Tue, 21 Mar 2017 11:04:00 +0100
Message-Id: <1490090645-8576-9-git-send-email-thomas.petazzoni@free-electrons.com>
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

The ->partitions and ->nr_partitions fields of struct
fsmc_nand_platform_data are never set anywhere, so they are always
NULL/0. The corresponding fields in 'struct fsmc_nand_data' are set to the
value of the same fields in fsmc_nand_platform_data, i.e NULL/0.

Therefore, we remove those two fields, and pass NULL/0 directly to
mtd_device_register(), like many other NAND drivers already do.

At the same time, we remove the comment about the fact that we pass
partition info, since we are no longer doing this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 0d618ad..8342c39 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -146,8 +146,6 @@ enum access_mode {
  */
 struct fsmc_nand_platform_data {
 	struct fsmc_nand_timings *nand_timings;
-	struct mtd_partition	*partitions;
-	unsigned int		nr_partitions;
 	unsigned int		options;
 	unsigned int		bank;
 
@@ -179,8 +177,6 @@ struct fsmc_nand_platform_data {
 struct fsmc_nand_data {
 	u32			pid;
 	struct nand_chip	nand;
-	struct mtd_partition	*partitions;
-	unsigned int		nr_partitions;
 
 	unsigned int		bank;
 	struct device		*dev;
@@ -1000,8 +996,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		 AMBA_REV_BITS(pid), AMBA_CONFIG_BITS(pid));
 
 	host->bank = pdata->bank;
-	host->partitions = pdata->partitions;
-	host->nr_partitions = pdata->nr_partitions;
 	host->dev = &pdev->dev;
 	host->dev_timings = pdata->nand_timings;
 	host->mode = pdata->mode;
@@ -1139,18 +1133,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_probe;
 
-	/*
-	 * The partition information can is accessed by (in the same precedence)
-	 *
-	 * command line through Bootloader,
-	 * platform data,
-	 * default partition information present in driver.
-	 */
-	/*
-	 * Check for partition info passed
-	 */
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, host->partitions, host->nr_partitions);
+	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
 		goto err_probe;
 
-- 
2.7.4
