Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5491AC48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PxrTE5fmEg6SDxFoT/dMESZsC33/NRltE8fTtXFAOg=; b=cIdi3Pumbfebb8
	L+pmPu5b2HT5KSMEqUuhwBDFZtgMOvNH8tUnRjPgWs5dy9tQ+A1/hLOZ9DN8nfd7Wmiv3saJ92s7A
	CeqQtbd1lrU6DfE1hOl5PPHl5KPH2MiBNXEKxEdWYiHCk3QmRvKLtxTQmm0qxZGWZ05WIbSCGjHCi
	iOmhB16wLxrWF6yyddgTb1t0LKi+YYG00TBc/YHqGCityzu6rLzr/UV4bcneLozZg5COGgzxbntFe
	GRNGCurPVnytDz8zgm4cPQ+QrvovrQJtjADnbX1uxIqlob+cJtAvJF1vzZw5Yr2OA6R91HKAR61TW
	5Iup6nFwxUPBITUWtECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLaI-0000000Dk4s-28Tp;
	Tue, 20 Feb 2024 08:34:38 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLaF-0000000Dk1t-1imK
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 08:34:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e47c503fb5so236800b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 00:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708418074; x=1709022874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEBbtN49KtsL7jFR1er0xAilkk80hBThV1SlWq40Aps=;
        b=XsAClwX0WRJwkxBHyt7YpDuni5ehjfnWOkkl78ioVyR2xpYiL6gq7jEaUfaHGvGCA+
         iLY7ugIGZxxMwLKEc3SO81wGuqC92xqT78wbpaLX+U/TaVY3Do8IHIpfak9CbOsg8ykT
         FQDrAhC9VZbBo0RvEtrGFpNEVa+UR6Z2gFGf4Z6aY6jp03Pd/aia/KniXNYfZn3lXCCO
         tHA44irG3rGnkAqhxPSxXr7lMjCBcaw60gzFIMEGZsqWHsHFCkd4cYEnEevnlmJ0cceM
         toyDnRkrz38Gq/Bkt4Hzq5tbAx6rfCm4ZEojvlrbBEo3mSNsiZ9y4qofZuFjP85FXLvT
         C20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708418074; x=1709022874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEBbtN49KtsL7jFR1er0xAilkk80hBThV1SlWq40Aps=;
        b=mjvsapnlIE8o1VtJTB3Oh+ahWQKnpWm0W7Wro3cErRf6vhCrdtmnwBNGP9ZePDWkI1
         DrqYZzHZ+h3EQo7kyLhPF+1CDptnR36YlQS0/VW7xRz3RPGREpBcBsZ6tDsYioXFYqvg
         oURuvsv+16rIl7FLq42fmcCsD8Mjdg8/aPArbVQ0Q+MjaePegujjnGedITBKD62SI8YT
         Lyjtyt42tzIsx/t23zcNPP3bvJQm80Jkdwc+b/skqbd320Fuy0h3owAlqkwsoqcDKNmc
         KnsB8vhwoIwtlpSSNvHHtNGxiAO+8/RWOQxGn95uzl5sSaBM4NvxRW77U4c9HU3yKe1B
         ZCZw==
X-Gm-Message-State: AOJu0Yzj90WzrzuZJZEi3fyrQLdR/13ABlkoth3tn5u2aNX1RsryTMnx
	dpEzB4yvtorCpnxPEzn1bUEJsbxyg3TZ2whdpvjf4TzoUC85lWBioGpHJE//
X-Google-Smtp-Source: AGHT+IG7FQSXMdKvzyi/wZ4PzlLIaBi3/MDmBhLf0/rREopA/Z1JVlN4VMxmIaQz5D7vJfLUUgsDWA==
X-Received: by 2002:a05:6a20:939b:b0:19e:a9e6:bfa with SMTP id x27-20020a056a20939b00b0019ea9e60bfamr20134770pzh.0.1708418074292;
        Tue, 20 Feb 2024 00:34:34 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id lo5-20020a170903434500b001db715d3bf2sm5655655plb.137.2024.02.20.00.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 00:34:33 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 4/4] mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map
Date: Tue, 20 Feb 2024 17:34:09 +0900
Message-Id: <35d0962986e493b06c13bdf7ada8130a9966dc02.1708404584.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_003435_508802_E28229B3 
X-CRM114-Status: GOOD (  18.16  )
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

Some of Infineon SPI NOR flash devices support hybrid sector layout that
overlays 4KB sectors on a 256KB sector and SPI NOR framework recognizes
that by parsing SMPT and construct params->erase_map. The hybrid sector
layout is similar to CFI flash devices that have small sectors on top
and/or bottom address. In case of CFI flash devices, the erase map
information is parsed through CFI table and populated into
mtd->eraseregions so that users can create MTD partitions that aligned
with small sector boundaries. This patch provides the same capability to
SPI NOR flash devices that have non-uniform erase map.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 58 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 21775d5eccd5..5ba570248cb9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3349,7 +3349,54 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	return info;
 }
 
-static void spi_nor_set_mtd_info(struct spi_nor *nor)
+static u32
+spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
+			     const struct spi_nor_erase_type *erase_type)
+{
+	u8 i;
+
+	if (region->overlaid)
+		return region->size;
+
+	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
+		if (region->erase_mask & BIT(i))
+			return erase_type[i].size;
+	}
+
+	return 0;
+}
+
+static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
+{
+	const struct spi_nor_erase_map *map = &nor->params->erase_map;
+	const struct spi_nor_erase_region *region = map->regions;
+	struct mtd_erase_region_info *mtd_region;
+	struct mtd_info *mtd = &nor->mtd;
+	u32 erasesize, i;
+
+	mtd_region = devm_kcalloc(nor->dev, map->n_regions, sizeof(*mtd_region),
+				  GFP_KERNEL);
+	if (!mtd_region)
+		return -ENOMEM;
+
+	for (i = 0; i < map->n_regions; i++) {
+		erasesize = spi_nor_get_region_erasesize(&region[i],
+							 map->erase_type);
+		if (!erasesize)
+			return -EINVAL;
+
+		mtd_region[i].erasesize = erasesize;
+		mtd_region[i].numblocks = div64_ul(region[i].size, erasesize);
+		mtd_region[i].offset = region[i].offset;
+	}
+
+	mtd->numeraseregions = map->n_regions;
+	mtd->eraseregions = mtd_region;
+
+	return 0;
+}
+
+static int spi_nor_set_mtd_info(struct spi_nor *nor)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	struct device *dev = nor->dev;
@@ -3380,6 +3427,11 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 	mtd->_resume = spi_nor_resume;
 	mtd->_get_device = spi_nor_get_device;
 	mtd->_put_device = spi_nor_put_device;
+
+	if (!spi_nor_has_uniform_erase(nor))
+		return spi_nor_set_mtd_eraseregions(nor);
+
+	return 0;
 }
 
 static int spi_nor_hw_reset(struct spi_nor *nor)
@@ -3472,7 +3524,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return ret;
 
 	/* No mtd_info fields should be used up to this point. */
-	spi_nor_set_mtd_info(nor);
+	ret = spi_nor_set_mtd_info(nor);
+	if (ret)
+		return ret;
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
