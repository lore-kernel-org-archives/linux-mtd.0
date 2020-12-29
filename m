Return-Path: <SRS0=fJla=GB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AF5C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Dec 2020 05:53:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54B53208D5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Dec 2020 05:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54B53208D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6RW99BbXyX1bqV7ZnGsU6NcrFUs/yBLrSZLqLs9g0RI=; b=SpcNILPKO17jOA+UjMayJ+ujp
	wmuZB4m7lW8ymvBVkycw9MagX6WuvQaTcjwPweIbNRvIjcuWeyRdvbaH+FdnYiItsA4Jqfciyf2Zl
	FUOb77TUaHZnDDNDnyzIw3Ev9OfROWTuNgIHTVzZ63cCGlZECuatfraEXPGj3k8u3+2fdh+e+EzDV
	m/qzSuzADggJegLF7fPkhhwqIRTazTi9156rrIoBRMi+RNqUM7cCgCRkVGpwbD41wijKq0FkPGdBV
	rmb3Yt/Z2FbnuKMIXAi32YGo1S1P8tuNf3QDlrwAItNo1s0BJ1Cy2ZT+oH9OzdVhBEsPRBJL4vc90
	tGuAiYWMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku7v1-0005p4-8c; Tue, 29 Dec 2020 05:51:39 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku7uy-0005oS-8V
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2020 05:51:37 +0000
Received: by mail-pg1-x52f.google.com with SMTP id i5so8648972pgo.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Dec 2020 21:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsY+1M4FJ0q/q5YlR2X9LFRy8FN/y5SCHLrVoOdMv3E=;
 b=G0M+6Hdg48ktCcJMT3GquHm2iHxZkmS7bPcWWauqhzk3x9hjHyzQ91bMShs431GyGF
 iUc9P6xXrFJtZTqvPOHe3FsQW/iR7Fn+hdczC0ghwN5wXqzUA+yE8zBp9u2+Ql89phMc
 LbNv2pm4qpWA+P+KS1EmhSwWzY5JQ6Od55GMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qsY+1M4FJ0q/q5YlR2X9LFRy8FN/y5SCHLrVoOdMv3E=;
 b=hC+PfOvPJXqbF9f3z5qCGDZ4Ock14LkbJVNzRkxajLeN86iDvMoTN8+H3kDVAF5rNH
 gqyZnJ+oZMlKrG6VGUr7RRMuXCUyTuNLopNIZqs9u93Y4BY9HoVsBVcwFB/6lQecHhXz
 X+fNR3+mjbnP+Q5pJPB/c9AcA9b5rrdrCaME9+LrfUvc7LdzoRfmH6K3MYfXE3gtEEzY
 Q1jHoZvH5tMifltLuAfgyv0X2OM62TiOrTSUXQIuTQ5hG6FND1T4Gzz4aX5Wys3sQAt6
 s2HjOyJJaXmTl2GAepj8WHB9zDOQotmpZtHJRxCH0BC8B/Ht3PS5XVQHIEqxhfWXRtZ4
 wxWQ==
X-Gm-Message-State: AOAM531j/041KVSHoenf7cGYWsYQMYsjP9crutsLivFX2+sKgQyDVZKR
 i3Q317DKJfuLNuzxR5ViZF70b+qzSJf/pQ==
X-Google-Smtp-Source: ABdhPJx3bOkV3xDOnF50Qnq0yVTsSGdFcATNAFITAie1uaeDMZgORmBwE3oTYLZGx9BkwcModmwp3Q==
X-Received: by 2002:a63:da58:: with SMTP id l24mr46264434pgj.178.1609221093884; 
 Mon, 28 Dec 2020 21:51:33 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id x23sm45041113pge.47.2020.12.28.21.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 21:51:33 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: spinand: add support for Foresee FS35ND01G
Date: Tue, 29 Dec 2020 14:50:59 +0900
Message-Id: <20201229055059.2255021-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20201229055059.2255021-1-daniel@0x0f.com>
References: <20201229055059.2255021-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_005136_372581_813B0CFE 
X-CRM114-Status: GOOD (  17.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for the Foresee FS35ND01G manufactured by Longsys.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/mtd/nand/spi/Makefile  |  2 +-
 drivers/mtd/nand/spi/core.c    |  1 +
 drivers/mtd/nand/spi/longsys.c | 45 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |  1 +
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/longsys.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 9662b9c1d5a9..1d6819022e43 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o
+spinand-objs := core.o gigadevice.o longsys.o macronix.o micron.o paragon.o toshiba.o winbond.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8ea545bb924d..bdc9cd45d232 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -856,6 +856,7 @@ static const struct nand_ops spinand_ops = {
 
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&gigadevice_spinand_manufacturer,
+	&longsys_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/longsys.c b/drivers/mtd/nand/spi/longsys.c
new file mode 100644
index 000000000000..f18271f8e9d2
--- /dev/null
+++ b/drivers/mtd/nand/spi/longsys.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Daniel Palmer <daniel@thingy.jp>
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_LONGSYS		0xcd
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants,
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
+static const struct spinand_info longsys_spinand_table[] = {
+	SPINAND_INFO("FS35ND01G",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xea, 0x11),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(NULL,
+				     NULL)),
+};
+
+static const struct spinand_manufacturer_ops longsys_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer longsys_spinand_manufacturer = {
+	.id = SPINAND_MFR_LONGSYS,
+	.name = "Longsys",
+	.chips = longsys_spinand_table,
+	.nchips = ARRAY_SIZE(longsys_spinand_table),
+	.ops = &longsys_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6bb92f26833e..8651e63a2f8a 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -239,6 +239,7 @@ struct spinand_manufacturer {
 
 /* SPI NAND manufacturers */
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
+extern const struct spinand_manufacturer longsys_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;
-- 
2.30.0.rc2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
