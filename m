Return-Path: <SRS0=/HUW=DJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A844C4727D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:19:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B665720796
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OSvZjkOr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLShlvS+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B665720796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O7SLidEGGEq4AdMHs2DIXMtBgSZH/9ejkn/ooNj5yN8=; b=OSvZjkOrngvvbxKIvDGeZLzr4
	UTWg9icany7HpgVclvGqwuzJJzImatO56qSNCelkxNTusq57l6gXwZSElNesVSUjGW2XjksOGhVTG
	aTNhe58/x+IqVc9EpJXGNHioTKW7ZH9koRtVG2eqcLwgI+qdoOK4O66lbnno7nNFP0S3cmo8MHni7
	0h8u3OAWPz018wIlmi2AckRFJHkH6SgNnUmaFGg26S1zzxjLJQvToC1yjB2UOl1m9O2PA7Yj71MiT
	OvY3ZwXH1VumAvHL5WXHJc1povn8zUyrOo8v8xAU2VbsYIFKaf2gqjfU9Io41EdU5ah65cFvT4ZSW
	3L7yfii6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kODTG-0004tv-Vr; Fri, 02 Oct 2020 05:19:07 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kODTA-0004sE-GH
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 05:19:01 +0000
Received: by mail-pj1-x1044.google.com with SMTP id gm14so160566pjb.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2020 22:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HcdfD+3G6i2Nn3pnvpvhJOBERjsUyElCovYHZc+JsM=;
 b=RLShlvS+7TplmZJyUK+nf897sSUuLXH05F4njt+JozeaAen81gvwYA2hF/K4E6eMsU
 d/tHhxI9smuCY2WPKgsv4GwejnP1ETVGwWsnxK0+bCbkHrTJcZH4Gv637plhYu+y2mrJ
 wggyzO7VOPAyZZvNu0161xx2OXrcEkwnmNVauu3EM145FxPeHtrSalEH2JRTjYJ0ClhC
 BU+3kTSBGFnpXyqCMeAXCDLadP/XMaaDXDvOXVX2BJfkXcwaJTfV6ORYV8N9W+BMUVui
 0+SwONMT2YaRwczE4Eca84yLBuO8SWdhneV8ilIP8aoEUfSV3KdRUUfaQGSWf12JtbO3
 B72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HcdfD+3G6i2Nn3pnvpvhJOBERjsUyElCovYHZc+JsM=;
 b=W83ujeBMp9kaeb79HE2kUtr0kDjAri80Pk3VmE7LuP6Zg6fIuBUcKqaEgqKZjpqJEn
 wCqqJYtFeBBkQPc6MK2EFQ4nsaB3kdCt82G22eiNQunY0QzuTjTWIh1hudiZl1lG8q7h
 qQujcuBm48PxY9WairCBrb3uT0BkkkAGytoUE630zb/70pVJu+DB7DN0aW2+MzuNYYXm
 ZcCCq4duLIbtdc/h9LVuv6dmAJ3VEYfcLQkAhq2lQFlyG0p5MrB6wWGOjfI1ZCZmdczP
 eUk+1Nt3pVbZvW1lP4UH7lo5ymtIaUPFrjBqiRvtjhEZkXA4cr7rohuWwGI0IRe7VmgG
 xClw==
X-Gm-Message-State: AOAM532YDEu1seNUn+Ct4vfyZkIOJX0t2cxVZpLhCiOOH6DNBEyatlp2
 CFoooalZRoccywzAtU/YzYIPnfMNyTPCew==
X-Google-Smtp-Source: ABdhPJw5NGSGEjDKKBehS96FNR52sx5YNu1jWXsomaEXL1EjBxlsriXbmWKVCbOsTA99/P1GCe9b9A==
X-Received: by 2002:a17:90a:ea0a:: with SMTP id
 w10mr841926pjy.165.1601615938316; 
 Thu, 01 Oct 2020 22:18:58 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id s66sm380773pfc.159.2020.10.01.22.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 22:18:57 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] mtd: spi-nor: sfdp: Fix last erase region marking
Date: Fri,  2 Oct 2020 14:18:00 +0900
Message-Id: <02ce8d84b7989ebee33382f6494df53778dd508e.1601612872.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
References: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_011900_575408_733BC187 
X-CRM114-Status: GOOD (  12.35  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Bacem.Daassi@infineon.com, tkuw584924@gmail.com, miquel.raynal@bootlin.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The place of spi_nor_region_mark_end() must be moved, because 'i' is
re-used for the index of erase[].

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 5332345b3cb8..08de2a2b4452 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -830,6 +830,7 @@ spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
 		offset = (region[i].offset & ~SNOR_ERASE_FLAGS_MASK) +
 			 region[i].size;
 	}
+	spi_nor_region_mark_end(&region[i - 1]);
 
 	save_uniform_erase_type = map->uniform_erase_type;
 	map->uniform_erase_type = spi_nor_sort_erase_mask(map,
@@ -853,8 +854,6 @@ spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
 		if (!(regions_erase_type & BIT(erase[i].idx)))
 			spi_nor_set_erase_type(&erase[i], 0, 0xFF);
 
-	spi_nor_region_mark_end(&region[i - 1]);
-
 	return 0;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
