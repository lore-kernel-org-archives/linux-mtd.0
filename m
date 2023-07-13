Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1921C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDnJll/tNkou5cKie4491ljudHo3g4rAPDeY/JbOOX0=; b=QXbbWX5plS09i4
	pfnETf/4vp/opeVLO2RBLKS0Qrk80Qj08ZPF+BeVhljwns0mvxBwBgSmKWUJQSq5vb18jQxEZ4s34
	2XFn2FtQQhAvNbBG3ezgGEDJzph0Af8HixXC+WS1FXFr67Qu838uLkg0PciWSL4STaIgPcPY+8LI1
	YYukHj+mnqIEhXKA7Z3C18eA28elrHS6s+aPU7DOyRowwzagsgitJe7ZfdSyaB68YjRnBn/0RlG6T
	3rf+Yr5ZUNjuWlbg++j14BGbDQ5oeshO/1R1FAllEek3blNs7i6T1J2B3kYR7oAq2+DsiQB56nmPJ
	5hIx4rM1JMDkyd7C+Dpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtut-002zC6-2K;
	Thu, 13 Jul 2023 10:51:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtuq-002z9t-0Y
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 10:51:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-307d20548adso672945f8f.0
        for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2023 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689245478; x=1691837478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnoniLiSteT7Mu3HGWAFpHv4ETn5OcZpeA6vJoEmjPM=;
        b=EfIf1NGm2spbN8yNE22ZtmlBLnGetKCAk9NlifpOBRleJn3tsL01S0xyZuy81CGkP4
         nP3j+jucGi9cwTl7JVQo7iJydurz+sEQ3VDksJbTkpIX0zFSCy0jAt86f1bk4k/MNERp
         F8bbS4X7rlTx73RAHV+AtgkPayK+FvWwqChUsqWfsSD7uFCwvm39jR+hb+hOuoEGvkxD
         IM6g5EsPglUTTguNQMoWyNtoGOCjl1jkmNswNANRHEQNPjNEUurU5mR8gAWnXP4K+Yz0
         X3nuOrwSwZoP7cp2f6nkqyB9p6EWNY/YVuQFSreaBk9i9I51la4g6cWh903cBB6He9QA
         gA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689245478; x=1691837478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnoniLiSteT7Mu3HGWAFpHv4ETn5OcZpeA6vJoEmjPM=;
        b=X59sIF5wJTKlP5VBFW2fkxDUWtNRWT+l+NYd1yDTniyoZN+xrdcpKtM1isA4DI8CXi
         AbB//YQzT5ZmzIi7GEs7TbgC8z6A25LvIibOMIIVqo8uzW6hi1EgRMjYH+DCmuqJRs9Z
         WKXghI1uIrAZhDkt+4ijdwzak00hO8pdWebMMN/nbbMfokSnD+hbcDHn9fCFuQqZci6I
         23bmvRvq78P2SwRYgoCOrQG8OXB2smh58wt/sQ6xZPnR3s2oI4GrfDsJ+ybZfBTJ4bW1
         DbEy88T5JlHg8qaUZvZfl9eZ5Vx4wHfh4I+2ZEW/9Gl5/l1i9Ts7gn6c7yJr+p2zr+0v
         2kyA==
X-Gm-Message-State: ABy/qLajpiiaBC5uNq3N98EAl0nkUvzQ8wUKta3hC1jYxuIFe1rgJiLu
	ooKMrbWB+lrm6FmePT10M1M=
X-Google-Smtp-Source: APBJJlFpPzXJG2bXEtTgawWIL7u+MaTJc3Ihw7+Qv5s65YLsyRRrsD7ChkzhbvGPGfRTY+maGe6k8g==
X-Received: by 2002:adf:eb87:0:b0:313:e715:3260 with SMTP id t7-20020adfeb87000000b00313e7153260mr1130809wrn.48.1689245477703;
        Thu, 13 Jul 2023 03:51:17 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b003143aa0ca8asm7626912wrv.13.2023.07.13.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 03:51:17 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 53579818CE;
	Thu, 13 Jul 2023 18:50:40 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 1/3] mtd: spi-nor: Modify rule for parse sfdp
Date: Thu, 13 Jul 2023 18:50:56 +0800
Message-Id: <20230713105058.101321-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713105058.101321-1-jaimeliao.tw@gmail.com>
References: <20230713105058.101321-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_035120_216862_57F98110 
X-CRM114-Status: GOOD (  25.36  )
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

From: JaimeLiao <jaimeliao.tw@gmail.com>

    With various vendors adhering to the JEDEC Standard, the percentage
    of SPI-NOR flash devices on the market that can read SFDP table is
    increasing.
    To enhance reliance on SFDP table, remove PARSE_SFDP flag,
    allowing all SPI-NOR flash devices to read SFDP talbe. The exception
    to this ule is for ICs that included SPI_NOR_SKIP_SFDP flag.
    Furthermore, to establish a complementary relationship between ID
    table information and SFDP talbe, organize no_sfdp_flags into
    nor->info->flags.
    The flash parameters are then organized by spi_nor_init_flags.

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 82 ++++++++++++++++++++------------------
 drivers/mtd/spi-nor/core.h | 39 +++++++-----------
 2 files changed, 59 insertions(+), 62 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5f29fac8669a..bd2685a03c94 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2024,7 +2024,6 @@ static const struct flash_info spi_nor_generic_flash = {
 	 * sane default.
 	 */
 	.page_size = 256,
-	.parse_sfdp = true,
 };
 
 static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
@@ -2760,50 +2759,51 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_no_sfdp_init_params() - Initialize the flash's parameters and
- * settings based on nor->info->sfdp_flags. This method should be called only by
- * flashes that do not define SFDP tables. If the flash supports SFDP but the
- * information is wrong and the settings from this function can not be retrieved
+ * spi_nor_flags_init_params() - Initialize the flash's parameters and
+ * settings based on nor->flags. This method should be called by flashes
+ * that define both on SFDP tables and id table informations.
+ * If the flash supports SFDP but the information is wrong
+ * and the settings from this function can not be retrieved
  * by parsing SFDP, one should instead use the fixup hooks and update the wrong
  * bits.
  * @nor:	pointer to a 'struct spi_nor'.
  */
-static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
+static void spi_nor_flags_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
+	const u32 flags = nor->flags;
 	u8 i, erase_mask;
 
-	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
+	if (flags & SPI_NOR_DUAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
 					  0, 8, SPINOR_OP_READ_1_1_2,
 					  SNOR_PROTO_1_1_2);
 	}
 
-	if (no_sfdp_flags & SPI_NOR_QUAD_READ) {
+	if (flags & SPI_NOR_QUAD_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
 					  0, 8, SPINOR_OP_READ_1_1_4,
 					  SNOR_PROTO_1_1_4);
 	}
 
-	if (no_sfdp_flags & SPI_NOR_OCTAL_READ) {
+	if (flags & SPI_NOR_OCTAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_8],
 					  0, 8, SPINOR_OP_READ_1_1_8,
 					  SNOR_PROTO_1_1_8);
 	}
 
-	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_READ) {
+	if (flags & SPI_NOR_OCTAL_DTR_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
 					  0, 20, SPINOR_OP_READ_FAST,
 					  SNOR_PROTO_8_8_8_DTR);
 	}
 
-	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_PP) {
+	if (flags & SPI_NOR_OCTAL_DTR_PP) {
 		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 		/*
 		 * Since xSPI Page Program opcode is backward compatible with
@@ -2819,7 +2819,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 	 */
 	erase_mask = 0;
 	i = 0;
-	if (no_sfdp_flags & SECT_4K) {
+	if (flags & SECT_4K) {
 		erase_mask |= BIT(i);
 		spi_nor_set_erase_type(&map->erase_type[i], 4096u,
 				       SPINOR_OP_BE_4K);
@@ -2832,8 +2832,8 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_init_flags() - Initialize NOR flags for settings that are not defined
- * in the JESD216 SFDP standard, thus can not be retrieved when parsing SFDP.
+ * spi_nor_init_flags() - Initialize NOR flags for settings that are defined
+ * in the id table information.
  * @nor:	pointer to a 'struct spi_nor'
  */
 static void spi_nor_init_flags(struct spi_nor *nor)
@@ -2868,6 +2868,24 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 	if (flags & SPI_NOR_RWW && nor->info->n_banks > 1 &&
 	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
+
+	if (nor->info->flags & SECT_4K)
+		nor->flags |= SNOR_F_SECT_4K;
+
+	if (nor->info->flags & SPI_NOR_DUAL_READ)
+		nor->flags |= SNOR_F_DUAL_READ;
+
+	if (nor->info->flags & SPI_NOR_QUAD_READ)
+		nor->flags |= SNOR_F_QUAD_READ;
+
+	if (nor->info->flags & SPI_NOR_OCTAL_READ)
+		nor->flags |= SNOR_F_OCTAL_READ;
+
+	if (nor->info->flags & SPI_NOR_OCTAL_DTR_READ)
+		nor->flags |= SNOR_F_OCTAL_DTR_READ;
+
+	if (nor->info->flags & SPI_NOR_OCTAL_DTR_PP)
+		nor->flags |= SNOR_F_OCTAL_DTR_PP;
 }
 
 /**
@@ -2901,6 +2919,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
+	spi_nor_manufacturer_init_params(nor);
+
 	if (nor->manufacturer && nor->manufacturer->fixups &&
 	    nor->manufacturer->fixups->late_init)
 		nor->manufacturer->fixups->late_init(nor);
@@ -2915,6 +2935,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	spi_nor_init_flags(nor);
 	spi_nor_init_fixup_flags(nor);
 
+	spi_nor_flags_init_params(nor);
+
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
 	 * the default ones.
@@ -2952,19 +2974,17 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
  * @nor:	pointer to a 'struct spi_nor'.
  *
  * The method assumes that flash doesn't support SFDP so it initializes flash
- * parameters in spi_nor_no_sfdp_init_params() which later on can be overwritten
+ * parameters in spi_nor_late_init_params() which later on can be overwritten
  * when parsing SFDP, if supported.
  */
 static void spi_nor_init_params_deprecated(struct spi_nor *nor)
 {
-	spi_nor_no_sfdp_init_params(nor);
-
 	spi_nor_manufacturer_init_params(nor);
 
-	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
-					SPI_NOR_QUAD_READ |
-					SPI_NOR_OCTAL_READ |
-					SPI_NOR_OCTAL_DTR_READ))
+	if (nor->info->flags & (SPI_NOR_DUAL_READ |
+				SPI_NOR_QUAD_READ |
+				SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ))
 		spi_nor_sfdp_init_params_deprecated(nor);
 }
 
@@ -3041,19 +3061,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
  *		spi_nor_manufacturer_init_params()
  *
  * which can be overwritten by:
- * 3/ SFDP flash parameters initialization. JESD216 SFDP is a standard and
- *    should be more accurate that the above.
- *		spi_nor_parse_sfdp() or spi_nor_no_sfdp_init_params()
- *
- *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
- *    the flash parameters and settings immediately after parsing the Basic
- *    Flash Parameter Table.
- *    spi_nor_post_sfdp_fixups() is called after the SFDP tables are parsed.
- *    It is used to tweak various flash parameters when information provided
- *    by the SFDP tables are wrong.
- *
- * which can be overwritten by:
- * 4/ Late flash parameters initialization, used to initialize flash
+ * 3/ Late flash parameters initialization, used to initialize flash
  * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
  * tables are not defined at all.
  *		spi_nor_late_init_params()
@@ -3070,14 +3078,12 @@ static int spi_nor_init_params(struct spi_nor *nor)
 
 	spi_nor_init_default_params(nor);
 
-	if (nor->info->parse_sfdp) {
+	if (!(nor->info->flags & SPI_NOR_SKIP_SFDP)) {
 		ret = spi_nor_parse_sfdp(nor);
 		if (ret) {
 			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
 			return ret;
 		}
-	} else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
-		spi_nor_no_sfdp_init_params(nor);
 	} else {
 		spi_nor_init_params_deprecated(nor);
 	}
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4fb5ff09c63a..f6de738a506c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -132,6 +132,13 @@ enum spi_nor_option_flags {
 	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
+	SNOR_F_SECT_4K		= BIT(16),
+	SNOR_F_DUAL_READ	= BIT(17),
+	SNOR_F_QUAD_READ	= BIT(18),
+	SNOR_F_OCTAL_READ	= BIT(19),
+	SNOR_F_OCTAL_DTR_READ	= BIT(20),
+	SNOR_F_OCTAL_DTR_PP	= BIT(21),
+
 };
 
 struct spi_nor_read_command {
@@ -447,9 +454,6 @@ struct spi_nor_fixups {
  * @page_size:      the flash's page size.
  * @addr_nbytes:    number of address bytes to send.
  *
- * @parse_sfdp:     true when flash supports SFDP tables. The false value has no
- *                  meaning. If one wants to skip the SFDP tables, one should
- *                  instead use the SPI_NOR_SKIP_SFDP sfdp_flag.
  * @flags:          flags that indicate support that is not defined by the
  *                  JESD216 standard in its SFDP tables. Flag meanings:
  *   SPI_NOR_HAS_LOCK:        flash supports lock/unlock via SR
@@ -469,10 +473,6 @@ struct spi_nor_fixups {
  *   SPI_NOR_NO_FR:           can't do fastread.
  *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
  *   SPI_NOR_RWW:             flash supports reads while write.
- *
- * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
- *                  Used when SFDP tables are not defined in the flash. These
- *                  flags are used together with the SPI_NOR_SKIP_SFDP flag.
  *   SPI_NOR_SKIP_SFDP:       skip parsing of SFDP tables.
  *   SECT_4K:                 SPINOR_OP_BE_4K works uniformly.
  *   SPI_NOR_DUAL_READ:       flash supports Dual Read.
@@ -508,8 +508,7 @@ struct flash_info {
 	u8 n_banks;
 	u8 addr_nbytes;
 
-	bool parse_sfdp;
-	u16 flags;
+	u32 flags;
 #define SPI_NOR_HAS_LOCK		BIT(0)
 #define SPI_NOR_HAS_TB			BIT(1)
 #define SPI_NOR_TB_SR_BIT6		BIT(2)
@@ -521,15 +520,13 @@ struct flash_info {
 #define SPI_NOR_NO_FR			BIT(8)
 #define SPI_NOR_QUAD_PP			BIT(9)
 #define SPI_NOR_RWW			BIT(10)
-
-	u8 no_sfdp_flags;
-#define SPI_NOR_SKIP_SFDP		BIT(0)
-#define SECT_4K				BIT(1)
-#define SPI_NOR_DUAL_READ		BIT(3)
-#define SPI_NOR_QUAD_READ		BIT(4)
-#define SPI_NOR_OCTAL_READ		BIT(5)
-#define SPI_NOR_OCTAL_DTR_READ		BIT(6)
-#define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+#define SPI_NOR_SKIP_SFDP		BIT(11)
+#define SECT_4K				BIT(12)
+#define SPI_NOR_DUAL_READ		BIT(13)
+#define SPI_NOR_QUAD_READ		BIT(14)
+#define SPI_NOR_OCTAL_READ		BIT(15)
+#define SPI_NOR_OCTAL_DTR_READ		BIT(16)
+#define SPI_NOR_OCTAL_DTR_PP		BIT(17)
 
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
@@ -587,15 +584,9 @@ struct flash_info {
 			.n_regions = (_n_regions),			\
 		},
 
-#define PARSE_SFDP							\
-	.parse_sfdp = true,						\
-
 #define FLAGS(_flags)							\
 		.flags = (_flags),					\
 
-#define NO_SFDP_FLAGS(_no_sfdp_flags)					\
-		.no_sfdp_flags = (_no_sfdp_flags),			\
-
 #define FIXUP_FLAGS(_fixup_flags)					\
 		.fixup_flags = (_fixup_flags),				\
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
