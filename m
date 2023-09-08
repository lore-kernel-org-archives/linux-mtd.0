Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D86EE57EB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 11:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u34aRo5fSScwMAW7ER/AznFl2cQgKnhCyP4+avvQRTg=; b=Bj0QgNbb4aDosh
	ZSoFMmgWx7LyLUSPl7Hylml8vxPuQUWM1xnaGF8gAUvKQcjqfUSq66aKD54nj8C6YC/W/plAAuZr5
	+drq8uyFbggQPLsVeYJxkezAebElVaX1WJ55FkG1fW5u9h0Xroo4lT03NYm9SZdojlQQBWHTjK9vr
	LOdjuYuhsv1wy1megaltFXJMcxEhhceAbIEP4F1rnL8WyztUJFbcilx9MqpucuhL93nydnhKriLDQ
	O5Ry4pjxVZXXc6c1AXu/nDykQEGfF/55MZSJ5CzpdkZaahdHJy+FcuTSxRUkx+kK5BuQc7933ydSD
	f0tem3yWsznyATy4iumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeZhu-00DgE7-2S;
	Fri, 08 Sep 2023 11:31:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYL-00DTXX-0d
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AJVLd2upGZnjVikjfAbIb8m5TLujnsHXGROBVl3EmvQ=; b=Sk3IAduqTSPHNVcHvq49EeaJ4h
	ksyUJ5b6JmghbmBrGC8D6Wz8RU2cJccAdMmEW9YDTE7cbr/62tmCfZOS6RERhvXDYgOFHSwhKNPAt
	XnNEE8kdGWPiaFEVFIeYx5w+iQ2yV1U3xAwetNbtV+K2xsb4czfWeURaPKQq6vNRYkKPixOCWQCn4
	7PdyLhewAYLugmYwQ2fUsLQvQCO8nWHPyiPvuR9mPD2elV9RotWFnwzGCoGg/slTFMLLAPRoiOgIq
	mjMKq7DZ9YkUcwehQrz2gqJ928vFYhxAWaobSK14qfU16IMAvSE4lpi5UghuV1d6tM2WowVW/LNUZ
	v1NP/Bog==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYE-002QzY-2i
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6467D60FB6;
	Fri,  8 Sep 2023 10:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274FBC433A9;
	Fri,  8 Sep 2023 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168237;
	bh=u3h1HEnFV5TaycBrs44qWUZVzeJsRZVGR9YPZRIQPdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QZ4w+uYAi0wf19ca13U2ZAkFJvZG3qL4H3YTNHcAM/zE2j2UY7/8ECEMvYwAkuLpy
	 ZT/nGFJ+ykAVxuR4Ij3Lm7mdB1UbHMNu137jM+ycHOsLnsocYgfP49eZ1J9RKkyiLV
	 4EsmFPajRMNMwi6d+0M9TfUp3jyMx8vV87n38MzoTSFDcJZK5ODZHB2qG5mLtxo6Qg
	 /e3MrHwWMLebXQl0wA1KtlhcInRF1ARAyuv+HLlLjezXhWZUgGI71DotyKka766Plf
	 xazelLLosjVonlEKMS2V+XjSHkAHAMbyYB4YGocEf1EOlj5ld37dqg2NXYlBNt17NB
	 vr3BcP+v8ioAw==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:41 +0200
Subject: [PATCH v3 23/41] mtd: spi-nor: issi: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-23-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_111724_821922_499FF9A7 
X-CRM114-Status: GOOD (  11.91  )
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
 drivers/mtd/spi-nor/issi.c | 114 +++++++++++++++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index d31401bcab64..9478f1e61626 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -47,44 +47,86 @@ static const struct spi_nor_fixups pm25lv_nor_fixups = {
 };
 
 static const struct flash_info issi_nor_parts[] = {
-	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,   8)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25lp016d", INFO(0x9d6015, 0, 64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25lp032",  INFO(0x9d6016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25lp064",  INFO(0x9d6017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 0)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
-		.fixups = &is25lp256_fixups },
-	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25wp256", INFO(0x9d7019, 0, 0, 0)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
-		FLAGS(SPI_NOR_QUAD_PP)
-		.fixups = &is25lp256_fixups },
-
-	{ "pm25lv512",   INFO0(32 * 1024,    2)
-		NO_SFDP_FLAGS(SECT_4K)
+	{
+		.id = SNOR_ID(0x7f, 0x9d, 0x20),
+		.name = "is25cd512",
+		.sector_size = SZ_32K,
+		.size = SZ_64K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x9d, 0x40, 0x13),
+		.name = "is25lq040b",
+		.size = SZ_512K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x15),
+		.name = "is25lp016d",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x14),
+		.name = "is25lp080d",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x16),
+		.name = "is25lp032",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x17),
+		.name = "is25lp064",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x18),
+		.name = "is25lp128",
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x19),
+		.name = "is25lp256",
+		.fixups = &is25lp256_fixups,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x16),
+		.name = "is25wp032",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x17),
+		.size = SZ_8M,
+		.name = "is25wp064",
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x18),
+		.name = "is25wp128",
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x19),
+		.name = "is25wp256",
+		.flags = SPI_NOR_QUAD_PP,
+		.fixups = &is25lp256_fixups,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.name = "pm25lv512",
+		.sector_size = SZ_32K,
+		.size = SZ_64K,
+		.no_sfdp_flags = SECT_4K,
 		.fixups = &pm25lv_nor_fixups
-	},
-	{ "pm25lv010",   INFO0(32 * 1024,    4)
-		NO_SFDP_FLAGS(SECT_4K)
+	}, {
+		.name = "pm25lv010",
+		.sector_size = SZ_32K,
+		.size = SZ_128K,
+		.no_sfdp_flags = SECT_4K,
 		.fixups = &pm25lv_nor_fixups
-	},
-	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64)
-		NO_SFDP_FLAGS(SECT_4K) },
+	}, {
+		.id = SNOR_ID(0x7f, 0x9d, 0x46),
+		.name = "pm25lq032",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}
 };
 
 static void issi_nor_default_init(struct spi_nor *nor)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
