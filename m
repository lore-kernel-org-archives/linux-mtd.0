Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CC4C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Feb 2022 00:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q72kBsZGInTAm/9RPTMIzNwOlmdyOo4lQiNXZL5NQJ0=; b=iQUtxvUadMIB68
	bWJNZqpvJh4+fqEh9E0dafnccQKC1HQlkGqXEC53aBhXxXsjhSwpeySlgjFUocydEl1IqRuRwPl2J
	SyQqFAp+GVwITsVWiHXFcEXU7wF4UnsN7U8er8VY2b/3iYcJfMq/kmbanY4huMW7cufBNr8IMzn4x
	8qS+HdedgI6kEeohFArhPFvPLKXk2Vvlm3JmmuGohKRXA0Cd8u/6xjactT3MkoEVj9b4+INE+/Kt1
	bl6T1xRs3NRtdip1tYndQb8Kfsf8ITuR0kURiuL7IduAQy0LORHBganTf7x5mTxRRJ+8zn9ie1Xlz
	ssYffWVw4r9XNg7IEJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEh09-00As28-A6; Tue, 01 Feb 2022 00:26:29 +0000
Received: from mail.crtified.me ([49.12.231.242])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEh06-00As05-32
 for linux-mtd@lists.infradead.org; Tue, 01 Feb 2022 00:26:27 +0000
From: Carl Richard Theodor Schneider <dev.linux@crtified.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crtified.me; s=mail;
 t=1643675181; bh=JeNXq18UbQzuvreRzNfiLaQ6jV89JRgSNEv4N1KLBKQ=;
 h=From:To:Cc:Subject:Date;
 b=QTDjFfgZ1VB3Cwl9rvkzGrkr2/fh2ru+1oP6mEX6olQsfVSugY1H+TmfWO5mduBZj
 OJEG3T+k6FPLcOeTXcM4nxceJiwGoTsbtYi8RcVKXcxTVahUTH3ZASS4CG3rW2EuqW
 tVZe4RMAHz26HvGFp6rzRxQ2/JmZj6xDsr4LfuNk=
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: microcaicai@gmail.com,
 Carl Richard Theodor Schneider <dev.linux@crtified.me>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Init xtx flash xt25f32b, xt25f128b
Date: Tue,  1 Feb 2022 01:25:34 +0100
Message-Id: <20220201002535.2186484-1-dev.linux@crtified.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_162626_327133_5CF3F7CA 
X-CRM114-Status: GOOD (  14.26  )
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

Add the JEDEC identifiers for xt25f32b and xt25f128b.
Based on the referenced previous patch from microcai.

Only xt25f32b was verified in hardware (On both Radxa RockPi 4A and 4C),
but the ID of the xt25f128b can also be found in u-boot patches from
Armbian.

Link: https://lore.kernel.org/lkml/CAMgqO2y9MYDj6antOaWLBRKU8vGEwqCB-Y1TkXTSWsmsed+W6A@mail.gmail.com/
Link: https://datasheet.lcsc.com/szlcsc/2005251035_XTX-XT25F32BSOIGU-S_C558851.pdf
Link: https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf
Link: https://github.com/armbian/build/blob/master/patch/u-boot/u-boot-rockchip64/general-add-xtx-spi-nor-chips.patch

Signed-off-by: Carl Richard Theodor Schneider <dev.linux@crtified.me>
---
 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 drivers/mtd/spi-nor/xtx.c    | 25 +++++++++++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/xtx.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 6b904e439372..e344077e3054 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -17,6 +17,7 @@ spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
 spi-nor-objs			+= xilinx.o
 spi-nor-objs			+= xmc.o
+spi-nor-objs			+= xtx.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 04ea180118e3..44017ab54726 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1846,6 +1846,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_winbond,
 	&spi_nor_xilinx,
 	&spi_nor_xmc,
+	&spi_nor_xtx,
 };
 
 static const struct flash_info *
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2afb610853a9..8adac5da6851 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -536,6 +536,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
 extern const struct spi_nor_manufacturer spi_nor_winbond;
 extern const struct spi_nor_manufacturer spi_nor_xilinx;
 extern const struct spi_nor_manufacturer spi_nor_xmc;
+extern const struct spi_nor_manufacturer spi_nor_xtx;
 
 extern const struct attribute_group *spi_nor_sysfs_groups[];
 
diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
new file mode 100644
index 000000000000..2c9028e5d719
--- /dev/null
+++ b/drivers/mtd/spi-nor/xtx.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info xtx_parts[] = {
+	/* XTX (Shenzhen Xin Tian Xia Tech) */
+	{ "xt25f32b", INFO(0x0b4016, 0, 64 * 1024, 64)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			SPI_NOR_QUAD_READ) },
+	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			SPI_NOR_QUAD_READ) },
+};
+
+const struct spi_nor_manufacturer spi_nor_xtx = {
+	.name = "xtx",
+	.parts = xtx_parts,
+	.nparts = ARRAY_SIZE(xtx_parts),
+};
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
