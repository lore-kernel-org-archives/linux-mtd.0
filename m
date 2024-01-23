Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B31C47258
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYHV9BCsBodDD5Rf09ssyBhwywOzY2rm+ElnpDvm1kc=; b=TlZNt1ejKa4daB
	kEojRjP7i5tKZx4e6rJMnrNgRuxePUUIHIsViD9Ba4E7F7nYQd48n9r5BL1nflve/LCWnXy1mEU+t
	qHISuCOUjC7tzXZHViBvxElRFMtvyIXcDPa+78SP0rgTOrsxNHJba/k1a08TdguRo0u7w+2hDvEah
	qb5/6fWCmPgiKwVP8Q2meSxVYc8fuIrtccF11f5tsaVRGyyxiHWuxd1fLx7BRCyJBvmysotQoMlMt
	KlYvfY/mPG9eIAvVu7HvyVF5lN2WBA9UBByZUWq9xSr3Q2YwOVLDKv6UTDscFYJYRQUT+CLYxc8+J
	NLGqvK8Huc0xOPeq2N/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSBui-00FV1C-2s;
	Tue, 23 Jan 2024 08:13:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSBuf-00FV02-1w
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 08:13:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d73066880eso21080105ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 00:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705997621; x=1706602421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huqmuMOV9ToQjkR+uHQyp8lt/6O0FZ4OLFmIH02E+D0=;
        b=TnQtZ15Q/BnvSaw1cG60Y7i/tITwrlaDvM74nQRdetiqECfud/4ACgPjPmS4a/ctNF
         j/0CeLaa8N9YcmQqcN/Cc9xG6gGaU6gkpBDaMFOgmJqxMEEF+Xno6RatWL1u8e2IVm3J
         /zo8aT/YnGzrdtGWPursr5x7GydTs4XS0rRtvpZmdlgW5siaTWlFlr+GqNhxN8/EgXLM
         bhsTtm3nbJ2mO+hsSqbpmytpSQCQsnC4ZNqfbv8XTcNFLyZA/te+h466toLBrpnJALSB
         cYFeHiibsmBl634nC5Ry5j3YhXapT0RYIhWqjtRufFWeMNLwZ9HfcDzWQpqOQ8UghuZ8
         RPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705997621; x=1706602421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huqmuMOV9ToQjkR+uHQyp8lt/6O0FZ4OLFmIH02E+D0=;
        b=pCmLL2ELqmbtEzG6ABda/9hO13kJ+4muNBRALBK1u9nWm664gtdZjXcYgWbuC6NNwV
         81OBBTMH64kr1p44ktOCZdpWjJHUXmKp3qLD8yYYThwlRqJDFl1PyCYMjkGU3jT91s8j
         H20JLTVHHcUGSucVfw7530odZ6ozwPBHy8S8pLCAi6nv2yTIWYYFdMMu8NgNeDQw8io4
         lHMOqOPDC/bHvGeBWpePoFkViRyz5tmbOuJpJEiWf1VRbo41/aGQNxaCNRKfwlAvJxGB
         GbFfhEgs1G3ty+ZCkeyoSFPh+Px/lfLopKT3nL7866CqrXVXklFlCJjZOw5ekJOaFxCI
         wGuA==
X-Gm-Message-State: AOJu0YxubqaL+OmohE7hlToUpJig/g2UV8lQFnLOL2Mq7oKHKE6OC8jK
	mWYlKj5UZsbGVO4ewpE1LAB4YurDKljncPKtZW0FrS+k26e9QpzJOkLzIBk6
X-Google-Smtp-Source: AGHT+IEq+YjDyLPjFmw0+ZO4vT3mnUY4rlRs2CyRecfmxa5DcUs1fePakh339+S7E6u3grz/zFCw/A==
X-Received: by 2002:a17:902:f685:b0:1d7:2ede:ce79 with SMTP id l5-20020a170902f68500b001d72edece79mr6249418plg.61.1705997620645;
        Tue, 23 Jan 2024 00:13:40 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id u11-20020a170903308b00b001d76e9ce688sm642324plc.114.2024.01.23.00.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:13:40 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map
Date: Tue, 23 Jan 2024 17:13:25 +0900
Message-Id: <9187339db22136fa306be69c2e20233516c3a4c4.1705996635.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705996635.git.Takahiro.Kuwano@infineon.com>
References: <cover.1705996635.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_001341_641660_73C8C5CC 
X-CRM114-Status: GOOD (  21.51  )
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
 drivers/mtd/spi-nor/core.c | 59 ++++++++++++++++++++++++++++++++++++--
 drivers/mtd/spi-nor/core.h |  2 ++
 drivers/mtd/spi-nor/sfdp.c |  1 +
 3 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5b2f13d0888e..25702d604fc5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2441,6 +2441,7 @@ void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
 	map->uniform_region.erase_mask = erase_mask;
 	map->uniform_region.flags = SNOR_LAST_REGION;
 	map->regions = &map->uniform_region;
+	map->n_regions = 1;
 }
 
 int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
@@ -3403,7 +3404,54 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	return info;
 }
 
-static void spi_nor_set_mtd_info(struct spi_nor *nor)
+static u32
+spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
+			     const struct spi_nor_erase_type *erase_type)
+{
+	u8 i;
+
+	if (region->flags & SNOR_OVERLAID_REGION)
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
@@ -3434,6 +3482,11 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
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
@@ -3526,7 +3579,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return ret;
 
 	/* No mtd_info fields should be used up to this point. */
-	spi_nor_set_mtd_info(nor);
+	ret = spi_nor_set_mtd_info(nor);
+	if (ret)
+		return ret;
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e002de22b18a..fefa990525ff 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -264,11 +264,13 @@ struct spi_nor_erase_region {
  *			The erase types are sorted in ascending order, with the
  *			smallest Erase Type size being the first member in the
  *			erase_type array.
+ * @n_regions:		number of erase regions.
  */
 struct spi_nor_erase_map {
 	struct spi_nor_erase_region	*regions;
 	struct spi_nor_erase_region	uniform_region;
 	struct spi_nor_erase_type	erase_type[SNOR_ERASE_TYPE_MAX];
+	unsigned int			n_regions;
 };
 
 /**
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c8d8b4e5b7e6..afe041f75f30 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -836,6 +836,7 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
 	if (!region)
 		return -ENOMEM;
 	map->regions = region;
+	map->n_regions = region_count;
 
 	uniform_erase_type = 0xff;
 	regions_erase_type = 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
