Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B7C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQ5wUl7yLy+ovKKhVaZrE7FXFYMsp15ZBdX8uqadTKM=; b=Wr9sT0Y2ziGXU/
	aNKpeLIMgZTedDAW23arr+IYsNurXlva3RVZDcLkuk/TpTk88QWtyMbTj+PpV5o2otYcySVQ0DcEG
	CGzkdJpZ+zPJvP+R2rBRN0w9aoXYKU00Gvu7zlaPr+wh7FaZpoaTEjV+5RyhNt2EkKIgdjC0q9Blf
	2r7FBva8NOK6OZAbY9+SuA5bcm39ypQKkmqcMy8CE3Nh0mBtCHPo1sZNTCtN9DFjW4Q7EHfTYROjj
	XrsLuoy02XB6LgYbvAW8ATpfe4mxMBOS84S9G7bMdBR6vDMRTXm0By30a59VmaRvWdQZAmmIQnkvE
	AeO6NA9rGufy5wfXMgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttut-00BpiB-8g; Wed, 25 May 2022 16:31:23 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttuo-00Bpe5-8z
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 16:31:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 710D8E0002;
	Wed, 25 May 2022 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653496273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TdjFV1XsB+I3EwnUV0iR8kLWRCov9nYkKJ9OO2zOOo=;
	b=Z4FLuXtVQyR0VS/6SFDu3cHKS9O3h+SnWjzrq2DlGfHQ3zuanpReFVeuOFJmqG8uFkA5aY
	7p91zH7CJttMQDwAfcharaThaS3JtY2xk3uHJQUaI7xxVQO6dWmjUKlYX7eJwAPnVnV5oL
	gOtcplf92h1uEtxUEC9V29m39LlHhZnYhQC8FROtab9DgQyvRnXEb1VT0DwwV4BOR1XvLn
	qkLf3o22+CBj0/ouw4LqFgB1pDmWDvl1C3a8fLXYwgbtg+V6/A/uEIhPfh4Yi3qguz5Ze/
	rC6WoLBdTFEMDPELRHgmO67VgKwGo0Vi4TGZkX9qN0Olam5pp2/HqjChU9oEZw==
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
Subject: [RFC PATCH 2/8] mtd: spi-nor: Introduce the concept of bank
Date: Wed, 25 May 2022 18:31:02 +0200
Message-Id: <20220525163108.266705-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525163108.266705-1-miquel.raynal@bootlin.com>
References: <20220525163108.266705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_093118_629077_CE4218B2 
X-CRM114-Status: GOOD (  15.56  )
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
index b4f141ad9c9c..a9698d6b9813 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2561,7 +2561,8 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
-	params->size = (u64)info->sector_size * info->n_sectors;
+	params->bank_size = (u64)info->sector_size * info->n_sectors;
+	params->size = params->bank_size * info->n_banks;
 	params->page_size = info->page_size;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85a1d464471f..f237aaeeb458 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -232,7 +232,8 @@ struct spi_nor_otp {
  * by the spi_nor_fixups hooks, or dynamically when parsing the JESD216
  * Serial Flash Discoverable Parameters (SFDP) tables.
  *
- * @size:		the flash memory density in bytes.
+ * @bank_size:		the flash memory bank density in bytes.
+ * @size:		the total flash memory density in bytes.
  * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
  *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
@@ -264,6 +265,7 @@ struct spi_nor_otp {
  * @locking_ops:	SPI NOR locking methods.
  */
 struct spi_nor_flash_parameter {
+	u64				bank_size;
 	u64				size;
 	u32				writesize;
 	u32				page_size;
@@ -322,7 +324,8 @@ struct spi_nor_fixups {
  * @id_len:         the number of bytes of ID.
  * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
  *                  isn't necessarily called a "sector" by the vendor.
- * @n_sectors:      the number of sectors.
+ * @n_sectors:      the number of sectors per bank.
+ * @n_banks:        the number of banks.
  * @page_size:      the flash's page size.
  * @addr_width:     the flash's address width.
  *
@@ -382,6 +385,7 @@ struct flash_info {
 	u8 id_len;
 	unsigned sector_size;
 	u16 n_sectors;
+	u16 n_banks;
 	u16 page_size;
 	u16 addr_width;
 
@@ -428,23 +432,25 @@ struct flash_info {
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
 
 #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width)	\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
+		.n_banks = 1,						\
 		.page_size = (_page_size),				\
 		.addr_width = (_addr_width),				\
 		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
