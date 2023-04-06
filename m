Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAD1C76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/DpWLxO13oTVmFVZwZWPZu7zpUFjoEDo6lGSm5udNY=; b=4o1CsZ6Z3QdPN/
	Dz4K510TMAbz6nYhE+GvgKGyUry6USZy/ZZPLupDvLSnn3IJkOdj8axIHJ8fkjKGiexE0VJNVmkZp
	I9y82RZMBuDkuOd4dT6BLQJ/R30UhTDsDnZ2B59QiNCCN7MebO8EY6o1NB4yP6aXdvfGk8cJh6fq2
	LM5SPCypyeh+lJRlCK8Ot0w9EejJ8+EzxtTFZn9LQalgXbzt/w8Rb59856pP9fEMm42cpWt+jGOjS
	2yqo0bZEFKOGUwZOlCtIxTyDUKHR8OpH7R0sWB3wyAscky8hhf8fFwfeni+q3wJIIqiGK4O9iSboT
	H9e84ajCQmRdzJA+K/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIyG-006TAN-2u;
	Thu, 06 Apr 2023 06:19:44 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIyC-006T7k-31
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:19:42 +0000
Received: by mail-pg1-x52b.google.com with SMTP id y35so23151358pgl.4
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnSHTFD4uRsM0lzl57imWTCj74kIJT04d5SDVOL0sCs=;
        b=EumRptPJRe9xReY3mj1AWM+1PHVl3dKewHjCw/gBWtHnEM0Kmc28fqF6slAL2Z20kw
         URKZNLC6GPosXU7WNV6bN0gmjmeYzcgJNsU4uCiz2sPdhfzl4W56he9BFa5UwmQ73HSI
         vlURM9ByETvcyAWi3od3qkjyv7mClS0nkZfJNhC5cVdrp9XIKILmbkah68yLtwK+wIUc
         LbFrJ1jNhOJ+PkQLHPuyRfZJFC4ehVlH7ol6gqpz6DeP940EYuk03IN02lnWchKE9gqU
         q2+ou9DjPD8ez6+DlO3fJ4h0rg68CpfIPfU7BYqc4i1JYrkuBLRgAH2XsvCc+YKqy/Km
         AINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnSHTFD4uRsM0lzl57imWTCj74kIJT04d5SDVOL0sCs=;
        b=CwyHPGX7BW5WZH3cuJcevRQXECUo39Nm1prB6UqBd2gJUvhvCQTOypKtFZbLCin7lh
         lZet+Lo8OpE93HJQcsJNN9+ZLL7R9k3wj26UGFJa2qXXjEeQtBNnG6YXJBtzh4sXsoUs
         5wFEmSjdwD7IYNFnba30J18se8zrUIBUrm2nEoaApzK+DNGIwzddDFQKcM14pfyIYv8D
         wlOzw0+SYLOmOGmhFS8d7wgdkWPUkbBndVpOx+myWYrMUs1dQuMBe8joQ5JsJf+UbkFZ
         F7DxWZNusw3v9xTweSiHnY5sgNegXcw+i3s8bt4XvLPOBBH+06TK7ir5ks1uCJElIJWJ
         kVeQ==
X-Gm-Message-State: AAQBX9du4fdIIGWwF/jBqRy2C54dOM73mZzmajGQueDbORkwnTqEdW52
	2q6C3IeWB6NNtmt/NQb7Mon0f1sWgzNY/Q==
X-Google-Smtp-Source: AKy350bnt7F3otUAQKLC/CL8VDh63okVPL9Yd1sQhuJt/451q23GS+MGT9O9AYNHtPwMAxvMECs5SA==
X-Received: by 2002:aa7:9793:0:b0:5a8:8535:18b with SMTP id o19-20020aa79793000000b005a88535018bmr7678308pfp.11.1680761979153;
        Wed, 05 Apr 2023 23:19:39 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id 18-20020aa79152000000b0062dbafd2980sm450542pfi.65.2023.04.05.23.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:19:38 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 5/8] mtd: spi-nor: spansion: Rework cypress_nor_get_page_size() for multi-chip device support
Date: Thu,  6 Apr 2023 15:18:56 +0900
Message-Id: <ae95045c81b57c256dbeb771f2713a94185a4e06.1680749578.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231940_981654_E46A3570 
X-CRM114-Status: GOOD (  20.12  )
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

For multi-chip devices, we can use 512B page only when the all dice are
configured as 512B page size. The volatile register address is calculated
by using the volatile register addresses retrieved from the SCCR tables
and the (configuration) register offset.

The location of cypress_nor_set_page_size() call is moved from
post_bfpt_fixup() to post_sfdp_fixup(), because the number of dice and
volatile register offset are parsed in the optional SCCR tables.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 89 ++++++++++++++++++++++++++--------
 1 file changed, 69 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 519fdad79a19..5e021e20497b 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,15 +14,26 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
-#define SPINOR_REG_CYPRESS_STR1V		0x00800000
-#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
+#define SPINOR_REG_CYPRESS_VREG			0x00800000
+#define SPINOR_REG_CYPRESS_STR1			0x0
+#define SPINOR_REG_CYPRESS_STR1V					\
+	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_STR1)
+#define SPINOR_REG_CYPRESS_CFR1			0x2
+#define SPINOR_REG_CYPRESS_CFR1V					\
+	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR1)
 #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
-#define SPINOR_REG_CYPRESS_CFR2V		0x00800003
+#define SPINOR_REG_CYPRESS_CFR2			0x3
+#define SPINOR_REG_CYPRESS_CFR2V					\
+	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR2)
 #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR2_ADRBYT		BIT(7)
-#define SPINOR_REG_CYPRESS_CFR3V		0x00800004
+#define SPINOR_REG_CYPRESS_CFR3			0x4
+#define SPINOR_REG_CYPRESS_CFR3V					\
+	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR3)
 #define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
-#define SPINOR_REG_CYPRESS_CFR5V		0x00800006
+#define SPINOR_REG_CYPRESS_CFR5			0x6
+#define SPINOR_REG_CYPRESS_CFR5V					\
+	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR5)
 #define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
 #define SPINOR_REG_CYPRESS_CFR5_DDR		BIT(1)
 #define SPINOR_REG_CYPRESS_CFR5_OPI		BIT(0)
@@ -301,17 +312,7 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
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
+static int cypress_nor_get_page_size_single_chip(struct spi_nor *nor)
 {
 	struct spi_mem_op op =
 		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
@@ -331,6 +332,54 @@ static int cypress_nor_get_page_size(struct spi_nor *nor)
 	return 0;
 }
 
+
+static int cypress_nor_get_page_size_mcp(struct spi_nor *nor)
+{
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
+					  0, 0, nor->bouncebuf);
+	struct spi_nor_flash_parameter *params = nor->params;
+	int ret;
+	u8 i;
+
+	/*
+	 * Use the minimum common page size configuration. Programming 256-byte
+	 * under 512-byte page size configuration is safe.
+	 */
+	params->page_size = 256;
+	for (i = 0; i < params->n_dice; i++) {
+		op.addr.val = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR3;
+
+		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+		if (ret)
+			return ret;
+
+		if (!(nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ))
+			return 0;
+	}
+
+	params->page_size = 512;
+
+	return 0;
+}
+
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
+{
+	if (nor->params->n_dice)
+		return cypress_nor_get_page_size_mcp(nor);
+	return cypress_nor_get_page_size_single_chip(nor);
+}
+
 static void cypress_nor_ecc_init(struct spi_nor *nor)
 {
 	/*
@@ -408,7 +457,7 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	/* Replace Quad Enable with volatile version */
 	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
 
-	return cypress_nor_get_page_size(nor);
+	return 0;
 }
 
 static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
@@ -434,7 +483,7 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 		}
 	}
 
-	return 0;
+	return cypress_nor_get_page_size(nor);
 }
 
 static void s25hx_t_late_init(struct spi_nor *nor)
@@ -494,7 +543,7 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 	 */
 	nor->params->rdsr_addr_nbytes = 4;
 
-	return 0;
+	return cypress_nor_get_page_size(nor);
 }
 
 static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
@@ -507,7 +556,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	if (ret)
 		return ret;
 
-	return cypress_nor_get_page_size(nor);
+	return 0;
 }
 
 static void s28hx_t_late_init(struct spi_nor *nor)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
