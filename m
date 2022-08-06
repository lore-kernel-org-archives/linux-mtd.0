Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEB6C19F29
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 06:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmK0zGdmYPGtdfwYku2OF98HaRhwJC8y7Fm1IkgotEI=; b=DptoCAh0FUBwZk
	MfZt/26stxws79Yfil9NCAeYMdxPtwnsgWAwUHUxkgK8f4NKrT2ETYw7ATcpynx7i1UfVI9DMOMK8
	txcr2BuCSEosdPQ4X4+kBfiVqXdQCCTD0Nu59Pvv//6aoH2WWTX9Buw33NCU6N8Z3L9B/AWGqod//
	yG6UX/f1amv4hH8Vi5iLe3o17ZuYCFBaqoSl8K2jFYFcjvuYFZ0iFM8DgbsfTpICT++pRBOk4CiG5
	n6p/fQ+u2mr2oyLaGcAOaSYQUOCoZeHzhb6qhPLrBJG+hcyQJ/qgwI+Wqm3ZEjBABG4zusNZJegbl
	rkqRqLSF12W2kJGSyGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPj-004nyX-1c; Sat, 06 Aug 2022 06:35:59 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPS-004nXV-Am
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 06:35:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso10067978pjo.1
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=g5jLftlnBAcQ5XkK8r4pDhyezZZLH+TDOIRS4nWRnGA=;
        b=oAfYfGK3VhavDNY7r5sqdE4sBuhC/JoCubeQG+IWwf8qvpYR3N4M7AjjVOWtl8G8Zn
         cgpt2R0S9TpKFxZMnEDZ5OeLl7BnrcEnJgO0WuskpkwM4uk8sWWBeTuKR0FmCPGzfjOo
         wzPGjv4jS6nC6EUg/vositj29wRVQ5xuVx3kNpI7VaK84YGj4KGHFRG8Bw2HrZd+pGqG
         6UVMuksJXxCBxsJoGbVZJxOeizLRso/s53azpnnDAcRcAS5xLNQFI1eaPzoHcD/7RtTC
         J4TyiHAdPCUiC2oFWyO7O0jdVgYvYPlmUgZq1JZ7eqtFYluYGnqWyoHHWoPgbBzLrHZl
         fAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=g5jLftlnBAcQ5XkK8r4pDhyezZZLH+TDOIRS4nWRnGA=;
        b=QUljTGmfjqt33ny4l+F32iQjEMBQ8YiUyKMh2v9yBYPzXbFKLTrujDiAU/65r14gSl
         3G8guJf/nGBPFNoFNmajWoiJ1qQjPTwvIf+WZbctbfGzQioTD3AiuEsQ+UwMkbdhPrhI
         /VPw/JAnlGVh+dN9vd1m5DgdYbv1WCSIXLpY1D1pWnVLcoLhiMXYk/TL+ZDojVZj8X99
         COVDr5K82bmKjndg7UlLYVe6Hv7F/EMgOW245Xo4lhyJDj4rnNLqomG18up2dx/VloMY
         lSux2GBdTGqnBIx43eqrMaBlzac8mOCmYTWiQjFJu3pc1eYxCcRZEQKus0JYKhTbQk6z
         blbA==
X-Gm-Message-State: ACgBeo2iQsiI98MCADa0VwauMFDrEBwItoFlgy3u5qQ5ALZ19DZ+h0ud
	RUquE2PSdV4bB8WurprI08Wb/ATku1gU7A==
X-Google-Smtp-Source: AA6agR7dp0scGMo7zAiMeOFbnBTgPku50MtNm+3/DSQOcGr98oXmqec+rhAcAVH86WRn0kJcRvAwwg==
X-Received: by 2002:a17:90a:ead3:b0:1f3:366d:5005 with SMTP id ev19-20020a17090aead300b001f3366d5005mr19837778pjb.1.1659767740836;
        Fri, 05 Aug 2022 23:35:40 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a18-20020a63e852000000b0041b67615584sm2418452pgk.68.2022.08.05.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:35:40 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Date: Sat,  6 Aug 2022 15:34:26 +0900
Message-Id: <e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_233542_414683_AFB83A1A 
X-CRM114-Status: GOOD (  11.78  )
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
 drivers/mtd/spi-nor/spansion.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 22b0be5d312b..11f0bb509900 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -325,6 +325,10 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 		}
 	}
 
+	/* Fix the number of dice that is wrongly advertised in 2Gb parts. */
+	if (nor->params->size == SZ_256M)
+		nor->params->num_of_dice = 2;
+
 	cypress_nor_set_page_size(nor);
 }
 
@@ -526,6 +530,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
+	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 256 * 1024, 1024)
+		PARSE_SFDP
+		FLAGS(NO_CHIP_ERASE)
+		MFR_FLAGS(DEF_4BAM)
+		.fixups = &s25hx_t_fixups },
 	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
@@ -534,6 +543,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
+	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 256 * 1024, 1024)
+		PARSE_SFDP
+		FLAGS(NO_CHIP_ERASE)
+		MFR_FLAGS(DEF_4BAM)
+		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
