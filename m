Return-Path: <SRS0=Yjms=OI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C93C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Sep 2021 07:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA7DF60238
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Sep 2021 07:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA7DF60238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BEJ0PV33+w6CUX3qtlkysUt+7sydYUCjMxb06kwKrN4=; b=CZARMELS1lKxD1
	NWhNcuZG5mHJWAWB8iIPO4M9SAJVUDrr3slKexCQdxjdne9aPAVBryu9wnZywujKqBtrm8B5YaXAP
	oQK/6K3DV0SXUPqI3xpEJeL4xHLNGBHUhyVxjmMZT7egj5ql9yTN3nGJEqMoU3SkQizjU+7aTfrNr
	X0qtF10J+/3M8ndgEjnfjIDfJk6m6Jng+aiyjldD1EmaDDh1KpuVIxJcp/hN6yzVNJI2/s1pS5tWA
	O4G4/K4O4ML4pfbyKiDGFu5YBUbQ1QcYS5bH2a1arb/IO6ipIt3jBnBftjnxTb4xpGu4lApZCA/mJ
	EhDu0VedahebZ7QskhZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRUgp-00FXEn-9U; Sat, 18 Sep 2021 07:23:11 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRUgj-00FXE0-Pm
 for linux-mtd@lists.infradead.org; Sat, 18 Sep 2021 07:23:07 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so9014610pji.2
 for <linux-mtd@lists.infradead.org>; Sat, 18 Sep 2021 00:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3/DBi7RwM1M3KB0MW8LaNgi4t6NDHut6TlL12sSGe3I=;
 b=ee4W6IXi42isoeIZ0wephrXbvBx4HHDA254kQiLwvCc6GiGEzIIV5369o3RPPk5p9z
 wwn/pFJ7gXHA7JDHoULYnmmBTWeS7t6qekNjjx5bSmoujWlpXvsGpDLVaxups4Gigetw
 p7AgFhLyHig56IQMPpXtTsJ5VtzdgZIdOOnDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3/DBi7RwM1M3KB0MW8LaNgi4t6NDHut6TlL12sSGe3I=;
 b=r5m+BllYoIqXIbM0Puct3nMR+QuiEnrad+iWnrsYHog5Iza9A2e+FytpMGfmGoxE9T
 SXHiRXfDe8yKyRZJrMUlS7eICQruyGF68goO5yevGNiHGublq0TgXwBz3EJ/i92eGDdo
 n8FUcfnOxY+RjS1Z7bQ/Lcrh2tSWKpQYCLONsevXI0jPbwqP7kMh0r+8RQFIOEj2ztiT
 73yEiIPxjah778C4khu7zlmI1PYkSRZ6/PbfWUmwg32MTyY8hLh1ao898cQHWpgRDPXx
 9m/XwIL+8FmfAmfqnI6HaPZXaAbrkhYBhII+c1jsammsXlVmxrNCnxbHqbhXffbRezX5
 dCxA==
X-Gm-Message-State: AOAM530W3vgqdT7KAk/1f7zgOC5juqC3ftZtezLyneu6sIfki5rGDdVJ
 lYjMR4xVRfIuJN4rxG2BVNVUcst9tOBmaA==
X-Google-Smtp-Source: ABdhPJxYHdiYIx+50COYvEYU/ZRBpmNm7i5m7K/Gj8ydbBTNU4S0LYI1x8J2scs4T700kMM1ysSJ1g==
X-Received: by 2002:a17:902:7103:b0:13d:9a6f:d158 with SMTP id
 a3-20020a170902710300b0013d9a6fd158mr2562644pll.49.1631949783096; 
 Sat, 18 Sep 2021 00:23:03 -0700 (PDT)
Received: from shiro.work (p864106-ipngn200510sizuokaden.shizuoka.ocn.ne.jp.
 [180.9.58.106])
 by smtp.googlemail.com with ESMTPSA id b7sm8746411pgs.64.2021.09.18.00.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 00:23:02 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@microchip.com
Cc: michael@walle.cc, p.yadav@ti.com, linux-kernel@vger.kernel.org,
 Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] mtd: spi-nor: Add support for ZB25VQ128
Date: Sat, 18 Sep 2021 16:22:56 +0900
Message-Id: <20210918072256.3505379-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_002305_987385_3938E9FF 
X-CRM114-Status: GOOD (  15.50  )
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

Add support for the ZBIT ZB25VQ128 128MBit SPI NOR
flash.

Link: http://www.cipatelje.eu/pdf/ZB25VQ128.pdf
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 drivers/mtd/spi-nor/zbit.c   | 21 +++++++++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/zbit.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 6b904e439372..a6f3646824cb 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -17,6 +17,7 @@ spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
 spi-nor-objs			+= xilinx.o
 spi-nor-objs			+= xmc.o
+spi-nor-objs			+= zbit.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index cc08bd707378..75f6ac9485b9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1846,6 +1846,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_winbond,
 	&spi_nor_xilinx,
 	&spi_nor_xmc,
+	&spi_nor_zbit,
 };
 
 static const struct flash_info *
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3348e1dd1445..ad3b34a3b80f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -489,6 +489,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
 extern const struct spi_nor_manufacturer spi_nor_winbond;
 extern const struct spi_nor_manufacturer spi_nor_xilinx;
 extern const struct spi_nor_manufacturer spi_nor_xmc;
+extern const struct spi_nor_manufacturer spi_nor_zbit;
 
 extern const struct attribute_group *spi_nor_sysfs_groups[];
 
diff --git a/drivers/mtd/spi-nor/zbit.c b/drivers/mtd/spi-nor/zbit.c
new file mode 100644
index 000000000000..d240dd65d249
--- /dev/null
+++ b/drivers/mtd/spi-nor/zbit.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021, Daniel Palmer<daniel@thingy.jp>
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info zbit_parts[] = {
+	/* zbit */
+	{ "zb25vq128", INFO(0x5e4018, 0, 64 * 1024, 256,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+};
+
+const struct spi_nor_manufacturer spi_nor_zbit = {
+	.name = "zbit",
+	.parts = zbit_parts,
+	.nparts = ARRAY_SIZE(zbit_parts),
+};
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
