Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF2FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C1mqBntkpXHKtY+Gxt+laMSOwTb03p8bpOSc+kk9jHk=; b=NhlYIz3Ooxck1n
	TG+qaZ4/W/daF9I1SBc2A5G+vguev85ThEDvdJ+Fz8fHxe3wJyBRc2rFgheR3eozGcrEBWJyxbvI4
	NyhOZgY3/sNrKC1X4yE2Joz6DcBuM5e91QRWEJ18qwQlw36SIG8mnSIxqqTUocbe+4WGLVblEnyIX
	81Hz2sm+0ZD39kKuj6f1f7DAJ/G8tswT9ByqP2nQ8qg/hO/YAVM++Ac5t3eLeNZB5weBAIIeyHLKf
	kocCHGn0CUhL/DvJdq4YL7jQTUidKGo+lISs3+dB81t6roGyPkntoipznUA/iypDDvoCENxMCKNSc
	kKQLb5h+FUIfyHcFL6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2c2-00FJIY-Hv; Thu, 27 Jan 2022 11:06:46 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2by-00FJFl-AQ
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 11:06:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B6E410000A;
 Thu, 27 Jan 2022 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643281597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o6YD+Ih1mt4RuwmHj1v1mgQy/JSNiyy9nHBWcjIkOCY=;
 b=WYTSL6MH4iPna6WBXnVppEx/5mwR3rXS1eS3bx35CtevxkedqhhP+VOpaOaPmK7SSmvNUV
 ScnKze7rKmmW9skSOyudChHJNQDhJn+dwh/n4THZ/JztyRRn1MEOMz3b05+7V9QTTDB9Eu
 xObpFdRZ4dkdjLMzhPr9N6m1+BcIa72Sm+tZ97neqOpvFUwJ/9p3TbQZzuWCRZ8rT5aLdx
 ZrzwubMZr0TW4FHMsxEh4rZLvYsDuVeD3nXFKaAQD6OnaQEmJHPyaXrobXAFnz8Cwx16+C
 iIFEZ19goUNKLIgxbtHGNow1wU+JyWAO6R6tmDXcnJsXwsLg7WFvGTxspHpHpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: Fix misuses of of_match_ptr()
Date: Thu, 27 Jan 2022 12:06:31 +0100
Message-Id: <20220127110631.1064705-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_030642_750609_703017A3 
X-CRM114-Status: GOOD (  15.53  )
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

of_match_ptr() either expands to NULL if !CONFIG_OF, or is transparent
otherwise. There are several drivers using this macro which keep their
of_device_id array enclosed within an #ifdef CONFIG_OF check, these are
considered fine. However, When misused, the of_device_id array pointed
by this macro will produce a warning because it is finally unused when
compiled without OF support.

A number of fixes are possible:
- Always depend on CONFIG_OF, but this will not always work and may
  break boards.
- Enclose the compatible array by #ifdef's, this may save a bit of
  memory but will reduce build coverage.
- Tell the compiler the array may be unused, if this can be avoided,
  let's not do this.
- Just drop the macro, setting the of_device_id array for a non OF
  enabled platform is not an issue, it will just be unused.

The latter solution seems the more appropriate, so let's use it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/devices/mchp23k256.c                | 2 +-
 drivers/mtd/devices/mchp48l640.c                | 2 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c    | 2 +-
 drivers/mtd/nand/raw/atmel/pmecc.c              | 2 +-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
 drivers/mtd/nand/raw/ingenic/jz4780_bch.c       | 2 +-
 drivers/mtd/nand/raw/mtk_ecc.c                  | 2 +-
 drivers/mtd/nand/raw/omap2.c                    | 2 +-
 drivers/mtd/nand/raw/renesas-nand-controller.c  | 2 +-
 drivers/mtd/nand/raw/sh_flctl.c                 | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index a8b31bddf14b..bf51eebf052c 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -234,7 +234,7 @@ MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
 static struct spi_driver mchp23k256_driver = {
 	.driver = {
 		.name	= "mchp23k256",
-		.of_match_table = of_match_ptr(mchp23k256_of_table),
+		.of_match_table = mchp23k256_of_table,
 	},
 	.probe		= mchp23k256_probe,
 	.remove		= mchp23k256_remove,
diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index 231a10790196..4ec505b3f4a6 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -362,7 +362,7 @@ MODULE_DEVICE_TABLE(of, mchp48l640_of_table);
 static struct spi_driver mchp48l640_driver = {
 	.driver = {
 		.name	= "mchp48l640",
-		.of_match_table = of_match_ptr(mchp48l640_of_table),
+		.of_match_table = mchp48l640_of_table,
 	},
 	.probe		= mchp48l640_probe,
 	.remove		= mchp48l640_remove,
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index f3276ee9e4fe..4ecbaccf5526 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2648,7 +2648,7 @@ static SIMPLE_DEV_PM_OPS(atmel_nand_controller_pm_ops, NULL,
 static struct platform_driver atmel_nand_controller_driver = {
 	.driver = {
 		.name = "atmel-nand-controller",
-		.of_match_table = of_match_ptr(atmel_nand_controller_of_ids),
+		.of_match_table = atmel_nand_controller_of_ids,
 		.pm = &atmel_nand_controller_pm_ops,
 	},
 	.probe = atmel_nand_controller_probe,
diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index 498e41ccabbd..43ebd78816c0 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -1003,7 +1003,7 @@ static int atmel_pmecc_probe(struct platform_device *pdev)
 static struct platform_driver atmel_pmecc_driver = {
 	.driver = {
 		.name = "atmel-pmecc",
-		.of_match_table = of_match_ptr(atmel_pmecc_match),
+		.of_match_table = atmel_pmecc_match,
 	},
 	.probe = atmel_pmecc_probe,
 };
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index b18861bdcdc8..ff26c10f295d 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -567,7 +567,7 @@ static struct platform_driver ingenic_nand_driver = {
 	.remove		= ingenic_nand_remove,
 	.driver	= {
 		.name	= DRV_NAME,
-		.of_match_table = of_match_ptr(ingenic_nand_dt_match),
+		.of_match_table = ingenic_nand_dt_match,
 	},
 };
 module_platform_driver(ingenic_nand_driver);
diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index d67dbfff76cc..12b5b0484fe9 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -260,7 +260,7 @@ static struct platform_driver jz4780_bch_driver = {
 	.probe		= jz4780_bch_probe,
 	.driver	= {
 		.name	= "jz4780-bch",
-		.of_match_table = of_match_ptr(jz4780_bch_dt_match),
+		.of_match_table = jz4780_bch_dt_match,
 	},
 };
 module_platform_driver(jz4780_bch_driver);
diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
index 1b47964cb6da..e7df3dac705e 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/raw/mtk_ecc.c
@@ -579,7 +579,7 @@ static struct platform_driver mtk_ecc_driver = {
 	.probe  = mtk_ecc_probe,
 	.driver = {
 		.name  = "mtk-ecc",
-		.of_match_table = of_match_ptr(mtk_ecc_dt_match),
+		.of_match_table = mtk_ecc_dt_match,
 #ifdef CONFIG_PM_SLEEP
 		.pm = &mtk_ecc_pm_ops,
 #endif
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index f0bbbe401e76..58c32a11792e 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2298,7 +2298,7 @@ static struct platform_driver omap_nand_driver = {
 	.remove		= omap_nand_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.of_match_table = of_match_ptr(omap_nand_ids),
+		.of_match_table = omap_nand_ids,
 	},
 };
 
diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 428e08362956..6db063b230a9 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1412,7 +1412,7 @@ MODULE_DEVICE_TABLE(of, rnandc_id_table);
 static struct platform_driver rnandc_driver = {
 	.driver = {
 		.name = "renesas-nandc",
-		.of_match_table = of_match_ptr(rnandc_id_table),
+		.of_match_table = rnandc_id_table,
 	},
 	.probe = rnandc_probe,
 	.remove = rnandc_remove,
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 13df4bdf792a..b85b9c6fcc42 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1220,7 +1220,7 @@ static struct platform_driver flctl_driver = {
 	.remove		= flctl_remove,
 	.driver = {
 		.name	= "sh_flctl",
-		.of_match_table = of_match_ptr(of_flctl_match),
+		.of_match_table = of_flctl_match,
 	},
 };
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
