Return-Path: <SRS0=xoN1=N6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53297C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 20:18:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06F7861139
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 20:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06F7861139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IozJEKSE1PMnvQscJ69ueM77bB5/aYo3SzQ60ejH/Ms=; b=jTGv8eKmHdseVM
	FuNgXJ02l5hW4ErrHFjiXZtvX5f505w9dpBGpnLzmcTOn7pP6I35yAGcoYcjPNtNv5+sxGTehkQiT
	B39FE47NrgnJURxVzRKWnxetPgBcfF7DHpN5nV5Y98ejBkPivpjOePsY9E7psKV9SesqhOz9CD7Bz
	rs4/d96DuQho8XWKwiiwN0XcVcqbmyJqr+fN2Vd/+oMMGI7zOgIlWrLfnvlivcv61iYAogyS0NmRB
	SIwu0hqvuWF8I4+3nm/yGvj14xk5JI7M72XBi5qwJAP2o+UgPJpI5SAVNYu4vfDTTNbDw++w2i3y2
	g7EpT+G116uvDlFTfTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO40Q-007Y5l-P7; Wed, 08 Sep 2021 20:17:14 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO40N-007Y5A-Gj
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 20:17:13 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1mO40E-00CUsT-WB
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 22:17:03 +0200
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
 by yawp.biot.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1mO3zg-00CUpr-91; Wed, 08 Sep 2021 22:16:28 +0200
Received: from bert by sumner.biot.com with local (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1mO3zf-000zpp-EB; Wed, 08 Sep 2021 22:16:27 +0200
From: Bert Vermeulen <bert@biot.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bert Vermeulen <bert@biot.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Alexander Lobakin <alobakin@pm.me>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spinand: Add support for Etron EM73D044VCx
Date: Wed,  8 Sep 2021 22:16:19 +0200
Message-Id: <20210908201624.237634-1-bert@biot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_131711_603341_EE622C5D 
X-CRM114-Status: GOOD (  18.98  )
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

This adds a new vendor Etron, and support for a 2Gb chip.

The datasheet is available at
https://www.etron.com/cn/products/EM73%5B8%5DC%5BD_E_F%5DVC%20SPI%20NAND%20Flash_Promotion_Rev%201_00A.pdf

Signed-off-by: Bert Vermeulen <bert@biot.com>
---
v2:
- Made ooblayout_free/_ecc depend on chip-specific parameters, instead of
  hardcoded to this 2Gb chip only
- Fixed manufacturer ordering
- Fixed minor formatting issues as reported
- Removed debug comment

 drivers/mtd/nand/spi/Makefile |   2 +-
 drivers/mtd/nand/spi/core.c   |   1 +
 drivers/mtd/nand/spi/etron.c  | 104 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |   1 +
 4 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/etron.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 9662b9c1d5a9..cc3c4e046ea9 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o
+spinand-objs := core.o etron.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 446ba8d43fbc..2cbf25b8caa2 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -894,6 +894,7 @@ static const struct nand_ops spinand_ops = {
 };
 
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
+	&etron_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/etron.c b/drivers/mtd/nand/spi/etron.c
new file mode 100644
index 000000000000..1a92b9cf3043
--- /dev/null
+++ b/drivers/mtd/nand/spi/etron.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_ETRON			0xd5
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
+static int etron_oob_spare(struct mtd_info *mtd)
+{
+	if (mtd->size < 0x10000000)
+		return mtd->oobsize / 2;
+	else
+		return mtd->oobsize / 2 + mtd->oobsize / 16;
+}
+
+static int etron_ooblayout_ecc(struct mtd_info *mtd, int section,
+					struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = etron_oob_spare(mtd);
+	oobregion->length = mtd->oobsize - oobregion->offset;
+
+	return 0;
+}
+
+static int etron_ooblayout_free(struct mtd_info *mtd, int section,
+			   struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 2;
+	oobregion->length = etron_oob_spare(mtd) - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops etron_ooblayout = {
+	.ecc = etron_ooblayout_ecc,
+	.free = etron_ooblayout_free,
+};
+
+static int etron_ecc_get_status(struct spinand_device *spinand, u8 status)
+{
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_HAS_BITFLIPS:
+		/* Between 1-7 bitflips were corrected */
+		return 7;
+
+	case STATUS_ECC_MASK:
+		/* Maximum bitflips were corrected */
+		return 8;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info etron_spinand_table[] = {
+	SPINAND_INFO("EM73D044VCx",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x1f),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&etron_ooblayout, etron_ecc_get_status)),
+};
+
+static const struct spinand_manufacturer_ops etron_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer etron_spinand_manufacturer = {
+	.id = SPINAND_MFR_ETRON,
+	.name = "Etron",
+	.chips = etron_spinand_table,
+	.nchips = ARRAY_SIZE(etron_spinand_table),
+	.ops = &etron_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6988956b8492..d7c0a0439652 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -260,6 +260,7 @@ struct spinand_manufacturer {
 };
 
 /* SPI NAND manufacturers */
+extern const struct spinand_manufacturer etron_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
