Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9678AC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NjEdj4F8193pJNAX4CU46gFItiRhXGvTN0lCiaIbo0=; b=cZMQkC17yW8nMo
	9jtx6WMX9r0MD72LS0cXgcr2d7xEghYsFo9q0NzmBsHpAzEPusU5Gw+fLBzCWgQ9amuAtq41vYxFI
	gJ0SPog96ATvBKkmZC81Fq5Gn9C6DXtHoDMhEM0pLQeRzMgiFEH1KIlz8jhaYIjqhafFs1CPiJhOg
	NS1xhwaEnE6MXuQ5/szgDaciSGQRPsUk4RDTLbTKAei852ubU1rXD7/LMJ3D73EmY37xVBYygYADr
	+MkfXIBdVgfa+AbiFMhpKgRGl8lkeiiIEABka4vs6rpGVVWbKWCOrsDzxud4m7EmFgT44Pn5JB9QW
	4L5ugnjb3CB3GwCVGSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9ZM-00GAC8-1Y; Fri, 03 Dec 2021 14:29:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9TM-00G80Y-1s; Fri, 03 Dec 2021 14:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541415; x=1670077415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H+JO0eXqKQCx65XOoqAFPUE+0amaCBHar6gYvzMZtgA=;
 b=Ag+XVUe+KLjfEVu7R4dcynTmRfIwYXQ6oiDtAvpQs4LHlIBruqoCNysD
 aREFQfuXeQ9Eu3/PR9BYHI3OPtvifmGWjZKF+I71v5G2ia6ieuOsLCu4Z
 ymPMHGln5AbDUwqzMRIzIZcioDfXqRIlJeD6JMjdNBwN3Cj+mQf1j3K4l
 n9Xqjjj2J1jleBy9Y5ToqsRQtU2xXawFb/5ZkQwgxT1S9BZCtsyfQ4pJ5
 A6PDR47PPfZpX1aLPafAnabzd0Kd/BjsrEIC/b2xLuJj4Aq6RDnVUrncr
 dx513uqBEDxgmo4VVq/xc/68OBR2zWy7E8pXCBDD1dRy/eM6rdwAVfet2 g==;
IronPort-SDR: DMpv/sM5aqzJviSD0HBY1A1x+TVM+BKoekjpwDIML6VeNyg/Nr6ATJWicVx/1nse3aZCY4sufA
 cwnGnDxWgv1l8nbjMvanh2HE7EF4G4RQT+0Pg48o78+v5VwpPRCvsnAJB47ns6IAr7+k1WdMlM
 +ol2lilOBRZNL6ae7u17dXq/VxYflwznJCaJTH94e3p2zfejKYts6C5tgl9Fg1xBuNwgb4lbQQ
 vtA7wu9ppGPEBIMj6bE9t436RADcXbj+FFqHiK1sRXh3nKQBoEMO6Riq1bMxiaw5syMpIBeXrr
 tXemM+ECC5OhdUXTxYKKSprU
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="154174802"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:34 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:30 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 07/14] mtd: spi-nor: Introduce spi_nor_init_flags()
Date: Fri, 3 Dec 2021 16:22:49 +0200
Message-ID: <20211203142256.47370-8-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062336_185136_2DCADDB0 
X-CRM114-Status: GOOD (  14.26  )
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
