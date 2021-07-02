Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D39C11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 514C6613FB
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 514C6613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsayEBy2GcGjScnlrvibYkae3fi0+QTvUpw6v0MY8Ac=; b=XeDGizjR2lQoHq
	XGB3e6YAI3EHL3OgVE/WSUYo+Z/3Sizol45apPRDi2zLhxBJ/Hhvfm3kv5CWqQ1IugLuUT0JbESae
	BpJgrX4Ss1zLCtY777ODoENoVbR1Kr13pMag/VLrFzXNbcBoNsOeb5BbE9djVm+SE8gBnRNjxFQDf
	Huj09k4MS8o5TA8HPX9neZc99XBoCQZ+pFgACzUj/3iSUew5l0x/1Duq99DDhx0JWB4t6/gej2wna
	iMn/PJIG6oPaAT4ls9XLMtY26PottbyzZni5ry57ae24Yfnq/2LKyPj+dpfJ9GyzBsH9vPvygZgH1
	E+MmqN53lGYFnLfhaAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKNZ-003I0O-21; Fri, 02 Jul 2021 14:42:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKMP-003Hac-LY
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625236901; x=1656772901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zvI7X+DNvUyXaJMrXpd3MxDgKlPvfK4c/SJWXEjv0o0=;
 b=c0t0KRvyD13ZqU3ek9nloOy9NC525arHxJNdDpRlbKFxwM266TvrOg7e
 0L7HmWiN0BB9p0+HhbL4BQANjKGnnhjiYT0B24yShNoNOZomDB1bAcxuK
 Xs4zS/bXRRbyDUqTyz9T94mEFAef4RxT2pWhAIDQHKpgI8axqzld1kvlo
 Hb5X7Vs6IL+TDXwxHZPwr2N3Fj44fa+4fevKO4uBkS51ZGhweNrQnsvv1
 mAcU29GiQ0/vvInND2i4OKHI9X3ImSRDLnxrHKwvj73YLismkiLwcIWUj
 2MHZv4xqyX79mqA+EnnP1I/xOSBWb0ZSdASqJuJe6SKIzDgTh9G+ViFkP A==;
IronPort-SDR: s2TzoRAsMGtU0ISwBVYCm4rNAInY4fIJmW0YFx6v3xcW3wBZSQNeSJOekz7kFk2m6PZYkvVFbi
 bJdycDCgFzhjP2hV6QQaZ1qCY6s9skTXs3N8aMmTUbooUBcign4L8GGeloTv1qkomxIP0lQ+In
 2KEpmcPFvW0DFDIGKJoE2B2LSihOHTdX5RYPRohCPmQ1BQcqVNQKEe1+q3UmNlC3lvQrrc+OTC
 GOiAy9oFUtWuWSKLUmmrGhl7MtF/dc0lHL23gPdvmkVI9CaTfQEuBZWkH1g1Lbzatf2UaCo1/J
 zsE=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="60983598"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 07:41:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 07:41:39 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Jul 2021 07:41:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>
CC: <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 5/7] mtd: spi-nor: Introduce Manufacturer ID collisions driver
Date: Fri, 2 Jul 2021 17:41:08 +0300
Message-ID: <20210702144110.250481-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702144110.250481-1-tudor.ambarus@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_074141_815533_ABFAB574 
X-CRM114-Status: GOOD (  17.10  )
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
 drivers/mtd/spi-nor/manuf-id-collisions.c | 17 +++++++++++++++++
 4 files changed, 20 insertions(+)
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
index d528e28995c6..206a54c20fef 100644
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
index 000000000000..9efcba9d18a0
--- /dev/null
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
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
