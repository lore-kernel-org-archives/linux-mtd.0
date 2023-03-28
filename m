Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A80FC6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mV5qbD5gXOWrRpbFihCOABpabQ/SQT5UWxPAjwsO8HI=; b=pOf6vTf5MfcIe8
	gtZnzUsAwyyC1u4UPjmfYK9TIn4Df0Pp907+wu5ylmVY7DZVhz84M9nyEuQvmeRaUugYSkfrky8yz
	rRQjz3KVY+TK4zeDKyd22DcmTtifZjwmCN1Z8hiHoieiQ96t2EwVMlYI8rAWMc9V2ZFrxakdGdeG5
	PaMNbv8NQ2K63nfgsxIUwReUMLmf+ZpqleYnHjzsvlwYnxeesm946e7/xHODtzH7TNQuHLYkcgC1p
	/wOTcLKVGnYAveVVUGX3ZfGI6oJNOVYIYVE1eduAgnig1ZCd+JkweEDYFbLSHUV0xNfXVw5ieQFtw
	wXV8yddtu0S8w6pTYOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBRx-00Eymu-1W;
	Tue, 28 Mar 2023 15:41:29 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBRi-00Eycs-2f;
	Tue, 28 Mar 2023 15:41:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D312C6000E;
	Tue, 28 Mar 2023 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680018070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TweW83xYmxYwAjJCKDSfe9u18vP8Wfd1+Bvg2sYpDX8=;
	b=WUmXWRV+lVh32a4NKSbWhPCT/cScwtumIOsAqx7nf108BZrot/8Gg+5zKh172QYAr4zQa8
	JGCGXexFFSdRdql4dtLAX8/veDIiqtmnzVZcmwGGgRDBbGHkaoLayDLa2jace9vTxVw98D
	8T3Lr6fmoPNt9nuGtsg+ZfK/HqDdokxAYTlC60dY+S2MVw32AgBsaTs9MbQISfnLiNOhD2
	BLLU7QuTQiSKuchc4pNU4f7Z0dB0oAwa6T8RTFR2MRoR9oIymD6qHDlG6CBx0K3+Wr06wi
	3Iix6nvxXPMdaTdQGdxiAjKaIi/KyiDhXoGtLLxVC9G8hFuvzVZEIAu82k+vYQ==
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
Subject: [PATCH v5 1/8] mtd: spi-nor: Introduce the concept of bank
Date: Tue, 28 Mar 2023 17:40:58 +0200
Message-Id: <20230328154105.448540-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328154105.448540-1-miquel.raynal@bootlin.com>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_084115_159038_DE5C5D24 
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

SPI NOR chips are made of pages, which gathered in small groups make
(erase) sectors. Sectors, gathered together, make banks inside the
chip. Until now, there was only one bank per device supported, but we
are about to introduce support for new chips featuring several banks (up
to 4 so far) where different operations may happen in parallel.

Let's allow describing these additional bank parameters, and let's do
this independently of any other value (like the number of sectors) with
an absolute value.

By default we consider that all chips have a single bank.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   | 16 +++++++++++-----
 drivers/mtd/spi-nor/xilinx.c |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0a78045ca1d9..7d9ca799f767 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2583,6 +2583,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
 	params->size = (u64)info->sector_size * info->n_sectors;
+	params->bank_size = div64_u64(params->size, info->n_banks);
 	params->page_size = info->page_size;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 25423225c29d..db0e458810c7 100644
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
@@ -435,6 +437,7 @@ struct spi_nor_fixups {
  * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
  *                  isn't necessarily called a "sector" by the vendor.
  * @n_sectors:      the number of sectors.
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
