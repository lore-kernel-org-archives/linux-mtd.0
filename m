Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A640EEE57EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cei1EY5NuKyCheM+g1l51EJSVeapepye8VoccB8o1zA=; b=VZ2wCmsoR0YW5b
	XB/7gbH93jXnEdU7xDq/mk6OaHbB0PTnR02xNSkVeZdO2wNXKYSKYOHmbGyIquvFzV/gDYeR2zBTY
	Wem5RyKT0bKAcZcjGttgjRBmw5GAivdsQWbp9AOunckNOggrnCQxlhR6gOp/kKMiciN9ei/rIHfVB
	zs1fdP1lIsA5Kumb1LILWntef74GaOrDUZEdJSqLsNC8y+2YaufVihGQJCDmDQkzv2BUwMsy9EHEk
	V3SEYYw41MzDGHrxkAXh3aVm6rBiVRtzG2fTQH0Y161BmKqCMTS2t+OEcSD6xHaYNsDefAgFC5+XE
	iI842o+KOWH+hpFEHIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYh-00DTtI-0F;
	Fri, 08 Sep 2023 10:17:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYD-00DTQ4-1q
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8909861377;
	Fri,  8 Sep 2023 10:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478F4C433B7;
	Fri,  8 Sep 2023 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168240;
	bh=oMgc1/5JxnhtyDALEk/TOuQOpIC5QJP7tEpRGwFyIfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GuDeBOyv98pWFWDmCAe4dveLmkU3/nD5oXK2ao6rfcDBNoxDds8H2chjytOULgpHW
	 urve5+ecbjHbsrwvmfeO95b9LACIOXDcQnlfbyjLvs5Pb+WsTiXh94v55UfqPkjYnw
	 Z9/lgvBQr3eUv//Q3v3UnH0fKbDVaZJBrWK3dIzGsG7+0i5leIdVKpW/1MBWJDxBIp
	 FURaa3VT6RfdsWYcw/5W+AQV7CMDB7DBW7nV/+GG7pkZG4c6THCiD/tiPRHEfwxiJf
	 e9xxJClaJ1ewYfR1DgoXElpxdMDj9EDyiUna+Z3gjuHiT7/7Erlnrxe/Qww3pYdLq9
	 s/bkgDP7xfkjA==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:42 +0200
Subject: [PATCH v3 24/41] mtd: spi-nor: macronix: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-24-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031721_729407_F65B6585 
X-CRM114-Status: GOOD (  11.77  )
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

The INFOx() macros are going away. Convert the flash_info database to
the new format.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/macronix.c | 218 ++++++++++++++++++++++++++++-------------
 1 file changed, 150 insertions(+), 68 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b21e688fe056..0508a207e9df 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -33,74 +33,156 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
 };
 
 static const struct flash_info macronix_nor_parts[] = {
-	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16) },
-	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256) },
-	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "mx25r3235f",  INFO(0xc22816, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		.fixups = &mx25l25635_fixups },
-	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-	{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
-		FLAGS(SPI_NOR_RWW) },
-	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512) },
-	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
-		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
-	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{
+		.id = SNOR_ID(0xc2, 0x20, 0x10),
+		.name = "mx25l512e",
+		.size = SZ_64K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x12),
+		.name = "mx25l2005a",
+		.size = SZ_256K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x13),
+		.name = "mx25l4005a",
+		.size = SZ_512K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x14),
+		.name = "mx25l8005",
+		.size = SZ_1M,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x15),
+		.name = "mx25l1606e",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x16),
+		.name = "mx25l3205d",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x9e, 0x16),
+		.name = "mx25l3255e",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x17),
+		.name = "mx25l6405d",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x32),
+		.name = "mx25u2033e",
+		.size = SZ_256K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x36),
+		.name = "mx25u3235f",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x33),
+		.name = "mx25u4035",
+		.size = SZ_512K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x34),
+		.name = "mx25u8035",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x37),
+		.name = "mx25u6435f",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x18),
+		.name = "mx25l12805d",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x26, 0x18),
+		.name = "mx25l12855e",
+		.size = SZ_16M,
+	}, {
+		.id = SNOR_ID(0xc2, 0x28, 0x15),
+		.name = "mx25r1635f",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x28, 0x16),
+		.name = "mx25r3235f",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x38),
+		.name = "mx25u12835f",
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x19),
+		.name = "mx25l25635e",
+		.size = SZ_32M,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &mx25l25635_fixups
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x39),
+		.name = "mx25u25635f",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K,
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x3a),
+		.name = "mx25u51245g",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc2, 0x81, 0x3a),
+		.name = "mx25uw51245g",
+		.n_banks = 4,
+		.flags = SPI_NOR_RWW,
+	}, {
+		.id = SNOR_ID(0xc2, 0x23, 0x14),
+		.name = "mx25v8035f",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x26, 0x19),
+		.name = "mx25l25655e",
+		.size = SZ_32M,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x1a),
+		.name = "mx66l51235f",
+		.size = SZ_64M,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x3a),
+		.name = "mx66u51235f",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x1b),
+		.name = "mx66l1g45g",
+		.size = SZ_128M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x26, 0x1b),
+		.name = "mx66l1g55g",
+		.size = SZ_128M,
+		.no_sfdp_flags = SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x3c),
+		.name = "mx66u2g45g",
+		.size = SZ_256M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	},
 };
 
 static void macronix_nor_default_init(struct spi_nor *nor)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
