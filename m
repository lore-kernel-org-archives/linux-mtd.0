Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EA4C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 01:07:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6313B2086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 01:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AL+QmFfN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="sJOlCpYe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6313B2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nYtXi87DpolBTUhNlEVqWJu7CTexJqLvzu1MwPSLKcI=; b=AL+QmFfNG63AcueY4vnVeXNfbU
	1LyU9mWu9d9YBLiMKCP6smm2C3bCJ/SQ10Qe7qEk8KUMhc7qJt5uU4g52K1CleoXTanLHf3wbSS9k
	WUGV6PDKDtxI9IJI0Iz6DVWTJtqHNq1eeXreuIyGHHvcxlcIp2EjGiJWtPkz9BMsYKInfeSWYza5o
	1dCLTj26hwhddxs2X2KOmzc51vEPW0FH8Qvuxe10RnWL+O7hABQUALru1N1Ofkn8v0Wh1mbLRaziF
	S1xkH+OT0F+Ulu82mlhDIGOw2VcrCYDrzoniVFsQ6mGRCXcH8anh0uPhnnwum2lJ6dcKxZVOaeC8t
	YLwtad4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkIdO-0007fd-1a; Fri, 18 Jan 2019 01:07:46 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkIcm-0006yL-JH
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 01:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1547773626; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=s0MF13DDkEDuHtbx7UNjgcLhaH1j/DQyxSJTtHGnXsc=;
 b=sJOlCpYeykIHwP7BZXrIywVNgTtmA39hOP5lYmdXVw4/925lTVmJScY2gB446qMqSRo8PQ
 davX1LHJWO4/zN61NwZ1YTpiXFbmCzHHXldE5YAo1O9yOkNFeffMb6ueKVrOfmhm+nUDcp
 ZO2bcKgAFFm9e7c1zg9cUlSRgTPqAhQ=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH 4/8] mtd: rawnand: jz4780: Add support for the JZ4725B
Date: Thu, 17 Jan 2019 22:06:30 -0300
Message-Id: <20190118010634.27399-4-paul@crapouillou.net>
In-Reply-To: <20190118010634.27399-1-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_170709_480418_6B64A8AB 
X-CRM114-Status: GOOD (  16.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for probing the jz4780-nand driver on the JZ4725B SoC from
Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/mtd/nand/raw/jz4780_nand.c | 39 +++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
index 7f55358b860f..cf24bf12884f 100644
--- a/drivers/mtd/nand/raw/jz4780_nand.c
+++ b/drivers/mtd/nand/raw/jz4780_nand.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -26,13 +27,15 @@
 
 #define DRV_NAME	"jz4780-nand"
 
-#define OFFSET_DATA	0x00000000
-#define OFFSET_CMD	0x00400000
-#define OFFSET_ADDR	0x00800000
-
 /* Command delay when there is no R/B pin. */
 #define RB_DELAY_US	100
 
+struct jz_soc_info {
+	unsigned long data_offset;
+	unsigned long addr_offset;
+	unsigned long cmd_offset;
+};
+
 struct jz4780_nand_cs {
 	unsigned int bank;
 	void __iomem *base;
@@ -40,6 +43,7 @@ struct jz4780_nand_cs {
 
 struct jz4780_nand_controller {
 	struct device *dev;
+	const struct jz_soc_info *soc_info;
 	struct jz4780_bch *bch;
 	struct nand_controller controller;
 	unsigned int num_banks;
@@ -101,9 +105,9 @@ static void jz4780_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
 		return;
 
 	if (ctrl & NAND_ALE)
-		writeb(cmd, cs->base + OFFSET_ADDR);
+		writeb(cmd, cs->base + nfc->soc_info->addr_offset);
 	else if (ctrl & NAND_CLE)
-		writeb(cmd, cs->base + OFFSET_CMD);
+		writeb(cmd, cs->base + nfc->soc_info->cmd_offset);
 }
 
 static int jz4780_nand_dev_ready(struct nand_chip *chip)
@@ -272,8 +276,8 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
 		return -ENOMEM;
 	mtd->dev.parent = dev;
 
-	chip->legacy.IO_ADDR_R = cs->base + OFFSET_DATA;
-	chip->legacy.IO_ADDR_W = cs->base + OFFSET_DATA;
+	chip->legacy.IO_ADDR_R = cs->base + nfc->soc_info->data_offset;
+	chip->legacy.IO_ADDR_W = cs->base + nfc->soc_info->data_offset;
 	chip->legacy.chip_delay = RB_DELAY_US;
 	chip->options = NAND_NO_SUBPAGE_WRITE;
 	chip->legacy.select_chip = jz4780_nand_select_chip;
@@ -353,6 +357,10 @@ static int jz4780_nand_probe(struct platform_device *pdev)
 	if (!nfc)
 		return -ENOMEM;
 
+	nfc->soc_info = device_get_match_data(dev);
+	if (!nfc->soc_info)
+		return -EINVAL;
+
 	/*
 	 * Check for BCH HW before we call nand_scan_ident, to prevent us from
 	 * having to call it again if the BCH driver returns -EPROBE_DEFER.
@@ -390,8 +398,21 @@ static int jz4780_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct jz_soc_info jz4725b_soc_info = {
+	.data_offset = 0x00000000,
+	.cmd_offset  = 0x00008000,
+	.addr_offset = 0x00010000,
+};
+
+static const struct jz_soc_info jz4780_soc_info = {
+	.data_offset = 0x00000000,
+	.cmd_offset  = 0x00400000,
+	.addr_offset = 0x00800000,
+};
+
 static const struct of_device_id jz4780_nand_dt_match[] = {
-	{ .compatible = "ingenic,jz4780-nand" },
+	{ .compatible = "ingenic,jz4725b-nand", .data = &jz4725b_soc_info },
+	{ .compatible = "ingenic,jz4780-nand",  .data = &jz4780_soc_info  },
 	{},
 };
 MODULE_DEVICE_TABLE(of, jz4780_nand_dt_match);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
