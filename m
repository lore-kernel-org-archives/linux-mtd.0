Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F6EC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zG+kV7YP5urn3LiatKElqQ7wnLBAFiaefd9lWAM7Gjs=; b=L00e/eAb5a1HCg
	4gbTNJqIVKnmOGiENERFx8bgC0Y8R/ey3EbAkuLYNLczLv0D3+3d/9eRhhv4WrJlX9eeRXDr/TxPf
	qIFvH3HH4YbhopJFzQOX3WLFOHN3aMrKIllZnzVvVpkmJpioWLfO/RUGg9AuH/wutOb6bm5hGkvnR
	HqfIrUzKf3UTQfYh9mppgUKkY22AHC0kaYnv/x8WTlHgCRXwDChddbtne8WXaGPULEK2r/OSldW5s
	Ege88hOaVpqgVeKGZkfm7O/DovevrK+Mh2KbsL0354/TZA3nauvd27SHwaGpntZzJPC01QD3soto0
	LJiGaqYN5Jpf0d7091aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9u4-006x4q-Ei; Thu, 10 Nov 2022 15:55:44 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9tj-006wqc-NC
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:55:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C883F20012;
	Thu, 10 Nov 2022 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3lv1kebkWPnI4CIcBeWIzzhp8T/Dj8N57dslwnNYjOA=;
	b=XSOW/6nutgTKT0Kf1SmjQug26m9vrymgVa6zIEPa7WHml6B/F0zuNLfXkUHH2w1pBuAJy3
	De4qbCQyA10CsvVdBtpZ+kde9Z3jDjdSxb/QDBJoR/wLaKTvdCWiPWEmVjMkorM5arEtUC
	8z9WgNvdiG5KauQEsGL017gGo0XAbFyltkfvunIfJwAszaK1pGRklrVyYujxnk0Jd4am/y
	BmMqcxr6E7Azj0kLmarujIuT3ZMw/IafZ1BgxzH/vlt/o93Z5oMVkLgl6kOqcgvgpI80Fp
	/Jy5/Xr4DboIys5XnrPpHsznB4Jbo0MOeUMkQDHAn2J7J5UlXBCgDWkAVJQylw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/9] mtd: spi-nor: Introduce the concept of bank
Date: Thu, 10 Nov 2022 16:55:06 +0100
Message-Id: <20221110155513.819798-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155513.819798-1-miquel.raynal@bootlin.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075524_128039_1B2B469B 
X-CRM114-Status: GOOD (  14.98  )
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

SPI-NOR chips are made of pages, which gathered in small groups make
(erase) sectors. Sectors, gathered together, make banks inside the
chip. So far there was only one bank per device supported, but we are
about to introduce support for new chips featuring several banks (up to
4 so far) where different operations may happen in parallel.

Let's allow describing these additional bank parameters.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c |  3 ++-
 drivers/mtd/spi-nor/core.h | 16 +++++++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..38a57aac6754 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2539,7 +2539,8 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
-	params->size = (u64)info->sector_size * info->n_sectors;
+	params->bank_size = (u64)info->sector_size * info->n_sectors;
+	params->size = params->bank_size * info->n_banks;
 	params->page_size = info->page_size;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index dc74c7be3e28..8a067d56c995 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -336,7 +336,8 @@ struct spi_nor_otp {
  * by the spi_nor_fixups hooks, or dynamically when parsing the JESD216
  * Serial Flash Discoverable Parameters (SFDP) tables.
  *
- * @size:		the flash memory density in bytes.
+ * @bank_size:		the flash memory bank density in bytes.
+ * @size:		the total flash memory density in bytes.
  * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
  *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
@@ -374,6 +375,7 @@ struct spi_nor_otp {
  * @locking_ops:	SPI NOR locking methods.
  */
 struct spi_nor_flash_parameter {
+	u64				bank_size;
 	u64				size;
 	u32				writesize;
 	u32				page_size;
@@ -434,7 +436,8 @@ struct spi_nor_fixups {
  * @id_len:         the number of bytes of ID.
  * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
  *                  isn't necessarily called a "sector" by the vendor.
- * @n_sectors:      the number of sectors.
+ * @n_sectors:      the number of sectors per bank.
+ * @n_banks:        the number of banks.
  * @page_size:      the flash's page size.
  * @addr_nbytes:    number of address bytes to send.
  *
@@ -493,6 +496,7 @@ struct flash_info {
 	u8 id_len;
 	unsigned sector_size;
 	u16 n_sectors;
+	u16 n_banks;
 	u16 page_size;
 	u8 addr_nbytes;
 
@@ -538,23 +542,25 @@ struct flash_info {
 	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_3ITEMS(_ext_id) }, \
 	.id_len = 6
 
-#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors)			\
+#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
 	.sector_size = (_sector_size),					\
 	.n_sectors = (_n_sectors),					\
+	.n_banks = (_n_banks),						\
 	.page_size = 256
 
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
-	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
 
 #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
 	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
-	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
 
 #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
+		.n_banks = 1,						\
 		.page_size = (_page_size),				\
 		.addr_nbytes = (_addr_nbytes),				\
 		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
