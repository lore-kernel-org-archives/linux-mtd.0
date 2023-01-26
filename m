Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0316C54E94
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jan 2023 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LcU/A9srCbtXbh6chhYsuN2BdD6zFmJVVGTbzqROG1Y=; b=FsuUxt7Z2DyVFz
	u0djySCj9tlQCzhV6LCoZZSj3DqA8zt5NnrGwoVtG/lbXZuWg2NmS4BB0yO8g6pXc/X98zZyJz/Qs
	difa6BwNeQ5/74Jxxn9KYHOlRWHoeCo6oxenWpVLLh9HdsucDlOfuJp49K77KGr/iX7inEQacw+fL
	4e5dG6PGf/JQdmoTGygtjDqa6Ljs5wx31PDwkevj9A06r/lhrnJ4M/i0+jFPj6WVMTsEmEyTlu+Eg
	tEqCQCAUVDyzHExTeQlwwqHykiGXIGDzEFdsSY6NTViGN1LqQloTvAWWVx0N8mNyKeoixmF2tUu8b
	KQMylzuDcjbgnEvQ5uCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3Qz-00BEvd-9c; Thu, 26 Jan 2023 14:41:01 +0000
Received: from www.zeus06.de ([194.117.254.36] helo=mail.zeus06.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3Qv-00BEtD-5i
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2023 14:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=from:to
	:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=k1; bh=r4AA6pA09tqDjl1u4gBZl+WziN7
	x7H4udeX0rsxeMkM=; b=BpCYmJY75pRn+O168C70XHifcH1d38uFtRlx8gCRl/R
	SECa6Trf1asuVJzbwsjwCq28LoIShDjtKZBrZ0SpqhidjuHhid7C/IiOxx70JQ3v
	loS0cmBPuNS/9LWnGhkTBpe8E3P2cbHN9gJDnv5NdILMQMzZ9jWG97OMev2AKjso
	=
Received: (qmail 326935 invoked from network); 26 Jan 2023 15:40:54 +0100
Received: by mail.zeus06.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jan 2023 15:40:54 +0100
X-UD-Smtp-Session: l3s6476p2@pMxSvCvz0rdd7WR9
From: Mario Kicherer <dev@kicherer.org>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Mario Kicherer <dev@kicherer.org>,
	Dhruva Gole <d-gole@ti.com>
Subject: [PATCH v4] mtd: spinand: Add support for AllianceMemory AS5F34G04SND
Date: Thu, 26 Jan 2023 15:40:50 +0100
Message-Id: <20230126144050.2656358-1-dev@kicherer.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_064057_580388_7722F9E1 
X-CRM114-Status: GOOD (  21.90  )
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

Add support for AllianceMemory AS5F34G04SND SPI NAND flash

Datasheet:
- https://www.alliancememory.com/wp-content/uploads/pdf/flash/AllianceMemory_SPI_NAND_Flash_July2020_Rev1.0.pdf

Signed-off-by: Mario Kicherer <dev@kicherer.org>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
---
Changes since v3:
 - ooblayout functions now work with all flashes in this series
 - am_ecc_get_status now works with all flashes in this series
 - added comment describing free area layout

 drivers/mtd/nand/spi/Makefile         |   2 +-
 drivers/mtd/nand/spi/alliancememory.c | 153 ++++++++++++++++++++++++++
 drivers/mtd/nand/spi/core.c           |   1 +
 include/linux/mtd/spinand.h           |   1 +
 4 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/alliancememory.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index b520fe634041..4ec973b8b6bf 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o ato.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
+spinand-objs := core.o alliancememory.o ato.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/alliancememory.c b/drivers/mtd/nand/spi/alliancememory.c
new file mode 100644
index 000000000000..7936ea546b03
--- /dev/null
+++ b/drivers/mtd/nand/spi/alliancememory.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Mario Kicherer <dev@kicherer.org>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_ALLIANCEMEMORY	0x52
+
+#define AM_STATUS_ECC_BITMASK		(3 << 4)
+
+#define AM_STATUS_ECC_NONE_DETECTED	(0 << 4)
+#define AM_STATUS_ECC_CORRECTED		(1 << 4)
+#define AM_STATUS_ECC_ERRORED		(2 << 4)
+#define AM_STATUS_ECC_MAX_CORRECTED	(3 << 4)
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
+			   SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
+			   SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+			   SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
+			   SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
+static int am_get_eccsize(struct mtd_info *mtd)
+{
+	if (mtd->oobsize == 64)
+		return 0x20;
+	else if (mtd->oobsize == 128)
+		return 0x38;
+	else if (mtd->oobsize == 256)
+		return 0x70;
+	else
+		return -EINVAL;
+}
+
+static int am_ooblayout_ecc(struct mtd_info *mtd, int section,
+			    struct mtd_oob_region *region)
+{
+	int ecc_bytes;
+
+	ecc_bytes = am_get_eccsize(mtd);
+	if (ecc_bytes < 0)
+		return ecc_bytes;
+
+	region->offset = mtd->oobsize - ecc_bytes;
+	region->length = ecc_bytes;
+
+	return 0;
+}
+
+static int am_ooblayout_free(struct mtd_info *mtd, int section,
+			     struct mtd_oob_region *region)
+{
+	int ecc_bytes;
+
+	if (section)
+		return -ERANGE;
+
+	ecc_bytes = am_get_eccsize(mtd);
+	if (ecc_bytes < 0)
+		return ecc_bytes;
+
+	/*
+	 * It is unclear how many bytes are used for the bad block marker. We
+	 * reserve the common two bytes here.
+	 *
+	 * The free area in this kind of flash is divided into chunks where the
+	 * first 4 bytes of each chunk are unprotected. The number of chunks
+	 * depends on the specific model. The models with 4096+256 bytes pages
+	 * have 8 chunks, the others 4 chunks.
+	 */
+
+	region->offset = 2;
+	region->length = mtd->oobsize - 2 - ecc_bytes;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops am_ooblayout = {
+	.ecc = am_ooblayout_ecc,
+	.free = am_ooblayout_free,
+};
+
+static int am_ecc_get_status(struct spinand_device *spinand, u8 status)
+{
+	switch (status & AM_STATUS_ECC_BITMASK) {
+	case AM_STATUS_ECC_NONE_DETECTED:
+		return 0;
+
+	case AM_STATUS_ECC_CORRECTED:
+		/*
+		 * use oobsize to determine the flash model and the maximum of
+		 * correctable errors and return maximum - 1 by convention
+		 */
+		if (spinand->base.mtd.oobsize == 64)
+			return 3;
+		else
+			return 7;
+
+	case AM_STATUS_ECC_ERRORED:
+		return -EBADMSG;
+
+	case AM_STATUS_ECC_MAX_CORRECTED:
+		/*
+		 * use oobsize to determine the flash model and the maximum of
+		 * correctable errors
+		 */
+		if (spinand->base.mtd.oobsize == 64)
+			return 4;
+		else
+			return 8;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info alliancememory_spinand_table[] = {
+	SPINAND_INFO("AS5F34G04SND",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x2f),
+		     NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&am_ooblayout,
+				     am_ecc_get_status)),
+};
+
+static const struct spinand_manufacturer_ops alliancememory_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer alliancememory_spinand_manufacturer = {
+	.id = SPINAND_MFR_ALLIANCEMEMORY,
+	.name = "AllianceMemory",
+	.chips = alliancememory_spinand_table,
+	.nchips = ARRAY_SIZE(alliancememory_spinand_table),
+	.ops = &alliancememory_spinand_manuf_ops,
+};
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index dacd9c0e8b20..638391f77d8c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -937,6 +937,7 @@ static const struct nand_ops spinand_ops = {
 };
 
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
+	&alliancememory_spinand_manufacturer,
 	&ato_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6d3392a7edc6..01be9f0f008a 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -260,6 +260,7 @@ struct spinand_manufacturer {
 };
 
 /* SPI NAND manufacturers */
+extern const struct spinand_manufacturer alliancememory_spinand_manufacturer;
 extern const struct spinand_manufacturer ato_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
