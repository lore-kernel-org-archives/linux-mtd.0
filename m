Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58AFC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lz56WvjE7dzvWEFJ08EBAR2XZ/kuzaVmwdgk8kMU8to=; b=jBhPssHCW8BTLG
	snv6JIp82uy4GLzdYFZPgCZVUk4JTUiwea1q3FwqhSwkne6Bso+xqw6ZYdTdYRVMHX21I2h4fM3rd
	4jkhV8mpFLrJOP71Qrd/5XbiQGt9pOdhjj6mUDuqxk9N7YgvgRa4glVyK+oh+AvSLyUJlRbXvWt2B
	EKiFLpMEuqFXh2SNpg1LgbzV5AXm0Zx3DJSnLAWUrBjlKwFllY3EBpNMgkBEW45kRXeZnYG+Glzbp
	V6NQyzevj3hurZcZciUR5wNC4zRLE14MmFfJA+GHulEbMyOV5rCWTkJ8yNvaok+pYHf/E+K4CARtV
	sk/gO3Y23sYWWr+QB4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7i8-007aU8-4R; Fri, 03 Jun 2022 13:51:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7i4-007aTB-NG
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 13:51:30 +0000
Received: by mail-wr1-x435.google.com with SMTP id x17so10496927wrg.6
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jun 2022 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GRMGCtp/pcXc6Jwt2ZQ73If4VD1oOQ82kJYe2MDP5KQ=;
        b=jvIOVUif0AV+NqGfZt0L7lidNlegTLuQqOYNUJ3eyXMo90nL1QGKgC6gdgT4tZhL1H
         /JBa8vdjyUwbuTHv1AX/MRswbsGsJ+01SZH9r50yZ9kS3Nrl9LiaeJNfJ9OwmxSfdkJG
         W5cQIajysk2v2DKBqBAevAST7farFy67Ty+/8qEbLHsytDrm4ssK1kimtHZhr15pTx3z
         RHiWU1GOFOScS+gBL5AuY2Qnd0kCcAOolgRnjE4kyljMW6/HwqS0PNFuFsySYrr0wo2e
         HcstGvkypMoT4/QfzS5TRtWMk2rhQS4+yFjoNUEs17jfulfUC+h7Am4Bnjc6SezRm9eU
         ybUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GRMGCtp/pcXc6Jwt2ZQ73If4VD1oOQ82kJYe2MDP5KQ=;
        b=8AnXtmNZPHUEr+mSGKR1qdYNyu6P6GfQv+ejWXSIFAl95gJnUj2K+XnNmCDgwx056/
         3UqQWMbeZh971NXH0SjgLQ1TwdqlQTzp+xtmSReJP3D8ibDy8R6stDeNWDCOV+lCp8HV
         OFXhBEk0/2h2XLQ24shJRdHXRBulSDPmwUpRTZD2yVDUPTRhS5aT9GhRAu8pXr+MacQF
         +jxhSY4HIb91x4/COPrTKwd5iXg9oJqUdliVMX6LyvPMlfCEK269Kze4B2IwISQNZv3B
         uepo7/+i3m5tgHnD7QGzpsjML89yd6Uj6OL/eOF0TikjByiJEdDyMnZoCNwOF/irjVfm
         aPNw==
X-Gm-Message-State: AOAM531PfIL6sOGNDfhIiqE+5UC+eNRdLD1qxsf4jtoQox4POiLgsVQR
	SG5Ns06ozrQxzi0ASup28AI=
X-Google-Smtp-Source: ABdhPJw1rhsFVYnBm3vBIFYi5Q9X0N+T8Mn7ZG2rpjGMr09qKUqKIhtClLTd4OTIv0+SykFwjlihEA==
X-Received: by 2002:adf:fccb:0:b0:213:bbe1:ba6c with SMTP id f11-20020adffccb000000b00213bbe1ba6cmr3050523wrs.252.1654264286162;
        Fri, 03 Jun 2022 06:51:26 -0700 (PDT)
Received: from localhost (92.40.203.126.threembb.co.uk. [92.40.203.126])
        by smtp.gmail.com with ESMTPSA id o10-20020adfeaca000000b0020c5253d8c2sm7345323wrn.14.2022.06.03.06.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 06:51:25 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: Add support for ATO25D1GA
Date: Fri,  3 Jun 2022 14:51:49 +0100
Message-Id: <20220603135149.11570-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_065128_803522_C63315C2 
X-CRM114-Status: GOOD (  18.90  )
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

Add support for the ATO25D1GA SPI NAND flash.

Datasheet:
- https://atta.szlcsc.com/upload/public/pdf/source/20191212/C469320_04599D67B03B078044EB65FF5AEDDDE9.pdf

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mtd/nand/spi/Makefile |  2 +-
 drivers/mtd/nand/spi/ato.c    | 86 +++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/core.c   |  1 +
 include/linux/mtd/spinand.h   |  1 +
 4 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/ato.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 80dabe6ff0f3..ae17c13d1abe 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
+spinand-objs := ato.o core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/ato.c b/drivers/mtd/nand/spi/ato.c
new file mode 100644
index 000000000000..82b377c06812
--- /dev/null
+++ b/drivers/mtd/nand/spi/ato.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Aidan MacDonald
+ *
+ * Author: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+
+#define SPINAND_MFR_ATO		0x9b
+
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
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
+
+static int ato25d1ga_ooblayout_ecc(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 8;
+	region->length = 8;
+	return 0;
+}
+
+static int ato25d1ga_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	if (section) {
+		region->offset = (16 * section);
+		region->length = 8;
+	} else {
+		/* first byte of section 0 is reserved for the BBM */
+		region->offset = 1;
+		region->length = 7;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops ato25d1ga_ooblayout = {
+	.ecc = ato25d1ga_ooblayout_ecc,
+	.free = ato25d1ga_ooblayout_free,
+};
+
+
+static const struct spinand_info ato_spinand_table[] = {
+	SPINAND_INFO("ATO25D1GA",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x12),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&ato25d1ga_ooblayout, NULL)),
+};
+
+static const struct spinand_manufacturer_ops ato_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer ato_spinand_manufacturer = {
+	.id = SPINAND_MFR_ATO,
+	.name = "ATO",
+	.chips = ato_spinand_table,
+	.nchips = ARRAY_SIZE(ato_spinand_table),
+	.ops = &ato_spinand_manuf_ops,
+};
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index d5b685d1605e..9d73910a7ae8 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -927,6 +927,7 @@ static const struct nand_ops spinand_ops = {
 };
 
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
+	&ato_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5584d3bb6556..6d3392a7edc6 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -260,6 +260,7 @@ struct spinand_manufacturer {
 };
 
 /* SPI NAND manufacturers */
+extern const struct spinand_manufacturer ato_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
