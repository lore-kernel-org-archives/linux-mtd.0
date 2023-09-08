Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E350EE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/OgeqJ95QnsyoJxFWavXJUbbI7d4tMCguVf4z+33fk=; b=CNdHFoJb2hih+F
	RXotsly7nLuEfJuYHIStWp0fTlonz6kb0esbWIHpX+65VR0aPIKSQdJ/ZGAlXvi984W0jyVCnl5ZI
	nLM+QdRUuGIyjTuQliE77e+YhjJk6dZTr2rmg5D0Mxa/dcMR/hVmhlx7AMfijzMJHpWOpaxCw2bp1
	cOLTZXXmVM2dhXq9Fg8m2Lb1NZ/uI1R1kj7aqrbuR1TzMiGS2xYfD4qaybEalG6/Gm22uhRKj1HlJ
	s3S0aY/2COJilTqG+oXpkuJawsbonZOJowm5O28+duqab+C+9vj7jJ6g4vMSlWplDBY/D0NpEdLlH
	uk5VPiV91EUTkot0787w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYab-00DVSb-2a;
	Fri, 08 Sep 2023 10:19:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYe-00DTqZ-1z
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:18:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CADE8CE1B79;
	Fri,  8 Sep 2023 10:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D03C43140;
	Fri,  8 Sep 2023 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168265;
	bh=uBLUgzG+Qr84SJ0zH/c3GfOsYhPI41nZW9Idjp3TdLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dPUcg4BHwryIXcOoR9syr/JWRq5X0t0zcQuw/kGbadHXABNYYt1A/KMb3ER9anFqK
	 V+AOhbSE1y6oj8pqvMkYZ4GtW/GhkCHq+bxXgBYVSU+/bXsn/bHngIklYoBbmGu5zW
	 4frKjz2vUIEoSb4xVtuNDsNX7ANcdG/rZYepebkXZ/b/NUN1yI07TIhfZbinkhhTKt
	 P4EJugDI/LlhZRLlF/vfHvZzfup1ztYKjzFb+KPKL5yXhuDwVcQo9cF3rpS17/HWLe
	 quH1q8NXoE5/IzDJ6jBpzUBFPGtPzzG1EEY+HGje4KIXtQbpMiGFbATd4W6EvoJ5Yk
	 vWvksIXv4Kzlw==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:54 +0200
Subject: [PATCH v3 36/41] mtd: spi-nor: micron-st: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-36-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031749_046354_EFCC611E 
X-CRM114-Status: GOOD (  11.83  )
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
 drivers/mtd/spi-nor/micron-st.c | 336 ++++++++++++++++++++--------------------
 1 file changed, 168 insertions(+), 168 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 720fd2fbd0ad..4afcfc57c896 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -182,133 +182,35 @@ static const struct flash_info micron_nor_parts[] = {
 
 static const struct flash_info st_nor_parts[] = {
 	{
-		.id = SNOR_ID(0x20, 0xbb, 0x15),
-		.name = "n25q016a",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x16),
-		.name = "n25q032",
-		.size = SZ_4M,
-		.no_sfdp_flags = SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x16),
-		.name = "n25q032a",
-		.size = SZ_4M,
-		.no_sfdp_flags = SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x17),
-		.name = "n25q064",
-		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x17),
-		.name = "n25q064a",
-		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x18),
-		.name = "n25q128a11",
-		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x18),
-		.name = "n25q128a13",
-		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x19, 0x10, 0x44, 0x00),
-		.name = "mt25ql256a",
-		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x19),
-		.name = "n25q256a",
-		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x19, 0x10, 0x44, 0x00),
-		.name = "mt25qu256a",
-		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x19),
-		.name = "n25q256ax1",
-		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p05-nonjedec",
+		.sector_size = SZ_32K,
+		.size = SZ_64K,
 	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x20, 0x10, 0x44, 0x00),
-		.name = "mt25ql512a",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.mfr_flags = USE_FSR,
+		.name = "m25p10-nonjedec",
+		.sector_size = SZ_32K,
+		.size = SZ_128K,
 	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x20),
-		.name = "n25q512ax3",
-		.size = SZ_64M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p20-nonjedec",
+		.size = SZ_256K,
 	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
-		.name = "mt25qu512a",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.mfr_flags = USE_FSR,
+		.name = "m25p40-nonjedec",
+		.size = SZ_512K,
 	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x20),
-		.name = "n25q512a",
-		.size = SZ_64M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p80-nonjedec",
+		.size = SZ_1M,
 	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x21),
-		.name = "n25q00",
-		.size = SZ_128M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p16-nonjedec",
+		.size = SZ_2M,
 	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x21),
-		.name = "n25q00a",
-		.size = SZ_128M,
-		.flags = NO_CHIP_ERASE,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p32-nonjedec",
+		.size = SZ_4M,
 	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x22),
-		.name = "mt25ql02g",
-		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p64-nonjedec",
+		.size = SZ_8M,
 	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x22),
-		.name = "mt25qu02g",
-		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p128-nonjedec",
+		.sector_size = SZ_256K,
+		.size = SZ_16M,
 	}, {
 		.id = SNOR_ID(0x20, 0x20, 0x10),
 		.name = "m25p05",
@@ -348,36 +250,6 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "m25p128",
 		.sector_size = SZ_256K,
 		.size = SZ_16M,
-	}, {
-		.name = "m25p05-nonjedec",
-		.sector_size = SZ_32K,
-		.size = SZ_64K,
-	}, {
-		.name = "m25p10-nonjedec",
-		.sector_size = SZ_32K,
-		.size = SZ_128K,
-	}, {
-		.name = "m25p20-nonjedec",
-		.size = SZ_256K,
-	}, {
-		.name = "m25p40-nonjedec",
-		.size = SZ_512K,
-	}, {
-		.name = "m25p80-nonjedec",
-		.size = SZ_1M,
-	}, {
-		.name = "m25p16-nonjedec",
-		.size = SZ_2M,
-	}, {
-		.name = "m25p32-nonjedec",
-		.size = SZ_4M,
-	}, {
-		.name = "m25p64-nonjedec",
-		.size = SZ_8M,
-	}, {
-		.name = "m25p128-nonjedec",
-		.sector_size = SZ_256K,
-		.size = SZ_16M,
 	}, {
 		.id = SNOR_ID(0x20, 0x40, 0x11),
 		.name = "m45pe10",
@@ -391,18 +263,14 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "m45pe16",
 		.size = SZ_2M,
 	}, {
-		.id = SNOR_ID(0x20, 0x80, 0x12),
-		.name = "m25pe20",
-		.size = SZ_256K,
+		.id = SNOR_ID(0x20, 0x63, 0x16),
+		.name = "m25px32-s1",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0x20, 0x80, 0x14),
-		.name = "m25pe80",
+		.id = SNOR_ID(0x20, 0x71, 0x14),
+		.name = "m25px80",
 		.size = SZ_1M,
-	}, {
-		.id = SNOR_ID(0x20, 0x80, 0x15),
-		.name = "m25pe16",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0x20, 0x71, 0x15),
 		.name = "m25px16",
@@ -413,25 +281,157 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "m25px32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x20, 0x71, 0x17),
+		.name = "m25px64",
+		.size = SZ_8M,
 	}, {
 		.id = SNOR_ID(0x20, 0x73, 0x16),
 		.name = "m25px32-s0",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0x20, 0x63, 0x16),
-		.name = "m25px32-s1",
-		.size = SZ_4M,
+		.id = SNOR_ID(0x20, 0x80, 0x12),
+		.name = "m25pe20",
+		.size = SZ_256K,
+	}, {
+		.id = SNOR_ID(0x20, 0x80, 0x14),
+		.name = "m25pe80",
+		.size = SZ_1M,
+	}, {
+		.id = SNOR_ID(0x20, 0x80, 0x15),
+		.name = "m25pe16",
+		.size = SZ_2M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0x20, 0x71, 0x17),
-		.name = "m25px64",
+		.id = SNOR_ID(0x20, 0xba, 0x16),
+		.name = "n25q032",
+		.size = SZ_4M,
+		.no_sfdp_flags = SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x17),
+		.name = "n25q064",
 		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0x20, 0x71, 0x14),
-		.name = "m25px80",
-		.size = SZ_1M,
-	},
+		.id = SNOR_ID(0x20, 0xba, 0x18),
+		.name = "n25q128a13",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x19, 0x10, 0x44, 0x00),
+		.name = "mt25ql256a",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x19),
+		.name = "n25q256a",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x20, 0x10, 0x44, 0x00),
+		.name = "mt25ql512a",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x20),
+		.name = "n25q512ax3",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x21),
+		.name = "n25q00",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x22),
+		.name = "mt25ql02g",
+		.size = SZ_256M,
+		.flags = NO_CHIP_ERASE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x15),
+		.name = "n25q016a",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x16),
+		.name = "n25q032a",
+		.size = SZ_4M,
+		.no_sfdp_flags = SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x17),
+		.name = "n25q064a",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x18),
+		.name = "n25q128a11",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x19, 0x10, 0x44, 0x00),
+		.name = "mt25qu256a",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x19),
+		.name = "n25q256ax1",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
+		.name = "mt25qu512a",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x20),
+		.name = "n25q512a",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x21),
+		.name = "n25q00a",
+		.size = SZ_128M,
+		.flags = NO_CHIP_ERASE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x22),
+		.name = "mt25qu02g",
+		.size = SZ_256M,
+		.flags = NO_CHIP_ERASE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}
 };
 
 /**

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
