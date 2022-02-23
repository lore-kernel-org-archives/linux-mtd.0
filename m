Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F64C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 13:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffhP0mhANudCLzpMLIYVoH7cXe3Lr+NOBZJcSooOMZI=; b=OWVmNq1NqcZbgW
	XgU6mRbt5yUV/LqW3wSl6f1CgKpXy03eTlmckhf1PF0AmusJjRvUE4GaWLOWCfsJV8SW0Y7gks2QR
	ogc1qePVHEQBBW/1FYZCRG3khYf8A5VAo4pHHlUKWGnK7AAdJROcCW3HWZMeoGkYnIoXq3V4v6QZH
	o0yedyzIYeAleacR0tYHKK2FmCzM4GP5aWEdmw1PhLyeKx0avqztS2yq/d1vTCqMBWXjNCqvxjB90
	jNLmZ0gIUD0mH8fo9vZuGXiF5W9qUzTLuPbi2Gnn5x6c2nBRObQl6eNGGapxbmK7lhFdhXH23qtS5
	Ncrr0R/eYOYF0XELajzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMs3n-00Ebxa-FL; Wed, 23 Feb 2022 13:52:03 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwF-00EZSq-A6
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:18 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3D07F22450;
 Wed, 23 Feb 2022 14:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emse0VG+uvPnYP/0DVMRTDTPmxiGaj9AioEpZtVOwP0=;
 b=lOXIOIar49Yk725Tyy7+P0Kao0DZCUfraicdaDBYXhQFw5EFlnbkGJ+zEYRX1Oy0MB7RQo
 g1jVim8bR+8ASE5S7mPK4Mo7ziQUDd1QYFIARMVtDrz3WcuNv1neeNl8PeOcgsVlXXrhN6
 0ebR1QU8vZd7Xc7zI4b54K9rcDc1/6s=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 12/32] mtd: spi-nor: spansion: unify function names
Date: Wed, 23 Feb 2022 14:43:38 +0100
Message-Id: <20220223134358.1914798-13-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054415_679419_4FE3E9A4 
X-CRM114-Status: GOOD (  15.05  )
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

To avoid name clashes unify all the function and static object names and
use one of the following prefixes which should be sufficiently unique:
 - <vendor>_nor_
 - <flash_family>_nor_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/spansion.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 534196b1d3e7..5affa8ae43a7 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -20,7 +20,7 @@
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
 /**
- * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
+ * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
  * @enable:              whether to enable or disable Octal DTR
  *
@@ -29,7 +29,7 @@
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
+static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -116,7 +116,7 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
 
 static void s28hs512t_default_init(struct spi_nor *nor)
 {
-	nor->params->octal_dtr_enable = spi_nor_cypress_octal_dtr_enable;
+	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
 	nor->params->writesize = 16;
 }
 
@@ -183,9 +183,9 @@ static const struct spi_nor_fixups s28hs512t_fixups = {
 };
 
 static int
-s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
-			 const struct sfdp_parameter_header *bfpt_header,
-			 const struct sfdp_bfpt *bfpt)
+s25fs_s_nor_post_bfpt_fixups(struct spi_nor *nor,
+			     const struct sfdp_parameter_header *bfpt_header,
+			     const struct sfdp_bfpt *bfpt)
 {
 	/*
 	 * The S25FS-S chip family reports 512-byte pages in BFPT but
@@ -198,11 +198,11 @@ s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
-static const struct spi_nor_fixups s25fs_s_fixups = {
-	.post_bfpt = s25fs_s_post_bfpt_fixups,
+static const struct spi_nor_fixups s25fs_s_nor_fixups = {
+	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
 };
 
-static const struct flash_info spansion_parts[] = {
+static const struct flash_info spansion_nor_parts[] = {
 	/* Spansion/Cypress -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
@@ -229,7 +229,7 @@ static const struct flash_info spansion_parts[] = {
 	{ "s25fs128s1", INFO6(0x012018, 0x4d0181, 64 * 1024, 256)
 		FLAGS(USE_CLSR)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		.fixups = &s25fs_s_fixups, },
+		.fixups = &s25fs_s_nor_fixups, },
 	{ "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128)
 		FLAGS(USE_CLSR)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
@@ -239,7 +239,7 @@ static const struct flash_info spansion_parts[] = {
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256)
 		FLAGS(USE_CLSR)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		.fixups = &s25fs_s_fixups, },
+		.fixups = &s25fs_s_nor_fixups, },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64)
@@ -294,7 +294,7 @@ static const struct flash_info spansion_parts[] = {
 	},
 };
 
-static void spansion_late_init(struct spi_nor *nor)
+static void spansion_nor_late_init(struct spi_nor *nor)
 {
 	if (nor->params->size <= SZ_16M)
 		return;
@@ -305,13 +305,13 @@ static void spansion_late_init(struct spi_nor *nor)
 	nor->mtd.erasesize = nor->info->sector_size;
 }
 
-static const struct spi_nor_fixups spansion_fixups = {
-	.late_init = spansion_late_init,
+static const struct spi_nor_fixups spansion_nor_fixups = {
+	.late_init = spansion_nor_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_spansion = {
 	.name = "spansion",
-	.parts = spansion_parts,
-	.nparts = ARRAY_SIZE(spansion_parts),
-	.fixups = &spansion_fixups,
+	.parts = spansion_nor_parts,
+	.nparts = ARRAY_SIZE(spansion_nor_parts),
+	.fixups = &spansion_nor_fixups,
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
