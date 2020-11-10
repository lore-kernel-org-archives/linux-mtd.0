Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD626C4742C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 12:20:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D92420665
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 12:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CyK/Apbd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBB04OMu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D92420665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MRlKz9MscXI4tzp1mqqU3FaWKm8NDXlg3fcs0wmALjs=; b=CyK/ApbdN1p5q1N/GPxId7AwQZ
	vcSK/P0/Og0oWFUuuKc8Z515qgMbOmmNEQknauU0nJP8Vml5JcpaAJjzA2ErI6KgE2oaVhbrCLwg2
	w4/bP6wF2b4iJ03l662yITgWQb4dVbKYW0YOw8+P/Fkh+H7gcw449hhk6I/bFpA137PYr2Ub+TjTF
	Afe9HSgYVuhAiOGElozOD9Bu1gT7D1N7iuQA71NYeB42sVWlqDhFRGWkK5PYs4TXTRq6F8hAG3Mv7
	B68zGkjtIqeneOWdRP1rDeUym5Imsz13jvDebZmuBPgiEC5HiuNMG5x/lwm1SbhLOt27d028fkfyF
	+k4YFXzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcScM-0003gI-1E; Tue, 10 Nov 2020 12:19:22 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcScK-0003fc-3Z
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 12:19:20 +0000
Received: by mail-qt1-x844.google.com with SMTP id f93so8333244qtb.10
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2020 04:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=XOJ+mur9iTZeZ5ir3g0myAcq7z4gLGUg9hIMFPJYzGE=;
 b=VBB04OMugMRUXB381gSkO++NMX5HwlXDIUSuaAphLboAkAJI6RP9lUGb3rKdK6VcDX
 cPKAobBFJaH4DO/ckyyUPj+wgubXQ5IXPlREK94Lw9F55404IsSeNTlPnjBDQ37xy/jw
 c8Sx/dlBjvS+DCyJ9BwpWJCa/D4Ys8fOuXaRULsej/oXd7TEgHt+2gAc0ylkUtCgNFpp
 FFdAMYgPuqjBQWs7k18M5YC42q+B/V4PIbRtGpAXb2BoLuStioyvBnYU5blIGtSzeiLf
 rec4EvuSmGmeImuyqokB/frNpsJvCTJJs+icqsSRduXOnJijhtwJv2Y/IAdOXNLvDBgx
 bQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XOJ+mur9iTZeZ5ir3g0myAcq7z4gLGUg9hIMFPJYzGE=;
 b=PYU0PjOFEb/6hD3kahQf1S6yY/OjI2bXMVfEKQCAxs0bvco1shueTkFToYXieVE2nF
 wpPG8vImL/Teuxe5Q335VB1oP3rxFwa8Jqr9+58n29anp0mB+KfiNgdlCp+A1eEsLnj/
 Hx2JW+t/JsHCNKZj6lzRNWe/02hBgTySMGxVep8ghatJaNs4QHTMN6FvlRf3Dk/U1eJY
 ruMUcjw2C9L1+ffGblcsjdRz5JXfWIzTTHo/ds3ucRyoK4AbhbF0LYskp8ZX854NydvD
 9hCkH+/TjcDop+BVza2jOMi4QXnJu/VTCcntIBud7j2qlVWTKjR9i60mlF+rLLQBEId6
 eScw==
X-Gm-Message-State: AOAM532vWRefC5/hgbQZEJfHE+oDEgLFfp/Toz40L8m6j/bLnrKaXY02
 jIXsqcdwBLuBSqsxrVSs21USYTDOEPF87w==
X-Google-Smtp-Source: ABdhPJyR3RVC5CJOUxqae+B1cYFa5BXuE0ha6DxULW7JM20B/GlZ9ZVkITiyUolaM8q6K+vTa98COA==
X-Received: by 2002:ac8:64d:: with SMTP id e13mr18375570qth.23.1605010757775; 
 Tue, 10 Nov 2020 04:19:17 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:3137:56b2:3b4e:d740])
 by smtp.gmail.com with ESMTPSA id
 u5sm7521640qtg.57.2020.11.10.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 04:19:17 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH v2] mtd: rawnand: mxc: Remove platform data support
Date: Tue, 10 Nov 2020 09:19:08 -0300
Message-Id: <20201110121908.19400-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_071920_173802_E1DBBCBF 
X-CRM114-Status: GOOD (  26.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

i.MX is a devicetree-only platform now and the existing platform data
support in this driver was only useful for old non-devicetree platforms.

Get rid of the platform data support since it is no longer used.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Remove more unused structures and inline mxcnd_probe_dt() - Sascha

 drivers/mtd/nand/raw/Kconfig               |  2 +-
 drivers/mtd/nand/raw/mxc_nand.c            | 75 ++--------------------
 include/linux/platform_data/mtd-mxc_nand.h | 19 ------
 3 files changed, 5 insertions(+), 91 deletions(-)
 delete mode 100644 include/linux/platform_data/mtd-mxc_nand.h

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index cc86d6e4e042..b93e6cd23259 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -292,7 +292,7 @@ config MTD_NAND_VF610_NFC
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
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
