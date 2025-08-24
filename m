Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D44CA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RLtBMWQM7ySR0erS6WiT+uS0qnPqoAeyH3X7EbMXKSs=; b=oUnBy4PC31+8oR
	C39XojgQCISMes+o3h1NCXGCUG20vdj4yqFmK7i12n0191qC0R5hNdHhrV0KiYkvzLNNXCkduxNq9
	8cGg+NPC7kGH68x+doAdQNC+4Rl/dIKxZCt4b1aBCYnH44Doyq1SA9WnVGyM4KvpZ6d0Xr/fYtt4e
	zuwlfT9muEJfa/0Mb3Vg1vUghHJvZEkZQs6y1Np9jHh78XD4nfbKnnDkLVCKauCNvNyPdCbgn7kYQ
	m7YueVXYSbL4u9CDIv5Nu0TU43LWFGlvgqJN3obPnibW4m7S+IrdKCQtG6r/5I+DyNKqJfQh0qS+l
	+pP3aWZPD9R+Bx+/FCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqE50-00000006N9w-3OHc;
	Sun, 24 Aug 2025 17:00:30 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqE4y-00000006N9b-04Iy
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 17:00:29 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-77033293ed8so1644493b3a.0
        for <linux-mtd@lists.infradead.org>; Sun, 24 Aug 2025 10:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756054827; x=1756659627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmGleacCOfQU4OHkTtfI/0sWYR+WQk6W35qBemTqwCw=;
        b=THhTxmtfmaxD09Lm5hK9ElVAotC60uAN/K4d3LXcNXWrbr06UHIuoxuf2DNq5X4rAx
         kFSGhhY9B+WITb8YZzUxlU7wglP8wfMS/I5QixTSk/gen6AW3TKp05f94tJkfStoFJol
         TQxpLcjkvtXsffC2gR+aRT/CoV8S3p+foLUeSlfAkn1EOsWUr/wyf0qdvO7ZggFwI0Ow
         rkozSSdYtNqBDmv6Sr8nLeq5VuvSlcfMIlo6k7Et2m95pKIJD8vsEwCq4IJDbBhpu2A0
         Q5GWA5dCbiiB+Ic+e8jEG/4k+nFuepDpnqdsWJsKoaIloL+WOtf6ebdZO4PwI/xSWB+i
         /7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756054827; x=1756659627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmGleacCOfQU4OHkTtfI/0sWYR+WQk6W35qBemTqwCw=;
        b=SxHuw/HJqgbdbigaGHQ4c4H+PT9fJSvUUJ67iZF5PJSEO8ZtQQrBiNCj5jfhT3bOc4
         F5X+grB7Z0S5RgX8S6eoXyo+DnX2zqJYHTfRT4tKaOaZWucQbcPQjhteLl/eeJgZITAT
         8UBQtHMRUoP794KGgNkRDASR4LELpfLlKVajA3XbvBYTQcgXfvDfLFbQMQmjq2cSLasJ
         P/Qy2PcinmZUw9alyZIe/qIzSd8pFbr7+hA4/CeaLV8SaSgdasj731nCBSkHVX/+BU/d
         anHRRhcT63gFH3jDHZ/CHWi0Xumpp55CKJ3WAQjrKUPNza4DRN9j9WhHXGSLMlMyIGPO
         Gqsw==
X-Forwarded-Encrypted: i=1; AJvYcCXG7sSPZ5dQ0IkY2Mi150JsjLvvB3j+2uQDBgt5bKn+MhdNLFnTVssVHFkgAfabsgPqJTf02jsLWHU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVjyTaKxMDqFH/THyUPV2pFTOBzrjRwvsQFjKilEAAuWLLtlft
	+rntb4SPqChLy2Jmprkb+9fnckNI2rbE78DROmYlpVJHdMzP57T8Swbd
X-Gm-Gg: ASbGncuM4Bm5XZ5co1ByoDXOj5y2EgGHU4RWGte4Inmk3iU6rHpR9GeG1rtePpTxONu
	zKE5YxdJ0nNfGN5v+GRk3dN5F09X0Um0snbsuhWgEsG70NfXnL7MupSQ7I8SkXWCa9E9X0SwdQr
	qK6aAaztNW3C48WS/EeG346Ih7C9/y3LB+g54mhloPq5GN85Wukzrg0tEEI4aTP95axjCSzwSXb
	0K9JOOKtj+BT8svzcxYWLJsSuNDVSElpxElFmMLqY6rmjPhbL/WvEgdrGbMABLaYtGYQ48yHDop
	35dN4PH9t8eJZ5Z9/aSnU+qD+JGR3YxRUc2XpKZ+fwLsBWZeG4Ht8Z2HBcMHMHCzvmE4EL8J0k2
	y6vqIkcBI8TEoanNcEJheHsclMQ==
X-Google-Smtp-Source: AGHT+IElqKVPYilmmzfYji1Bu0+XXz6AiqIHE4MkEAgx0v7b5N4DRbNroLA1jElG36TSbsTlvMf1Ow==
X-Received: by 2002:a05:6a00:6209:b0:748:31ed:ba8a with SMTP id d2e1a72fcca58-7702faaef8fmr9063892b3a.15.1756054826274;
        Sun, 24 Aug 2025 10:00:26 -0700 (PDT)
Received: from CNSZTL-DEB.lan ([2408:8362:245d:6225:bc4b:53ff:fead:2725])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703ffb47b9sm5163161b3a.3.2025.08.24.10.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 10:00:25 -0700 (PDT)
From: Tianling Shen <cnsztl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Tianling Shen <cnsztl@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spinand: add support for FudanMicro FM25S01A
Date: Mon, 25 Aug 2025 01:00:13 +0800
Message-ID: <20250824170013.3328777-1-cnsztl@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_100028_059066_BC2B3F2F 
X-CRM114-Status: GOOD (  18.00  )
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

Changes in v2:
- sort spinand-objs.

---
 drivers/mtd/nand/spi/Makefile |  2 +-
 drivers/mtd/nand/spi/core.c   |  1 +
 drivers/mtd/nand/spi/fmsh.c   | 74 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |  1 +
 4 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/fmsh.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 258da42451a4..6d3d203df048 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 spinand-objs := core.o otp.o
-spinand-objs += alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
+spinand-objs += alliancememory.o ato.o esmt.o fmsh.o foresee.o gigadevice.o macronix.o
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
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
