Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E51C76196
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/DpWLxO13oTVmFVZwZWPZu7zpUFjoEDo6lGSm5udNY=; b=bJrKa9Xs/mFZAD
	BmIZEEOVbP+N7eShosLLCbQ6CII9JuWx1Kug7XaJ1P7Tg1BPFOkpi/+6uuCu5Q3BJiINENeXAia+i
	sVxXlCCxv+p3wD2U2Ns7kZ4zdTcQ51GscEELkxlPEIOUtOAJI2PqNOS0ran/TPXIxDI2eoDluAele
	DSI+eg35WTSngzcqlBa2jmnJ8cksFFAoRPjUrNuwW51v8licdBur5u9DIiMLJdq1LwiWSB2aiwVUl
	SgfTHv6MCLatj3z09MOXbX1B1fQV8rOb0Y//3/eyDbemjZfrsbmfYzISjJXU8cfphLm4/dHPUl3+o
	tVcIh5yz+4dvEmj2AgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfnE-009IBG-0y;
	Fri, 07 Apr 2023 06:41:52 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfnB-009I9a-1W
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:41:51 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-62ddc0dd95eso110125b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680849708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnSHTFD4uRsM0lzl57imWTCj74kIJT04d5SDVOL0sCs=;
        b=hE5MmfDycP4XTM43SnsU0uJGtIUtBq6rKI0aZhNLdO31zIEB3Bzg8j4cJbhUypsPDL
         WLczoSrbS14Afjfu4t9aJLZnYK0uu7eUKPwzVGnqtu1mKjWmWbH0Hp+pq8LEdDGEvnrS
         CUQyKteTY7ahEEkRrKInXniwsaNRJNiO48D6vGFGpDGsGjOY+KVWo/s42Gjr/enbrwtl
         eK7sVOhSZcrhoU6tkXT2KjGvnwTV8KLQslsgRVJjm4Fl2+KsAYQawanaudgoRcH5utZn
         2U0EYEq0fHiIoIdbs6OZ4AtF32qxViTPb2Y+n8RB3jD/VRPA8bFDpDwm92Ytnx+3eJAO
         mgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680849708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnSHTFD4uRsM0lzl57imWTCj74kIJT04d5SDVOL0sCs=;
        b=mT8kvjrLBwJI6CpJmHC+5jye1mvnYpsJ5pl6PDPChbKgVNfnGSB4ErPjjApEmuuZkj
         h6fPDhrd8SSQXoTrH+V1jmW1dOq30ZKEjVLE+v42yIe5c5LJvwi6cmz8OkNNhm96sNfr
         IQuI77r7flAM0AziINwWXoYCOk0/3JHrAqaTpux5DwguaCd2jbIXJwqksDL2zUDTe1Wo
         8X3f3yL0IfnRDc5SST2hJ56pqkfqcHmAjq7sH0MH+fFaUH502jrFO1Zx+DjRiAysjMrM
         w7gHxTV+rKg7sYw1kMM4ZYirjgKw0f/J2JVq6YnyYDfTBIQ0Jx7LD/2KvWSG9GqmUAFI
         BCCw==
X-Gm-Message-State: AAQBX9ebqOqCWQfW80kpsm49ucq0g41Pto2x0En+xTdMvceVPyCO0z7y
	eEsRbHWUxyFKHd4MEo4nNThY2goHuz8=
X-Google-Smtp-Source: AKy350aHr0cakLKdJr4KFicFTDHOiPpqEA4uKCmBQRM0gXViEPY+UJBLDRrbSxMggfuVAmk5eUze1A==
X-Received: by 2002:aa7:9489:0:b0:628:cd1:fbbb with SMTP id z9-20020aa79489000000b006280cd1fbbbmr1193217pfk.27.1680849708141;
        Thu, 06 Apr 2023 23:41:48 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id k14-20020aa790ce000000b005abc0d426c4sm2309806pfk.54.2023.04.06.23.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:41:47 -0700 (PDT)
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
Subject: [PATCH v4 5/8] mtd: spi-nor: spansion: Rework cypress_nor_get_page_size() for multi-chip device support
Date: Fri,  7 Apr 2023 15:41:01 +0900
Message-Id: <6f8272f3e877dee392742d2c8401c4aed57e6d83.1680849425.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_234149_511876_DD9A2622 
X-CRM114-Status: GOOD (  19.55  )
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
