Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B32C04A6A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxSQ2+Ro+7fyprLtrxi4NYpgKT06NmH6AWNOmbw3NFg=; b=oxKS/TZE59/XnN
	AJ+khp59D1SJ/Bi5UEZEDROaaHRNckubKgCLB5aJIdFPNdvVVMDc1quEFxi13lrT1Y1Rb0MOWPL6i
	qLpxbSjBeCaHZKfUvNp/W6h+if28jq5zvF83/DXs2iERa7PpgmlI4MTSl6gly4QVqKkAvgkyAuH5w
	yz0YA6Q9okjHruuvIkDV6b+ps2+kWm19mwlH7ERPAbctJLEJOs2Cduv1zk79THasALjjGtP8ea+tL
	0CoaUnGt4xcG0cDVWWf4IomhbWUfPkWq0Y/p1k4KbRz8fDMbFzX4E/T1jT8DyU2GkqluP56KuyAJl
	b8ou4yRfvxSHUlM1kEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0D7-00HMQT-1f;
	Mon, 07 Aug 2023 13:23:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CP-00HLhD-0Y
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 13:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pjXuMeigHEaey+MWr0S11eq92wN/2vfouniN6N3h0vM=; b=XyQofTXpAo1Aa9L2iaqU8cC0BH
	2D2Sp2DWRl8NK0RLXNnlbVtgJThTlDbTMm8kNPMdVgFsfvcWqnCtDy/ZMOIXvfidHjLMr1ieoIBCr
	qepS4bjoqxlOhqSOQGiuAFK7nP5CNFlqBMs4rC3gBWnevh8pVxgUJ893ErM4RPHb2f9LukODK0+k+
	SntJU/jpY4CkRkPTcXasrZkyH8r9iv3W5f0tV3C8jpgnIDrJ/Hylz6tGlg79uWNWt0QplIkyYreLf
	qPPtZ91xkNXc1TTdvx5Xzqye330VAoqS5mroFWkg2EchjPAMTVVnlXURCVQ1jeSrIWmrmHoqi02sx
	5jY4Oy6g==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CJ-003qfd-0E
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:23:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD2E861AD8;
	Mon,  7 Aug 2023 13:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893A3C433CB;
	Mon,  7 Aug 2023 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414578;
	bh=cvOmQ4r9lT/hD8cobtpM84I53hfGaM55Wi2KKw6QCYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dSfvpvUa4h4x8C4ItJk1cXUE/DFxF59UYVS47o5zy0khNIu8QjCN3PeXiPJTXDxhO
	 4KHUvi40oafgVJGAc2nSvgKGb+mxVFKSCtzjMz0eJ6p4Z/lE3/hsK2VEc7kvGoAzXR
	 99ffUJw5RZkdTsqQgb7R1LJvRT5AH+9shRuXGuY5bR1aCFuUBEYnJtGqLoEnugSkR6
	 81Acd3NvY+UGp+2mgMviaZneGyV1e4/WIaBF3XFLfeT7dnFY5FUhey87wUXaiDpUOM
	 AgrZqJYs/p250owJOilsUZg6tMgLvtWJ5aa9nosPRsnrOZmo+nk/B8RG6HIPyvCeUz
	 00+JvtzpD/CgA==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:25 +0200
Subject: [PATCH 31/41] mtd: spi-nor: atmel: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-31-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_142301_899595_F3A1E884 
X-CRM114-Status: GOOD (  11.04  )
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
