Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8458C77B6E
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEDsobKtN1ueBJP9+yI8TfgoSBuksAhHJfeIrnobEx4=; b=LlR1P2MfGiZOEA
	2iDLFpbFy6WtsFmtp2Bmpsfh1wluWE9Hd17o93bGGl3YSSl2SolAU6nFP9pKcenY9XY75tgjhWv0M
	DenrICSVDf5R0aV7yzPmjejs9gIpvtLkxGqME7po9FgJ/gZIsTf/Lr5HP6uuqbr491QfaoZa/yZvE
	LnDltO8tNPDNAaK0gUihXuBfDkF9tEakU5/ASsv9Cctx05WGGQBsyvXzV+Q0bCqTvcCMjmvSLEr8G
	XPeYplMa62OTqTg4YwqrmsWB5UfTybl9jwkw2oLl+KbU+roGPXBVgRKMXvT9BFFuwOzqQxmfe1n3Q
	AWkG6DQYt8Sjxwoq6VPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIyY-006TMl-1P;
	Thu, 06 Apr 2023 06:20:02 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIyT-006TH1-0H
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:20:00 +0000
Received: by mail-pg1-x530.google.com with SMTP id d22so23143301pgw.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvgjszv7qkNvEncCzwl0KVYudw8TWRShvYmCZby+Eo0=;
        b=DNgX+45qgPpyFmgmWDWWlb8zbXvkDkR/eL1iBbIXA4sLZPAdz3ko5wWlhCJNqQNWQr
         Duhb4M6lYW5MbmnBtK0ISNBIyGcGhpYcBdd2ptlEZjfy453zD4bcdHisrKxx/FarcZol
         k3qszg28fldSr4khYc4/mNEmoZXoEWl9TKvLawGMzk56iRchkH1i5e+DLKhzpOs0NAuI
         ymfxzmZEPF7Q1jKlUMQ5yHhqVduBd0aknv520UlMygju9Fo2jw9cpQSiAlKJpJKh+yhN
         8jvI/Ur/RGs3UfdUrW3oYQ5VdoRO9HsL0DfmGwyTlppF8Frq8W3/1sZvrUf7uv+Zit2P
         7xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvgjszv7qkNvEncCzwl0KVYudw8TWRShvYmCZby+Eo0=;
        b=wPtuPrSJTbaqnI01udctVYDR4V+hQ45IukBxxU5aAbkZgNpYFybSzpFrsDuzMUmVe8
         ONjIwiALVvis6/hbb7fn+KpTQpBXHh6bfLaM91fV+03om9G9cU6CqJmgaju5fuXM4pem
         FJCIXezGn/JWI85086GTBhd0Qyq3u1diWLsILlcFvfXG1HXaAqfPdW5dlTiOMFswvWKW
         07khAz+9YNpZJtNK70fDdICXQM2UVsCjViTPZTeOvGqsbhfcicQR/yVPXoKfa1w+eTap
         UK3uK8iIhrKgYVTLzAXEmsrDFoaS0z1tXk8L+Sd/jsKdicdEgjn5KyrjuK8ckj+AZ0iT
         mBSQ==
X-Gm-Message-State: AAQBX9cauAdJEZ7CuoZtodV59cxWK+OPEl2Tv7PH9pGPx+K0BaUyk9Mk
	Pm5oO3k3x7580uKN9HTU+T3TUjZce+j/xg==
X-Google-Smtp-Source: AKy350bG6uysMzRioeTbzt3vOsUAuX79ySBIPkcxuSFKl4EQHgAqSbmGpv4eINRY1QVej5e2n2tDqg==
X-Received: by 2002:a62:1c0a:0:b0:625:cf03:e8cb with SMTP id c10-20020a621c0a000000b00625cf03e8cbmr5595358pfc.4.1680761993968;
        Wed, 05 Apr 2023 23:19:53 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id 18-20020aa79152000000b0062dbafd2980sm450542pfi.65.2023.04.05.23.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:19:53 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 8/8] mtd: spi-nor: spansion: Add support for Infineon
Date: Thu,  6 Apr 2023 15:18:59 +0900
Message-Id: <6b55d2284b55c6de88e5722bb756fad85487d3db.1680749578.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231957_139116_DFA044FA 
X-CRM114-Status: GOOD (  12.77  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

s25hl02gt and s25hs02gt

Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
These parts are
  - Dual-die package parts
  - Not support chip erase
  - 4-byte addressing mode by default
  - Wrong param in SCCR map that needs to be fixed

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index deb93ab6fe98..15f9a80c10b9 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -579,6 +579,10 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 		}
 	}
 
+	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
+	if (nor->params->size == SZ_256M)
+		nor->params->n_dice = 2;
+
 	return cypress_nor_get_page_size(nor);
 }
 
@@ -797,6 +801,10 @@ static const struct flash_info spansion_nor_parts[] = {
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
+	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 0, 0)
+		PARSE_SFDP
+		FLAGS(NO_CHIP_ERASE)
+		.fixups = &s25hx_t_fixups },
 	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
@@ -805,6 +813,10 @@ static const struct flash_info spansion_nor_parts[] = {
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
+	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 0, 0)
+		PARSE_SFDP
+		FLAGS(NO_CHIP_ERASE)
+		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
