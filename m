Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A79CEE57EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDkIhyDl48f3azxeOVUrxP4lDiX2YlzlYs+a08iZBwg=; b=IboTT5OJBeKeZt
	sdan+XmkQdXipkh4qb2NgbF6j79TxtAk+kwKpT0wtKLIZkpHVpbERp4Ld+Qy3T3Htk9KIdKhwMOgH
	mtnDQoeEpsrRYdeaIRGFBtfvZvTYqkqO4pMfRF9geqyZ8XbS7xj6jYUBIUYLOp77SHi7O0g6NWggr
	mY6FNnkHJhmTl08Dff08eaQGSGrz+V031DPn0B24nLm3qEtNsW7UbOqJlmYTbi8gBJzNwov8rNwzc
	1u95WHmcATPCgN8YMMhKk5oLk9Bc01+MhGjupQrqqzbhrqbG3rsLmD/ODfmidqR5aRkrNo0M4fwC7
	2DuRpGYjSELFHhB/ui/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYaW-00DVNa-1u;
	Fri, 08 Sep 2023 10:19:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYf-00DTrp-2d
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:18:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09204B82038;
	Fri,  8 Sep 2023 10:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04673C43215;
	Fri,  8 Sep 2023 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168267;
	bh=8w3XDg6OtHsIPMEmA3w/5H7T3yQdVD+fVZ/p/srxbKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BmF1Q8Xw5RvCcYCipJeXpRSaDyA94pD/NTPVmB4OCXMprWMjv275emueSl0J11+7x
	 q000AXd4tkAIfhlUGoKzYLkOXJwTwEE/pdXJt7sX7/g/4XlWOlCrZrutSazGCR2bYn
	 IyiLjm2pNnN6dBlYdskAbfHmiN2xvQuYhickwvj62KFbwc7lVdCVqjD4xnW0dB/PmO
	 YA3g8aD+yoalvaizrF2NEenNzjj1xLKeF5C74cCX7qOZE4Pfxl0J0PwxL8TSL1jEdX
	 IDxguPc40od+94FcZi0C6/kjSupVunB14nzdLqgwIskAT7KrVegfnnFxtHCnuRQ06v
	 8ZbzaMbvz7HYg==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:55 +0200
Subject: [PATCH v3 37/41] mtd: spi-nor: spansion: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-37-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031750_177483_83BBD9DF 
X-CRM114-Status: GOOD (  11.56  )
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
 drivers/mtd/spi-nor/spansion.c | 174 ++++++++++++++++++++---------------------
 1 file changed, 87 insertions(+), 87 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 5953df6aff93..fd2652aa6c1e 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -757,28 +757,35 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
 
 static const struct flash_info spansion_nor_parts[] = {
 	{
+		.id = SNOR_ID(0x01, 0x02, 0x12),
+		.name = "s25sl004a",
+		.size = SZ_512K,
+	}, {
+		.id = SNOR_ID(0x01, 0x02, 0x13),
+		.name = "s25sl008a",
+		.size = SZ_1M,
+	}, {
+		.id = SNOR_ID(0x01, 0x02, 0x14),
+		.name = "s25sl016a",
+		.size = SZ_2M,
+	}, {
 		.id = SNOR_ID(0x01, 0x02, 0x15, 0x4d, 0x00),
 		.name = "s25sl032p",
 		.size = SZ_4M,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x01, 0x02, 0x15),
+		.name = "s25sl032a",
+		.size = SZ_4M,
 	}, {
 		.id = SNOR_ID(0x01, 0x02, 0x16, 0x4d, 0x00),
 		.name = "s25sl064p",
 		.size = SZ_8M,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x00, 0x80),
-		.name = "s25fl128s0",
-		.size = SZ_16M,
-		.sector_size = SZ_256K,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_CLSR,
-	}, {
-		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x80),
-		.name = "s25fl128s1",
-		.size = SZ_16M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_CLSR,
+		.id = SNOR_ID(0x01, 0x02, 0x16),
+		.name = "s25sl064a",
+		.size = SZ_8M,
 	}, {
 		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x80),
 		.name = "s25fl256s0",
@@ -787,31 +794,16 @@ static const struct flash_info spansion_nor_parts[] = {
 		.no_sfdp_flags = SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
 	}, {
-		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x01, 0x80),
-		.name = "s25fl256s1",
+		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x81),
+		.name = "s25fs256s0",
 		.size = SZ_32M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_CLSR,
-	}, {
-		.id = SNOR_ID(0x01, 0x02, 0x20, 0x4d, 0x00, 0x80),
-		.name = "s25fl512s",
-		.size = SZ_64M,
 		.sector_size = SZ_256K,
-		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
 	}, {
-		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x81),
-		.name = "s25fs128s1",
-		.size = SZ_16M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_CLSR,
-		.fixups = &s25fs_s_nor_fixups,
-	}, {
-		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x81),
-		.name = "s25fs256s0",
+		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x01, 0x80),
+		.name = "s25fl256s1",
 		.size = SZ_32M,
-		.sector_size = SZ_256K,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
 	}, {
@@ -820,6 +812,14 @@ static const struct flash_info spansion_nor_parts[] = {
 		.size = SZ_32M,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
+	}, {
+		.id = SNOR_ID(0x01, 0x02, 0x20, 0x4d, 0x00, 0x80),
+		.name = "s25fl512s",
+		.size = SZ_64M,
+		.sector_size = SZ_256K,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_CLSR,
 	}, {
 		.id = SNOR_ID(0x01, 0x02, 0x20, 0x4d, 0x00, 0x81),
 		.name = "s25fs512s",
@@ -837,6 +837,13 @@ static const struct flash_info spansion_nor_parts[] = {
 		.id = SNOR_ID(0x01, 0x20, 0x18, 0x03, 0x01),
 		.name = "s25sl12801",
 		.size = SZ_16M,
+	}, {
+		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x00, 0x80),
+		.name = "s25fl128s0",
+		.size = SZ_16M,
+		.sector_size = SZ_256K,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_CLSR,
 	}, {
 		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x00),
 		.name = "s25fl129p0",
@@ -845,51 +852,34 @@ static const struct flash_info spansion_nor_parts[] = {
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
 	}, {
-		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01),
-		.name = "s25fl129p1",
+		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x80),
+		.name = "s25fl128s1",
 		.size = SZ_16M,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
 	}, {
-		.id = SNOR_ID(0x01, 0x02, 0x12),
-		.name = "s25sl004a",
-		.size = SZ_512K,
-	}, {
-		.id = SNOR_ID(0x01, 0x02, 0x13),
-		.name = "s25sl008a",
-		.size = SZ_1M,
-	}, {
-		.id = SNOR_ID(0x01, 0x02, 0x14),
-		.name = "s25sl016a",
-		.size = SZ_2M,
-	}, {
-		.id = SNOR_ID(0x01, 0x02, 0x15),
-		.name = "s25sl032a",
-		.size = SZ_4M,
+		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x81),
+		.name = "s25fs128s1",
+		.size = SZ_16M,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_CLSR,
+		.fixups = &s25fs_s_nor_fixups,
 	}, {
-		.id = SNOR_ID(0x01, 0x02, 0x16),
-		.name = "s25sl064a",
-		.size = SZ_8M,
+		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01),
+		.name = "s25fl129p1",
+		.size = SZ_16M,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_CLSR,
 	}, {
-		.id = SNOR_ID(0xef, 0x40, 0x13),
-		.name = "s25fl004k",
+		.id = SNOR_ID(0x01, 0x40, 0x13),
+		.name = "s25fl204k",
 		.size = SZ_512K,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
 	}, {
-		.id = SNOR_ID(0xef, 0x40, 0x14),
-		.name = "s25fl008k",
+		.id = SNOR_ID(0x01, 0x40, 0x14),
+		.name = "s25fl208k",
 		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xef, 0x40, 0x15),
-		.name = "s25fl016k",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xef, 0x40, 0x17),
-		.name = "s25fl064k",
-		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
 	}, {
 		.id = SNOR_ID(0x01, 0x40, 0x15),
 		.name = "s25fl116k",
@@ -905,16 +895,6 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s25fl164k",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0x01, 0x40, 0x13),
-		.name = "s25fl204k",
-		.size = SZ_512K,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
-	}, {
-		.id = SNOR_ID(0x01, 0x40, 0x14),
-		.name = "s25fl208k",
-		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
 	}, {
 		.id = SNOR_ID(0x01, 0x60, 0x17),
 		.name = "s25fl064l",
@@ -934,10 +914,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
-		.id = SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90),
-		.name = "s25fs256t",
-		.mfr_flags = USE_CLPEF,
-		.fixups = &s25fs256t_fixups
+		.id = SNOR_ID(0x04, 0x2c, 0xc2, 0x7f, 0x7f, 0x7f),
+		.name = "cy15x104q",
+		.size = SZ_512K,
+		.sector_size = SZ_512K,
+		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90),
 		.name = "s25hl512t",
@@ -954,6 +935,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		.mfr_flags = USE_CLPEF,
 		.flags = NO_CHIP_ERASE,
 		.fixups = &s25hx_t_fixups
+	}, {
+		.id = SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90),
+		.name = "s25fs256t",
+		.mfr_flags = USE_CLPEF,
+		.fixups = &s25fs256t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x2b, 0x1a, 0x0f, 0x03, 0x90),
 		.name = "s25hs512t",
@@ -970,12 +956,6 @@ static const struct flash_info spansion_nor_parts[] = {
 		.mfr_flags = USE_CLPEF,
 		.flags = NO_CHIP_ERASE,
 		.fixups = &s25hx_t_fixups
-	}, {
-		.id = SNOR_ID(0x04, 0x2c, 0xc2, 0x7f, 0x7f, 0x7f),
-		.name = "cy15x104q",
-		.size = SZ_512K,
-		.sector_size = SZ_512K,
-		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.id = SNOR_ID(0x34, 0x5a, 0x1a),
 		.name = "s28hl512t",
@@ -1001,6 +981,26 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s28hs02gt",
 		.mfr_flags = USE_CLPEF,
 		.fixups = &s28hx_t_fixups,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x13),
+		.name = "s25fl004k",
+		.size = SZ_512K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x14),
+		.name = "s25fl008k",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x15),
+		.name = "s25fl016k",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x17),
+		.name = "s25fl064k",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
