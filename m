Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA8AC001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LD28azFyuGfcxiPpk2EHdY5/sXt4SBTjboxssLsOzfE=; b=ynfUzK50dZYbXX
	ocwWf85q8cjccnarq5sQS3GlUDQTWI/c+Jpau+t70keck/YXzb3rz8mc5Pp2N8b46kkITi5ZltroO
	nbwCYpuYLn7juRlTNCTNoXa0bvxR6EPc40Qecr62JRbhqjvt+Vn1wE5xEEAQ8SQ1PaIqpMUDE0Uy1
	ONJzzG+SJ4leAq1NsyiVxh1cq7n7GwSYGfS9JQQQA7gfhOrhrg/nUzLdtTQuC9TyJieJix1XNXtgh
	O3a3z+m8K1s1NjjG6+ubw8L6SD6O21xTxgPPCQsLjRgvwhrSFg2hCu32Zz0f/wyNl8QFvgk8iGIY2
	ihyq7zYS9kzyfY46O38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Bd-00HKvr-0O;
	Mon, 07 Aug 2023 13:22:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0BY-00HKrG-1P
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7AFB61AF2;
	Mon,  7 Aug 2023 13:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13989C433C8;
	Mon,  7 Aug 2023 13:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414531;
	bh=rvtOy7dnpdWfQpkGSkJU8iwlrHMZ9j+wqgG+HgoebEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pn8pAVmWqSGjSRrjhzKWyoTOnuvKN89+fNilZObQ9KkSuN1fnwilTyu7KoQ/Z+LW+
	 fqimggEdnQykaUEAtLogbPUeZnTGi2F0iVBgMYYHQ9Ik4pmvfBww36ura8MDgX+tDz
	 na2UQrG73ylQ/UYIIFrL61ocNpKPHUf+nZwnFoJvrNVgSFhD953GyUNNpV03PlAlFO
	 5Y9GluGfnYgjEqE6wFi6Hjf9UvOp5t5dGhQ0+gfNjRbIY/yPiK5SldMHuK0V6xC0mA
	 ApeXTuflBoVPYBGVZkoHr6H3NMZOVgR4pqyaIepxu0OvE/X6BsexlcwYq9hdMyo02X
	 GpZKcbsrIwOuQ==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:03 +0200
Subject: [PATCH 09/41] mtd: spi-nor: push 4k SE handling into
 spi_nor_select_uniform_erase()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-9-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_062212_580714_724846B9 
X-CRM114-Status: GOOD (  20.34  )
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

4k sector erase sizes are only a thing with uniform erase types. Push
the "we want 4k erase sizes" handling into spi_nor_select_uniform_erase().

One might wonder why the former sector_size isn't used anymore. It is
because we either search for the largest erase size or if selected
through kconfig, the 4k erase size. Now, why is that correct? For this,
we have to differentiate between (1) flashes with SFDP and (2) without
SFDP. For (1), we just set one (or two if SECT_4K is set) erase types
and wanted_size is exactly one of these.

For (2) things are a bit more complicated. For flashes which we don't
have in our flash_info database, the generic driver is used and
sector_size was already 0, which in turn selected the largest erase
size. For flashes which had SFDP and an entry in flash_info, sector_size
was always the largest sector and thus the largest erase type.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 015152ba8973..5c6a0edafae2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2511,13 +2511,6 @@ static int spi_nor_select_pp(struct spi_nor *nor,
 /**
  * spi_nor_select_uniform_erase() - select optimum uniform erase type
  * @map:		the erase map of the SPI NOR
- * @wanted_size:	the erase type size to search for. Contains the value of
- *			info->sector_size, the "small sector" size in case
- *			CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined or 0 if
- *			there is no information about the sector size. The
- *			latter is the case if the flash parameters are parsed
- *			solely by SFDP, then the largest supported erase type
- *			is selected.
  *
  * Once the optimum uniform sector erase command is found, disable all the
  * other.
@@ -2525,13 +2518,16 @@ static int spi_nor_select_pp(struct spi_nor *nor,
  * Return: pointer to erase type on success, NULL otherwise.
  */
 static const struct spi_nor_erase_type *
-spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
-			     const u32 wanted_size)
+spi_nor_select_uniform_erase(struct spi_nor_erase_map *map)
 {
 	const struct spi_nor_erase_type *tested_erase, *erase = NULL;
 	int i;
 	u8 uniform_erase_type = map->uniform_erase_type;
 
+	/*
+	 * Search for the biggest erase size, except for when compiled
+	 * to use 4k erases.
+	 */
 	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
 		if (!(uniform_erase_type & BIT(i)))
 			continue;
@@ -2543,10 +2539,11 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
 			continue;
 
 		/*
-		 * If the current erase size is the one, stop here:
+		 * If the current erase size is the 4k one, stop here,
 		 * we have found the right uniform Sector Erase command.
 		 */
-		if (tested_erase->size == wanted_size) {
+		if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS) &&
+		    tested_erase->size == SZ_4K) {
 			erase = tested_erase;
 			break;
 		}
@@ -2574,7 +2571,6 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 	struct spi_nor_erase_map *map = &nor->params->erase_map;
 	const struct spi_nor_erase_type *erase = NULL;
 	struct mtd_info *mtd = &nor->mtd;
-	u32 wanted_size = nor->info->sector_size;
 	int i;
 
 	/*
@@ -2585,13 +2581,8 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 	 * manage the SPI flash memory as uniform with a single erase sector
 	 * size, when possible.
 	 */
-#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
-	/* prefer "small sector" erase if possible */
-	wanted_size = 4096u;
-#endif
-
 	if (spi_nor_has_uniform_erase(nor)) {
-		erase = spi_nor_select_uniform_erase(map, wanted_size);
+		erase = spi_nor_select_uniform_erase(map);
 		if (!erase)
 			return -EINVAL;
 		nor->erase_opcode = erase->opcode;

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
