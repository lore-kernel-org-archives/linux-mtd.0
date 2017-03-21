Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGf7-0000QV-Rr
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:05:28 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 10/13] mtd: nand: fsmc: finally remove fsmc_nand_platform_data
Date: Tue, 21 Mar 2017 11:04:02 +0100
Message-Id: <1490090645-8576-11-git-send-email-thomas.petazzoni@free-electrons.com>
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

Since the driver now only supports DT probing, it doesn't make a lot of
sense to have a private data structure called platform_data, fill it in
with information coming from the DT, and then copying this into the
driver-specific structure fsmc_nand_data.

So instead, we remove fsmc_nand_platform_data entirely, and have
fsmc_nand_probe_config_dt() fill in the fsmc_nand_data structure
directly.

This requires calling fsmc_nand_probe_config_dt() after fsmc_nand_data
has been allocated instead of before.

Also, as an added bonus, we now propagate properly the return value of
fsmc_nand_probe_config_dt() instead of returning -ENODEV on failure. The
error message is also removed, since it no longer made any sense.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 74 +++++++++++++-------------------------------
 1 file changed, 22 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 990c83a..12afae62 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -133,26 +133,6 @@ enum access_mode {
 };
 
 /**
- * fsmc_nand_platform_data - platform specific NAND controller config
- * @nand_timings: timing setup for the physical NAND interface
- * @partitions: partition table for the platform, use a default fallback
- * if this is NULL
- * @nr_partitions: the number of partitions in the previous entry
- * @options: different options for the driver
- * @width: bus width
- * @bank: default bank
- * platform-specific. If the controller only supports one bank
- * this may be set to NULL
- */
-struct fsmc_nand_platform_data {
-	struct fsmc_nand_timings *nand_timings;
-	unsigned int		options;
-	unsigned int		bank;
-
-	enum access_mode	mode;
-};
-
-/**
  * struct fsmc_nand_data - structure for FSMC NAND device state
  *
  * @pid:		Part ID on the AMBA PrimeCell format
@@ -877,17 +857,18 @@ static bool filter(struct dma_chan *chan, void *slave)
 }
 
 static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
-				     struct device_node *np)
+				     struct fsmc_nand_data *host,
+				     struct nand_chip *nand)
 {
-	struct fsmc_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct device_node *np = pdev->dev.of_node;
 	u32 val;
 	int ret;
 
-	pdata->options = 0;
+	nand->options = 0;
 
 	if (!of_property_read_u32(np, "bank-width", &val)) {
 		if (val == 2) {
-			pdata->options |= NAND_BUSWIDTH_16;
+			nand->options |= NAND_BUSWIDTH_16;
 		} else if (val != 1) {
 			dev_err(&pdev->dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
@@ -895,25 +876,26 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 	}
 
 	if (of_get_property(np, "nand-skip-bbtscan", NULL))
-		pdata->options |= NAND_SKIP_BBTSCAN;
+		nand->options |= NAND_SKIP_BBTSCAN;
 
-	pdata->nand_timings = devm_kzalloc(&pdev->dev,
-				sizeof(*pdata->nand_timings), GFP_KERNEL);
-	if (!pdata->nand_timings)
+	host->dev_timings =
+		devm_kzalloc(&pdev->dev, sizeof(*host->dev_timings),
+			     GFP_KERNEL);
+	if (!host->dev_timings)
 		return -ENOMEM;
-	ret = of_property_read_u8_array(np, "timings", (u8 *)pdata->nand_timings,
-						sizeof(*pdata->nand_timings));
+	ret = of_property_read_u8_array(np, "timings", (u8 *)host->dev_timings,
+						sizeof(*host->dev_timings));
 	if (ret)
-		pdata->nand_timings = NULL;
+		host->dev_timings = NULL;
 
 	/* Set default NAND bank to 0 */
-	pdata->bank = 0;
+	host->bank = 0;
 	if (!of_property_read_u32(np, "bank", &val)) {
 		if (val > 3) {
 			dev_err(&pdev->dev, "invalid bank %u\n", val);
 			return -EINVAL;
 		}
-		pdata->bank = val;
+		host->bank = val;
 	}
 	return 0;
 }
@@ -924,8 +906,6 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
  */
 static int __init fsmc_nand_probe(struct platform_device *pdev)
 {
-	struct fsmc_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct device_node __maybe_unused *np = pdev->dev.of_node;
 	struct fsmc_nand_data *host;
 	struct mtd_info *mtd;
 	struct nand_chip *nand;
@@ -935,22 +915,17 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	u32 pid;
 	int i;
 
-	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return -ENOMEM;
-
-	pdev->dev.platform_data = pdata;
-	ret = fsmc_nand_probe_config_dt(pdev, np);
-	if (ret) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -ENODEV;
-	}
-
 	/* Allocate memory for the device structure (and zero it) */
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
 	if (!host)
 		return -ENOMEM;
 
+	nand = &host->nand;
+
+	ret = fsmc_nand_probe_config_dt(pdev, host, nand);
+	if (ret)
+		return ret;
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
 	host->data_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->data_va))
@@ -995,19 +970,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		 AMBA_PART_BITS(pid), AMBA_MANF_BITS(pid),
 		 AMBA_REV_BITS(pid), AMBA_CONFIG_BITS(pid));
 
-	host->bank = pdata->bank;
 	host->dev = &pdev->dev;
-	host->dev_timings = pdata->nand_timings;
-	host->mode = pdata->mode;
 
 	if (host->mode == USE_DMA_ACCESS)
 		init_completion(&host->dma_access_complete);
 
 	/* Link all private pointers */
 	mtd = nand_to_mtd(&host->nand);
-	nand = &host->nand;
 	nand_set_controller_data(nand, host);
-	nand_set_flash_node(nand, np);
+	nand_set_flash_node(nand, pdev->dev.of_node);
 
 	mtd->dev.parent = &pdev->dev;
 	nand->IO_ADDR_R = host->data_va;
@@ -1022,7 +993,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->ecc.mode = NAND_ECC_HW;
 	nand->ecc.hwctl = fsmc_enable_hwecc;
 	nand->ecc.size = 512;
-	nand->options = pdata->options;
 	nand->badblockbits = 7;
 	nand->setup_data_interface = fsmc_setup_data_interface;
 
-- 
2.7.4
