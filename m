Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E0BEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 10:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+/JCfuE6L4K+X1KDGMpOPOubbCd4e6CfOrCU6q/rvA=; b=TK1cLpw6NehyTQ
	5mq6z5/YS29M/8l384DfBZGkJktVfq0lRw57sDqYCOXV1SHvqcYn3NWBgea/yJa+f/0FeqvgYdEzi
	5x+Q0BGamg9NckKFhkt+A3qRr1SAjofLN7dbLucb/jYPyb0YWinmH3Q2AERNtJto0GCcJZorJid09
	gIwaCuWQJqDQmUALyfhYmsek2yEXHFMobsBWVlI7QGajqvusULKNNZsAYQ6NLjzt25DyJKHaUthbh
	I0/MVlMnY08sOEODguN2ybHDsoa0o7sMfPX4jkoBug608Cjg3glfGqySJxOu0nR0TFdM/pUfY7qWt
	2BYW2aGDka9X59M2DhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtuw-002zDL-0v;
	Thu, 13 Jul 2023 10:51:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtur-002zAI-2B
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 10:51:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso4954595e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2023 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689245479; x=1691837479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHIJa0Ui2u3szmIVC3NOS3Fud/pz4CmM84ZQ4J+2KPY=;
        b=PrUWEyJRI4zXrhYOk4zIj3wXnQTBwTjRKez6OE+KdL1XurCiOSwGKlgxUuidF1WRmk
         ytE9KpZV6u2fvkjeqSxtiX6iVKXCj3FoUXZQZOPiE0haZnVYXCRH2dQxVkpe2dK7wYq2
         sen28kIh2GCzcWIXhhmeICGf83CiKuG3LmILxtlmA8C61CoZuq/oQ0X36Q6b/jdNNVs1
         rk9trJ1ySRLOJiSfhcMEyLpQxFsPeu2W1zEjLvJ0y2FmZEX6wViJ/ZC+IC1KG4ObI7/F
         BiIDEGMllD0R4ypqm3mkA4XhUaGVqHQniuZBe6WQRKhHFOKlpOVn/++JyP3Wy2V+6HB3
         iAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689245479; x=1691837479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHIJa0Ui2u3szmIVC3NOS3Fud/pz4CmM84ZQ4J+2KPY=;
        b=bqQtGgYt7WyQFJUSclVT9P/doleZg+s/5ZC6pAEAZRyfb7wFUK+uh5c+TRBRYfDtKZ
         BYWM1ytPPQHKjJwedX334bCiT9wyIiXfGdQAiO9cTc2k3LaivV+ObhDII8bDZ4AWKSNq
         txi+dV+jFpDuFrijjQmge+Y66WNDJVFxQRQHr9vrvC52r9xjouvQU18prL5cfups/D+k
         YhWk5jx6rq1EYTLZZqYwPlNaKQKLj4OzOcp+5rqLapZNEMbjwIgccdCXD5KvHxB0OhoL
         KBRQhvkKL0tm64LhusdGQH75Eaaj/06JUk6J736NAkBdpC2RKqYayd1k6gGEPX2mdJ5E
         bfLg==
X-Gm-Message-State: ABy/qLbL/tcdSblITaAmwdEGWst8yHEQ5jTQMKmJRKO0eZoss3m53HIj
	RbXkWPVosPzT2WLD+V3IrBY=
X-Google-Smtp-Source: APBJJlGYB1OYgVbWgSa0mEsT52g8J/Z3s7ct1pzishE/TdrOtxLtU96XSPxvtX8sn/pFJ71nSoSeHA==
X-Received: by 2002:a05:600c:b4b:b0:3fa:74ae:df9f with SMTP id k11-20020a05600c0b4b00b003fa74aedf9fmr1059528wmr.37.1689245479065;
        Thu, 13 Jul 2023 03:51:19 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id a19-20020a05600c225300b003fbb0c01d4bsm7511402wmm.16.2023.07.13.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 03:51:18 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 5F10B818F0;
	Thu, 13 Jul 2023 18:50:41 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 3/3] mtd: spi-nor: change MACRO for flash ID tables
Date: Thu, 13 Jul 2023 18:50:58 +0800
Message-Id: <20230713105058.101321-4-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713105058.101321-1-jaimeliao.tw@gmail.com>
References: <20230713105058.101321-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_035121_724156_FF46911B 
X-CRM114-Status: GOOD (  12.12  )
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

From: JaimeLiao <jaimeliao.tw@gmail.com>

Remove flag PARSE_SFDP and organize no_sfdp_flags into
nor->info->flags

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/spi-nor/atmel.c      |  40 +++++------
 drivers/mtd/spi-nor/eon.c        |  15 ++--
 drivers/mtd/spi-nor/esmt.c       |  10 ++-
 drivers/mtd/spi-nor/gigadevice.c |  43 ++++++------
 drivers/mtd/spi-nor/issi.c       |  28 ++++----
 drivers/mtd/spi-nor/macronix.c   |  65 +++++++++--------
 drivers/mtd/spi-nor/micron-st.c  |  68 ++++++++----------
 drivers/mtd/spi-nor/spansion.c   |  75 +++++++++-----------
 drivers/mtd/spi-nor/sst.c        |  53 +++++++-------
 drivers/mtd/spi-nor/winbond.c    | 115 +++++++++++++++----------------
 drivers/mtd/spi-nor/xmc.c        |   8 +--
 11 files changed, 243 insertions(+), 277 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 656dd80a0be7..5788403757cb 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -161,47 +161,45 @@ static const struct spi_nor_fixups atmel_nor_global_protection_fixups = {
 static const struct flash_info atmel_nor_parts[] = {
 	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
 	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SECT_4K)
 		.fixups = &at25fs_nor_fixups },
 	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SECT_4K)
 		.fixups = &at25fs_nor_fixups },
 	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 };
 
 const struct spi_nor_manufacturer spi_nor_atmel = {
diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index 50a11053711f..0d070eca583e 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -11,24 +11,23 @@
 static const struct flash_info eon_nor_parts[] = {
 	/* EON -- en25xxx */
 	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64) },
 	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64) },
 	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128) },
 	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "en25q80a",   INFO(0x1c3014, 0, 64 * 1024,   16)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "en25qh16",   INFO(0x1c7015, 0, 64 * 1024,   32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64) },
 	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256) },
-	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512)
-		PARSE_SFDP },
+	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512) },
 	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 };
 
 const struct spi_nor_manufacturer spi_nor_eon = {
diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
index fcc3b0e7cda9..f86801a8697c 100644
--- a/drivers/mtd/spi-nor/esmt.c
+++ b/drivers/mtd/spi-nor/esmt.c
@@ -11,14 +11,12 @@
 static const struct flash_info esmt_nor_parts[] = {
 	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K) },
 	{ "f25l32qa-2s", INFO(0x8c4116, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SPI_NOR_HAS_LOCK | SECT_4K) },
 	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SPI_NOR_HAS_LOCK | SECT_4K) },
 };
 
 const struct spi_nor_manufacturer spi_nor_esmt = {
diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index d57ddaf1525b..8ae65fc92645 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -35,35 +35,34 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 
 static const struct flash_info gigadevice_nor_parts[] = {
 	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "gd25lq32", INFO(0xc86016, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "gd25lq128d", INFO(0xc86018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
-		PARSE_SFDP
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &gd25q256_fixups },
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 400e2b42f45a..3ea1f3c5949a 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -47,46 +47,44 @@ static const struct spi_nor_fixups pm25lv_nor_fixups = {
 static const struct flash_info issi_nor_parts[] = {
 	/* ISSI */
 	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,   8)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25lp016d", INFO(0x9d6015, 0, 64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25lp032",  INFO(0x9d6016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp064",  INFO(0x9d6017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512)
-		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp256", INFO(0x9d7019, 0, 0, 0)
-		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		FLAGS(SPI_NOR_QUAD_PP)
 		.fixups = &is25lp256_fixups },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SECT_4K)
 		.fixups = &pm25lv_nor_fixups
 	},
 	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SECT_4K)
 		.fixups = &pm25lv_nor_fixups
 	},
 	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 };
 
 static void issi_nor_default_init(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 04888258e891..7440a1eca55f 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -35,73 +35,72 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
 static const struct flash_info macronix_nor_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16) },
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP |
+		      SECT_4K) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "mx25r3235f",  INFO(0xc22816, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &mx25l25635_fixups },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SECT_4K)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
-		PARSE_SFDP
 		FLAGS(SPI_NOR_RWW) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512) },
 	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
-		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_QUAD_READ) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4b919756a205..8de3d1014129 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -160,14 +160,14 @@ static const struct spi_nor_fixups mt35xu512aba_fixups = {
 
 static const struct flash_info micron_nor_parts[] = {
 	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ |
-			   SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FLAGS(SECT_4K | SPI_NOR_OCTAL_READ |
+		      SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE)
 		MFR_FLAGS(USE_FSR)
 		.fixups = &mt35xu512aba_fixups
 	},
 	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
+		FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		MFR_FLAGS(USE_FSR)
 	},
@@ -175,90 +175,82 @@ static const struct flash_info micron_nor_parts[] = {
 
 static const struct flash_info st_nor_parts[] = {
 	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64)
-		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_QUAD_READ) },
 	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64)
-		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_QUAD_READ) },
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-		      SPI_NOR_BP3_SR_BIT6)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
+		      SPI_NOR_BP3_SR_BIT6 | SECT_4K | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-		      SPI_NOR_BP3_SR_BIT6)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
+		      SPI_NOR_BP3_SR_BIT6 | SECT_4K | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-		      SPI_NOR_BP3_SR_BIT6)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		      SPI_NOR_BP3_SR_BIT6 | SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-		      SPI_NOR_BP3_SR_BIT6)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
+		      SPI_NOR_BP3_SR_BIT6 | SECT_4K | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-		      SPI_NOR_BP3_SR_BIT6)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
+		      SPI_NOR_BP3_SR_BIT6 | SECT_4K | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-		      SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
+		      SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE | SECT_4K |
+		      SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048)
-		FLAGS(NO_CHIP_ERASE)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
+		FLAGS(NO_CHIP_ERASE | SECT_4K | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096)
-		FLAGS(NO_CHIP_ERASE)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
+		FLAGS(NO_CHIP_ERASE | SECT_4K | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096)
-		FLAGS(NO_CHIP_ERASE)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ)
+		FLAGS(NO_CHIP_ERASE | SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 
@@ -289,16 +281,16 @@ static const struct flash_info st_nor_parts[] = {
 	{ "m25pe20", INFO(0x208012,  0, 64 * 1024,  4) },
 	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16) },
 	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 
 	{ "m25px16",    INFO(0x207115,  0, 64 * 1024, 32)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "m25px32",    INFO(0x207116,  0, 64 * 1024, 64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "m25px64",    INFO(0x207117,  0, 64 * 1024, 128) },
 	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16) },
 };
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 36876aa849ed..74b5fb6303e2 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -702,55 +702,55 @@ static const struct flash_info spansion_nor_parts[] = {
 	 * for the chips listed here (without boot sectors).
 	 */
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 	},
 	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 	},
 	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
-		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		      SPI_NOR_SKIP_SFDP)
 		MFR_FLAGS(USE_CLSR)
 	},
 	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 	},
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 	},
 	{ "s25fs128s1", INFO6(0x012018, 0x4d0181, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25fs_s_nor_fixups, },
 	{ "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 	},
 	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 	},
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25fs_s_nor_fixups, },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 	},
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_CLSR)
 	},
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8) },
@@ -759,80 +759,69 @@ static const struct flash_info spansion_nor_parts[] = {
 	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64) },
 	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128) },
 	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "s25fs256t",  INFO6(0x342b19, 0x0f0890, 0, 0)
-		PARSE_SFDP
 		.fixups = &s25fs256t_fixups },
 	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
-		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
-		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 0, 0)
-		PARSE_SFDP
 		FLAGS(NO_CHIP_ERASE)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
-		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
-		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 0, 0)
-		PARSE_SFDP
 		FLAGS(NO_CHIP_ERASE)
 		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
-		PARSE_SFDP
 		.fixups = &s28hx_t_fixups,
 	},
 	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
-		PARSE_SFDP
 		.fixups = &s28hx_t_fixups,
 	},
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
-		PARSE_SFDP
 		.fixups = &s28hx_t_fixups,
 	},
 	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
-		PARSE_SFDP
 		.fixups = &s28hx_t_fixups,
 	},
 };
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 688eb20c763e..724229886218 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -61,59 +61,56 @@ static const struct spi_nor_fixups sst26vf_nor_fixups = {
 static const struct flash_info sst_nor_parts[] = {
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
 	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP |
-		      SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K) },
+		      SPI_NOR_SWP_IS_VOLATILE | SECT_4K) },
 	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SPI_NOR_HAS_LOCK | SECT_4K) },
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SPI_NOR_HAS_LOCK | SECT_4K) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K)
 		MFR_FLAGS(SST_WRITE) },
 	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE |
+		      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &sst26vf_nor_fixups },
 };
 
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 834d6ba5ce70..cdc04439f0d9 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -44,104 +44,101 @@ static const struct spi_nor_fixups w25q256_fixups = {
 static const struct flash_info winbond_nor_parts[] = {
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q16dw", INFO(0xef6015, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q16jv-im/jm", INFO(0xef7015, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024,  4)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		OTP_INFO(256, 3, 0x1000, 0x1000) },
 	{ "w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		OTP_INFO(256, 3, 0x1000, 0x1000) },
 	{ "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25q128jwm", INFO(0xef8018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25q256jwm", INFO(0xef8019, 0, 64 * 1024, 512)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25q64jvm", INFO(0xef7017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25q128jv", INFO(0xef7018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+		      SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SECT_4K) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &w25q256_fixups },
-	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
-		PARSE_SFDP },
+	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512) },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
-			      SPI_NOR_DUAL_READ) },
+		FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
+		      SPI_NOR_DUAL_READ) },
 	{ "w25q512nwq", INFO(0xef6020, 0, 0, 0)
-		PARSE_SFDP
 		OTP_INFO(256, 3, 0x1000, 0x1000) },
 	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
-		PARSE_SFDP
 		OTP_INFO(256, 3, 0x1000, 0x1000) },
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 };
 
 /**
diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 051411e86339..10be9d6b2f20 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -11,11 +11,11 @@
 static const struct flash_info xmc_nor_parts[] = {
 	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
 	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+		      SPI_NOR_QUAD_READ) },
 };
 
 const struct spi_nor_manufacturer spi_nor_xmc = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
