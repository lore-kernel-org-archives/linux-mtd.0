Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02471D1CDC6
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Dec 2025 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mPtp7xOC+LML67cHx0NNcWJhT/HHa6+fscJHD+yZR8Q=; b=ootccxwCyGzvw2
	yG2U5H3z+s8qYGRNjRI5qteMEKJ3o4+jzFTc+kpV4rXBvdyCy8K32umsZ1DL8ZgDAhii3047jYU6C
	l/6mWQApAN6rDTe8lOw7cRVRkgIGrncU2txk7S8dtiWRyzrz+otGyjakmSmD6VLfEmlQCjISyOGdQ
	Y7NGiXUMDZKmhFaV2Xvi0RAmup9O+IdSuNgiNR68kRfMcsRGnX8c2FqQfoMuN4eHeZLYyQYOqAlYO
	FfpKztdMGZefrwmFDlaCgYNdFgSc38NC4535g/BLxTRTy7CVQScdLnFtqLWw2rkMhRwAbDIZCSWJU
	WDY+y+5br9DibNc3rWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrxb-0000000DwD9-1sGq;
	Tue, 09 Dec 2025 07:16:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrxY-0000000DwCZ-2SCr
	for linux-mtd@lists.infradead.org;
	Tue, 09 Dec 2025 07:16:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2981f9ce15cso71633365ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2025 23:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765264592; x=1765869392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5RED2CAsyuQW239qmVORCgxiFQVUz8czLslu+op8xjU=;
        b=lOpLAIQPBTy7tGTYqXEA0myuGyjr+t8R5tOKNIZaVkhyXYOT6EBFkuN2bZslYq16Gy
         xOOXt3bne/ojdcEAqv/WDobL2Alaa6n7vB2WrrAiWM/+cYvZ2N7dcNUJiimHsrG+gXoT
         ZoxKxLMykv6tnqRB3FHZ5fjJKH1eVfED+wrKDtUOck7GMMYi9n/779kpJe4wO8+8uws4
         Xn7Cp2eONdcrscf8B1la37fEIOOFkfsXhm2iUECZj1ZcQPVYgleWb3lztUeKoYnSzuVg
         flgE+pEDxY1nN3k5LjKUB3/KeS6uGF/uDSofL4ud3rP2ZGkM8rNJ1AXnz98yuSFfvFEx
         QTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765264592; x=1765869392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RED2CAsyuQW239qmVORCgxiFQVUz8czLslu+op8xjU=;
        b=maf/1RcQh9z6XWGh3hrVaC8KncVj391CW65JMAlo61lAxl+xK28ZmC4TylnS29PUFd
         06AZTm1lpKxtkbQ8yUjGpGfryJ8a/FOrLhOtN5gkbnXAbZm9/Wn78whl+8Ma9M0gLwGx
         mjbyrsBwfbZR7IfSfvDOtwVJjI0pp1IxEccbRpNfhnK/rC9ajf8yqqXFRHNT5ymeNw62
         n84knQrwUH0/2NrC0Y4HwgpMybEmfFpjK+Ax4vI1S1Rz0VPSroVEXb0TM+NiiR89qPpK
         PPD8w0AnZmPcpGc8QFD3afxA5qN9poLrqZ9K2RbuTW/UEkxTw1Etxit4i9iQQgMmCt33
         5VsA==
X-Forwarded-Encrypted: i=1; AJvYcCXCaA7bnJu4DQPXx21zXMX2vXeWHcMorqkLwI95i6KbSE8czgTWFwbNz3MmHQjTGHALR9K6N2UPOxc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHEacoO5ClGTLCrolFq0cGnvnkbGeQSitFkUqAlElYZeLo0+J4
	PY6isyyzGSGO4Rh/aWygXGTRvn99l+NdhEaahZB7zeDip1cF76BqZvbQmKdou+M0
X-Gm-Gg: AY/fxX7mq3tKvlDDoTNt8twUQgQalyuuR7YFwfy6/8FCeVh39973w1zEkHAa1d5Podg
	g64om2bIu0CvzrqP80A05WhiP47sjrRuZJqYXoSGxF0oSSAAxkP1uTi7DIIAaM3az7UCVMZw9bX
	soy+ijBlxZiZTzYNHRsxUWk/gEepSnKFRNYZvL9Mh3hSWlhg984QSfB6x4hLFru5ruDYdpWl07K
	3VW74B1ZmmSQYi4sZEYeAiROqyzK2LBFlz62gGdGLbXfbpf05jym9vRQvX9vScF9aqNCUid25PG
	ZEqXHzEcAqhQkDR7+6Og6mRkvzWFe0ZyaGi7JOKkBRcN67Hd9gUFxa+mTFOMhh5/0OyIuzAJrJI
	/RRNA+nOieH14YtKbCtgeJJah9rC/8jbNZa6CxnRoo900/JJF1ohvzMVA3dxoKRA9wXe4ahjBMS
	PgKJd1K8wmMxO/OI8mJfhA
X-Google-Smtp-Source: AGHT+IFWaD3cFLUC/FQPUtDsgSigxggTA554xMHc8MDDs9pgERSGGEmc2ncHBgtV9o4wNM4ILv9zmw==
X-Received: by 2002:a17:902:da2d:b0:297:cf96:45bd with SMTP id d9443c01a7336-29df547485fmr85256685ad.19.1765264591632;
        Mon, 08 Dec 2025 23:16:31 -0800 (PST)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f01csm142776245ad.48.2025.12.08.23.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 23:16:31 -0800 (PST)
From: Ahmed Naseef <naseefkm@gmail.com>
To: 
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
Date: Tue,  9 Dec 2025 11:16:02 +0400
Message-Id: <20251209071604.36482-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_231632_633682_F08AFD2B 
X-CRM114-Status: GOOD (  20.51  )
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

Add support for Dosilicon DS35Q1GA (3.3V) and DS35M1GA (1.8V) SPI NAND.

These are 1Gbit (128MB) devices with:
  - 2048 byte pages + 64 byte OOB
  - 64 pages per block, 1024 blocks
  - On-die 4-bit ECC per 512 byte sector

The 64-byte OOB area is divided into 4 segments of 16 bytes, with each
segment containing 8 bytes of user data (M2+M1) and 8 bytes of ECC
parity (R1). This provides 30 bytes of usable OOB space after reserving
2 bytes for the bad block marker.

Tested on Genexis Platinum 4410 (EcoNet EN751221) by writing known
patterns to OOB and verifying ECC parity placement in R1 regions.

Datasheet:
  https://www.dosilicon.com/resources/SPI%20NAND/DS35X1GAXXX_rev08.pdf

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
Changes in v2:
  - Rebased on rc1 (updated SPINAND_OP_VARIANTS macros)
  - Fixed OOB layout based on hardware testing:
    - ECC regions: bytes 8-15, 24-31, 40-47, 56-63 (32 bytes total)
    - Free regions: bytes 2-7, 16-23, 32-39, 48-55 (30 bytes total)
    - Updated commit message
---
 drivers/mtd/nand/spi/Makefile    |  4 +-
 drivers/mtd/nand/spi/core.c      |  1 +
 drivers/mtd/nand/spi/dosilicon.c | 91 ++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h      |  1 +
 4 files changed, 95 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/dosilicon.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 6d3d203df..a47bd22cd 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 spinand-objs := core.o otp.o
-spinand-objs += alliancememory.o ato.o esmt.o fmsh.o foresee.o gigadevice.o macronix.o
-spinand-objs += micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
+spinand-objs += alliancememory.o ato.o dosilicon.o esmt.o fmsh.o foresee.o gigadevice.o
+spinand-objs += macronix.o micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index d20728657..0346916b0 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1227,6 +1227,7 @@ static const struct nand_ops spinand_ops = {
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&alliancememory_spinand_manufacturer,
 	&ato_spinand_manufacturer,
+	&dosilicon_spinand_manufacturer,
 	&esmt_8c_spinand_manufacturer,
 	&esmt_c8_spinand_manufacturer,
 	&fmsh_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/dosilicon.c b/drivers/mtd/nand/spi/dosilicon.c
new file mode 100644
index 000000000..f99899866
--- /dev/null
+++ b/drivers/mtd/nand/spi/dosilicon.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Ahmed Naseef <naseefkm@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_DOSILICON        0xE5
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants,
+		SPINAND_PROG_LOAD_1S_1S_4S_OP(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
+
+static int ds35xx_ooblayout_ecc(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = 8 + (section * 16);
+	region->length = 8;
+
+	return 0;
+}
+
+static int ds35xx_ooblayout_free(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	if (section == 0) {
+		/* reserve 2 bytes for the BBM */
+		region->offset = 2;
+		region->length = 6;
+	} else {
+		region->offset = section * 16;
+		region->length = 8;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops ds35xx_ooblayout = {
+	.ecc = ds35xx_ooblayout_ecc,
+	.free = ds35xx_ooblayout_free,
+};
+
+static const struct spinand_info dosilicon_spinand_table[] = {
+	SPINAND_INFO("DS35Q1GA",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x71),
+		NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		NAND_ECCREQ(4, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xx_ooblayout, NULL)),
+	SPINAND_INFO("DS35M1GA",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x21),
+		NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		NAND_ECCREQ(4, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xx_ooblayout, NULL)),
+};
+
+static const struct spinand_manufacturer_ops dosilicon_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer dosilicon_spinand_manufacturer = {
+	.id = SPINAND_MFR_DOSILICON,
+	.name = "Dosilicon",
+	.chips = dosilicon_spinand_table,
+	.nchips = ARRAY_SIZE(dosilicon_spinand_table),
+	.ops = &dosilicon_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index ce76f5c63..c50a43b44 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -354,6 +354,7 @@ struct spinand_manufacturer {
 /* SPI NAND manufacturers */
 extern const struct spinand_manufacturer alliancememory_spinand_manufacturer;
 extern const struct spinand_manufacturer ato_spinand_manufacturer;
+extern const struct spinand_manufacturer dosilicon_spinand_manufacturer;
 extern const struct spinand_manufacturer esmt_8c_spinand_manufacturer;
 extern const struct spinand_manufacturer esmt_c8_spinand_manufacturer;
 extern const struct spinand_manufacturer fmsh_spinand_manufacturer;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
