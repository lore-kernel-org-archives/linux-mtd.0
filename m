Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919D2C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 11:57:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5120D6140D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 11:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5120D6140D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSCcNMHp/bi+4AzJOKtji8u7VqeBc41i7RhdnCYsvxI=; b=q/P/L0X0ui3Dgp
	HqRmxP8UR+REumXjhwMZ7FBln5WxMjsIoqBaJ20dVeRfN+mUiLRNQNQRPH9SOxSIonE8Efvv2G7dw
	q4aUAQW7QFDIiRbvybCgCdxDXYZ/lfKuHLhwhIwfV6QDkHdihlyUjvMlyYYlOJIh1Re3JnSrCHKED
	Q9X+uKZ6ERKcSLrMCzUvSHGx3rXB8xktOQ5sbMrAUyxFUVjTVET8dpqpLVvmz0MGbsAAC3x0a86hZ
	6a4UMHZT9ptFWY30oPGSh4G1sjQEFf+fZ2G6OKEv4qzM5e9wyC798sILTbDV9PErZTWgJJITF0Bwe
	dAm4f8t1slS2P6odM+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVYCF-00AucY-JW; Wed, 29 Sep 2021 11:56:23 +0000
Received: from thorn.bewilderbeest.net ([2605:2700:0:5::4713:9cab])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVYAM-00AtwX-4d; Wed, 29 Sep 2021 11:54:29 +0000
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5AD49C20;
 Wed, 29 Sep 2021 04:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916465;
 bh=gWhuqV+M1Tlbi05phPKIzczuXxjec79mm6Htp3ec2Fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TPHBvzSoAHCSQnD3bL2UL4TNhvWQeplNlEAzdi66LW/EUSsZHaD8j+grZQ+lI2rPL
 eCkgGN+VYhA8AV5DkC4Shr4g/Hu70PSi+JCPV/MV1HNEtnkphvooWRgWmWSiRA5E23
 67EO2AZnjt3cdiI2zXmGhZBitG81BlaRm1fHmeno=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Zev Weiss <zev@bewilderbeest.net>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] mtd: spi-nor: aspeed: Refactor registration/unregistration
Date: Wed, 29 Sep 2021 04:54:05 -0700
Message-Id: <20210929115409.21254-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
References: <20210929115409.21254-1-zev@bewilderbeest.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_045426_262506_EDAB36C5 
X-CRM114-Status: GOOD (  21.28  )
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

We now have separate functions for registering and unregistering
individual flash chips, instead of the entire controller.  This is a
preparatory step for allowing userspace to request that a specific
chip be attached or detached at runtime.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 73 ++++++++++++--------
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index 7225870e8b18..3c153104a905 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -107,9 +107,10 @@ struct aspeed_smc_controller {
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
 	void __iomem *ahb_base;			/* per-chip windows resource */
+	struct resource *ahb_res;		/* resource for AHB address space */
 	u32 ahb_window_size;			/* full mapping window size */
 
-	struct aspeed_smc_chip *chips[];	/* pointers to attached chips */
+	struct aspeed_smc_chip *chips[];	/* pointers to connected chips */
 };
 
 /*
@@ -399,15 +400,24 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
 	return len;
 }
 
+static int aspeed_smc_unregister_chip(struct aspeed_smc_chip *chip)
+{
+	return mtd_device_unregister(&chip->nor.mtd);
+}
+
 static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
 {
 	struct aspeed_smc_chip *chip;
-	int n;
+	int n, ret;
 
 	for (n = 0; n < controller->info->nce; n++) {
 		chip = controller->chips[n];
-		if (chip)
-			mtd_device_unregister(&chip->nor.mtd);
+		if (chip) {
+			ret = aspeed_smc_unregister_chip(chip);
+			if (ret)
+				dev_warn(controller->dev, "failed to unregister CS%d: %d\n",
+				         n, ret);
+		}
 	}
 
 	return 0;
@@ -756,14 +766,39 @@ static const struct spi_nor_controller_ops aspeed_smc_controller_ops = {
 	.write = aspeed_smc_write_user,
 };
 
-static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
-				  struct device_node *np, struct resource *r)
+static int aspeed_smc_register_chip(struct aspeed_smc_chip *chip)
 {
-	const struct spi_nor_hwcaps hwcaps = {
+	static const struct spi_nor_hwcaps hwcaps = {
 		.mask = SNOR_HWCAPS_READ |
 			SNOR_HWCAPS_READ_FAST |
 			SNOR_HWCAPS_PP,
 	};
+	int ret;
+
+	ret = aspeed_smc_chip_setup_init(chip, chip->controller->ahb_res);
+	if (ret)
+		goto out;
+
+	/*
+	 * TODO: Add support for Dual and Quad SPI protocols attach when board
+	 * support is present as determined by of property.
+	 */
+	ret = spi_nor_scan(&chip->nor, NULL, &hwcaps);
+	if (ret)
+		goto out;
+
+	ret = aspeed_smc_chip_setup_finish(chip);
+	if (ret)
+		goto out;
+
+	ret = mtd_device_register(&chip->nor.mtd, NULL, 0);
+out:
+	return ret;
+}
+
+static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
+				  struct device_node *np, struct resource *r)
+{
 	const struct aspeed_smc_info *info = controller->info;
 	struct device *dev = controller->dev;
 	struct device_node *child;
@@ -773,7 +808,6 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	for_each_available_child_of_node(np, child) {
 		struct aspeed_smc_chip *chip;
 		struct spi_nor *nor;
-		struct mtd_info *mtd;
 
 		/* This driver does not support NAND or NOR flash devices. */
 		if (!of_device_is_compatible(child, "jedec,spi-nor"))
@@ -810,35 +844,17 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		chip->cs = cs;
 
 		nor = &chip->nor;
-		mtd = &nor->mtd;
 
 		nor->dev = dev;
 		nor->priv = chip;
 		spi_nor_set_flash_node(nor, child);
 		nor->controller_ops = &aspeed_smc_controller_ops;
 
-		ret = aspeed_smc_chip_setup_init(chip, r);
-		if (ret)
-			break;
-
-		/*
-		 * TODO: Add support for Dual and Quad SPI protocols
-		 * attach when board support is present as determined
-		 * by of property.
-		 */
-		ret = spi_nor_scan(nor, NULL, &hwcaps);
-		if (ret)
-			break;
-
-		ret = aspeed_smc_chip_setup_finish(chip);
-		if (ret)
-			break;
+		controller->chips[cs] = chip;
 
-		ret = mtd_device_register(mtd, NULL, 0);
+		ret = aspeed_smc_register_chip(chip);
 		if (ret)
 			break;
-
-		controller->chips[cs] = chip;
 	}
 
 	if (ret) {
@@ -881,6 +897,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 		return PTR_ERR(controller->regs);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	controller->ahb_res = res;
 	controller->ahb_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(controller->ahb_base))
 		return PTR_ERR(controller->ahb_base);
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
