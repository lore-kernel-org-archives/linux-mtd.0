Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F34C77B7A
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oJUEKNWSUuJGEnysOYq+P4aLIKAp976OSHr/6PNNC3M=; b=ThDq+C/KS2S3ye
	6JI2Y23dDAu0kk0bjN66lOjH3xWtItZwLfR5AHg2wMfhzX41UXrVJ1S8ynylixLyiMf305AU0U9Kb
	J+KA4ZSBgDQo5b9nn0QEpb7X0xDxuMIPqQN7eCTOn8m06tY0ngiE/jyldvGIzsnXkL2RaXFqibM9W
	Dsd872/tUGkrFFMFS+HCwMI7FYZrQqOoYiAtd7Qojeo6BS9I8rJTyrD7QHvad+dn1xVMj7F+LEDJJ
	ysqwl4ujPJxZ5Nq2IlQj7TbtJubyZlLTL2kmZ2ajPTUoQEAG4bk6T8rwvKB3VckiO5ID+0uF98e26
	MTEmNZWrJhfCCjfcbYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fST-002wxg-3D;
	Thu, 01 Jun 2023 10:23:06 +0000
Received: from m12.mail.163.com ([220.181.12.216])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fSP-002wts-31
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 10:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=MT/s1
	vsQ/Vrzbt4JN42eY6a+97DLqkg7G8/6dfdT5AE=; b=LF6qnDzKplRGw0Ww0WCAC
	eEklSjPpiB2JWyNEzvpzwis6hWOqNiRtBSmuFzHOJ8hUaOa9q+rytk6yaOFnUz9a
	RJGiSliSPR28mLjnnSaVRwsDdvMc74NgDXK3T3IG+Q+KlYhzQoLrI4QPEYnW0+5T
	1GaOfjpnxRe5bNDLUycNZQ=
Received: from localhost.localdomain (unknown [113.87.166.247])
	by zwqz-smtp-mta-g0-3 (Coremail) with SMTP id _____wB33S1wcXhkdOLQBA--.28410S4;
	Thu, 01 Jun 2023 18:22:41 +0800 (CST)
From: Bruce Suen <bruce_suen@163.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	Bruce Suen <bruce_suen@163.com>
Subject: [PATCH] mtd:spi-nor:Add support for xtx flash
Date: Thu,  1 Jun 2023 06:22:38 -0400
Message-Id: <20230601102238.948177-1-bruce_suen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: _____wB33S1wcXhkdOLQBA--.28410S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFWkCr17Xw4fJF4xur4xtFb_yoWrGr18pa
	1kurW5ArykC3y3W392kasruFy5Jw1xW3yYy3W2k39avwn5XFyUXrZIyFyftr1DGFnrJayF
	vasrZryUCF1rZF7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_5l1DUUUUU=
X-Originating-IP: [113.87.166.247]
X-CM-SenderInfo: 5euxuvpbvxv0i6rwjhhfrp/1tbiJhCBKFv2rYkCCgAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_032302_354427_A8F791E1 
X-CRM114-Status: GOOD (  13.98  )
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

Dear Maintainers,

This patch add support for XTX spi nor flash.
Dadasheet Link:
http://www.xtxtech.com/download/?AId=449
http://www.xtxtech.com/download/?AId=267
http://www.xtxtech.com/download/?AId=426
http://www.xtxtech.com/download/?AId=445
http://www.xtxtech.com/download/?AId=274

Signed-off-by: Bruce Suen <bruce_suen@163.com>
---
 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 drivers/mtd/spi-nor/xtx.c    | 43 ++++++++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/xtx.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index e347b435a038..8992c592a896 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -17,6 +17,7 @@ spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
 spi-nor-objs			+= xilinx.o
 spi-nor-objs			+= xmc.o
+spi-nor-objs			+= xtx.o
 spi-nor-$(CONFIG_DEBUG_FS)	+= debugfs.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 143ca3c9b477..0a26b7d1fe5d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2014,6 +2014,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_winbond,
 	&spi_nor_xilinx,
 	&spi_nor_xmc,
+	&spi_nor_xtx,
 };
 
 static const struct flash_info spi_nor_generic_flash = {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index fd61c4793a10..9f6c564be622 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -644,6 +644,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
 extern const struct spi_nor_manufacturer spi_nor_winbond;
 extern const struct spi_nor_manufacturer spi_nor_xilinx;
 extern const struct spi_nor_manufacturer spi_nor_xmc;
+extern const struct spi_nor_manufacturer spi_nor_xtx;
 
 extern const struct attribute_group *spi_nor_sysfs_groups[];
 
diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
new file mode 100644
index 000000000000..2e52fcfd1068
--- /dev/null
+++ b/drivers/mtd/spi-nor/xtx.c
@@ -0,0 +1,43 @@
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
+static const struct flash_info xtx_nor_parts[] = {
+	/* XTX (XTX Technology Inc.) */
+	{ "XT25F64", INFO(0x0B4017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XT25Q64", INFO(0x0B6017, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XT25F128", INFO(0x0B4018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XT25Q128", INFO(0x0B6018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XT25F256", INFO(0x0B4019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XT25Q256", INFO(0x0B6019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XT25Q512", INFO(0x0B651A, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XT25Q1G", INFO(0x0B651B, 0, 64 * 1024, 2048)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+};
+
+const struct spi_nor_manufacturer spi_nor_xtx = {
+	.name = "xtx",
+	.parts = xtx_nor_parts,
+	.nparts = ARRAY_SIZE(xtx_nor_parts),
+};
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
