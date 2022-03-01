Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4344AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 06:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6LZU4E/PDJ+bimOY/Ba4A3KpFJ1S+hM9gZDPHA9/6A=; b=IRkKs4PPPbZ7ZA
	SQYhvYzi05UwwV6EBWwHNvGKIQG0nb9rp4WmB0GUTjUQOS27pB9HWYxgbKV0C6ytNLcQuK9pFDF0I
	vS1LjLGcfYe+rNp/ydCTqNfvvX4L3WEvEjSqJogAqJj4CLaS/t53fT19h2PGGdN9AIojmijG4qMyP
	ea6jC1xcHRFNHJUbu4nrTz/QdPln8OGb/yP67cn6Qb3oItgjyIxbrbQVHP1ei/UFVay/u9RaCWH65
	KgNlCRjhmOlqSmW6OjnaINy3XJoAaUSnb3zGuFSjJLY2yFUj0hc2bf26v4qA4AsMlz6p54Q4M0aVu
	/uai9VPgUSikmgM0mmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOwIs-00FCFr-4u; Tue, 01 Mar 2022 06:48:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOwIo-00FCEO-Tf
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 06:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646117286; x=1677653286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gGq98DPhvXiYNuMD69nm/wiwfQmDcTai422+Q4afq7Q=;
 b=NFtZQYvZgwRcik8ta0q5pCYsgDz6HNf3yD4+KKfpvO7Va8SFNpw/7v9s
 6Gu3L7OocesPPOlLUq/XhTYmV6G0ZZPAIVRd3zYJGizLeD3v7mnGfQqVT
 dILVhh2tA5VOTPIZK7BvkrZEMX85vpeMC4WxH6vOAjfNVhwfwGlFmMJ0a
 N/Ka8ieQNFGqaOjHZ61KNzLnPuR/aJB+afPwDjVeQTH69In4euIRJ1TaM
 o+gv9DdAp9wzAP6tkUMVUi7/gouazMOk0mtWjvcIROeu2Ob3HaiGVdhgn
 f0xxHIHEL+lwIvf7Qt3ijorc7CJ8aQ6UVfwGFnSYRV3Ao/SC6Lbi3Q0GE w==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; d="scan'208";a="87343387"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 23:48:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 23:48:03 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 23:48:01 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2] mtd: spi-nor: Move XMC to manufacturer ID collisions driver
Date: Tue, 1 Mar 2022 08:47:58 +0200
Message-ID: <20220301064758.294943-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fead645197b0cb6534c04a665938a8d5@walle.cc>
References: <fead645197b0cb6534c04a665938a8d5@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_224807_098165_B24AFB5D 
X-CRM114-Status: GOOD (  15.05  )
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

XMC manufacturer ID is defined in bank 10 of JEP106 standard. The XMC
flashes that are currently supported do not define the continuation codes
and will collide with flashes using the same manufacturer IDs,
STMicroelectronics being an example (defined in bank one without
continuation codes). Move XMC to manufacturer ID collisions driver as it
doesn't respect the JEP106 standard and collides with other manufacturers.

Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2:
- drop xmc from makefile
- order flash_info entries in alphabetical order in manuf-id-collisions
driver

 drivers/mtd/spi-nor/Makefile              |  1 -
 drivers/mtd/spi-nor/core.c                |  1 -
 drivers/mtd/spi-nor/core.h                |  1 -
 drivers/mtd/spi-nor/manuf-id-collisions.c |  8 ++++++++
 drivers/mtd/spi-nor/xmc.c                 | 25 -----------------------
 5 files changed, 8 insertions(+), 28 deletions(-)
 delete mode 100644 drivers/mtd/spi-nor/xmc.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 48763d10daad..3f2b431f9851 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -17,7 +17,6 @@ spi-nor-objs			+= spansion.o
 spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
 spi-nor-objs			+= xilinx.o
-spi-nor-objs			+= xmc.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 80d6ce41122a..e2b388d12c6c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1627,7 +1627,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_sst,
 	&spi_nor_winbond,
 	&spi_nor_xilinx,
-	&spi_nor_xmc,
 };
 
 static const struct flash_info *
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f727e632c0ee..db042c40853f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -517,7 +517,6 @@ extern const struct spi_nor_manufacturer spi_nor_spansion;
 extern const struct spi_nor_manufacturer spi_nor_sst;
 extern const struct spi_nor_manufacturer spi_nor_winbond;
 extern const struct spi_nor_manufacturer spi_nor_xilinx;
-extern const struct spi_nor_manufacturer spi_nor_xmc;
 
 extern const struct attribute_group *spi_nor_sysfs_groups[];
 
diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
index 0447e245f4b1..bcb80b779534 100644
--- a/drivers/mtd/spi-nor/manuf-id-collisions.c
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -34,6 +34,14 @@ static const struct flash_info id_collision_parts[] = {
 			      SPI_NOR_QUAD_READ)
 		.fixups = &boya_nor_fixups },
 
+	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
+	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+
 	/* XTX (XTX Technology Limited) */
 	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256)
 		PARSE_SFDP
diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
deleted file mode 100644
index 051411e86339..000000000000
--- a/drivers/mtd/spi-nor/xmc.c
+++ /dev/null
@@ -1,25 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2005, Intec Automation Inc.
- * Copyright (C) 2014, Freescale Semiconductor, Inc.
- */
-
-#include <linux/mtd/spi-nor.h>
-
-#include "core.h"
-
-static const struct flash_info xmc_nor_parts[] = {
-	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
-	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-};
-
-const struct spi_nor_manufacturer spi_nor_xmc = {
-	.name = "xmc",
-	.parts = xmc_nor_parts,
-	.nparts = ARRAY_SIZE(xmc_nor_parts),
-};
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
