Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D25C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTx2+Pe/+kDBQVp4Ch8F0b84mmMU40QfPQC8/Rg4zjI=; b=Tey/EVXX0E2Ibl
	cj7LAeB9o6W1Du5qvMUY11yDVUME5IlNDUjY5telOhCEm9Jt0jaNbVBnOjacU/jqbJyappS1n4Ej3
	U9SloYrnnheFphoqsW7o1++t5LXg1Jro+i3hvQSvOwIHgOZwX/AJyaTIoK2IJf/i8vLX7obBZdbJC
	gDoVjMxTvF8pLsd/BwO4YsDfdbJ68L5/fJRbMeazgPZCc1geJnWBXKQ2swdD8ghqgn3zrpdfvTelk
	oNLBpWjbYtvR1mbLY4oZm7V+qa6whgCqNleSfkMHdDfXozaEo7Xj9Zjx2cLVIQOBM6pxOQDH85sd4
	mC8fNwBlHPy+lC+s14gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKw-009VDk-1w;
	Wed, 26 Jul 2023 07:53:34 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKl-009V27-0l
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:25 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b96789d574so90926471fa.2
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357999; x=1690962799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5jcS1qvmfeGuaQwUWQlurqi39Eg/E+0di+mOyaXrvI=;
        b=nsZniQwd928rjHv8N0YUoY18C0hZZ4OKCNz9qYqK1GMZ9f+0tu21Ib9aoaLzgQItdA
         WuVhEVpUkIJfrrdDrNDta1NsL4DCX4vb6dxQb44q04v+tM4m6p+ffqpE9+wJCQz6HVha
         z+xVBRqQuX5VBPpfh+cXuvL7We+3K8xDkJyMDd2iAyjVYawjcx5Tj/ymx91MrHW9JKeP
         P6akq/vC52ae4Z7W4ZgryfYJFjGYNwRl8wR4HOwapGJ3objZtPYTNJtIIDVmSA6mBInK
         Jmo6Iv9s4O5Qw9QtgKSFOuHCOupIsMzHV4kz3tDbOa7hV5K3eSQ9I3F15iL8FV138C0V
         TMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357999; x=1690962799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5jcS1qvmfeGuaQwUWQlurqi39Eg/E+0di+mOyaXrvI=;
        b=IGUTlOChwL/Tmb2/YDUQn17Zvz6w0KDisJfvN1BaZUvzOkVSmkTO2tjGV+zC7g1vuF
         XoQg3S7xJ6aCXVtJzAkIVJ+rTCBSqDx+i0PfXV6ZznXj4CeElZIY7exacY9VY6DkBDvC
         k5d1XWc6OYMwNzOq4GeMbGDeLC2SF3swTLC9CADsGSbhkatKwNJEj6t2pNWZ0+Y04bP6
         TiFsILFRBDVKUcSvqrGMouawi09fUUQdChogsV/NYzNWZTMzIyztu4kgbFOPKQRuFx36
         3z7uuuUWTBrkwyqN7tT0hXkB347hLmH43XmeEjj+ebJvIECqChlAepmiLzyqCcjhklmT
         6ZIw==
X-Gm-Message-State: ABy/qLYIdQlsBP/4Eb7QV+udIars4v9V6fPTptBZ8TvlWSMJNtSensGO
	cOUU3ysRmQtEPQAoDSnX0XWuCQ==
X-Google-Smtp-Source: APBJJlEvBR+0YDOzl0+01yUiRq0NFNaRHew75JOQ5wEpYR/E8ZKz0lcpzHaesMh+oGmFdQ/BMa957A==
X-Received: by 2002:a2e:b163:0:b0:2b5:68ad:291f with SMTP id a3-20020a2eb163000000b002b568ad291fmr832496ljm.19.1690357999459;
        Wed, 26 Jul 2023 00:53:19 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:18 -0700 (PDT)
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
Subject: [PATCH v4 11/11] mtd: spi-nor: spansion: switch cypress_nor_get_page_size() to use vreg_offset
Date: Wed, 26 Jul 2023 10:52:57 +0300
Message-Id: <20230726075257.12985-12-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7480; i=tudor.ambarus@linaro.org; h=from:subject; bh=6eTHq2NR9v4yz00ZyFtEXFO52VWKVfLrd5UtS7Vf+L8=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDYP/pogcFjD8Enf1q4+mfRGt0OIeM7D54FU xi6nM+wHBKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ2AAKCRBLVU9HpY0U 6dIDB/9RNq1W9pOH9zI6GApqMHrqYjmLmSCU9aG63oJphZ+xNXqbsBIpLuSnCx3FFQHYcY1oxx1 L9RMlwM08eOG5Xm675XrM6GxSgLIDRXaVFzNRq821I/bBYCeo6n6D/0B5nFNdXRlPT0yLN0hUr2 X0m4OjbCr9cBTVxJeeUhLwH72CqufBXT7vBh2kka5lg8n1YKwubTb9Tc0dSzguj5Ivgeo+E4cD7 IQRMzYexPhllTngHL8omuQ13CFHGlNeHtVoK3NWfm/1QXfN7hW92nRD3Iu7si7m9hSmsuxGyNva +BMY5dRVuiz1og0ydGYJSDoVd7FUaUqLMWiGywOdMPj+OavH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005323_298291_4E71137A 
X-CRM114-Status: GOOD (  23.60  )
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

All users of cypress_nor_get_page_size() but S25FS256T retrieve n_dice
and vreg_offset from SFDP. S25FS256T does not define the SCCR map to
retrive the vreg_offset, but it does support it: SPINOR_REG_CYPRESS_VREG.
Switch cypress_nor_get_page_size() to always use vreg_offset so that we
use the same code base for both single and multi chip package flashes.
cypress_nor_get_page_size() is now called in the post_sfdp() hook instead
of post_bfpt(), as vreg_offset and n_dice are parsed after BFPT.
Consequently the null checks on n_dice and vreg_offset are moved to
the post_sfdp() hook.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 113 ++++++++++++++-------------------
 1 file changed, 48 insertions(+), 65 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6abef5b515a1..a23eb2ae9488 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -32,8 +32,6 @@
 #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR2_ADRBYT		BIT(7)
 #define SPINOR_REG_CYPRESS_CFR3			0x4
-#define SPINOR_REG_CYPRESS_CFR3V					\
-	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR3)
 #define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
 #define SPINOR_REG_CYPRESS_CFR5			0x6
 #define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
@@ -467,28 +465,17 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
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
@@ -518,23 +505,6 @@ static int cypress_nor_get_page_size_mcp(struct spi_nor *nor)
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
@@ -571,20 +541,32 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	if (nor->bouncebuf[0])
 		return -ENODEV;
 
-	return cypress_nor_get_page_size(nor);
+	return 0;
 }
 
 static int s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
+	/*
+	 * S25FS256T does not define the SCCR map, but we would like to use the
+	 * same code base for both single and multi chip package devices, thus
+	 * set the vreg_offset and n_dice to be able to do so.
+	 */
+	params->vreg_offset = devm_kmalloc(nor->dev, sizeof(u32), GFP_KERNEL);
+	if (!params->vreg_offset)
+		return -ENOMEM;
+
+	params->vreg_offset[0] = SPINOR_REG_CYPRESS_VREG;
+	params->n_dice = 1;
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
@@ -619,10 +601,20 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 
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
@@ -640,10 +632,6 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 		}
 	}
 
-	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
-	if (nor->params->size == SZ_256M)
-		nor->params->n_dice = 2;
-
 	return cypress_nor_get_page_size(nor);
 }
 
@@ -651,12 +639,6 @@ static int s25hx_t_late_init(struct spi_nor *nor)
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
@@ -690,6 +672,17 @@ static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
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
@@ -715,10 +708,6 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 	 */
 	params->rdsr_addr_nbytes = 4;
 
-	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
-	if (params->size == SZ_256M)
-		params->n_dice = 2;
-
 	return cypress_nor_get_page_size(nor);
 }
 
@@ -733,12 +722,6 @@ static int s28hx_t_late_init(struct spi_nor *nor)
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
