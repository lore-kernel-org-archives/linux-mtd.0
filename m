Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EAAC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L+X5XbOCGXAtdCL8LJK0pPiFY0Qc0fagBv1WHYJphYY=; b=QxWMgS2ShsNfkx
	uL+I0WF2d9iiVF9kSJWozKkdyMqR65az3FjWpJFfdxCzn9/4m7zCDOOZL0ychxFe0sjEF4YLCsKnX
	gvU4faUT8b4zrRK9INzkr2CjJYfXZnSeifl7KFWSle97hA6LuCiQb7uQVt3bvW/oW2SahqvL0iYdJ
	zCjMXWGu0l+zYsqa3+O52x81BK9rc7vkYzP4S8R2aEikD85Lk2dWGqbwFwFbsRo5uCPzdJJslW05B
	0LWRiCZAGAW8LBtdsn/0guUwi+pZ1TfttwjKQZlSgv7XkKn/TpLLaa/fjaLtePsw4zoAsPg1lLcKZ
	YKCXH82g7q0bHAWu7OTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXEC-0000000HK6C-152p;
	Mon, 26 Feb 2024 09:24:52 +0000
Received: from mail.tecon.ru ([82.112.190.120])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXE6-0000000HK1A-06kw
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 09:24:49 +0000
From: Dmitry Dunaev <dunaev@tecon.ru>
To: 
CC: <dunaich@mail.ru>, Dmitry Dunaev <dunaev@tecon.ru>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: Add Puya Semiconductor chips driver
Date: Mon, 26 Feb 2024 12:23:10 +0300
Message-ID: <20240226092312.1834584-1-dunaev@tecon.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_012446_420666_C89C2A4F 
X-CRM114-Status: GOOD (  10.90  )
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

Add a SPI NOR manufacturer driver for Puya Semiconductor chips

Signed-off-by: Dmitry Dunaev <dunaev@tecon.ru>
---
 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/puya.c   | 64 ++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/puya.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 5e68468b72fc..3e22039d0432 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -10,6 +10,7 @@ spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
 spi-nor-objs			+= macronix.o
 spi-nor-objs			+= micron-st.o
+spi-nor-objs			+= puya.o
 spi-nor-objs			+= spansion.o
 spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
diff --git a/drivers/mtd/spi-nor/puya.c b/drivers/mtd/spi-nor/puya.c
new file mode 100644
index 000000000000..2198a9ed7101
--- /dev/null
+++ b/drivers/mtd/spi-nor/puya.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Tecon MT LLC.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+/* Puya Semiconductor (Shanghai) Co., Ltd */
+static const struct flash_info puya_nor_parts[] = {
+	{
+		.id = SNOR_ID(0x85, 0x60, 0x10),
+		.name = "p25q05h",
+		.size = SZ_64K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x85, 0x60, 0x11),
+		.name = "p25q10h",
+		.size = SZ_128K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x85, 0x60, 0x12),
+		.name = "p25q20h",
+		.size = SZ_256K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x85, 0x60, 0x13),
+		.name = "p25q40h",
+		.size = SZ_512K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x85, 0x60, 0x14),
+		.name = "p25q80h",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x85, 0x60, 0x15),
+		.name = "p25q16h",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x85, 0x60, 0x16),
+		.name = "p25q32h",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x85, 0x60, 0x17),
+		.name = "p25q64h",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x85, 0x60, 0x18),
+		.name = "p25q128h",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}
+};
+
+const struct spi_nor_manufacturer spi_nor_puya = {
+	.name = "puya",
+	.parts = puya_nor_parts,
+	.nparts = ARRAY_SIZE(puya_nor_parts),
+};
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
