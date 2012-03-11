Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S6rAB-0005VV-P7
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2012 22:22:52 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] MTD: flash drivers set ecc strength
Date: Sun, 11 Mar 2012 14:21:11 -0700
Message-Id: <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
Cc: Ivan Djelic <ivan.djelic@parrot.com>, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Flash device drivers initialize 'ecc_strength' in struct mtd_info, which is the
maximum number of bit errors that can be corrected in one writesize region.

Drivers using the nand interface intitialize 'strength' in struct nand_ecc_ctrl,
which is the maximum number of bit errors that can be corrected in one ecc step.
Nand infrastructure code translates this to 'ecc_strength'.

Also for nand drivers, the nand infrastructure code sets ecc.strength for ecc
modes NAND_ECC_SOFT, NAND_ECC_SOFT_BCH, and NAND_ECC_NONE.  It is set in the
driver for all other modes.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

With a couple exceptions, I'm fairly confident that these values are correct,
but if you can confirm, an ACK would be greatly appreciated!  Note that an
incorrect value will not cause a regression unless the value is overstated.

The exceptions are:

  bcm_umi_nand.c: implements bch in hw; Galois field order not indicated
  jz4740_nand.c: implements r-s in hw; generator polynomial order not indicated

These are given conservative guesses based on the information gleaned from the
code.

 drivers/mtd/devices/doc2000.c      |    1 +
 drivers/mtd/devices/doc2001.c      |    1 +
 drivers/mtd/devices/doc2001plus.c  |    1 +
 drivers/mtd/devices/docg3.c        |    1 +
 drivers/mtd/mtdpart.c              |    1 +
 drivers/mtd/nand/alauda.c          |    1 +
 drivers/mtd/nand/atmel_nand.c      |    1 +
 drivers/mtd/nand/bcm_umi_nand.c    |    8 ++++++++
 drivers/mtd/nand/bf5xx_nand.c      |    2 ++
 drivers/mtd/nand/cafe_nand.c       |    1 +
 drivers/mtd/nand/cs553x_nand.c     |    2 ++
 drivers/mtd/nand/davinci_nand.c    |    1 +
 drivers/mtd/nand/denali.c          |    3 +++
 drivers/mtd/nand/diskonchip.c      |    1 +
 drivers/mtd/nand/docg4.c           |    1 +
 drivers/mtd/nand/fsl_elbc_nand.c   |    6 ++++++
 drivers/mtd/nand/fsmc_nand.c       |    2 ++
 drivers/mtd/nand/jz4740_nand.c     |    5 +++++
 drivers/mtd/nand/mxc_nand.c        |    7 +++++++
 drivers/mtd/nand/nand_base.c       |    7 ++++++-
 drivers/mtd/nand/ndfc.c            |    1 +
 drivers/mtd/nand/omap2.c           |    1 +
 drivers/mtd/nand/pxa3xx_nand.c     |    1 +
 drivers/mtd/nand/r852.c            |    1 +
 drivers/mtd/nand/rtc_from4.c       |    1 +
 drivers/mtd/nand/s3c2410.c         |    1 +
 drivers/mtd/nand/sh_flctl.c        |    1 +
 drivers/mtd/nand/sharpsl.c         |    1 +
 drivers/mtd/nand/tmio_nand.c       |    1 +
 drivers/mtd/nand/txx9ndfmc.c       |    1 +
 drivers/mtd/onenand/onenand_base.c |    1 +
 31 files changed, 63 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index 7ad7b05..a4eb8b5 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -564,6 +564,7 @@ void DoC2k_init(struct mtd_info *mtd)
 	mtd->flags = MTD_CAP_NANDFLASH;
 	mtd->writebufsize = mtd->writesize = 512;
 	mtd->oobsize = 16;
+	mtd->ecc_strength = 2;
 	mtd->owner = THIS_MODULE;
 	mtd->_erase = doc_erase;
 	mtd->_read = doc_read;
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index 7bff54e..f692795 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -348,6 +348,7 @@ void DoCMil_init(struct mtd_info *mtd)
 	mtd->erasesize = 0x2000;
 	mtd->writebufsize = mtd->writesize = 512;
 	mtd->oobsize = 16;
+	mtd->ecc_strength = 2;
 	mtd->owner = THIS_MODULE;
 	mtd->_erase = doc_erase;
 	mtd->_read = doc_read;
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 4a03d86..04eb2e4 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -469,6 +469,7 @@ void DoCMilPlus_init(struct mtd_info *mtd)
 	mtd->flags = MTD_CAP_NANDFLASH;
 	mtd->writebufsize = mtd->writesize = 512;
 	mtd->oobsize = 16;
+	mtd->ecc_strength = 2;
 	mtd->owner = THIS_MODULE;
 	mtd->_erase = doc_erase;
 	mtd->_read = doc_read;
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 3eafef3..886ca0f 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1827,6 +1827,7 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 	mtd->_write_oob = doc_write_oob;
 	mtd->_block_isbad = doc_block_isbad;
 	mtd->ecclayout = &docg3_oobinfo;
+	mtd->ecc_strength = DOC_ECC_BCH_T;
 }
 
 /**
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 226d28a..9651c06 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -516,6 +516,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	}
 
 	slave->mtd.ecclayout = master->ecclayout;
+	slave->mtd.ecc_strength = master->ecc_strength;
 	if (master->_block_isbad) {
 		uint64_t offs = 0;
 
diff --git a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
index ac38f73..4f20e1d 100644
--- a/drivers/mtd/nand/alauda.c
+++ b/drivers/mtd/nand/alauda.c
@@ -591,6 +591,7 @@ static int alauda_init_media(struct alauda *al)
 	mtd->_block_isbad = alauda_isbad;
 	mtd->priv = al;
 	mtd->owner = THIS_MODULE;
+	mtd->ecc_strength = 1;
 
 	err = mtd_device_register(mtd, NULL, 0);
 	if (err) {
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 7769519..662abf0 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -554,6 +554,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		nand_chip->ecc.hwctl = atmel_nand_hwctl;
 		nand_chip->ecc.read_page = atmel_nand_read_page;
 		nand_chip->ecc.bytes = 4;
+		nand_chip->ecc.strength = 1;
 	}
 
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index ee81b63..fc60043 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -476,6 +476,14 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 			largepage_bbt.options = NAND_BBT_SCAN2NDPAGE;
 		this->badblock_pattern = &largepage_bbt;
 	}
+
+	/*
+	 * FIXME: ecc strength value of 6 bits per 512 bytes of data is a
+	 * conservative guess, given 13 ecc bytes and using bch alg.
+	 * (Assume Galois field order m=15 to allow a margin of error.)
+	 */
+	this->ecc.strength = 6;
+
 #endif
 
 	/* Now finish off the scan, now that ecc.layout has been initialized. */
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index dd899cb..d7b86b9 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -702,9 +702,11 @@ static int bf5xx_nand_scan(struct mtd_info *mtd)
 		if (likely(mtd->writesize >= 512)) {
 			chip->ecc.size = 512;
 			chip->ecc.bytes = 6;
+			chip->ecc.strength = 2;
 		} else {
 			chip->ecc.size = 256;
 			chip->ecc.bytes = 3;
+			chip->ecc.strength = 1;
 			bfin_write_NFC_CTL(bfin_read_NFC_CTL() & ~(1 << NFC_PG_SIZE_OFFSET));
 			SSYNC();
 		}
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index c23c07c..2a96e1a 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -783,6 +783,7 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 	cafe->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
 	cafe->nand.ecc.size = mtd->writesize;
 	cafe->nand.ecc.bytes = 14;
+	cafe->nand.ecc.strength = 4;
 	cafe->nand.ecc.hwctl  = (void *)cafe_nand_bug;
 	cafe->nand.ecc.calculate = (void *)cafe_nand_bug;
 	cafe->nand.ecc.correct  = (void *)cafe_nand_bug;
diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index e2b7c9e..821c34c 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -248,6 +248,8 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 		goto out_ior;
 	}
 
+	this->ecc.strength = 1;
+
 	new_mtd->name = kasprintf(GFP_KERNEL, "cs553x_nand_cs%d", cs);
 
 	cs553x_mtd[cs] = new_mtd;
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index b81afc7..d94b03c 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -641,6 +641,7 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 			info->chip.ecc.bytes = 3;
 		}
 		info->chip.ecc.size = 512;
+		info->chip.ecc.strength = pdata->ecc_bits;
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3984d48..a9e57d6 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1590,6 +1590,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 			ECC_15BITS * (denali->mtd.writesize /
 			ECC_SECTOR_SIZE)))) {
 		/* if MLC OOB size is large enough, use 15bit ECC*/
+		denali->nand.ecc.strength = 15;
 		denali->nand.ecc.layout = &nand_15bit_oob;
 		denali->nand.ecc.bytes = ECC_15BITS;
 		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
@@ -1600,12 +1601,14 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 				" contain 8bit ECC correction codes");
 		goto failed_req_irq;
 	} else {
+		denali->nand.ecc.strength = 8;
 		denali->nand.ecc.layout = &nand_8bit_oob;
 		denali->nand.ecc.bytes = ECC_8BITS;
 		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
 	}
 
 	denali->nand.ecc.bytes *= denali->devnum;
+	denali->nand.ecc.strength *= denali->devnum;
 	denali->nand.ecc.layout->eccbytes *=
 		denali->mtd.writesize / ECC_SECTOR_SIZE;
 	denali->nand.ecc.layout->oobfree[0].offset =
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index df921e7..e2ca067 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1653,6 +1653,7 @@ static int __init doc_probe(unsigned long physadr)
 	nand->ecc.mode		= NAND_ECC_HW_SYNDROME;
 	nand->ecc.size		= 512;
 	nand->ecc.bytes		= 6;
+	nand->ecc.strength	= 2;
 	nand->bbt_options	= NAND_BBT_USE_FLASH;
 
 	doc->physadr		= physadr;
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 8a0d7f6..a970574 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1193,6 +1193,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	nand->ecc.size = DOCG4_PAGE_SIZE;
 	nand->ecc.prepad = 8;
 	nand->ecc.bytes	= 8;
+	nand->ecc.strength = DOCG4_T;
 	nand->options =
 		NAND_BUSWIDTH_16 | NAND_NO_SUBPAGE_WRITE | NAND_NO_AUTOINCR;
 	nand->IO_ADDR_R = nand->IO_ADDR_W = doc->virtadr + DOC_IOSPACE_DATA;
diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 7195ee6..80b5264 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -813,6 +813,12 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 				&fsl_elbc_oob_sp_eccm1 : &fsl_elbc_oob_sp_eccm0;
 		chip->ecc.size = 512;
 		chip->ecc.bytes = 3;
+		chip->ecc.strength = 1;
+		/*
+		 * FIXME: can hardware ecc correct 4 bitflips if page size is
+		 * 2k?  Then does hardware report number of corrections for this
+		 * case?  If so, ecc_stats reporting needs to be fixed as well.
+		 */
 	} else {
 		/* otherwise fall back to default software ECC */
 		chip->ecc.mode = NAND_ECC_SOFT;
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 341086c..588e373 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -863,10 +863,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->ecc.calculate = fsmc_read_hwecc_ecc4;
 		nand->ecc.correct = fsmc_bch8_correct_data;
 		nand->ecc.bytes = 13;
+		nand->ecc.strength = 8;
 	} else {
 		nand->ecc.calculate = fsmc_read_hwecc_ecc1;
 		nand->ecc.correct = nand_correct_data;
 		nand->ecc.bytes = 3;
+		nand->ecc.strength = 1;
 	}
 
 	/*
diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index cc50e35..e4147e8 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -332,6 +332,11 @@ static int __devinit jz_nand_probe(struct platform_device *pdev)
 	chip->ecc.mode		= NAND_ECC_HW_OOB_FIRST;
 	chip->ecc.size		= 512;
 	chip->ecc.bytes		= 9;
+	chip->ecc.strength	= 2;
+	/*
+	 * FIXME: ecc_strength value of 2 bits per 512 bytes of data is a
+	 * conservative guess, given 9 ecc bytes and reed-solomon alg.
+	 */
 
 	if (pdata)
 		chip->ecc.layout = pdata->ecc_layout;
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 3c4c053..cc0678a 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1225,6 +1225,13 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 	}
 
+	if (this->ecc.mode == NAND_ECC_HW) {
+		if (nfc_is_v1())
+			this->ecc.strength = 1;
+		else
+			this->ecc.strength = (host->eccsize == 4) ? 4 : 8;
+	}
+
 	/* Register the partitions */
 	mtd_device_parse_register(mtd, part_probes, NULL, pdata->parts,
 				  pdata->nr_parts);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 1e907dc..8008853 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3350,6 +3350,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		if (!chip->ecc.size)
 			chip->ecc.size = 256;
 		chip->ecc.bytes = 3;
+		chip->ecc.strength = 1;
 		break;
 
 	case NAND_ECC_SOFT_BCH:
@@ -3384,6 +3385,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 			pr_warn("BCH ECC initialization failed!\n");
 			BUG();
 		}
+		chip->ecc.strength =
+			chip->ecc.bytes*8 / fls(8*chip->ecc.size);
 		break;
 
 	case NAND_ECC_NONE:
@@ -3397,6 +3400,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		chip->ecc.write_oob = nand_write_oob_std;
 		chip->ecc.size = mtd->writesize;
 		chip->ecc.bytes = 0;
+		chip->ecc.strength = 0;
 		break;
 
 	default:
@@ -3478,8 +3482,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->_block_markbad = nand_block_markbad;
 	mtd->writebufsize = mtd->writesize;
 
-	/* propagate ecc.layout to mtd_info */
+	/* propagate ecc info to mtd_info */
 	mtd->ecclayout = chip->ecc.layout;
+	mtd->ecc_strength = chip->ecc.strength * chip->ecc.steps;
 
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index ec68854..2b6f632 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -179,6 +179,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	chip->ecc.mode = NAND_ECC_HW;
 	chip->ecc.size = 256;
 	chip->ecc.bytes = 3;
+	chip->ecc.strength = 1;
 	chip->priv = ndfc;
 
 	ndfc->mtd.priv = chip;
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index d2e7a7d..c2b0bba 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1058,6 +1058,7 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		(pdata->ecc_opt == OMAP_ECC_HAMMING_CODE_HW_ROMCODE)) {
 		info->nand.ecc.bytes            = 3;
 		info->nand.ecc.size             = 512;
+		info->nand.ecc.strength         = 1;
 		info->nand.ecc.calculate        = omap_calculate_ecc;
 		info->nand.ecc.hwctl            = omap_enable_hwecc;
 		info->nand.ecc.correct          = omap_correct_data;
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index d3bdc90..def50ca 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1002,6 +1002,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 KEEP_CONFIG:
 	chip->ecc.mode = NAND_ECC_HW;
 	chip->ecc.size = host->page_size;
+	chip->ecc.strength = 1;
 
 	chip->options = NAND_NO_AUTOINCR;
 	chip->options |= NAND_NO_READRDY;
diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 769a4e0..c204018 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -891,6 +891,7 @@ int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	chip->ecc.mode = NAND_ECC_HW_SYNDROME;
 	chip->ecc.size = R852_DMA_LEN;
 	chip->ecc.bytes = SM_OOB_SIZE;
+	chip->ecc.strength = 2;
 	chip->ecc.hwctl = r852_ecc_hwctl;
 	chip->ecc.calculate = r852_ecc_calculate;
 	chip->ecc.correct = r852_ecc_correct;
diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index f309add..e55b5cf 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -527,6 +527,7 @@ static int __init rtc_from4_init(void)
 	this->ecc.mode = NAND_ECC_HW_SYNDROME;
 	this->ecc.size = 512;
 	this->ecc.bytes = 8;
+	this->ecc.strength = 3;
 	/* return the status of extra status and ECC checks */
 	this->errstat = rtc_from4_errstat;
 	/* set the nand_oobinfo to support FPGA H/W error detection */
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 97623be..91121f3 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -823,6 +823,7 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 		chip->ecc.calculate = s3c2410_nand_calculate_ecc;
 		chip->ecc.correct   = s3c2410_nand_correct_data;
 		chip->ecc.mode	    = NAND_ECC_HW;
+		chip->ecc.strength  = 1;
 
 		switch (info->cpu_type) {
 		case TYPE_S3C2410:
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index d0f1f3c..47154f5 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -798,6 +798,7 @@ static int flctl_chip_init_tail(struct mtd_info *mtd)
 
 		chip->ecc.size = 512;
 		chip->ecc.bytes = 10;
+		chip->ecc.strength = 4;
 		chip->ecc.read_page = flctl_read_page_hwecc;
 		chip->ecc.write_page = flctl_write_page_hwecc;
 		chip->ecc.mode = NAND_ECC_HW;
diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 2d269a5..3421e37 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -167,6 +167,7 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	this->ecc.mode = NAND_ECC_HW;
 	this->ecc.size = 256;
 	this->ecc.bytes = 3;
+	this->ecc.strength = 1;
 	this->badblock_pattern = data->badblock_pattern;
 	this->ecc.layout = data->ecc_layout;
 	this->ecc.hwctl = sharpsl_nand_enable_hwecc;
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 060848a..5aa5180 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -430,6 +430,7 @@ static int tmio_probe(struct platform_device *dev)
 	nand_chip->ecc.mode = NAND_ECC_HW;
 	nand_chip->ecc.size = 512;
 	nand_chip->ecc.bytes = 6;
+	nand_chip->ecc.strength = 2;
 	nand_chip->ecc.hwctl = tmio_nand_enable_hwecc;
 	nand_chip->ecc.calculate = tmio_nand_calculate_ecc;
 	nand_chip->ecc.correct = tmio_nand_correct_data;
diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 8db0acb..26398dc 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -356,6 +356,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		/* txx9ndfmc_nand_scan will overwrite ecc.size and ecc.bytes */
 		chip->ecc.size = 256;
 		chip->ecc.bytes = 3;
+		chip->ecc.strength = 1;
 		chip->chip_delay = 100;
 		chip->controller = &drvdata->hw_control;
 
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a1592cf..3d781b8 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -4080,6 +4080,7 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	mtd->oobavail = this->ecclayout->oobavail;
 
 	mtd->ecclayout = this->ecclayout;
+	mtd->ecc_strength = 1;
 
 	/* Fill in remaining MTD driver data */
 	mtd->type = ONENAND_IS_MLC(this) ? MTD_MLCNANDFLASH : MTD_NANDFLASH;
-- 
1.7.3.4
