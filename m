Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4012BD1CDC6
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Dec 2025 15:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aVzwTLXqRuvEr7qpwtiEZx8KGGgMfzdrR55uaWnW1ko=; b=AjnE7K5bLW2XNW
	mAXW0oWlma8RyvZSukREMDzVW61+gyJny2T5KqqKTn8JFJgTZjrQ603ZB5TLhitFoNZ8wLKHQNEkx
	yBfJiQGHy6FQsJP6ZwF/S5far+llT2flj9f8pHPmRzAdS9x366wnCahSz1XImzPSDsHLb9IaoO2p+
	5kZawV0jJCw720Un2//StGftK2UJNtzsoYJuZ/OfeNVgPcmuiVtjWQGcM0kqlKNX+j9d5ryOfTbEM
	KXE2j/khnujDsIsuHkgTAqJicY+7Q3qQHp3R2D2Uvnf4dW+XPFGyRJB/fOLLoYpX/fUGgs00PKdo4
	aVMe4vUouv2b4T9GlnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSGUN-0000000C2cb-3p9O;
	Sun, 07 Dec 2025 15:15:55 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSGUK-0000000C2bn-0gTU
	for linux-mtd@lists.infradead.org;
	Sun, 07 Dec 2025 15:15:53 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so3921753a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 07 Dec 2025 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765120551; x=1765725351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AW/SIHpTu5saVqUrGNp93/YDlgqpa/dxJaNUAEC/8LU=;
        b=Y5gfE4nFiyza/VUYs+OwAV6uxrI7Ql6SKk/NV6hXaOQsk/T14TeKRnCMqeRp3nm2/E
         GHVcnLeW3txRJbM/JyH98QUUkWpRM2NebbAXDGRP/Gwnh5eXbefQqdmF65T3SxfgSrAg
         UUx+vJrzV4LScXbcdtLJjYe9FQb50UXlVWH4XxsxWm75BkzK6aYp8Nm8s96MnfQaLUjQ
         QSAtkFJzYxQFC7ptl9+bbwFuilucYsX63qaaPQzNi+c3vx7NPvO92deKJAKURrVoC/Si
         i8hSmPWxGBblYb8zk4T1IT1OE912Olw4w56K+yAauRtX/amYHBLXpFHrxqAh1wWM33sW
         BWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765120551; x=1765725351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AW/SIHpTu5saVqUrGNp93/YDlgqpa/dxJaNUAEC/8LU=;
        b=RTtOPQeKJwyRmKr7b1AOV8DVNNCvd3c+OVrwUZxwe/cKnRy77w/IAqcSSzKTH292wt
         mYw+VWRshuKx5wAGlZYClaAarxK6l5Pe9SPDiPj2Q2hrmgrZq5oraxYd4yAHKMGvEpqB
         Lb3OAWE6CXoM8i618kmBcFiRuMsWuNXREHyaYqLIAy5ChpQXr0Og+IZdCfCEnIE2DVNV
         /mKD4mz2OotmAbSyxQqVqTp6FyMZh8SPE5DpB02By1qtUNL/ZkjqpNBuBVGAcmC79I3/
         hXVp14TP8IUlV0b2aLcoL3WcnWiAkoP871FO8pbHFzncUHN2yoYU9goOY8/zGvKBbl6i
         iIqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXufZoxjgO9Yh6eHy/GiALTG6coflvPwlSA0J5zYTAXJUXU4TifG50iHRblX1JVHJyaPebt2extu/w=@lists.infradead.org
X-Gm-Message-State: AOJu0YwO88XryhFHCvDk7/OEaURdeeOwB0XMzZ/4D6/OAtUNEbc+uiYY
	sWNrwtrCtWEUWHpJ/zDjxLMdVdHlGVjMT/1dxlY2oKcdHM7bTg9X3YC2
X-Gm-Gg: ASbGnct1jKVTuGzrfaZ+klXotnyqF1eA78QEWpJejYOuqvaNl1szuSpktqO6itRtb+f
	2lAcjUmSng4KO2ZQWVQmMWRMHGURS9qoMmbr51BTeBo+gEW1lbgGuhwDwQjka1fQvMAwXh9UOGK
	w7JQiCF96p3azD7b4BFMiSQL/jxcpjHillzshL2ZL0ihcXdvsPnLEBAYBs7DRV26nnfAMxtVtHZ
	FEWuVeBk3dlzT8dEIMdZNLDvsoSLpXMoawnbalFOR0fwNZhJa2F6M7MFodaqqT4Aa9v5ijXadlP
	9SgM//y68RB8Y7dl+h4hf8HwGRZTL0KGwuHJYnlTEIvnTgeMyhUFeKOY3LbaII36PHl+yDUvYK2
	PEs0ii6CDwqjYeerxPDUCZFHgAyKzO0lh7lWmmw5wflppr0OOe2cZ2Cyf7nVcoaTlioYx0Je2jU
	ajfbl9dkym3I6ymuu7DF/u
X-Google-Smtp-Source: AGHT+IGXwjXVzHDGJyzEJ4hoUe5aKOA+cQUse3BL/DgwoE4uYyqJXGEPhYE60wRerGH3VHaI561pig==
X-Received: by 2002:a17:90b:28c5:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-349a24e47d3mr4003674a91.13.1765120550830;
        Sun, 07 Dec 2025 07:15:50 -0800 (PST)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912896983sm5951923a91.0.2025.12.07.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 07:15:50 -0800 (PST)
From: Ahmed Naseef <naseefkm@gmail.com>
To: 
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
Date: Sun,  7 Dec 2025 19:09:20 +0400
Message-Id: <20251207150923.86328-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_071552_246426_215E1B23 
X-CRM114-Status: GOOD (  17.07  )
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

Add support for Dosilicon DS35Q1GA and DS35M1GA SPI NAND.
Datasheet:
 https://www.dosilicon.com/resources/SPI%20NAND/DS35X1GAXXX_rev08.pdf

Tested on Genexis Platinum 4410 (EcoNet EN751221).

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/mtd/nand/spi/Makefile    |  4 +-
 drivers/mtd/nand/spi/core.c      |  1 +
 drivers/mtd/nand/spi/dosilicon.c | 77 ++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h      |  1 +
 4 files changed, 81 insertions(+), 2 deletions(-)
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
index 000000000..95ec27a1a
--- /dev/null
+++ b/drivers/mtd/nand/spi/dosilicon.c
@@ -0,0 +1,77 @@
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
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
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
+static int ds35xx_ooblayout_ecc(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *region)
+{
+	return -ERANGE;
+}
+
+static int ds35xx_ooblayout_free(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+	region->offset = 2;
+	region->length = 62;
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
