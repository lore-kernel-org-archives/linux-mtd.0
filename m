Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6865C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4LzfcQICUzKDYE9H8scxACx7RiV1OSXC5WF7sZN78M=; b=xhgESYI2SMkFdT
	q/oF2SVi/tic/ByHZx9pudiQFYXO7WUKDFUyYdvCCwKmO2y7IYo4jXmUMUiQeEXL70CRHRgOHFI1l
	0qcysiJ5Z1NiQhwv1zreQeieEtXwCmVOkMamWB+w15YIqTh7thej87k9d/Sg4qjEBsMmqJeulF8An
	MrDJEPWSPv3fKPrJ+8qYZcOWTDkNTk6DwGLvXClHlxKiD2ePMDRwRw2KRcbNsshQEpOZfvdBqgFTR
	ioOG0xgNlpP/oR2wLIPmblJvPVQm1kZkNlgg+JuAGy9xxoLT1NppzQAAXC5vy59LKb4b6mUimC5rE
	9yPQdr5V4iK2hMCaQEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgP7-00CgDL-GI; Mon, 28 Feb 2022 13:49:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgLH-00Cedt-G0; Mon, 28 Feb 2022 13:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646055935; x=1677591935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPf+N49vb4FBg7SMEOq7pUm2eOcxiFBSj32THyvL1XI=;
 b=Zznn9awRyO3vH/sd/L7om0IFCFWqABNy/WK1Y+ujzDF9wRSU2spkbxQo
 kWKOEsEk+shnjjMj0i/MWDZK4MhebO2dSFKkq/YOYmV7X6iwhRGzgJCDt
 X8sxm4BBJRItbVm0kOBASsQ9nkDO9Iml4yXFMxltzgAajazpwKMl340mb
 GNwoMdAEQ/d7PePwSORyNShJx2VBcCawpHl05IVuTKIOQCYVslKHeg2US
 AbOqNzXSBxLt/3YH1GSIMdsrMetYqWQIj7bLzz9Xfd3RW5deceJ21F6HL
 l+j/qR/Jq4ouiC/FbYnWvYMthKIbZvjRtSI/Xsld+4huPE+fnVooVg2p2 Q==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="155113072"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 06:45:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 06:45:34 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 06:45:30 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <esben@geanix.com>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>
CC: <vigneshr@ti.com>, <linux@rasmusvillemoes.dk>, <knaerzche@gmail.com>,
 <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 5/6] mtd: spi-nor: Introduce Manufacturer ID collisions
 driver
Date: Mon, 28 Feb 2022 15:45:04 +0200
Message-ID: <20220228134505.203270-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228134505.203270-1-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_054535_588475_9B60D3D4 
X-CRM114-Status: GOOD (  21.20  )
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
 drivers/mtd/spi-nor/core.c                |  3 +++
 drivers/mtd/spi-nor/core.h                |  1 +
 drivers/mtd/spi-nor/manuf-id-collisions.c | 32 +++++++++++++++++++++++
 drivers/mtd/spi-nor/sysfs.c               |  2 +-
 include/linux/mtd/spi-nor.h               |  6 ++++-
 6 files changed, 43 insertions(+), 2 deletions(-)
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
index aef00151c116..80d6ce41122a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1610,6 +1610,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 }
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
+	&spi_nor_manuf_id_collisions,
 	&spi_nor_atmel,
 	&spi_nor_catalyst,
 	&spi_nor_eon,
@@ -3037,6 +3038,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	if (!nor->name)
 		nor->name = info->name;
+	if (!nor->manufacturer_name)
+		nor->manufacturer_name = nor->manufacturer->name;
 
 	dev_info(dev, "%s (%lld Kbytes)\n", nor->name,
 			(long long)mtd->size >> 10);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b7fd760e3b47..f727e632c0ee 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -500,6 +500,7 @@ struct sfdp {
 };
 
 /* Manufacturer drivers. */
+extern const struct spi_nor_manufacturer spi_nor_manuf_id_collisions;
 extern const struct spi_nor_manufacturer spi_nor_atmel;
 extern const struct spi_nor_manufacturer spi_nor_catalyst;
 extern const struct spi_nor_manufacturer spi_nor_eon;
diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
new file mode 100644
index 000000000000..75c5ad6480ee
--- /dev/null
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -0,0 +1,32 @@
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
+static void boya_nor_late_init(struct spi_nor *nor)
+{
+	nor->manufacturer_name = "boya";
+}
+
+static const struct spi_nor_fixups boya_nor_fixups = {
+	.late_init = boya_nor_late_init,
+};
+
+static const struct flash_info id_collision_parts[] = {
+	/* Boya */
+	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ)
+		.fixups = &boya_nor_fixups },
+};
+
+const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
+	.parts = id_collision_parts,
+	.nparts = ARRAY_SIZE(id_collision_parts),
+};
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 017119768f32..fa0cf1a96797 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -14,7 +14,7 @@ static ssize_t manufacturer_show(struct device *dev,
 	struct spi_mem *spimem = spi_get_drvdata(spi);
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	return sysfs_emit(buf, "%s\n", nor->manufacturer->name);
+	return sysfs_emit(buf, "%s\n", nor->manufacturer_name);
 }
 static DEVICE_ATTR_RO(manufacturer);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 449496b57acb..3087589d01ac 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -351,7 +351,10 @@ struct spi_nor_flash_parameter;
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer
- * @name:		used to point to correct name in case of ID collisions.
+ * @name:		used to point to correct flash name in case of ID
+ *                      collisions.
+ * @manufacturer_name:	used to point to correct manufacturer name in case of
+ *                      ID collisions.
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
  * @addr_width:		number of address bytes
@@ -382,6 +385,7 @@ struct spi_nor {
 	u8			*bouncebuf;
 	size_t			bouncebuf_size;
 	const char *name;
+	const char *manufacturer_name;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
 	u8			addr_width;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
