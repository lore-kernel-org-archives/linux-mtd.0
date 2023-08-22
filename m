Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3568EE49A8
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxSQ2+Ro+7fyprLtrxi4NYpgKT06NmH6AWNOmbw3NFg=; b=CrYn00/ppudRIU
	qvSJbTfaQJnsogHS8H5Woafhm3a6vkKK8LBYMOLFWtOU+RFFcMUqQ+g7hMnR8jiT6c5+xnFkBskhZ
	bjva0FdT/5NG1oSjqxJIa9dWqzF0nitK3Fm+xlcjx0lgAPjBJEo1d2uGIZuoCVCe41uE7P3ddtN8x
	idO5/Az47YXEKOtEBv+gICfL8YakQlapdLSepgjOIywIll/NSzZ6laOH7aAvnDELuiXHw6Z9AU4hm
	m4aC/u1dkPmAbjPADgU+l/KpVYnm1BWFeU3GR7ZVQNITDU5DOJL1fdo/7FYFKSOIrHypkxjWuFrVY
	XHmh8097ip07KLwcKBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXr-00FJE4-1k;
	Tue, 22 Aug 2023 07:11:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXE-00FINA-0P
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBEF663B9E;
	Tue, 22 Aug 2023 07:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92A7C433CB;
	Tue, 22 Aug 2023 07:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688238;
	bh=cvOmQ4r9lT/hD8cobtpM84I53hfGaM55Wi2KKw6QCYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MzdW72jIFXTv2uOfCLOVwgznPeKdO3r7cElkUdw7PcryfmMxKtssCWISkSt48CGeO
	 UE6wOgGDGD9qoUkDoO/a9DerI3iWxcDXRL1Q494uh59uDcbPV++eUEai1cfuUdEXHt
	 CqqGWKYd2KKNpcrw4cflq0nXtHcviCbJpZGPuSbH8TmUi1xxgFAxTG7sge50qpp1KB
	 V60uDXnRAMcc2G4kKNG+GgrPY2myFje2Yn88vse0EvRJAqOXhBknX588WnHiQ69cPc
	 dVtrD9dqQeH28f3Yg7aEszQls8l3S+8kol5jsFEhP+vzGaeml/i325lvHfyVzP0KiQ
	 w/7PRJKmNibSg==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:47 +0200
Subject: [PATCH v2 31/41] mtd: spi-nor: atmel: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-31-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_001040_280598_1AE8AD98 
X-CRM114-Status: GOOD (  11.66  )
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

The flash ID is the new primary key into our database. Sort the entry by
it. Keep the most specific ones first, because there might be ID
collisions between shorter and longer ones.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/atmel.c | 82 ++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index ccc985c48ae3..18e904962d0e 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -164,20 +164,20 @@ static const struct spi_nor_fixups atmel_nor_global_protection_fixups = {
 
 static const struct flash_info atmel_nor_parts[] = {
 	{
-		.id = SNOR_ID(0x1f, 0x66, 0x01),
-		.name = "at25fs010",
-		.sector_size = SZ_32K,
-		.size = SZ_128K,
-		.flags = SPI_NOR_HAS_LOCK,
+		.id = SNOR_ID(0x1f, 0x04, 0x00),
+		.name = "at26f004",
+		.size = SZ_512K,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &at25fs_nor_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x66, 0x04),
-		.name = "at25fs040",
-		.size = SZ_512K,
-		.flags = SPI_NOR_HAS_LOCK,
+		.id = SNOR_ID(0x1f, 0x25, 0x00),
+		.name = "at45db081d",
+		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &at25fs_nor_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x42, 0x16),
+		.name = "at25sl321",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0x1f, 0x44, 0x01),
 		.name = "at25df041a",
@@ -186,62 +186,62 @@ static const struct flash_info atmel_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups,
 	}, {
-		.id = SNOR_ID(0x1f, 0x47, 0x00),
-		.name = "at25df321",
-		.size = SZ_4M,
+		.id = SNOR_ID(0x1f, 0x45, 0x01),
+		.name = "at26df081a",
+		.size = SZ_1M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x47, 0x01),
-		.name = "at25df321a",
-		.size = SZ_4M,
+		.id = SNOR_ID(0x1f, 0x46, 0x01),
+		.name = "at26df161a",
+		.size = SZ_2M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x48, 0x00),
-		.name = "at25df641",
-		.size = SZ_8M,
+		.id = SNOR_ID(0x1f, 0x47, 0x00),
+		.name = "at25df321",
+		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x42, 0x16),
-		.name = "at25sl321",
+		.id = SNOR_ID(0x1f, 0x47, 0x00),
+		.name = "at26df321",
 		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x1f, 0x04, 0x00),
-		.name = "at26f004",
-		.size = SZ_512K,
-		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0x1f, 0x45, 0x01),
-		.name = "at26df081a",
-		.size = SZ_1M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x46, 0x01),
-		.name = "at26df161a",
-		.size = SZ_2M,
+		.id = SNOR_ID(0x1f, 0x47, 0x01),
+		.name = "at25df321a",
+		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x47, 0x00),
-		.name = "at26df321",
-		.size = SZ_4M,
+		.id = SNOR_ID(0x1f, 0x48, 0x00),
+		.name = "at25df641",
+		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x25, 0x00),
-		.name = "at45db081d",
-		.size = SZ_1M,
+		.id = SNOR_ID(0x1f, 0x66, 0x01),
+		.name = "at25fs010",
+		.sector_size = SZ_32K,
+		.size = SZ_128K,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &at25fs_nor_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x66, 0x04),
+		.name = "at25fs040",
+		.size = SZ_512K,
+		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
+		.fixups = &at25fs_nor_fixups
 	},
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
