Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26635C27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 16:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lBKWk5pXB97VLBxixHuofiHy168Q5zk9OJW2ls0fRPo=; b=kAWejzbV1mWoWl
	QRANqCeUvRooIe6XR9gkg/GnRtmMIyqtJCoQ9XftqAvtC7ZjCehTLSwi9YuJaFLjHcJLbaZuomtcS
	AnleIWi80vAqYWMi1O7at1RE3s9J1jB2iBU8S7LLkz38G6+nzPFcDL6dFW8s42le4CmG2rbmEitcA
	s/kKlJ55qlmtwCJxEIXAIfjrBj1nhApKFZ1ns9WU8pzSQlkYufaiGblSa7C4obQnlnpC345KSW4Uq
	0qhAR4nrlsQLR4wt66cgS9Qn+nUZqhp9QyaHBpPP8LR/wljSSIQdC3HP2ZGHyXxSeC1daLw0Sg8Wk
	4qPHARI1zl6CumiNtuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKbw-00000005q56-07GG;
	Thu, 20 Jun 2024 16:26:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKbs-00000005pyI-1Mzr
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 16:26:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FF501C0005;
	Thu, 20 Jun 2024 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1718900757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sMAaUukcd0doO0dRRodMLTypr1iYWufXt8C9e7HTtwg=;
	b=KPDKIqlzYu0VBtYoga+w6FHQyMQKEJyYfelR/j1Tb+6ObzKdKGSqbhtIWEICOmFe7pSTPT
	Qnpy/SWdynNPjIQTFhKl4wWoDmXxiE5aMnDSeLr0nNoJdLOVHpH7DMVBzs34LwjwAsl8G9
	sstAH1nbnfaDsVyo6MhU8cxjOIyIB5M5wMVABFOIDEYy2eQQUbvYcNLmq1540Fpzu46jkq
	qizPlI7c8MwKjT3GivBlw2lM9P3/UHOujIToYcE2hFydEA73Y+W2U0jSAtGyOtIvkyVJaW
	/7h+72rbrBjVzNRkdxWI51wvM0WcT+qVUN/lUm2vDHvzVwamN1b/oyi6/OUT+g==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Thu, 20 Jun 2024 18:25:48 +0200
Subject: [PATCH] mtd: nand: Add support for M5441x NFC
MIME-Version: 1.0
Message-Id: <20240620-upstream-nfc-mcf5441x-v1-1-69b64807d7a6@yoseli.org>
X-B4-Tracking: v=1; b=H4sIAAtYdGYC/x3MQQ5AMBBA0avIrE1So23EVcSCmjILJS0iEXfXW
 L7F/w8kjsIJ2uKByJck2UJGVRbgliHMjDJlAynSypLCc09H5GHF4B2uzhutqxsbYqpHbZgaC7n
 dI3u5/2/Xv+8HeMI+4GcAAAA=
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Stefan Agner <stefan@agner.ch>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718900756; l=7211;
 i=jeanmichel.hautbois@yoseli.org; s=20240608; h=from:subject:message-id;
 bh=IEbK275dZGdX1r5WehYrzNJpO82iroodmypGqB6CcPg=;
 b=67/+Hf4fKek2/mcNRdpGlE6XDLZN2U/PfRRY3vL1azQDxGyJG8iz0wGEuo+o6a8IQI28REv+F
 IjWOCVQ4xZMCT5s0+GznJjKauh5vRDpAtZiYWh7gg3dag+/5MQR0wQh
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=oMZuYhJzT0j5MI73RlNUVYaA8VdWpFR/Sao0JKz1D2I=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_092604_678465_0424DE7C 
X-CRM114-Status: GOOD (  26.31  )
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

The vf610_nfc driver is also the one which should be used for the
coldfire series. Sadly, these device don't support device-tree and so we
need to do a few modifications:
- Adapt the probe to use pdata if available
- Add a new variant as there is a small part to adapt in
  vf610_nfc_select_target()
- Add the corresponding missing register definitions

Tested successfully on a 54418 custom board with a raw NAND:
[    2.640000] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
[    2.650000] nand: Micron MT29F4G08ABADAWP
[    2.650000] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/m68k/include/asm/m5441xsim.h |  7 ++++
 drivers/mtd/nand/raw/Kconfig      |  2 +-
 drivers/mtd/nand/raw/vf610_nfc.c  | 79 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 77 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..d4ee1eab7c4a 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -99,6 +99,7 @@
 #define MCFINT2_PIT1		14
 #define MCFINT2_PIT2		15
 #define MCFINT2_PIT3		16
+#define MCFINT2_NFC		25
 #define MCFINT2_RTC		26
 
 /*
@@ -333,4 +334,10 @@
 #define MCF_IRQ_BOFF1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_BOFF)
 #define MCF_IRQ_ERR1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_ERR)
 
+/*
+ * Flash module
+ */
+#define MCF_NFC_BASE		0xfc0fc000
+#define MCF_NFC_SIZE		(0xfc0fff3b - 0xfc0fc000)
+#define MCF_NFC_ISR		(MCFINT2_VECBASE + MCFINT2_NFC)
 #endif /* m5441xsim_h */
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index cbf8ae85e1ae..2ea3ee32a540 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -252,7 +252,7 @@ config MTD_NAND_FSL_UPM
 
 config MTD_NAND_VF610_NFC
 	tristate "Freescale VF610/MPC5125 NAND controller"
-	depends on (SOC_VF610 || COMPILE_TEST)
+	depends on (SOC_VF610 || COMPILE_TEST || M5441x)
 	depends on HAS_IOMEM
 	help
 	  Enables support for NAND Flash Controller on some Freescale
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index f31d23219f91..06f1ed5433c8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -146,6 +146,7 @@
 
 enum vf610_nfc_variant {
 	NFC_VFC610 = 1,
+	NFC_M54418 = 2,
 };
 
 struct vf610_nfc {
@@ -486,10 +487,24 @@ static void vf610_nfc_select_target(struct nand_chip *chip, unsigned int cs)
 	if (nfc->variant != NFC_VFC610)
 		return;
 
-	tmp = vf610_nfc_read(nfc, NFC_ROW_ADDR);
-	tmp &= ~(ROW_ADDR_CHIP_SEL_RB_MASK | ROW_ADDR_CHIP_SEL_MASK);
-	tmp |= 1 << ROW_ADDR_CHIP_SEL_RB_SHIFT;
-	tmp |= BIT(cs) << ROW_ADDR_CHIP_SEL_SHIFT;
+	if (nfc->variant == NFC_M54418) {
+		/*
+		 * According to the Reference Manual:
+		 * bit 24: Reserved, must be set (ROW_ADDR_CHIP_SEL_SHIFT)
+		 * bit 25-27: Reserved, must be cleared
+		 * bit 28: Reserved, must be set (ROW_ADDR_CHIP_SEL_RB_SHIFT)
+		 * bit 29-31: Reserved, must be cleared
+		 */
+		tmp = vf610_nfc_read(nfc, NFC_ROW_ADDR);
+		tmp &= ~(ROW_ADDR_CHIP_SEL_RB_MASK | ROW_ADDR_CHIP_SEL_MASK);
+		tmp |= 1 << ROW_ADDR_CHIP_SEL_RB_SHIFT;
+		tmp |= 1 << ROW_ADDR_CHIP_SEL_SHIFT;
+	} else {
+		tmp = vf610_nfc_read(nfc, NFC_ROW_ADDR);
+		tmp &= ~(ROW_ADDR_CHIP_SEL_RB_MASK | ROW_ADDR_CHIP_SEL_MASK);
+		tmp |= 1 << ROW_ADDR_CHIP_SEL_RB_SHIFT;
+		tmp |= BIT(cs) << ROW_ADDR_CHIP_SEL_SHIFT;
+	}
 
 	vf610_nfc_write(nfc, NFC_ROW_ADDR, tmp);
 }
@@ -700,11 +715,26 @@ static int vf610_nfc_write_oob(struct nand_chip *chip, int page)
 	return nand_prog_page_end_op(chip);
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id vf610_nfc_dt_ids[] = {
 	{ .compatible = "fsl,vf610-nfc", .data = (void *)NFC_VFC610 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, vf610_nfc_dt_ids);
+#endif
+
+static const struct platform_device_id vf610_nfc_id_table[] = {
+	{
+		.name = "mcf5441x-nfc",
+		.driver_data = (kernel_ulong_t)NFC_M54418,
+	}, {
+		.name = "vf610-nfc",
+		.driver_data = (kernel_ulong_t)NFC_VFC610,
+	}, {
+		/* sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(platform, vf610_nfc_id_table);
 
 static void vf610_nfc_preinit_controller(struct vf610_nfc *nfc)
 {
@@ -810,6 +840,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	struct vf610_nfc *nfc;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
+	struct nand_chip *pdata;
 	struct device_node *child;
 	int err;
 	int irq;
@@ -820,30 +851,53 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
+	pdata = dev_get_platdata(&pdev->dev);
+	if (pdata)
+		*chip = *pdata;
+
 	mtd = nand_to_mtd(chip);
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = nfc->dev;
-	mtd->name = DRV_NAME;
+
+	/*
+	 * We keep the MTD name unchanged to avoid breaking platforms
+	 * where the MTD cmdline parser is used and the bootloader
+	 * has not been updated to use the new naming scheme.
+	 */
+	if (!nfc->dev->of_node)
+		mtd->name = "NAND";
+	else
+		mtd->name = DRV_NAME;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
 	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(nfc->regs))
+	if (IS_ERR(nfc->regs)) {
+		dev_err(nfc->dev, "Unable to map registers!\n");
 		return PTR_ERR(nfc->regs);
+	}
 
+#ifdef CONFIG_OF
 	nfc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(nfc->clk)) {
 		dev_err(nfc->dev, "Unable to get and enable clock!\n");
 		return PTR_ERR(nfc->clk);
 	}
 
-	nfc->variant = (enum vf610_nfc_variant)device_get_match_data(&pdev->dev);
-	if (!nfc->variant)
-		return -ENODEV;
+	const void *data = device_get_match_data(&pdev->dev);
 
+	nfc->variant = (enum vf610_nfc_variant)data;
+	if (!nfc->variant) {
+		dev_err(nfc->dev, "No variant data found!\n");
+		return -ENODEV;
+	}
+#else
+	nfc->variant = (enum vf610_nfc_variant)platform_get_device_id(pdev)->driver_data;
+#endif
+#ifdef CONFIG_OF
 	for_each_available_child_of_node(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {
 
@@ -862,6 +916,10 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		dev_err(nfc->dev, "NAND chip sub-node missing!\n");
 		return -ENODEV;
 	}
+#else
+	nfc->clk = NULL;
+	mtd->dev.parent = &pdev->dev;
+#endif
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
@@ -937,11 +995,12 @@ static SIMPLE_DEV_PM_OPS(vf610_nfc_pm_ops, vf610_nfc_suspend, vf610_nfc_resume);
 static struct platform_driver vf610_nfc_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
-		.of_match_table = vf610_nfc_dt_ids,
+		.of_match_table = of_match_ptr(vf610_nfc_dt_ids),
 		.pm	= &vf610_nfc_pm_ops,
 	},
 	.probe		= vf610_nfc_probe,
 	.remove_new	= vf610_nfc_remove,
+	.id_table = vf610_nfc_id_table,
 };
 
 module_platform_driver(vf610_nfc_driver);

---
base-commit: e5b3efbe1ab1793bb49ae07d56d0973267e65112
change-id: 20240620-upstream-nfc-mcf5441x-82e23b45e286

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
