Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F63EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=605nNIJOwiuIbJT3PFtfy0oVWQ6yynDuSBcPbbV2eqk=; b=1IGUyJviYcECuN
	mJl/CiMVWSJfWEr0TrlRBP1nDcq+iDOJIYyvgi1s5f0SmZpYcdLu6kxE3xZp+enTwb9AQVZfb102T
	287VhdXQvPMMzgdUV5jpRqm4Qpu1SPkS8zeGR0N9diVBjc6T5AH75omIYtDXV1YwF+OvcpmncWHuq
	xD8dWAoehMGrdeYh/r+gdfdcUACLlqkhXu4fnmWUjUAZQZlEIq3CDTvuUf2TFWu/WwI/h19Fhby3n
	RQVW6juRvnTT9RPv29VeWRo9nj3xb9xsxx3oq82zmatkBDLn8Id02pTdeGUFIHCnyxsIKLK5awClm
	rgve37AM8304ocLWt5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AV-00GAKz-1o;
	Sat, 22 Jul 2023 08:40:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AR-00GAHY-2d
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:40:49 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991f956fb5aso392531766b.0
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015246; x=1690620046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lvn9Ytvulvk1EXRz+zaqNbSkQ8OMJCRDUn6E/2+cB9o=;
        b=JvyIpUbRriH53rBnHb+D4GMGWApKPp7W2T+v9Gj4FL8LdjA7G4SEHovww6d5KUZYmF
         WayKaYuv0/v+7RF/LKrq6c6Ba+z5aRkAKrNUR5qcpNOJS1UAg42KzlMfL9jWoDqbnYIB
         xamHmfKyoTPL52HY0Dzozxy8mV9sj52yKEov0CcRFbjDtc20ROjMx/k2zdg2GV/4iSSJ
         o+Mu94KJkVsvSK8r+bNQmJdsKAU6gqZdiJfLfkeUnZPa/VEL4cIF6KOHTl8hSC5gVMb3
         OW78ne7O9qbNDOjE1BMquBdcqkfHoje83bxhCn5MLTxREVccqtcg+Mx2lZcCgPR4vJ5B
         eALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015246; x=1690620046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lvn9Ytvulvk1EXRz+zaqNbSkQ8OMJCRDUn6E/2+cB9o=;
        b=YmL/LbyZeMcHL5/P1q6p+u0scbNq/LP38f/+Qc3d1KYPP9fXe/3HEgDyRkamXhWb/h
         1TYIwnSfVAtPfotFB2rdt0yOR2ZeJHTg18UbukyxL8kTgGBTjlnKWAMAGHRiGB+CEpit
         wvyME8MK0ukBdOwWRk+7W+IlqkFeB21qWUzAYXGGN+WA69bEnl1HM3AMuXgXcxIe4YDw
         U+85HTi6+8cJ0SvJPcDk8hUNVxDqw2HCLGUEa1hFTK9Sfa7MZ03rFo6wkoB6K2S8U53t
         7DpZUj/Deid5aS8WQoblYYlO96s3nLvaAcSKuV2GHQg0blAVWjHY6XjyUGqOUpjeEOmy
         v+Pw==
X-Gm-Message-State: ABy/qLaupTCoAXmJV+LKosGUCLjAk/bG30/k8I2t5KxH4QsVIZQ2r9x+
	YgEyB7s7SkjqqXLx9kT5Ukm+PA==
X-Google-Smtp-Source: APBJJlGl6EjDbkneYdKpnDzWuAw5K6TChqXcbOojaV58BqH8fHLCg8p8f+yt1ZNxyqieV/MeIpkc9w==
X-Received: by 2002:a17:906:106:b0:967:21:5887 with SMTP id 6-20020a170906010600b0096700215887mr4274950eje.40.1690015246644;
        Sat, 22 Jul 2023 01:40:46 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3253861ejb.84.2023.07.22.01.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:40:44 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 09/11] mtd: spi-nor: spansion: let SFDP determine the flash and sector size
Date: Sat, 22 Jul 2023 11:40:04 +0300
Message-Id: <20230722084004.21857-10-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722084004.21857-1-tudor.ambarus@linaro.org>
References: <20230722084004.21857-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622; i=tudor.ambarus@linaro.org; h=from:subject; bh=pCpO/9Mvf8zp3/Qd2t0AYPeMg7+RmKPsnX2goFSGCbY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5XkeWNAnfU88wBv7B1V3EOb+sqK02NWWJWNR Vt28fFlzHOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuV5AAKCRBLVU9HpY0U 6fE7CACuHWnWOHXIyNeAknfgmnFAmppW2v9PJmHQOq4s4RaEvFhpT2Ou1oz1BrPmzPKg9FeriFA zPLaIqRMZ+4G0p3F4grvhenVKCHemrvnM73xQBW/L5iaLBx7dlYU4WuHQKEbQJxxnt6lWaMjllq IS75fAv+sijTrGQjRVmQHczQSH03JZq5AqmGdtfAEGtrUcNzvOsZgITC8J8e7xxpnn31xnFMJrN p5XzifBJOvsIS1aQQNqNJivIFlBywEgTTIXzffqkBmrybmF4bzhUW1WaJZMZpgYiKVk6nPtivnk Y2hQEYdcV3gMI4a8hkt6LP22oyyF/MjdyGQk+kly/pozAlcn
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_014047_857981_32275D9C 
X-CRM114-Status: GOOD (  10.83  )
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

sector_size is used to determine the flash size and the erase size in
case of uniform erase. n_sectors is used to determine the flash_size.
But the flash size and the erase sizes are determined when parsing SFDP,
let SFDP determine them.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 1f2b4a469719..413573cdb4fc 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -875,11 +875,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25fs256t_fixups },
-	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
-	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
@@ -888,11 +888,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		MFR_FLAGS(USE_CLPEF)
 		FLAGS(NO_CHIP_ERASE)
 		.fixups = &s25hx_t_fixups },
-	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
-	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
@@ -903,22 +903,22 @@ static const struct flash_info spansion_nor_parts[] = {
 		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
-	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
+	{ "s28hl512t",   INFO(0x345a1a,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
-	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
+	{ "s28hl01gt",   INFO(0x345a1b,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
-	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
+	{ "s28hs512t",   INFO(0x345b1a,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
-	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
+	{ "s28hs01gt",   INFO(0x345b1b,      0, 0, 0)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
