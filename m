Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F524C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlOHZknAKDWaSAk4BG0oDO4u9/fe8xZlUoFYgBLG4jY=; b=2uZFab1F7BLudB
	57hOQVovd9rsmQEsNGztbQBIHS2dsCi1L5vvJvkMdco7N2Pjsa21o3WM2vx99SiBn7AD0gtocXnFl
	RTkfkm0KAmHY4V9DNJPZVTNfLXn/gHR8XY7C9h/NeF0xqkfUQoDerxuOfNtZjoDJf8ARRsxPCYV4t
	z47j+ZhSaVHi+VM7oZdDHlaujBqQdulBGRL/i+/8RUg9edV/b9MRCwDEBExJYEaBeZpqlu8vv/Pm5
	F2OjEdwgOtquMtYtzoNED/oEOkY5zQ/FPK47jePIBSoQGV7jL9j60UggiwMs9yocIDShGjdYh7SPJ
	rV+GTOiSRDzdLpcHBPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6So-00FpCc-3Y; Mon, 22 Nov 2021 10:22:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5yW-00Fgvw-LS; Mon, 22 Nov 2021 09:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574660; x=1669110660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=17phCVrKoimT4HXVBeX0wXd8LHu2vItY1iyBPoAvTEY=;
 b=2AfmWXkBVJi9KGQ0agZ8j+CK/92Cx9jlkrWYXUjM8UKpxloKK55N98Sk
 QLy2bfFN2voSOkpFPNsUh/OePSbBNxSZQi3pVQ41MZ8B/RHIWXdxLJSiB
 go0qAC5AsgIeNaqfVc83EhggkCFK2XAtnVEzcbEhNCLloAEADwTuNNQqI
 WLYdRbtUWFnYK1Nc2FQniAjxiCk7JyyEq24DgDdOGyxmkbl85eSRC2GsE
 LvE6DTbdTQDDrIk5Jeyir+eBQ7WDo6XN6aeU/UoEEos205el0+bEpDIcB
 nGnrHhtPR7vg3i92SbsKsoq4nz41pYnA9kYSAeys5f/CBkeFvUvqfcWGh A==;
IronPort-SDR: QsUl7mOZ2QC/bG/WfFTcJhA8dQ+h5Mg8awI4epPrTFIYTdzx9iD5BjuKj9XAGs4LCa7cjHmecG
 sZ+qLdNErNIyMrMCM/HvY6k5VgXqONV+FiHCNK6chRkccbZ5KtCq3dBd13QBgClh6leQCXf9x2
 VC/NLl6MZ/XsLwW66l2HUhVc9DBCNhiBU8ceEsk+/sHsEe+6KUP+og79TgPWbmR1eCnPMEIMVw
 wlzcVUiszBz2ZY7/6Cmn0NYBE5vIeOOe2fPUWiFe6C1PSnLSRpjZPfepdJvV9oA2r9p9JDGArX
 /FrTXxA0gxvYrBGN3pOUbDKm
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="137310430"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:50:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:50:58 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:50:53 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 06/13] mtd: spi-nor: Introduce spi_nor_init_flags()
Date: Mon, 22 Nov 2021 11:50:13 +0200
Message-ID: <20211122095020.393346-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015100_810000_9A2B66B0 
X-CRM114-Status: GOOD (  14.15  )
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
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
v4: rename method to spi_nor_init_flags

 drivers/mtd/spi-nor/core.c | 89 ++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a2d09b722fed..14f92d105878 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2643,6 +2643,55 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
+/**
+ * spi_nor_init_flags() - Initialize NOR flags for settings that are not defined
+ * in the JESD216 SFDP standard, thus can not be retrieved when parsing SFDP.
+ * @nor:	pointer to a 'struct spi_nor'
+ */
+static void spi_nor_init_flags(struct spi_nor *nor)
+{
+	struct device_node *np = spi_nor_get_flash_node(nor);
+	const u16 flags = nor->info->flags;
+
+	if (of_property_read_bool(np, "broken-flash-reset"))
+		nor->flags |= SNOR_F_BROKEN_RESET;
+
+	if (flags & SPI_NOR_SWP_IS_VOLATILE)
+		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
+
+	if (flags & SPI_NOR_HAS_LOCK)
+		nor->flags |= SNOR_F_HAS_LOCK;
+
+	if (flags & SPI_NOR_HAS_TB) {
+		nor->flags |= SNOR_F_HAS_SR_TB;
+		if (flags & SPI_NOR_TB_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
+	}
+
+	if (flags & SPI_NOR_4BIT_BP) {
+		nor->flags |= SNOR_F_HAS_4BIT_BP;
+		if (flags & SPI_NOR_BP3_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
+	}
+
+	if (flags & NO_CHIP_ERASE)
+		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
+
+	if (flags & USE_CLSR)
+		nor->flags |= SNOR_F_USE_CLSR;
+
+	if (flags & USE_FSR)
+		nor->flags |= SNOR_F_USE_FSR;
+
+	/*
+	 * Make sure the XSR_RDY flag is set before calling
+	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
+	 * with Atmel SPI NOR.
+	 */
+	if (flags & SPI_NOR_XSR_RDY)
+		nor->flags |=  SNOR_F_READY_XSR_RDY;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2660,6 +2709,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	if (nor->info->fixups && nor->info->fixups->late_init)
 		nor->info->fixups->late_init(nor);
 
+	spi_nor_init_flags(nor);
+
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
 	 * the default ones.
@@ -3094,10 +3145,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	const struct flash_info *info;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = &nor->mtd;
-	struct device_node *np = spi_nor_get_flash_node(nor);
 	int ret;
 	int i;
-	u16 flags;
 	u8 fixup_flags;
 
 	ret = spi_nor_check(nor);
@@ -3128,52 +3177,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return PTR_ERR(info);
 
 	nor->info = info;
-	flags = info->flags;
 
 	spi_nor_debugfs_init(nor, info);
 
 	mutex_init(&nor->lock);
 
-	/*
-	 * Make sure the XSR_RDY flag is set before calling
-	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
-	 * with Atmel SPI NOR.
-	 */
-	if (flags & SPI_NOR_XSR_RDY)
-		nor->flags |=  SNOR_F_READY_XSR_RDY;
-
-	if (flags & SPI_NOR_HAS_LOCK)
-		nor->flags |= SNOR_F_HAS_LOCK;
-
 	/* Init flash parameters based on flash_info struct and SFDP */
 	ret = spi_nor_init_params(nor);
 	if (ret)
 		return ret;
 
-	if (flags & USE_FSR)
-		nor->flags |= SNOR_F_USE_FSR;
-	if (flags & SPI_NOR_HAS_TB) {
-		nor->flags |= SNOR_F_HAS_SR_TB;
-		if (flags & SPI_NOR_TB_SR_BIT6)
-			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
-	}
-
-	if (flags & NO_CHIP_ERASE)
-		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-	if (flags & USE_CLSR)
-		nor->flags |= SNOR_F_USE_CLSR;
-	if (flags & SPI_NOR_SWP_IS_VOLATILE)
-		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
-
-	if (flags & SPI_NOR_4BIT_BP) {
-		nor->flags |= SNOR_F_HAS_4BIT_BP;
-		if (flags & SPI_NOR_BP3_SR_BIT6)
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
