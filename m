Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D589EC46467
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jan 2023 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTrlsexUGtwhwXct27j1I+AVzSkQnZexzyxF9RKT2iE=; b=MyPD88Gh9+6seQ
	2IfPJ5gq0bBE129S12XfU357ltSEclk6Fq9xFGi7DUWSwMGw5Q6/grO7jvTZL+EZTpUFLWWF7cvW+
	JIVntB8KYVSwnrZxBbS+DbnWq2kA6DClyunohdyzkgRBQ6Hsk1Oi9V4Xi2kmCV1r/2n4DurgHtdtS
	MrHNqXghv3BoDdWWl+Ew0m7o4GIv2rk/xINZ7K21hSY2cAcJQgAzKmkPPeYmafYgM2nT9vKIX8U5L
	q5AXhCzFK5o2cdCr/O1ij0r4slvzlZdBp/ZnQ/le/WMBF1PQYLSsY02LP0Nyjwi10NtqvjCIBByrz
	RLMhCX3YVo2BIvBe0k/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHmQ-007qva-3P; Tue, 10 Jan 2023 16:47:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHmL-007qth-Q5
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2023 16:47:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id gh17so30290710ejb.6
        for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2023 08:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/gml9YuYojLi0tXjDxc9mcLHmpR9aZatT7sYZDpMKs=;
        b=nQ65bdQp+8ZrGW9rUMJ6bH8T5AAA/taUXKIDxUTq+r53I1vtnbW2BtrdhMHizOKoNc
         i0WNUlvc4EbSjj7lhPnM/8PdvPOruuzG5JkWJ4ys+fT7kPpAsojcyEgrFQTWVKtRoU8V
         D3QZx7rFtmYGIhrVCMMKwb3VxT5XQ7ZJe/Y4hJX2ajdJWXR4aAqsa9O8WtF8kCXucw1l
         qgkjtgA54RFbRzO5rRmaR0XN9aMAoN2Gy9F/9YPW8VrvQaq+bEHh9zcSQBVKTz8VsSgx
         vekuFCyJp2JbuD+r2CiXon/3GzlcQKh1V1+23iFeItbpZSTDuZwv4Le26iKeam03ys6O
         KuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/gml9YuYojLi0tXjDxc9mcLHmpR9aZatT7sYZDpMKs=;
        b=pFPA9UngOFBALCRhrPCmgEeKldqaMjFmgXQuLtNGD0t6cqGwaGps1Fv1XyYmqVrxl1
         7kotMmhBJgFQhmhTGRiZbK6/fkSD50+6mOJrkBnKhKVFtlDHoVIFJC9Mao8IS6GbnzXL
         67UhXxw4lzfPONdpj/Fz6MigHBgPGXXjgP/EiBDkYWH4GP/wnKYBsMqnL5EeHUr5AM/D
         4pAxtRP4QHG5Ts0fZMxQXDOTA0iKJagIV2cGt6DZl+MsHcWFA7zQbc5DmbKrRe6v5bZg
         +FPViUUhHk0WLrMXazlxE5TNELlTg5MeP/kWQN7K9U8mYufe6pMX7xuxWFBIenSfaXS1
         bq5A==
X-Gm-Message-State: AFqh2krOepDhGFKq5G/ozs0bsU+KP5f3k5KEyqC/0frBVrspSKN9hRyc
	o8OR2eTPvbTmvqrzmmzb/FHHkA==
X-Google-Smtp-Source: AMrXdXs41RmTz5Joknhp37N/3cYL0/qUxQ1+ENsMBegj69fGcmKigWNrVKWrZVO6kHXX2jrWoHT25g==
X-Received: by 2002:a17:907:7e83:b0:7c0:e6d8:7770 with SMTP id qb3-20020a1709077e8300b007c0e6d87770mr70978788ejc.74.1673369228588;
        Tue, 10 Jan 2023 08:47:08 -0800 (PST)
Received: from 1.. ([79.115.63.215])
        by smtp.gmail.com with ESMTPSA id lb11-20020a170907784b00b007b935641971sm5053699ejc.5.2023.01.10.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 08:47:08 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Takahiro.Kuwano@infineon.com,
	tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Bacem.Daassi@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 2/2] mtd: spi-nor: spansion: Make CFRx reg fields generic
Date: Tue, 10 Jan 2023 18:47:03 +0200
Message-Id: <20230110164703.83413-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110164703.83413-1-tudor.ambarus@linaro.org>
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
 <20230110164703.83413-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3889; h=from:subject; bh=Xt9i7ElRBqmNiebPb+J23V4jKJu8xp4KPGSnus8TC1s=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBjvZaGfL7tGEnUoevuleMmomGLI6dprD7w/d85sIC8 6FY2SF6JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCY72WhgAKCRBLVU9HpY0U6ZsaB/ 41EGBD2IlZpVyl7Oi0kSFLz+NoG34feZSzp3uVfWlxjb98xqOY8XbBTtwB/T/KTh5jkNSSr0C1zi4h GwKMi2Y34r1Eu0q2+n4K/I3O137f06zKyoyWG/SlLclSZqLUu2JvxokS8TS7S0qj2PSzRsU0+iSw3K JObkGzpcYUZ6ztaVBl2S/fh73Z9bH7cuvDZHBi0Q7p/ZnfANxfby027Y49XvlmE74HNRmYlSZ5Yriz H1VlEcSfSelyBZb27UvvqTL8mf8SjB+zqvC/pChPlQzcQCYDlFIoSCOrGE12ETmlD4JC/T17oR6XSw G/Hi2yqcuNyxQdI2IemGz6HERDnHpQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_084713_862224_3F6BC329 
X-CRM114-Status: GOOD (  16.47  )
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

Cypress defines two flavors of configuration registers, volatile and
non volatile, and both use the same bit fields. Rename the bitfields in
the configuration registers so that they can be used for both flavors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 07fe0f6fdfe3..12a256c0ef4c 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -15,19 +15,19 @@
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
 #define SPINOR_REG_CYPRESS_CFR1V		0x00800002
-#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
+#define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
-#define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
+#define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
-#define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4) /* Page size. */
+#define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
 #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
 #define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
 #define SPINOR_REG_CYPRESS_CFR5_DDR		BIT(1)
 #define SPINOR_REG_CYPRESS_CFR5_OPI		BIT(0)
-#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN				\
+#define SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN				\
 	(SPINOR_REG_CYPRESS_CFR5_BIT6 |	SPINOR_REG_CYPRESS_CFR5_DDR |	\
 	 SPINOR_REG_CYPRESS_CFR5_OPI)
-#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
+#define SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
 /* Cypress SPI NOR flash operations. */
@@ -57,7 +57,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 
 	/* Use 24 dummy cycles for memory array reads. */
-	*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
+	*buf = SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24;
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
 					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
@@ -69,7 +69,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	nor->read_dummy = 24;
 
 	/* Set the octal and DTR enable bits. */
-	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
+	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
 					  SPINOR_REG_CYPRESS_CFR5V, 1, buf);
@@ -103,7 +103,7 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	 * in 8D-8D-8D mode. Since there is no register at the next location,
 	 * just initialize the value to 0 and let the transaction go on.
 	 */
-	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
+	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
 	buf[1] = 0;
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
@@ -155,11 +155,11 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1_QUAD_EN)
 		return 0;
 
 	/* Update the Quad Enable bit. */
-	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1_QUAD_EN;
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
 					  SPINOR_REG_CYPRESS_CFR1V, 1,
@@ -210,7 +210,7 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ)
 		nor->params->page_size = 512;
 	else
 		nor->params->page_size = 256;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
