Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AC9E6C5F2
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 02:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INgtrapIw6Zo/g72QvH3yFDrGPVUxvCPY9Ws1Q7rQnQ=; b=apmRYSWtN8g0K1
	yQQb89rPO/ATgcb/GNL2UpGt6Y0Gw6mxfnh3qzdQa9Yy9a/WCM+6ooYl9GrnhO2Y4pZ1oW1hfGvWc
	99Qrac+pyLnQPWLFs88mXXdW+S0tIZuo69k9hPJzHEBun+lto2apHna9ZDxwl8ZdrcxGoOD0/cBlZ
	U1UREBnb51rwuE87tGOzLZWGrmW/BzMLtyPBuhNkOxErJmsGTxBQ3yH2s/Lttgq4MkjdSWbUGo0KK
	yS0EyDNwXmtxvHyufopyYqlYXRP3sWsBxgq8NzbfQHmu2wLr4txr9dYXkGh50SuA/UgX+A75lUt9S
	0HWbGylV9PlojiyeHtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIxh-000000083m5-3VY6;
	Tue, 03 Dec 2024 02:48:29 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIwa-000000083X2-1S7r
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 02:47:21 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-29e842cb9b4so308198fac.2
        for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2024 18:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733194039; x=1733798839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmuF46E7QZ73q+MnD9LRef4FBtBZcOQ1mSbJPyIeM2c=;
        b=LpxtHPARYVEFt8ETA2UPD5eWe7+u/ku4XEey2IbNfE4Y+NP8kEzxsCnMvV19ZnLfNz
         b0203FidWMDOhNb81x+gmMRJziE9mceuO32HyP3OW21GXOKxwPjhmtz4mg8sJ1L96Efw
         BGn7p+cwySSZ4YaDxtn6wocroo6Nab5m/oqsPZ+aAkmPZPMYRaGrVXVIO6izR3vqCGuX
         F6c65TiOUQd8xjc9L7gq5PYJ23V8Iqqv0I4bMMDxDqbMxb+0KEYLVv4JXOJ1Tqlf0Aob
         NN370DtdTxBu3TGo6qqCNw1nmn2LWFQKO1Za7oB99BG9iNkrE0JuwqaljpTfF29/GgMg
         e6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733194039; x=1733798839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmuF46E7QZ73q+MnD9LRef4FBtBZcOQ1mSbJPyIeM2c=;
        b=jsps22DPJCGpyP55DMygJA2BnvdfVBpS3Xdbrspm5lteTb3lA7cEG2lonZebO3KCIV
         sOGBmjlifbeMQJ8HoY3AbVm7s+jaJF8qwo73LGLURIIICcgcQRg2gJB77EPoFhwyRW4e
         Vvp207WxCMa2buR1Gc/0fv6BHv1tt1yVfmtR+dZXbSvLEfnO6i7nLuKjV6I2Y0m8PpKs
         /hRnRSCKQ+XE5nYp+YcxEaz49CoLGg/YdTBRjzE0D7DlzyAgcue2dN21EA1ZGy6eXznv
         ZS21TxsF15Rgk2KAbentvf8ouuC40cJjGqhpugsVC25dHJ2j8JRQcDAptpwoWZtzcMHf
         LgLQ==
X-Gm-Message-State: AOJu0YwtfMb0+IY07IOYiG8tZSEdSbiyBqtrk+EZDqF4Z1Mp7sN5hMmx
	mxod0qSrb/X/dmFJHWq6+Tu/2NNe00M1hINYaLL5wv0+2hw6VaqfbsJJ0g==
X-Gm-Gg: ASbGncuoYf8BTHk0S2WFz3uKzcUVC5bOuSFj/qkEdreG2elZBNwRC1IP3utP6fEfja9
	2Prf71YTqc2sbW6tgVi2Cegn4sdGg5eBRTLvIiUq1brD+zwPVXWtPPNJqjJM9SD+65XqA7e/OhL
	Cb9V7gvPMzfkTsfkbC5F/pUyGvaFw47LkbAp9dSyNC0pOAI32Bk9EpnmiwyMlhZZoEOPG2IGg0k
	2rzRKrCr1UAgL3zvpRGqBNQNhANdLlDRbNdRQxRqu5bKwBFRce7U0YNoBE5SYz1Ju5X5ncQZ0pN
	LWEymA/pBG3e7AQHJHtbKvQd0qeVX7f389Q3gg==
X-Google-Smtp-Source: AGHT+IFpZbkG8hMVlVEjOcXb8ZuEYoixhjhHbAF0e6MLfRghGknlrGW1WtQjFIwWydXxA8vpUsuZ1g==
X-Received: by 2002:a05:6871:e493:b0:29e:32e7:5f1f with SMTP id 586e51a60fabf-29e8888712amr1031791fac.27.1733194039161;
        Mon, 02 Dec 2024 18:47:19 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-81.msd.spmode.ne.jp. [49.98.220.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d634asm8605693a12.8.2024.12.02.18.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 18:47:18 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	kr.kim@skyhighmemory.com,
	zhi.feng@skyhighmemory.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 3/3] mtd: spinand: Add support for SkyHigh S35ML-3 family
Date: Tue,  3 Dec 2024 11:46:50 +0900
Message-Id: <33652eaf331fc27b3820ad8445b64ede4f461960.1733193264.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733193264.git.Takahiro.Kuwano@infineon.com>
References: <cover.1733193264.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_184720_388361_C4C6B822 
X-CRM114-Status: GOOD (  20.35  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

SkyHigh S35ML01G300, S35ML01G301, S35ML02G300, and S35ML04G300 are 1Gb,
2Gb, and 4Gb SLC SPI NAND flash family. This family of devices has
on-die ECC which parity bits are stored to hidden area. In this family
the on-die ECC cannot be disabled so raw access needs to be prevented.

Link: https://www.skyhighmemory.com/download/SPI_S35ML01_04G3_002_19205.pdf?v=P
Co-developed-by: KR Kim <kr.kim@skyhighmemory.com>
Signed-off-by: KR Kim <kr.kim@skyhighmemory.com>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |   1 +
 drivers/mtd/nand/spi/skyhigh.c | 147 +++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   1 +
 4 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/skyhigh.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 19cc77288ebb..1e61ab21893a 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 spinand-objs := core.o alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
-spinand-objs += micron.o paragon.o toshiba.o winbond.o xtx.o
+spinand-objs += micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2ff3c32d46d3..77aa77ea4564 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1131,6 +1131,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
+	&skyhigh_spinand_manufacturer,
 	&toshiba_spinand_manufacturer,
 	&winbond_spinand_manufacturer,
 	&xtx_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
new file mode 100644
index 000000000000..8b32b74ff34b
--- /dev/null
+++ b/drivers/mtd/nand/spi/skyhigh.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 SkyHigh Memory Limited
+ *
+ * Author: Takahiro Kuwano <takahiro.kuwano@infineon.com>
+ * Co-Author: KR Kim <kr.kim@skyhighmemory.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_SKYHIGH			0x01
+#define SKYHIGH_STATUS_ECC_1TO2_BITFLIPS	(1 << 4)
+#define SKYHIGH_STATUS_ECC_3TO6_BITFLIPS	(2 << 4)
+#define SKYHIGH_STATUS_ECC_UNCOR_ERROR		(3 << 4)
+#define SKYHIGH_CONFIG_PROTECT_EN		BIT(1)
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
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
+static int skyhigh_spinand_ooblayout_ecc(struct mtd_info *mtd, int section,
+					 struct mtd_oob_region *region)
+{
+	/* ECC bytes are stored in hidden area. */
+	return -ERANGE;
+}
+
+static int skyhigh_spinand_ooblayout_free(struct mtd_info *mtd, int section,
+					  struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* ECC bytes are stored in hidden area. Reserve 2 bytes for the BBM. */
+	region->offset = 2;
+	region->length = mtd->oobsize - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops skyhigh_spinand_ooblayout = {
+	.ecc = skyhigh_spinand_ooblayout_ecc,
+	.free = skyhigh_spinand_ooblayout_free,
+};
+
+static int skyhigh_spinand_ecc_get_status(struct spinand_device *spinand,
+					  u8 status)
+{
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case SKYHIGH_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case SKYHIGH_STATUS_ECC_1TO2_BITFLIPS:
+		return 2;
+
+	case SKYHIGH_STATUS_ECC_3TO6_BITFLIPS:
+		return 6;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info skyhigh_spinand_table[] = {
+	SPINAND_INFO("S35ML01G301",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x15),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(6, 32),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
+				     skyhigh_spinand_ecc_get_status)),
+	SPINAND_INFO("S35ML01G300",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x14),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(6, 32),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
+				     skyhigh_spinand_ecc_get_status)),
+	SPINAND_INFO("S35ML02G300",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(6, 32),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
+				     skyhigh_spinand_ecc_get_status)),
+	SPINAND_INFO("S35ML04G300",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35),
+		     NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 2, 1, 1),
+		     NAND_ECCREQ(6, 32),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
+				     skyhigh_spinand_ecc_get_status)),
+};
+
+static int skyhigh_spinand_init(struct spinand_device *spinand)
+{
+	/*
+	 * Config_Protect_En (bit 1 in Block Lock register) must be set to 1
+	 * before writing other bits. Do it here before core unlocks all blocks
+	 * by writing block protection bits.
+	 */
+	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK,
+				    SKYHIGH_CONFIG_PROTECT_EN);
+}
+
+static const struct spinand_manufacturer_ops skyhigh_spinand_manuf_ops = {
+	.init = skyhigh_spinand_init,
+};
+
+const struct spinand_manufacturer skyhigh_spinand_manufacturer = {
+	.id = SPINAND_MFR_SKYHIGH,
+	.name = "SkyHigh",
+	.chips = skyhigh_spinand_table,
+	.nchips = ARRAY_SIZE(skyhigh_spinand_table),
+	.ops = &skyhigh_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5cf11005b41a..cbbcd44ac225 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -268,6 +268,7 @@ extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;
+extern const struct spinand_manufacturer skyhigh_spinand_manufacturer;
 extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
 extern const struct spinand_manufacturer winbond_spinand_manufacturer;
 extern const struct spinand_manufacturer xtx_spinand_manufacturer;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
