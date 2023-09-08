Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C11DEE57F1
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCyNZvuBwrBImq34ztGx5P5BOgnnLXlmBOGSk6Mxkg8=; b=wbKbJcIgbW+cNa
	LzRCCzNPUZ/2ZGnnWPypatymrLKNxyslUN4BUtFSaQxZB/NdQvLFSgieR5qkSU6Wz73ciQyyIl3FZ
	3lo52XvihFQ9zeoeOFi0M+le27PBMvFB84yvkWSbcMThgFm3MWEIAfn/RPWt9rB8UYq8lxr1p60k+
	7k9uCZPVa31dEA9vfY0RQLMtR1eRHjGyKV1XASpi3FAXbybjpu7bnlXRRob6OD3/P7Lor9JomxT2I
	B4kD94+WgMhw5j1u6mfEGLC+b3iJ1pycVrFFuyV66BjPtl8cwwNp+zOPow/+YdWYZkBGfW6rCNg4V
	Av8S97zDg+8PspPEQRIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYY8-00DTLI-1f;
	Fri, 08 Sep 2023 10:17:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXy-00DT8j-2O
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5C948B8203A;
	Fri,  8 Sep 2023 10:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC6AC433B6;
	Fri,  8 Sep 2023 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168225;
	bh=zgFFzyUZ+SJao/5qkE8JyiR+umnjcGflTNkQJIikt2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KF/qjqC77zFxURonv6rzEu1JbOvtLVObDrbsW/G4XoeBdhZHlcZnl9iDy1SYjEFKF
	 GNoaYyX2YVswrHAWZJqYFGukkfuOAi6wor607vqQqL+btTpxVN28k6bg4Rac80KhE0
	 x0ge/MeEMosxSq0SpgV4l6c4nqgrcgThxNR2MauwlWh907PcCZAohXZTX3fPLefazP
	 UdYVVb7yHklEb1f9JHeDJm69KDZYjqkX2KNYAzpJSdQb+vdlDnBul16Hg2fxovV+5E
	 OQHMsJhDXivj62IVG3OVHatFnwU1npkgdu1D5ZsuJxlkaLdHd6d3wpTMw/mkDv95hW
	 9nTnZ+3B4EQ6Q==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:35 +0200
Subject: [PATCH v3 17/41] mtd: spi-nor: atmel: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-17-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031707_131390_C0D745AB 
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

The INFOx() macros are going away. Convert the flash_info database to
the new format.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/atmel.c | 122 +++++++++++++++++++++++++++++---------------
 1 file changed, 80 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index d2de2cb0c066..ccc985c48ae3 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -163,48 +163,86 @@ static const struct spi_nor_fixups atmel_nor_global_protection_fixups = {
 };
 
 static const struct flash_info atmel_nor_parts[] = {
-	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &at25fs_nor_fixups },
-	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &at25fs_nor_fixups },
-	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_nor_global_protection_fixups },
-	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_nor_global_protection_fixups },
-	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_nor_global_protection_fixups },
-	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_nor_global_protection_fixups },
-	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_nor_global_protection_fixups },
-	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_nor_global_protection_fixups },
-	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		.fixups = &atmel_nor_global_protection_fixups },
-	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16)
-		NO_SFDP_FLAGS(SECT_4K) },
+	{
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
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &at25fs_nor_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x44, 0x01),
+		.name = "at25df041a",
+		.size = SZ_512K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &atmel_nor_global_protection_fixups,
+	}, {
+		.id = SNOR_ID(0x1f, 0x47, 0x00),
+		.name = "at25df321",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &atmel_nor_global_protection_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x47, 0x01),
+		.name = "at25df321a",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &atmel_nor_global_protection_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x48, 0x00),
+		.name = "at25df641",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &atmel_nor_global_protection_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x42, 0x16),
+		.name = "at25sl321",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x1f, 0x04, 0x00),
+		.name = "at26f004",
+		.size = SZ_512K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x1f, 0x45, 0x01),
+		.name = "at26df081a",
+		.size = SZ_1M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &atmel_nor_global_protection_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x46, 0x01),
+		.name = "at26df161a",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &atmel_nor_global_protection_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x47, 0x00),
+		.name = "at26df321",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &atmel_nor_global_protection_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x25, 0x00),
+		.name = "at45db081d",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K,
+	},
 };
 
 const struct spi_nor_manufacturer spi_nor_atmel = {

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
