Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00D4C001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aREgzBVykkA2QZPu1W8209g3JHwOrGpiqEV7fr/Y3c=; b=3PEBIo5KiLuhs3
	PWdIGULUFuBO31aDe30DayumH/q7sZCuXpbwR5uQCgBIP4Bi37YdgzcCjPz6mM1QRvq6ImJb/Gk5i
	6lO3DZZ8HfM5SffmMZTYrpyqPuXSWsQN80V3v8javwSJEw9fuoi6gwFG9qKuB/gMZ7LNg7Og0jcRr
	2glpjjHyJpsr7ypQecoba4bTCnW+bufdbZiPM1USMNMPx30LlK9tiH0jKqSxgZfeJAcPtZBLye/Gk
	UUt5Sna45Z+QeIpMonV7tGGlFGtZRIP7fVycAufb59x40/ERvreSsrcQxAPSoNayYaof95QWHuwJV
	mvScbbU74hHcUmNdgBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Bf-00HKyO-1G;
	Mon, 07 Aug 2023 13:22:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Ba-00HKtT-22
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E48361AF9;
	Mon,  7 Aug 2023 13:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3A8C433C7;
	Mon,  7 Aug 2023 13:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414533;
	bh=E+JQZfu4pGNJ17JtSl9cUW7fdM1ZGLxtIJz2xDbEL5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HocVn6R8oh/wEBD6MuYjxhKp90BmGCd6Xstbp6QGG3g81zq7MrbOBlnw7m0Eb0tsx
	 KV2Q7qmdG1ehiFrKyWA+lFG/jpwIL2h4/oLo6QjHlwHh0cNpQK0MQWlGFsobajHCXX
	 4ceG0P6O1ABPY0D4xFl89RkFQihhTg2AP2hbUBwX/WKfoIdxQOpQr+GEXg/mZfq7Bg
	 uxNUuz464iz9o9P2BbK+K9a/+fI+XUKcHAzUjdc32FNVqiJSf2adezaTiA0Ox56Zo3
	 1LWEGbn0QeJ7X8i40re7lkncyHgM2/aC3W4DvKI3E8nbYgSCEtTVNqjPSbOrpTLZKp
	 KpwytaPfneXmg==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:04 +0200
Subject: [PATCH 10/41] mtd: spi-nor: make sector_size optional
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-10-3d3d5bef4ba4@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_062214_766881_DDB9C2F0 
X-CRM114-Status: GOOD (  16.30  )
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

Most of the (old, non-SFDP) flashes use a sector size of 64k. Make that
a default value so it can be optional in the flash_info database.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 6 ++++--
 drivers/mtd/spi-nor/core.h | 8 +++++---
 drivers/mtd/spi-nor/swp.c  | 6 +++++-
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5c6a0edafae2..cf0e25b4f9a9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2755,7 +2755,8 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
+	const struct flash_info *info = nor->info;
+	const u8 no_sfdp_flags = info->no_sfdp_flags;
 	u8 i, erase_mask;
 
 	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
@@ -2809,7 +2810,8 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 		i++;
 	}
 	erase_mask |= BIT(i);
-	spi_nor_set_erase_type(&map->erase_type[i], nor->info->sector_size,
+	spi_nor_set_erase_type(&map->erase_type[i],
+			       info->sector_size ?: SPI_NOR_DEFAULT_SECTOR_SIZE,
 			       SPINOR_OP_SE);
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index c90445e186c0..734aedd4d62c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -16,6 +16,7 @@
  */
 #define SPI_NOR_DEFAULT_PAGE_SIZE 256
 #define SPI_NOR_DEFAULT_N_BANKS 1
+#define SPI_NOR_DEFAULT_SECTOR_SIZE SZ_64K
 
 /* Standard SPI NOR flash operations. */
 #define SPI_NOR_READID_OP(naddr, ndummy, buf, len)			\
@@ -452,8 +453,9 @@ struct spi_nor_fixups {
  *                  JEDIC ID. JEDEC ID zero means "no ID" (mostly older chips).
  * @id_len:         the number of bytes of ID.
  * @size:           the size of the flash in bytes.
- * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
- *                  isn't necessarily called a "sector" by the vendor.
+ * @sector_size:    (optional) the size listed here is what works with
+ *                  SPINOR_OP_SE, which isn't necessarily called a "sector" by
+ *                  the vendor. Defaults to 64k.
  * @n_banks:        (optional) the number of banks. Defaults to 1.
  * @page_size:      (optional) the flash's page size. Defaults to 256.
  * @addr_nbytes:    number of address bytes to send.
@@ -565,7 +567,7 @@ struct flash_info {
 
 #define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
 	.size = (_sector_size) * (_n_sectors),				\
-	.sector_size = (_sector_size),					\
+	.sector_size = (_sector_size == SZ_64K) ? 0 : (_sector_size),	\
 	.n_banks = (_n_banks)
 
 /* Used when the "_ext_id" is two bytes at most */
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 40bf52867095..585813310ee1 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -34,7 +34,11 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 {
 	unsigned int bp_slots, bp_slots_needed;
-	unsigned int sector_size = nor->info->sector_size;
+	/*
+	 * sector_size will eventually be replaced with the max erase size of
+	 * the flash. For now, we need to have that ugly default.
+	 */
+	unsigned int sector_size = nor->info->sector_size ?: SPI_NOR_DEFAULT_SECTOR_SIZE;
 	u64 n_sectors = div_u64(nor->params->size, sector_size);
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
