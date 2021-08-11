Return-Path: <SRS0=3stn=NC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D63DC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Aug 2021 09:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD6160F11
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Aug 2021 09:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BD6160F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cqxlck860SSonRRqdZqxDMpm5qWChxF530AMVsJfhs8=; b=VGYqe/5o9c5uB4
	p5jI9xO9fIdq+jvHWb/yXPGGvJJyyioKbqZf09Q/AOL+VhNZqnhkDDT55xwEsFLn9TMfnCG0Albv0
	RAVJB7SlvuKTkFG8zYUhYDEEmaRIpjlwgfeHztgFAsRugUH8FWrwIqnIdvYZTS1oJMy8rlX0iU1VO
	U5zjxO9dkTRfoIFpdJzadudkA4Px0aexAx0sybVh2tj59PrW11ejRnFkGyZHw0ddypavXlxS+nqwH
	N+E4Bt9HnfoOmmJ/9/NahZNMxO6ZrSQM5Iw5T6Zs1KnZxD+Hp8vxJjJJIprZqF5Uz+9c9U4XJln+5
	4lkWmetwZr2/GMixbS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkEi-006Cdk-6U; Wed, 11 Aug 2021 09:09:20 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjxV-0067WD-F7
 for linux-mtd@lists.infradead.org; Wed, 11 Aug 2021 08:51:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id nt11so2319902pjb.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Aug 2021 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7vn1eldgbv11PV6+xbV5jWseW1R8cuS20m4woT+uMpA=;
 b=bImmEc8rUsnx7O3YDjx4SMdyB5LjrzuWSVS+d19JS4Bvuh0I0MDJddl9RWl//ljE9p
 /AjgyOczhJH57r6h5AwBOE3gCVpUCzyNlsnRniuMBvc1PDSJBJbgceE6FSgRkhc2yqYR
 R+ukyzrGl1vPmXgYzoM8z8qXeuH2ZdoPeh7OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7vn1eldgbv11PV6+xbV5jWseW1R8cuS20m4woT+uMpA=;
 b=QMOxtrIuyvkgdPcnye4SVg8a3CoYbPljWrOVKArLaRGGBOKcZQgWmvBI2qIxHbeNPC
 vT3o7ia2AiXY+FNnl/ogYB0YbwOtOQULwBs/UQeltDULwCq6h0zainGc9rCJIr2AoujF
 RnThCUcJz2aeVir4ElNlbF3XrWIfyVb9eld6m4N7xPoCp+XVvRrreqzKUh7MjnhPQ8oq
 xE0wwsGrRvCvIMawktNA4wX8jFhTCpTUpnk1I0OGiY31s6/7iHlpl1ovjUZj86o6f1Kl
 JRkeOcf/RlN2A0keQrjTcbb+YI+b6KmVoCFB3Tlzi+tfVojey2rCL3mPrqzZbIjqqe7a
 DYmA==
X-Gm-Message-State: AOAM531LO/1dNBvRZVzzIXyFZlIFRz6IkdxujDzj70YZlo8a0ElNj3eE
 ybf99QhKnybPdi/2WnwXDkRxfSv2D4pN+A==
X-Google-Smtp-Source: ABdhPJzyyofg68LqLd3IEv7hF5/lLSnYCz8QJZvRcSjm+UlCxruIjcZ/S6MIAYlbUozesqOU9TG4qA==
X-Received: by 2002:a17:90b:3007:: with SMTP id
 hg7mr9524316pjb.66.1628671892015; 
 Wed, 11 Aug 2021 01:51:32 -0700 (PDT)
Received: from shiro.work (p866038-ipngn200510sizuokaden.shizuoka.ocn.ne.jp.
 [180.9.60.38])
 by smtp.googlemail.com with ESMTPSA id ga8sm5704348pjb.4.2021.08.11.01.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 01:51:31 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v3] mtd: spinand: add support for Foresee FS35ND0*G parts
Date: Wed, 11 Aug 2021 17:49:24 +0900
Message-Id: <20210811084924.52293-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_015133_717976_B8C6C7BF 
X-CRM114-Status: GOOD (  27.86  )
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

Add support for the various Foresee FS35ND0*G parts manufactured by Longsys.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Link: https://datasheet.lcsc.com/szlcsc/2008121142_FORESEE-FS35ND01G-S1Y2QWFI000_C719495.pdf
---
 Changes since v2:
 - Originally I only had the 1Gbit version of this chip, now I have the 2Gbit and 4Gbit
   variations so I've added support for those too. There is no datasheet for the bigger
   chips but they are documented in a flashing tool from an SoC vendor so I took the parameters
   from there.
 - Previous versions of this patch only had single io read cache variants. My SPI flash driver
   now supports dual and quad io for reading so I added and tested those modes too.
   My driver/hardware only supports single io for writing so those are still left out.
 - Implemented proper logic for checking the ECC status.
 - Combined with the previous patch for 1-filling the OOB in the page buffer before writing
   I have been using this for a few months now without anything getting broken.
 
 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |   1 +
 drivers/mtd/nand/spi/longsys.c | 134 +++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   1 +
 4 files changed, 137 insertions(+), 1 deletion(-)
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
index 446ba8d43fbc..48f635d5c1ff 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -895,6 +895,7 @@ static const struct nand_ops spinand_ops = {
 
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&gigadevice_spinand_manufacturer,
+	&longsys_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/longsys.c b/drivers/mtd/nand/spi/longsys.c
new file mode 100644
index 000000000000..ee38f8728262
--- /dev/null
+++ b/drivers/mtd/nand/spi/longsys.c
@@ -0,0 +1,134 @@
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
+#define SPINAND_MFR_LONGSYS			0xCD
+#define FS35ND01G_S1Y2_STATUS_ECC_0_3_BITFLIPS	(0 << 4)
+#define FS35ND01G_S1Y2_STATUS_ECC_4_BITFLIPS	(1 << 4)
+#define FS35ND01G_S1Y2_STATUS_ECC_UNCORRECTABLE	(2 << 4)
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
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
+static int fs35nd01g_s1y2_ecc_get_status(struct spinand_device *spinand,
+					u8 status)
+{
+	switch (status & STATUS_ECC_MASK) {
+	case FS35ND01G_S1Y2_STATUS_ECC_0_3_BITFLIPS:
+		return 3;
+	/*
+	 * The datasheet says *successful* with 4 bits flipped.
+	 * nandbiterrs always complains that the read reported
+	 * successful but the data is incorrect.
+	 */
+	case FS35ND01G_S1Y2_STATUS_ECC_4_BITFLIPS:
+		return 4;
+	case FS35ND01G_S1Y2_STATUS_ECC_UNCORRECTABLE:
+		return -EBADMSG;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
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
+				     fs35nd01g_s1y2_ecc_get_status)),
+	SPINAND_INFO("FS35ND02G-S3Y2",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xEB, 0x11),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fs35nd01g_s1y2_ooblayout,
+				     fs35nd01g_s1y2_ecc_get_status)),
+	SPINAND_INFO("FS35ND04G-S2Y2",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xEC, 0x11),
+		     NAND_MEMORG(1, 2048, 64, 64, 4096, 40, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fs35nd01g_s1y2_ooblayout,
+				     fs35nd01g_s1y2_ecc_get_status)),
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
index 6988956b8492..f6c38528bb03 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -261,6 +261,7 @@ struct spinand_manufacturer {
 
 /* SPI NAND manufacturers */
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
+extern const struct spinand_manufacturer longsys_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
