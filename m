Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B041C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=No1KfQz3zRH2YdZWt2BOnSmxy1oBvilTJB7kCPFVJPA=; b=rcQKv4/Uf/1wfT
	ux2RNTdc01UtWCC2C9WvisOk8u3eMgmt/f/NrzDD1GiL3SDgWv4gJo9hyISaYiEFRASsP/wAkfc33
	nYcmFrb0ykVvSZotDn3qEagTpAN+lfozmQgonm0Ks8pe53tL+IwNhp+hjL+fXtvoM0SQuo2C7mBk2
	+2HtGdevXDBLy/B5hW2LboDFFIqDwqQBvQFy/y0yD4Y/guE8HQEJF3o52WLekGlwd+8tI0SbqOjjo
	Y5xG4wXac3FOydcTkhAx449LDc9rdjE9t4/dvSo7MnTdoepELmVp2cabypnCRrgMfIA74NXran5ND
	y6ciK1f+uTW8oXj02tUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9XO-00G9ar-5q; Fri, 03 Dec 2021 14:27:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9TF-00G7yR-Gk; Fri, 03 Dec 2021 14:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541409; x=1670077409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J9jZi4n7gP48LU6Z+wqRmlFQw1RPxrK/4PE/IdfAuvA=;
 b=aMN+1hH0JyvwoG7i0udVk069qkXoEOwKEEMVcs71UCsYi8em4XP5E4sN
 K9Tc52IYEsCXYExEvl9Lab6De5Fr6V0oXiiEfsoILAQf4nfWPauvb8Tet
 NtxcG6wW4NgdWvU417LOs7H5B/Zy2od3vbBj+NaZZ3i+oRei+wJjtd4Zi
 pFH8aE6UvsoSLPvW9MItJbqWieo4g17au0UcqLH0M/WLkiHn9wSbMAcdi
 ySw2ZzTA2hNxh6aMTPVKuLNtRkhPQv98tTB5qvTJBEY8W8ah/YBzZcx43
 ecpQfcqb2Vo8vS5gptLNqp4UIA6/squZOh+xWpfIJvk+JWLm+KXW1zTWF A==;
IronPort-SDR: DbZhQLe8OBBunuhSBRxAgSUdJEhdtFuULUNCtNZImdR15IjNjoubFtUH0TpCOhA0Vjrj4xvBIK
 h/Q1/XfD8Nz/xhB3j/Hel3xibUZ7vslaexPGQqhGL/Xkhmu9JNjZq55az89LWLsOD5oEOvbafs
 CgRt1eri4UnZZoiMUjnWSyIVtEdYtCT0UYkzW5sWXEPi9LRZimwIf0Reg+76HVq9HRpqd7tyeI
 RFQxX+lqvfC8Yf4+28CDUhHFKfN1TALf3FbcVDwlUQn5w7HnJThsLIbjVUXX6RD4tcV/pKKpPF
 ML2NsyvlRYKr5qGddRmD/yEn
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="141189329"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:25 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:21 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 05/14] mtd: spi-nor: core: Introduce flash_info mfr_flags
Date: Fri, 3 Dec 2021 16:22:47 +0200
Message-ID: <20211203142256.47370-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062329_652862_D54823A2 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Used in the manufacturer fixup hooks to differentiate support
between flashes of the same manufacturer. Not used in the
SPI NOR core.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.h | 10 +++++++++-
 drivers/mtd/spi-nor/sst.c  | 41 ++++++++++++++++++++++++++++----------
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f6c4b6f4743b..a9fd956eed4e 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -336,7 +336,6 @@ struct flash_info {
 	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
-#define SST_WRITE		BIT(2)	/* use SST byte programming */
 #define SPI_NOR_NO_FR		BIT(3)	/* Can't do fastread */
 #define SECT_4K_PMC		BIT(4)	/* SPINOR_OP_BE_4K_PMC works uniformly */
 #define SPI_NOR_DUAL_READ	BIT(5)	/* Flash supports Dual Read */
@@ -385,6 +384,12 @@ struct flash_info {
 					 * protection bits. Usually these will
 					 * power-up in a write-protected state.
 					 */
+	u8 mfr_flags;			/*
+					 * Manufacturer private flags. Used in
+					 * the manufacturer fixup hooks to
+					 * differentiate support between flashes
+					 * of the same manufacturer.
+					 */
 
 	const struct spi_nor_otp_organization otp_org;
 
@@ -450,6 +455,9 @@ struct flash_info {
 			.n_regions = (_n_regions),			\
 		},
 
+#define MFR_FLAGS(_mfr_flags)						\
+		.mfr_flags = (_mfr_flags),				\
+
 /**
  * struct spi_nor_manufacturer - SPI NOR manufacturer object
  * @name: manufacturer name
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 3593aae0920f..8f1ebb8fd05f 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -8,6 +8,9 @@
 
 #include "core.h"
 
+/* SST flash_info mfr_flag. Used to specify SST byte programming. */
+#define SST_WRITE		BIT(0)
+
 #define SST26VF_CR_BPNV		BIT(3)
 
 static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
@@ -58,28 +61,46 @@ static const struct spi_nor_fixups sst26vf_fixups = {
 static const struct flash_info sst_parts[] = {
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
 			      SECT_4K | SPI_NOR_4BIT_BP | SPI_NOR_HAS_LOCK |
 			      SPI_NOR_SWP_IS_VOLATILE) },
 	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		MFR_FLAGS(SST_WRITE) },
 	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
@@ -179,7 +200,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 static void sst_late_init(struct spi_nor *nor)
 {
-	if (nor->info->flags & SST_WRITE)
+	if (nor->info->mfr_flags & SST_WRITE)
 		nor->mtd._write = sst_write;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
