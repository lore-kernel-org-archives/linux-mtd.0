Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S63pm-0003py-Ta
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 17:42:33 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: do not use plain 0 as NULL
Date: Fri,  9 Mar 2012 19:42:28 +0200
Message-Id: <1331314948-3633-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The first 3 arguments of 'mtd_device_parse_register()' are pointers,
but many callers pass '0' instead of 'NULL'. Fix this globally. Thanks
to coccinelle for making it easy to do with the following semantic patch:

 @@
 expression mtd, types, parser_data, parts, nr_parts;
 @@
 (
 -mtd_device_parse_register(mtd, 0, parser_data, parts, nr_parts)
 +mtd_device_parse_register(mtd, NULL, parser_data, parts, nr_parts)
 |
 -mtd_device_parse_register(mtd, types, 0, parts, nr_parts)
 +mtd_device_parse_register(mtd, types, NULL, parts, nr_parts)
 |
 -mtd_device_parse_register(mtd, types, parser_data, 0, nr_parts)
 +mtd_device_parse_register(mtd, types, parser_data, NULL, nr_parts)
 )

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 arch/mips/cavium-octeon/flash_setup.c |    2 +-
 drivers/mtd/devices/spear_smi.c       |    2 +-
 drivers/mtd/devices/sst25l.c          |    6 +++---
 drivers/mtd/maps/bfin-async-flash.c   |    4 ++--
 drivers/mtd/maps/dc21285.c            |    2 +-
 drivers/mtd/maps/gpio-addr-flash.c    |    4 ++--
 drivers/mtd/maps/h720x-flash.c        |    4 ++--
 drivers/mtd/maps/impa7.c              |    2 +-
 drivers/mtd/maps/intel_vr_nor.c       |    2 +-
 drivers/mtd/maps/ixp2000.c            |    2 +-
 drivers/mtd/maps/lantiq-flash.c       |    5 +++--
 drivers/mtd/maps/latch-addr-flash.c   |    5 +++--
 drivers/mtd/maps/physmap.c            |    2 +-
 drivers/mtd/maps/plat-ram.c           |    5 +++--
 drivers/mtd/maps/pxa2xx-flash.c       |    3 ++-
 drivers/mtd/maps/rbtx4939-flash.c     |    4 ++--
 drivers/mtd/maps/sa1100-flash.c       |    4 ++--
 drivers/mtd/maps/solutionengine.c     |    4 ++--
 drivers/mtd/maps/wr_sbc82xx_flash.c   |    2 +-
 drivers/mtd/nand/atmel_nand.c         |    4 ++--
 drivers/mtd/nand/bcm_umi_nand.c       |    2 +-
 drivers/mtd/nand/cafe_nand.c          |    2 +-
 drivers/mtd/nand/cmx270_nand.c        |    2 +-
 drivers/mtd/nand/cs553x_nand.c        |    2 +-
 drivers/mtd/nand/davinci_nand.c       |    4 ++--
 drivers/mtd/nand/fsmc_nand.c          |   14 +++++++-------
 drivers/mtd/nand/h1910.c              |    4 ++--
 drivers/mtd/nand/jz4740_nand.c        |    6 +++---
 drivers/mtd/nand/mxc_nand.c           |    4 ++--
 drivers/mtd/nand/omap2.c              |    4 ++--
 drivers/mtd/nand/orion_nand.c         |    4 ++--
 drivers/mtd/nand/plat_nand.c          |    5 +++--
 drivers/mtd/nand/ppchameleonevb.c     |   18 ++++++++----------
 drivers/mtd/nand/pxa3xx_nand.c        |    5 +++--
 drivers/mtd/nand/s3c2410.c            |    4 ++--
 drivers/mtd/nand/sharpsl.c            |    4 ++--
 drivers/mtd/nand/tmio_nand.c          |    6 +++---
 drivers/mtd/nand/txx9ndfmc.c          |    2 +-
 drivers/mtd/onenand/generic.c         |    6 +++---
 drivers/mtd/onenand/omap2.c           |    6 +++---
 drivers/mtd/onenand/samsung.c         |    2 +-
 41 files changed, 89 insertions(+), 85 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 0a430e0..e44a55b 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -60,7 +60,7 @@ static int __init flash_init(void)
 		if (mymtd) {
 			mymtd->owner = THIS_MODULE;
 			mtd_device_parse_register(mymtd, part_probe_types,
-						  0, NULL, 0);
+						  NULL, NULL, 0);
 		} else {
 			pr_err("Failed to register MTD device for flash\n");
 		}
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 4f7b682..ad3b7cc 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -853,7 +853,7 @@ static int spear_smi_setup_banks(struct platform_device *pdev, u32 bank)
 			goto err_map;
 		}
 	}
-	ret = mtd_device_parse_register(&flash->mtd, NULL, 0, parts, count);
+	ret = mtd_device_parse_register(&flash->mtd, NULL, NULL, parts, count);
 	if (ret)
 		dev_err(&dev->pdev->dev, "Err MTD partition=%d\n", ret);
 
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 51b2df3..ab8a2f4 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -399,9 +399,9 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	      flash->mtd.numeraseregions);
 
 
-	ret = mtd_device_parse_register(&flash->mtd, NULL, 0,
-			data ? data->parts : NULL,
-			data ? data->nr_parts : 0);
+	ret = mtd_device_parse_register(&flash->mtd, NULL, NULL,
+					data ? data->parts : NULL,
+					data ? data->nr_parts : 0);
 	if (ret) {
 		kfree(flash);
 		dev_set_drvdata(&spi->dev, NULL);
diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index 650126c..ef5cde8 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -164,8 +164,8 @@ static int __devinit bfin_flash_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	mtd_device_parse_register(state->mtd, part_probe_types, 0,
-			pdata->parts, pdata->nr_parts);
+	mtd_device_parse_register(state->mtd, part_probe_types, NULL,
+				  pdata->parts, pdata->nr_parts);
 
 	platform_set_drvdata(pdev, state);
 
diff --git a/drivers/mtd/maps/dc21285.c b/drivers/mtd/maps/dc21285.c
index f43b365..080f060 100644
--- a/drivers/mtd/maps/dc21285.c
+++ b/drivers/mtd/maps/dc21285.c
@@ -196,7 +196,7 @@ static int __init init_dc21285(void)
 
 	dc21285_mtd->owner = THIS_MODULE;
 
-	mtd_device_parse_register(dc21285_mtd, probes, 0, NULL, 0);
+	mtd_device_parse_register(dc21285_mtd, probes, NULL, NULL, 0);
 
 	if(machine_is_ebsa285()) {
 		/*
diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 33cce89..e4de96b 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -252,8 +252,8 @@ static int __devinit gpio_flash_probe(struct platform_device *pdev)
 	}
 
 
-	mtd_device_parse_register(state->mtd, part_probe_types, 0,
-			pdata->parts, pdata->nr_parts);
+	mtd_device_parse_register(state->mtd, part_probe_types, NULL,
+				  pdata->parts, pdata->nr_parts);
 
 	return 0;
 }
diff --git a/drivers/mtd/maps/h720x-flash.c b/drivers/mtd/maps/h720x-flash.c
index 49c1418..8ed6cb4 100644
--- a/drivers/mtd/maps/h720x-flash.c
+++ b/drivers/mtd/maps/h720x-flash.c
@@ -85,8 +85,8 @@ static int __init h720x_mtd_init(void)
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
 
-		mtd_device_parse_register(mymtd, NULL, 0,
-				h720x_partitions, NUM_PARTITIONS);
+		mtd_device_parse_register(mymtd, NULL, NULL,
+					  h720x_partitions, NUM_PARTITIONS);
 		return 0;
 	}
 
diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
index f47aedb..834a06c 100644
--- a/drivers/mtd/maps/impa7.c
+++ b/drivers/mtd/maps/impa7.c
@@ -91,7 +91,7 @@ static int __init init_impa7(void)
 		if (impa7_mtd[i]) {
 			impa7_mtd[i]->owner = THIS_MODULE;
 			devicesfound++;
-			mtd_device_parse_register(impa7_mtd[i], NULL, 0,
+			mtd_device_parse_register(impa7_mtd[i], NULL, NULL,
 						  partitions,
 						  ARRAY_SIZE(partitions));
 		}
diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
index 08c2396..92e1f41 100644
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ b/drivers/mtd/maps/intel_vr_nor.c
@@ -72,7 +72,7 @@ static int __devinit vr_nor_init_partitions(struct vr_nor_mtd *p)
 {
 	/* register the flash bank */
 	/* partition the flash bank */
-	return mtd_device_parse_register(p->info, NULL, 0, NULL, 0);
+	return mtd_device_parse_register(p->info, NULL, NULL, NULL, 0);
 }
 
 static void __devexit vr_nor_destroy_mtd_setup(struct vr_nor_mtd *p)
diff --git a/drivers/mtd/maps/ixp2000.c b/drivers/mtd/maps/ixp2000.c
index fc7d4d0..4a41ced 100644
--- a/drivers/mtd/maps/ixp2000.c
+++ b/drivers/mtd/maps/ixp2000.c
@@ -226,7 +226,7 @@ static int ixp2000_flash_probe(struct platform_device *dev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-	err = mtd_device_parse_register(info->mtd, probes, 0, NULL, 0);
+	err = mtd_device_parse_register(info->mtd, probes, NULL, NULL, 0);
 	if (err)
 		goto Error;
 
diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index cf7a3cd..b5401e3 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -169,8 +169,9 @@ ltq_mtd_probe(struct platform_device *pdev)
 	cfi->addr_unlock1 ^= 1;
 	cfi->addr_unlock2 ^= 1;
 
-	err = mtd_device_parse_register(ltq_mtd->mtd, ltq_probe_types, 0,
-			ltq_mtd_data->parts, ltq_mtd_data->nr_parts);
+	err = mtd_device_parse_register(ltq_mtd->mtd, ltq_probe_types, NULL,
+					ltq_mtd_data->parts,
+					ltq_mtd_data->nr_parts);
 	if (err) {
 		dev_err(&pdev->dev, "failed to add partitions\n");
 		goto err_destroy;
diff --git a/drivers/mtd/maps/latch-addr-flash.c b/drivers/mtd/maps/latch-addr-flash.c
index 8fed58e..3c7ad17 100644
--- a/drivers/mtd/maps/latch-addr-flash.c
+++ b/drivers/mtd/maps/latch-addr-flash.c
@@ -199,8 +199,9 @@ static int __devinit latch_addr_flash_probe(struct platform_device *dev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-	mtd_device_parse_register(info->mtd, NULL, 0,
-			latch_addr_data->parts, latch_addr_data->nr_parts);
+	mtd_device_parse_register(info->mtd, NULL, NULL,
+				  latch_addr_data->parts,
+				  latch_addr_data->nr_parts);
 	return 0;
 
 iounmap:
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 7e9233c..21b0b71 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -192,7 +192,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 
 	part_types = physmap_data->part_probe_types ? : part_probe_types;
 
-	mtd_device_parse_register(info->cmtd, part_types, 0,
+	mtd_device_parse_register(info->cmtd, part_types, NULL,
 				  physmap_data->parts, physmap_data->nr_parts);
 	return 0;
 
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 45876d0..891558d 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -222,8 +222,9 @@ static int platram_probe(struct platform_device *pdev)
 	/* check to see if there are any available partitions, or wether
 	 * to add this device whole */
 
-	err = mtd_device_parse_register(info->mtd, pdata->probes, 0,
-			pdata->partitions, pdata->nr_partitions);
+	err = mtd_device_parse_register(info->mtd, pdata->probes, NULL,
+					pdata->partitions,
+					pdata->nr_partitions);
 	if (!err)
 		dev_info(&pdev->dev, "registered mtd device\n");
 
diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 436d121..81884c2 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -98,7 +98,8 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-	mtd_device_parse_register(info->mtd, probes, 0, flash->parts, flash->nr_parts);
+	mtd_device_parse_register(info->mtd, probes, NULL, flash->parts,
+				  flash->nr_parts);
 
 	platform_set_drvdata(pdev, info);
 	return 0;
diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 3da63fc..6f52e1f 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -102,8 +102,8 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
 	info->mtd->owner = THIS_MODULE;
 	if (err)
 		goto err_out;
-	err = mtd_device_parse_register(info->mtd, NULL, 0,
-			pdata->parts, pdata->nr_parts);
+	err = mtd_device_parse_register(info->mtd, NULL, NULL, pdata->parts,
+					pdata->nr_parts);
 
 	if (err)
 		goto err_out;
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 1eaf7b6..a675bdb 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -264,8 +264,8 @@ static int __devinit sa1100_mtd_probe(struct platform_device *pdev)
 	/*
 	 * Partition selection stuff.
 	 */
-	mtd_device_parse_register(info->mtd, part_probes, 0,
-			plat->parts, plat->nr_parts);
+	mtd_device_parse_register(info->mtd, part_probes, NULL, plat->parts,
+				  plat->nr_parts);
 
 	platform_set_drvdata(pdev, info);
 	err = 0;
diff --git a/drivers/mtd/maps/solutionengine.c b/drivers/mtd/maps/solutionengine.c
index 496c407..9d900ad 100644
--- a/drivers/mtd/maps/solutionengine.c
+++ b/drivers/mtd/maps/solutionengine.c
@@ -92,8 +92,8 @@ static int __init init_soleng_maps(void)
 		mtd_device_register(eprom_mtd, NULL, 0);
 	}
 
-	mtd_device_parse_register(flash_mtd, probes, 0,
-			superh_se_partitions, NUM_PARTITIONS);
+	mtd_device_parse_register(flash_mtd, probes, NULL,
+				  superh_se_partitions, NUM_PARTITIONS);
 
 	return 0;
 }
diff --git a/drivers/mtd/maps/wr_sbc82xx_flash.c b/drivers/mtd/maps/wr_sbc82xx_flash.c
index aa7e0cb..71b0ba7 100644
--- a/drivers/mtd/maps/wr_sbc82xx_flash.c
+++ b/drivers/mtd/maps/wr_sbc82xx_flash.c
@@ -142,7 +142,7 @@ static int __init init_sbc82xx_flash(void)
 			nr_parts = ARRAY_SIZE(smallflash_parts);
 		}
 
-		mtd_device_parse_register(sbcmtd[i], part_probes, 0,
+		mtd_device_parse_register(sbcmtd[i], part_probes, NULL,
 					  defparts, nr_parts);
 	}
 	return 0;
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 35b4fb5..7769519 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -650,8 +650,8 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	}
 
 	mtd->name = "atmel_nand";
-	res = mtd_device_parse_register(mtd, NULL, 0,
-			host->board->parts, host->board->num_parts);
+	res = mtd_device_parse_register(mtd, NULL, NULL, host->board->parts,
+					host->board->num_parts);
 	if (!res)
 		return res;
 
diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index 50387fd..ee81b63 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -488,7 +488,7 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 
 	/* Register the partitions */
 	board_mtd->name = "bcm_umi-nand";
-	mtd_device_parse_register(board_mtd, NULL, 0, NULL, 0);
+	mtd_device_parse_register(board_mtd, NULL, NULL, NULL, 0);
 
 	/* Return happy */
 	return 0;
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 72d3f23..c23c07c 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -799,7 +799,7 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	mtd_device_parse_register(mtd, part_probes, 0, NULL, 0);
+	mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
 
 	goto out;
 
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 737ef9a..1024bfc 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -219,7 +219,7 @@ static int __init cmx270_init(void)
 	}
 
 	/* Register the partitions */
-	ret = mtd_device_parse_register(cmx270_nand_mtd, NULL, 0,
+	ret = mtd_device_parse_register(cmx270_nand_mtd, NULL, NULL,
 					partition_info, NUM_PARTITIONS);
 	if (ret)
 		goto err_scan;
diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index 414afa7..e2b7c9e 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -313,7 +313,7 @@ static int __init cs553x_init(void)
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		if (cs553x_mtd[i]) {
 			/* If any devices registered, return success. Else the last error. */
-			mtd_device_parse_register(cs553x_mtd[i], NULL, 0,
+			mtd_device_parse_register(cs553x_mtd[i], NULL, NULL,
 						  NULL, 0);
 			err = 0;
 		}
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 6e56615..b81afc7 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -752,8 +752,8 @@ syndrome_done:
 	if (ret < 0)
 		goto err_scan;
 
-	ret = mtd_device_parse_register(&info->mtd, NULL, 0,
-			pdata->parts, pdata->nr_parts);
+	ret = mtd_device_parse_register(&info->mtd, NULL, NULL, pdata->parts,
+					pdata->nr_parts);
 
 	if (ret < 0)
 		goto err_scan;
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 4a018d0..341086c 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -940,13 +940,13 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * Check for partition info passed
 	 */
 	host->mtd.name = "nand";
-	ret = mtd_device_parse_register(&host->mtd, NULL, 0,
-			host->mtd.size <= 0x04000000 ?
-				partition_info_16KB_blk :
-				partition_info_128KB_blk,
-			host->mtd.size <= 0x04000000 ?
-				ARRAY_SIZE(partition_info_16KB_blk) :
-				ARRAY_SIZE(partition_info_128KB_blk));
+	ret = mtd_device_parse_register(&host->mtd, NULL, NULL,
+					host->mtd.size <= 0x04000000 ?
+					partition_info_16KB_blk :
+					partition_info_128KB_blk,
+					host->mtd.size <= 0x04000000 ?
+					ARRAY_SIZE(partition_info_16KB_blk) :
+					ARRAY_SIZE(partition_info_128KB_blk));
 	if (ret)
 		goto err_probe;
 
diff --git a/drivers/mtd/nand/h1910.c b/drivers/mtd/nand/h1910.c
index 5dc6f0d..11e4878 100644
--- a/drivers/mtd/nand/h1910.c
+++ b/drivers/mtd/nand/h1910.c
@@ -135,8 +135,8 @@ static int __init h1910_init(void)
 	}
 
 	/* Register the partitions */
-	mtd_device_parse_register(h1910_nand_mtd, NULL, 0,
-			partition_info, NUM_PARTITIONS);
+	mtd_device_parse_register(h1910_nand_mtd, NULL, NULL, partition_info,
+				  NUM_PARTITIONS);
 
 	/* Return happy */
 	return 0;
diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index ac3b9f2..cc50e35 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -367,9 +367,9 @@ static int __devinit jz_nand_probe(struct platform_device *pdev)
 		goto err_gpio_free;
 	}
 
-	ret = mtd_device_parse_register(mtd, NULL, 0,
-			pdata ? pdata->partitions : NULL,
-			pdata ? pdata->num_partitions : 0);
+	ret = mtd_device_parse_register(mtd, NULL, NULL,
+					pdata ? pdata->partitions : NULL,
+					pdata ? pdata->num_partitions : 0);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add mtd device\n");
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 74a43b8..3c4c053 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1226,8 +1226,8 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	}
 
 	/* Register the partitions */
-	mtd_device_parse_register(mtd, part_probes, 0,
-			pdata->parts, pdata->nr_parts);
+	mtd_device_parse_register(mtd, part_probes, NULL, pdata->parts,
+				  pdata->nr_parts);
 
 	platform_set_drvdata(pdev, host);
 
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index b3a883e..d2e7a7d 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1101,8 +1101,8 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		goto out_release_mem_region;
 	}
 
-	mtd_device_parse_register(&info->mtd, NULL, 0,
-			pdata->parts, pdata->nr_parts);
+	mtd_device_parse_register(&info->mtd, NULL, NULL, pdata->parts,
+				  pdata->nr_parts);
 
 	platform_set_drvdata(pdev, &info->mtd);
 
diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 29f505a..1d3bfb2 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -129,8 +129,8 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	}
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_parse_register(mtd, NULL, 0,
-			board->parts, board->nr_parts);
+	ret = mtd_device_parse_register(mtd, NULL, NULL, board->parts,
+					board->nr_parts);
 	if (ret) {
 		nand_release(mtd);
 		goto no_dev;
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 7f2da69..6404e6e 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -99,8 +99,9 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	}
 
 	err = mtd_device_parse_register(&data->mtd,
-			pdata->chip.part_probe_types, 0,
-			pdata->chip.partitions, pdata->chip.nr_partitions);
+					pdata->chip.part_probe_types, NULL,
+					pdata->chip.partitions,
+					pdata->chip.nr_partitions);
 
 	if (!err)
 		return err;
diff --git a/drivers/mtd/nand/ppchameleonevb.c b/drivers/mtd/nand/ppchameleonevb.c
index 7e52af5..0ddd90e 100644
--- a/drivers/mtd/nand/ppchameleonevb.c
+++ b/drivers/mtd/nand/ppchameleonevb.c
@@ -275,11 +275,10 @@ static int __init ppchameleonevb_init(void)
 	ppchameleon_mtd->name = "ppchameleon-nand";
 
 	/* Register the partitions */
-	mtd_device_parse_register(ppchameleon_mtd, NULL, 0,
-			ppchameleon_mtd->size == NAND_SMALL_SIZE ?
-				partition_info_me :
-				partition_info_hi,
-			NUM_PARTITIONS);
+	mtd_device_parse_register(ppchameleon_mtd, NULL, NULL,
+				  ppchameleon_mtd->size == NAND_SMALL_SIZE ?
+					partition_info_me : partition_info_hi,
+				  NUM_PARTITIONS);
 
  nand_evb_init:
 	/****************************
@@ -365,11 +364,10 @@ static int __init ppchameleonevb_init(void)
 	ppchameleonevb_mtd->name = NAND_EVB_MTD_NAME;
 
 	/* Register the partitions */
-	mtd_device_parse_register(ppchameleonevb_mtd, NULL, 0,
-			ppchameleon_mtd->size == NAND_SMALL_SIZE ?
-				partition_info_me :
-				partition_info_hi,
-			NUM_PARTITIONS);
+	mtd_device_parse_register(ppchameleonevb_mtd, NULL, NULL,
+				  ppchameleon_mtd->size == NAND_SMALL_SIZE ?
+				  partition_info_me : partition_info_hi,
+				  NUM_PARTITIONS);
 
 	/* Return happy */
 	return 0;
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 5c3d719..d3bdc90 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1228,8 +1228,9 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		ret = mtd_device_parse_register(info->host[cs]->mtd, NULL, 0,
-				pdata->parts[cs], pdata->nr_parts[cs]);
+		ret = mtd_device_parse_register(info->host[cs]->mtd, NULL,
+						NULL, pdata->parts[cs],
+						pdata->nr_parts[cs]);
 		if (!ret)
 			probe_success = 1;
 	}
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 868685d..97623be 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -751,8 +751,8 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 	if (set)
 		mtd->mtd.name = set->name;
 
-	return mtd_device_parse_register(&mtd->mtd, NULL, 0,
-			set->partitions, set->nr_partitions);
+	return mtd_device_parse_register(&mtd->mtd, NULL, NULL,
+					 set->partitions, set->nr_partitions);
 }
 
 /**
diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index b175c0f..2d269a5 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -181,8 +181,8 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	sharpsl->mtd.name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(&sharpsl->mtd, NULL, 0,
-			data->partitions, data->nr_partitions);
+	err = mtd_device_parse_register(&sharpsl->mtd, NULL, NULL,
+					data->partitions, data->nr_partitions);
 	if (err)
 		goto err_add;
 
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 6caa0cd..060848a 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -456,9 +456,9 @@ static int tmio_probe(struct platform_device *dev)
 		goto err_scan;
 	}
 	/* Register the partitions */
-	retval = mtd_device_parse_register(mtd, NULL, 0,
-			data ? data->partition : NULL,
-			data ? data->num_partitions : 0);
+	retval = mtd_device_parse_register(mtd, NULL, NULL,
+					   data ? data->partition : NULL,
+					   data ? data->num_partitions : 0);
 	if (!retval)
 		return retval;
 
diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index c7c4f1d..8db0acb 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -386,7 +386,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_parse_register(mtd, NULL, 0, NULL, 0);
+		mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
 		drvdata->mtds[i] = mtd;
 	}
 
diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index 0ccd5bf..1c4f97c 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -70,9 +70,9 @@ static int __devinit generic_onenand_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
 
-	err = mtd_device_parse_register(&info->mtd, NULL, 0,
-			pdata ? pdata->parts : NULL,
-			pdata ? pdata->nr_parts : 0);
+	err = mtd_device_parse_register(&info->mtd, NULL, NULL,
+					pdata ? pdata->parts : NULL,
+					pdata ? pdata->nr_parts : 0);
 
 	platform_set_drvdata(pdev, info);
 
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 7e9ea68..398a827 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -751,9 +751,9 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
 		goto err_release_regulator;
 
-	r = mtd_device_parse_register(&c->mtd, NULL, 0,
-			pdata ? pdata->parts : NULL,
-			pdata ? pdata->nr_parts : 0);
+	r = mtd_device_parse_register(&c->mtd, NULL, NULL,
+				      pdata ? pdata->parts : NULL,
+				      pdata ? pdata->nr_parts : 0);
 	if (r)
 		goto err_release_onenand;
 
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index deaf762..8e4b3f2 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -1014,7 +1014,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	if (s3c_read_reg(MEM_CFG_OFFSET) & ONENAND_SYS_CFG1_SYNC_READ)
 		dev_info(&onenand->pdev->dev, "OneNAND Sync. Burst Read enabled\n");
 
-	err = mtd_device_parse_register(mtd, NULL, 0,
+	err = mtd_device_parse_register(mtd, NULL, NULL,
 					pdata ? pdata->parts : NULL,
 					pdata ? pdata->nr_parts : 0);
 
-- 
1.7.9.1
