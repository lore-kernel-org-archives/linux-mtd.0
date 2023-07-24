Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A4CC001DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=605nNIJOwiuIbJT3PFtfy0oVWQ6yynDuSBcPbbV2eqk=; b=vhIOUCLRFHjxJ5
	Zt9WgD1LLkC6LvR3gSxKaOUjuMmjzlrUKcSrttWpK/kYyFZDc9CjdOVkVl1SmnRSsX9aEL7yWKk5g
	GyYWz/wBNVJPvzC1JQ5pzF/ZO9HJaOKBNIjGoIu2Uc/B5IlrxPU+bwdu7LgwdWc/aSyrWLqqEKWcp
	xACmeZW9UIA0Dcgj3swe/YEMO+xCuPMeaifuKagpeNeYy4rfL+1+VCUAl7Nsy6rJqrShET7DMitoF
	qnz+W8gzrkQIoHWhjvA030lbNdX2qMtTL6X2qDBj1AxKM4ZAc5XrJ1PeckBlLqHCk/OjtoJzbGAcr
	KiBuKAdFcMv17wI0uT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqh2-003CY8-0N;
	Mon, 24 Jul 2023 08:13:24 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgw-003CUB-27
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:22 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99357737980so693689566b.2
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186397; x=1690791197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lvn9Ytvulvk1EXRz+zaqNbSkQ8OMJCRDUn6E/2+cB9o=;
        b=tV+QpqasoevnXMwEWXs3J6oR6XwrLiFCZZUpCf37Act6PRhdldtR3xB1mvxG3yUo36
         6ZzWaOXPxHWUkQhRjvLfKg5bQxoj1cEI0DkS0WoTw6c9CeDVz+3JsULY2iP3pt031EDq
         VT5STqpGNF3ik586JBJNeD0psTuWWVaA94cLOPZ7u0KVIjAihueT8HMuZUGHE0ltAvP9
         Mzo+ELsnPSM7Hztq8GFNJmbTj0qNb5nmAJEC4h2KqA/Fb29NaKLPKF8hImenn/BP5+Sv
         5KIO/CmhXUiWeY4CCXGSuSdtLW3OzshDmtf8OxA2JIJiUNrKGQ6Dj0By0TxbmXxdMvil
         8I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186397; x=1690791197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lvn9Ytvulvk1EXRz+zaqNbSkQ8OMJCRDUn6E/2+cB9o=;
        b=UeYoQM0HUa8UZBqeP9S3SUgJK1DegnY3hjcgYry2qpz23F4GYN7yRyEnfBUuGx9Isd
         QjzoVya//aub6MhWimC7APjAZaa/ue6QZXKPpdtRflOo5SFbtDwFLTwbEDB5EJang1wc
         0TzuvxWZ8VqRmWktDyCaYP5Up+PlHOwEIYcD7wHZ8NbTRtvQ61o3VGMyxXncUc7vqw+R
         NEg4LFuMg3k/sXNKa09H4N05xRdxrj1jPiPAueS36zmFu+a8XrLOsEgmkx6U8uMeA80/
         4RcOUEmA8O9VUCJIpT7ASEkOZDWVnu0xCZI4w/9wVCJEHx3kZUwh1UX2FIKQxYjQKdTv
         cBgA==
X-Gm-Message-State: ABy/qLbcyr8BmSFxT7D2n0m7z9hu3PLue4jFGN8sozu785OIgl1MaZe9
	e4tNEm/+Ani142s6p41Opkqlaw==
X-Google-Smtp-Source: APBJJlEezsECpGZwPWX72NBkdrzZ1Q0LndDTGl9NGNm9L8lP1tvSxGyJHOB5WF+b5Q0Ee4CZazYP/g==
X-Received: by 2002:a17:906:18c:b0:98d:e696:de4f with SMTP id 12-20020a170906018c00b0098de696de4fmr10641335ejb.26.1690186397359;
        Mon, 24 Jul 2023 01:13:17 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:13:16 -0700 (PDT)
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
Subject: [RESEND PATCH v3 09/11] mtd: spi-nor: spansion: let SFDP determine the flash and sector size
Date: Mon, 24 Jul 2023 11:12:45 +0300
Message-Id: <20230724081247.4779-10-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622; i=tudor.ambarus@linaro.org; h=from:subject; bh=pCpO/9Mvf8zp3/Qd2t0AYPeMg7+RmKPsnX2goFSGCbY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ+eWNAnfU88wBv7B1V3EOb+sqK02NWWJWNR Vt28fFlzHOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfgAKCRBLVU9HpY0U 6VS0CACVIspLQT7Pfz+tb0BedC8TvEfvu5UqqCJxPkdVQQ1hs4TLyHj/+48cTmZgRS/qWXF2VDa NEpcR8hEZ4s6/a9allG6epnM+1zitmkB9O3DNZ+u1HvK5d1xGlYw5ahwQ+75Fd789+NVIchhexD Xtnvtft12qJ1r3Yx9DIg55fqI5WKDsbxuIEZHLIMnpr6kfW6tgdO0lN9iD6LJ1kqROVxahwy8bb MREsBmYkeOxGZSdXwHAXvaBhgsIdYMrWtXjfyREyFZWdGf/JxZOPP+B4aEDeft1sIMjyMzh+S9q 0i/McXURNzlBxhjhkict7cxCcYIM8Ci9hsLLNDR8wYC6vA7t
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011318_702413_C0751773 
X-CRM114-Status: GOOD (  11.38  )
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
