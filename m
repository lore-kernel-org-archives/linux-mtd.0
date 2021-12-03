Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBEEC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvibHjid9wNBaRWlcZphdMWdymNY5PHQHy+J+4HYitw=; b=oGmp6Hyc+UiraE
	JLsM4Qj0vlOa0SlFUFU8Ut6qGdBZZfvivIrzDTmar8UtsElq0MQlMsj3eZaW1gXvXzswXCCARkVfO
	FHTXaMKBPPg5lYHi9DeQ1iZThuac+U+EDl4fG29NEIY/rB4IWWVXCB8DBJEPHMZb8cMqp0KrONucU
	Ah8QYjutvKvoK0xc7IRlnVkLmhHp9XNfwMGHjcaJCOAN0K4OYBxfxLO+uZrLWoq+bvwaFdKfci/bX
	juv0eJNXBSIJvhdV2RhYWtKkjdIbJHs1w7EuY659j2AnxxvTWxkcZvluizGd3UTn2WI/e4e1QSojp
	Mp26Nw5wCpEK2VlRrFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9i1-00GCO9-Cx; Fri, 03 Dec 2021 14:38:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9TV-00G83B-Pu; Fri, 03 Dec 2021 14:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541425; x=1670077425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFyuhoePqZDdUXcjWN9cMq+DpVz9cr7i1pX5uIlLKI4=;
 b=PASd/lhpdI/7W/7kB9gIQNZlGp9VsJ7x/e9M82IynDSF/y3kxfDQdCw5
 LvZPfpn+j8RCDnPapf083HB/4BN0e2AqYN38vZ1XJVs7l5JSCUE8oQWVP
 /fX0CL4eMPpbEYINwmz+1+rXa2Hfe6ihfIkDgn2nsGJRDmrB1tJanOpwL
 DcN+Ct1VUjrMDwoQYl2E7s/DLG1Iq/FeBaEjPWSDw28qGHqJ5/T69HiXO
 kUYJpbntPgEpAUl9TbriT/tJXzsaIqEHeorCJOd10BuJbK6Qmuau8BQAl
 6BP8FgI3N+6mjGWnyKqYzSXaZU1k4n5KSlGUig8lZ9ydxYyWevR0V3aCB w==;
IronPort-SDR: zOy8KjP+iV3k6PJrjh/n41QiGAad7TgEX8KYPMyibSYmfqIidD9eZ+Ci7vNOvxPY6l8pjukhUg
 51dsaxkdBKMFyfppH1xK7kPDOj+j2/+M5WOV+XiLhVBggjlJ8evPVK+p4DGO4gQNSRnWFUveZ0
 XnvCfGCcoX3e8TlwX1cSs/Jz7tcOZX1jHwYs8dKU4g7mbN3dEvqEsomdiRJyp2ljuXxkrYv5fZ
 avAjhvEyT3OmUtqWHdCSyLC7YwusuQiXXQZbTNnXgtvYKG8p+ehS+7rtvYgkN4w/Iaz5D61Ejy
 5RN2YGefJo3c2ySd6mbIUs0M
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="78424715"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:44 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:39 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 09/14] mtd: spi-nor: core: Init all flash parameters based
 on SFDP where possible
Date: Fri, 3 Dec 2021 16:22:51 +0200
Message-ID: <20211203142256.47370-10-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062345_992988_08B390A7 
X-CRM114-Status: GOOD (  26.29  )
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

New flash additions that support SFDP should be declared with
PARSE_SFDP and with all the other flags that are not SFDP
discoverable.

Keep the old way of initializing the flash, until all the flashes
are converted to use either PARSE_SFDP or SPI_NOR_SKIP_SFDP.

Flashes that declare PARSE_SFDP do not have a roll-back mechanism
because if spi_nor_parse_sfdp() returns an error it means that either
BFPT is not supported, thus SFDP is not supported and the user didn't
correctly declared the flash_info entry, or some memalloc failed.
Either way we should return an error. The rest of the SFDP tables are
optional, if one of the optional SFDP tables fails, we just continue.
We would like to get rid of the default_init() hook, so the
spi_nor_manufacturer_init_params() is not called in the new sequnce
of flash initialization that is based solely on SFDP.

Split spi_nor_info_init_params() in spi_nor_init_default_params()
and spi_nor_no_sfdp_init_params(). spi_nor_init_default_params() is
called for all the flashes regardless if they support SFDP or not.
spi_nor_no_sfdp_init_params() is called just for the flashes that
do not define SFDP and initializes parameters and setting solely
based on flash_info data.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 194 ++++++++++++++++++++++---------------
 1 file changed, 116 insertions(+), 78 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 86bbd1ca22fc..d5eaf9a705ae 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2509,74 +2509,21 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
- * based on JESD216 SFDP standard.
+ * spi_nor_no_sfdp_init_params() - Initialize the flash's parameters and
+ * settings based on nor->info->sfdp_flags. This method should be called only by
+ * flashes that do not define SFDP tables. If the flash supports SFDP but the
+ * information is wrong and the settings from this function can not be retrieved
+ * by parsing SFDP, one should instead use the fixup hooks and update the wrong
+ * bits.
  * @nor:	pointer to a 'struct spi_nor'.
- *
- * The method has a roll-back mechanism: in case the SFDP parsing fails, the
- * legacy flash parameters and settings will be restored.
  */
-static void spi_nor_sfdp_init_params(struct spi_nor *nor)
-{
-	struct spi_nor_flash_parameter sfdp_params;
-
-	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
-
-	if (spi_nor_parse_sfdp(nor)) {
-		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_width = 0;
-		nor->flags &= ~SNOR_F_4B_OPCODES;
-	}
-}
-
-/**
- * spi_nor_info_init_params() - Initialize the flash's parameters and settings
- * based on nor->info data.
- * @nor:	pointer to a 'struct spi_nor'.
- */
-static void spi_nor_info_init_params(struct spi_nor *nor)
+static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const struct flash_info *info = nor->info;
-	struct device_node *np = spi_nor_get_flash_node(nor);
-	const u8 no_sfdp_flags = info->no_sfdp_flags;
+	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
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
 	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
@@ -2605,11 +2552,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 					  SNOR_PROTO_8_8_8_DTR);
 	}
 
-	/* Page Program settings. */
-	params->hwcaps.mask |= SNOR_HWCAPS_PP;
-	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
-				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
-
 	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_PP) {
 		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 		/*
@@ -2638,7 +2580,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 		i++;
 	}
 	erase_mask |= BIT(i);
-	spi_nor_set_erase_type(&map->erase_type[i], info->sector_size,
+	spi_nor_set_erase_type(&map->erase_type[i], nor->info->sector_size,
 			       SPINOR_OP_SE);
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
@@ -2739,6 +2681,98 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 		spi_nor_init_default_locking_ops(nor);
 }
 
+/**
+ * spi_nor_sfdp_init_params_deprecated() - Deprecated way of initializing flash
+ * parameters and settings based on JESD216 SFDP standard.
+ * @nor:	pointer to a 'struct spi_nor'.
+ *
+ * The method has a roll-back mechanism: in case the SFDP parsing fails, the
+ * legacy flash parameters and settings will be restored.
+ */
+static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter sfdp_params;
+
+	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
+
+	if (spi_nor_parse_sfdp(nor)) {
+		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
+		nor->addr_width = 0;
+		nor->flags &= ~SNOR_F_4B_OPCODES;
+	}
+}
+
+/**
+ * spi_nor_init_params_deprecated() - Deprecated way of initializing flash
+ * parameters and settings.
+ * @nor:	pointer to a 'struct spi_nor'.
+ *
+ * The method assumes that flash doesn't support SFDP so it initializes flash
+ * parameters in spi_nor_no_sfdp_init_params() which later on can be overwritten
+ * when parsing SFDP, if supported.
+ */
+static void spi_nor_init_params_deprecated(struct spi_nor *nor)
+{
+	spi_nor_no_sfdp_init_params(nor);
+
+	spi_nor_manufacturer_init_params(nor);
+
+	if ((SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_OCTAL_READ |
+	     SPI_NOR_OCTAL_DTR_READ) &&
+	    !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
+		spi_nor_sfdp_init_params_deprecated(nor);
+}
+
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
  * spi_nor_init_params() - Initialize the flash's parameters and settings.
  * @nor:	pointer to a 'struct spi_nor'.
@@ -2759,7 +2793,7 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  * which can be overwritten by:
  * 3/ SFDP flash parameters initialization. JESD216 SFDP is a standard and
  *    should be more accurate that the above.
- *		spi_nor_sfdp_init_params()
+ *		spi_nor_parse_sfdp() or spi_nor_sfdp_init_params_deprecated()
  *
  *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
  *    the flash parameters and settings immediately after parsing the Basic
@@ -2773,24 +2807,28 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
  * tables are not defined at all.
  *		spi_nor_late_init_params()
+ *
+ * Return: 0 on success, -errno otherwise.
  */
 static int spi_nor_init_params(struct spi_nor *nor)
 {
+	int ret;
+
 	nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
 	if (!nor->params)
 		return -ENOMEM;
 
-	spi_nor_info_init_params(nor);
-
-	spi_nor_manufacturer_init_params(nor);
+	spi_nor_init_default_params(nor);
 
-	if ((nor->info->parse_sfdp ||
-	     (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
-					  SPI_NOR_QUAD_READ |
-					  SPI_NOR_OCTAL_READ |
-					  SPI_NOR_OCTAL_DTR_READ))) &&
-	    !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
-		spi_nor_sfdp_init_params(nor);
+	if (nor->info->parse_sfdp) {
+		ret = spi_nor_parse_sfdp(nor);
+		if (ret) {
+			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
+			return ret;
+		}
+	} else {
+		spi_nor_init_params_deprecated(nor);
+	}
 
 	spi_nor_late_init_params(nor);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
