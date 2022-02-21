Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B43C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qByjXtdBL+ewhVhS2qgpcRV8kgEZISwpvVxDa0SiF80=; b=D3BnBMMuAjqPdE
	fq5hSKMn9rv8qqO+JMbkSFZ07m8U/IaVUD7rpewfNkEsGqSxKbRpysahWbRia7wTbmsIUecIRNCZq
	C2f8FSTN1OgeSjw34oCtdMS/DUxQB14+sBeuaz2HHZRkZbGCJdpowB5N2LqkIiv3/6YgtXoG88r9C
	CstcO+7tKLkI5/2lb2G67ssBiGaAdLLyU7Rh8cYouXTm+Ykvo4iINoHweISyTMwk07oRYLCqu8qPw
	n2VAFs1irYe7aO4EVKoiRDiXydHwJrPrvUzwtJcIKbIl/upPOAikytAKRhqUA6nd7zMlrng1yYAM6
	6JCub7e41YsuRRkTbafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM85v-005jBw-0V; Mon, 21 Feb 2022 12:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Ue-005Y3e-0q
 for linux-mtd@bombadil.infradead.org; Mon, 21 Feb 2022 12:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ZmH3vDq3PIMRCkZ+2mr6wFU/JwdNOHxqg5nknLkKc4w=; b=BVmeNsfwP8ZVRt2BGcOu+jQDC3
 fIy3Tbsdv8+JznW5jFUxXpArFNmzyozH1b1wGQKtv6dFpwcgPc3Hch5Ov0o/AcTrECsw7+3/pYCk4
 2UNgBj7eHHSAwYnBFjmCyuz4MIOopHIuFsYwcC/d2pkjBzuBmrQlA4YJMa864UbaxNg2tm3voOH+3
 KNRIZbKsJnVP4UjavZn1VvutO1g7jHfNkxpjixRisIiMeZ1d5ACGS5uxsWCvnUv9RqB5sfPHNaeJn
 iXylFCBZVTI+9oRCJXycJyqN2HulqtLF82PnD1JTKoyv3OGsn0TvOXhO6jJvA4Ljw5Wc4+EK/kJU2
 6wR6CT+Q==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Ua-00BdAz-5e
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:38 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6A1DB22438;
 Mon, 21 Feb 2022 13:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZmH3vDq3PIMRCkZ+2mr6wFU/JwdNOHxqg5nknLkKc4w=;
 b=ZIx10NfQvNBsRr3cAldTVS+5n763qVYKMCSw6XdvqWwLulpBkBDkp90pDbgF/GcWt/6VTO
 XzbChCB0tCOTpmfnsvVJmGxdj5VT8EbmFi/TCKSVE8O7kIs41Q5XAyT9Lk5dT5MfPFkVI/
 zR8kqef8eN7C8hmqa95Sh2JpucnjOew=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 29/32] mtd: spi-nor: spansion: convert USE_CLSR to a
 manufacturer flag
Date: Mon, 21 Feb 2022 13:08:06 +0100
Message-Id: <20220221120809.1531502-30-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_120836_429962_4D7E9AD2 
X-CRM114-Status: GOOD (  16.02  )
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

Now that all functions using that flag are local to the spansion module,
we can convert the flag to a manufacturer one.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c     |  3 --
 drivers/mtd/spi-nor/core.h     |  3 --
 drivers/mtd/spi-nor/spansion.c | 55 +++++++++++++++++++++-------------
 3 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e2b8b0a438ce..f5a2f37d140e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2447,9 +2447,6 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 
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
index 38eeb0913ab2..3606291d421c 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -8,6 +8,9 @@
 
 #include "core.h"
 
+/* flash_info mfr_flag. Used to clear sticky prorietary SR bits. */
+#define USE_CLSR	BIT(0)
+
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
@@ -212,43 +215,53 @@ static const struct flash_info spansion_nor_parts[] = {
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
 		.fixups = &s25fs_s_nor_fixups, },
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
 		.fixups = &s25fs_s_nor_fixups, },
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
@@ -370,7 +383,7 @@ static void spansion_nor_late_init(struct spi_nor *nor)
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
