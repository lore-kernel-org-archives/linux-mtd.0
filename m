Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F87EE49A3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3hXyJfwhzvRFXKF7WBhG2PEUvMuy/KYEA3vgzywOT8=; b=mmJX2zg1enau1b
	DmCwtPBmD5MhzyhAbGOOIpOrAE6OUrQc0Bv896S5BXPGmopUkj9xmp7FMWmnrlD3CKvpEzzMcpW4H
	ndaZk6TAvVLDDioTA31QQAlE9gKTjrz00Es7DfKbblB+WhbNaO/dQxI/E31/RqmDoHF0jjAjmOrhM
	fP3KHuYON7gXxiOROYBuVX7JoAPoEwhSER6JYuLoWFCai+nrTXnut01llWCAu26eD3TJDcNdwJMxQ
	vbpLt6oGn3deQIOe7SyV2lenMHnIRQGA23AwnVXJzAomAU/OxgWwU+syWiFZMbV6D0Cf22di0ysbi
	6V1ahikD0Coh7azJuifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWX-00FHuG-0a;
	Tue, 22 Aug 2023 07:09:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWU-00FHs3-0f
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:09:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE35464D59;
	Tue, 22 Aug 2023 07:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA84C433C8;
	Tue, 22 Aug 2023 07:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688192;
	bh=YWcF5FYjmBa5ZzNhVXuTsMWow8CghL/K0RmXeemBMIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TsjNsNl5KE+5gIEKx76Yi79TjlkLlVljlVzLJ1C6OlosqeY4UtLuH4PUIQSxLFBx4
	 xtrbP1+P2//22eYCRJllvW9ehshooGzcqQvEmaynmiSWhkLhQJ7Rq2L8EDdRwxRV0g
	 sZOtPpyR/Iy0W19Oc9jU+zaDldcF8sYRAv1H2WDJybUeX5QARjSDX5aGjc6f0T7xXx
	 kHJBizWvTGVPZPOBCzt92+8tKV/o13y0BN69X5aIWIzatdhjwpjbkVu50FIKeVVdde
	 2RskH8m58rXXPSiUM8jJX9cje+uQJetTmYZIrJcxcnBKAAIVZ60zPtVQeT8GGnGj80
	 Z07h9/4Q1a79g==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:24 +0200
Subject: [PATCH v2 08/41] mtd: spi-nor: default .n_banks to 1
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-8-291a0f39f8d8@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_000954_329525_D12504B2 
X-CRM114-Status: GOOD (  17.09  )
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

If .n_banks is not set in the flash_info database, the default value
should be 1. This way, we don't have to always set the .n_banks
parameter in flash_info.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c   | 3 +--
 drivers/mtd/spi-nor/core.h   | 8 ++++----
 drivers/mtd/spi-nor/xilinx.c | 1 -
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e27f1323fa0b..68baf6032639 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2017,7 +2017,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 
 static const struct flash_info spi_nor_generic_flash = {
 	.name = "spi-nor-generic",
-	.n_banks = 1,
 	.parse_sfdp = true,
 };
 
@@ -2997,7 +2996,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	params->size = info->size;
 	params->bank_size = params->size;
 	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
-	params->n_banks = info->n_banks;
+	params->n_banks = info->n_banks ?: SPI_NOR_DEFAULT_N_BANKS;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
 		/* Default to Fast Read for DT and non-DT platform devices. */
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2fc999f2787c..8627d0b95be6 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -15,6 +15,7 @@
  * have the page size defined within their SFDP tables.
  */
 #define SPI_NOR_DEFAULT_PAGE_SIZE 256
+#define SPI_NOR_DEFAULT_N_BANKS 1
 
 /* Standard SPI NOR flash operations. */
 #define SPI_NOR_READID_OP(naddr, ndummy, buf, len)			\
@@ -453,7 +454,7 @@ struct spi_nor_fixups {
  * @size:           the size of the flash in bytes.
  * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
  *                  isn't necessarily called a "sector" by the vendor.
- * @n_banks:        the number of banks.
+ * @n_banks:        (optional) the number of banks. Defaults to 1.
  * @page_size:      (optional) the flash's page size. Defaults to 256.
  * @addr_nbytes:    number of address bytes to send.
  *
@@ -570,7 +571,7 @@ struct flash_info {
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
-	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
 
 #define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
@@ -578,13 +579,12 @@ struct flash_info {
 
 #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
 	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
-	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
 
 #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
 		.size = (_sector_size) * (_n_sectors),			\
 		.sector_size = (_sector_size),				\
 		.page_size = (_page_size),				\
-		.n_banks = 1,						\
 		.addr_nbytes = (_addr_nbytes),				\
 		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
 
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 284e2e4970ab..8d4539e32dfe 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -26,7 +26,6 @@
 		.size = 8 * (_page_size) * (_n_sectors),		\
 		.sector_size = (8 * (_page_size)),			\
 		.page_size = (_page_size),				\
-		.n_banks = 1,						\
 		.flags = SPI_NOR_NO_FR
 
 /* Xilinx S3AN share MFR with Atmel SPI NOR */

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
