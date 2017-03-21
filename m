Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGej-0000NQ-TA
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:04:50 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 stable@vger.kernel.org
Subject: [PATCH 01/13] mtd: nand: fsmc: fix NAND width handling
Date: Tue, 21 Mar 2017 11:03:53 +0100
Message-Id: <1490090645-8576-2-git-send-email-thomas.petazzoni@free-electrons.com>
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

In commit eea628199d5b ("mtd: Add device-tree support to fsmc_nand"),
Device Tree support was added to the fmsc_nand driver. However, this
code has a bug in how it handles the bank-width DT property to set the
bus width.

Indeed, in the function fsmc_nand_probe_config_dt() that parses the
Device Tree, it sets pdata->width to either 8 or 16 depending on the
value of the bank-width DT property.

Then, the ->probe() function will test if pdata->width is equal to
FSMC_NAND_BW16 (which is 2) to set NAND_BUSWIDTH_16 in
nand->options. Therefore, with the DT probing, this condition will never
match.

This commit fixes that by removing the "width" field from
fsmc_nand_platform_data and instead have the fsmc_nand_probe_config_dt()
function directly set the appropriate nand->options value.

It is worth mentioning that if this commit gets backported to older
kernels, prior to the drop of non-DT probing, then non-DT probing will
be broken because nand->options will no longer be set to
NAND_BUSWIDTH_16.

Fixes: eea628199d5b ("mtd: Add device-tree support to fsmc_nand")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index bda1e46..66aece9 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -150,7 +150,6 @@ struct fsmc_nand_platform_data {
 	struct mtd_partition	*partitions;
 	unsigned int		nr_partitions;
 	unsigned int		options;
-	unsigned int		width;
 	unsigned int		bank;
 
 	enum access_mode	mode;
@@ -844,18 +843,19 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 	u32 val;
 	int ret;
 
-	/* Set default NAND width to 8 bits */
-	pdata->width = 8;
+	pdata->options = 0;
+
 	if (!of_property_read_u32(np, "bank-width", &val)) {
 		if (val == 2) {
-			pdata->width = 16;
+			pdata->options |= NAND_BUSWIDTH_16;
 		} else if (val != 1) {
 			dev_err(&pdev->dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
 	}
+
 	if (of_get_property(np, "nand-skip-bbtscan", NULL))
-		pdata->options = NAND_SKIP_BBTSCAN;
+		pdata->options |= NAND_SKIP_BBTSCAN;
 
 	pdata->nand_timings = devm_kzalloc(&pdev->dev,
 				sizeof(*pdata->nand_timings), GFP_KERNEL);
@@ -992,9 +992,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->badblockbits = 7;
 	nand_set_flash_node(nand, np);
 
-	if (pdata->width == FSMC_NAND_BW16)
-		nand->options |= NAND_BUSWIDTH_16;
-
 	switch (host->mode) {
 	case USE_DMA_ACCESS:
 		dma_cap_zero(mask);
-- 
2.7.4
