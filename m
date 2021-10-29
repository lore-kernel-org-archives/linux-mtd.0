Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ED3C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:07:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEFF46023F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEFF46023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecIzFvhW09krqC5bwafwNp0w7j/EQVKYGQ4ftNYgX3M=; b=bJEAUsFVEnEi+L
	3w4dxXRsyMC55koOvADyeI6BNItRMKRhHEF4v+MpQ1vtDlUweZ8fwT+tNGEtzA326KM63N3w2xdnC
	l+xUiOgw2e0VoZGT8VpZqiV8KuBUx2iewo/3bxaGP1IuY/ZrfFw+ZjuyYpCg123PN56aXzx1CGMoU
	Ac4J0+wDm1Y9XyDewqXKVoVJXjjq/YpqXEJ+9jMLcwsFcSmcvvRhr94AdPzHA7zkKuC4qidUgjlOL
	q85rpc6sqVJxdzgSBCRnU/TQ43CvmWgW42Bg/QoUaytiOjL/aR73WEL0KNm0BP17Rbm4jKS1ibN/y
	Hpt3gpcRA36zER+oS7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWHO-00Bimj-Mm; Fri, 29 Oct 2021 18:07:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfY-00BZOV-ON; Fri, 29 Oct 2021 17:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528476; x=1667064476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kvEAw/bAfpi/6MHTIwf4CHonY8dOnwEnLv0J+NW1zjM=;
 b=oTtBE6QaJf0uF9jD1xwfNQM7X1Oq2mxepkGWL503Uqwr1sPPfeJjLOqp
 +ayBxzfrq87Ra02+ET6XLG07iswPGmfE+rHZCooLbaCa0fdVo/P8ldaob
 +VhTyEEMyhUdx8h2YuAxjsMJxrZbYRQ0Mc7nsMe3aIfTzFr1eLZp8JAZa
 IOXz12Ix0QFkW960Z2NcXuh/Bc6qqlPGaaLrqPwnwB1TSwSHeOnFXUveE
 Q/LqQ9A0YZtXaXwTTQ6jJVCDqrzikfGXKKaMG8CvKyQpu0tDIYt7mcz3Q
 hxgMj+BwKxHAyUF7yU2EJHQuclmVrSWDsrDLt/2YGAu1SLtIT1DyLNdu6 A==;
IronPort-SDR: bHcZHERMQ0PFmO3pVI9HY31z/vQbGtvv2eJx2ZL1689ISO4HBSAnQUZqbk4R4gNohIv8nJUglt
 cON5JTRWjdHgFMzbhN6gMnfu53Stm2px5Y6zLFCWhgdHXIb96kmsuBoLcF/fy559cnnWwVQ1xu
 Y1WjQ4rtQwaYz6nCq4xFQTSlq1+kzMeaIVSABmoPfKn3BMenu3xs4pK6lT14Iwo5Wnf0pc1Imr
 EWaaz5YmL3q4MrL1VQBFYPrCcOKiXavKhtg1sd9iFxeXGrg7cNS8vWg2TgiUK/CVaYVuUK/IHJ
 /HCeljPKt5NtTdqy4JSh5NAg
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="150063434"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:55 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:50 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 15/25] mtd: spi-nor: Introduce spi_nor_nonsfdp_init_flags()
Date: Fri, 29 Oct 2021 20:26:23 +0300
Message-ID: <20211029172633.886453-16-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102756_904268_4A77CAD9 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Used to initialize the NOR flags for settings that are not defined
in the JESD216 SFDP standard, thus can not be retrieved when parsing
SFDP.
This moves the setting of SNOR_F_READY_XSR_RDY and SNOR_F_HAS_LOCK
late in the init call, without any functional change expected.
The rest of the flags were already set after the spi_nor_init_params().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 88 ++++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 82cc56c9d09e..0e31f8a2457d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2663,6 +2663,56 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
+/**
+ * spi_nor_nonsfdp_init_flags() - Initialize NOR flags for settings that are not
+ * defined in the JESD216 SFDP standard, thus can not be retrieved when parsing
+ * SFDP.
+ * @nor:	pointer to a 'struct spi_nor'
+ */
+static void spi_nor_nonsfdp_init_flags(struct spi_nor *nor)
+{
+	struct device_node *np = spi_nor_get_flash_node(nor);
+	const u32 info_flags = nor->info->flags & NON_SFDP_FLAGS_MASK;
+
+	if (of_property_read_bool(np, "broken-flash-reset"))
+		nor->flags |= SNOR_F_BROKEN_RESET;
+
+	if (info_flags & SPI_NOR_SWP_IS_VOLATILE)
+		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
+
+	if (info_flags & SPI_NOR_HAS_LOCK)
+		nor->flags |= SNOR_F_HAS_LOCK;
+
+	if (info_flags & SPI_NOR_HAS_TB) {
+		nor->flags |= SNOR_F_HAS_SR_TB;
+		if (info_flags & SPI_NOR_TB_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
+	}
+
+	if (info_flags & SPI_NOR_4BIT_BP) {
+		nor->flags |= SNOR_F_HAS_4BIT_BP;
+		if (info_flags & SPI_NOR_BP3_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
+	}
+
+	if (info_flags & NO_CHIP_ERASE)
+		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
+
+	if (info_flags & USE_CLSR)
+		nor->flags |= SNOR_F_USE_CLSR;
+
+	if (info_flags & USE_FSR)
+		nor->flags |= SNOR_F_USE_FSR;
+
+	/*
+	 * Make sure the XSR_RDY flag is set before calling
+	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
+	 * with Atmel SPI NOR.
+	 */
+	if (info_flags & SPI_NOR_XSR_RDY)
+		nor->flags |=  SNOR_F_READY_XSR_RDY;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2680,6 +2730,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	if (nor->info->fixups && nor->info->fixups->late_init)
 		nor->info->fixups->late_init(nor);
 
+	spi_nor_nonsfdp_init_flags(nor);
+
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
 	 * the default ones.
@@ -3111,7 +3163,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	const struct flash_info *info;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = &nor->mtd;
-	struct device_node *np = spi_nor_get_flash_node(nor);
 	int ret;
 	int i;
 
@@ -3148,46 +3199,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	mutex_init(&nor->lock);
 
-	/*
-	 * Make sure the XSR_RDY flag is set before calling
-	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
-	 * with Atmel SPI NOR.
-	 */
-	if (info->flags & SPI_NOR_XSR_RDY)
-		nor->flags |=  SNOR_F_READY_XSR_RDY;
-
-	if (info->flags & SPI_NOR_HAS_LOCK)
-		nor->flags |= SNOR_F_HAS_LOCK;
-
 	/* Init flash parameters based on flash_info struct and SFDP */
 	ret = spi_nor_init_params(nor);
 	if (ret)
 		return ret;
 
-	if (info->flags & USE_FSR)
-		nor->flags |= SNOR_F_USE_FSR;
-	if (info->flags & SPI_NOR_HAS_TB) {
-		nor->flags |= SNOR_F_HAS_SR_TB;
-		if (info->flags & SPI_NOR_TB_SR_BIT6)
-			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
-	}
-
-	if (info->flags & NO_CHIP_ERASE)
-		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-	if (info->flags & USE_CLSR)
-		nor->flags |= SNOR_F_USE_CLSR;
-	if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
-		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
-
-	if (info->flags & SPI_NOR_4BIT_BP) {
-		nor->flags |= SNOR_F_HAS_4BIT_BP;
-		if (info->flags & SPI_NOR_BP3_SR_BIT6)
-			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
-	}
-
-	if (of_property_read_bool(np, "broken-flash-reset"))
-		nor->flags |= SNOR_F_BROKEN_RESET;
-
 	/*
 	 * Configure the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
