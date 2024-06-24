Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE4AC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2024 06:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cKR9c0/wQSZ62BeDs3jFISEN+H1JD5dar1YB2xf+q10=; b=MbHNIYsTKznRIs
	i2jV4pGqswhQbpDPhqCUpjS+/myvuDJsKsjcmH7BbU/yIgpME3qfr9TRjPxQRJe/TfoJwvsAQEk8I
	DXBPtBOrKlZ8Zv9usxCu5uSDW7hB1deWjU07KJNg4q681g9jNRAV2ySWKjmhrPNNFrTZtQaVUIO2Q
	YamZcp8wtSC7qDG9ltKmRYImWws5RRfWOkoouXiCVLz4w3js399u/5UQ9Fsocj2MWOmmT4nboRQ74
	dn9sklZZSkeBBKfzAJY3vsW5yiHfWYe864mxbOVGP9W17kzb6v9PXP8nL0eZdRotonItRt5YVfup2
	ePbyKGdzE1+gZjrxLXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcx1-0000000FhAq-0kMZ;
	Mon, 24 Jun 2024 06:13:15 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcwx-0000000Fh9L-40E4
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jun 2024 06:13:13 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ec52fbb50bso19334311fa.2
        for <linux-mtd@lists.infradead.org>; Sun, 23 Jun 2024 23:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719209589; x=1719814389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/qRlD3FVKL5iXIy13BpU+Kwpwg+2SoBUqkyXN31Zr4=;
        b=Oley6BEx+1748yS2PkAeU+7h/bkBK4oUeFReo8EXq8m6iDoi0JjueZViUSMzjBTr7G
         ZJvOrem8l+QIGN5JehiHLkK6VudnRrWpRvye8WrLOj1AhM8PwUtnIywBtU6ry0lSLRwK
         0TotRsYQbrTEkk+nNtHWFZ6IitPIUFJgZ3emT//z4+czNa6gxO03i+giQIaTBUhxaqGn
         0Lom27c+tztMsk7qTRQAS5kOm7wTr7hXpVAQ1LOeh7rMuBBxB5nXMCyexyJw0r+qu8Tt
         U2jjofFv79ptIo3YEkVhr0H2rbyreqwKOiYiv5xvoH72cCKGDKTlAw4jnw83xP6WgCe1
         OO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719209589; x=1719814389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/qRlD3FVKL5iXIy13BpU+Kwpwg+2SoBUqkyXN31Zr4=;
        b=Q5JnUsJEA/sSuggmZmAFmC/GtUgF/tnCL5TLzsFnVbj5JSIoOqDYZAF8OpTTfnh8mJ
         LN6qwnukk8KdUx1uGgiao8M6q9BG4PY2vKrHyzwyTNXA6m63KtFs02oKsnzui3BP7o6G
         x2IK3AVjAizMrnRCL7QNyhbOzd9lLI1filCLobtNVZ2MgVIVRrHdnWXHa83+7Dg82zlV
         ZdpGYaz7L+WP7SEyiq5Dnek3TuWYrSZWSOqIFDpMWXRvreKNEOphiwBJ05iJMPYo/e+T
         rKwtInGtRpr+JbWesskXTvdVDi+Von4Z79qXr5boD9XSmLRtVD2Zu1m1n9yOhgV7SriK
         8/5A==
X-Forwarded-Encrypted: i=1; AJvYcCU1oi81EAl63MOGcSYl8IgK6k12S5vC8tX6VedQpQMwFLw9vOhftbEhfp8/mbdIkgG38LYrA0hWVj8I871c4VxQfBtuUd9CIXjoKYl63A==
X-Gm-Message-State: AOJu0Ywo/HgMXighbFzUBwh+AFfFGXmmNDzBF+mH0rtB95u6ne1muX23
	IzzYz+GUnHk0JmBGEEGC6tOMsjfHMTZCG7qH2egejTh2e5OM44BP
X-Google-Smtp-Source: AGHT+IFl2QVb5+Ml2dJdo6naTCB0whKifzTd6jKoUynZMwmvr+54Ah3ay9voWlVFhwkF/YCas3qXBA==
X-Received: by 2002:a2e:8416:0:b0:2ec:500c:b2db with SMTP id 38308e7fff4ca-2ec5b37a4bfmr18655871fa.22.1719209588710;
        Sun, 23 Jun 2024 23:13:08 -0700 (PDT)
Received: from linaro-pc.lan (40.37.82.80.dsl-dynamic.vsi.ru. [80.82.37.40])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5d2c3446sm4011481fa.38.2024.06.23.23.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 23:13:08 -0700 (PDT)
From: Maxim Anisimov <maxim.anisimov.ua@gmail.com>
To: 
Cc: maxim.anisimov.ua@gmail.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Michael Walle <michael@walle.cc>,
	Mark Brown <broonie@kernel.org>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spinand: Add support for HeYangTek HYF1GQ4UDACAE
Date: Mon, 24 Jun 2024 09:12:17 +0300
Message-ID: <20240624061246.5292-1-maxim.anisimov.ua@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_231312_088963_7C32AB1D 
X-CRM114-Status: GOOD (  18.83  )
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

Add Support HeYangTek HYF1GQ4UDACAE SPI NAND.

Datasheet Link:
- https://www.heyangtek.cn/previewfile.jsp?file=ABUIABA9GAAgwsvRnwYo-eDpsgc

Signed-off-by: Maxim Anisimov <maxim.anisimov.ua@gmail.com>
---
 drivers/mtd/nand/spi/Makefile    |   4 +-
 drivers/mtd/nand/spi/core.c      |   1 +
 drivers/mtd/nand/spi/heyangtek.c | 112 +++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h      |   1 +
 4 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/heyangtek.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 19cc77288ebb..69d95fbdd0ce 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
-spinand-objs += micron.o paragon.o toshiba.o winbond.o xtx.o
+spinand-objs := core.o alliancememory.o ato.o esmt.o foresee.o gigadevice.o heyangtek.o
+spinand-objs += macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e0b6715e5dfe..45795e5f1e49 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -942,6 +942,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&esmt_c8_spinand_manufacturer,
 	&foresee_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
+	&heyangtek_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/heyangtek.c b/drivers/mtd/nand/spi/heyangtek.c
new file mode 100644
index 000000000000..d4a5dbca40fb
--- /dev/null
+++ b/drivers/mtd/nand/spi/heyangtek.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author:
+ *      Andrey Zolotarev <andrey.zolotarev@keenetic.com> - the main driver logic
+ *      Maxim Anisimov <maxim.anisimov.ua@gmail.com> - adaptation to mainline linux kernel
+ *
+ * Based on:
+ *      https://github.com/keenetic/kernel-49/commit/bacade569fb12bc0ad31ba09bca9b890118fbca7
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_HEYANGTEK		0xC9
+
+#define STATUS_ECC_LIMIT_BITFLIPS	(3 << 4)
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
+static int hyfxgq4uda_ooblayout_ecc(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = section * 16 + 8;
+	region->length = 8;
+
+	return 0;
+}
+
+static int hyfxgq4uda_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	/* ECC-protected user meta-data */
+	region->offset = section * 16 + 4;
+	region->length = 4;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops hyfxgq4uda_ooblayout = {
+	.ecc = hyfxgq4uda_ooblayout_ecc,
+	.free = hyfxgq4uda_ooblayout_free,
+};
+
+static int hyfxgq4uda_ecc_get_status(struct spinand_device *spinand,
+				     u8 status)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case STATUS_ECC_HAS_BITFLIPS:
+		return nanddev_get_ecc_conf(nand)->strength >> 1;
+
+	case STATUS_ECC_LIMIT_BITFLIPS:
+		return nanddev_get_ecc_conf(nand)->strength;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info heyangtek_spinand_table[] = {
+	SPINAND_INFO("HYF1GQ4UDACAE",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x21),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&hyfxgq4uda_ooblayout,
+				     hyfxgq4uda_ecc_get_status)),
+};
+
+static const struct spinand_manufacturer_ops heyangtek_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer heyangtek_spinand_manufacturer = {
+	.id = SPINAND_MFR_HEYANGTEK,
+	.name = "HeYangTek",
+	.chips = heyangtek_spinand_table,
+	.nchips = ARRAY_SIZE(heyangtek_spinand_table),
+	.ops = &heyangtek_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5c19ead60499..06ee35a27e3b 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -265,6 +265,7 @@ extern const struct spinand_manufacturer ato_spinand_manufacturer;
 extern const struct spinand_manufacturer esmt_c8_spinand_manufacturer;
 extern const struct spinand_manufacturer foresee_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
+extern const struct spinand_manufacturer heyangtek_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;
-- 
2.45.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
