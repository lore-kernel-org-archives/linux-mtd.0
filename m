Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596CBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+phOjsBnuBgHTvey6AOWdjJBgF9HB6Pjp44gjGMgS4=; b=pjL6yGZb0V+jyH
	ZDet4OXWR5rQpGx3T7CBnmbQWt6uWYuZZnJ4SNeE6RboyaeqlTxG8fW1Te3jo8d0SgLXcsuR5N/vM
	pawpHrQouqffjPuTv6hD6VmzPjvsAL2BCsNy+mXvxqgmpPias4AlPZ9I3pnpSQGg2+1afwoaGnphV
	/wmEhnn257IQVGH9F4gwg2T689zrMU9XXXyNFzybgt3fStdUhamlEqrmRMiDXtEzBjYYcfuE9CGvA
	AJ+xJqp0VyKgM71GRYZ6pqzAyfTcp+2TijFirBJLONDwnkD2qyKnv9ssGrs2QE4frRV8684mf5Dej
	g0b1IRbVyRovydI/wohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMs2T-00Ebax-AU; Wed, 23 Feb 2022 13:50:41 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwF-00EZSp-9Z
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:17 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D73A22244F;
 Wed, 23 Feb 2022 14:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2K+vGEHJzHmcPcjSMsyw/2Iai2nusSM6WwW3dzCQoWw=;
 b=uw/MjrF97k7UNMlScc9NpL9cwK8PEcAqfEuAxOpmHO8WBCz+Gg3RVzgYCsJRpcqlTZvxbn
 orcC48OTHsDoBoD9x8/Lwt1wwN4L79z4q04TKrwdgENxrqdkTLifdCcYNol8m5YrlgYMWe
 gFA2hheUE4tqKqQ+iokzLC70dXIZIt0=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 11/32] mtd: spi-nor: micron-st: unify function names
Date: Wed, 23 Feb 2022 14:43:37 +0100
Message-Id: <20220223134358.1914798-12-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054415_544499_8CEDFE0A 
X-CRM114-Status: GOOD (  12.79  )
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
 drivers/mtd/spi-nor/micron-st.c | 34 ++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index bb95b1aabf74..7a68f2ad3ea1 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -17,7 +17,7 @@
 #define SPINOR_MT_OCT_DTR	0xe7	/* Enable Octal DTR. */
 #define SPINOR_MT_EXSPI		0xff	/* Enable Extended SPI (default) */
 
-static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
+static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -102,7 +102,7 @@ static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
 
 static void mt35xu512aba_default_init(struct spi_nor *nor)
 {
-	nor->params->octal_dtr_enable = spi_nor_micron_octal_dtr_enable;
+	nor->params->octal_dtr_enable = micron_st_nor_octal_dtr_enable;
 }
 
 static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
@@ -130,7 +130,7 @@ static const struct spi_nor_fixups mt35xu512aba_fixups = {
 	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
 };
 
-static const struct flash_info micron_parts[] = {
+static const struct flash_info micron_nor_parts[] = {
 	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512)
 		FLAGS(USE_FSR)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ |
@@ -143,7 +143,7 @@ static const struct flash_info micron_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
-static const struct flash_info st_parts[] = {
+static const struct flash_info st_nor_parts[] = {
 	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64)
@@ -250,15 +250,15 @@ static const struct flash_info st_parts[] = {
 };
 
 /**
- * st_micron_set_4byte_addr_mode() - Set 4-byte address mode for ST and Micron
- * flashes.
+ * micron_st_nor_set_4byte_addr_mode() - Set 4-byte address mode for ST and
+ * Micron flashes.
  * @nor:	pointer to 'struct spi_nor'.
  * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
  *		address mode.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int st_micron_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+static int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
@@ -273,28 +273,28 @@ static int st_micron_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	return spi_nor_write_disable(nor);
 }
 
-static void micron_st_default_init(struct spi_nor *nor)
+static void micron_st_nor_default_init(struct spi_nor *nor)
 {
 	nor->flags |= SNOR_F_HAS_LOCK;
 	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
 	nor->params->quad_enable = NULL;
-	nor->params->set_4byte_addr_mode = st_micron_set_4byte_addr_mode;
+	nor->params->set_4byte_addr_mode = micron_st_nor_set_4byte_addr_mode;
 }
 
-static const struct spi_nor_fixups micron_st_fixups = {
-	.default_init = micron_st_default_init,
+static const struct spi_nor_fixups micron_st_nor_fixups = {
+	.default_init = micron_st_nor_default_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_micron = {
 	.name = "micron",
-	.parts = micron_parts,
-	.nparts = ARRAY_SIZE(micron_parts),
-	.fixups = &micron_st_fixups,
+	.parts = micron_nor_parts,
+	.nparts = ARRAY_SIZE(micron_nor_parts),
+	.fixups = &micron_st_nor_fixups,
 };
 
 const struct spi_nor_manufacturer spi_nor_st = {
 	.name = "st",
-	.parts = st_parts,
-	.nparts = ARRAY_SIZE(st_parts),
-	.fixups = &micron_st_fixups,
+	.parts = st_nor_parts,
+	.nparts = ARRAY_SIZE(st_nor_parts),
+	.fixups = &micron_st_nor_fixups,
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
