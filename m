Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B30C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:27:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6332A61103
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6332A61103
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfEXnfMWnHDHTnE1Ydty+n2fCidTbqEmx43CCX36ca4=; b=Fm/EBkVSkJWUVt
	n8XRGk/gsCG4raQo+HdX46ct9rMZ1x45NRA/+GMLV66T5M3mnoQNHhMm720x/vii42MRLn2IHQthB
	KFF4tj/p5J2b1/AmkcuaS40jgjw8M+NCjph5XK5HtVZvpMgluV6tpP4EPZYMn1By6xijRm3ppVc9b
	w9qAl7ulTz3vKbljOSjzqrNN19vuKYtadR2jUMRVCF5oPHJKpabIGsInAQcUjm81JyBQWIyZqy1PS
	PCy4uCtlJQEHEJpTqZUmR/vBIx3CxRQZvjgqIQ66Qg6lH2nowTHF7e6mJ/jAJk96qNXb9RZnXEUxd
	kX8jY0hQW1l6MxlTHB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8GYc-00DcXF-4R; Tue, 27 Jul 2021 06:27:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F75-00DHwD-6r; Tue, 27 Jul 2021 04:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361683; x=1658897683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OxxpDnFl3yWu3prwePBKq7v9bIv3vcU9pe64UwmCXqY=;
 b=vkmUFd6bh3mSabvJsU9nBfEB5DP89LDGTFmHDkDoBzdJEKxoKh+jzK/Q
 eM1ar5ygGjOqOSVY+flVTE1toMZ67CifDCatat/9Drf2zVbldPYoGmSiR
 MEm2PojS8MEAYnzDMsFDosLt05uVUTkxd5u70pW4efR8AmIOT7pDUis9I
 BA+K/mrhjlooT/BXJdLGGAuACyYkqbKs/EdDex8abl9VD0HfDKLCgUXrF
 P2/wzUZGBU/3elP9Bs0SSUA6eWy4ft5nH060FJARZFqN0ep2uekSZ5pOb
 cdpWeqfwoBJBZKQSW5m0to0dPf7/eZr5RtQp/lxsex09TsXFwfOsx8Mxb Q==;
IronPort-SDR: 8EjOtTq65UKyJ36ANh7Mac3HYr0vIIC3VzKNDKUxL8ZIfAQgGJVq/bCcJQwFA8C9SUgLoM9dUk
 aP06lmjD3A/ssEZnJPsPpweqAY9iJJmaxuYgMAIo0Ju807bN524h6M/zB5M3nm6T6IlKJZG66q
 82e3cxGiC5Lae6QkzA315J4UHwCgi0xxVC5dTNF6VkoQRCpQFGqa4QwZoOv1tOPOZOAtN4MPdG
 MjZb5ytXkr9Ce+sit6SVV55VL0iVYNF5hFs6MbaLOyCKT8o8pXWOPdOJEdktPW9Zw/aruX2dM/
 LNY0y3JZoEvgL3PNOi8cXRtl
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="126055092"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:54:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:54:41 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:36 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 26/35] mtd: spi-nor: core: Introduce
 spi_nor_init_default_params()
Date: Tue, 27 Jul 2021 07:52:13 +0300
Message-ID: <20210727045222.905056-27-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215443_397778_74C7C345 
X-CRM114-Status: GOOD (  13.16  )
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

Called for all flashes, regardless if they define SFDP tables or not.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 92 +++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b3a01d7d6f0b..9193317f897d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2543,6 +2543,56 @@ static int spi_nor_setup(struct spi_nor *nor,
 	return spi_nor_set_addr_width(nor);
 }
 
+/**
+ * spi_nor_init_default_params() - Default initialization of flash parameters
+ * and settings. Done for all flashes, regardless is they define SFDP tables
+ * or not.
+ * @nor:	pointer to a 'struct spi_nor'.
+ */
+static void spi_nor_init_default_params(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	const struct flash_info *info = nor->info;
+	struct device_node *np = spi_nor_get_flash_node(nor);
+
+	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
+	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
+	params->setup = spi_nor_default_setup;
+	params->otp.org = &info->otp_org;
+
+	/* Default to 16-bit Write Status (01h) Command */
+	nor->flags |= SNOR_F_HAS_16BIT_SR;
+
+	/* Set SPI NOR sizes. */
+	params->writesize = 1;
+	params->size = (u64)info->sector_size * info->n_sectors;
+	params->page_size = info->page_size;
+
+	if (!(info->flags & SPI_NOR_NO_FR)) {
+		/* Default to Fast Read for DT and non-DT platform devices. */
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
+
+		/* Mask out Fast Read if not requested at DT instantiation. */
+		if (np && !of_property_read_bool(np, "m25p,fast-read"))
+			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
+	}
+
+	/* (Fast) Read settings. */
+	params->hwcaps.mask |= SNOR_HWCAPS_READ;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
+				  0, 0, SPINOR_OP_READ,
+				  SNOR_PROTO_1_1_1);
+
+	if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
+					  0, 8, SPINOR_OP_READ_FAST,
+					  SNOR_PROTO_1_1_1);
+	/* Page Program settings. */
+	params->hwcaps.mask |= SNOR_HWCAPS_PP;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
+				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
+}
+
 /**
  * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
  * settings based on MFR register and ->default_init() hook.
@@ -2609,43 +2659,8 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
 	const struct flash_info *info = nor->info;
-	struct device_node *np = spi_nor_get_flash_node(nor);
 	u8 i, erase_mask;
 
-	/* Initialize default flash parameters and settings. */
-	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
-	params->setup = spi_nor_default_setup;
-	params->otp.org = &info->otp_org;
-
-	/* Default to 16-bit Write Status (01h) Command */
-	nor->flags |= SNOR_F_HAS_16BIT_SR;
-
-	/* Set SPI NOR sizes. */
-	params->writesize = 1;
-	params->size = (u64)info->sector_size * info->n_sectors;
-	params->page_size = info->page_size;
-
-	if (!(info->flags & SPI_NOR_NO_FR)) {
-		/* Default to Fast Read for DT and non-DT platform devices. */
-		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
-
-		/* Mask out Fast Read if not requested at DT instantiation. */
-		if (np && !of_property_read_bool(np, "m25p,fast-read"))
-			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
-	}
-
-	/* (Fast) Read settings. */
-	params->hwcaps.mask |= SNOR_HWCAPS_READ;
-	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
-				  0, 0, SPINOR_OP_READ,
-				  SNOR_PROTO_1_1_1);
-
-	if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
-		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
-					  0, 8, SPINOR_OP_READ_FAST,
-					  SNOR_PROTO_1_1_1);
-
 	if (info->flags & SPI_NOR_DUAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
@@ -2674,11 +2689,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 					  SNOR_PROTO_8_8_8_DTR);
 	}
 
-	/* Page Program settings. */
-	params->hwcaps.mask |= SNOR_HWCAPS_PP;
-	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
-				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
-
 	if (info->flags & SPI_NOR_OCTAL_DTR_PP) {
 		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 		/*
@@ -2823,6 +2833,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	if (!nor->params)
 		return -ENOMEM;
 
+	spi_nor_init_default_params(nor);
+
 	spi_nor_info_init_params(nor);
 
 	spi_nor_manufacturer_init_params(nor);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
