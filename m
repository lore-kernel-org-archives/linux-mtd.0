Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74912C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJZoSRNe+bnPwZMrfcA0GemuF6bEWG6VlTIDrEolj2U=; b=jLJ9wETFgwCSLT
	LplkNccds+kXQEedr7RkIVVLVwnBAkD63tZtrvDBWW1i5l71BA1YeHz1C61Lf4dg1UCIn4zLUY3XV
	yz15U/qYvkCwdA7+eF/M5lLoWz/laCfaW0FJJBrGvGaD7+nWztY7gBIFjOkfPXFq8y0/3OIfNyp3c
	qBV4HW2F2sQxfkii2belmvkVIbkFfAW2/1TdaVZ0XMRd4qX1o2D44424kVLfthPQ/F00wula692e+
	q2sfqph8JJM3m2U3iOdadP6Vtexg7yDpt4hImDL+maYXNuzQZapScNBqR3kB+oUEzcMBir83JhRuv
	c//eCELD8lqafkIjpkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQVh-00Bmzo-QP; Thu, 21 Apr 2022 06:41:49 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQVV-00Bmsu-JX
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 06:41:39 +0000
Received: by mail-pg1-x52b.google.com with SMTP id i63so3832945pge.11
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 23:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+5jq0K+JkOdh8wu8Lpj3bWT8rSKlgSozUX72nbpSQg=;
 b=NVTbdlQGHv685oHmakMB4/9iU75sIjZTPvDbPkDti3gdzI+r5amAyhwM2S0+zgBHrk
 gtah6NmmowtmyD7SpqG6Pag+MMSlT24OcIcqi6TTOyQoQwc5rNXxWVf/gEV3hWYCBtxY
 NZB4bJzPj4ECi4NsE9KuwmTWvxhXirrDDhAsZcfvmRpyMNC1aDlKSGm5H9V6yuMYHccc
 6xzDePgCecx7Hpk3fKjq5zoQ4m0yp/aCIrz4EWjtlQjMH5SZIQcgsYTdBvtkRIRYMDob
 jWFRfxJRlTAfJ8gpjQOYJO1CgA7CIF/2LLtJzkmg1W2VHpbBRetdq70H8utySlb4oHkf
 O+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+5jq0K+JkOdh8wu8Lpj3bWT8rSKlgSozUX72nbpSQg=;
 b=EnTzKbQVp8nxY6AssYKKYYVCbjuDytuZLFkrSm25e40OnVJrGOh2fvwiJX9KoEur9d
 MuAVBv0MVLD3PSESdIOlcppJommhjGXAoSte6PAHw5HLawS1YbJ2cXwXyKR7wKB7Mtxg
 H0ceCrdW810736Che5QGNp2QHnfa11CqAtexJeEO4m0lzYJVtw4x/8Xouk8ib1wO44z3
 i4v3WeByaYu+wb0PHHi23u/+MWfQXHPtICrDlgiaRCmeAkoW2jx2dgiLLr8TXwy9yVz6
 q6UGWaGTy+kZfqlvmx93TLJFxkE6Huz1Pf5i1if+FD24r1zsCXRroMo2vyLZKK7Ttl1O
 PKmw==
X-Gm-Message-State: AOAM533pBm26jCvXGS2unQre/nc/j87NaG2dTzyq2MHDLIUW3qN6MlCE
 Qp8clTEQ4PLZo1Aht81n5Q004eQIQn8=
X-Google-Smtp-Source: ABdhPJzjPqTsPhHxnZ4TOw1j+ulVNiTCTy5Ea2OGVcUM0YNC8xRNggOdfGNtpNj1vaESo4MnsSDMMg==
X-Received: by 2002:a63:484f:0:b0:3aa:3f25:25a0 with SMTP id
 x15-20020a63484f000000b003aa3f2525a0mr10246586pgk.559.1650523295210; 
 Wed, 20 Apr 2022 23:41:35 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 x184-20020a6286c1000000b0050ad3051f53sm2075037pfd.147.2022.04.20.23.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:41:34 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v12 5/6] mtd: spi-nor: spansion: Add local function to
 discover page size
Date: Thu, 21 Apr 2022 15:40:55 +0900
Message-Id: <b9c8c715eb37a3c701c469d78381429eb1721958.1650519576.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_234137_715515_1D45C3B3 
X-CRM114-Status: GOOD (  17.11  )
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

The page size check in s28hs512t fixup can be used for s25hs/hl-t as well.
Move that to a newly created local function.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Changes in v12:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=295933
  - Remove addr_width param. Use nor->addr_width instead.

Changes in v11:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
  - Add addr_width param

 drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index dce5fe7498b1..248fe1b221fd 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -176,6 +176,37 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_set_page_size() - Set page size which corresponds to the flash
+ *                               configuration.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * The BFPT table advertises a 512B or 256B page size depending on part but the
+ * page size is actually configurable (with the default being 256B). Read from
+ * CFR3V[4] and set the correct size.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_set_page_size(struct spi_nor *nor)
+{
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width,
+					  CYPRESS_NOR_REG_CFR3V,
+					  nor->bouncebuf);
+	int ret;
+
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & CYPRESS_NOR_REG_CFR3V_PGSZ)
+		nor->params->page_size = 512;
+	else
+		nor->params->page_size = 256;
+
+	return 0;
+}
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -230,28 +261,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
 				     const struct sfdp_parameter_header *bfpt_header,
 				     const struct sfdp_bfpt *bfpt)
 {
-	/*
-	 * The BFPT table advertises a 512B page size but the page size is
-	 * actually configurable (with the default being 256B). Read from
-	 * CFR3V[4] and set the correct size.
-	 */
-	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR3V,
-					  nor->bouncebuf);
-	int ret;
-
-	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-	ret = spi_mem_exec_op(nor->spimem, &op);
-	if (ret)
-		return ret;
-
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
-		nor->params->page_size = 512;
-	else
-		nor->params->page_size = 256;
-
-	return 0;
+	return cypress_nor_set_page_size(nor);
 }
 
 static const struct spi_nor_fixups s28hs512t_fixups = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
