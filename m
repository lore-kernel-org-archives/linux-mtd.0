Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4591-0004L1-MM
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 08:19:01 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQQ00KLLPQXG2P0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 17:18:33 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 31/35] mtd: nand: use dev_get_platdata()
Date: Tue, 30 Jul 2013 17:18:33 +0900
Message-id: <005a01ce8cfd$61bc7bc0$25357340$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the wrapper function for retrieving the platform data instead of
accessing dev->platform_data directly.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/atmel_nand.c   |    2 +-
 drivers/mtd/nand/au1550nd.c     |    2 +-
 drivers/mtd/nand/bf5xx_nand.c   |    2 +-
 drivers/mtd/nand/davinci_nand.c |    6 +++---
 drivers/mtd/nand/gpio.c         |    6 +++---
 drivers/mtd/nand/jz4740_nand.c  |    4 ++--
 drivers/mtd/nand/lpc32xx_mlc.c  |    2 +-
 drivers/mtd/nand/lpc32xx_slc.c  |    2 +-
 drivers/mtd/nand/mxc_nand.c     |    3 ++-
 drivers/mtd/nand/omap2.c        |    2 +-
 drivers/mtd/nand/orion_nand.c   |    5 +++--
 drivers/mtd/nand/plat_nand.c    |    4 ++--
 drivers/mtd/nand/pxa3xx_nand.c  |   14 +++++++-------
 drivers/mtd/nand/s3c2410.c      |    2 +-
 drivers/mtd/nand/sh_flctl.c     |    4 ++--
 drivers/mtd/nand/sharpsl.c      |    2 +-
 drivers/mtd/nand/tmio_nand.c    |    2 +-
 drivers/mtd/nand/txx9ndfmc.c    |    8 ++++----
 18 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 7e50ed8..e26138f 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1496,7 +1496,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		if (res)
 			goto err_ecc_ioremap;
 	} else {
-		memcpy(&host->board, pdev->dev.platform_data,
+		memcpy(&host->board, dev_get_platdata(&pdev->dev),
 		       sizeof(struct atmel_nand_data));
 	}
 
diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 217459d..ae8dd7c 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -411,7 +411,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 	struct resource *r;
 	int ret, cs;
 
-	pd = pdev->dev.platform_data;
+	pd = dev_get_platdata(&pdev->dev);
 	if (!pd) {
 		dev_err(&pdev->dev, "missing platform data\n");
 		return -ENODEV;
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 809a63c..2c42e12 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -171,7 +171,7 @@ static struct bf5xx_nand_info *to_nand_info(struct platform_device *pdev)
 
 static struct bf5xx_nand_platform *to_nand_plat(struct platform_device *pdev)
 {
-	return pdev->dev.platform_data;
+	return dev_get_platdata(&pdev->dev);
 }
 
 /*
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 999ad9c..b77a01e 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -530,7 +530,7 @@ MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
 static struct davinci_nand_pdata
 	*nand_davinci_get_pdata(struct platform_device *pdev)
 {
-	if (!pdev->dev.platform_data && pdev->dev.of_node) {
+	if (!dev_get_platdata(&pdev->dev) && pdev->dev.of_node) {
 		struct davinci_nand_pdata *pdata;
 		const char *mode;
 		u32 prop;
@@ -575,13 +575,13 @@ static struct davinci_nand_pdata
 			pdata->bbt_options = NAND_BBT_USE_FLASH;
 	}
 
-	return pdev->dev.platform_data;
+	return dev_get_platdata(&pdev->dev);
 }
 #else
 static struct davinci_nand_pdata
 	*nand_davinci_get_pdata(struct platform_device *pdev)
 {
-	return pdev->dev.platform_data;
+	return dev_get_platdata(&pdev->dev);
 }
 #endif
 
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 800a1cc..e826f89 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -167,8 +167,8 @@ static inline int gpio_nand_get_config(const struct device *dev,
 	if (!ret)
 		return ret;
 
-	if (dev->platform_data) {
-		memcpy(plat, dev->platform_data, sizeof(*plat));
+	if (dev_get_platdata(dev)) {
+		memcpy(plat, dev_get_platdata(dev), sizeof(*plat));
 		return 0;
 	}
 
@@ -207,7 +207,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	struct mtd_part_parser_data ppdata = {};
 	int ret = 0;
 
-	if (!pdev->dev.of_node && !pdev->dev.platform_data)
+	if (!pdev->dev.of_node && !dev_get_platdata(&pdev->dev))
 		return -EINVAL;
 
 	gpiomtd = devm_kzalloc(&pdev->dev, sizeof(*gpiomtd), GFP_KERNEL);
diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index 698a4d1..a264b88 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -411,7 +411,7 @@ static int jz_nand_probe(struct platform_device *pdev)
 	struct jz_nand *nand;
 	struct nand_chip *chip;
 	struct mtd_info *mtd;
-	struct jz_nand_platform_data *pdata = pdev->dev.platform_data;
+	struct jz_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	size_t chipnr, bank_idx;
 	uint8_t nand_maf_id = 0, nand_dev_id = 0;
 
@@ -548,7 +548,7 @@ err_free:
 static int jz_nand_remove(struct platform_device *pdev)
 {
 	struct jz_nand *nand = platform_get_drvdata(pdev);
-	struct jz_nand_platform_data *pdata = pdev->dev.platform_data;
+	struct jz_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	size_t i;
 
 	nand_release(&nand->mtd);
diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 74a469b..f4dd2a8 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -696,7 +696,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	}
 	lpc32xx_wp_disable(host);
 
-	host->pdata = pdev->dev.platform_data;
+	host->pdata = dev_get_platdata(&pdev->dev);
 
 	nand_chip->priv = host;		/* link the private data structures */
 	mtd->priv = nand_chip;
diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index a66f33f..add7570 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -798,7 +798,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	}
 	lpc32xx_wp_disable(host);
 
-	host->pdata = pdev->dev.platform_data;
+	host->pdata = dev_get_platdata(&pdev->dev);
 
 	mtd = &host->mtd;
 	chip = &host->nand_chip;
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 18855ad..d1349df 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1432,7 +1432,8 @@ static int mxcnd_probe(struct platform_device *pdev)
 
 	err = mxcnd_probe_dt(host);
 	if (err > 0) {
-		struct mxc_nand_platform_data *pdata = pdev->dev.platform_data;
+		struct mxc_nand_platform_data *pdata =
+					dev_get_platdata(&pdev->dev);
 		if (pdata) {
 			host->pdata = *pdata;
 			host->devtype_data = (struct mxc_nand_devtype_data *)
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index c4c7e0d..d92d3f1 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1706,7 +1706,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct resource			*res;
 	struct mtd_part_parser_data	ppdata = {};
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	if (pdata == NULL) {
 		dev_err(&pdev->dev, "platform data missing\n");
 		return -ENODEV;
diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 46f308d..a393a5b 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -130,8 +130,9 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		if (!of_property_read_u32(pdev->dev.of_node,
 						"chip-delay", &val))
 			board->chip_delay = (u8)val;
-	} else
-		board = pdev->dev.platform_data;
+	} else {
+		board = dev_get_platdata(&pdev->dev);
+	}
 
 	mtd->priv = nc;
 	mtd->owner = THIS_MODULE;
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index d42700a..cad4cdc 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -30,7 +30,7 @@ static const char *part_probe_types[] = { "cmdlinepart", NULL };
  */
 static int plat_nand_probe(struct platform_device *pdev)
 {
-	struct platform_nand_data *pdata = pdev->dev.platform_data;
+	struct platform_nand_data *pdata = dev_get_platdata(&pdev->dev);
 	struct mtd_part_parser_data ppdata;
 	struct plat_nand_data *data;
 	struct resource *res;
@@ -136,7 +136,7 @@ out_free:
 static int plat_nand_remove(struct platform_device *pdev)
 {
 	struct plat_nand_data *data = platform_get_drvdata(pdev);
-	struct platform_nand_data *pdata = pdev->dev.platform_data;
+	struct platform_nand_data *pdata = dev_get_platdata(&pdev->dev);
 	struct resource *res;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index fdc045d..501e380 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -815,7 +815,7 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 				    const struct pxa3xx_nand_flash *f)
 {
 	struct platform_device *pdev = info->pdev;
-	struct pxa3xx_nand_platform_data *pdata = pdev->dev.platform_data;
+	struct pxa3xx_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct pxa3xx_nand_host *host = info->host[info->cs];
 	uint32_t ndcr = 0x0; /* enable all interrupts */
 
@@ -958,7 +958,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 	struct platform_device *pdev = info->pdev;
-	struct pxa3xx_nand_platform_data *pdata = pdev->dev.platform_data;
+	struct pxa3xx_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct nand_flash_dev pxa3xx_flash_ids[2], *def = NULL;
 	const struct pxa3xx_nand_flash *f = NULL;
 	struct nand_chip *chip = mtd->priv;
@@ -1058,7 +1058,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	struct resource *r;
 	int ret, irq, cs;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	info = devm_kzalloc(&pdev->dev, sizeof(*info) + (sizeof(*mtd) +
 			    sizeof(*host)) * pdata->num_cs, GFP_KERNEL);
 	if (!info)
@@ -1176,7 +1176,7 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	if (!info)
 		return 0;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0)
@@ -1239,7 +1239,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	if (!pdata) {
 		dev_err(&pdev->dev, "no platform data defined\n");
 		return -ENODEV;
@@ -1286,7 +1286,7 @@ static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_t state)
 	struct mtd_info *mtd;
 	int cs;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	if (info->state) {
 		dev_err(&pdev->dev, "driver busy, state = %d\n", info->state);
 		return -EAGAIN;
@@ -1307,7 +1307,7 @@ static int pxa3xx_nand_resume(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int cs;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	/* We don't want to handle interrupt without calling mtd routine */
 	disable_int(info, NDCR_INT_MASK);
 
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 191823e..d65cbe9 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -150,7 +150,7 @@ static struct s3c2410_nand_info *to_nand_info(struct platform_device *dev)
 
 static struct s3c2410_platform_nand *to_nand_plat(struct platform_device *dev)
 {
-	return dev->dev.platform_data;
+	return dev_get_platdata(&dev->dev);
 }
 
 static inline int allow_clk_suspend(struct s3c2410_nand_info *info)
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index e57e18e..a3c84eb 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -137,7 +137,7 @@ static void flctl_setup_dma(struct sh_flctl *flctl)
 	dma_cap_mask_t mask;
 	struct dma_slave_config cfg;
 	struct platform_device *pdev = flctl->pdev;
-	struct sh_flctl_platform_data *pdata = pdev->dev.platform_data;
+	struct sh_flctl_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	int ret;
 
 	if (!pdata)
@@ -1131,7 +1131,7 @@ static int flctl_probe(struct platform_device *pdev)
 	if (pdev->dev.of_node)
 		pdata = flctl_parse_dt(&pdev->dev);
 	else
-		pdata = pdev->dev.platform_data;
+		pdata = dev_get_platdata(&pdev->dev);
 
 	if (!pdata) {
 		dev_err(&pdev->dev, "no setup data defined\n");
diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 1d41578..87908d7 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -112,7 +112,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	struct resource *r;
 	int err = 0;
 	struct sharpsl_nand *sharpsl;
-	struct sharpsl_nand_platform_data *data = pdev->dev.platform_data;
+	struct sharpsl_nand_platform_data *data = dev_get_platdata(&pdev->dev);
 
 	if (!data) {
 		dev_err(&pdev->dev, "no platform data!\n");
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 508e9e0..396530d 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -357,7 +357,7 @@ static void tmio_hw_stop(struct platform_device *dev, struct tmio_nand *tmio)
 
 static int tmio_probe(struct platform_device *dev)
 {
-	struct tmio_nand_data *data = dev->dev.platform_data;
+	struct tmio_nand_data *data = dev_get_platdata(&dev->dev);
 	struct resource *fcr = platform_get_resource(dev,
 			IORESOURCE_MEM, 0);
 	struct resource *ccr = platform_get_resource(dev,
diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 0488dd5..440b570 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -87,7 +87,7 @@ static struct platform_device *mtd_to_platdev(struct mtd_info *mtd)
 static void __iomem *ndregaddr(struct platform_device *dev, unsigned int reg)
 {
 	struct txx9ndfmc_drvdata *drvdata = platform_get_drvdata(dev);
-	struct txx9ndfmc_platform_data *plat = dev->dev.platform_data;
+	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 
 	return drvdata->base + (reg << plat->shift);
 }
@@ -138,7 +138,7 @@ static void txx9ndfmc_cmd_ctrl(struct mtd_info *mtd, int cmd,
 	struct nand_chip *chip = mtd->priv;
 	struct txx9ndfmc_priv *txx9_priv = chip->priv;
 	struct platform_device *dev = txx9_priv->dev;
-	struct txx9ndfmc_platform_data *plat = dev->dev.platform_data;
+	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
 		u32 mcr = txx9ndfmc_read(dev, TXX9_NDFMCR);
@@ -225,7 +225,7 @@ static void txx9ndfmc_enable_hwecc(struct mtd_info *mtd, int mode)
 
 static void txx9ndfmc_initialize(struct platform_device *dev)
 {
-	struct txx9ndfmc_platform_data *plat = dev->dev.platform_data;
+	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	struct txx9ndfmc_drvdata *drvdata = platform_get_drvdata(dev);
 	int tmout = 100;
 
@@ -274,7 +274,7 @@ static int txx9ndfmc_nand_scan(struct mtd_info *mtd)
 
 static int __init txx9ndfmc_probe(struct platform_device *dev)
 {
-	struct txx9ndfmc_platform_data *plat = dev->dev.platform_data;
+	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
 	int i;
 	struct txx9ndfmc_drvdata *drvdata;
-- 
1.7.10.4
