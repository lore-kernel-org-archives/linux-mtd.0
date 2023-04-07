Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8EEC77B6E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sr9uiQQdZOtGzKJQYM9A6URG4YbcgaHj91yzGxvW+dM=; b=tEk9r5iVLSQn71
	B2BkBEawS4dgCk5oVpjQ4/UnHBUGJas9nLvspzlOSsyflDeHgcffCd1sUZ6whlEARi/bFQFm5FWz5
	cElaKX2ixoBqgPS7b+MkB3Q8UJqpnov4dHXSY2RSoUOxHCxyDr2Sv8VQEyonqmeXndklSTn6PXHV8
	j5f3VFqlg2vIru7xJlyaihmsEOFklzlr/VbdfOEac/m6knhqGDyB5OhvW8xVmQMSWb9Nj4X5/gQeY
	4atXBgC6fxnofS7cajrT290FkZ8q1buZjDRQCHmuEPickpq/V4PcVPjdHE9khF2YTWRvltYWN4yPk
	tMvlzpBs5Tkc4R4Hsl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfmt-009I3O-2F;
	Fri, 07 Apr 2023 06:41:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfmr-009I2d-19
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:41:30 +0000
Received: by mail-pl1-x630.google.com with SMTP id km16so1170014plb.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680849688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sty9Vva/GZquwXe+pkd6Nxrz8bwsIEDg04w2eW4GIY4=;
        b=DQUcMCeSxRIjvx3/7dxED0WkA4OM9n6Iw6KQ8px60y9xjydl95Q+Y+tkC/e8VG91JA
         6ryBNCvFqvff13HY4cXHj968uMulN49MkvUX8afP94x0TIAhpcRJDz05dS6K1ttOg+gH
         vkGQdaEGQ+RBJznIMfnnc7fxkeO7DICFY4/Fbih6X3yj+ueU4QFPoSjIwlkI6O3/Hyce
         qvnob3RsyymOCm15dXLMVzMG2b/y6ssGedh2kLDOVKLqbnvSByhqWydJF3lIW9NXeuYT
         g8JLO8NLd6wYvPBs4FepXIHrOWdL8EOkJoBWdMA6SYdqbpCDo8ZS8wslP9+Qfl2EQGsy
         ghwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680849688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sty9Vva/GZquwXe+pkd6Nxrz8bwsIEDg04w2eW4GIY4=;
        b=WwFnuWu0jD0YGnZA5f/vfeH/kiL3WUf9rO2mVojKo1FTVUaEz8eae7r2TUhR4eKKpC
         RYfmm4CsLfERvhBUlJeYcuuYCzRPbsZ+e1ROv3ANyUuZQ+U5iSjaYFmLJkKPKhqjjlpW
         e0K6S91sYmSF3Fuy/pExx0cbyWGoZ98iXEnk3W/iWOU2bvjEJCmpvF+M6XibB8FKH5Xn
         owLtxshWuEaKtArZPopO5B4zF9joe/SuGCwPS6/Jt0kF6zs5fcEL/ccP5O9i0F9zglqm
         HGAZPiOQWpyLkHOp9e4Oj4OehHnfsMKrvXpfWYdq3aO1GwDh5ROuRIzq2cbI/QgSlJl/
         U7Jg==
X-Gm-Message-State: AAQBX9fqa3TVTZ1pHIr0NRZ0Xg+axHBSkrQj7+S2H8qGEK1FzaswtPMr
	q5dw0+5M3HaZvzOT3Sewwdb5FGdRCK4=
X-Google-Smtp-Source: AKy350ZOhdqWxh4a0oqUsOA7z8Uj7QsYjg1WiX+06HXBDFYZsZ+xloygQBd6U4Nb3NdxUNIum4++pA==
X-Received: by 2002:a05:6a20:6d9b:b0:d9:55b0:c0e8 with SMTP id gl27-20020a056a206d9b00b000d955b0c0e8mr1811251pzb.39.1680849688629;
        Thu, 06 Apr 2023 23:41:28 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id k14-20020aa790ce000000b005abc0d426c4sm2309806pfk.54.2023.04.06.23.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:41:28 -0700 (PDT)
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
	Bacem.Daassi@infineon.com
Subject: [PATCH v4 1/8] mtd: spi-nor: spansion: Rename method to cypress_nor_get_page_size
Date: Fri,  7 Apr 2023 15:40:57 +0900
Message-Id: <cd3fb2cbc42a9576377ce4506eec72a58240805d.1680849425.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_234129_399687_EF24ACD0 
X-CRM114-Status: GOOD (  11.06  )
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

From: Tudor Ambarus <tudor.ambarus@linaro.org>

The method queries SPINOR_REG_CYPRESS_CFR3V to determine the page size.
Rename the method accordingly, s/set/get.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ffeede78700d..c937f0ac61de 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -302,8 +302,7 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
 }
 
 /**
- * cypress_nor_set_page_size() - Set page size which corresponds to the flash
- *                               configuration.
+ * cypress_nor_get_page_size() - Get flash page size configuration.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * The BFPT table advertises a 512B or 256B page size depending on part but the
@@ -312,7 +311,7 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int cypress_nor_set_page_size(struct spi_nor *nor)
+static int cypress_nor_get_page_size(struct spi_nor *nor)
 {
 	struct spi_mem_op op =
 		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
@@ -368,7 +367,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	if (nor->bouncebuf[0])
 		return -ENODEV;
 
-	return cypress_nor_set_page_size(nor);
+	return cypress_nor_get_page_size(nor);
 }
 
 static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
@@ -407,7 +406,7 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	/* Replace Quad Enable with volatile version */
 	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
 
-	return cypress_nor_set_page_size(nor);
+	return cypress_nor_get_page_size(nor);
 }
 
 static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
@@ -502,7 +501,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	if (ret)
 		return ret;
 
-	return cypress_nor_set_page_size(nor);
+	return cypress_nor_get_page_size(nor);
 }
 
 static void s28hx_t_late_init(struct spi_nor *nor)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
