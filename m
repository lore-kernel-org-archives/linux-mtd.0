Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C32FC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19BF6103A
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D19BF6103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lr8ukJ0auGWyCJ/+bWXdA7dMqO0/cJi27qVAYf7OH9M=; b=M7KRo5k/Fpyn9A
	etVAn/tfcddZr7zict7xZw4rLMvR59llh/kAZ/O/I3lysYDHWAkjguR2+PT0HuSyrOynF++xFKCRp
	QOfxOqo86WVHfN9R6WGEpteDZCg/txNrJC5O7FNa3lPCWCXuuTFA5M928aQl0hFUOClfd9BUP8Q0K
	EtZGH+vqDMi6GB8eHeZQVIAi+m1G1Tnzp3OqH2ssJsxBJozuhlgZ4jyoKP3lrzv4x69tYA5frW9/X
	4bF+PACdoTr8d/YhY5uUOLB/Cxx9TNtEEV+X3x/0KXM+FgRwA3D4wUED8hPp/xwFxbejySwtXLRvu
	LLAcCOZctV+Vh5+46kYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjPTH-00DJLp-SS; Sat, 06 Nov 2021 17:27:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjOqi-00D8bg-5C; Sat, 06 Nov 2021 16:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636217244; x=1667753244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAg7RtrtD0K2UnXwTlAQnKWVcpdZIn03JwpmZ1zh9gc=;
 b=YioJMf6erJxZZNEME/fcU1TSguJRmrB0Ik70hhpfQWdyf0W61bR1kJlW
 BcghJSfRAUEUcqDG9lWWLgzUYrzQ0XdFRmfm1MAaArmSr6PaeJbKH66W7
 qmA6yl95Ejjlm/uKYGIUJbyI9WFZX6UncGy0tyGlXuCrGIN1LXuE5lb/O
 PMZNSgrwvVvQy3MTSGW7VssfXW03sBp07NUHXBc7pdGr49+3kXZuKmp4C
 qsrmn/iRhvMps29003zkcZJYiethdoD1wBAHUS+vN804HqF/6UseGFRTX
 RlSCN5c+Gp1Bavh7w28N5wIhc5NP1yKxfq6qdr16hMtxC8jCo/LV11QiL w==;
IronPort-SDR: VRBQQrneSM2UBcVYTJJYetDDdm6Tkb2nvsNKntA5toW9Z4DqD/3j6I0Wncm4Oy5+U2aqW6KlfF
 fJTGjV3Ex0vlgA37sfUCj2Vd6UOZrTe92trfwnBbYDaAHO8eEcLhEt8cOiF65CwESFR3xEoI/r
 cnNGSML6+y0FcmGQb294SpBV0efcBlmx6KbcCBWdv6CPK8K9u2C00Pe8P1tCXjJWooBZYwrILB
 +jntdISoM/Yr18bdDorLDSMI39I4Fk4T6vjrQAVMfYyoe6jvdIND/to33bUjhWbExFD55XVzHr
 F7dSvRDXib2zhavY5XUInsNw
X-IronPort-AV: E=Sophos;i="5.87,214,1631602800"; d="scan'208";a="150948765"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 04:37:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 04:37:22 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 04:37:18 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 4/6] mtd: spi-nor: Introduce Manufacturer ID collisions
 driver
Date: Sat, 6 Nov 2021 13:36:55 +0200
Message-ID: <20211106113657.172690-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106113657.172690-1-tudor.ambarus@microchip.com>
References: <20211106113657.172690-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_094724_249707_538056CF 
X-CRM114-Status: GOOD (  21.75  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw,
 Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
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
 drivers/mtd/spi-nor/manuf-id-collisions.c | 31 +++++++++++++++++++++++
 drivers/mtd/spi-nor/sysfs.c               |  2 +-
 include/linux/mtd/spi-nor.h               |  6 ++++-
 6 files changed, 42 insertions(+), 2 deletions(-)
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
index 3d97c189c332..908fa16fd8f9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1829,6 +1829,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 }
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
+	&spi_nor_manuf_id_collisions,
 	&spi_nor_atmel,
 	&spi_nor_catalyst,
 	&spi_nor_eon,
@@ -3273,6 +3274,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	if (!nor->name)
 		nor->name = info->name;
+	if (!nor->manufacturer_name)
+		nor->manufacturer_name = nor->manufacturer->name;
 
 	dev_info(dev, "%s (%lld Kbytes)\n", nor->name,
 			(long long)mtd->size >> 10);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 9dd8ada65f0c..86545b6435f2 100644
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
index 000000000000..4dcdf98c3eec
--- /dev/null
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -0,0 +1,31 @@
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
+static void boya_late_init(struct spi_nor *nor)
+{
+	nor->manufacturer_name = "boya";
+}
+
+static const struct spi_nor_fixups boya_fixups = {
+	.late_init = boya_late_init,
+};
+
+static const struct flash_info id_collision_parts[] = {
+	/* Boya */
+	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		.fixups = &boya_fixups },
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
index be7ebaf092fe..a12f3a3d80f0 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -369,7 +369,10 @@ struct spi_nor_flash_parameter;
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
@@ -400,6 +403,7 @@ struct spi_nor {
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
