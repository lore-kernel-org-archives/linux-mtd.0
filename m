Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF25E71D40
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NhrlFiKM4K3bP9HeLrcXekE5V8ebZ03fi3vaZHeX2Ig=; b=BfiLDudnNoallx
	9lawf49TTyxqNgf8+/0UdpLbGFnvy5mrHSCZCAEayQew2UYT7qHzffvfjdC9HjivFHU1ywu+hz6SI
	G5S5Qq+nWAd1FUkzlE9aMxYXwevuerMPj9uhK7dB9Jk2uqoHxlfkG/DK5/8IJI//NH/Pl9x7RZDDk
	wHdTizTyFVJbYLs/z5PX0RKGzKw23MkXcGqe6SbNfkKwml983aa0C64KJic8rge2Z9/vhSmFMfNY0
	hS3EaClOE+TSNukn9doFbnnfmVhws2HIlWPuaOZNiHAeJyoYGFMe5s4FUEa8Wg+XJGwgmg6xkW3rq
	hhqEhqZxj4K6dYc1dZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmEpm-0086TI-0I;
	Fri, 29 Sep 2023 14:51:14 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmEpc-0086S3-1b
	for linux-mtd@lists.infradead.org;
	Fri, 29 Sep 2023 14:51:10 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8D11812000D;
	Fri, 29 Sep 2023 17:50:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8D11812000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1695999047;
	bh=M/QssKuK81ff2bXIf5giRDIn4a4XRpqPj6u9hV8eVvY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Ml1eL0925sezq/FS9Ehqvn1EFuskIYcSTM3elNUuNWsmtIRjbb1YQW6K5h09HF4Gz
	 FFzlzycM3dvWJ2l+bwGwQZNjoUVbEE4dM+jQ2Q1eJBRhR6ZSgnBHBAAuZQkKh7rwvm
	 jPoyPXg+VRn3xhEKFrxjZo7dXwIMQ1HZxXa+SBZ1FTTeK1hpl9+K8djF91+6jviLVD
	 k1TD9VvM0Xt9ZuEeFSDRo9J0NuzDOeGKBHZ8aNKTqEsbd5pKS7YCdsUGPXPux1jt8v
	 9P9H5mnmpdYJaxYx0LjZ8qmN6DJaHfVLdYLdBiemcBV62kCcA0lvWEO1fcyoxmjQk+
	 6dEUE9DAsRaRA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 29 Sep 2023 17:50:46 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 29 Sep 2023 17:50:46 +0300
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mario Kicherer
	<dev@kicherer.org>, Chuanhong Guo <gch981213@gmail.com>, Dhruva Gole
	<d-gole@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@sberdevices.ru>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v1] mtd: spinand: add support for FORESEE F35SQA002G
Date: Fri, 29 Sep 2023 17:49:34 +0300
Message-ID: <20230929144934.192649-1-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180242 [Sep 29 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 535 535 da804c0ea8918f802fc60e7a20ba49783d957ba2, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;www.longsys.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/09/29 10:46:00
X-KSMG-LinksScanning: Clean, bases: 2023/09/29 10:46:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/09/29 12:58:00 #22007106
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_075104_898164_0CA6E14D 
X-CRM114-Status: GOOD (  22.69  )
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

Add support for FORESEE F35SQA002G SPI NAND.
Datasheet:
  https://www.longsys.com/uploads/LM-00006FORESEEF35SQA002GDatasheet_1650183701.pdf

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |   1 +
 drivers/mtd/nand/spi/foresee.c | 101 +++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   1 +
 4 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/foresee.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index cd8b66bf7740..19cc77288ebb 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o alliancememory.o ato.o esmt.o gigadevice.o macronix.o
+spinand-objs := core.o alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
 spinand-objs += micron.o paragon.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 393ff37f0d23..849ccfedbc72 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -940,6 +940,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&alliancememory_spinand_manufacturer,
 	&ato_spinand_manufacturer,
 	&esmt_c8_spinand_manufacturer,
+	&foresee_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/foresee.c b/drivers/mtd/nand/spi/foresee.c
new file mode 100644
index 000000000000..55d4ff1f091a
--- /dev/null
+++ b/drivers/mtd/nand/spi/foresee.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2023, SberDevices. All Rights Reserved.
+ *
+ * Author: Martin Kurbanov <mmkurbanov@salutedevices.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_FORESEE		0xCD
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
+static int f35sqa002g_ooblayout_ecc(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *region)
+{
+	return -ERANGE;
+}
+
+static int f35sqa002g_ooblayout_free(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
+{
+	/* XXX: It is not possible to partially write to this OOB area, as both
+	 * the main and OOB areas are protected by ECC. The user needs to
+	 * program both the main area and OOB area at one programming time,
+	 * so that the ECC parity code can be calculated properly.
+	 */
+
+	if (section)
+		return -ERANGE;
+
+	/* Reserve 2 bytes for the BBM. */
+	region->offset = 2;
+	region->length = 62;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops f35sqa002g_ooblayout = {
+	.ecc = f35sqa002g_ooblayout_ecc,
+	.free = f35sqa002g_ooblayout_free,
+};
+
+static int f35sqa002g_ecc_get_status(struct spinand_device *spinand, u8 status)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_HAS_BITFLIPS:
+		return nanddev_get_ecc_conf(nand)->strength;
+
+	default:
+		break;
+	}
+
+	/* More than 1-bit error was detected in one or more sectors and
+	 * cannot be corrected.
+	 */
+	return -EBADMSG;
+}
+
+static const struct spinand_info foresee_spinand_table[] = {
+	SPINAND_INFO("F35SQA002G",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x72, 0x72),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&f35sqa002g_ooblayout,
+				     f35sqa002g_ecc_get_status)),
+};
+
+static const struct spinand_manufacturer_ops foresee_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer foresee_spinand_manufacturer = {
+	.id = SPINAND_MFR_FORESEE,
+	.name = "FORESEE",
+	.chips = foresee_spinand_table,
+	.nchips = ARRAY_SIZE(foresee_spinand_table),
+	.ops = &foresee_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 3e285c09d16d..badb4c1ac079 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -263,6 +263,7 @@ struct spinand_manufacturer {
 extern const struct spinand_manufacturer alliancememory_spinand_manufacturer;
 extern const struct spinand_manufacturer ato_spinand_manufacturer;
 extern const struct spinand_manufacturer esmt_c8_spinand_manufacturer;
+extern const struct spinand_manufacturer foresee_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
-- 
2.40.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
