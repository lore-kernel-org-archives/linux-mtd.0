Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD3AC001B0
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4ghTVz/aVnmBG1vfUkq9plP3XubMcR7LhfpXwyiuK0=; b=Knw5/q43gvbVHF
	zxTxtw79jVI5kYZF1yiYh4DGQode9RUDX3WPb0WqxVZg/5VuHG0ueQnXo/e/LbHgOEQrvYBJmZstz
	FVW0ZKigkmdLG9WH5lut5mlhJZMksRA6Ezjl0Ej2nciTPbt0WDuW5TUlrr2usgz1lnUGLiz9EAqI6
	U27FRp+2Qc/770sc6Jc2pWDyBMkVCtXrM6oHtAuZTB9C9P8G+sc+jVBYKkNdrQ3/IAZ1wJxDuNIHL
	pph+Z4AfXuT/4mn6aMNy+Gs4r5pmsHcj/X5FnQa+MqIaxUG9Osc7aqC3eliyzwrmxhav8oXhhvJWA
	i0nHLel9F89D2J8xUFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AG-00GAAU-0l;
	Sat, 22 Jul 2023 08:40:36 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AD-00GA8C-2I
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:40:35 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-992ca792065so426238466b.2
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015230; x=1690620030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1X6ZNWe7KmsdOhe9OS7Rrilt+XPjdCv43wNon4Ix9Y=;
        b=EIMQYIObKwY0GBNZAalolqy41q+2eqtubpHGnsRInr7E5qF+18NSCWtorN+hqFXN5x
         2VKu2WPirAWGee/S3FeplKBXZP7q3WyyKzBtslSVVQU4C61iGhJhi5GOejo3k7d6gZmX
         rOaQ5yuCs9bpi3n9xDeg0mxZoUxsPNtpmVsbqi/8IM+e5Gs0O+yv7mIiY21T6DthKxhY
         OF3AlmBPkhxPzliABOYdcq71LTFSrszeVFaHR8u7gMbXBj9CsQkAZhAWH637iUoZIvNQ
         nUGiJW76yxlZO1RbW/fdnGH18U0t1IFgWxrUgrOQlGJ13MrFjdHGZ+d43sAQoIVMCGx7
         WCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015230; x=1690620030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1X6ZNWe7KmsdOhe9OS7Rrilt+XPjdCv43wNon4Ix9Y=;
        b=PJW7fb9R67Ogp0ZFosq2M4DdrGmYuynbtEfDV4Fds2ElDLlxuhE3sA3ShdjKF82kgT
         wp3RGcLGBzCZsKvBC+TVtP+PobizFSf+kIvIHElIhMKEjcwmGvcaWDzXTb/0joCFgujy
         8dawLTbUXjOhTJnay77c7zmQkA/fJiSlYbrHLRG8waQ4bLDir3hs4jf1MqZ38kBh1MrV
         CcoI4G7QnFmwpdY70NTsawMOfizPRO0eiD1d1IImdMIHuv80E25Ng682KHAiVVKK/IKj
         5NJ5oSMHe8pBv0ZZCfRjbrI3GSnaqW5VD30e0XY5cCtGC+uoql/Ta0tIw3Rqog654eSq
         ichQ==
X-Gm-Message-State: ABy/qLZkOq0idf3kvAwf2TN1A0njdATyZtijgduvwuUyHrno/7EY50wj
	rR/8eO195V8ctgC9FCSKmrJCYw==
X-Google-Smtp-Source: APBJJlHCiopkNxKqMwMDiRqhP8c9uSaFW7KOAtBbGUrP2sKS88kXyUABO2nCk3jNnInzG1rKDlUUuQ==
X-Received: by 2002:a17:907:7810:b0:993:f2b4:13c9 with SMTP id la16-20020a170907781000b00993f2b413c9mr4241609ejc.21.1690015230164;
        Sat, 22 Jul 2023 01:40:30 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3253861ejb.84.2023.07.22.01.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:40:27 -0700 (PDT)
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
Subject: [PATCH v3 04/11] mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
Date: Sat, 22 Jul 2023 11:39:59 +0300
Message-Id: <20230722084004.21857-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722084004.21857-1-tudor.ambarus@linaro.org>
References: <20230722084004.21857-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594; i=tudor.ambarus@linaro.org; h=from:subject; bh=kgTcomoQU7JsYNjD2ojxcF6vrGgWFcnW4j+zTTO9fWg=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5XjF1McRGWHDR/dosXymqrH8LFtXFXqWHGWg YCEuhu05uqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuV4wAKCRBLVU9HpY0U 6UOcCACA2ZOT2/g+dowXl3TLgT0pmmXmkYCVEJhtKOyH2rCDeA75Grg2Pa/3mQZWGN7T4BzwdyV Q+s9npTWqnT2GySbRnpCz1piLVKUGrZyxT7tE04vmxms7xT2YBuEvX8jqDWHPQ1OFE3O6KowXKD rfQCyBRGV1QnKowFzUI3w3/qWX09vGpaVimY5PYnrHyoXbv/RxSVinWYr5oldv1c67/ScMYxeHm vxb2t1IEW+kITttD+37+8qTYKtWVjV0bLLP1m54p4IIWC5CPANIYEpZuIUOFCvwRkg9lDzYOQ7V AN6yuKyC8CM95FFgqq/gTG+fzT7a/LWOHRx0ivS9/+yrHFDT
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_014033_745329_EB0128E8 
X-CRM114-Status: GOOD (  12.31  )
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
