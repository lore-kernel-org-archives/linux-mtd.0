Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85847C282D7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:21:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F64720856
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f97/lm0B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="Tjud4NkD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F64720856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xyXZSdC1aeNjGtzdUN7aQIUsgrYuHhAPkSzIsnj0kd4=; b=f97/lm0BM0ZUNz74IJQxwzOpHt
	pTGeAF850pYAOcW0hwjDbCZnldfPvfVdVyCFIHfrQBrQinsBv+j6jR5bmXctP4NsSsWVL/9z2kwMx
	vY/OJPzB/k3MAyZMZtFhjY8VildOT/aPxA2vzXUv8PpG5Hrjj1ZnlCTDIL9n/zVE/udotR6hrLiZA
	YCETH5OWxsfsz99LGQug+uIlaslFYUeG7XAGEdGFUJSR/+Jmj8ZtbnufSyFK8IO81csIVsJz6B9Q3
	ukHExcahI53mz6BPn3+GUU8f72TZI32AzpjC/fmxQSd4Ap10ILyf+EAHMnCm/Obsw3kYTxbgKdyRh
	KDEBafnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gq4al-0008VH-Q7; Sat, 02 Feb 2019 23:20:55 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gq4Zy-0006np-Nx
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2019 23:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549149604; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=ho6jlX+K61HRdDvoKMZTbVcT33L0Uu8NFRUlf+yLAYI=;
 b=Tjud4NkDI5gJWk1k6IW1ZAsHozYySNxtVdwia6VM5gk8Z/4DpRvw9KY5rcTLFJaztU1mNq
 H/G4tAlQ30U44f0AGkWu2a+e8ANd3iTh/vdZcKWbkhAkhSGL9MtdzxElW6FlD7hARmMno+
 V3pgyo7ZDHSZRpQYn3oCO7/Y7T7qfzM=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v2 4/9] mtd: rawnand: jz4780: Add support for the JZ4740
Date: Sat,  2 Feb 2019 20:19:21 -0300
Message-Id: <20190202231926.2444-5-paul@crapouillou.net>
In-Reply-To: <20190202231926.2444-1-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_152007_292897_8B173A7C 
X-CRM114-Status: GOOD (  18.65  )
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
Cc: Mathieu Malaterre <malat@debian.org>, devicetree@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for probing the jz4780-nand driver on the JZ4740 SoC from
Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Changes:

v2: - Add support for the JZ4740 and not the JZ4725B: they behave the
      same, and JZ4740 is fully upstream while JZ4725B is not. The
      JZ4725B devicetree will then simply use the "ingenic,jz4740-nand"
      compatible string.
    - Fix the number of bytes for the ECC when the ECC strength is 4.
      This is needed for the JZ4740, which uses Reed-Solomon instead of
      BCH.

 drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 48 +++++++++++++++++-----
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
index 7f55358b860f..c0855fef7735 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
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
@@ -161,8 +165,13 @@ static int jz4780_nand_attach_chip(struct nand_chip *chip)
 	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(chip->controller);
 	int eccbytes;
 
-	chip->ecc.bytes = fls((1 + 8) * chip->ecc.size)	*
-				(chip->ecc.strength / 8);
+	if (chip->ecc.strength == 4) {
+		/* JZ4740 uses 9 bytes of ECC to correct maximum 4 errors */
+		chip->ecc.bytes = 9;
+	} else {
+		chip->ecc.bytes = fls((1 + 8) * chip->ecc.size)	*
+				  (chip->ecc.strength / 8);
+	}
 
 	switch (chip->ecc.mode) {
 	case NAND_ECC_HW:
@@ -272,8 +281,8 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
 		return -ENOMEM;
 	mtd->dev.parent = dev;
 
-	chip->legacy.IO_ADDR_R = cs->base + OFFSET_DATA;
-	chip->legacy.IO_ADDR_W = cs->base + OFFSET_DATA;
+	chip->legacy.IO_ADDR_R = cs->base + nfc->soc_info->data_offset;
+	chip->legacy.IO_ADDR_W = cs->base + nfc->soc_info->data_offset;
 	chip->legacy.chip_delay = RB_DELAY_US;
 	chip->options = NAND_NO_SUBPAGE_WRITE;
 	chip->legacy.select_chip = jz4780_nand_select_chip;
@@ -353,6 +362,10 @@ static int jz4780_nand_probe(struct platform_device *pdev)
 	if (!nfc)
 		return -ENOMEM;
 
+	nfc->soc_info = device_get_match_data(dev);
+	if (!nfc->soc_info)
+		return -EINVAL;
+
 	/*
 	 * Check for BCH HW before we call nand_scan_ident, to prevent us from
 	 * having to call it again if the BCH driver returns -EPROBE_DEFER.
@@ -390,8 +403,21 @@ static int jz4780_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct jz_soc_info jz4740_soc_info = {
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
+	{ .compatible = "ingenic,jz4740-nand", .data = &jz4740_soc_info },
+	{ .compatible = "ingenic,jz4780-nand",  .data = &jz4780_soc_info  },
 	{},
 };
 MODULE_DEVICE_TABLE(of, jz4780_nand_dt_match);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
