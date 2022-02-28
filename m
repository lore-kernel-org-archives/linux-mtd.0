Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF71CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tH2D7p73oHA82PQIQ1SSqzNLJvqC4yCtCHwSrKLRmc8=; b=jKSuyN4c42uT/j
	DWtmahjf/R+EkhHE2Kk4GZ1SxrIUcDxdf8CqvJRHFvHBTiF53w7UmJoctSBeSXnEqGN9ynL2yeXK1
	I4hkgvW0FPetgPtszt0nUXxQWwNQMy+N6E21mK8reC8bs/l/fI4+IHrL3PISWkJypaWMAgwnrQR5a
	tuVXx4SHSCkCiZI8c9AdAm1XutXy3iTuwGx83oz2o0wN6QNvQtqfUQQyzxOio3LSJmvavtMgS/0un
	tXx3Zq02Tr9EjLHBAqXwJR+9TEDSe8bN0ZOvmZ5FJoBggKTIH6IBdbH/iDjqMKPxvuVaDWSWCjY9t
	eww5iBKFyncenFCDtOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOi7a-00DBGl-L0; Mon, 28 Feb 2022 15:39:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOi7W-00DBFU-UT
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 15:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646062770; x=1677598770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yQcOpYi3/hD8IEZBHYqUvgPMwoCny9+QNjaItq/xudo=;
 b=CDxRyj2Dh2qDACdhB7BqlQy5ShGkBJsOqotKOzfa1peTx4WHlT1SeGel
 oUBPr6QRLdiMnYJcpE062HPkphN3IQdSCObcZilyR6IBD+kGPNFRl+cgd
 lQEWjDj3uBFVMIZK5V+vFNyvSphhTwwmyek74WA3qTxN9xsfG8z6Ysqxq
 gVYEuNxMjJE2jKzcZxmqhcC3eEfgXlx3OEnRjBa5afm+HoLC5/EClwxUq
 CKvlnaFpUUQdkC2Hm4CkdVeukIIhXhlOOSQy+NpawveZ1oT384Pp0oISR
 1/U08dkX/8D6LG30EprFvbSNmnjBaxG59D81WzsEtlnRqAIy95WI8OCjq Q==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="150249761"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 08:39:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 08:39:24 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 08:39:22 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: Move XMC to manufacturer ID collisions driver
Date: Mon, 28 Feb 2022 17:39:21 +0200
Message-ID: <20220228153921.219668-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fead645197b0cb6534c04a665938a8d5@walle.cc>
References: <fead645197b0cb6534c04a665938a8d5@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_073931_097262_D11F5635 
X-CRM114-Status: GOOD (  13.85  )
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
depends on: https://lore.kernel.org/linux-mtd/20220228134505.203270-1-tudor.ambarus@microchip.com/

 drivers/mtd/spi-nor/core.c                |  1 -
 drivers/mtd/spi-nor/core.h                |  1 -
 drivers/mtd/spi-nor/manuf-id-collisions.c |  8 ++++++++
 drivers/mtd/spi-nor/xmc.c                 | 25 -----------------------
 4 files changed, 8 insertions(+), 27 deletions(-)
 delete mode 100644 drivers/mtd/spi-nor/xmc.c

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
index 0447e245f4b1..33a7d475b1cd 100644
--- a/drivers/mtd/spi-nor/manuf-id-collisions.c
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -27,6 +27,14 @@ static const struct spi_nor_fixups xtx_nor_fixups = {
 };
 
 static const struct flash_info id_collision_parts[] = {
+	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
+	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+
 	/* Boya */
 	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
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
