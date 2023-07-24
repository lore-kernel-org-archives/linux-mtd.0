Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956E3C001B0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7VSgLJyZ+R+v6DAyZHjHPH5vzdzC78EMz2W8D3Bm9c=; b=fcYi6cQA6KI03n
	Z4vB7QXEMJlYet4h7qVGhNAIbOhLFjSHAh/VB3i5RT9ZE/6A3JH84yRdt5WylJsOteN3FA+K2V2cq
	TUTcn5QzW/EGBJx9PfJHiQCFV2xeBU9PbS9PIHWGgr18IKmcQRAmY3CgBa4YgxTbjxR1lA8kWucZa
	YBHapBH3zixNXTTjJ+EgRFcR9nqtGjmtS/Y4kdgrteovu44x7lVHnmg5ye+R0zGUmdVkA5t/XEAjm
	SmDpXbUXWivzp5VAsAtM+QDtS8+ZLD4+/PnVJ0HbiSpqLUpXGKXsaZsT8s5aNI+Jd6zN+J/bFWYft
	bsaTyb7CYzoJZATo280g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgf-003CK7-2t;
	Mon, 24 Jul 2023 08:13:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgb-003CI5-2h
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:00 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-992e22c09edso596678766b.2
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186375; x=1690791175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cj8cY1SI1enyH/g9otbhsUZx/MkOGaJGyjEXyWXo9z8=;
        b=gzX69SfkCFNrNWNVKxIbIYUSJdiB5zKNVARZgM5uyP3TITsZlWh2GYDCwjpruPHPjy
         k7Dn/AOpEdlWgYwIvXdvjvm+eedj/CHE6XclUQ+DnnFyPz3T6qkFPy5UHkB0nBD42z5C
         WmZdxjuPxNAI7E6t5aOlnSUQ8UVV6NbvNCV4aX7+YfpbaHVIupnuIOmaQ0mjgBVDc47r
         Bpc+sNJs+9318BNEsOScaRIOTVgtm0xumy/JXYUaZ5qnwOVK1rQMwkkqSH+CsK8Wd9VN
         FpQdwDgJgLJA8lWIuvQOtxQd/KzV2H8vG9oRCAn83+B6ZnR7cp/hiQikFNb54v/NgZVQ
         LIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186375; x=1690791175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cj8cY1SI1enyH/g9otbhsUZx/MkOGaJGyjEXyWXo9z8=;
        b=bURpv10Tp/7WNvxSKAmtTqan5qCeZ4EeIHz8a+850dOf5y+GZVx4LNElgxHvXxQrQJ
         3Ld61LNbodkOWBc/aCU+zaAXoMj0zbPrcMu06LsG0nAVXi0wH5yY6fYCHKobNAEGiMfO
         KWXvok6ZM57hpRpkF2m/lD2cBXl6vCGzKzHmCebDXq2DnziYWqk44NAE753cHRGQD4dg
         bxWRGWtmQG9GKqEVpGlJk1bOwXaNdGouZCg9SejSOTMcdkgVpX3oT6mr7Xjphaa/KIfM
         56yRhJ15mpxB2LUkDhA7YtdU+giMKZ0BcnqHGsiu77hzeoF+qLZIshjoupOc26mjbfzg
         RhyA==
X-Gm-Message-State: ABy/qLb4YBFvEw5zf+Ix+AuLPp4+YOR/DUHOS0So6TeDXMgS7FUsxIxM
	X2YhulIauKyNHE2BJMR8umdYwQ==
X-Google-Smtp-Source: APBJJlFbGgBAK664Dwd3W68p3h2rsJ+Ouz/ZzBEj+3umFkn3Ad4pGmaaXu0sfU+paqLrM7q58UWQMg==
X-Received: by 2002:a17:906:32d6:b0:994:17e3:2753 with SMTP id k22-20020a17090632d600b0099417e32753mr9693202ejk.26.1690186374919;
        Mon, 24 Jul 2023 01:12:54 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:12:53 -0700 (PDT)
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
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [RESEND PATCH v3 01/11] mtd: spi-nor: spansion: use CLPEF as an alternative to CLSR
Date: Mon, 24 Jul 2023 11:12:37 +0300
Message-Id: <20230724081247.4779-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15492; i=tudor.ambarus@linaro.org; h=from:subject; bh=abt/KuEBLk/2uHPj4mik4XS7fR2pRwv3tmtN9KYUxeY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ+vmmbTvWhjt87EjyA0hTvCArKszPFUvy7G 1BYCiNskOSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfgAKCRBLVU9HpY0U 6cY3CACZuruFa311/QPGrZZwn9YrxcvKJ8spaayw5PVRxXR5J52ryfkOCUza+eAHamcdCp6osuD +FUaji9DDsqVOD+8SLjwiD1DBhxNpwfsGd+vn6iW85mP37li7AoQ6EQuCBLJJ91hRgzNapYRr89 ZH+IAXBChSmOYd9k1mWqFOtNddFUD2z4H51gpZuoUh135zelfl25vA0G91WaSN8C2BeHW6OpA9c XSQAHCqEnsgCe516Lp+0KV8+Cryev9lMcOUZs7ZewZ/BIKNqv9Ii21RHygoUq7fx8vQyxuak7QB +DF3nqQPFuBUeeAgD1bLJXpGMm9WKaer4si9dGki3Wcv4JkY
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011257_874972_F8565BAB 
X-CRM114-Status: GOOD (  23.28  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Infineon S28Hx (SEMPER Octal) and S25FS256T (SEMPER Nano) support Clear
Program and Erase Failure Flags (CLPEF, 82h) instead of CLSR(30h).
Introduce a new mfr_flag together with the infrastructure to allow
manufacturer private data in the core. With this we remove the need
to have if checks in the code at runtime and instead set the correct
opcodes at probe time. S25Hx (SEMPER QSPI) supports CLSR but it may
be disabled by CFR3x[2] while CLPEF is always available. Therefore,
the mfr_flag is also applied to S25Hx for safety.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/atmel.c     |  8 +++-
 drivers/mtd/spi-nor/core.c      | 23 +++++++----
 drivers/mtd/spi-nor/core.h      |  4 +-
 drivers/mtd/spi-nor/issi.c      |  4 +-
 drivers/mtd/spi-nor/macronix.c  |  4 +-
 drivers/mtd/spi-nor/micron-st.c |  4 +-
 drivers/mtd/spi-nor/spansion.c  | 72 ++++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/sst.c       |  8 +++-
 drivers/mtd/spi-nor/winbond.c   |  4 +-
 drivers/mtd/spi-nor/xilinx.c    |  4 +-
 10 files changed, 103 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 656dd80a0be7..58968c1e7d2f 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -48,9 +48,11 @@ static const struct spi_nor_locking_ops at25fs_nor_locking_ops = {
 	.is_locked = at25fs_nor_is_locked,
 };
 
-static void at25fs_nor_late_init(struct spi_nor *nor)
+static int at25fs_nor_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &at25fs_nor_locking_ops;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups at25fs_nor_fixups = {
@@ -149,9 +151,11 @@ static const struct spi_nor_locking_ops atmel_nor_global_protection_ops = {
 	.is_locked = atmel_nor_is_global_protected,
 };
 
-static void atmel_nor_global_protection_late_init(struct spi_nor *nor)
+static int atmel_nor_global_protection_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &atmel_nor_global_protection_ops;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups atmel_nor_global_protection_fixups = {
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 273258f7e77f..614960c7d22c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2900,16 +2900,23 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
  * SFDP standard, or where SFDP tables are not defined at all.
  * Will replace the spi_nor_manufacturer_init_params() method.
  */
-static void spi_nor_late_init_params(struct spi_nor *nor)
+static int spi_nor_late_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
+	int ret;
 
 	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->late_init)
-		nor->manufacturer->fixups->late_init(nor);
+	    nor->manufacturer->fixups->late_init) {
+		ret = nor->manufacturer->fixups->late_init(nor);
+		if (ret)
+			return ret;
+	}
 
-	if (nor->info->fixups && nor->info->fixups->late_init)
-		nor->info->fixups->late_init(nor);
+	if (nor->info->fixups && nor->info->fixups->late_init) {
+		ret = nor->info->fixups->late_init(nor);
+		if (ret)
+			return ret;
+	}
 
 	/* Default method kept for backward compatibility. */
 	if (!params->set_4byte_addr_mode)
@@ -2927,6 +2934,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 
 	if (nor->info->n_banks > 1)
 		params->bank_size = div64_u64(params->size, nor->info->n_banks);
+
+	return 0;
 }
 
 /**
@@ -3085,9 +3094,7 @@ static int spi_nor_init_params(struct spi_nor *nor)
 		spi_nor_init_params_deprecated(nor);
 	}
 
-	spi_nor_late_init_params(nor);
-
-	return 0;
+	return spi_nor_late_init_params(nor);
 }
 
 /** spi_nor_set_octal_dtr() - enable or disable Octal DTR I/O.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f2fc2cf78e55..9217379b9cfe 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -378,6 +378,7 @@ struct spi_nor_otp {
  *			than reading the status register to indicate they
  *			are ready for a new command
  * @locking_ops:	SPI NOR locking methods.
+ * @priv:		flash's private data.
  */
 struct spi_nor_flash_parameter {
 	u64				bank_size;
@@ -406,6 +407,7 @@ struct spi_nor_flash_parameter {
 	int (*ready)(struct spi_nor *nor);
 
 	const struct spi_nor_locking_ops *locking_ops;
+	void *priv;
 };
 
 /**
@@ -432,7 +434,7 @@ struct spi_nor_fixups {
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
 	int (*post_sfdp)(struct spi_nor *nor);
-	void (*late_init)(struct spi_nor *nor);
+	int (*late_init)(struct spi_nor *nor);
 };
 
 /**
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 400e2b42f45a..accdf7aa2bfd 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -29,7 +29,7 @@ static const struct spi_nor_fixups is25lp256_fixups = {
 	.post_bfpt = is25lp256_post_bfpt_fixups,
 };
 
-static void pm25lv_nor_late_init(struct spi_nor *nor)
+static int pm25lv_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_erase_map *map = &nor->params->erase_map;
 	int i;
@@ -38,6 +38,8 @@ static void pm25lv_nor_late_init(struct spi_nor *nor)
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++)
 		if (map->erase_type[i].size == 4096)
 			map->erase_type[i].opcode = SPINOR_OP_BE_4K_PMC;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups pm25lv_nor_fixups = {
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 04888258e891..eb149e517c1f 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -110,10 +110,12 @@ static void macronix_nor_default_init(struct spi_nor *nor)
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 }
 
-static void macronix_nor_late_init(struct spi_nor *nor)
+static int macronix_nor_late_init(struct spi_nor *nor)
 {
 	if (!nor->params->set_4byte_addr_mode)
 		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups macronix_nor_fixups = {
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index f79e71d99124..6ad080c52ab5 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -429,7 +429,7 @@ static void micron_st_nor_default_init(struct spi_nor *nor)
 	nor->params->quad_enable = NULL;
 }
 
-static void micron_st_nor_late_init(struct spi_nor *nor)
+static int micron_st_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
@@ -438,6 +438,8 @@ static void micron_st_nor_late_init(struct spi_nor *nor)
 
 	if (!params->set_4byte_addr_mode)
 		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups micron_st_nor_fixups = {
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 314667d4b8a8..6b2532ed053c 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -4,14 +4,17 @@
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
 
+#include <linux/device.h>
 #include <linux/mtd/spi-nor.h>
 
 #include "core.h"
 
 /* flash_info mfr_flag. Used to clear sticky prorietary SR bits. */
 #define USE_CLSR	BIT(0)
+#define USE_CLPEF	BIT(1)
 
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
+#define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
 #define SPINOR_REG_CYPRESS_VREG			0x00800000
@@ -57,22 +60,32 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
-#define SPANSION_CLSR_OP						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),			\
+#define SPANSION_OP(opcode)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
+/**
+ * struct spansion_nor_params - Spansion private parameters.
+ * @clsr:	Clear Status Register or Clear Program and Erase Failure Flag
+ *		opcode.
+ */
+struct spansion_nor_params {
+	u8 clsr;
+};
+
 /**
  * spansion_nor_clear_sr() - Clear the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  */
 static void spansion_nor_clear_sr(struct spi_nor *nor)
 {
+	const struct spansion_nor_params *priv_params = nor->params->priv;
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op = SPANSION_CLSR_OP;
+		struct spi_mem_op op = SPANSION_OP(priv_params->clsr);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -528,9 +541,11 @@ static int s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 	return 0;
 }
 
-static void s25fs256t_late_init(struct spi_nor *nor)
+static int s25fs256t_late_init(struct spi_nor *nor)
 {
 	cypress_nor_ecc_init(nor);
+
+	return 0;
 }
 
 static struct spi_nor_fixups s25fs256t_fixups = {
@@ -586,7 +601,7 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 	return cypress_nor_get_page_size(nor);
 }
 
-static void s25hx_t_late_init(struct spi_nor *nor)
+static int s25hx_t_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
@@ -598,6 +613,8 @@ static void s25hx_t_late_init(struct spi_nor *nor)
 	/* Replace ready() with multi die version */
 	if (params->n_dice)
 		params->ready = cypress_nor_sr_ready_and_clear;
+
+	return 0;
 }
 
 static struct spi_nor_fixups s25hx_t_fixups = {
@@ -659,10 +676,12 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	return cypress_nor_set_addr_mode_nbytes(nor);
 }
 
-static void s28hx_t_late_init(struct spi_nor *nor)
+static int s28hx_t_late_init(struct spi_nor *nor)
 {
 	nor->params->set_octal_dtr = cypress_nor_set_octal_dtr;
 	cypress_nor_ecc_init(nor);
+
+	return 0;
 }
 
 static const struct spi_nor_fixups s28hx_t_fixups = {
@@ -786,47 +805,54 @@ static const struct flash_info spansion_nor_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "s25fs256t",  INFO6(0x342b19, 0x0f0890, 0, 0)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25fs256t_fixups },
 	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
 		PARSE_SFDP
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 0, 0)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		FLAGS(NO_CHIP_ERASE)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
 		PARSE_SFDP
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 0, 0)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		FLAGS(NO_CHIP_ERASE)
 		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
 	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
 	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
 };
@@ -870,17 +896,35 @@ static int spansion_nor_sr_ready_and_clear(struct spi_nor *nor)
 	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
-static void spansion_nor_late_init(struct spi_nor *nor)
+static int spansion_nor_late_init(struct spi_nor *nor)
 {
-	if (nor->params->size > SZ_16M) {
+	struct spi_nor_flash_parameter *params = nor->params;
+	struct spansion_nor_params *priv_params;
+	u8 mfr_flags = nor->info->mfr_flags;
+
+	if (params->size > SZ_16M) {
 		nor->flags |= SNOR_F_4B_OPCODES;
 		/* No small sector erase for 4-byte command set */
 		nor->erase_opcode = SPINOR_OP_SE;
 		nor->mtd.erasesize = nor->info->sector_size;
 	}
 
-	if (nor->info->mfr_flags & USE_CLSR)
-		nor->params->ready = spansion_nor_sr_ready_and_clear;
+	if (mfr_flags & (USE_CLSR | USE_CLPEF)) {
+		priv_params = devm_kmalloc(nor->dev, sizeof(*priv_params),
+					   GFP_KERNEL);
+		if (!priv_params)
+			return -ENOMEM;
+
+		if (mfr_flags & USE_CLSR)
+			priv_params->clsr = SPINOR_OP_CLSR;
+		else if (mfr_flags & USE_CLPEF)
+			priv_params->clsr = SPINOR_OP_CLPEF;
+
+		params->priv = priv_params;
+		params->ready = spansion_nor_sr_ready_and_clear;
+	}
+
+	return 0;
 }
 
 static const struct spi_nor_fixups spansion_nor_fixups = {
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 688eb20c763e..09fdc7023e09 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -49,9 +49,11 @@ static const struct spi_nor_locking_ops sst26vf_nor_locking_ops = {
 	.is_locked = sst26vf_nor_is_locked,
 };
 
-static void sst26vf_nor_late_init(struct spi_nor *nor)
+static int sst26vf_nor_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &sst26vf_nor_locking_ops;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups sst26vf_nor_fixups = {
@@ -203,10 +205,12 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
-static void sst_nor_late_init(struct spi_nor *nor)
+static int sst_nor_late_init(struct spi_nor *nor)
 {
 	if (nor->info->mfr_flags & SST_WRITE)
 		nor->mtd._write = sst_nor_write;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups sst_nor_fixups = {
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 63ba8e3a96f5..cd99c9a1c568 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -217,7 +217,7 @@ static const struct spi_nor_otp_ops winbond_nor_otp_ops = {
 	.is_locked = spi_nor_otp_is_locked_sr2,
 };
 
-static void winbond_nor_late_init(struct spi_nor *nor)
+static int winbond_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
@@ -233,6 +233,8 @@ static void winbond_nor_late_init(struct spi_nor *nor)
 	 * from BFPT, if any.
 	 */
 	params->set_4byte_addr_mode = winbond_nor_set_4byte_addr_mode;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups winbond_nor_fixups = {
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 7175de8aa336..00d53eae5ee8 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -155,10 +155,12 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 	return 0;
 }
 
-static void xilinx_nor_late_init(struct spi_nor *nor)
+static int xilinx_nor_late_init(struct spi_nor *nor)
 {
 	nor->params->setup = xilinx_nor_setup;
 	nor->params->ready = xilinx_nor_sr_ready;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups xilinx_nor_fixups = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
