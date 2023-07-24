Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBC0C001DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4ghTVz/aVnmBG1vfUkq9plP3XubMcR7LhfpXwyiuK0=; b=2HQ0IKEuPoDKC/
	ge3j0EaLfi1z+syfbhPCDNb2817aGhVnrjj3eJqBHBv3SJ+9AwzYwMUieoepa8n8l5OWnuep5CH6p
	TdlWw70lufB0UghehschA9WRZu6n9SzXi74aP9KlIbQ1X6IXVLTnwzZq2LweGRJopKJFkagtyu36Q
	H2hT/Uf1U2qbaX4z6o/W2rf1yKGQJwGZ4iI0Z95aNpBgFwN8ik3pQECwg9KrCFwtlK3DqBLJsh9Tb
	lg/+0KPvTEBhNPs3kWXsvlDkY0fPWkmGR5AZJNDiv1duSyYNWG8VIK3ZlDMcrJEJT/CJrP1LEMWhj
	G0uE1nDAzw1PSRB3mrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgl-003CMp-29;
	Mon, 24 Jul 2023 08:13:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgi-003CKO-0Z
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:05 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-992acf67388so604272766b.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186382; x=1690791182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1X6ZNWe7KmsdOhe9OS7Rrilt+XPjdCv43wNon4Ix9Y=;
        b=rZc/HThDDCTkEHUbzOlgeQs1dsskn6riY8jUBAHqsDkAKWwKfXkqZQx4G47lxpdx7m
         nd8s+AlIz76w+SDrXxRCXv+kVwwUlpK03TSZ9931P+XZ6BPgGKzg270lnDkuT3F2VN8M
         BEDYSpXlsZy65JGKsYrPenLN3m3+c9XMvPOgrtW3rD17kVQorugjFfBlOtGa9OVMpNoD
         1neGHtEcklUlVCL9R4PgODSSlW929TgmJGOnTxhBpCv6rvsrA4a7IwghzNcmHIuJWUK7
         ao2XUOlHh+3vcklnogYlcE9NnjcIt/ddtjXFnqRcVOfortXwQxysmY0L2djjhOEfjSZR
         oIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186382; x=1690791182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1X6ZNWe7KmsdOhe9OS7Rrilt+XPjdCv43wNon4Ix9Y=;
        b=POBcF2mJDQZ5vsNJo0RFNt0ozWXzW8jc57HYkQLUrYOBQbS4Kd7NpBhr4Qw8cKJk+j
         DCeBJ0UV9G6gjTjsaz68hC+zj07qWF20wCoAs+79yK4koc9ALJnvD+v+Vj0lhKZJtArb
         qjP+0jhnRV7sfnApB7v/5l9Ltc7ZQDIVehib6OogbGt+bl5WRlfDWx92ruE3NSQ6Q2xf
         uUzUYlt3jyDoEm1I5ChsZaa27zf7x4l9u/dTFWFkajGpYOGNG5AQjRxcksX5cO80wYyK
         x1iRO7mZnv3asLPsihAzZqKbt85jdQrlGgjLbpCbYEyIXBr/3OCCzqcZqkUUJLqkCig7
         psig==
X-Gm-Message-State: ABy/qLaR9VqivFYQG5Ans6FwWknrEy+Rs7Z3l1OgIMMrpcOM1ySIRQe0
	SiuxR6iI/MFwiyCmPNdlqTI1nQ==
X-Google-Smtp-Source: APBJJlHqJYCfSz/MTO7jJORcnGXPH40baCU805RSFxNYKz8+bECTv8+o6uOBhHnLOAXFrmUL73OfwA==
X-Received: by 2002:a17:906:3f1e:b0:992:4d30:dc4a with SMTP id c30-20020a1709063f1e00b009924d30dc4amr8639057ejj.74.1690186381836;
        Mon, 24 Jul 2023 01:13:01 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:13:00 -0700 (PDT)
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
Subject: [RESEND PATCH v3 04/11] mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
Date: Mon, 24 Jul 2023 11:12:40 +0300
Message-Id: <20230724081247.4779-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594; i=tudor.ambarus@linaro.org; h=from:subject; bh=kgTcomoQU7JsYNjD2ojxcF6vrGgWFcnW4j+zTTO9fWg=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ+F1McRGWHDR/dosXymqrH8LFtXFXqWHGWg YCEuhu05uqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfgAKCRBLVU9HpY0U 6THrB/9hGcQ+dUFmN1EHMfc9PNt80BWHmBTNhdkusNicxLfEwfliKYVTpYiOuZlHUzBmLCAkCff xIqfJb9TryAKIA+tr1YQjaVCRdlHoB+rqDf1R0mpU5vEN5VI/jtjgV9gr62Di1m9D/AdsY/0HhG OsNOIVhYQSHXQ1R2IehWb9T7ntb5CJmPDNP/PezvC1U9bBqneaSgYfBuJsjFjV7SMdrbChMghSl RbtbnsvYdVjE1we9rdOwglgQM1Ia1Zx6hT8nn3T0ssebFiQei6ILrueLwV+xN8EOCOEMN0JpMbl e2bH9KS+8auJq/Yh5hBMp42eaNMy8XmxTgiSLn9/guMiar1S
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011304_212645_EEB85DF8 
X-CRM114-Status: GOOD (  12.94  )
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

All the Infineon flashes that currently support octal DTR mode
define the optional SCCR SFDP table, thus all retrieve vreg_offset.
Switch all the available octal DTR Infineon flashes to use the
volatile register offset to set the configuration registers. The goal
is to have a single pair of methods for both single/multi-chip package
devices.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 51eabddf2b16..dc4841891b74 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/mtd/spi-nor.h>
 
 #include "core.h"
@@ -202,14 +203,18 @@ static int cypress_nor_set_octal_dtr_bits(struct spi_nor *nor, u64 addr)
 
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
+	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
+	u64 addr;
 	int ret;
 
-	ret = cypress_nor_set_memlat(nor, SPINOR_REG_CYPRESS_CFR2V);
+	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR2;
+	ret = cypress_nor_set_memlat(nor, addr);
 	if (ret)
 		return ret;
 
-	ret = cypress_nor_set_octal_dtr_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
+	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
+	ret = cypress_nor_set_octal_dtr_bits(nor, addr);
 	if (ret)
 		return ret;
 
@@ -247,9 +252,11 @@ static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 {
 	u8 *buf = nor->bouncebuf;
+	u64 addr;
 	int ret;
 
-	ret = cypress_nor_set_single_spi_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
+	addr = nor->params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
+	ret = cypress_nor_set_single_spi_bits(nor, addr);
 	if (ret)
 		return ret;
 
@@ -714,7 +721,15 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 
 static int s28hx_t_late_init(struct spi_nor *nor)
 {
-	nor->params->set_octal_dtr = cypress_nor_set_octal_dtr;
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	if (!params->n_dice || !params->vreg_offset) {
+		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
+			__func__);
+		return -EOPNOTSUPP;
+	}
+
+	params->set_octal_dtr = cypress_nor_set_octal_dtr;
 	cypress_nor_ecc_init(nor);
 
 	return 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
