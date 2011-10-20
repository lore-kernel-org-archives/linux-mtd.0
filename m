Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGw2R-0000De-4O
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 17:04:17 +0000
Received: by wyg8 with SMTP id 8so3810525wyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 10:04:13 -0700 (PDT)
Sender: Ivan Djelic <ivantchek@gmail.com>
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Kumar Goutam <goutam.kumar@ti.com>
Subject: RE: ubifs not working with 3.1 kernel and MT29F2G08ABAEAWP NAND Flash.
Date: Thu, 20 Oct 2011 19:03:54 +0200
Message-Id: <82bccc55360cac040ef64cba90cdd1cb38a5ae7f.1319102326.git.ivan.djelic@parrot.com>
In-Reply-To: <0680EC522D0CC943BC586913CF3768C00590504990@dbde02.ent.ti.com>
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Goutam,

Sorry, I just realized you had a ti.com address...

Anyway, here is a patch for OMAP3630 that:
- depends on the BCH library (easily backported to 2.6.35, I have a patch if necessary)
- needs to be cleaned up; among other things, omap3_bch_* functions should be moved to a separate file

It works pretty well on our boards, and may require modification to work on
am335x (which indeed has bch 4/8 bit correction).

A few months ago, a patch was submitted by Sukumar Ghorai to add BCH ecc
support (before the BCH library was added); I don't know what happened to his
patches. I'm still willing to submit a cleaned up patch if you point me to the
right tree.

BR,
Ivan

---
 drivers/mtd/nand/Kconfig |   29 ++++
 drivers/mtd/nand/omap2.c |  328 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 357 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 391ccf6..c853e8c 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -129,6 +129,35 @@ config MTD_NAND_OMAP_PREFETCH_DMA
 	 or in DMA interrupt mode.
 	 Say y for DMA mode or MPU mode will be used
 
+config MTD_NAND_OMAP_BCH
+	depends on MTD_NAND && MTD_NAND_OMAP2 && ARCH_OMAP3
+	bool "Enable hardware BCH error correction"
+	default n
+	select BCH
+	select BCH_CONST_PARAMS
+	help
+	 Support for hardware BCH error correction.
+
+choice
+	depends on MTD_NAND_OMAP_BCH
+	prompt "BCH error correction capability"
+
+config MTD_NAND_OMAP_BCH_4
+	bool "4 bits / 512 bytes"
+
+config MTD_NAND_OMAP_BCH_8
+	bool "8 bits / 512 bytes"
+
+endchoice
+
+if MTD_NAND_OMAP_BCH
+config BCH_CONST_M
+	default 13
+config BCH_CONST_T
+	default 4 if MTD_NAND_OMAP_BCH_4
+	default 8 if MTD_NAND_OMAP_BCH_8
+endif
+
 config MTD_NAND_RICOH
 	tristate "Ricoh xD card reader"
 	default n
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 553afb8..479b762 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -28,6 +28,7 @@
 #define GPMC_ECC_CONTROL	0x1F8
 #define GPMC_ECC_SIZE_CONFIG	0x1FC
 #define GPMC_ECC1_RESULT	0x200
+#define GPMC_ECC_BCH_RESULT_0   0x240
 
 #define	DRIVER_NAME	"omap2-nand"
 
@@ -129,6 +130,13 @@ const int use_prefetch;
 static const int use_dma;
 #endif
 
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
+#include <linux/bch.h>
+struct bch_control;
+int omap3_bch_init(struct mtd_info *mtd, int max_errors, int error_threshold);
+void omap3_bch_free(struct mtd_info *mtd);
+#endif
+
 struct omap_nand_info {
 	struct nand_hw_control		controller;
 	struct omap_nand_platform_data	*pdata;
@@ -144,6 +152,12 @@ struct omap_nand_info {
 	void __iomem			*nand_pref_fifo_add;
 	struct completion		comp;
 	int				dma_ch;
+
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
+	struct bch_control             *bch;
+	struct nand_ecclayout           ecclayout;
+	int                             error_threshold;
+#endif
 };
 
 static struct nand_ecclayout nand_x8_hw_romcode_oob_64 = {
@@ -880,6 +894,7 @@ static int omap_wait(struct mtd_info *mtd, struct nand_chip *chip)
 			break;
 		cond_resched();
 	}
+	status = __raw_readb(this->IO_ADDR_R);
 	return status;
 }
 
@@ -1030,6 +1045,21 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		info->nand.ecc.mode             = NAND_ECC_HW;
 		/* init HW ECC */
 		omap_hwecc_init(&info->mtd);
+		/* FIXME: use ecc_opt to configure bch correction */
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
+		{
+#ifdef CONFIG_MTD_NAND_OMAP_BCH_8
+			const int max_errors = 8, error_threshold = 3;
+#else
+			const int max_errors = 4, error_threshold = 2;
+#endif
+			if (omap3_bch_init(&info->mtd, max_errors,
+					   error_threshold)) {
+				err = -ENOMEM;
+				goto out_release_mem_region;
+			}
+		}
+#endif
 	} else {
 		info->nand.ecc.mode = NAND_ECC_SOFT;
 	}
@@ -1078,6 +1108,10 @@ static int omap_nand_remove(struct platform_device *pdev)
 	if (use_dma)
 		omap_free_dma(info->dma_ch);
 
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
+	omap3_bch_free(&info->mtd);
+#endif
+
 	/* Release NAND device, its internal structures and partitions */
 	nand_release(&info->mtd);
 	iounmap(info->nand_pref_fifo_add);
@@ -1117,6 +1151,300 @@ static void __exit omap_nand_exit(void)
 module_init(omap_nand_init);
 module_exit(omap_nand_exit);
 
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
+
+/*
+ * OMAP3 hardware BCH ecc correction (4 or 8 bits)
+ *
+ * Copyright 2011 Ivan Djelic <ivan.djelic@parrot.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#define ECC_MAX_CORRECTION      8
+
+/**
+ * omap_hwecc_init - Initialize the HW ECC for NAND flash in GPMC controller
+ * @mtd: MTD device structure
+ */
+static void omap3_bch_hwecc_init(struct mtd_info *mtd)
+{
+	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+						   mtd);
+	/* clear all ECC | enable Reg1 */
+	__raw_writel(0x101, info->gpmc_baseaddr + GPMC_ECC_CONTROL);
+}
+
+/**
+ * omap3_bch_calculate_ecc8 - Generate 13 ecc bytes per block of 512 data bytes
+ * @mtd: MTD device structure
+ * @dat: The pointer to data on which ecc is computed
+ * @ecc: The ecc output buffer
+ */
+static int omap3_bch_calculate_ecc8(struct mtd_info *mtd, const u_char *dat,
+				    u_char *ecc)
+{
+	int i;
+	unsigned long reg, val1, val2, val3, val4;
+	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+						   mtd);
+
+	for (i = 0; i < info->nand.ecc.size/512; i++) {
+
+		reg = (unsigned long)(info->gpmc_baseaddr +
+				      GPMC_ECC_BCH_RESULT_0 + (0x10 * i));
+
+		/* read hw-computed remainder */
+		val1 = __raw_readl(reg);
+		val2 = __raw_readl(reg + 4);
+		val3 = __raw_readl(reg + 8);
+		val4 = __raw_readl(reg + 12);
+
+		/* get ecc and apply empty-page inversion mask */
+		*ecc++ = 0xef ^ (val4 & 0xFF);
+		*ecc++ = 0x51 ^ ((val3 >> 24) & 0xFF);
+		*ecc++ = 0x2e ^ ((val3 >> 16) & 0xFF);
+		*ecc++ = 0x09 ^ ((val3 >> 8) & 0xFF);
+		*ecc++ = 0xed ^ (val3 & 0xFF);
+		*ecc++ = 0x93 ^ ((val2 >> 24) & 0xFF);
+		*ecc++ = 0x9a ^ ((val2 >> 16) & 0xFF);
+		*ecc++ = 0xc2 ^ ((val2 >> 8) & 0xFF);
+		*ecc++ = 0x97 ^ (val2 & 0xFF);
+		*ecc++ = 0x79 ^ ((val1 >> 24) & 0xFF);
+		*ecc++ = 0xe5 ^ ((val1 >> 16) & 0xFF);
+		*ecc++ = 0x24 ^ ((val1 >> 8) & 0xFF);
+		*ecc++ = 0xb5 ^ (val1 & 0xFF);
+	}
+	return 0;
+}
+
+/**
+ * omap3_bch_calculate_ecc4 - Generate 7 ecc bytes per block of 512 data bytes
+ * @mtd: MTD device structure
+ * @dat: The pointer to data on which ecc is computed
+ * @ecc: The ecc output buffer
+ */
+static int omap3_bch_calculate_ecc4(struct mtd_info *mtd, const u_char *dat,
+				    u_char *ecc)
+{
+	int i;
+	unsigned long reg, val1, val2;
+	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+						   mtd);
+
+	for (i = 0; i < info->nand.ecc.size/512; i++) {
+
+		reg = (unsigned long)(info->gpmc_baseaddr +
+				      GPMC_ECC_BCH_RESULT_0 + (0x10 * i));
+
+		/* read hw-computed remainder */
+		val1 = __raw_readl(reg);
+		val2 = __raw_readl(reg + 4);
+
+		/* get left-justified ecc and apply empty-page inversion mask */
+		*ecc++ = 0x28 ^ ((val2 >> 12) & 0xFF);
+		*ecc++ = 0x13 ^ ((val2 >>  4) & 0xFF);
+		*ecc++ = 0xcc ^ (((val2 & 0xF) << 4)|((val1 >> 28) & 0xF));
+		*ecc++ = 0x39 ^ ((val1 >> 20) & 0xFF);
+		*ecc++ = 0x96 ^ ((val1 >> 12) & 0xFF);
+		*ecc++ = 0xac ^ ((val1 >> 4) & 0xFF);
+		*ecc++ = 0x7f ^ ((val1 & 0xF) << 4);
+	}
+	return 0;
+}
+
+static void omap3_bch_correct_block(struct omap_nand_info *info,
+				    u_char *data, u_char *calc_ecc, int *ret)
+{
+	int i, count;
+	unsigned int errloc[ECC_MAX_CORRECTION];
+
+	count = decode_bch(info->bch, NULL, 512, NULL, calc_ecc, NULL, errloc);
+	if (count > 0) {
+		/* correct errors */
+		for (i = 0; i < count; i++) {
+			/* correct data only, not ecc bytes */
+			if (errloc[i] < 8*512)
+				data[errloc[i]/8] ^= 1 << (errloc[i] & 7);
+
+			DEBUG(MTD_DEBUG_LEVEL0, "%s: corrected bitflip %u\n",
+			      __func__, errloc[i]);
+		}
+		/*
+		 * FIXME: in order to prevent upper layers (such as UBI) from
+		 * torturing and marking a block as bad as soon as 1 bitflip
+		 * is persistent, we implement a threshold below which errors
+		 * are corrected but not reported. Instead, mtd should provide
+		 * a generic way to handle this situation.
+		 */
+		if (count < info->error_threshold) {
+			DEBUG(MTD_DEBUG_LEVEL0, "%s: concealing %d errors "
+			      "below threshold of %u\n", __func__, count,
+			      info->error_threshold);
+			count = 0;
+		}
+
+		/* accumulate errors unless a failure occured */
+		if ((*ret) >= 0)
+			(*ret) += count;
+
+	} else if (count < 0) {
+		(*ret) = -1;
+		printk(KERN_ERR "ecc unrecoverable error\n");
+	}
+}
+
+/**
+ * omap3_bch_correct_data - Decode received data and correct errors
+ * @mtd: MTD device structure
+ * @data: page data
+ * @read_ecc: ecc read from nand flash
+ * @calc_ecc: ecc read from HW ECC registers
+ */
+static int omap3_bch_correct_data(struct mtd_info *mtd, u_char *data,
+				  u_char *read_ecc, u_char *calc_ecc)
+{
+	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+						   mtd);
+	int i, j, ret = 0, eccbytes, eccflag, steps;
+
+	steps = info->nand.ecc.size/512;
+	eccbytes = info->nand.ecc.bytes/steps;
+
+	for (i = 0; i < steps; i++) {
+
+		/* compare read and calculated ecc */
+		for (j = 0, eccflag = 0; j < eccbytes; j++) {
+			calc_ecc[j] ^= read_ecc[j];
+			eccflag |= calc_ecc[j];
+		}
+		if (eccflag)
+			/* an error was detected, perform correction */
+			omap3_bch_correct_block(info, data, calc_ecc, &ret);
+
+		calc_ecc += eccbytes;
+		read_ecc += eccbytes;
+		data     += 512;
+	}
+	return ret;
+}
+
+static void omap3_bch_enable_hwecc(struct mtd_info *mtd, int mode)
+{
+	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+						   mtd);
+	register struct nand_chip *chip = mtd->priv;
+	unsigned int dev_width;
+	unsigned int bch_mod, ecc_conf, ecc_size_conf;
+
+	dev_width = (chip->options & NAND_BUSWIDTH_16)? 1 : 0;
+	bch_mod = (info->nand.ecc.bytes == 52)? 1 : 0;
+
+	/* ECCSIZE1=32 | ECCSIZE0=00 */
+	ecc_size_conf = (0x20 << 22) | (0x00 << 12);
+
+	ecc_conf = ((0x01          << 16) | /* BCH */
+		    (bch_mod       << 12) | /* 8 or 4 bits */
+		    (0x06          <<  8) | /* wrap mode = 6 */
+		    (dev_width     <<  7) | /* bus width */
+		    (0x03          <<  4) | /* 4 sectors */
+		    (info->gpmc_cs <<  1) | /* ECC CS */
+		    (0x1));                 /* enable ECC */
+
+	__raw_writel(0x1, info->gpmc_baseaddr + GPMC_ECC_CONTROL);
+	__raw_writel(ecc_size_conf, info->gpmc_baseaddr + GPMC_ECC_SIZE_CONFIG);
+	__raw_writel(ecc_conf, info->gpmc_baseaddr + GPMC_ECC_CONFIG);
+	__raw_writel(0x101, info->gpmc_baseaddr + GPMC_ECC_CONTROL);
+}
+
+
+int omap3_bch_init(struct mtd_info *mtd, int max_errors, int error_threshold)
+{
+	int i, oobsize;
+	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+						   mtd);
+	struct nand_ecclayout *layout = &info->ecclayout;
+
+#ifdef CONFIG_MTD_NAND_OMAP_BCH_8
+	const int hw_errors = 8;
+#else
+	const int hw_errors = 4;
+#endif
+	info->bch = NULL;
+
+	/* sanity check: OMAP3 only supports 4 and 8 bits correction */
+	if (max_errors != hw_errors) {
+		printk(KERN_ERR "unsupported bch correction capability %d\n",
+		       max_errors);
+		goto fail;
+	}
+	info->error_threshold = error_threshold;
+
+	/* configure software bch library, only used for error decoding */
+	info->bch = init_bch(13, max_errors, 0x201b);
+	if (!info->bch)
+		goto fail;
+
+	/* process 2048 bytes at a time */
+	info->nand.ecc.size    = 2048;
+	info->nand.ecc.hwctl   = omap3_bch_enable_hwecc;
+	info->nand.ecc.correct = omap3_bch_correct_data;
+	info->nand.ecc.mode    = NAND_ECC_HW;
+	if (max_errors == 8) {
+		info->nand.ecc.bytes     = 52; /* 4 x 13 bytes */
+		info->nand.ecc.calculate = omap3_bch_calculate_ecc8;
+	} else {
+		info->nand.ecc.bytes     = 28; /* 4 x 7 bytes */
+		info->nand.ecc.calculate = omap3_bch_calculate_ecc4;
+	}
+	/* build oob layout */
+	layout->eccbytes = info->nand.ecc.bytes;
+
+	/* FIXME: ecc configuration is done before nand_scan... */
+	oobsize = mtd->oobsize ? mtd->oobsize : 64;
+
+	/* reserve 2 bytes for bad block marker */
+	if (layout->eccbytes+2 > oobsize) {
+		printk(KERN_WARNING "no suitable oob scheme available "
+		       "for oobsize %d eccbytes %u\n", oobsize,
+		       layout->eccbytes);
+		goto fail;
+	}
+	/* put ecc bytes at oob tail */
+	for (i = 0; i < layout->eccbytes; i++)
+		layout->eccpos[i] = oobsize-layout->eccbytes+i;
+
+	layout->oobfree[0].offset = 2;
+	layout->oobfree[0].length = oobsize-2-layout->eccbytes;
+	info->nand.ecc.layout = layout;
+
+	if (!(info->nand.options & NAND_BUSWIDTH_16))
+		info->nand.badblock_pattern = &bb_descrip_flashbased;
+
+	printk(KERN_INFO "enabling hardware nand bch ecc, %d errors max, "
+	       "threshold %d\n", max_errors, error_threshold);
+
+	omap3_bch_hwecc_init(mtd);
+	return 0;
+fail:
+	omap3_bch_free(mtd);
+	return -1;
+}
+
+void omap3_bch_free(struct mtd_info *mtd)
+{
+	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+						   mtd);
+	if (info->bch) {
+		free_bch(info->bch);
+		info->bch = NULL;
+	}
+}
+
+#endif /* CONFIG_MTD_NAND_OMAP_BCH */
+
 MODULE_ALIAS(DRIVER_NAME);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Glue layer for NAND flash on TI OMAP boards");
-- 
1.7.5.1
