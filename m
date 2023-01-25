Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D460EC27C76
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sVysDXS9dAIp1PeRkh3JUiPL8hMo+KccJfreGmzwRxI=; b=J0JJAEtznNKLpV
	8EfGeu0lrwKGi9H8CBgN/cwYs35JnL9/6+aheh1/Hh0r/5YtQs04Ek10nXj1zcnGoC10uy0NwZYx4
	CAnaoz3hJuMUsKO2aqeL+AwAXs+Lfc8gAnIKfSQ84dynMKg2L1FkAjmABBVaLMJjuHcm45ME4ZVZh
	vDF9cCo7t3evyUjiExDqZvLVIDLSbqMT+UIqgNzrR216aJoNoBNAhfHEnkE6sRwZxJYURYF3Qew/8
	3/h3sQQQfxzHLaqVwKA//97/gdWaQVmknd8bcQrQ+JPZR7uPizHHuB7AxOQv/MhE65/Y3Ym9vOhud
	xK0GY4CcyNVvwE+bnvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKen8-007HZn-Aq; Wed, 25 Jan 2023 12:22:14 +0000
Received: from www.zeus06.de ([194.117.254.36] helo=mail.zeus06.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKen5-007HZM-H9
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2023 12:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=from:to
	:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=k1; bh=TaN1tGi1yJJFSple8nmh3EMrFEy
	CSnCM9z4tOm8ttBA=; b=YGezG1NxW0Lk7VKe6Kxf2rwguIgLOrfU5yJXrXOnwJ0
	bQXsO0WIx0/THGSPt4SQWG8LSNDz/G1g2tRLM+CGSxQMpsMHNTco2hQvKJCK1Hg3
	APyZYOV4yy1qMzXDzJb95mm+lz5+94i3PNcuDUKMn789ZoGWEgv1XIJWvPd4wIbg
	=
Received: (qmail 4151050 invoked from network); 25 Jan 2023 13:22:08 +0100
Received: by mail.zeus06.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2023 13:22:08 +0100
X-UD-Smtp-Session: l3s6476p2@XBUurhXzGH3CtAHJ
From: Mario Kicherer <dev@kicherer.org>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Mario Kicherer <dev@kicherer.org>,
	Dhruva Gole <d-gole@ti.com>
Subject: [PATCH v3] mtd: spinand: Add support for AllianceMemory AS5F34G04SND
Date: Wed, 25 Jan 2023 13:22:04 +0100
Message-Id: <20230125122204.3057843-1-dev@kicherer.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_042211_865665_8440D4FD 
X-CRM114-Status: GOOD (  17.70  )
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
 drivers/mtd/nand/spi/Makefile         |   2 +-
 drivers/mtd/nand/spi/alliancememory.c | 110 ++++++++++++++++++++++++++
 drivers/mtd/nand/spi/core.c           |   1 +
 include/linux/mtd/spinand.h           |   1 +
 4 files changed, 113 insertions(+), 1 deletion(-)
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
index 000000000000..3430ac4d18fc
--- /dev/null
+++ b/drivers/mtd/nand/spi/alliancememory.c
@@ -0,0 +1,110 @@
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
+#define AM_STATUS_ECC_1_CORRECTED	(1 << 4)
+#define AM_STATUS_ECC_1_DETECTED	(2 << 4)
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
+static int as5f34g04snd_ooblayout_ecc(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
+{
+	region->offset = 0x48;
+	region->length = 0x38;
+
+	return 0;
+}
+
+static int as5f34g04snd_ooblayout_free(struct mtd_info *mtd, int section,
+				       struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/*
+	 * It is unclear how many bytes are used for the bad block marker. We
+	 * reserve the common two bytes here.
+	 */
+
+	region->offset = 2;
+	region->length = 0x48 - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops as5f34g04snd_ooblayout = {
+	.ecc = as5f34g04snd_ooblayout_ecc,
+	.free = as5f34g04snd_ooblayout_free,
+};
+
+static int am_ecc_get_status(struct spinand_device *spinand, u8 status)
+{
+	switch (status & AM_STATUS_ECC_BITMASK) {
+	case AM_STATUS_ECC_NONE_DETECTED:
+		return 0;
+
+	case AM_STATUS_ECC_1_CORRECTED:
+		return 1;
+
+	case AM_STATUS_ECC_MAX_CORRECTED:
+		return 8;
+
+	case AM_STATUS_ECC_1_DETECTED:
+		return -EBADMSG;
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
+		     SPINAND_ECCINFO(&as5f34g04snd_ooblayout,
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
