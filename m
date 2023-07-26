Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4495C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnwqMt1XAOFtwXPvzusownIYshs/nr5pTZE11RrEris=; b=VDwuxnP8HHkzcl
	i3dAHBQ7siRJrLr9EyID+DBwD83V0rHSR6m/8IAH3kd67Ki9SBxwud7ZkfN9v/31IGlqLp2/phTjI
	9iKHjqg2Duf3UA6tLxY1/fdi+nYGQaA81o1vETEHAtNo4uvu4iqoydoz8ZERiMTL6bsv6lg6TGCOD
	G8Umk6DQFHb5dfUfgLOcHZSUyA99gu7U5/zZdaILNiqrMU/BzBjGcSh9oXH9Hj/ZAC6GsyowRSPPS
	C5bcVbegQ0rQZrmMY6XO5VfvdfU/Z6TbU1XLwngWB4UBrXFXQswIclNBxNCuul9xA0VRR5/TtC9FY
	/lUVGAjZRhVYaR5EI9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKe-009UzR-15;
	Wed, 26 Jul 2023 07:53:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKW-009Uvt-34
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so54986625e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357987; x=1690962787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOW1ZpE6/v2ajQK+LnlqMKJQMOzTE7yoF7vscLDu6Gs=;
        b=XjXRddzUgX6ZCB8WxKJ71CHiJz8AfBWByZoyYDJe/1RT9PyHRc/i+xMcMqseM5LHeg
         mQSD0D/DK8HwqZsoX7qtM6QrZgBEa7xrup7xaGl6u1u8o6ayJlqlv/9pAfLCgLDzMamj
         XZcHBsPswOlfxWwAFdXr7UplJkiifIYL+auN5D6AK/liqnc7KIh3u+mWcqQSK/LJFVpk
         M0Xpxyhq2+XD2jPEt8XTjRO8ysvj6v/dvgFTg7XR2K/+hH7vpNSL/FV64bHTY9Bb7jsa
         iTkm9kYkNKv7fC4Ww8iei4mSFKLjjd9OMuHj7ook6nfL5613f1VVdvXrZ17OWgl8GyPh
         TcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357987; x=1690962787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOW1ZpE6/v2ajQK+LnlqMKJQMOzTE7yoF7vscLDu6Gs=;
        b=dHAUKJvsO30ir7lSnb8iUIw38Fbh647vvQyNFYIAHLCrm7JvW1zr6p8q3X4vHM2DY/
         +CKcMaKI9leBr76UN5izR627MYGZLXg6jPB0dSMsbBJ5cRhG/Yv7ispRrR+z6s1tGmro
         wOO7Ms6jVbxvKsMyFhTZ6mXzbXulLnTNaq1UF0tWK0LWj/EAluUwi6LNoSf3EIYIoa5l
         7svm+gPiRRkWJqI0h8c41HhsFqi9JNtEEwbc1HHb6TYldqqibv7QvHudSkGQhpM96VSm
         Vj2Vbqnlzty31MaQSFKJ0tbx+Ne2z4PEGZkhzXxftewa0vWzOxi47B0O5QIu6GSiBhxB
         dpVQ==
X-Gm-Message-State: ABy/qLblfxwSo6Kc5yffVmQmTRgAe8cPudHMxqfj4NmL6R+9kPN8IYti
	rX2/2SPEUlD183QT873u6ffXtA==
X-Google-Smtp-Source: APBJJlHM56jl+RXg0QnhlAvXgWKnfJquOVPifN3XCGThqumelXHC+MBthB7m2Q0oAw01PuuCFUBsbQ==
X-Received: by 2002:a1c:7903:0:b0:3fb:b008:1ff6 with SMTP id l3-20020a1c7903000000b003fbb0081ff6mr748287wme.0.1690357987512;
        Wed, 26 Jul 2023 00:53:07 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:07 -0700 (PDT)
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
Subject: [PATCH v4 03/11] mtd: spi-nor: spansion: prepare octal dtr methods for multi chip support
Date: Wed, 26 Jul 2023 10:52:49 +0300
Message-Id: <20230726075257.12985-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3820; i=tudor.ambarus@linaro.org; h=from:subject; bh=xpyv1UNUOm+7WUBWb0Vl59R+HvbIVKf4klrF0ttDcrA=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDYcL1Tyl84sNIYkyBfq2rFtCaH7yjWfYS7u dc1OqqEJMiJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ2AAKCRBLVU9HpY0U 6QMLCACDjtW+TDGGiTS92Jsl6Uk3LbCGtuLZY2zAlHX4QCj3TU4Qt6wzONyOAiZ13yx3a0BiKX7 bgPVNwx70THRRo9pXuw/jM30cQKvhv7fDqDCJt7YrVCW/5deEjgZbw/rAHognAO5JWebQbnz1/y ZNmKBYivfOSoi8ABV84JjXxQQ3XgQlilQLim+XpAw5NNJHoDxgylv19QSaKrddaTak0BOuOd8x9 KVzhxIvba2pr7FPhqUeCN18YfDMkZ58r5pbVjo15JzcrfaDe5Kj1qXt9jqoXg0JgKAGuCGA0v9S qPPsLiTAWlOsSVM3AVgqzxmtDwDnmwT3TXXkUCNcpk/EQuPd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005308_993335_F7B10785 
X-CRM114-Status: GOOD (  12.56  )
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
