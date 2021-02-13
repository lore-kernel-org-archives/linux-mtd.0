Return-Path: <SRS0=76BL=HP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB14C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 10:00:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C64164E3D
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 10:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C64164E3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bv2td21JoN66bd3fKXaJGsaLqHnFSypTevZQahhH3b8=; b=v6UCJR7/SKkt8FXiO2Y3qBpqzP
	Vqb2DMlKU+Zt4RZZmpP8wVOpetcX4O7sb0vrsfCEgEUMppaJFnvLbczVEbDHY8rEUU/NVopWevjKq
	/LRkKpnxFjp015CZpuDllq1alpWAVRt+1WHjMHUrGAZRzrOdmr4rSVle2jEtgyyoeAj51tb3Ywrj7
	LnlgJr8GvZt9F1khtmO6OIRrDgJjaXQ1UmTQFsCqvdlCklwtALwcL7aeCltIsKalaVN4Jj+s4S1op
	QbssHhFzsql0RcQO1xXuv9KGAgPqeQkh2DHNJ2rYwxHQeg1W9r9r9wxQC8XWQpEWWLlvamAr1zOko
	uRGPiJkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lArhz-0000UV-Ps; Sat, 13 Feb 2021 09:59:23 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lArhx-0000U5-0k
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 09:59:22 +0000
Received: by mail-pf1-x42f.google.com with SMTP id c11so1111819pfp.10
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 01:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EPmH+KTYm0sc7J3KXd8oTGxPlEtQqqPszkJhsyp7hKY=;
 b=hFTDclujnvaXkydcUpKIBczF/l/tx9w0xGamyo22UcWS5PXDzPjORQlt9qfq53D7Om
 Zzot57l261/X5D6IDlKO7CipTXRRsPdvQGbNyuR9AaYQE+sgu1S+G5R9pScuOg4AD4xP
 ZUEYApfOkJBEC+hgZ/QVKcj3MQlSga6YPYS1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EPmH+KTYm0sc7J3KXd8oTGxPlEtQqqPszkJhsyp7hKY=;
 b=fZijMrqTPTDgDHe5wxooUuhcv9amLYVS3b05jw9esxLWhITSDDhZHa7rpbwgVTCEhr
 2e+KIx2ZOm0scBNXD2PEVqpXC9vnpIWNrRVMpxLraMV9h5gKFdVTK5aVoPNVEbwno4jG
 5QETwQdR+g/bly/K9mUGYk0JVQ6MMq5Ih+bLz8NCFvFcFafmugwhYCarIgAEzPyOPiDU
 u5kJweyX09yinGPJFmTcwVvVLxkTj7ror8wgi7jT5Tk4h1/DswZOxLSzZlYF3QHnkMa4
 GLIvmrkFJJJ5ocC0fLMyqA6oK4aIoOW6dybtwVNiykXdgDY2gxu49YLwIlTi5wX6v+0N
 gUgA==
X-Gm-Message-State: AOAM531v+KpbJ030h2Q8hS/u3xIpK+RiaCUyfBFlTqM29QGu9BQF6jM6
 GcwBwCs8+4W6PwaZ/LHjJwyMDKI4weMjTg==
X-Google-Smtp-Source: ABdhPJzi01cVzGvcwYU6U/bZN6+OXlJR5MSbs7pUlQWFX8M0tMas6R6SHHXYsyb6cNvqKz4n6+upoQ==
X-Received: by 2002:aa7:96cc:0:b029:1e7:c46b:2954 with SMTP id
 h12-20020aa796cc0000b02901e7c46b2954mr6828539pfq.68.1613210357198; 
 Sat, 13 Feb 2021 01:59:17 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id k24sm11556089pfg.40.2021.02.13.01.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 01:59:16 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Subject: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
Date: Sat, 13 Feb 2021 18:57:24 +0900
Message-Id: <20210213095724.3411058-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_045921_276504_3AAB1C37 
X-CRM114-Status: GOOD (  21.48  )
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
Cc: Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for the Foresee FS35ND01G-S1Y2 manufactured by Longsys.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Link: https://datasheet.lcsc.com/szlcsc/2008121142_FORESEE-FS35ND01G-S1Y2QWFI000_C719495.pdf
---
 drivers/mtd/nand/spi/Makefile  |  2 +-
 drivers/mtd/nand/spi/core.c    |  1 +
 drivers/mtd/nand/spi/longsys.c | 86 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |  1 +
 4 files changed, 89 insertions(+), 1 deletion(-)
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
index 61d932c1b718..8c36f0f6b1c9 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -864,6 +864,7 @@ static const struct nand_ops spinand_ops = {
 
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&gigadevice_spinand_manufacturer,
+	&longsys_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/longsys.c b/drivers/mtd/nand/spi/longsys.c
new file mode 100644
index 000000000000..418bd5a1f20d
--- /dev/null
+++ b/drivers/mtd/nand/spi/longsys.c
@@ -0,0 +1,86 @@
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
+#define SPINAND_MFR_LONGSYS		0xCD
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
+static int fs35nd01g_s1y2_ooblayout_ecc(struct mtd_info *mtd, int section,
+					struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	/* ECC is not user accessible */
+	region->offset = 0;
+	region->length = 0;
+
+	return 0;
+}
+
+static int fs35nd01g_s1y2_ooblayout_free(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	/*
+	 * No ECC data is stored in the accessible OOB so the full 16 bytes
+	 * of each spare region is available to the user. Apparently also
+	 * covered by the internal ECC.
+	 */
+	if (section) {
+		region->offset = 16 * section;
+		region->length = 16;
+	} else {
+		/* First byte in spare0 area is used for bad block marker */
+		region->offset = 1;
+		region->length = 15;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops fs35nd01g_s1y2_ooblayout = {
+	.ecc = fs35nd01g_s1y2_ooblayout_ecc,
+	.free = fs35nd01g_s1y2_ooblayout_free,
+};
+
+static const struct spinand_info longsys_spinand_table[] = {
+	SPINAND_INFO("FS35ND01G-S1Y2",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xEA, 0x11),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fs35nd01g_s1y2_ooblayout,
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
