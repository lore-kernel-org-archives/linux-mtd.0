Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3C4C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:46:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97317610E5
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97317610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOGlBiGwTxqtwUPSUXB3FAqF5+txueNSkvJrUUZ+3RI=; b=p2BwJGyBquzwdr
	X45vHgtY+OZCmoU+amQjNKi+N5dkUAg1DjMGoDy/gl166H3hBb/L9cJ0eZvIh412Y+tqrfTQIO2t9
	R0VHZec6ZQW/RTrN01uHHZ8aDD0oZm3VMPB3tH1IBMv3Hmkak/MYj0fjY+vokl3erEsUgS76rmaEQ
	J2fjEM88RYoa4fveSnldPkl9MfNV60pZG7ouYL31fLC/VpkloVzOEg3dG4f1XGdpsjYOZwdzzK7Rr
	1LjPms3NgVLTCNvr42W5Gc1ylP7xtXsJXDJOeSoZMWrl52OIyGsZi1wf3rkynFvxDe1MJFsbdHRTk
	gNCFPkXpfp28psAX0wXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Fu7-00DTBm-UC; Tue, 27 Jul 2021 05:45:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F6L-00DHik-Cp; Tue, 27 Jul 2021 04:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361637; x=1658897637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iMd5MF3VKOKvR/sNxHGUhRLlcKGvQ0L1ZdjRzhncJT8=;
 b=VZS/8e+2aFgnIDsC6RnRBr+jmx1zll2z952ScNV65D/vuEFWDCNcP1AK
 9yEz1H5FWARF9ApCzTanZdJBPvnp+ycmyywwu92ylAlArBDBUB714+KQm
 k2krCxgpnrdBv9g6/39c641VR8bI/tF9NIdrEQHph4dlQByAGPe02xHyT
 AwM3TDvblJqvBnj22NPWZjhMTfUl5+fEETOfJw/qem+ahc6/j9BSz32NL
 mlJCcerstirvT20uDvGODq+v/jMBAVSJ4OKinYTgsvhrPfYZyEfu6qRsG
 UZ7RZUQDFE/s6H+WGnUae0+ExBJU9T0+h3jKwJcfWz9OgONSnbh007+KG Q==;
IronPort-SDR: 43bZDfU9h4Z1yTrDDpACfmFA7P4FPFmgMt5wmojZ7NcVLiPRTjYFN0oU9rDrO1mS7uqC0KUFdM
 iZ6u+XiHdY7B6dlfguQ5KKpAFNiTSeJgzTPTRv0nMDIhogFi7Nus4jITDe3wpJktcBmdRt6+t0
 25qgJtPVsTM9fAog9r+ltDzX0HPqju+GeoSalNWK9Y1YXlZfg/iU7QsUl+omaLY9aLhBL0XfBm
 cazEA4DepdOUJs7GHqrWrFebUe80Bvks3N9c3XENF7CH33y8i8mBJBSPWdPM/GJ0L3CZGeYNSC
 avr80q7BIC+xODeQbj9I41Fr
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="137654021"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:56 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:51 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 17/35] mtd: spi-nor: Introduce spi_nor_nonsfdp_flags_init()
Date: Tue, 27 Jul 2021 07:52:04 +0300
Message-ID: <20210727045222.905056-18-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215357_524632_84C687CF 
X-CRM114-Status: GOOD (  14.63  )
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

Used to initialize the NOR flags for settings that are not defined
in the JESD216 SFDP standard, thus can not be retrieved when parsing
SFDP. No functional change.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 88 ++++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1f38fa8ab2fa..6a8617346764 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2687,6 +2687,56 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 		spi_nor_init_default_locking_ops(nor);
 }
 
+/**
+ * spi_nor_nonsfdp_flags_init() - Initialize NOR flags for settings that are not
+ * defined in the JESD216 SFDP standard, thus can not be retrieved when parsing
+ * SFDP.
+ * @nor:	pointer to a 'struct spi_nor'
+ */
+static void spi_nor_nonsfdp_flags_init(struct spi_nor *nor)
+{
+	const struct flash_info *info = nor->info;
+	struct device_node *np = spi_nor_get_flash_node(nor);
+
+	if (of_property_read_bool(np, "broken-flash-reset"))
+		nor->flags |= SNOR_F_BROKEN_RESET;
+
+	if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
+		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
+
+	if (info->flags & SPI_NOR_HAS_LOCK)
+		nor->flags |= SNOR_F_HAS_LOCK;
+
+	if (info->flags & SPI_NOR_HAS_TB) {
+		nor->flags |= SNOR_F_HAS_SR_TB;
+		if (info->flags & SPI_NOR_TB_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
+	}
+
+	if (info->flags & SPI_NOR_4BIT_BP) {
+		nor->flags |= SNOR_F_HAS_4BIT_BP;
+		if (info->flags & SPI_NOR_BP3_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
+	}
+
+	if (info->flags & NO_CHIP_ERASE)
+		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
+
+	if (info->flags & USE_FSR)
+		nor->flags |= SNOR_F_USE_FSR;
+
+	if (info->flags & USE_CLSR)
+		nor->flags |= SNOR_F_USE_CLSR;
+
+	/*
+	 * Make sure the XSR_RDY flag is set before calling
+	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
+	 * with Atmel SPI NOR.
+	 */
+	if (info->flags & SPI_NOR_XSR_RDY)
+		nor->flags |=  SNOR_F_READY_XSR_RDY;
+}
+
 /**
  * spi_nor_init_params() - Initialize the flash's parameters and settings.
  * @nor:	pointer to a 'struct spi_nor'.
@@ -2736,6 +2786,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
 
 	spi_nor_late_init_params(nor);
 
+	spi_nor_nonsfdp_flags_init(nor);
+
 	return 0;
 }
 
@@ -3078,7 +3130,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	const struct flash_info *info;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = &nor->mtd;
-	struct device_node *np = spi_nor_get_flash_node(nor);
 	int ret;
 	int i;
 
@@ -3115,17 +3166,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
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
 	mtd->_write = spi_nor_write;
 
 	/* Init flash parameters based on flash_info struct and SFDP */
@@ -3147,27 +3187,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_get_device = spi_nor_get_device;
 	mtd->_put_device = spi_nor_put_device;
 
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
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 
@@ -3175,9 +3194,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	nor->page_size = nor->params->page_size;
 	mtd->writebufsize = nor->page_size;
 
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
