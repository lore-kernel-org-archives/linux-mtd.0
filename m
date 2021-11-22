Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B468C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r71FHu5S8gq3NaVhH3rOPb0zObLU+/S6hkyxNw5rER0=; b=3o/sminfDUoHjT
	ovCwTYhCqqqMjcfsmjmOHL06788xlr2Ze8KilLu2p/ge5WLRMypKls3zxIJigS23DZEYSaCKPypjR
	mhC6+QKPgAjdnOcbxd9H1mFs0Wlu5VPJWOJ1RCov5S4T0DWWRRGnix08AIBSsmxb0h8NtmqQWxetR
	JHuVDhHEbsSxMihczs/rh7DjbU363XG2USyu2B5/f+D1Af7cX/5swwaME0JMN00PeEEjtIC8Lj4Sd
	W92ZakXwU1CcgtEciHXO3WS7FKVtTMiuPWOnY20J+4lSP4+BErfLivsXHDfkzJFcijzQ4ke3G1EVD
	LZUiCOatFPcZcTXQSIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6Oz-00FoJG-7I; Mon, 22 Nov 2021 10:18:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5yQ-00FguM-IM; Mon, 22 Nov 2021 09:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574654; x=1669110654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WgaGE+3qs/jvMbtASF99YBH/6Za33+bkv25Uvx6oDc4=;
 b=TFscy88OJ/pbnNhE5NFhlmkoMj93tEKG62hzcpnZobDXh4MUfU4GbdqX
 1KW/uk0IZQiSnyjH0gciOrYW3VtGne5QB44bAyH6QAt0mGkEpsUNcvkQz
 ZruryqlM4CR/CirgozoyFZK5vcGcnr1521xkYZ57sahUSFCIT9OsfeHAH
 oNZnA/9Xdox1GopqeaTfoOGLtauR2CmRqlOr6M4/UFuCbxMAlQP6oYHXV
 rY8RBFUAMg7A69/GouWw7SI55dmsP88E9p2VOtQBcd5FAPW/Evkdk6jQG
 J/dgGq3gtPJQiIvC1EnlNJtdx8UW5qz1zW8MJHC1f20fuVH+vGPsOQDYr g==;
IronPort-SDR: kaWtk0iy2utvZqSEAM8iQK41zJzQeCKWd6JTKjKpWSbM4vgvJm7Y9N0JHsYeh81xvhzbEt+SHr
 02M9UT+AFFMw4InuUNP9OogAtM+S89xtm0iV31THjIFa2fwsAU3sbEpf5aZyQ8WBX9LEcUdFJD
 P+U+nAP/dQm0AqcVuo4plGsQVhU6gTEEqFcn+UOEiQljGMcvvKruWGbZO9XCWAT8YwDy+QjUCt
 yV6r42f14QHU0QXuJUa6eyvD06JNzq20i2EcpApcrMLAgnL/gDcBDtNsevm+FxHvPYQ6wx03Fo
 /tTgoTdVmbcrrFXX0g6DBDVN
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="152761235"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:50:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:50:47 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:50:42 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 04/13] mtd: spi-nor: core: Introduce flash_info mfr_flags
Date: Mon, 22 Nov 2021 11:50:11 +0200
Message-ID: <20211122095020.393346-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015054_688229_1056B6AB 
X-CRM114-Status: GOOD (  15.57  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
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
---
v4: new patch

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
