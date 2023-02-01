Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31B6C636D3
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqUiGxAD3Ri3EfhRrMoT10FbM0qcD7xcCPPvTAER0yo=; b=ZZvr2MI4VhbNL4
	1T168CLuX4Xhoz4kiWb/1zNfLQ9d2aUXAdGTRpex6csWDS7Rbqpvakp+CHkovjC7F4mu/j+lZiRtN
	1qSzPq+PlSgOGYsDxNKV6zyzcRqLYiSruQ7fo8uIIX6QIs+9beMgbeURpLtM61NBv2Lsd3jtLkBHo
	lr98B/CrY+w/w7Fo5pmZhQg/eUUVgfbu6aeEr2wY5gRVtPwQWaBIsgctTKJ1HbWAqrziUHe1NBA8X
	6IHAKbFKkfWZSfDq6zMpxLNFZwil+TMqMXr4h8INKxvb+alv0WsBsNPtmBQNT0nEnxwdCYLTASlN7
	c70ZIlaihyI+tBgBE+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBPo-00BVPk-G8; Wed, 01 Feb 2023 11:36:36 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBPP-00BVFc-IS; Wed, 01 Feb 2023 11:36:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96F5924000B;
	Wed,  1 Feb 2023 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675251369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXVgZ23fkg1ZHbDrZEPRPTDcAF/+j77Bc28ZoPF681E=;
	b=M4c5ZBApm0x/mve3DmhUTJ9iMbnqkZd0wfOMSbAk+q9fnpWcoMajBQWyosxme2aG1WQf2j
	sJBYa89cEDG+8HK/jwDRxuXn2frwEsxm4os5ve+5nk8yKhkal1SHnFOUa2tVTuZ7QKctxC
	8ADt7vY0kK6gT3JhH0BhZwidHV48TFY0d6XWTst4aYEiRGaJv8mT5EMGRU08PpzqeRzz7P
	KsZ7fZ2xgiWFLZG2fgXjPnQPTKQLo7+jpHVkdtKVV0dUiBdzhtgDCui81MNaXGT4+mWv7O
	y9h99gKVLGeI/+SCgCeEcybVkJN1bYbezgXeioCFuRjAKaEXj9esUwulXgQQrA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michal Simek <monstr@monstr.eu>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 1/8] mtd: spi-nor: Introduce the concept of bank
Date: Wed,  1 Feb 2023 12:35:56 +0100
Message-Id: <20230201113603.293758-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201113603.293758-1-miquel.raynal@bootlin.com>
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_033611_902536_B4E99A76 
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

SPI NOR chips are made of pages, which gathered in small groups make
(erase) sectors. Sectors, gathered together, make banks inside the
chip. So far there was only one bank per device supported, but we are
about to introduce support for new chips featuring several banks (up to
4 so far) where different operations may happen in parallel.

Let's allow describing these additional bank parameters, and let's do
this independently of any other value (like the number of sectors) with
an absolute value.

By default we consider that all chips have a single bank.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 drivers/mtd/spi-nor/core.c   |  3 ++-
 drivers/mtd/spi-nor/core.h   | 18 ++++++++++++------
 drivers/mtd/spi-nor/xilinx.c |  1 +
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b500655f7937..3845de9c874c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2574,7 +2574,8 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
-	params->size = (u64)info->sector_size * info->n_sectors;
+	params->bank_size = (u64)info->sector_size * info->n_sectors;
+	params->size = params->bank_size * info->n_banks;
 	params->page_size = info->page_size;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f6d012e1f681..768ccd1a5a8a 100644
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
@@ -495,6 +498,7 @@ struct flash_info {
 	unsigned sector_size;
 	u16 n_sectors;
 	u16 page_size;
+	u8 n_banks;
 	u8 addr_nbytes;
 
 	bool parse_sfdp;
@@ -540,24 +544,26 @@ struct flash_info {
 	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_3ITEMS(_ext_id) }, \
 	.id_len = 6
 
-#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors)			\
+#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
 	.sector_size = (_sector_size),					\
 	.n_sectors = (_n_sectors),					\
-	.page_size = 256
+	.page_size = 256,						\
+	.n_banks = (_n_banks)
 
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
 		.page_size = (_page_size),				\
+		.n_banks = 1,						\
 		.addr_nbytes = (_addr_nbytes),				\
 		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
 
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 5723157739fc..7175de8aa336 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -31,6 +31,7 @@
 		.sector_size = (8 * (_page_size)),			\
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\
+		.n_banks = 1,						\
 		.addr_nbytes = 3,					\
 		.flags = SPI_NOR_NO_FR
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
