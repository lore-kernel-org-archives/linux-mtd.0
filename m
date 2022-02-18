Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA0DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbty1WGTpTOCg4obUeKGbig3AjpAhKhrSLQQuicpdcc=; b=pwGm9CSlpIFKs5
	n+WT+HcscYJCkCD/Dd2gsVdHwqiybcM5pmdggFocxth2MF7Iu3gmflQRcpWFu1aIt9Zwjz10NGunP
	PupAeR2HX7/wMX2fBiRa6Lp+M/1mRqYl9rfG+QG2Xbnv3XSA4O/i1Oc4a0WRZOSs+OMelXJYAwt9Y
	XQzhuvsZ4dsvw6BnptcyzqcO+bcJgHvXeinS7PoWQUcn9UnDaXVCr3nrzaFvgNPOjng4U+Lz9tSXj
	diccv4x37dc040HhAOmsj2bkQC/jx5T62qlT7i2nIZO7ZX9DVWUY32OyqfwQhjiFtsRf5y3rSTj/C
	NwWI0BSb5Wy7djkObang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL1fD-00E3lm-6K; Fri, 18 Feb 2022 11:43:03 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1Ym-00E1NN-Rx
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 11:36:27 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CDF4022453;
 Fri, 18 Feb 2022 12:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645184177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5GfVMbBGWmdvXhXIoW+ggWd1G9vkp3A24ZAKD/FfOY=;
 b=STLkdrZwqV4ycL94P2bDWqeV/e8uQfyZ/vlcjqTYXR3mMh1TR+KzMzx2E7ydoBjWrJFDLU
 r73PV/KrpV6uyzPeWQHM61jFECRCYeLhX2GxNJHrJhm+BMbLXpKL9KTII5dcNhJ1S9WNI8
 K413aWqOGGIjuWAn9/tsi7iRExHEWd0=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v2 12/32] mtd: spi-nor: spansion: unify function names
Date: Fri, 18 Feb 2022 12:35:47 +0100
Message-Id: <20220218113607.1360020-13-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218113607.1360020-1-michael@walle.cc>
References: <20220218113607.1360020-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_033625_082837_30E914D6 
X-CRM114-Status: GOOD (  12.64  )
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
 - <flash_family>_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/spansion.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 534196b1d3e7..c57ee085e1ba 100644
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
 
@@ -202,7 +202,7 @@ static const struct spi_nor_fixups s25fs_s_fixups = {
 	.post_bfpt = s25fs_s_post_bfpt_fixups,
 };
 
-static const struct flash_info spansion_parts[] = {
+static const struct flash_info spansion_nor_parts[] = {
 	/* Spansion/Cypress -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
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
