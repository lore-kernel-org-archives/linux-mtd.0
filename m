Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92D6C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWROagXrC4VHp/OG+HZ+btoVAnMEy82zyZv4lBoJcWg=; b=RVRRvd4O32Ipyk
	UrxkKsW54S3JpfTlQ4YKZrgSuBQNX2bmv21n+cenhE1NyVKVbU9UldUySLpfdc9i4xDQBk+ipJYET
	NB0frfYYm7gkbyVWDmUSxcpohe4z3a0AFBtV6z7UftX2upZbmKQmyXXCnaCUQBoN2ZXW1ppbhsuP3
	05ObDcG8EF3hwjaz0iTWZP+JdvT8Li97IeMAMCzSmCPVRNJ5y75xTD9YxAwvQPcg8XddpE4EPwQT4
	+7et7Lkam6dYhTY5wd+vIH8gm+7CBfd2QxRhZ/oBQlVupV+7Fmn+cEtPJNlIW810Snny6FM03IeW9
	ct2KXc5FbDqrfupE7Jvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgf-007gkw-17;
	Wed, 01 Nov 2023 14:59:17 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgT-007geU-0D
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 14:59:11 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c3c8adb27so1026784666b.1
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698850744; x=1699455544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1CaHujmlwRIOeKj3JlukIW6XiKQyNNWj005IH+mxcs=;
        b=aheJfTXf0ZCKVQe4VXI9vyACNrxIeOHxMVyAaENHbPW0GBQJuxZxcpPFTs9g26jZl5
         UGdp2Yuu5e8E0ZYmRvFveI9w22tqMrwpK2D2KeYngF/d/Nz3+aVzpmU/YpQTGTnaDLXL
         uiXVf+DZu6KowCOPvl/Uw1AQaQSEbQ9vl/l7RqXfHA9QNFEzcZpuITVKKTg6p6K7VP7n
         UpcvKLIXVvE0V/nvRQjEAeVJvmRL47EeY6cdbo+na5J/tYtA8Tnwn/dX57yUSW/qqINa
         4Kx1ZPecSHTKN7ZbxFA9Eq9zlMS6XY36jED9iljmgADeiIZpbH28w0HAG50TknJtdnnU
         Mnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698850744; x=1699455544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1CaHujmlwRIOeKj3JlukIW6XiKQyNNWj005IH+mxcs=;
        b=WS6Ih7O+e90UffIBli/NE4t6PJUKDBcUtTfgp7xAewZcABLBUMp2VT3/yCj8fbo+Em
         xFXLB1dXZqWz5ehA2RTezzzGSXWe7d/xt6MKY7xkcYsoXoFlat0bpTKBbG1XOBP2G5wA
         IT+lvZET0H2GsknnMhxi1IWtFSajME5BSpbKQRArJKfoBHWl1JhZN8r1f8lNDuEYCJTF
         eHXf5cBIpYOK9Bk+WhrnMVRUMlebz2poeN+CKaT0QRWpByL0SGJOmz+2ndNjmm19cWDJ
         ZEYEO8qnQult33Vyo6J3tdCXZ1CQ+IHhW2SiYt94oy4sjsoDdh04DqXWFt/zyRV9Dmfx
         nInQ==
X-Gm-Message-State: AOJu0YzqNqcP1mYVfXYCZe8RWS9gaPvyPW+5gU/2kW0GlcpR/6x6SwgM
	BaC8TrqVgRt5514a9X917U3aJQ==
X-Google-Smtp-Source: AGHT+IHP3t+7SWk9N1xYbrdMhm8RoSoWabQNo8OWn08AM3L4gpOP+NAUQFo9ObOSImVDnQpy6uObfg==
X-Received: by 2002:a17:907:c007:b0:9d4:55b1:a45f with SMTP id ss7-20020a170907c00700b009d455b1a45fmr2083066ejc.43.1698850743867;
        Wed, 01 Nov 2023 07:59:03 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b009ad8acac02asm20448eja.172.2023.11.01.07.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:59:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 4/6] mtd: spi-nor: micron-st: enable die erase for multi die flashes
Date: Wed,  1 Nov 2023 14:58:51 +0000
Message-ID: <20231101145853.524045-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231101145853.524045-1-tudor.ambarus@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_075905_102456_179AD9F4 
X-CRM114-Status: GOOD (  13.35  )
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

Enable die erase for multi die flashes, it will speed the erase time.

Link: https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_1gb_3v_65nm.pdf?rev=b6eba74759984f749f8c039bc5bc47b7
Link: https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_l_02g_cbb_0.pdf?rev=43f7f66fc8da4d7d901b35fa51284c8f
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/micron-st.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8920547c12bf..ab8a53f0c99f 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -11,6 +11,7 @@
 /* flash_info mfr_flag. Used to read proprietary FSR register. */
 #define USE_FSR		BIT(0)
 
+#define SPINOR_OP_MT_DIE_ERASE	0xc4	/* Chip (die) erase opcode */
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
 #define SPINOR_OP_CLFSR		0x50	/* Clear flag status register */
 #define SPINOR_OP_MT_DTR_RD	0xfd	/* Fast Read opcode in DTR mode */
@@ -192,6 +193,24 @@ static struct spi_nor_fixups mt25qu512a_fixups = {
 	.post_bfpt = mt25qu512a_post_bfpt_fixup,
 };
 
+static int st_nor_four_die_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->n_dice = 4;
+
+	return 0;
+}
+
+static struct spi_nor_fixups n25q00_fixups = {
+	.late_init = st_nor_four_die_late_init,
+};
+
+static struct spi_nor_fixups mt25q02_fixups = {
+	.late_init = st_nor_four_die_late_init,
+};
+
 static const struct flash_info st_nor_parts[] = {
 	{
 		.name = "m25p05-nonjedec",
@@ -366,16 +385,17 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "n25q00",
 		.size = SZ_128M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
+			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x22),
 		.name = "mt25ql02g",
 		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &mt25q02_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x15),
 		.name = "n25q016a",
@@ -433,16 +453,16 @@ static const struct flash_info st_nor_parts[] = {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
 		.size = SZ_128M,
-		.flags = NO_CHIP_ERASE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x22),
 		.name = "mt25qu02g",
 		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &mt25q02_fixups,
 	}
 };
 
-- 
2.42.0.820.g83a721a137-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
