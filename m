Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9C4EF99FF
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Feb 2026 06:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bhqJ3Zbd93x6q73ne2WM4iciH+yEmBW8rgy5arB/wAI=; b=JB3biybdyED4RD
	rgslRqZPtME47IM/4VqeDDebIsE5V+2MePCNa8z55oLVWyfffCb+oXuOyvOxuWc25drmlNHbvKHFF
	VOnguVJD4R3XDZHYD+3ItOC7aAWfJDauvTZTrG7mdFLxjqoGj8O09NFu5HLbLM2iYb++ULrcuDZwx
	jFgH2zLUN/TgP+R6MhZNpxqMcR5yXz1HXyGnocd68s5Z2OmgCnoGkhgHQActEkBpwCojIZN+UShJz
	MtyUcR5ZJkxKNxAqZge88muqM32tYuDHgTvZz57AVIh/n0B8zU5IF5I0gsl9xs9raniF9yHYxIXxS
	YqPbd8YnY5XasNvSR+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr92m-00000004KiW-42YU;
	Sat, 14 Feb 2026 06:22:16 +0000
Received: from mail.unwrap.rs ([172.232.15.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr92k-00000004Ki7-3d45
	for linux-mtd@lists.infradead.org;
	Sat, 14 Feb 2026 06:22:16 +0000
From: Cole Leavitt <cole@unwrap.rs>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH] mtd: spi-nor: add support for Fudan Microelectronics FM25Q256
Date: Fri, 13 Feb 2026 23:20:02 -0700
Message-ID: <20260214062002.17862-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_222214_980314_3493316B 
X-CRM114-Status: GOOD (  13.36  )
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

Add support for the Fudan Microelectronics FM25Q256 (JEDEC ID f7 f0 30),
a 256Mbit (32MB) SPI NOR flash chip. This chip is found on Lenovo
ThinkPad P16 Gen 3 (Arrow Lake-S) platforms as the SPI flash backing
the UEFI firmware.

The chip supports 4K sector erase, dual read, and quad read modes.

Without this patch, the kernel's spi-nor driver reports:
  spi-nor spi0.0: unrecognized JEDEC id bytes: f7 f0 30
and refuses to create an MTD device, preventing userspace tools from
accessing the flash.

Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 drivers/mtd/spi-nor/fudan.c  | 25 +++++++++++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/fudan.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 5dd9c35f6b6f..2c8b9b3e08bb 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -5,6 +5,7 @@ spi-nor-objs			+= atmel.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
+spi-nor-objs			+= fudan.o
 spi-nor-objs			+= gigadevice.o
 spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d3f8a78efd3b..395ff5c39883 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1944,6 +1944,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
+	&spi_nor_fudan,
 	&spi_nor_gigadevice,
 	&spi_nor_intel,
 	&spi_nor_issi,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 16b382d4f04f..be63273677c8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -594,6 +594,7 @@ extern const struct spi_nor_manufacturer spi_nor_atmel;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
+extern const struct spi_nor_manufacturer spi_nor_fudan;
 extern const struct spi_nor_manufacturer spi_nor_gigadevice;
 extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
diff --git a/drivers/mtd/spi-nor/fudan.c b/drivers/mtd/spi-nor/fudan.c
new file mode 100644
index 000000000000..e9a4d3ed3cd0
--- /dev/null
+++ b/drivers/mtd/spi-nor/fudan.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Fudan Microelectronics SPI NOR flash support.
+ *
+ * JEDEC manufacturer ID 0xf7.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info fudan_nor_parts[] = {
+	{
+		.id = SNOR_ID(0xf7, 0xf0, 0x30),
+		.name = "fm25q256",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	},
+};
+
+const struct spi_nor_manufacturer spi_nor_fudan = {
+	.name = "fudan",
+	.parts = fudan_nor_parts,
+	.nparts = ARRAY_SIZE(fudan_nor_parts),
+};

base-commit: 2687c848e57820651b9f69d30c4710f4219f7dbf
-- 
2.52.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
