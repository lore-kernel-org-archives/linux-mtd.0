Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC21C001DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhIzFUufavduJurki1I0mkhq1IFSI+L31LR6KSjTLhc=; b=4RcjhXvMjkVvlS
	EtfMcHXtpH3w6h2NjNXcJNsjRf6qVCv4F4MTkWHyts1d2KRR7oTjByoF78VhGuGJWC7syydUrDKWy
	GQYOtCh1WLYjmhKSYZs+mVWipIJbF/MOhklHd/7yUxcW07WB45IUGKueYsUP7pLMuXmfmn2dZVs33
	O+xut2agxsctAlOgUu8K7HgX/6jBQ7XSPq6TCcJ6D8YiEDtsPp6ZvTDP9Tob37Ob+cCa722neQd8U
	rXx/MwM8xUkG7Qvx3yRvzY6xYTNJMXedV3h/MO2MaoI1EoiMTEciRamTMRX0dnIzJEt02SSMzF9Y+
	QWmmzgQzX1Gf7qIFHM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqh9-003CeO-1y;
	Mon, 24 Jul 2023 08:13:31 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqh6-003CbK-1H
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:30 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52227884855so1874316a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186407; x=1690791207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjpE0CTKohDZ2ehuACLTkZqrmJb/Yntt3sN7R44vEtA=;
        b=xnK7gh0F2XnAfmAj7Ba1o3LJ6gE86oxlduR7gzGsnqUaQDPW0DjO6k+wKCrWJolfMV
         YFQAJTae5IuAHo31uL/QrUyJPzR6OaqHN3jLrkBGcTvak4Kycx7E4h3lonGmDuElS1Bx
         z6guQ4efnsjzSPgTIosyC8T9zqXD7npWb/xRPq7zTvO+NLrfKmq2Z1GJi7guVeckwhPi
         mVO+Baljx36aLdOu0AyqDDSwWJfJFwzueLK6sDRsoZ5Y7Fj9SodKIvqhlWWCxSq9ZE8i
         hqGc2wDUkDYkYYzc3og0mFBAI8QE+mL7HDMA/b0GulSzLa7k0Xivj+Yq0YhigcwxgUhl
         PP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186407; x=1690791207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjpE0CTKohDZ2ehuACLTkZqrmJb/Yntt3sN7R44vEtA=;
        b=e3ZRZ9/iABaP3Pz5JJYYfIHWt+tmoqRE8zL/F6guub1JAO34uQjOE4TqtqHP90d0a6
         z/f/ae/HXLsKZ4ef1CfwGxkUgxDRZu+znktbcMYbhsiUH6lRa1QMYrhq/93LY+YFgvXR
         f/qFTcivw1qwd5sMILCKF1G4ahV4gi6Jtp+5PuQ9rV/rBo/ExIoFSV+EqSEqv2/ddAit
         nf2YqHvRVGgBh0/yePZjsrIyyoorkqHTegFUvq2acuPJBZql2kLCK53fe4PxxIPybqEG
         b38hoSrRANodT7UED6FagRE3BXGPI1hJuMCOrex6FJqN5uHKsMUc7cxVkqFUc8aZcnkw
         C/SA==
X-Gm-Message-State: ABy/qLaGtSYBO5ikrigz6fAeroU+sE4XAi7MFajctbsGdrMdENHtc3od
	iDTuYmubDyti6f8DE+KBJs0qbA==
X-Google-Smtp-Source: APBJJlGUL2q0PX1PyO+HWJGPTCESCX+Zx0heqGiwB2fUoec14FFM4neH/1+XpitqtN1NgIf8XO++Ng==
X-Received: by 2002:a17:907:1de6:b0:982:79fa:4532 with SMTP id og38-20020a1709071de600b0098279fa4532mr9124481ejc.53.1690186407034;
        Mon, 24 Jul 2023 01:13:27 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:13:24 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [RESEND PATCH v3 11/11] mtd: spi-nor: spansion: switch cypress_nor_get_page_size() to use vreg_offset
Date: Mon, 24 Jul 2023 11:12:47 +0300
Message-Id: <20230724081247.4779-12-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6780; i=tudor.ambarus@linaro.org; h=from:subject; bh=MUJq2mMJ7nIureH4NTnSp4c0il3VTp5/1NGTZmdRv8E=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ/AjClsiJy+r+/oUJQL9lKwKRmy/640tCVi cFl1S4x6XeJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfwAKCRBLVU9HpY0U 6UyACACihYeFek6vZM2wuP6gooTVtrkuQT5Myp3MWn40rPLrLh3/dTfZyuhJl8GEDwfykX24Ecc aEj0LnTn1IGBg9q0diCEtiGkoOmcIcqdXNWpMlsC0VlifsOZ+JXS9Lc8bHVGEyTnfX8w58DaZTN yM1+opq/Tz/u3Fmn1FAM2f1UNX+9r7AgDqIRKitESVkmD/OYeoO92RbAoXJZ6WX0X5GnhzJfgFP vSk/GNok44dcUaj5RRrGXVKdvaLSiodma8LRekoOUC3gyhOyQzEq3o2QVE5Vo9NpeoLeY3bm8lb 8Kp9DGsZI+5fzj9+dleV+rAnqFJAJcN7GgpRuO/nrbCogAgr
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011328_462150_E9580D0C 
X-CRM114-Status: GOOD (  20.81  )
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

All users of cypress_nor_get_page_size() retrieve n_dice and vreg_offset
from SFDP. Switch cypress_nor_get_page_size() to always use vreg_offset
so that we use the same code base for both single and multi chip package
flashes. cypress_nor_get_page_size() is now called in the post_sfdp()
hook instead of post_bfpt(), as vreg_offset and n_dice are parsed after
BFPT and we now use them to get the page size in the post_sfdp hook.
Consequently the null checks on n_dice and vreg_offset are moved to
the post_sfdp() hook.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 105 +++++++++++++--------------------
 1 file changed, 42 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 4027f0038ce5..0b01af33aa57 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -471,28 +471,17 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
 	return 0;
 }
 
-static int cypress_nor_get_page_size_single_chip(struct spi_nor *nor)
-{
-	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR3V, 0,
-					  nor->bouncebuf);
-	int ret;
-
-	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
-
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ)
-		nor->params->page_size = 512;
-	else
-		nor->params->page_size = 256;
-
-	return 0;
-}
-
-
-static int cypress_nor_get_page_size_mcp(struct spi_nor *nor)
+/**
+ * cypress_nor_get_page_size() - Get flash page size configuration.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * The BFPT table advertises a 512B or 256B page size depending on part but the
+ * page size is actually configurable (with the default being 256B). Read from
+ * CFR3V[4] and set the correct size.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_get_page_size(struct spi_nor *nor)
 {
 	struct spi_mem_op op =
 		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
@@ -522,23 +511,6 @@ static int cypress_nor_get_page_size_mcp(struct spi_nor *nor)
 	return 0;
 }
 
-/**
- * cypress_nor_get_page_size() - Get flash page size configuration.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * The BFPT table advertises a 512B or 256B page size depending on part but the
- * page size is actually configurable (with the default being 256B). Read from
- * CFR3V[4] and set the correct size.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int cypress_nor_get_page_size(struct spi_nor *nor)
-{
-	if (nor->params->n_dice)
-		return cypress_nor_get_page_size_mcp(nor);
-	return cypress_nor_get_page_size_single_chip(nor);
-}
-
 static void cypress_nor_ecc_init(struct spi_nor *nor)
 {
 	/*
@@ -575,20 +547,26 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	if (nor->bouncebuf[0])
 		return -ENODEV;
 
-	return cypress_nor_get_page_size(nor);
+	return 0;
 }
 
 static int s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
+	if (!params->n_dice || !params->vreg_offset) {
+		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
+			__func__);
+		return -EOPNOTSUPP;
+	}
+
 	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
 	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
 	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
 				SPINOR_OP_PP_1_1_4_4B,
 				SNOR_PROTO_1_1_4);
 
-	return 0;
+	return cypress_nor_get_page_size(nor);
 }
 
 static int s25fs256t_late_init(struct spi_nor *nor)
@@ -623,10 +601,20 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 
 static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
-	struct spi_nor_erase_type *erase_type =
-					nor->params->erase_map.erase_type;
+	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_erase_type *erase_type = params->erase_map.erase_type;
 	unsigned int i;
 
+	if (!params->n_dice || !params->vreg_offset) {
+		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
+			__func__);
+		return -EOPNOTSUPP;
+	}
+
+	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
+	if (params->size == SZ_256M)
+		params->n_dice = 2;
+
 	/*
 	 * In some parts, 3byte erase opcodes are advertised by 4BAIT.
 	 * Convert them to 4byte erase opcodes.
@@ -644,10 +632,6 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 		}
 	}
 
-	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
-	if (nor->params->size == SZ_256M)
-		nor->params->n_dice = 2;
-
 	return cypress_nor_get_page_size(nor);
 }
 
@@ -655,12 +639,6 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
-	if (!params->n_dice || !params->vreg_offset) {
-		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
-			__func__);
-		return -EOPNOTSUPP;
-	}
-
 	/* Fast Read 4B requires mode cycles */
 	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
 	params->ready = cypress_nor_sr_ready_and_clear;
@@ -694,6 +672,17 @@ static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
+
+	if (!params->n_dice || !params->vreg_offset) {
+		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
+			__func__);
+		return -EOPNOTSUPP;
+	}
+
+	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
+	if (params->size == SZ_256M)
+		params->n_dice = 2;
+
 	/*
 	 * On older versions of the flash the xSPI Profile 1.0 table has the
 	 * 8D-8D-8D Fast Read opcode as 0x00. But it actually should be 0xEE.
@@ -719,10 +708,6 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 	 */
 	params->rdsr_addr_nbytes = 4;
 
-	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
-	if (params->size == SZ_256M)
-		params->n_dice = 2;
-
 	return cypress_nor_get_page_size(nor);
 }
 
@@ -737,12 +722,6 @@ static int s28hx_t_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
-	if (!params->n_dice || !params->vreg_offset) {
-		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
-			__func__);
-		return -EOPNOTSUPP;
-	}
-
 	params->set_octal_dtr = cypress_nor_set_octal_dtr;
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
