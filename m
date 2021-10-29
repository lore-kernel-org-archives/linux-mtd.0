Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA54AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:19:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A5C60FC1
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77A5C60FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6W5V3egTAFu0C4R4kGXmjUX/3PwRSPc1pEwihDR0wso=; b=PB00s5Q58QUdzj
	kq+SeaC503XNlljEbp9n3oJWbkjWqOVig7DIUdQLSpOCbwkOuKYuntop3rQ+347WYZt31ijFFkiJ2
	Z9nnXVNAPA9zMUNAlS2TY73tiBoSQBJS4m6jBlrtzu5tUU66EHaUWPJ9pdOROnH5Uo6RxFArx9/xr
	Y6b+6+oDRisBj5Say3iNvVzrhYi2IwLBSykijOaEzb5xgwzg/EVr2yDaxiWerSushZJnbVMHeq0AK
	5jebCwCCPUrbCOLGtlExOL5LukX58J19A3URWEtcywqffiGABmNMXYaWxPWKr4DnrEIVcDmRoIEMz
	2rpdb8AvFIcMNZnmMl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWSJ-00Bkp2-Gs; Fri, 29 Oct 2021 18:18:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfn-00BZTY-M0; Fri, 29 Oct 2021 17:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528491; x=1667064491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nbF94a3cQI+g7VulTyXmX+awEB+SHnIwGT9G+469M6k=;
 b=rnet2A5cRuJQX22qhKk9O6b3Em5vaA0GQ6ugbMkTy16e0W5gshNE73Dm
 1Mi2i3lSk6Pyh2bxiXWWSjQheMlVuZpRvAoGUsvx9q209LGwLykWyQ4dc
 VWvVqVodOzOfBLCkPjQvv30PKTXNx2cxhqxfJBl1og0YS0JbSkjBCgq/A
 sgLdBxCGQpborDJWacdA8yvM3OEnU8d9i5k62ph2hP/7y0k4/zY8E7PDE
 H+sMoG4mGKzw1IGbmHa34bCWs1mu5AiGLzLOqzsD3ywqNPKYvnJco8oi3
 gL3Q68ghNquWL8tNM+PG+O3qa/4tGwCvRXp/lkjo88JTKMT2eXjeKNA3c Q==;
IronPort-SDR: Z0qQRfyks+xCcbgW/o8b69NIGXkl/drUzmfaWJz6pXZ6tu954559ldFM+OiRpIBMMzZ19EJXqZ
 mYSw04l61FzADAZLyQGtzBFKcWWLjAhiHIgRvRG3Dm52fFX5cS8KBG1yI64uSAUft4LhF5j8nJ
 H4yiXDXXR6o+e9P48CSJJrGV+65oJ0yCfEHaOE2nOJEorSt8EiM06bLnhXKBIzrMzwQvNQ0oKh
 XYGJ5T1ZlnaHKURww7lNWrRol9jAeIoqyDsejZCOfDxNuMQcEG/jsqZr+VltR3erCmI1+WJwmz
 /RhPMtsddZig5llJXdef0x3A
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="74732905"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:28:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:28:10 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:28:05 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 18/25] mtd: spi-nor: core: Init flash params based on SFDP
 first for new flash additions
Date: Fri, 29 Oct 2021 20:26:26 +0300
Message-ID: <20211029172633.886453-19-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102811_837182_E76739AC 
X-CRM114-Status: GOOD (  19.47  )
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

New flash additions that support SFDP should be declared with
SPI_NOR_PARSE_SFDP and with all the other flags that are not SFDP
discoverable.
Keep the old way of initializing the flash, until all the flashes
are converted to use either SPI_NOR_PARSE_SFDP or SPI_NOR_SKIP_SFDP.
Since we want to get rid of the default_init() hook, the rollback
mechanism for flashes that use SPI_NOR_PARSE_SFDP does not call
spi_nor_manufacturer_init_params().
Split spi_nor_info_init_params() in spi_nor_init_default_params()
and spi_nor_skip_sfdp_init_params(). spi_nor_init_default_params() is
called for all the flashes regardless if they support SFDP or not.
spi_nor_skip_sfdp_init_params() is called just for the flashes that
do not define SFDP and initializes parameters and setting solely based
on flash_info data.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 187 +++++++++++++++++++++----------------
 1 file changed, 105 insertions(+), 82 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 40d98ae300ca..c509f257a6c3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2493,6 +2493,56 @@ static int spi_nor_setup(struct spi_nor *nor,
 	return nor->params->setup(nor, hwcaps);
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
@@ -2528,109 +2578,46 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
- * based on JESD216 SFDP standard.
- * @nor:	pointer to a 'struct spi_nor'.
- *
- * The method has a roll-back mechanism: in case the SFDP parsing fails, the
- * legacy flash parameters and settings will be restored.
- */
-static void spi_nor_sfdp_init_params(struct spi_nor *nor)
-{
-	struct spi_nor_flash_parameter sfdp_params;
-
-	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
-
-	if (!spi_nor_parse_sfdp(nor)) {
-		spi_nor_post_sfdp_fixups(nor);
-	} else {
-		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_width = 0;
-		nor->flags &= ~SNOR_F_4B_OPCODES;
-	}
-}
-
-/**
- * spi_nor_info_init_params() - Initialize the flash's parameters and settings
- * based on nor->info data.
+ * spi_nor_skip_sfdp_init_params() - Initialize the flash's parameters and
+ * settings based on nor->info data.
  * @nor:	pointer to a 'struct spi_nor'.
  */
-static void spi_nor_info_init_params(struct spi_nor *nor)
+static void spi_nor_skip_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const struct flash_info *info = nor->info;
-	struct device_node *np = spi_nor_get_flash_node(nor);
+	const u32 info_flags = nor->info->flags & SFDP_FLAGS_MASK;
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
-	if (info->flags & SPI_NOR_DUAL_READ) {
+	if (info_flags & SPI_NOR_DUAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
 					  0, 8, SPINOR_OP_READ_1_1_2,
 					  SNOR_PROTO_1_1_2);
 	}
 
-	if (info->flags & SPI_NOR_QUAD_READ) {
+	if (info_flags & SPI_NOR_QUAD_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
 					  0, 8, SPINOR_OP_READ_1_1_4,
 					  SNOR_PROTO_1_1_4);
 	}
 
-	if (info->flags & SPI_NOR_OCTAL_READ) {
+	if (info_flags & SPI_NOR_OCTAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_8],
 					  0, 8, SPINOR_OP_READ_1_1_8,
 					  SNOR_PROTO_1_1_8);
 	}
 
-	if (info->flags & SPI_NOR_OCTAL_DTR_READ) {
+	if (info_flags & SPI_NOR_OCTAL_DTR_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
 					  0, 20, SPINOR_OP_READ_FAST,
 					  SNOR_PROTO_8_8_8_DTR);
 	}
 
-	/* Page Program settings. */
-	params->hwcaps.mask |= SNOR_HWCAPS_PP;
-	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
-				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
-
-	if (info->flags & SPI_NOR_OCTAL_DTR_PP) {
+	if (info_flags & SPI_NOR_OCTAL_DTR_PP) {
 		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 		/*
 		 * Since xSPI Page Program opcode is backward compatible with
@@ -2646,23 +2633,49 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	 */
 	erase_mask = 0;
 	i = 0;
-	if (info->flags & SECT_4K_PMC) {
+	if (info_flags & SECT_4K_PMC) {
 		erase_mask |= BIT(i);
 		spi_nor_set_erase_type(&map->erase_type[i], 4096u,
 				       SPINOR_OP_BE_4K_PMC);
 		i++;
-	} else if (info->flags & SECT_4K) {
+	} else if (info_flags & SECT_4K) {
 		erase_mask |= BIT(i);
 		spi_nor_set_erase_type(&map->erase_type[i], 4096u,
 				       SPINOR_OP_BE_4K);
 		i++;
 	}
 	erase_mask |= BIT(i);
-	spi_nor_set_erase_type(&map->erase_type[i], info->sector_size,
+	spi_nor_set_erase_type(&map->erase_type[i], nor->info->sector_size,
 			       SPINOR_OP_SE);
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
+/**
+ * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
+ * based on JESD216 SFDP standard.
+ * @nor:	pointer to a 'struct spi_nor'.
+ *
+ * The method has a roll-back mechanism: in case the SFDP parsing fails, the
+ * legacy flash parameters and settings will be restored.
+ */
+static void spi_nor_sfdp_init_params(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter sfdp_params;
+
+	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
+
+	if (!spi_nor_parse_sfdp(nor)) {
+		spi_nor_post_sfdp_fixups(nor);
+	} else {
+		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
+		nor->addr_width = 0;
+		nor->flags &= ~SNOR_F_4B_OPCODES;
+
+		if (nor->info->flags & SPI_NOR_PARSE_SFDP)
+			spi_nor_skip_sfdp_init_params(nor);
+	}
+}
+
 /**
  * spi_nor_nonsfdp_init_flags() - Initialize NOR flags for settings that are not
  * defined in the JESD216 SFDP standard, thus can not be retrieved when parsing
@@ -2760,6 +2773,19 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 		spi_nor_init_default_locking_ops(nor);
 }
 
+static void spi_nor_init_params_deprecated(struct spi_nor *nor)
+{
+	spi_nor_skip_sfdp_init_params(nor);
+
+	spi_nor_manufacturer_init_params(nor);
+
+	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+				 SPI_NOR_OCTAL_READ |
+				 SPI_NOR_OCTAL_DTR_READ)) &&
+	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
+		spi_nor_sfdp_init_params(nor);
+}
+
 /**
  * spi_nor_init_params() - Initialize the flash's parameters and settings.
  * @nor:	pointer to a 'struct spi_nor'.
@@ -2801,15 +2827,12 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	if (!nor->params)
 		return -ENOMEM;
 
-	spi_nor_info_init_params(nor);
+	spi_nor_init_default_params(nor);
 
-	spi_nor_manufacturer_init_params(nor);
-
-	if ((nor->info->flags & (SPI_NOR_PARSE_SFDP |
-				 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
-	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
+	if (nor->info->flags & SPI_NOR_PARSE_SFDP)
 		spi_nor_sfdp_init_params(nor);
+	else
+		spi_nor_init_params_deprecated(nor);
 
 	spi_nor_late_init_params(nor);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
