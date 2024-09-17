Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C673FCAC580
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pFgI3jBi2+mMpPJxxKZEgLPbL/T7Bi+LbxVzCb2Spts=; b=uT0jLlW73jGfX6
	G2KDYv1DAYRls6vuCuaa6bgj7EBqvBmb1hR99AF4r/PIzsjnvo00cK7k6kKZe1fuKFAftTlSuGe5c
	Ypv5OCRnacN1qKN2CiMugeeHN+p/VW+AgLrQOt3j+NJKeim7+LU9+4mWDBKe3lB0Vg20mUuPXv2X7
	r/jKb3KP7g24WsDCBTVJJlcW7Z7Eybzv2nRoW4lQT3b3hOG5ti9wpCWBtOJ23qMaiCSaj2Dqs5HOA
	w8vM00c2aMeVECcLJntoW6uo2gBx7JxoriJgmjoqt7v9z40Z6yQCwbDsBil8MLUoS8mYLFvAbDyN7
	2coOYhI8yGmAUsZpqHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZUY-00000006L6A-19k6;
	Tue, 17 Sep 2024 14:47:46 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZUV-00000006L5c-0LOw
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 14:47:44 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1726584453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D2tUHWrlbsrsSeaQbFVGiyfoPkRoLq2KwPhMPJ3F3JU=;
	b=X0nCawQwbGEgDMmhhMD4sukzDsJaEkSWLq7/ZjBOlgl1XJSqJnpJDcRicCxFwHe/Pt9zEN
	JscIr4xZCtAp3Kg1cRWlnKmUyaMXL0QEniR6DvoJ+XIAxCdPll6a6fPbbYlSq0ecRVQiW0
	q1wx1vYhEoaAPE3wZOWDFCZFMUIoVb8=
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] mtd: rawnand: mxc: Remove platform data support
Date: Tue, 17 Sep 2024 17:47:33 +0300
Message-Id: <20240917144733.47815-1-arefev@swemel.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_074743_326174_D4501649 
X-CRM114-Status: GOOD (  25.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Fabio Estevam <festevam@gmail.com>

[ Upstream commit 0f6b791955a6365b5ebe8b6a5b01de69a47ee92e ]

i.MX is a devicetree-only platform now and the existing platform data
support in this driver was only useful for old non-devicetree platforms.

Get rid of the platform data support since it is no longer used.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20201110121908.19400-1-festevam@gmail.com
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/mtd/nand/raw/Kconfig               |  2 +-
 drivers/mtd/nand/raw/mxc_nand.c            | 75 ++--------------------
 include/linux/platform_data/mtd-mxc_nand.h | 19 ------
 3 files changed, 5 insertions(+), 91 deletions(-)
 delete mode 100644 include/linux/platform_data/mtd-mxc_nand.h

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 6c46f25b57e2..58421866bdc3 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -313,7 +313,7 @@ config MTD_NAND_VF610_NFC
 config MTD_NAND_MXC
 	tristate "Freescale MXC NAND controller"
 	depends on ARCH_MXC || COMPILE_TEST
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && OF
 	help
 	  This enables the driver for the NAND flash controller on the
 	  MXC processors.
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 684c51e5e60d..f896364968d8 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -21,7 +21,6 @@
 #include <linux/completion.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/platform_data/mtd-mxc_nand.h>
 
 #define DRIVER_NAME "mxc_nand"
 
@@ -184,7 +183,6 @@ struct mxc_nand_host {
 	unsigned int		buf_start;
 
 	const struct mxc_nand_devtype_data *devtype_data;
-	struct mxc_nand_platform_data pdata;
 };
 
 static const char * const part_probes[] = {
@@ -1611,29 +1609,6 @@ static inline int is_imx53_nfc(struct mxc_nand_host *host)
 	return host->devtype_data == &imx53_nand_devtype_data;
 }
 
-static const struct platform_device_id mxcnd_devtype[] = {
-	{
-		.name = "imx21-nand",
-		.driver_data = (kernel_ulong_t) &imx21_nand_devtype_data,
-	}, {
-		.name = "imx27-nand",
-		.driver_data = (kernel_ulong_t) &imx27_nand_devtype_data,
-	}, {
-		.name = "imx25-nand",
-		.driver_data = (kernel_ulong_t) &imx25_nand_devtype_data,
-	}, {
-		.name = "imx51-nand",
-		.driver_data = (kernel_ulong_t) &imx51_nand_devtype_data,
-	}, {
-		.name = "imx53-nand",
-		.driver_data = (kernel_ulong_t) &imx53_nand_devtype_data,
-	}, {
-		/* sentinel */
-	}
-};
-MODULE_DEVICE_TABLE(platform, mxcnd_devtype);
-
-#ifdef CONFIG_OF
 static const struct of_device_id mxcnd_dt_ids[] = {
 	{
 		.compatible = "fsl,imx21-nand",
@@ -1655,26 +1630,6 @@ static const struct of_device_id mxcnd_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mxcnd_dt_ids);
 
-static int mxcnd_probe_dt(struct mxc_nand_host *host)
-{
-	struct device_node *np = host->dev->of_node;
-	const struct of_device_id *of_id =
-		of_match_device(mxcnd_dt_ids, host->dev);
-
-	if (!np)
-		return 1;
-
-	host->devtype_data = of_id->data;
-
-	return 0;
-}
-#else
-static int mxcnd_probe_dt(struct mxc_nand_host *host)
-{
-	return 1;
-}
-#endif
-
 static int mxcnd_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -1759,6 +1714,7 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
 
 static int mxcnd_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *of_id;
 	struct nand_chip *this;
 	struct mtd_info *mtd;
 	struct mxc_nand_host *host;
@@ -1800,20 +1756,8 @@ static int mxcnd_probe(struct platform_device *pdev)
 	if (IS_ERR(host->clk))
 		return PTR_ERR(host->clk);
 
-	err = mxcnd_probe_dt(host);
-	if (err > 0) {
-		struct mxc_nand_platform_data *pdata =
-					dev_get_platdata(&pdev->dev);
-		if (pdata) {
-			host->pdata = *pdata;
-			host->devtype_data = (struct mxc_nand_devtype_data *)
-						pdev->id_entry->driver_data;
-		} else {
-			err = -ENODEV;
-		}
-	}
-	if (err < 0)
-		return err;
+	of_id = of_match_device(mxcnd_dt_ids, host->dev);
+	host->devtype_data = of_id->data;
 
 	if (!host->devtype_data->setup_interface)
 		this->options |= NAND_KEEP_TIMINGS;
@@ -1843,14 +1787,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 
 	this->legacy.select_chip = host->devtype_data->select_chip;
 
-	/* NAND bus width determines access functions used by upper layer */
-	if (host->pdata.width == 2)
-		this->options |= NAND_BUSWIDTH_16;
-
-	/* update flash based bbt */
-	if (host->pdata.flash_bbt)
-		this->bbt_options |= NAND_BBT_USE_FLASH;
-
 	init_completion(&host->op_completion);
 
 	host->irq = platform_get_irq(pdev, 0);
@@ -1891,9 +1827,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL,
-					host->pdata.parts,
-					host->pdata.nr_parts);
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
 	if (err)
 		goto cleanup_nand;
 
@@ -1930,7 +1864,6 @@ static struct platform_driver mxcnd_driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = of_match_ptr(mxcnd_dt_ids),
 	},
-	.id_table = mxcnd_devtype,
 	.probe = mxcnd_probe,
 	.remove = mxcnd_remove,
 };
diff --git a/include/linux/platform_data/mtd-mxc_nand.h b/include/linux/platform_data/mtd-mxc_nand.h
deleted file mode 100644
index d1230030c6db..000000000000
--- a/include/linux/platform_data/mtd-mxc_nand.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2004-2007 Freescale Semiconductor, Inc. All Rights Reserved.
- * Copyright 2008 Sascha Hauer, kernel@pengutronix.de
- */
-
-#ifndef __ASM_ARCH_NAND_H
-#define __ASM_ARCH_NAND_H
-
-#include <linux/mtd/partitions.h>
-
-struct mxc_nand_platform_data {
-	unsigned int width;	/* data bus width in bytes */
-	unsigned int hw_ecc:1;	/* 0 if suppress hardware ECC */
-	unsigned int flash_bbt:1; /* set to 1 to use a flash based bbt */
-	struct mtd_partition *parts;	/* partition table */
-	int nr_parts;			/* size of parts */
-};
-#endif /* __ASM_ARCH_NAND_H */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
