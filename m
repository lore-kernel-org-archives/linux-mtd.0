Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824CDC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 06:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96wgIUsnb4PYkRsRGXtz9cBWRFCuzLrgzZoyEMgxOzk=; b=RHn+YjMhieZ/QE
	9uZRJLc+Ls9nKFfETcjJlDIYcK31/Z2puEFcSEWwcC70hleHNx8jF3pFk8XQIwlVbuuNPnx3vmeRa
	ENykdSyf7SXrAPITMWAgvt58qqNUjxnp3ONtsTfgnqoo2OIX4duBQmABqNBRLXgX0RBWAOtk7S2Zp
	zg9QQ8gjMyIUGQrOHCX0U9D56zbFBO/DUlfgp6fmukCgbYUg/I1kaBcfvq1ok4kWx/em1K1zKXVwd
	4N8mjFc2xegKGg38YUsTgYsWY/zGswbO9HnjIpK/saQEopd04cnphzFj9JhVkjCrZ7TVx0TgUiJ9T
	FMGWGVGnCv29rvoYxLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQVb-00Bmx5-RK; Thu, 21 Apr 2022 06:41:43 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQVS-00Bmr4-Gc
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 06:41:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id c23so3996001plo.0
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LONb1mnj7dnIeWFnJ99f0HXGVnTcXh45wVb4OBVyhJk=;
 b=S52+/nUwgJIWiuOTIjMtyklP7VuVqJKZciM2Juc4T+WDIgy7MYzeMK7scCQIQaO8fc
 6E+tgNKIqxAxdExtMuk/5YxLks8/14WhWaQGkmd/XqsbDA4RggqoLg5ekfWWAxnSyXcG
 SnVroAhYyEQlhSFlYr/Z+0MRCqpFwgnqRnbYrCHwqWKb6HD8v9GNDWdcwNgFl9RRI8Ts
 Uypjz1aDOv7Bkg3KGBq0u8W9Npcyc25OIi9ZoQQztjtO/R5vLRqs10gLbBk/ORfk94MI
 xxVlzPM1gRK8DAhNdVJjpToGqeVqIk+n7XQgJ109XkcHJM9Wjt0mMq9fm+oF8YuuhPkP
 BKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LONb1mnj7dnIeWFnJ99f0HXGVnTcXh45wVb4OBVyhJk=;
 b=BcXTPQ73IpvPjO4bRXvkYx2BpAxKqWMkNeDyrdIivr8OvhTzrWSRGJN+w+Ypwuarr2
 FiYOSpjpbJL0TXM4gmQ4X3jYj8U8iGRk5i2nEdEr0LkmMJJi2YkOD2+gJQP8T/0527ul
 /7e+b6r5XV9E3rVJ5IDmm2knrWAlkPWuz/FTI4/5C+AdktarEvu8GqSJDbClMJflrtZS
 sJwzX8717pJbKkSB1EeF8cmMVaMfm7P0j8g+G3ASXDt5Rm/TqpiNCe566ZBmfXNsXPBm
 Ufl8xDQlKmZp3fmLFOnCIm7Xwz4bhd/Q0BOFV8D2zy4VA0bS0BUgUWkvEz93X+1olSsC
 x7Cg==
X-Gm-Message-State: AOAM5335QYQS0cXSGdePMvaY+46dwaM6JLrlq4I0CvpJXevYCpJkhdPv
 Poe6eLgkruHWbPoWKVQaJVj4zvfr/CE=
X-Google-Smtp-Source: ABdhPJzzCRVfWZVo5n1WhEYduUTwS5oGcUvaK0sA6zrSFJZd8EEWif7RNX8M0VBSSWmdivjPmnKU5A==
X-Received: by 2002:a17:902:b103:b0:156:c7bb:a852 with SMTP id
 q3-20020a170902b10300b00156c7bba852mr23663661plr.29.1650523290787; 
 Wed, 20 Apr 2022 23:41:30 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 x184-20020a6286c1000000b0050ad3051f53sm2075037pfd.147.2022.04.20.23.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:41:30 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v12 3/6] mtd: spi-nor: spansion: Rename local macros
Date: Thu, 21 Apr 2022 15:40:53 +0900
Message-Id: <e7d067a754e3361c29960dec266671f0371c38ef.1650519576.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_234134_629646_292E2EE8 
X-CRM114-Status: GOOD (  18.40  )
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

Use CYPRESS_NOR_ prefix for local macros

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 78 +++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 43cd6cd92537..c8abe46e63fe 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -9,35 +9,36 @@
 #include "core.h"
 
 /* flash_info mfr_flag. Used to clear sticky prorietary SR bits. */
-#define USE_CLSR	BIT(0)
-
-#define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
-#define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
-#define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
-#define SPINOR_REG_CYPRESS_CFR2V		0x00800003
-#define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
-#define SPINOR_REG_CYPRESS_CFR3V		0x00800004
-#define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4) /* Page size. */
-#define SPINOR_REG_CYPRESS_CFR5V		0x00800006
-#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
-#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
-#define SPINOR_OP_CYPRESS_RD_FAST		0xee
+#define CYPRESS_NOR_USE_CLSR		BIT(0)
+
+#define CYPRESS_NOR_OP_CLSR		0x30	/* Clear status register 1 */
+#define CYPRESS_NOR_OP_RD_ANY_REG	0x65	/* Read any register */
+#define CYPRESS_NOR_OP_WR_ANY_REG	0x71	/* Write any register */
+#define CYPRESS_NOR_OP_RD_FAST		0xee
+
+#define CYPRESS_NOR_REG_CFR2V			0x00800003
+#define CYPRESS_NOR_REG_CFR2V_MEMLAT_11_24	0xb
+#define CYPRESS_NOR_REG_CFR3V			0x00800004
+#define CYPRESS_NOR_REG_CFR3V_PGSZ		BIT(4) /* Page size. */
+#define CYPRESS_NOR_REG_CFR5V			0x00800006
+#define CYPRESS_NOR_REG_CFR5V_OCT_DTR_EN	0x3
+#define CYPRESS_NOR_REG_CFR5V_OCT_DTR_DS	0
 
 /* Cypress SPI NOR flash operations. */
 #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),		\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(CYPRESS_NOR_OP_WR_ANY_REG, 0),	\
 		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
 #define CYPRESS_NOR_RD_ANY_REG_OP(naddr, addr, buf)			\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),		\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(CYPRESS_NOR_OP_RD_ANY_REG, 0),	\
 		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
-#define SPANSION_CLSR_OP						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),			\
+#define CYPRESS_NOR_CLSR_OP						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(CYPRESS_NOR_OP_CLSR, 0),		\
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
@@ -49,9 +50,9 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	int ret;
 
 	/* Use 24 dummy cycles for memory array reads. */
-	*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
+	*buf = CYPRESS_NOR_REG_CFR2V_MEMLAT_11_24;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR2V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(3, CYPRESS_NOR_REG_CFR2V, 1, buf);
 
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -60,9 +61,9 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	nor->read_dummy = 24;
 
 	/* Set the octal and DTR enable bits. */
-	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
+	buf[0] = CYPRESS_NOR_REG_CFR5V_OCT_DTR_EN;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR5V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(3, CYPRESS_NOR_REG_CFR5V, 1, buf);
 
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -92,10 +93,10 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	 * in 8D-8D-8D mode. Since there is no register at the next location,
 	 * just initialize the value to 0 and let the transaction go on.
 	 */
-	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
+	buf[0] = CYPRESS_NOR_REG_CFR5V_OCT_DTR_DS;
 	buf[1] = 0;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(4, SPINOR_REG_CYPRESS_CFR5V, 2, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(4, CYPRESS_NOR_REG_CFR5V, 2, buf);
 	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
 	if (ret)
 		return ret;
@@ -143,7 +144,7 @@ static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
 	 */
 	if (nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode == 0)
 		nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode =
-			SPINOR_OP_CYPRESS_RD_FAST;
+			CYPRESS_NOR_OP_RD_FAST;
 
 	/* This flash is also missing the 4-byte Page Program opcode bit. */
 	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP],
@@ -227,51 +228,51 @@ static const struct flash_info spansion_nor_parts[] = {
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 	},
 	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 	},
 	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
 		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 	},
 	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 	},
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256)
 		FLAGS(SPI_NOR_HAS_LOCK)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 	},
 	{ "s25fs128s1", INFO6(0x012018, 0x4d0181, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 		.fixups = &s25fs_s_nor_fixups, },
 	{ "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 	},
 	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 	},
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 		.fixups = &s25fs_s_nor_fixups, },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 	},
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
 	},
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8) },
 	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16) },
@@ -328,13 +329,14 @@ static void spansion_nor_clear_sr(struct spi_nor *nor)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op = SPANSION_CLSR_OP;
+		struct spi_mem_op op = CYPRESS_NOR_CLSR_OP;
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
+		ret = spi_nor_controller_ops_write_reg(nor,
+						       CYPRESS_NOR_OP_CLSR,
 						       NULL, 0);
 	}
 
@@ -390,7 +392,7 @@ static void spansion_nor_late_init(struct spi_nor *nor)
 		nor->mtd.erasesize = nor->info->sector_size;
 	}
 
-	if (nor->info->mfr_flags & USE_CLSR)
+	if (nor->info->mfr_flags & CYPRESS_NOR_USE_CLSR)
 		nor->params->ready = spansion_nor_sr_ready_and_clear;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
