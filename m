Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC10C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Umi3iEVfMdkVEuKVApq1t7pCuOlchebzkNUYQ1CU7c=; b=TN41lh9/5eHz9G
	4a7vlCIr0gfkXhc3LqsY/Cc/s4t/MC3foNPvXrM3UAMoJmsY9ULCOcCDKoHNhvU1y2RYO9IZZTF6Z
	JUwmgtLkV6j+9G5IsJBsDxzqv1qbRHNr4aV06ruIfsTQD1ZQjcMljtx9MyeqSCVGiBCbs7YwK6mHO
	KeiRScoRXqgpq2Ym4vWZuvNcQrejNkrOpEmil9pd0304kSycvjNDCA0gZZG/eIPTADyutufuXxwNL
	o6JpT+o6usvU5A9WadJtLyGYY3Au2LtBlg4iyj1BcWB+Woh+FIyb+DnfLQYEWcTbnJPjhwiW/9nJJ
	yEieUxP8HK7mB4ghAbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFHPI-00FxDR-Cn; Wed, 02 Feb 2022 15:18:52 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFH6F-00FrYb-6r
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:59:14 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CC10722452;
 Wed,  2 Feb 2022 15:59:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643813945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMTOvkbBBg8goW+gnyG0rIabzqBaekOQoasEsdTcsls=;
 b=E/pse3SW6yDoJgBB2ZSXnLfViIJ/kAFpuj8s4Prfchzyk8hyZaVlEuFcKcJ0Pa92JaaaXr
 CVgzOrrzWCDGb7GQsTJHkiH6jh1d9Hiw5zTg/YbgS97ps1GNjXrWcf95txae0xvin0/LYP
 gm3p6lQua6TYN97FLDQ0Rwcs5iyN3IQ=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v1 13/14] mtd: spi-nor: spansion: convert USE_CLSR to a
 manufacturer flag
Date: Wed,  2 Feb 2022 15:58:52 +0100
Message-Id: <20220202145853.4187726-14-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202145853.4187726-1-michael@walle.cc>
References: <20220202145853.4187726-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_065911_622142_67112E61 
X-CRM114-Status: GOOD (  16.47  )
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

Now that all functions using that flag are local to the spanion module,
we can convert the flag to a manufacturer one.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c     |  3 --
 drivers/mtd/spi-nor/core.h     |  3 --
 drivers/mtd/spi-nor/spansion.c | 54 +++++++++++++++++++++-------------
 3 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5b00dfab77a6..2d5517b3db96 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2448,9 +2448,6 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 
 	if (flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-
-	if (flags & USE_CLSR)
-		nor->flags |= SNOR_F_USE_CLSR;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index a02bf54289fb..2130a96e2044 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -14,7 +14,6 @@
 enum spi_nor_option_flags {
 	SNOR_F_HAS_SR_TB	= BIT(1),
 	SNOR_F_NO_OP_CHIP_ERASE	= BIT(2),
-	SNOR_F_USE_CLSR		= BIT(4),
 	SNOR_F_BROKEN_RESET	= BIT(5),
 	SNOR_F_4B_OPCODES	= BIT(6),
 	SNOR_F_HAS_4BAIT	= BIT(7),
@@ -347,7 +346,6 @@ struct spi_nor_fixups {
  *   SPI_NOR_NO_ERASE:        no erase command needed.
  *   NO_CHIP_ERASE:           chip does not support chip erase.
  *   SPI_NOR_NO_FR:           can't do fastread.
- *   USE_CLSR:                use CLSR command.
  *
  * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
  *                  Used when SFDP tables are not defined in the flash. These
@@ -398,7 +396,6 @@ struct flash_info {
 #define SPI_NOR_NO_ERASE		BIT(6)
 #define NO_CHIP_ERASE			BIT(7)
 #define SPI_NOR_NO_FR			BIT(8)
-#define USE_CLSR			BIT(9)
 
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 4756fb88eab2..c31ea11f71f2 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -8,6 +8,8 @@
 
 #include "core.h"
 
+#define USE_CLSR	BIT(0)
+
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
@@ -212,43 +214,53 @@ static const struct flash_info spansion_parts[] = {
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64)
-		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
+	},
 	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256)
-		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
+	},
 	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
-		FLAGS(USE_CLSR)
 		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
+	},
 	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
-		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
+	},
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
+	},
 	{ "s25fs128s1", INFO6(0x012018, 0x4d0181, 64 * 1024, 256)
-		FLAGS(USE_CLSR)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25fs_s_fixups, },
 	{ "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128)
-		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
+	},
 	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512)
-		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
+	},
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256)
-		FLAGS(USE_CLSR)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25fs_s_fixups, },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64)
-		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
+	},
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256)
-		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		MFR_FLAGS(USE_CLSR)
+	},
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8) },
 	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16) },
 	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32) },
@@ -370,7 +382,7 @@ static void spansion_late_init(struct spi_nor *nor)
 		nor->mtd.erasesize = nor->info->sector_size;
 	}
 
-	if (nor->flags & SNOR_F_USE_CLSR)
+	if (nor->info->mfr_flags & USE_CLSR)
 		nor->params->ready = spi_nor_sr_ready_and_clear;
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
