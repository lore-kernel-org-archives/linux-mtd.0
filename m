Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E2CC74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3esYHtvDvJSLoRs3mLf78x7Ittz+ONc33N8nOSEFuE=; b=xb6NvrbYbpSYFB
	EcRSYW7Of0Q5N6mRa/GO32VPM+5MWn1n2MONZj03BEsvzXpEiWNC3D4xXtGsnsmbk/eRzzCHBjls8
	JljEds91WsScM84IsbOlbk+oVCtY42ahhEqRKOVrysMjhtsffSwPMQ6Ix4DxUuHNZ232Rs/dnxFE8
	KShhFZLwdEhv2X5UYXI2wvB2BqsFPqXrtaR7WQPYYdcdLyFmNhREFVlputc5TIrXUQtI8TKyQh61Z
	p15uaOPCZKGRtKFS3awrEV26Jj3QcAsWgeMHQNU64PGDCHVZLgtgmM5YuOoqSiTLcLiDqO2r/hXdB
	7jxhpwBQhyIomqFpOwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9e-00Etz3-0s;
	Wed, 22 Mar 2023 06:41:02 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9Q-00EtoG-1y
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:50 +0000
Received: by mail-lf1-x130.google.com with SMTP id c29so4582409lfv.3
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB2d2IEiiJcGXzBHNy9s2vUD62/sXfHS54tkdN1U+34=;
        b=sAYham2shXJkNdF7HOQMen2SiiZX4gIz+Lgi/ueSbtSZtaCcRBgdtSxfVSP1UnNWhQ
         J/O+obHZp6SPmO/nkkEuwsxbqkah93ye/6a5tbm4+IxHdCeWfGz9OF6OORvNCwC3GjtL
         /WkBGlgwEfiI2vyBivW5ItzEpOteTz/6+lF/nzXoYZWO+ergRmPkKql0cRnrK30eJSaS
         padq4NJz/vRgRP+2781iVyDhgF+t9tbJdZVqDiFcCFHWxM4Vl4ELR3ZR9edmVKJyPamq
         c+q4MmPI3IGHJ9SxAnvEluDpz8a+UFmqHmn/0A7EI7aLPggqoA0WgSBkrORVbBLP/0YZ
         PtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB2d2IEiiJcGXzBHNy9s2vUD62/sXfHS54tkdN1U+34=;
        b=2jR62IlPD8S7H39KzEgqn+PbUn/HpLyyK/ZXIp+WV34uNifab9cjtltx5NkxFnelxq
         eMPuGQk9hIiwMl49FvCHaIi+p9ZaEF/Xy3mzDW4uGiD7Pmwnos2rZNFdV1pAu+eKA85c
         i0Q1QPhUOakryB2lknHA3AgK4Xtcdq3YOBGlcVcQZ3wvwBeVyYDQ2/riWfVHxgJltmDB
         urUwqbscu7NLUReFD19QCTwbV9FrFz35Yi551epKyvG8595I91ogSfmxHJtuSklY5aRY
         N6MkwPOPUMAjqxPWhz9Fgl03RKvj5zezvbaopj3AjBMma3l4HHboFYfAolCO/BXcA2SE
         mbeg==
X-Gm-Message-State: AO0yUKU7FIR9jb8zkhjNtV7dygc4+jima3EA7tuwa0a8b6c3luJHu/z3
	l+tE3oA3h+47mzi20Mqa8Mq1MoSLLT+4UrOFog7WJg==
X-Google-Smtp-Source: AK7set+xMoeEZ739iDZP0qDAY5AXuY0e5jSQ8XLUOpn1wXMnT5NNU5jq4Up+LET1pTHT3IQ6q7UIcw==
X-Received: by 2002:a19:ad03:0:b0:4a4:6af4:43b7 with SMTP id t3-20020a19ad03000000b004a46af443b7mr1601504lfc.69.1679467246059;
        Tue, 21 Mar 2023 23:40:46 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:45 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 11/11] mtd: spi-nor: spansion: Determine current address mode
Date: Wed, 22 Mar 2023 06:40:33 +0000
Message-Id: <20230322064033.2370483-12-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234048_655706_D7B9640C 
X-CRM114-Status: GOOD (  20.68  )
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

Internal address mode (3- or 4-byte) affects to the address length in
Read Any Reg op. Read Any Reg op is used in SMPT parse and other setup
functions. Current driver assumes that address mode is factory default
but users can change it via volatile and non-volatile registers.

Current address mode can be checked by CFR2V[7] but Read Any Reg op is
needed to read CFR2V (chicken-and-egg).

This patch introduces a way to determine current address mode by
comparing status register 1 values read by different address length.

Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 131 ++++++++++++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 1678b7b2e9f7..ab2103dace76 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,10 +14,12 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_STR1V		0x00800000
 #define SPINOR_REG_CYPRESS_CFR1V		0x00800002
 #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
+#define SPINOR_REG_CYPRESS_CFR2_ADRBYT		BIT(7)
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
 #define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
 #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
@@ -188,6 +190,117 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_determine_addr_mode_by_sr1() - Determine current address mode
+ *                                            (3 or 4-byte) by querying status
+ *                                            register 1 (SR1).
+ * @nor:		pointer to a 'struct spi_nor'
+ * @addr_mode:		ponter to a buffer where we return the determined
+ *			address mode.
+ *
+ * This function tries to determine current address mode by comparing SR1 value
+ * from RDSR1(no address), RDAR(3-byte address), and RDAR(4-byte address).
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
+						  u8 *addr_mode)
+{
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_STR1V, 0,
+					  nor->bouncebuf);
+	bool is3byte, is4byte;
+	int ret;
+
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[1]);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	is3byte = (nor->bouncebuf[0] == nor->bouncebuf[1]);
+
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(4, SPINOR_REG_CYPRESS_STR1V, 0,
+					  nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	is4byte = (nor->bouncebuf[0] == nor->bouncebuf[1]);
+
+	if (is3byte == is4byte)
+		return -EIO;
+	if (is3byte)
+		*addr_mode = 3;
+	else
+		*addr_mode = 4;
+
+	return 0;
+}
+
+/**
+ * cypress_nor_set_addr_mode_nbytes() - Set the number of address bytes mode of
+ *                                      current address mode.
+ * @nor:		pointer to a 'struct spi_nor'
+ *
+ * Determine current address mode by reading SR1 with different methods, then
+ * query CFR2V[7] to confirm. If determination is failed, force enter to 4-byte
+ * address mode.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
+{
+	u8 addr_mode;
+	struct spi_mem_op op;
+	int ret;
+
+	/*
+	 * Read SR1 by RDSR1 and RDAR(3- AND 4-byte addr). Use write enable
+	 * that sets bit-1 in SR1.
+	 */
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+	ret = cypress_nor_determine_addr_mode_by_sr1(nor, &addr_mode);
+	if (ret) {
+		ret = spi_nor_set_4byte_addr_mode(nor, true);
+		if (ret)
+			return ret;
+		return spi_nor_write_disable(nor);
+	}
+	ret = spi_nor_write_disable(nor);
+	if (ret)
+		return ret;
+
+	/*
+	 * Query CFR2V and make sure no contradiction between determined address
+	 * mode and CFR2V[7].
+	 */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode, SPINOR_REG_CYPRESS_CFR2V,
+					  0, nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR2_ADRBYT) {
+		if (addr_mode != 4)
+			return spi_nor_set_4byte_addr_mode(nor, true);
+	} else {
+		if (addr_mode != 3)
+			return spi_nor_set_4byte_addr_mode(nor, true);
+	}
+
+	nor->params->addr_nbytes = addr_mode;
+	nor->params->addr_mode_nbytes = addr_mode;
+
+	return 0;
+}
+
 /**
  * cypress_nor_set_page_size() - Set page size which corresponds to the flash
  *                               configuration.
@@ -227,9 +340,9 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	struct spi_mem_op op;
 	int ret;
 
-	/* 4-byte address mode is enabled by default */
-	nor->params->addr_nbytes = 4;
-	nor->params->addr_mode_nbytes = 4;
+	ret = cypress_nor_set_addr_mode_nbytes(nor);
+	if (ret)
+		return ret;
 
 	/* Read Architecture Configuration Register (ARCFN) */
 	op = (struct spi_mem_op)
@@ -280,6 +393,12 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 			const struct sfdp_parameter_header *bfpt_header,
 			const struct sfdp_bfpt *bfpt)
 {
+	int ret;
+
+	ret = cypress_nor_set_addr_mode_nbytes(nor);
+	if (ret)
+		return ret;
+
 	/* Replace Quad Enable with volatile version */
 	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
 
@@ -375,6 +494,12 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 				   const struct sfdp_parameter_header *bfpt_header,
 				   const struct sfdp_bfpt *bfpt)
 {
+	int ret;
+
+	ret = cypress_nor_set_addr_mode_nbytes(nor);
+	if (ret)
+		return ret;
+
 	return cypress_nor_set_page_size(nor);
 }
 
-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
