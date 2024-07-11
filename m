Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098ADC3DA41
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67lKtDDcxMuJQjktjNcEWvc8MrB6z/iL3mZcIA0hDuY=; b=SDd7QGTaKatC7J
	zJE54aoWLo5z4+1rJvYIRlXgMEAJaaTY42f0C8YPFrUG2JNjtiAqCLP3oztquhZiSRPpDHsmfvAuW
	EBPJ7ZWIwC6Ot8WY/vXbaBjfNtnvYLI64fMroPEE9TLnBvt6C6/YViypxj3ndNKwHZBgujQUGTuyS
	44H0hq/vMgRFE0jIQBqA9y/vlqiRkj4DKrIZT2CB3DXTT/2KSwG68EqhAeOWUlU0r3BJWakMrkDL3
	ZjGaVVqox2K9L04R3TF/t9BHFO7BJPgv3LX/oAKX5rC4PdYZmuypgcxl0jSl/cyBa5WDhTB06oGjj
	HqgiBkCYnU+zNoDD9N2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtSf-0000000E3bC-3mwd;
	Thu, 11 Jul 2024 13:03:49 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPR-0000000E1YN-0i6k;
	Thu, 11 Jul 2024 13:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6Udo75OjxMB/GImXQS4AFYjVsw/wVAePEtyqQJPRUb4=; b=NJAPg+nu9OiKm4SUoX2pf7ZF0g
	5QQNBl7mPeyukQ7zWMWyoY/WKkwUBzp/l+SewpZkbAOH60X4S6Dd7GuPpFX2eyQDn5FLwuvYZXOmj
	ChuLz7+vYYeGGfqI6Z86MdlftUNDWfYsfGM/QW8LYXqvzI17oFFdRnYmQFbf1mhOUit3sJtgeIrgX
	3Fxb0eMam7Ecoww4STzELhmr4MS+PpK51po6Y/Fo2Qap2fqpCmzzY9/OaNTulWGmp2fMfk4+aYR2+
	NDEnIupBPOM2ENS66bZVy9i+0AmPI1V1aiTUR2iFkbJGeukGQOIYc9BVx5RTZK6t3W9LMUBOU4Pj/
	WVeaptPg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPP-000BVF-Mo; Thu, 11 Jul 2024 15:00:27 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPP-0003my-1c;
	Thu, 11 Jul 2024 15:00:27 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 11 Jul 2024 15:00:09 +0200
Subject: [PATCH v3 09/15] mtd: spi-nor: micron-st: Use new SPI_NOR_TRY_SFDP
 flag
MIME-Version: 1.0
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-9-99353461dd2d@geanix.com>
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=6842;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=8gRxmjbNJOt6+hI1qXw+SxmSI/YFHve+jCyTXkZDUNI=;
 b=xaFoGar83fLOcfyMUbhb096+1G1ELXt+OevuCtRGTnEF+V+0NY7avO0ZwWxCcb7qt/1kcl8UG
 zeAl5FRakuYCm30WJ0mfrYOnw/5K5FmAKd9WwFF9Bs5PuC+g5BUIZfJ
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060029_387567_F9AA3225 
X-CRM114-Status: GOOD (  10.03  )
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

This converts from the old (deprecated) implicit way of triggering an
optional SFDP parse with fallback to the static configuration in the
matching struct flash_info entry.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/spi-nor/micron-st.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3c6499fdb712..c40e02b4f030 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -166,7 +166,8 @@ static const struct flash_info micron_nor_parts[] = {
 		.sector_size = SZ_128K,
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
-				 SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+				 SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
+				 SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
 		.fixups = &mt35xu512aba_fixups,
@@ -175,7 +176,7 @@ static const struct flash_info micron_nor_parts[] = {
 		.name = "mt35xu02g",
 		.sector_size = SZ_128K,
 		.size = SZ_256M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	},
@@ -364,38 +365,38 @@ static const struct flash_info st_nor_parts[] = {
 		.id = SNOR_ID(0x20, 0xba, 0x16),
 		.name = "n25q032",
 		.size = SZ_4M,
-		.no_sfdp_flags = SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x17),
 		.name = "n25q064",
 		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x18),
 		.name = "n25q128a13",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x19, 0x10, 0x44, 0x00),
 		.name = "mt25ql256a",
 		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x19),
 		.name = "n25q256a",
 		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x20, 0x10, 0x44, 0x00),
 		.name = "mt25ql512a",
 		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.mfr_flags = USE_FSR,
 	}, {
@@ -404,7 +405,7 @@ static const struct flash_info st_nor_parts[] = {
 		.size = SZ_64M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x21),
@@ -412,38 +413,38 @@ static const struct flash_info st_nor_parts[] = {
 		.size = SZ_128M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x22),
 		.name = "mt25ql02g",
 		.size = SZ_256M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 		.fixups = &mt25q02_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x15),
 		.name = "n25q016a",
 		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x16),
 		.name = "n25q032a",
 		.size = SZ_4M,
-		.no_sfdp_flags = SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x17),
 		.name = "n25q064a",
 		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x18),
 		.name = "n25q128a11",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x19, 0x10, 0x44, 0x00),
@@ -451,14 +452,14 @@ static const struct flash_info st_nor_parts[] = {
 		.size = SZ_32M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x19),
 		.name = "n25q256ax1",
 		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
@@ -473,7 +474,7 @@ static const struct flash_info st_nor_parts[] = {
 		.size = SZ_64M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
@@ -484,14 +485,14 @@ static const struct flash_info st_nor_parts[] = {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
 		.size = SZ_128M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x22),
 		.name = "mt25qu02g",
 		.size = SZ_256M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.mfr_flags = USE_FSR,
 		.fixups = &mt25q02_fixups,
 	}

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
