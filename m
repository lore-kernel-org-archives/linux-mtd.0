Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFCAC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iFzK3ARYp/RL/4TMaUV99yZrTtzJWZiIByoA3uw0K8=; b=Bh/p/dwGg/gvLw
	HQdFUlETEUzdXSmzYZC3pyDIR1ymoE9LxscztY6C/623LULP0Zm2m0d0t5F/z5WonxfLgPj1gdqeU
	M135na17GmUYSVPAqJlpGnormOEBr6gbiRpsH45xZ7vwMITjeBfMKde5G6uxb79DAPveY8tGQgVJL
	PPO1HXPv4K2gvFzKNntqoL3HHUzkPLI2plGmK9+HTjMdD6kcrz1bu7INmnJ8IqSHgMNN3YV+vcVq1
	iBmoxnOH2YSW6iEbrbcZAudAA7NgSH5SApiDSk1O2E7mvgzvEw8kREt6Q2TeEwA1zrK7JtxEkN5vN
	mWI90xzu2Uu5v6X1fNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYRA-0000000089A-1B08;
	Mon, 26 Feb 2024 10:42:20 +0000
Received: from mail.tecon.ru ([82.112.190.120])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYR6-0000000086j-0oNh
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:42:18 +0000
From: Dmitry Dunaev <dunaev@tecon.ru>
To: 
CC: <dunaich@mail.ru>, Dmitry Dunaev <dunaev@tecon.ru>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: spi-nor: Add Puya Semiconductor chips driver
Date: Mon, 26 Feb 2024 13:40:59 +0300
Message-ID: <20240226104101.1848855-1-dunaev@tecon.ru>
In-Reply-To: <9ebf9cdf-eeba-417a-8410-3f87a0973136@linaro.org>
References: <9ebf9cdf-eeba-417a-8410-3f87a0973136@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024216_615445_03D58BE4 
X-CRM114-Status: GOOD (  12.71  )
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
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 drivers/mtd/spi-nor/puya.c   | 64 ++++++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+)
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
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4129764fad8c..09ad2142d004 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2045,6 +2045,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_issi,
 	&spi_nor_macronix,
 	&spi_nor_micron,
+	&spi_nor_puya,
 	&spi_nor_st,
 	&spi_nor_spansion,
 	&spi_nor_sst,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d36c0e072954..93df7a6328ca 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -609,6 +609,7 @@ extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
 extern const struct spi_nor_manufacturer spi_nor_macronix;
 extern const struct spi_nor_manufacturer spi_nor_micron;
+extern const struct spi_nor_manufacturer spi_nor_puya;
 extern const struct spi_nor_manufacturer spi_nor_st;
 extern const struct spi_nor_manufacturer spi_nor_spansion;
 extern const struct spi_nor_manufacturer spi_nor_sst;
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
