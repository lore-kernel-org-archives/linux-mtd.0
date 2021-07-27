Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF83C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:01:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B7B960560
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B7B960560
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgVNxDQKQYPq7Ys/w9/dlT3fGzFxOiALsfZx8U4WhRs=; b=D6IqSSDqa0TEl3
	qqryz6l6gWKnjoW88/vFWmhgGgxziPnDN1iQZtPAkoulqL3Tj9AUwnozey9JHPlQ5W4ui4vGT6uxQ
	+AL5ylcXJ4VZ8eek0W8/yVuJQZyscoTsHXZzSnrZevUcSlISnVz2ZbwPI8pf1HlU2/UQ98cYQY7gV
	KnIIi2NzCQinZih1MwSmOmwj761f48ItfhS/lMBq7wB82trnUQWD3nS1ltIysl2cCQurYPwC7MeXl
	6/ns4oGV14XxWHK2uX89Z7Ya6Fnv/HVoszTOAIUidp1DyFizLX+sX41+kiRmb3Hz4pXQztCUy5qaw
	fZsS6qwXqvddBrS+jMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FCT-00DJsu-SH; Tue, 27 Jul 2021 05:00:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5O-00DHTL-Uq; Tue, 27 Jul 2021 04:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361579; x=1658897579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6QTTN/6Jydl0xQPcXkV159/XnVcFV2lCZN44ktflG2U=;
 b=yEvAbTrpuV0Ab7OJR7NwjaT5B2r3DkBEWYzXEGfmdI4QqfsNVQIb35No
 pRQJdHLdHK9ZUMxAPgybvQTxbmpAAnliTDf8WQ4LHe88GX8EQ79ntA82K
 m3tM/oi0wFj+mQdLm/1kRf4dt9WWcGJr+yhxOYi6QB01T9SlCFaVSNz2m
 k4ZgoKyMclD/vdlvclaBa1KhfqS9f2szkadGYOBY7WeaTxzsV7kjO7DJk
 hNWNi797XnYFd62Ro2mzz4FyD+6J0VMelEhSapofhxL2Cpok83MJ1MQbH
 JGp5XAvS9aFwgh3qYhOwpvrZ61IzCZ3qqGaS4otd460BuTmzLH17gIYN5 g==;
IronPort-SDR: xNs4oVHSNsLSfLRy7sboayzgHESIxpLZywrjEk0pbPLPW8djJtOT8w8Uzvpr/IpzMw6oc7cPUY
 LlG06+erT5Q/pQxAx9Xs4C+kU14OPiA2O7JztKG1tCrcieLNSW95Su5T7zn7aN4l3OZed9K2iQ
 OatYLH9Fiuukk4uKIewGLhcmLMQYk3+wKFI2Qf7lRlbuzmDoDxhka8aMvL5eeCJ5gaI9wAd16n
 2VZmtLFmVAh3r4gKK+gj9XfOs6AparjwN2xvC/5gmO+juOYvlPAxWHVSOQH4D0+SewTNz4qctr
 W/cC9du9tWPzihVaFVA+KPpW
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="126054953"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:52:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:52:55 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:52:50 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 05/35] mtd: spi-nor: Introduce Manufacturer ID collisions
 driver
Date: Tue, 27 Jul 2021 07:51:52 +0300
Message-ID: <20210727045222.905056-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215259_131336_5A6D863C 
X-CRM114-Status: GOOD (  18.51  )
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

Some manufacturers completely ignore the manufacturer's identification code
standard (JEP106) and do not define the manufacturer ID continuation
scheme. This will result in manufacturer ID collisions.

An an example, JEP106BA requires Boya that it's manufacturer ID to be
preceded by 8 continuation codes. Boya's identification code must be:
0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x68. But Boya ignores the
continuation scheme and its ID collides with the manufacturer defined in
bank one: Convex Computer.

Introduce the manuf-id-collisions driver in order to address ID collisions
between manufacturers. flash_info entries will be added in a first come,
first served manner. Differentiation between flashes will be done at
runtime if possible. Where runtime differentiation is not possible, new
compatibles will be introduced, but this will be done as a last resort.
Every new flash addition that define the SFDP tables, should dump its SFDP
tables in the patch's comment section below the --- line, so that we can
reference it in case of collisions.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/Makefile              |  1 +
 drivers/mtd/spi-nor/core.c                |  1 +
 drivers/mtd/spi-nor/core.h                |  1 +
 drivers/mtd/spi-nor/manuf-id-collisions.c | 22 ++++++++++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/manuf-id-collisions.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 6b904e439372..48763d10daad 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
+spi-nor-objs			+= manuf-id-collisions.o
 spi-nor-objs			+= atmel.o
 spi-nor-objs			+= catalyst.o
 spi-nor-objs			+= eon.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1a278d33b02d..d30c8f350dc1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1829,6 +1829,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 }
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
+	&spi_nor_manuf_id_collisions,
 	&spi_nor_atmel,
 	&spi_nor_catalyst,
 	&spi_nor_eon,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 55fceb0ec894..e9896cd60695 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -476,6 +476,7 @@ struct sfdp {
 };
 
 /* Manufacturer drivers. */
+extern const struct spi_nor_manufacturer spi_nor_manuf_id_collisions;
 extern const struct spi_nor_manufacturer spi_nor_atmel;
 extern const struct spi_nor_manufacturer spi_nor_catalyst;
 extern const struct spi_nor_manufacturer spi_nor_eon;
diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
new file mode 100644
index 000000000000..bf7dba34f018
--- /dev/null
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Used to handle collisions between manufacturers, where manufacturers are
+ * ignorant enough to not implement the ID continuation scheme described in the
+ * JEP106 JEDEC standard.
+ */
+
+#include <linux/mtd/spi-nor.h>
+#include "core.h"
+
+static const struct flash_info id_collision_parts[] = {
+	/* Boya */
+	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+};
+
+const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
+	.name = "manufacturer ID collisions",
+	.parts = id_collision_parts,
+	.nparts = ARRAY_SIZE(id_collision_parts),
+};
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
