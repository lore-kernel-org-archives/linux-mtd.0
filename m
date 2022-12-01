Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42692C4321E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gcMenRYZHHt84LDtJJRmN+7MZLx7qdf9Nb3oUoNYD8=; b=BAbMqgVhE+ijhS
	MfOTLfPubdphNAUVQ5AqOWARDBIUAWmzfMNISOMU4XOMZlQdy1fHiGzMclfN+54zYXvegX8EdhTDX
	Ssxojnt1paRrq1cB1MpTEn7T4wavoHKBbNelju4GbD1OV4nbkUlVjkRjcErfYytBJ6gHYMn0alSaV
	BsseaLc02kByDgXcjIXTOr7gNCqutyyQnpWWE0ZeRWO5LHVGXCTuyRJgL2eVSowYgaJpanjzhN8ck
	VtugJfBD/3olUZS2XKwVec9zAz8qDtigLeYLh0exEFr/jy5NtjcVjLtydsV0FBewRUIMbA/8tX3II
	P9KDd4f/qu+YpCTIqArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0o7i-009YYu-6p; Thu, 01 Dec 2022 18:17:26 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0o69-009XLb-6C
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 18:15:53 +0000
Received: by mail-qt1-x82b.google.com with SMTP id h24so1864522qta.9
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 10:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQZKgZOgE0+wcpYy5gXw4iw3dPKVanHGPihBaubSi28=;
        b=x59QEa7bZQqO1AFVk9FRyfCCfSVGHzLtXt+GsDBzQV2XpmgTbI+20SSoPy5NjJtFgX
         frSLaVwZbwm7Nb2Wyathy4WvUU75+ba0wLS5DldfJj9Q60RbFEqRy6fTIlxCFfluUQob
         2CSOFUwNoNDIng9xnWp6eBL/UAqSFpBZkS7+OrX9h1UIbPxk1JleYhWSLWQCfxkli469
         UtOrZyDzD2ob8P3nFLmdaUtZ8Akf7AG4bpaMdiBf1O8Ar7dl7d0y6qBfguHe4Aw+xuQ8
         h6N9aJksd3DnK2KQgJLjk7q0cQRmd20GsNGHYHnsEpgBQ95IuqCRmhiRQ41/OQL3Hwn6
         jEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQZKgZOgE0+wcpYy5gXw4iw3dPKVanHGPihBaubSi28=;
        b=qL6/CU6KDk6hG7U8gT3/lx+ck+LZWtjxWFbdYALxKS7v6iOp5xZKiT6V7kx7xM3LNS
         82SqOPDQwBFgan40ALAn19YQn8Cd7gyqdMBRcCt+1/KKFMSwai3EqMnhJJqfbNZz0bQX
         5mEDtAvUPoEDssjiKgur/REAvHd8fSVIPMrlMUznHckGRgqfe2wQ9STer0j9guxxCBBf
         6TKawoqZOgTyZrYdopoGVvbgrrt+Rx4tg5yInvMA+yHLzzqLnQJUtUoYBQ/rLemVvl94
         Cx3SEAvSC2W+J6049lieqTwR4/dpHo3cpu2H5wKFvdJiLGX0qWD7JRfts/NmUwup6tB3
         thXA==
X-Gm-Message-State: ANoB5plO74NQxhfXQ3gvDbHu38NMvvR0XQVcsYoKcFtQjSM6WIXLaP6J
	tNMlbEOzoGbRUDa/26vOwKzvBw==
X-Google-Smtp-Source: AA0mqf7+IDmSKa2Va2r5CHxgM9ham1PoxV3KaGTyA7NkUkgl3HX8cBko8K0JCB+8esEWHVjYtYkdMg==
X-Received: by 2002:a05:622a:8cf:b0:3a4:ef5c:c69d with SMTP id i15-20020a05622a08cf00b003a4ef5cc69dmr23190959qte.194.1669918546392;
        Thu, 01 Dec 2022 10:15:46 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8464c000000b003a55fe9f352sm2908912qto.64.2022.12.01.10.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:15:45 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] mtd: spi-nor: Add additional octal-mode flags to be checked during SFDP
Date: Thu,  1 Dec 2022 13:15:31 -0500
Message-Id: <20221201181532.255449-3-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201181532.255449-1-nathan.morrison@timesys.com>
References: <20221201181532.255449-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_101549_269777_1788FF2E 
X-CRM114-Status: GOOD (  12.80  )
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

This adds some support for searching a chips SFDP table for:

read commands: 1S-8S-8S
program commands: 1S-1S-8S, 1S-8S-8S

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/core.c | 21 ++++++++++++++++++++-
 drivers/mtd/spi-nor/core.h |  9 ++++++---
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bee8fc4c9f07..7475a9a22881 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2335,7 +2335,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
+	const u16 no_sfdp_flags = nor->info->no_sfdp_flags;
 	u8 i, erase_mask;
 
 	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
@@ -2359,6 +2359,25 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 					  SNOR_PROTO_1_1_8);
 	}
 
+	if (no_sfdp_flags & SPI_NOR_OCTAL_READ_1_8_8) {
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_8_8;
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_8_8],
+					  0, 16, SPINOR_OP_READ_1_8_8,
+					  SNOR_PROTO_1_8_8);
+	}
+
+	if (no_sfdp_flags & SPI_NOR_OCTAL_PP) {
+		params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_8;
+		spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_8],
+					SPINOR_OP_PP_1_1_8, SNOR_PROTO_1_1_8);
+	}
+
+	if (no_sfdp_flags & SPI_NOR_OCTAL_PP_1_8_8) {
+		params->hwcaps.mask |= SNOR_HWCAPS_PP_1_8_8;
+		spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_8_8_8],
+					SPINOR_OP_PP_1_8_8, SNOR_PROTO_1_8_8);
+	}
+
 	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e97..25a0d4f1850b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -508,14 +508,17 @@ struct flash_info {
 #define NO_CHIP_ERASE			BIT(7)
 #define SPI_NOR_NO_FR			BIT(8)
 
-	u8 no_sfdp_flags;
+	u16 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
 #define SPI_NOR_DUAL_READ		BIT(3)
 #define SPI_NOR_QUAD_READ		BIT(4)
 #define SPI_NOR_OCTAL_READ		BIT(5)
-#define SPI_NOR_OCTAL_DTR_READ		BIT(6)
-#define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+#define SPI_NOR_OCTAL_READ_1_8_8	BIT(6)
+#define SPI_NOR_OCTAL_PP		BIT(7)
+#define SPI_NOR_OCTAL_PP_1_8_8		BIT(8)
+#define SPI_NOR_OCTAL_DTR_READ		BIT(9)
+#define SPI_NOR_OCTAL_DTR_PP		BIT(10)
 
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
