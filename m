Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF0EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSrNP+XGv7Z00EADRF3i2UOuDLkPmmeH3prV+mCkZSA=; b=R8Sm7vDRz6BluC
	41LjzsHcOCDmgzP3kWlBGyKaa3O51bO1rEzI1u7lCwskM5ZKy70BMe3KRhbgcTEr7B9fnOZ3n1Ev0
	eEeJ4cWDENRbPE9IeQCbt3uluI7YVUrQtir2jr9i86bDJzuR+bUi4JXLf+9X4ZIJbQEoP76aKIHag
	73XyRniSbv7woEeJ8l/YrnHX/YqpNj3R8l8P91KMp5ZRGUNNaak0jHYJwZUyby1O5yXEEBWMHErw8
	pLdSOI7Pp/1ocu9wSnikT4yrhqSq1nchFpZOkbk8a+Te1LfcAmKUd98Te2zZ0MvdbgsaUq6qJzDzY
	2AOuv/PSsH0iSvFasqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM4Th-004S4O-Hs; Mon, 21 Feb 2022 08:55:30 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4R7-004Qdr-LL
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:52:54 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1BE072223E;
 Mon, 21 Feb 2022 09:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Yom6dh+Jyd2Ptl27L6qolXTGIY0AoDGxM0ycUJadzo=;
 b=Ar6n0agiO6uqRE9Q39+aDqvZa3Rr8fpz5b26+EZyBNwllIMRk6Y/y90nY+0BEM6LfIkib3
 ZTjMrZBDWBXZGpPbFAxYF2sQ4HD6NBGWJ5TI4VzkiSFeDCsFm8tKaTUy9NH8l/G6GvITpL
 1szebn2s7Y3mFNcfIDctR5s0a1CpD1I=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 01/32] mtd: spi-nor: atmel: unify function names
Date: Mon, 21 Feb 2022 09:52:05 +0100
Message-Id: <20220221085236.1452024-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005250_045807_E9451CFF 
X-CRM114-Status: GOOD (  14.47  )
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
---
 drivers/mtd/spi-nor/atmel.c | 81 +++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index d6d889ce8876..656dd80a0be7 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -16,12 +16,12 @@
  * is to unlock the whole flash array on startup. Therefore, we have to support
  * exactly this operation.
  */
-static int atmel_at25fs_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int at25fs_nor_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	return -EOPNOTSUPP;
 }
 
-static int atmel_at25fs_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int at25fs_nor_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	int ret;
 
@@ -37,28 +37,28 @@ static int atmel_at25fs_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-static int atmel_at25fs_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int at25fs_nor_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	return -EOPNOTSUPP;
 }
 
-static const struct spi_nor_locking_ops atmel_at25fs_locking_ops = {
-	.lock = atmel_at25fs_lock,
-	.unlock = atmel_at25fs_unlock,
-	.is_locked = atmel_at25fs_is_locked,
+static const struct spi_nor_locking_ops at25fs_nor_locking_ops = {
+	.lock = at25fs_nor_lock,
+	.unlock = at25fs_nor_unlock,
+	.is_locked = at25fs_nor_is_locked,
 };
 
-static void atmel_at25fs_late_init(struct spi_nor *nor)
+static void at25fs_nor_late_init(struct spi_nor *nor)
 {
-	nor->params->locking_ops = &atmel_at25fs_locking_ops;
+	nor->params->locking_ops = &at25fs_nor_locking_ops;
 }
 
-static const struct spi_nor_fixups atmel_at25fs_fixups = {
-	.late_init = atmel_at25fs_late_init,
+static const struct spi_nor_fixups at25fs_nor_fixups = {
+	.late_init = at25fs_nor_late_init,
 };
 
 /**
- * atmel_set_global_protection - Do a Global Protect or Unprotect command
+ * atmel_nor_set_global_protection - Do a Global Protect or Unprotect command
  * @nor:	pointer to 'struct spi_nor'
  * @ofs:	offset in bytes
  * @len:	len in bytes
@@ -66,8 +66,8 @@ static const struct spi_nor_fixups atmel_at25fs_fixups = {
  *
  * Return: 0 on success, -error otherwise.
  */
-static int atmel_set_global_protection(struct spi_nor *nor, loff_t ofs,
-				       uint64_t len, bool is_protect)
+static int atmel_nor_set_global_protection(struct spi_nor *nor, loff_t ofs,
+					   uint64_t len, bool is_protect)
 {
 	int ret;
 	u8 sr;
@@ -116,17 +116,20 @@ static int atmel_set_global_protection(struct spi_nor *nor, loff_t ofs,
 	return spi_nor_write_sr(nor, nor->bouncebuf, 1);
 }
 
-static int atmel_global_protect(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int atmel_nor_global_protect(struct spi_nor *nor, loff_t ofs,
+				    uint64_t len)
 {
-	return atmel_set_global_protection(nor, ofs, len, true);
+	return atmel_nor_set_global_protection(nor, ofs, len, true);
 }
 
-static int atmel_global_unprotect(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int atmel_nor_global_unprotect(struct spi_nor *nor, loff_t ofs,
+				      uint64_t len)
 {
-	return atmel_set_global_protection(nor, ofs, len, false);
+	return atmel_nor_set_global_protection(nor, ofs, len, false);
 }
 
-static int atmel_is_global_protected(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int atmel_nor_is_global_protected(struct spi_nor *nor, loff_t ofs,
+					 uint64_t len)
 {
 	int ret;
 
@@ -140,47 +143,47 @@ static int atmel_is_global_protected(struct spi_nor *nor, loff_t ofs, uint64_t l
 	return ((nor->bouncebuf[0] & ATMEL_SR_GLOBAL_PROTECT_MASK) == ATMEL_SR_GLOBAL_PROTECT_MASK);
 }
 
-static const struct spi_nor_locking_ops atmel_global_protection_ops = {
-	.lock = atmel_global_protect,
-	.unlock = atmel_global_unprotect,
-	.is_locked = atmel_is_global_protected,
+static const struct spi_nor_locking_ops atmel_nor_global_protection_ops = {
+	.lock = atmel_nor_global_protect,
+	.unlock = atmel_nor_global_unprotect,
+	.is_locked = atmel_nor_is_global_protected,
 };
 
-static void atmel_global_protection_late_init(struct spi_nor *nor)
+static void atmel_nor_global_protection_late_init(struct spi_nor *nor)
 {
-	nor->params->locking_ops = &atmel_global_protection_ops;
+	nor->params->locking_ops = &atmel_nor_global_protection_ops;
 }
 
-static const struct spi_nor_fixups atmel_global_protection_fixups = {
-	.late_init = atmel_global_protection_late_init,
+static const struct spi_nor_fixups atmel_nor_global_protection_fixups = {
+	.late_init = atmel_nor_global_protection_late_init,
 };
 
-static const struct flash_info atmel_parts[] = {
+static const struct flash_info atmel_nor_parts[] = {
 	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
 	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4)
 		FLAGS(SPI_NOR_HAS_LOCK)
 		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_at25fs_fixups },
+		.fixups = &at25fs_nor_fixups },
 	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8)
 		FLAGS(SPI_NOR_HAS_LOCK)
 		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_at25fs_fixups },
+		.fixups = &at25fs_nor_fixups },
 	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_global_protection_fixups },
+		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_global_protection_fixups },
+		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_global_protection_fixups },
+		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_global_protection_fixups },
+		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
@@ -188,21 +191,21 @@ static const struct flash_info atmel_parts[] = {
 	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_global_protection_fixups },
+		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_global_protection_fixups },
+		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_global_protection_fixups },
+		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16)
 		NO_SFDP_FLAGS(SECT_4K) },
 };
 
 const struct spi_nor_manufacturer spi_nor_atmel = {
 	.name = "atmel",
-	.parts = atmel_parts,
-	.nparts = ARRAY_SIZE(atmel_parts),
+	.parts = atmel_nor_parts,
+	.nparts = ARRAY_SIZE(atmel_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
