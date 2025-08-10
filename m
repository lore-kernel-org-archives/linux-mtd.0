Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67374C87FCF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tHVoOXaMXeexbfE7yCi7UsHgJ1X1AUw5ekBW9aLHIwY=; b=ibtV1GhtfHzVVX
	3Bi8BCPUWzaEF1PpxfrMxBhmUPGkzHEEk1zjwMO046npjIlyA4Hu7rCFQaYcTeh74z/fg7VeztzCG
	JAakypzJFR6uLYbrGb3iu5ZF1GsA2Dw4Hi5VAdu1ja1OhKRafOQ2uvuyfzknqk+JjBqcg9aQKVvt5
	NET4zoCrhG6tQmCtb2dohZXK5zkwNWcRGCSStSuluzxaXrmWdN/zSvtRCMV+Vr09x+tVncSnP4Zca
	bWvjUsk/+nd4GIY0W63UYU3YWTHSpLbwH0ZKHqlET/rmI1iCVzXzn3DNyMhC4YCtrt4jfMEEMXcvl
	ZkiQ/I+tl7lLLJbltiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul6GS-00000005djn-2xY2;
	Sun, 10 Aug 2025 13:39:08 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul6GQ-00000005djR-0q7T
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 13:39:07 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76bd9d723bfso3081331b3a.1
        for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2025 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754833145; x=1755437945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yoshnGQPZvUUhsSurL6kAbf6xWu8EGMASlS/IDx1kw0=;
        b=btEJZmAuRWNq8PbV9L3YKSRZM/E2coDn55GR3F4Q2cg4ZrADSjlqL/pHzhT0wbdgju
         W25PM5zFoSjtIJ9n0xNOXbXiY5563lK+yqd2hKnMFl7w/DY83+iuvcfaOqt1+HDVoQMa
         RNfMF6S62crXxxP1wfU9gw2Ht6ghVPqR3xb5FMJ+LuaMiCK4loXEpDRel2JUxy5IBfCA
         8H5x88c5zLWHJQeSKnwO/ka6UXK5RnkJ+AxCCu0DXEr6cN+217U2UTt7rsNk/4wiPqLZ
         Ci4Ehghj8dRvn2mHVnuo5YXMCllAsgfkc2M3a9zPaFZb1hxqmHuJK10PLzPD17qLlGL/
         DQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754833145; x=1755437945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoshnGQPZvUUhsSurL6kAbf6xWu8EGMASlS/IDx1kw0=;
        b=mzeM+VZhP8TAsDsPVjCQ8+SeIkd0lLqNNWlfw0z11Dcq90V+a+C1KWF+KucN+6whMO
         wOJInujddprukwQha85lzCusMhuplYNKh1cB847/dVPJMG2zhUjV1gQl7YrTTqzwomVX
         iIc2yER6U0/rd5GHnjD+NAmxBt6dc22u4x6/UDoInzlsPCeavtafW6jS96AJ+o0n70t8
         BzY32wXpyddEfEDUBCSjd2BeRW6zlKXLbWAc4dLrzCmMcamyJ/JIQSufK6htUZ28SaYB
         CiqYR5v5IAwrJkKPt+WEvK9TNdt8lmvVfPxBaEobzQJ/9o51Ghnw4+J4BwKEWluISLZz
         LNvA==
X-Forwarded-Encrypted: i=1; AJvYcCWpit/x0Nns+DDHWJ/s554Bww2bCShYpDiWgOaad8+HlQz+of6EpfbUjBoEL2L1lyrZ5bdFsOohF2s=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYwjQBFILvVyHMyxPOiQasLb3VveffWH7V2VzW2+Nz6k2N4VpV
	LQhTCmdsTdXkdAJ/9oYRmTwTT+Bvjg5lp469ETBbyvKIQwwVrkcawLd1
X-Gm-Gg: ASbGnct2/izMMjSqP9of2CWRi38rABVxrsd5DkMd2tXwVTjprDss/EyVMsBombo1/95
	ZIt+gCO24LKATdOsCHopwvuSTE0NTK5gzlzdZqUdlebdysBVGKtocRmuc5Pu5Wjcu5hPgi1mwIJ
	fzmHzreW1a2hCBwqWr65+NSZZyIaCKcYte1oSpuP7b6VsJpBn0vGK/DOUVw2/Rj+u7NMLwWu8fI
	aym+7ZkgPrpMX8zzhBFxF+NJ07yaGcxc/vC9gMUFGYRXytgCaHruBfsCnUSIjFJC0k7AmcnUGQt
	nwmfmO1uXROI9dy0gyeWMgmB6MPb6nPZnYTtH01scm3SgsozPFHi0olvFyg03xHSIbnPKpDkRAt
	n9CGho1axIvIPYVWceOjy8ybsiQ==
X-Google-Smtp-Source: AGHT+IEJiOcqd3f+iw2pD2y2xG4uE9Z7LUa7e0HgFMcWgFkFuTJ5hxWFqi58BPIb9xglcRf2wEO9uA==
X-Received: by 2002:a17:903:3b87:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-242c2039f7fmr113424935ad.13.1754833144742;
        Sun, 10 Aug 2025 06:39:04 -0700 (PDT)
Received: from CNSZTL-DEB.lan ([2408:8262:245d:40cb:bc4b:53ff:fead:2725])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a48esm252223925ad.114.2025.08.10.06.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 06:39:04 -0700 (PDT)
From: Tianling Shen <cnsztl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Tianling Shen <cnsztl@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spinand: add support for FudanMicro FM25S01A
Date: Sun, 10 Aug 2025 21:38:52 +0800
Message-ID: <20250810133852.52389-1-cnsztl@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_063906_242295_03BEDDCA 
X-CRM114-Status: GOOD (  17.27  )
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

Add support for FudanMicro FM25S01A SPI NAND.
Datasheet: http://eng.fmsh.com/nvm/FM25S01A_ds_eng.pdf

Signed-off-by: Tianling Shen <cnsztl@gmail.com>
---
 drivers/mtd/nand/spi/Makefile |  2 +-
 drivers/mtd/nand/spi/core.c   |  1 +
 drivers/mtd/nand/spi/fmsh.c   | 74 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |  1 +
 4 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/fmsh.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 258da42451a4..e288742ea8f0 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o otp.o
+spinand-objs := core.o fmsh.o otp.o
 spinand-objs += alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
 spinand-objs += micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index b0898990b2a5..ea47028d021a 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1184,6 +1184,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&alliancememory_spinand_manufacturer,
 	&ato_spinand_manufacturer,
 	&esmt_c8_spinand_manufacturer,
+	&fmsh_spinand_manufacturer,
 	&foresee_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
new file mode 100644
index 000000000000..8b2097bfc771
--- /dev/null
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020-2021 Rockchip Electronics Co., Ltd.
+ *
+ * Author: Dingqiang Lin <jon.lin@rock-chips.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_FMSH		0xA1
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(0, 1, NULL, 0, 0),
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
+static int fm25s01a_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	return -ERANGE;
+}
+
+static int fm25s01a_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 2;
+	region->length = 62;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops fm25s01a_ooblayout = {
+	.ecc = fm25s01a_ooblayout_ecc,
+	.free = fm25s01a_ooblayout_free,
+};
+
+static const struct spinand_info fmsh_spinand_table[] = {
+	SPINAND_INFO("FM25S01A",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fm25s01a_ooblayout, NULL)),
+};
+
+static const struct spinand_manufacturer_ops fmsh_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer fmsh_spinand_manufacturer = {
+	.id = SPINAND_MFR_FMSH,
+	.name = "Fudan Micro",
+	.chips = fmsh_spinand_table,
+	.nchips = ARRAY_SIZE(fmsh_spinand_table),
+	.ops = &fmsh_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 27a45bdab7ec..927c10d78769 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -355,6 +355,7 @@ struct spinand_manufacturer {
 extern const struct spinand_manufacturer alliancememory_spinand_manufacturer;
 extern const struct spinand_manufacturer ato_spinand_manufacturer;
 extern const struct spinand_manufacturer esmt_c8_spinand_manufacturer;
+extern const struct spinand_manufacturer fmsh_spinand_manufacturer;
 extern const struct spinand_manufacturer foresee_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
