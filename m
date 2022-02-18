Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50D4C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0fRMhYFpcYs+ijvgIMiqq/iEpxJViACix7M3571bmGk=; b=zwsT5z/w0br050
	ROJT4CoNI/SmHxtufsbhVj/GUJJhpbA+4XOOoohY9It1F8nJ7vzABIDpa/2H8Cem02px7lUAKEUP+
	aPnAjLq0J3zqsyhRQS6gAQMFsZ3HK5WoEH0fm5dGxvqRDZ0aULkSFt2NBrOlNOKnnUPfniBAlkAzq
	kGFXUOZCcsB7nrohtkFjBuWANzzG3B37EpCzgymxYFLzdOK87z2AN+dPNIlPHMtoLE9sFwE9gdDyg
	94lzcjY25buCozHFmPG1AtmQ6Vp9M6OFGT25tSCRN9NpAXb+hwxKtoX8QpxmtcOWki+1F77DzmNe3
	ebmvUl0aChjmfowPyYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL57p-00F5bJ-IO; Fri, 18 Feb 2022 15:24:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4jA-00Eu5I-UL
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 14:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645196360; x=1676732360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMBmBCezp7nm9x2XqJiN9Nfc5zCWTIcgFPMneJ/ixI0=;
 b=B89VH70NYOsqOO6aXTkiV57SZYEZx9GRZa8uxbV/iFU+AGVQ5XdRxpGe
 vW1x3SF+tzRg535BJXBHlpsoaobo+XzHvc1ZAIc6XKnwlhF07gf0ch3Tq
 DxDcy7Qo5CYzv9npn1yZT+jOtAWjlLpPXpFPx+lzNRJ+uWcUolG0VKBCw
 j4dzaP2iOn/ZeMwqa9NTxhwobmFmwZdG5RVoueju7ghcvo/83+G2etQU3
 Nyin13X7a+f9WcUIeqaHF0PVwHtvhKIR/2V1Z3gVBS2v1n+n7BRgM/glK
 TdalgeUK1HvTu2VdMYnmErTjVWwhKLIKwtOQ+4sJ8A+1tQXB0lDLTHFXb w==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="162789015"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Feb 2022 07:59:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 18 Feb 2022 07:59:19 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 18 Feb 2022 07:59:16 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <nicolas.ferre@microchip.com>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 4/4] mtd: spi-nor: core: Introduce SPI_NOR_DTR_BSWAP16
 no_sfdp_flag
Date: Fri, 18 Feb 2022 16:59:00 +0200
Message-ID: <20220218145900.1440045-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065921_021548_DD4A8913 
X-CRM114-Status: GOOD (  12.51  )
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
---
 drivers/mtd/spi-nor/core.c | 5 ++++-
 drivers/mtd/spi-nor/core.h | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 453d8c54d062..c3128a8e1544 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2572,7 +2572,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
+	const u16 no_sfdp_flags = nor->info->no_sfdp_flags;
 	u8 i, erase_mask;
 
 	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
@@ -2613,6 +2613,9 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 					SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
 	}
 
+	if (no_sfdp_flags & SPI_NOR_DTR_BSWAP16)
+		nor->flags |= SNOR_F_DTR_BSWAP16;
+
 	/*
 	 * Sector Erase settings. Sort Erase Types in ascending order, with the
 	 * smallest erase size starting at BIT(0).
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 7c077d41c335..1cb887437193 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -362,6 +362,8 @@ struct spi_nor_fixups {
  *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
  *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
  *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
+ *   SPI_NOR_DTR_BSWAP16:     the byte order of 16-bit words is swapped when
+ *			      read or written in DTR mode compared to STR mode.
  *
  * @fixup_flags:    flags that indicate support that can be discovered via SFDP
  *                  ideally, but can not be discovered for this particular flash
@@ -404,7 +406,7 @@ struct flash_info {
 #define USE_FSR				BIT(10)
 #define SPI_NOR_XSR_RDY			BIT(11)
 
-	u8 no_sfdp_flags;
+	u16 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
 #define SECT_4K_PMC			BIT(2)
@@ -413,6 +415,7 @@ struct flash_info {
 #define SPI_NOR_OCTAL_READ		BIT(5)
 #define SPI_NOR_OCTAL_DTR_READ		BIT(6)
 #define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+#define SPI_NOR_DTR_BSWAP16		BIT(8)
 
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
