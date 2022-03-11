Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF45C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Mar 2022 08:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGqXYmjLkHHD5sMv5KLghtYGcO7zvLynoI0EhU5M1A4=; b=Ssi504S0fEsmjj
	wDVeLZWDOdURybZbFA+n43dx8D4wmT1Qw0gyluomKOj6d6G7mvZrS8eAWefchYaxoxZLtnPACOklV
	vLiaKqTEZCjLW6quIGaRFLIg+ZD6busvG48TboQuAK+vHcJZTVLP3WHX2fto+ydjc53rvjpmKcEO6
	bb9CXUK5w88BAPrQa/Cw8lzF50K6j6+ebHB5LNb97k74lcdaE/kb3q/SfA7G1f23H8ktXtKMo0uzs
	hYTHgQvguDQJ0uotCguItVv86TGkPXtwaZ7XcJqOmvW3tHc//gqnjvMg2Bi2OdLY6e0v7u6YnqZdY
	QOltRNUQan9a5mZNTVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSaFs-00FS2n-FA; Fri, 11 Mar 2022 08:04:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSaDw-00FRQa-3W
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2022 08:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646985728; x=1678521728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bBuc0dSqEp0ceWg5YLI6l7Ab+hpyxnlOuGo10RXDtBQ=;
 b=PlNrCGEIBoD0dwYIQ2LiVWP5B1Alt/mY+Ipw35Atsm8AQUBOGSM0iLla
 7hbopW8XPCiwBDjb5syMDY+5bTWhVe7LNyLL8Wj9YPOlxcRI2ei+MejGs
 xyjFyqEea2OakLi15s2S6q6TaGefQykfU8uJobbM0O/OQGFZbGqAD1sgL
 lDZyoz7aOHhIJUepZERulOpJwF0e5k596z6/Z66QpNthW6DFEoOAvd5dw
 5PDkH84ReSd/Nfr7AX/93p1nWIHX2n+tIR2NCT+LLR9gFtDNTEAKkuSk4
 t46vFX16Pf7jm+k2wFaSExyNi0+sZDoIuGy2oNvitb3QYMxJAMLmVvfom A==;
X-IronPort-AV: E=Sophos;i="5.90,173,1643698800"; d="scan'208";a="156090487"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2022 01:02:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Mar 2022 01:02:05 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 11 Mar 2022 01:02:02 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <nicolas.ferre@microchip.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 4/6] mtd: spi-nor: core: Introduce SPI_NOR_DTR_BSWAP16
 no_sfdp_flag
Date: Fri, 11 Mar 2022 10:01:45 +0200
Message-ID: <20220311080147.453483-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311080147.453483-1-tudor.ambarus@microchip.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_000208_198731_BE88BA30 
X-CRM114-Status: GOOD (  12.28  )
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

Introduce SPI_NOR_DTR_BSWAP16 flag for flashes that don't define the
mandatory BFPT table. When set it indicates that the byte order of 16-bit
words is swapped when read in 8D-8D-8D mode compared to 1-1-1 mode.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 5 ++++-
 drivers/mtd/spi-nor/core.h | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a69c2813f6fc..d7eebbd01122 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2298,7 +2298,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
+	const u16 no_sfdp_flags = nor->info->no_sfdp_flags;
 	u8 i, erase_mask;
 
 	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
@@ -2339,6 +2339,9 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 					SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
 	}
 
+	if (no_sfdp_flags & SPI_NOR_DTR_SWAB16)
+		nor->flags |= SNOR_F_DTR_SWAB16;
+
 	/*
 	 * Sector Erase settings. Sort Erase Types in ascending order, with the
 	 * smallest erase size starting at BIT(0).
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 0dcbc7a81e64..4508bbea5df1 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -468,6 +468,9 @@ struct spi_nor_fixups {
  *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
  *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
  *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
+ *   SPI_NOR_DTR_SWAB16:      the byte order of 16-bit words is swapped when
+ *			      read or written in Octal DTR mode compared to STR
+ *                            mode.
  *
  * @fixup_flags:    flags that indicate support that can be discovered via SFDP
  *                  ideally, but can not be discovered for this particular flash
@@ -507,7 +510,7 @@ struct flash_info {
 #define NO_CHIP_ERASE			BIT(7)
 #define SPI_NOR_NO_FR			BIT(8)
 
-	u8 no_sfdp_flags;
+	u16 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
 #define SECT_4K_PMC			BIT(2)
@@ -516,6 +519,7 @@ struct flash_info {
 #define SPI_NOR_OCTAL_READ		BIT(5)
 #define SPI_NOR_OCTAL_DTR_READ		BIT(6)
 #define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+#define SPI_NOR_DTR_SWAB16		BIT(8)
 
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
