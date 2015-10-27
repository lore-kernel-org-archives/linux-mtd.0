Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqu4A-0004WC-1E
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 02:32:51 +0000
Received: by pasz6 with SMTP id z6so206145376pas.2
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 19:32:32 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: [PATCH 4/5] mtd: drop unnecessary partition parser data
Date: Mon, 26 Oct 2015 19:31:09 -0700
Message-Id: <1445913070-17950-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We should assign the MTD dev.of_node instead of the parser data field.
This gets us the equivalent partition parser behavior with fewer special
fields and parameter passing.

Also convert several of these to mtd_device_register(), since we don't
need the 2nd and 3rd parameters anymore.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/mtd_dataflash.c | 5 ++---
 drivers/mtd/devices/spear_smi.c     | 6 ++----
 drivers/mtd/devices/st_spi_fsm.c    | 5 ++---
 drivers/mtd/maps/lantiq-flash.c     | 5 ++---
 drivers/mtd/maps/physmap_of.c       | 5 ++---
 drivers/mtd/onenand/omap2.c         | 8 +++-----
 6 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 39666d552682..0de40f5a7509 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -624,7 +624,6 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 {
 	struct dataflash		*priv;
 	struct mtd_info			*device;
-	struct mtd_part_parser_data	ppdata;
 	struct flash_platform_data	*pdata = dev_get_platdata(&spi->dev);
 	char				*otp_tag = "";
 	int				err = 0;
@@ -656,6 +655,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 	device->priv = priv;
 
 	device->dev.parent = &spi->dev;
+	device->dev.of_node = spi->dev.of_node;
 
 	if (revision >= 'c')
 		otp_tag = otp_setup(device, revision);
@@ -665,8 +665,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 			pagesize, otp_tag);
 	spi_set_drvdata(spi, priv);
 
-	ppdata.of_node = spi->dev.of_node;
-	err = mtd_device_parse_register(device, NULL, &ppdata,
+	err = mtd_device_register(device,
 			pdata ? pdata->parts : NULL,
 			pdata ? pdata->nr_parts : 0);
 
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 64c7458344d4..8c41cc82d860 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -810,7 +810,6 @@ static int spear_smi_setup_banks(struct platform_device *pdev,
 				 u32 bank, struct device_node *np)
 {
 	struct spear_smi *dev = platform_get_drvdata(pdev);
-	struct mtd_part_parser_data ppdata = {};
 	struct spear_smi_flash_info *flash_info;
 	struct spear_smi_plat_data *pdata;
 	struct spear_snor_flash *flash;
@@ -855,6 +854,7 @@ static int spear_smi_setup_banks(struct platform_device *pdev,
 		flash->mtd.name = flash_devices[flash_index].name;
 
 	flash->mtd.dev.parent = &pdev->dev;
+	flash->mtd.dev.of_node = np;
 	flash->mtd.type = MTD_NORFLASH;
 	flash->mtd.writesize = 1;
 	flash->mtd.flags = MTD_CAP_NORFLASH;
@@ -881,10 +881,8 @@ static int spear_smi_setup_banks(struct platform_device *pdev,
 		count = flash_info->nr_partitions;
 	}
 #endif
-	ppdata.of_node = np;
 
-	ret = mtd_device_parse_register(&flash->mtd, NULL, &ppdata, parts,
-					count);
+	ret = mtd_device_register(&flash->mtd, parts, count);
 	if (ret) {
 		dev_err(&dev->pdev->dev, "Err MTD partition=%d\n", ret);
 		return ret;
diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 3060025c8af4..16cd44f728c1 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2025,7 +2025,6 @@ boot_device_fail:
 static int stfsm_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct mtd_part_parser_data ppdata;
 	struct flash_info *info;
 	struct resource *res;
 	struct stfsm *fsm;
@@ -2035,7 +2034,6 @@ static int stfsm_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "No DT found\n");
 		return -EINVAL;
 	}
-	ppdata.of_node = np;
 
 	fsm = devm_kzalloc(&pdev->dev, sizeof(*fsm), GFP_KERNEL);
 	if (!fsm)
@@ -2106,6 +2104,7 @@ static int stfsm_probe(struct platform_device *pdev)
 
 	fsm->mtd.name		= info->name;
 	fsm->mtd.dev.parent	= &pdev->dev;
+	fsm->mtd.dev.of_node	= np;
 	fsm->mtd.type		= MTD_NORFLASH;
 	fsm->mtd.writesize	= 4;
 	fsm->mtd.writebufsize	= fsm->mtd.writesize;
@@ -2124,7 +2123,7 @@ static int stfsm_probe(struct platform_device *pdev)
 		(long long)fsm->mtd.size, (long long)(fsm->mtd.size >> 20),
 		fsm->mtd.erasesize, (fsm->mtd.erasesize >> 10));
 
-	return mtd_device_parse_register(&fsm->mtd, NULL, &ppdata, NULL, 0);
+	return mtd_device_register(&fsm->mtd, NULL, 0);
 }
 
 static int stfsm_remove(struct platform_device *pdev)
diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 93852054977e..048cc33226ea 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -110,7 +110,6 @@ ltq_copy_to(struct map_info *map, unsigned long to,
 static int
 ltq_mtd_probe(struct platform_device *pdev)
 {
-	struct mtd_part_parser_data ppdata;
 	struct ltq_mtd *ltq_mtd;
 	struct cfi_private *cfi;
 	int err;
@@ -161,13 +160,13 @@ ltq_mtd_probe(struct platform_device *pdev)
 	}
 
 	ltq_mtd->mtd->dev.parent = &pdev->dev;
+	ltq_mtd->mtd->dev.of_node = pdev->dev.of_node;
 
 	cfi = ltq_mtd->map->fldrv_priv;
 	cfi->addr_unlock1 ^= 1;
 	cfi->addr_unlock2 ^= 1;
 
-	ppdata.of_node = pdev->dev.of_node;
-	err = mtd_device_parse_register(ltq_mtd->mtd, NULL, &ppdata, NULL, 0);
+	err = mtd_device_register(ltq_mtd->mtd, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to add partitions\n");
 		goto err_destroy;
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index e46b4e983666..6ebe674262cc 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -166,7 +166,6 @@ static int of_flash_probe(struct platform_device *dev)
 	int reg_tuple_size;
 	struct mtd_info **mtd_list = NULL;
 	resource_size_t res_size;
-	struct mtd_part_parser_data ppdata;
 	bool map_indirect;
 	const char *mtd_name = NULL;
 
@@ -310,13 +309,13 @@ static int of_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
-	ppdata.of_node = dp;
+	info->cmtd->dev.of_node = dp;
 	part_probe_types = of_get_probes(dp);
 	if (!part_probe_types) {
 		err = -ENOMEM;
 		goto err_out;
 	}
-	mtd_device_parse_register(info->cmtd, part_probe_types, &ppdata,
+	mtd_device_parse_register(info->cmtd, part_probe_types, NULL,
 			NULL, 0);
 	of_free_probes(part_probe_types);
 
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 3e0285696227..2a539e3fa1b6 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -614,7 +614,6 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	struct onenand_chip *this;
 	int r;
 	struct resource *res;
-	struct mtd_part_parser_data ppdata = {};
 
 	pdata = dev_get_platdata(&pdev->dev);
 	if (pdata == NULL) {
@@ -713,6 +712,7 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	c->mtd.priv = &c->onenand;
 
 	c->mtd.dev.parent = &pdev->dev;
+	c->mtd.dev.of_node = pdata->of_node;
 
 	this = &c->onenand;
 	if (c->dma_channel >= 0) {
@@ -743,10 +743,8 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
 		goto err_release_regulator;
 
-	ppdata.of_node = pdata->of_node;
-	r = mtd_device_parse_register(&c->mtd, NULL, &ppdata,
-				      pdata ? pdata->parts : NULL,
-				      pdata ? pdata->nr_parts : 0);
+	r = mtd_device_register(&c->mtd, pdata ? pdata->parts : NULL,
+				pdata ? pdata->nr_parts : 0);
 	if (r)
 		goto err_release_onenand;
 
-- 
2.6.0.rc2.230.g3dd15c0
