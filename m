Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9E4EE57F1
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leUg85bnpwdczsx+8CC+2H6IJlPVHKpcierLuDXiAEs=; b=lMShGwBdMBmlh+
	dF5kw4x7fausllPKmirw7HsK1OBqQT1c37xWfhHuATdvwu1m4BegF1KPNbmewJoPgFTABB2KfsxFX
	sKrYjalYjSwrXNFgk2tilnLaPfxc7bNXnZAuZiM53sSQfBZ9sZxFBYHJNj80CAya3T4cfo16v6CcS
	JpQdJ7kMqq530mwIgSzXxtqSEcUOprMzBUru8DqkuMQTEE18UkOoHXVtSG6HYcISkQm3Vex//xzBk
	rk5TXHpSSI2AC/xyPiYZwu/jMQ59uIqmi5MbByDiP9fZNfmzo6wDXHUvMgi9w1Pxbw/znleFh0ISv
	FmSBlxfB89/cSFnPa6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXo-00DSzT-0d;
	Fri, 08 Sep 2023 10:16:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXk-00DSwZ-2F
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:16:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3D87CB82038;
	Fri,  8 Sep 2023 10:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37855C433CB;
	Fri,  8 Sep 2023 10:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168207;
	bh=aVw1plMaA1T6kfJ7vhGuu6xOZHiBLnfDGXiBmfum/Cc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jl5RuvoZyuUEEy+1JWa6GcwTML+nX4N3xLEebul2PzupnpmCF1uX2cLmHWTzwVlwG
	 uz0S0xKGdw+f06NSOFDSF7XpXbCkoFZNx/TmTY7sNG2IlzVCd8D/t/P6zrY7R+Af07
	 /Zgd26KNkgWA65iL9R6QaFG5SPjpiTLzl6DSu1zCcpXFTbCcEtlal53vl1KgwnzTSe
	 jAChksgUNgUN5pEtigpMAgvGLznxZMfLKZ2FSqvA3ydY9+gTfjKWJC8UUEEs5Reb+9
	 dH6JP0/UWUnrnjRHSh9QlViGewG8lWOnnTeBN5Mc/kha3mkNtgfYHUQO2ilrbIumuQ
	 U6dCDA8omrt9w==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:27 +0200
Subject: [PATCH v3 09/41] mtd: spi-nor: push 4k SE handling into
 spi_nor_select_uniform_erase()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-9-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_031653_010557_4D313CEA 
X-CRM114-Status: GOOD (  20.74  )
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
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 68baf6032639..c84be791341e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2512,13 +2512,6 @@ static int spi_nor_select_pp(struct spi_nor *nor,
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
@@ -2526,13 +2519,16 @@ static int spi_nor_select_pp(struct spi_nor *nor,
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
@@ -2544,10 +2540,11 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
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
@@ -2575,7 +2572,6 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 	struct spi_nor_erase_map *map = &nor->params->erase_map;
 	const struct spi_nor_erase_type *erase = NULL;
 	struct mtd_info *mtd = &nor->mtd;
-	u32 wanted_size = nor->info->sector_size;
 	int i;
 
 	/*
@@ -2586,13 +2582,8 @@ static int spi_nor_select_erase(struct spi_nor *nor)
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
