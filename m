Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F419EE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLdKoCF7hUsfHPuNMHs5++k7Hfh8LV0eOk3Fikc+5rE=; b=HBJK8WI28sHYi6
	SvcQho+Zg1vudClXMPSJeV/wH/fxlRAGwtwwCxRXcggxnwGtc4wZYP3C3ixl72PIJ45lMIsSL0nVo
	23U0dWIsdeMq5UDrr0pksryVf93qtqwtkmdrvKrknktATVTdq4OxFnqtEgZMs24NChnRziA84yt4m
	onDRyjRItNI7v+bwhA2Kn5qSfIFNDqCnpJ4/LtWEmFGEXJjnkBxi30JV4t5u2zW/rXkUCp/0cg1hL
	jp98tay9n4Y8JyzX/FghXjH5EIrNpzWb2QhkCLoRHqORTDT7GRlnRkRF+Si9oAshKuIB9hl2WW1Fh
	Vj5uKLzxZNEomJzwDMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYa4-00DUxx-1n;
	Fri, 08 Sep 2023 10:19:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYN-00DTZh-1T
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D3D12B82037;
	Fri,  8 Sep 2023 10:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9208C433B8;
	Fri,  8 Sep 2023 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168248;
	bh=Hn43mg0qj8ySxM5zWmi6XkFLqLq8bFck4Ydf4DyCxDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mcJUSqTG8bgd9gXuVmhYKGt/v3S2zA/kstXBaVqaOTpmqMm8GgYwbwv5Mrx/VGlrZ
	 PbLl78enOIO45kh/aAMlaoovtFEMgD+a2d96Ie3cSt06xvj6CEWZx4UsQ7TPBFCYXx
	 1UhZG4fYIv7bKwTXhF7jpovuLSFLHf/Cvvpeo1nIAvkUGKB9USZdna02zLbyDKcupR
	 IRgnu0bMVvGo2DKJa+YD3eQ7sS1lyfhpbx8R1BZ+VwuJxn8Kd2558S7g4/24eSHY+w
	 MLAwyTGLXXI99BZ7FlhAAoUfTflFJA9nmwxaB3skcAPMvv81CYNhAQEpcLU1QDlTts
	 w0aVERjfNpaeQ==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:46 +0200
Subject: [PATCH v3 28/41] mtd: spi-nor: winbond: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-28-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031731_814384_CBD360FE 
X-CRM114-Status: GOOD (  11.80  )
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
 drivers/mtd/spi-nor/winbond.c | 281 +++++++++++++++++++++++++++---------------
 1 file changed, 185 insertions(+), 96 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 0ca3e612ccf5..edc64c99cd81 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -42,102 +42,191 @@ static const struct spi_nor_fixups w25q256_fixups = {
 };
 
 static const struct flash_info winbond_nor_parts[] = {
-	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q16dw", INFO(0xef6015, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q16jv-im/jm", INFO(0xef7015, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024,  4)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		OTP_INFO(256, 3, 0x1000, 0x1000) },
-	{ "w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		OTP_INFO(256, 3, 0x1000, 0x1000) },
-	{ "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25q128jwm", INFO(0xef8018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25q256jwm", INFO(0xef8019, 0, 64 * 1024, 512)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25q64jvm", INFO(0xef7017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25q128jv", INFO(0xef7018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q128", INFO(0xef4018, 0, 0, 0)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		.fixups = &w25q256_fixups },
-	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 0) },
-	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
-			      SPI_NOR_DUAL_READ) },
-	{ "w25q512nwq", INFO(0xef6020, 0, 0, 0)
-		OTP_INFO(256, 3, 0x1000, 0x1000) },
-	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 0)
-		OTP_INFO(256, 3, 0x1000, 0x1000) },
-	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+	{
+		.id = SNOR_ID(0xef, 0x30, 0x10),
+		.name = "w25x05",
+		.size = SZ_64K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x30, 0x11),
+		.name = "w25x10",
+		.size = SZ_128K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x30, 0x12),
+		.name = "w25x20",
+		.size = SZ_256K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x30, 0x13),
+		.name = "w25x40",
+		.size = SZ_512K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x30, 0x14),
+		.name = "w25x80",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x30, 0x15),
+		.name = "w25x16",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x60, 0x15),
+		.name = "w25q16dw",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x30, 0x16),
+		.name = "w25x32",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x70, 0x15),
+		.name = "w25q16jv-im/jm",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x12),
+		.name = "w25q20cl",
+		.size = SZ_256K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x50, 0x12),
+		.name = "w25q20bw",
+		.size = SZ_256K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x60, 0x12),
+		.name = "w25q20ew",
+		.size = SZ_256K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x16),
+		.name = "w25q32",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x60, 0x16),
+		.name = "w25q32dw",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		.id = SNOR_ID(0xef, 0x70, 0x16),
+		.name = "w25q32jv",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x80, 0x16),
+		.name = "w25q32jwm",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		.id = SNOR_ID(0xef, 0x80, 0x17),
+		.name = "w25q64jwm",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x80, 0x18),
+		.name = "w25q128jwm",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x80, 0x19),
+		.name = "w25q256jwm",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x30, 0x17),
+		.name = "w25x64",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x17),
+		.name = "w25q64",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x60, 0x17),
+		.name = "w25q64dw",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x70, 0x17),
+		.name = "w25q64jvm",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x60, 0x18),
+		.name = "w25q128fw",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x70, 0x18),
+		.name = "w25q128jv",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x50, 0x14),
+		.name = "w25q80",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x14),
+		.name = "w25q80bl",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x18),
+		.name = "w25q128",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x19),
+		.name = "w25q256",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &w25q256_fixups,
+	}, {
+		.id = SNOR_ID(0xef, 0x70, 0x19),
+		.name = "w25q256jvm",
+	}, {
+		.id = SNOR_ID(0xef, 0x60, 0x19),
+		.name = "w25q256jw",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x71, 0x19),
+		.name = "w25m512jv",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x60, 0x20),
+		.name = "w25q512nwq",
+		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		.id = SNOR_ID(0xef, 0x80, 0x20),
+		.name = "w25q512nwm",
+		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x20),
+		.name = "w25q512jvq",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	},
 };
 
 /**

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
