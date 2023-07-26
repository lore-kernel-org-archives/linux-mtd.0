Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426BCC00528
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gK64TjPUYn/qSbAcSil1G+vANSoE6cMDOpy8x5L6ViQ=; b=gMj7dHH3n/YVDR
	j2Y3sM60Db2Mvfu5lpiEHMF0BLklTrN/Rzuvd6KiqqrP9pxX8VOFF3wmu2DmOI41j4Yqhe3/zuqNQ
	dS5wxboMvOvziqVId3TfRB88cFny63Lvznn6dmiozmO08141YQV1Xnm/gplnOkwaNda0hFo9SE979
	eSuXWS+oBtUX5iu+63EQ9NcgoLCpw+ZdgtqvVDNdivMEGc6VntNJRpB/JQCBtSrW9lbfn7r5ssANF
	t9COesWREHguhQ+ggGGIVQIkBuFilFRjH7L1yGvP6UbKZ0ioCVARbp57TRbL0wqSmsTGq+mvxnZuu
	Zg4CyFNwWVO5MfzvM2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKe-009Uzu-30;
	Wed, 26 Jul 2023 07:53:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKY-009Uwj-0B
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so63699385e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357989; x=1690962789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cGdD2J+WB7rZO93rB0npNuDiQt+dhyl4APRgSC+jsQ=;
        b=V9vS3c9DTJ5zX8a//yweUAkpqwOBX606yqRDKs+llohTHJJn1s/pyk9BjHaPbcb1zo
         oSSxK5vwhUrCgsVtNAVCKUN+66uO1hTf4yn0dRnul9FtbD4sJakxoSFbPyNHT+G3H0/C
         QiGnYKWXl+HyepMhL9er2IlUMaRKGx7Q4C+SjDJWFDI6WjyGSjagAUbJZMPBzlLAvbBE
         8yZ3Vntspl0uxI9sSifrzAaeelIi9gZMkcccEUktc6izd4Gm9WS6I7JeDuiPSaJ0Tifc
         CLfBXpSPoN9ZWj1ZqnDu3qvZtsHJqRRxXSvBh8hgXdy9J1mWwUVcuCq6siAQlDXBi4Ww
         v5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357989; x=1690962789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cGdD2J+WB7rZO93rB0npNuDiQt+dhyl4APRgSC+jsQ=;
        b=MCJ7sjgk7zIi/ftKdSsRPydKT9BhO/F0b1wVfadqTlY9uW/3VT+/uj+UK3gAj046bd
         5FUUy8sV77/vhJMWGOKuGVSA3J1ce4oqCsTDCCvZgz7OgXzljiG7SPOS/DAUNHKH345V
         lfziabj9wwVl8gyi/lc3l0Cr67lpge4e4nOoV+0uTeQrbevTOJgl2zUGcPT0Iu/aX5oE
         777gzP6kBhDTBJu21lL2dCHfQofkVQt7HELLxUM6jMtVmur4cYZ/zR3Ntl78FIUdqpg5
         UTgkbJe9OcoHToPINFNDVvxaos21JeLh5q/++XxF31k7WVTTs+OWuXl9ZPFB4oqZEaSQ
         E75w==
X-Gm-Message-State: ABy/qLZ1t7ORdVUWmKcIqTZJLMZEyVLOyNyC5DtR34UaXZVQxI2A75Q/
	k6+vHUpzNb5MYNQxy5AQjRTm5A==
X-Google-Smtp-Source: APBJJlGTaOx/Va0WfosYrUackkgfEAuLx2m6K4nuU7C0geavNrJii9dWjNVsw2A0pDPqeQEWEH+Ezg==
X-Received: by 2002:a05:600c:2249:b0:3fd:242d:ee5b with SMTP id a9-20020a05600c224900b003fd242dee5bmr768072wmm.33.1690357988893;
        Wed, 26 Jul 2023 00:53:08 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:08 -0700 (PDT)
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
Subject: [PATCH v4 04/11] mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
Date: Wed, 26 Jul 2023 10:52:50 +0300
Message-Id: <20230726075257.12985-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3009; i=tudor.ambarus@linaro.org; h=from:subject; bh=mCXnzZObQc2zhfJufj3cA5z2xujPAjIEucaG9JmkqZU=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDYDwwoqDn25kns6GQbu0V+TxM1w1CZcl4Rj xe+vM3yTYuJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ2AAKCRBLVU9HpY0U 6fVSB/0X+AC60NMt+0iVr9T0QiN63zOwAHa4aMnsmWYJfYuZXMlZjXotN+TvdgZV2x1/iRkEKz0 Z9OitjSmE1sl625kHEt9REkbAJSLlVPlGD9QYiOkcgzAhu6pECnXZmpQ3K7+tlvC8GUPMuKwGqj uNA/4iLiFJ8WxXy+BbTW9GU/ts8E5LM7ZuGYDRzRvMch669wzq/3lM0fKVvDWPK1EGPy3fYw4IU 5bUvLljF86BYpxhjmWFvPyvLFMxjXe4/oNjD4oizCummI26MAtv1ZxaKxj7KXP3rZZp0rXxgO2d gUNWRYOdwBBaymo8K2wg0pe7L7Dsj7nffpxf5g3wgDgepeVB
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005310_105915_01D13034 
X-CRM114-Status: GOOD (  14.47  )
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
 drivers/mtd/spi-nor/spansion.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 51eabddf2b16..94d98b5b0ff1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/mtd/spi-nor.h>
 
 #include "core.h"
@@ -37,8 +38,6 @@
 	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR3)
 #define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
 #define SPINOR_REG_CYPRESS_CFR5			0x6
-#define SPINOR_REG_CYPRESS_CFR5V					\
-	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR5)
 #define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
 #define SPINOR_REG_CYPRESS_CFR5_DDR		BIT(1)
 #define SPINOR_REG_CYPRESS_CFR5_OPI		BIT(0)
@@ -202,14 +201,18 @@ static int cypress_nor_set_octal_dtr_bits(struct spi_nor *nor, u64 addr)
 
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
 
@@ -247,9 +250,11 @@ static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
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
 
@@ -714,7 +719,15 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 
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
