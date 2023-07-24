Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7528C001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnwqMt1XAOFtwXPvzusownIYshs/nr5pTZE11RrEris=; b=puo+obTBoKfvb9
	WPRYX7Qyx3xyzgqldNBDL+m+bKSLcUcnnZdfLdCpgx+v6wJ+ISHuSkasVVSuBoMV5uLUByn9BwOZ0
	ZJbPBu/cqFyamPE6Cq3AYLlxVYl6HMyG6BE7cjIx4awd6LG8QJJROS7QhLVvYhXqn9GVD37UGGQkU
	eQ9TWONF1fr6YScAOpdGjftM7haPggoIJuMlZSTuBlXxJraeo7xWJuabkaO+Hc0BdW149q8uTtmrX
	z1oUeTp5KXWaBEJhlYfMEJk/BO+l/l8JEiDGyyBXynccpQNF50BuXKi3kUV3HuENQ9T9JCCJwfkOu
	WDA2MbzwGHdAcw9AJFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgl-003CMY-0J;
	Mon, 24 Jul 2023 08:13:07 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgg-003CJF-2j
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso719204866b.3
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186379; x=1690791179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOW1ZpE6/v2ajQK+LnlqMKJQMOzTE7yoF7vscLDu6Gs=;
        b=JDj+wnF8yQouCVrrQKETHEvvp6b3VpVDNs5K5tqUgWfGuih0tmOk83JGe9at5g06wr
         XkgzGrDO83Gaw4+TRv84K2Dw1a7drN/HMLi8Xsb+2/p9xWcBKKcqMIy8PFdgK1nPmKDx
         EEPKdf9xhYBO6pR5AFAUJIjbVKUQAYdYP3kfT2LqjwVRduK44LCHCsbOQhrQ/cYvktMq
         58hIG5EFzx+XpJpaWVuT6hqPYu0cyy/1SLjyp+SFxoJWDaNWqGoEfjahm48hO9k+icjx
         6q6ncxxmhF3DZs6InQ8wGWSv4WvV9Mr348wWJ4N3UT3ADWO9wo0uDX5kiVGoj04ekxgb
         DhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186379; x=1690791179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOW1ZpE6/v2ajQK+LnlqMKJQMOzTE7yoF7vscLDu6Gs=;
        b=BNFML3DbwGXcNDXfP4i9ahHr/j/lhYo/fpHvSspjWZfPWhTb7KtmbHPqMdxsoaxRGC
         eQoaf9VGKgIQBGbF4B66XxksDfiEduHo40rQ4elFbMyjEgO/0bUTORXdFPwnRoFQOt9X
         yg0328DF56JBJAh1H0fAunAyW7X0Fw5ayT/4GxgOZO9lbYqefX2bZwEt0oJzIEmlaJel
         R2v/t86qQCrY7prHWrceZUe+179nDpISZI3bogD04s59rqbUsxwWNUDDhJSccT8S0QuS
         JE7HgpRmf4/DvHhTVF9Gv5VyXeYaagchDw43S0l/c32Ku7fLPdwtIyvSvm3mj8RQt5Qr
         5XuQ==
X-Gm-Message-State: ABy/qLbg5kjomncKbOV/VRsAGITOk/2L3jOWGYzsaoNbBssOmYXseEFx
	xDOZWGKJYy6qjgFdMhlIZh4EFq/cKVALid76BsI=
X-Google-Smtp-Source: APBJJlF5DN5lXH8fTejLZtW8eJla8OQDmeW6ZRpLHgk8ob9ppkwAXRuwapkwP5Cr6qktk0vTBm5dJw==
X-Received: by 2002:a17:906:20c6:b0:96f:1f79:c0a6 with SMTP id c6-20020a17090620c600b0096f1f79c0a6mr8864498ejc.70.1690186379120;
        Mon, 24 Jul 2023 01:12:59 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:12:58 -0700 (PDT)
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
Subject: [RESEND PATCH v3 03/11] mtd: spi-nor: spansion: prepare octal dtr methods for multi chip support
Date: Mon, 24 Jul 2023 11:12:39 +0300
Message-Id: <20230724081247.4779-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3820; i=tudor.ambarus@linaro.org; h=from:subject; bh=xpyv1UNUOm+7WUBWb0Vl59R+HvbIVKf4klrF0ttDcrA=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ+cL1Tyl84sNIYkyBfq2rFtCaH7yjWfYS7u dc1OqqEJMiJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfgAKCRBLVU9HpY0U 6bwwCACZMu+rPl8e8uNTwrWcuFUGYQBaS9XZuG8XIKvziwOQI07kaK1F2tHjzDhOExyHcrKTmDS kKUJNHHnxz2RbevGYR1sjJJyGVtdEN7yvFBxZrBQ9maIOFg0SJowEtnANesQRaBLMs8Qjxyv7ho KRNkkU/G6mF1R6QnFVMIezeiFEqZCIT7o+GQGWQATpz/pUOMZuiw91p8h915Kw/kXxBv99m8VXo aXUZwXMqiBf/EEYLr0Fg2s7mNI9/yoSiNVUIgDekgIwwriQbp/2mP6H6NeTCI/ztKGH+Ddqkd9w 7rSJ3kAHilhWRbiNySha+9gSBrvmWbhxq2/YTGvsT5V77GZx
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011302_882177_22B06DD3 
X-CRM114-Status: GOOD (  12.00  )
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

Infineon's multi-chip package (MCP) devices require the octal DTR
configuration to be set for each die. Split common code in
dedicated methods to ease the octal DDR MCP support addition.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 50 +++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6460d2247bdf..51eabddf2b16 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -156,7 +156,7 @@ static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
 	return 1;
 }
 
-static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
+static int cypress_nor_set_memlat(struct spi_nor *nor, u64 addr)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -164,8 +164,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR2V, 0, buf);
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr, 0, buf);
 
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -176,8 +175,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	*buf |= FIELD_PREP(SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK,
 			   SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24);
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes, addr, 1, buf);
 
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -185,13 +183,33 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 
 	nor->read_dummy = 24;
 
+	return 0;
+}
+
+static int cypress_nor_set_octal_dtr_bits(struct spi_nor *nor, u64 addr)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf;
+
 	/* Set the octal and DTR enable bits. */
 	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR5V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_mode_nbytes,
+					  addr, 1, buf);
 
-	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	return spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+}
+
+static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
+{
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	ret = cypress_nor_set_memlat(nor, SPINOR_REG_CYPRESS_CFR2V);
+	if (ret)
+		return ret;
+
+	ret = cypress_nor_set_octal_dtr_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
 	if (ret)
 		return ret;
 
@@ -209,11 +227,10 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	return 0;
 }
 
-static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
+static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
-	int ret;
 
 	/*
 	 * The register is 1-byte wide, but 1-byte transactions are not allowed
@@ -223,9 +240,16 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
 	buf[1] = 0;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
-					  SPINOR_REG_CYPRESS_CFR5V, 2, buf);
-	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes, addr, 2, buf);
+	return spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
+}
+
+static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
+{
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	ret = cypress_nor_set_single_spi_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
 	if (ret)
 		return ret;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
