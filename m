Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27441C07E95
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 20:02:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 272D26108B
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 20:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 272D26108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=matouschek.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ci2FqmhaBxLNqef8wr869bJ98eQFnMHRaXTT4fDTq+8=; b=BGGCc79GmZy635
	dDZdww3Xykrg4mDdN4XERaGCL4SpaXshdtUCN1CaQEmbxIdHSMqc0RO0t9AT6o3DF04SjE23ziiJz
	P6J/wVWY9rfj3oOrtQ6zxR16A2HLK87WfaVRToEcLeuCm/XHbSXCZlJN6ZI9QFUde1+jrziakq+/n
	CSF4ZB2KVJSl/Tvfdcrzr5dllFe0Tmq6fnQfLqesAq2eGIFtw9U/Yd2w4mX3tp3lj9MKeTMXO6nX+
	KCqlfYkniUxnTvxLxWUFdxSKz+856J7snY+3PJD2mgH88tmr48ib/lDT7HM0JRZJjITHu5KbtFt3c
	orThQ/RMFsDqYUngTaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzPLs-003xJG-Dw; Fri, 02 Jul 2021 20:01:28 +0000
Received: from mail.fmat.eu ([94.16.121.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzPLm-003xIn-DJ
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 20:01:26 +0000
Received: from authenticated-user (mail.fmat.eu [94.16.121.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.fmat.eu (Postfix) with ESMTPSA id A829DE01AD
 for <linux-mtd@lists.infradead.org>; Fri,  2 Jul 2021 21:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=matouschek.org;
 s=mail; t=1625255566;
 bh=15a7WMoI2+Xp+eEO+RyhtBX1CZrmNgjJNUKLlsrngEw=;
 h=From:To:Subject:Date:From;
 b=xH81QbCHQorYumSYpJsfnClgUeWflzxlrlBAChnR6GtJOBRMFfEiMTdLg1lRWmWc2
 d3tr7nBatYguA0Xu/qg0+hhGEYkdX/zvqrIqfF6ubPEqRO0/hvSTIOQv4SyzOfAowm
 axxvhNEeq+XY9iazxoFnd0t2QY2TUkPDqrDEitmSdXVmLfsoV3V81cUKliOn48M0Wr
 L99LaQSgwee7j3gZ4sxa/rZ+oSBQP+OIWu48IJDd7IH/1qLIAIOpBVHBepB/fZLihf
 3rZFy/bYS1hQEzaBdZmx/LlAFNXe2J8nF+QegO77AHv5QDDCWFwTA+Lwb/ZH85Hflh
 8DlTLpC2RzN7g==
From: Felix Matouschek <felix@matouschek.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spinand: Add support for XTX XT26G0xA
Date: Fri,  2 Jul 2021 21:52:35 +0200
Message-Id: <20210702195235.555620-1-felix@matouschek.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_130123_229975_E9D41E7F 
X-CRM114-Status: GOOD (  16.83  )
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

Datasheets available at
http://www.xtxtech.com/download/?AId=225
https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT26G01AWSEGA_C558841.pdf

Signed-off-by: Felix Matouschek <felix@matouschek.org>
---
 drivers/mtd/nand/spi/Makefile |   2 +-
 drivers/mtd/nand/spi/core.c   |   1 +
 drivers/mtd/nand/spi/xtx.c    | 122 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |   1 +
 4 files changed, 125 insertions(+), 1 deletion(-)
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
index a49cd81ae416..f5377b2ecd6d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -881,6 +881,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&paragon_spinand_manufacturer,
 	&toshiba_spinand_manufacturer,
 	&winbond_spinand_manufacturer,
+	&xtx_spinand_manufacturer,
 };
 
 static int spinand_manufacturer_match(struct spinand_device *spinand,
diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
new file mode 100644
index 000000000000..2c2a0b9c7587
--- /dev/null
+++ b/drivers/mtd/nand/spi/xtx.c
@@ -0,0 +1,122 @@
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
+	region->offset = 8;
+	region->length = 40;
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
+	region->length = 7;
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
+	switch (status & XT26G0XA_STATUS_ECC_MASK) {
+	case XT26G0XA_STATUS_ECC_NO_DETECTED:
+		return 0;
+	case XT26G0XA_STATUS_ECC_8_CORRECTED:
+		return 8;
+	case XT26G0XA_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+	default: /* (1 << 2) through (7 << 2) are 1-7 corrected errors */
+		return (status & XT26G0XA_STATUS_ECC_MASK) >> 2;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info xtx_spinand_table[] = {
+	SPINAND_INFO("XT26G01A",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE1),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&xt26g0xa_ooblayout,
+				     xt26g0xa_ecc_get_status)),
+	SPINAND_INFO("XT26G02A",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE2),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&xt26g0xa_ooblayout,
+				     xt26g0xa_ecc_get_status)),
+	SPINAND_INFO("XT26G04A",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE3),
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
index 6bb92f26833e..5038a930128f 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -244,6 +244,7 @@ extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;
 extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
 extern const struct spinand_manufacturer winbond_spinand_manufacturer;
+extern const struct spinand_manufacturer xtx_spinand_manufacturer;
 
 /**
  * struct spinand_op_variants - SPI NAND operation variants
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
