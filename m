Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236C5EE4996
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otmoIA586fGJCgc1tO3ilQytAXsdUyHNVfSWTveSXaE=; b=ky/L/8y3AorMV3
	NhwK6Y+twuWzVgYb6MLY3IwNFAC+Pvz3eXHq+NmwajUyoFF0Y/vVVQU4ZtNGIaQqtnQkpU2a3VwaS
	WqUvXzLMlKs1erc6kg2KQ48I7kCVvWyY6R6KvuWp1ay/kiBqFgvJW1y/pafnCBLCOUu7Yf6Gi8ukO
	nZmhx6FXS8gIcgCJoPPvNn/xonnomRw7k7SwAcdUE1zz9IlZz9Iotw1ZlUztNG4SaZU+z6q5YFbNy
	FVLZGaKpkSgsi+HICMIElS+1AdNaY/fYBJwod6ftCMU8c7kWJgFdMiY9un5VfB8azd++Lfn3nyFLj
	HMVTrwwV0B2gTp5OPcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMXq-00FRBV-1N;
	Tue, 22 Aug 2023 08:15:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWv-00FIIZ-0L
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D65864D7D;
	Tue, 22 Aug 2023 07:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1FDC433C8;
	Tue, 22 Aug 2023 07:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688218;
	bh=Wbw26ozDm2yZuCOCpEEf+tY0cT7CvfziJiMaObcpSys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mmxyc4wJY27mkv279ZEKdvaGRZREKH9zng9wVwhumEcVVM7f0mpztL97pe0poTRPH
	 ND+emjQTT4LHvL3g1/4bJUHVZuPedIjuxMVtTEHkKVSlsiLgGbHRrsqErCYPIjA10U
	 9BfbpB0nQrUDUUdbEvI7NdS9MN6Vs0UEsl+W5vXVNqV/r5CHLhy/oMevZz75E4pdD+
	 TwpQClcIQRM83vc29iXj9+qDwMWT6JD6GCD8DxKy6jTli2tkEGkES0FTcoUAMpX5JS
	 e2lb9wmP/HvV3QXsrKXzkG+FChdHz+3W+AToeH41k68rdYfbb5jnHECoITJYyo/0TI
	 n8dcPQF4Ouh2A==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:37 +0200
Subject: [PATCH v2 21/41] mtd: spi-nor: gigadevice: convert flash_info to
 new format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-21-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_001021_233558_07688F39 
X-CRM114-Status: GOOD (  11.96  )
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
 drivers/mtd/spi-nor/gigadevice.c | 81 ++++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 7cf142c75529..0d22cd99715b 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -34,38 +34,55 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 };
 
 static const struct flash_info gigadevice_nor_parts[] = {
-	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25lq32", INFO(0xc86016, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25lq128d", INFO(0xc86018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 0)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
-		.fixups = &gd25q256_fixups },
+	{
+		.id = SNOR_ID(0xc8, 0x40, 0x15),
+		.name = "gd25q16",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x16),
+		.name = "gd25q32",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x16),
+		.name = "gd25lq32",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x17),
+		.name = "gd25q64",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x17),
+		.name = "gd25lq64c",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x18),
+		.name = "gd25lq128d",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x18),
+		.name = "gd25q128",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x19),
+		.name = "gd25q256",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+		.fixups = &gd25q256_fixups,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	},
 };
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
