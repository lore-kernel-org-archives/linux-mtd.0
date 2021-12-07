Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318E8C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NjEdj4F8193pJNAX4CU46gFItiRhXGvTN0lCiaIbo0=; b=CHYAyBF0rxPTIj
	NaywHg84Kcc3KGTbNjAxQXf3orvH5jLMTPft4DsZWyA03zBz1HEqjji9xLURCbDf4KNiYCim4/n++
	mQjmdkQ5ye8NmzduQEdU+rFtD3VwbVuvt3ATyfDB569O0WJ1/m31DTmn14n2P/WzKxrmHKO8Fgxzu
	P9lWjJz3c4r2CnM1rADbNLrL2ruAFR3Gef2hT16waRjaogJwKWKPdERUJCH6/gCaGPtzvu4Y6+6md
	s8tB3VnRCasBRdzmGlUF8+CQxyOqQY7VUuImD/kKcYYDDYkbxmM5l3YPS9eXabH69t01sMYuj+Cs2
	tie52kbL7nr6KnkCmi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mubFe-008sx6-PH; Tue, 07 Dec 2021 14:15:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub4G-008pA3-Hh; Tue, 07 Dec 2021 14:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885820; x=1670421820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H+JO0eXqKQCx65XOoqAFPUE+0amaCBHar6gYvzMZtgA=;
 b=S+Bl31kO2/isErxkm5TrtnF1g8VOsBGC6lr3PtPFcS4gbKijo7Mzp1QF
 zuYGKvqhOAqiHuQJkt/PIciSV+Eh3hNFZxju4OX3ikzUXb6oA28qss6Dj
 VZSna8UvgZjwb+R7hcFhuP/hlmnChQkM6IcBkRs4aNtsTb6+vVzOS7oSz
 S07i6x6+PCgEcrBq+N3DReidbfw/rFYYNirq0PXR/JattNIzM8vzU7oXN
 5PQ0jgjIXqFZh2c62psabFyRFTg0xAwvpjMTrcWLGTw+N1RwpJ3K++m82
 WFcImkdy09glisfqVHOnueipw3ytlTckOEXN3Ksz83ugG/AjwdSkW2E+P g==;
IronPort-SDR: jg1tXuxi0CMpLih+g+RScxG3tKurpHHMPJm6vG1l2Jl5F7CPFMvUk6rdMETv87SsXPKMOo3fuc
 A3PAz94uYkgD0emsX6iFc1LNatbqxUOuk97h7d5p9iYUVgH/XZgeaG+IlRws0hGzc60WGV0g04
 kqGChRPI3H+49KUYUoBXdL/nSKMRkbyPHGIYCso24JjFEosdo4EGkIPltBcH5moos/NkbM1gGd
 bhxWTRlVFAdhUg572Irnjca2+x6De7bXDN+vzruKnMOiLOzS2dVq8BG//zBsmMOO8S9nItmPv+
 XQAV1W5vKM/zLOZGLQtxQx8r
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="154563364"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:03:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:03:37 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:03:32 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 07/14] mtd: spi-nor: Introduce spi_nor_init_flags()
Date: Tue, 7 Dec 2021 16:02:47 +0200
Message-ID: <20211207140254.87681-8-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060340_647824_8D4F9F27 
X-CRM114-Status: GOOD (  14.42  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
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
 drivers/mtd/spi-nor/core.c | 89 ++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 25e2b4889093..1ac7e8de4b8e 100644
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
