Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7EFC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=52Z1VxfNvtqZoaB/VOM+ylhw4iILtKGqO67DLVrYBOs=; b=Uig4fpWBzfW22O
	U+YwsUdmxsrI/5qud8ihV2Z+4f+F60RCtNjWekVLagSgqKEMteLnsz8feslfKq+hTSt/c9TVYxhPC
	eDHc5f1/KWYpidMPepJOZe/tCvXMzfy78Uvi8g96nzHlN7BG8SaGvVBd+mGLjXeA/mV1llm6ovTQV
	7gM6L0e326ltSZgEnoQARLuIIweEWE84/8OREWs1tVGKOIgtYof31I7LhdYtSfPDqC+B3PhEYrxoA
	9sCZHNDtyigNmdjGZs6GFBkqqanpvr2zKYYq0XlQLtrDA0MiVrK+c8z6qGIs+gg77DGpYPbRYTK9T
	Q6B0g5+WnAuhNApS0i2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngRc5-00H8FG-FF; Mon, 18 Apr 2022 13:40:21 +0000
Received: from mail.fmat.eu ([2a03:4000:21:70a:b8c2:1eff:fea5:fc02])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngRSC-00H3qu-7S
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 13:30:11 +0000
Received: from authenticated-user (mail.fmat.eu [94.16.121.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.fmat.eu (Postfix) with ESMTPSA id E7FCDE09E4;
 Mon, 18 Apr 2022 15:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=matouschek.org;
 s=mail; t=1650288600;
 bh=uiqz7Gu5s8HqRbLTDeK1F7tXaMd+4gRCPmAcg9cGUbU=;
 h=From:To:Cc:Subject:Date:From;
 b=AjmWuBlekp6a+YPRPxb2kXN0vuHZQYTIb+nPFQIuKidvkpIVS82x2AFTGzRO/EOAE
 nVrwj2WPKYVao7hFmV183eZh23s7J694ZKKBob+2XNRkg/K0y58209FcWmevCuoo7j
 /BYe2JTnhKrUJhaygRM2adxRPJ4XCT4A1dfhXip2QvdIQRp2mi+kuzCmi0sy1xCTjd
 IEZFFMQShq940VU03WxqPnfpiTvvW+bFpzG7NrcIixKrxoO0XUKYw0+8gqiAa1axh8
 e90Z3S1eFjN7Ji9V7vBy6nXzvxGKMjIz83K3jnaFfbBrfGZdMxWXkrtovCJy1LbDhy
 4rsFWVFaibTWA==
From: Felix Matouschek <felix@matouschek.org>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3] mtd: spinand: Add support for XTX XT26G0xA
Date: Mon, 18 Apr 2022 15:28:03 +0200
Message-Id: <20220418132803.664103-1-felix@matouschek.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_063009_001096_35305C46 
X-CRM114-Status: GOOD (  17.78  )
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

Add support for XTX Technology XT26G01AXXXXX, XTX26G02AXXXXX and
XTX26G04AXXXXX SPI NAND.

These are 3V, 1G/2G/4Gbit serial SLC NAND flash devices with on-die ECC
(8bit strength per 512bytes).

Tested on Teltonika RUTX10 flashed with OpenWrt.

Links:
  - http://www.xtxtech.com/download/?AId=225
  - https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT26G01AWSEGA_C558841.pdf
Signed-off-by: Felix Matouschek <felix@matouschek.org>
---
 drivers/mtd/nand/spi/Makefile |   2 +-
 drivers/mtd/nand/spi/core.c   |   1 +
 drivers/mtd/nand/spi/xtx.c    | 129 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |   1 +
 4 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/xtx.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 9662b9c1d5a9..80dabe6ff0f3 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o
+spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index ff8336870bc0..d5b685d1605e 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -933,6 +933,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&paragon_spinand_manufacturer,
 	&toshiba_spinand_manufacturer,
 	&winbond_spinand_manufacturer,
+	&xtx_spinand_manufacturer,
 };
 
 static int spinand_manufacturer_match(struct spinand_device *spinand,
diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
new file mode 100644
index 000000000000..3911520f718c
--- /dev/null
+++ b/drivers/mtd/nand/spi/xtx.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author:
+ * Felix Matouschek <felix@matouschek.org>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_XTX	0x0B
+
+#define XT26G0XA_STATUS_ECC_MASK	GENMASK(5, 2)
+#define XT26G0XA_STATUS_ECC_NO_DETECTED	(0 << 2)
+#define XT26G0XA_STATUS_ECC_8_CORRECTED	(3 << 4)
+#define XT26G0XA_STATUS_ECC_UNCOR_ERROR	(2 << 4)
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants,
+		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
+static int xt26g0xa_ooblayout_ecc(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 48;
+	region->length = 16;
+
+	return 0;
+}
+
+static int xt26g0xa_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 1;
+	region->length = 47;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops xt26g0xa_ooblayout = {
+	.ecc = xt26g0xa_ooblayout_ecc,
+	.free = xt26g0xa_ooblayout_free,
+};
+
+static int xt26g0xa_ecc_get_status(struct spinand_device *spinand,
+					 u8 status)
+{
+	status = status & XT26G0XA_STATUS_ECC_MASK;
+
+	switch (status) {
+	case XT26G0XA_STATUS_ECC_NO_DETECTED:
+		return 0;
+	case XT26G0XA_STATUS_ECC_8_CORRECTED:
+		return 8;
+	case XT26G0XA_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+	default:
+		break;
+	}
+
+	/* At this point values greater than (2 << 4) are invalid  */
+	if (status > XT26G0XA_STATUS_ECC_UNCOR_ERROR)
+		return -EINVAL;
+
+	/* (1 << 2) through (7 << 2) are 1-7 corrected errors */
+	return status >> 2;
+}
+
+static const struct spinand_info xtx_spinand_table[] = {
+	SPINAND_INFO("XT26G01A",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xE1),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&xt26g0xa_ooblayout,
+				     xt26g0xa_ecc_get_status)),
+	SPINAND_INFO("XT26G02A",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xE2),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&xt26g0xa_ooblayout,
+				     xt26g0xa_ecc_get_status)),
+	SPINAND_INFO("XT26G04A",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xE3),
+		     NAND_MEMORG(1, 2048, 64, 128, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&xt26g0xa_ooblayout,
+				     xt26g0xa_ecc_get_status)),
+};
+
+static const struct spinand_manufacturer_ops xtx_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer xtx_spinand_manufacturer = {
+	.id = SPINAND_MFR_XTX,
+	.name = "XTX",
+	.chips = xtx_spinand_table,
+	.nchips = ARRAY_SIZE(xtx_spinand_table),
+	.ops = &xtx_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 3aa28240a77f..5584d3bb6556 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -266,6 +266,7 @@ extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;
 extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
 extern const struct spinand_manufacturer winbond_spinand_manufacturer;
+extern const struct spinand_manufacturer xtx_spinand_manufacturer;
 
 /**
  * struct spinand_op_variants - SPI NAND operation variants
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
