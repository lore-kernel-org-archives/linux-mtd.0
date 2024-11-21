Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BEAD75BA2
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 02:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INgtrapIw6Zo/g72QvH3yFDrGPVUxvCPY9Ws1Q7rQnQ=; b=Ak+u2RV5xT4Njw
	nqI/EhTWnJLp5kAY0VBMiFGJGwlvOKBLzWX4RgELnH6+BD+G/whi2FTJI+OcPguaE5msJpBnp4fIp
	1JF3ySkHG6bT+wlNJmngeVKdAiW9lytqfEyJ+JfenbD+Na45fuyEQKWqLju6IDLH1MDdQbkTfshrk
	RTU0kY1YOTC+JJkxg6wLt75voh3IgZ3P1oZjcL0cAYdEj7AYn5L0dykeOjEH9+KjxTMap0rl7hQBp
	3WdMN1PcGC1VTASzzZYNzMHP7uKh+Px4eRrh9IHbUKg1ycP7joRovvu99E/r2neeRQ26Z5/ftYqAE
	SPOKpNfzl/DT1SSVO+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwd9-0000000GZxP-0pEn;
	Thu, 21 Nov 2024 02:09:15 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwd7-0000000GZwV-10Oi
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 02:09:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7245a9d0e92so482498b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2024 18:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154952; x=1732759752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmuF46E7QZ73q+MnD9LRef4FBtBZcOQ1mSbJPyIeM2c=;
        b=NOtENre+44iDqP9yoR4yoE9QbjKAuKnKo8jsuFDipFoOGfKf87I/bn4CY7g8cDm8cj
         duLrLNnXDcNTJI4wyIx+FjIbOrK2c5r6tNzoe7Ey0/K/d10SB1aOhVW2gtvutHEDNEhI
         pCS5Gd60jFkSWKmf22IUt3J0yVOT/VegSTXglWmHZAXk/mjteIyspolUU/gEGmD63JQR
         uBRWpGFyXlqFvbjLKHAqxupWp5nGjD+nYQURZbf7QSGnxlrRhZa3TDpjR5YNZztDwlqP
         xNDJRbO0MzH8NEwCeqybmxn6Onupkj0UWTAfg2wfGHF8ApFnJWbaby6HZjTLyUGC1AYN
         OecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154952; x=1732759752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmuF46E7QZ73q+MnD9LRef4FBtBZcOQ1mSbJPyIeM2c=;
        b=w/HWStRWxIxbzbecyn4MoAHx7i78BLoKTwNfDMw8r33MyOq6N0Pw3AX+IA2MBIvw/f
         o90oI7kHlGdVzHOLPUZDWn/RhL4bYcuu2OIf38XG/nm7sEzEphqKEbMixIrNrnUkBy3D
         GzW96hSB7yGjAVhEbcTEVuxsbvxc8LSe9rhWu3I5EY293wu/guBl4AR0/MWNJmXxI7RA
         V17SHY8fyWCl7WrqWaVk72EEx18Rv9f3Cb1GZjO51jAYEczQJi01ax/UxQO0RXuTE1i8
         rO66fpdqZ76shvNTMxjyii/tsvjEpd9UUUwcqjrod/KPZsEeky1P4St6gpLPGstOQQXN
         d90g==
X-Gm-Message-State: AOJu0YwEaWuKgIzcFiL8StgnHKFhH47mWmIloH+CREd47C66f6Tcg9E7
	Y4g3qLZlG9az76B1JRppDS+VtlI+9CdDEBehACUlLzd3UqhoH12caTkf5Vxc
X-Google-Smtp-Source: AGHT+IGObvc9yxX4L92fiIy2fRVW6sjP5Icb04l9WtEKDhuYVuQFg3FHTsyvTnfaRjrm/8wYwZZuGw==
X-Received: by 2002:a17:902:e80c:b0:20c:a44b:3221 with SMTP id d9443c01a7336-2126b06938amr59400645ad.15.1732154952182;
        Wed, 20 Nov 2024 18:09:12 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-40-130.msd.spmode.ne.jp. [49.98.40.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212878a5d2dsm2388615ad.77.2024.11.20.18.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:09:11 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	kr.kim@skyhighmemory.com,
	zhi.feng@skyhighmemory.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 3/3] mtd: spinand: Add support for SkyHigh S35ML-3 family
Date: Thu, 21 Nov 2024 11:08:43 +0900
Message-Id: <90268cf05a6cb5a2b452d9e6813db24f53c0623f.1732152768.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732152768.git.Takahiro.Kuwano@infineon.com>
References: <cover.1732152768.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_180913_282695_4C5582E1 
X-CRM114-Status: GOOD (  20.21  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

SkyHigh S35ML01G300, S35ML01G301, S35ML02G300, and S35ML04G300 are 1Gb,
2Gb, and 4Gb SLC SPI NAND flash family. This family of devices has
on-die ECC which parity bits are stored to hidden area. In this family
the on-die ECC cannot be disabled so raw access needs to be prevented.

Link: https://www.skyhighmemory.com/download/SPI_S35ML01_04G3_002_19205.pdf?v=P
Co-developed-by: KR Kim <kr.kim@skyhighmemory.com>
Signed-off-by: KR Kim <kr.kim@skyhighmemory.com>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |   1 +
 drivers/mtd/nand/spi/skyhigh.c | 147 +++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   1 +
 4 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/skyhigh.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 19cc77288ebb..1e61ab21893a 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 spinand-objs := core.o alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
-spinand-objs += micron.o paragon.o toshiba.o winbond.o xtx.o
+spinand-objs += micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2ff3c32d46d3..77aa77ea4564 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1131,6 +1131,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
+	&skyhigh_spinand_manufacturer,
 	&toshiba_spinand_manufacturer,
 	&winbond_spinand_manufacturer,
 	&xtx_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
new file mode 100644
index 000000000000..8b32b74ff34b
--- /dev/null
+++ b/drivers/mtd/nand/spi/skyhigh.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 SkyHigh Memory Limited
+ *
+ * Author: Takahiro Kuwano <takahiro.kuwano@infineon.com>
+ * Co-Author: KR Kim <kr.kim@skyhighmemory.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_SKYHIGH			0x01
+#define SKYHIGH_STATUS_ECC_1TO2_BITFLIPS	(1 << 4)
+#define SKYHIGH_STATUS_ECC_3TO6_BITFLIPS	(2 << 4)
+#define SKYHIGH_STATUS_ECC_UNCOR_ERROR		(3 << 4)
+#define SKYHIGH_CONFIG_PROTECT_EN		BIT(1)
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
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
+static int skyhigh_spinand_ooblayout_ecc(struct mtd_info *mtd, int section,
+					 struct mtd_oob_region *region)
+{
+	/* ECC bytes are stored in hidden area. */
+	return -ERANGE;
+}
+
+static int skyhigh_spinand_ooblayout_free(struct mtd_info *mtd, int section,
+					  struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* ECC bytes are stored in hidden area. Reserve 2 bytes for the BBM. */
+	region->offset = 2;
+	region->length = mtd->oobsize - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops skyhigh_spinand_ooblayout = {
+	.ecc = skyhigh_spinand_ooblayout_ecc,
+	.free = skyhigh_spinand_ooblayout_free,
+};
+
+static int skyhigh_spinand_ecc_get_status(struct spinand_device *spinand,
+					  u8 status)
+{
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case SKYHIGH_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case SKYHIGH_STATUS_ECC_1TO2_BITFLIPS:
+		return 2;
+
+	case SKYHIGH_STATUS_ECC_3TO6_BITFLIPS:
+		return 6;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info skyhigh_spinand_table[] = {
+	SPINAND_INFO("S35ML01G301",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x15),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(6, 32),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
+				     skyhigh_spinand_ecc_get_status)),
+	SPINAND_INFO("S35ML01G300",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x14),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(6, 32),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
+				     skyhigh_spinand_ecc_get_status)),
+	SPINAND_INFO("S35ML02G300",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(6, 32),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
+				     skyhigh_spinand_ecc_get_status)),
+	SPINAND_INFO("S35ML04G300",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35),
+		     NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 2, 1, 1),
+		     NAND_ECCREQ(6, 32),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
+				     skyhigh_spinand_ecc_get_status)),
+};
+
+static int skyhigh_spinand_init(struct spinand_device *spinand)
+{
+	/*
+	 * Config_Protect_En (bit 1 in Block Lock register) must be set to 1
+	 * before writing other bits. Do it here before core unlocks all blocks
+	 * by writing block protection bits.
+	 */
+	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK,
+				    SKYHIGH_CONFIG_PROTECT_EN);
+}
+
+static const struct spinand_manufacturer_ops skyhigh_spinand_manuf_ops = {
+	.init = skyhigh_spinand_init,
+};
+
+const struct spinand_manufacturer skyhigh_spinand_manufacturer = {
+	.id = SPINAND_MFR_SKYHIGH,
+	.name = "SkyHigh",
+	.chips = skyhigh_spinand_table,
+	.nchips = ARRAY_SIZE(skyhigh_spinand_table),
+	.ops = &skyhigh_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5cf11005b41a..cbbcd44ac225 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -268,6 +268,7 @@ extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;
+extern const struct spinand_manufacturer skyhigh_spinand_manufacturer;
 extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
 extern const struct spinand_manufacturer winbond_spinand_manufacturer;
 extern const struct spinand_manufacturer xtx_spinand_manufacturer;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
