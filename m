Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D930BC4829C
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Feb 2024 04:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekTqvzrIGRk3yY8bjtEmMJzI4i3YDirdE1IPXCiBS/c=; b=2UOVWeXtPEogO5
	5TjvLjyHsrinPLzCfHnHcsI2TnhUZ/r+diO2oQwJStQmm6M5Jnan9eYwulRvPnuAgLuX0PlMFwC0h
	oxB2HSUrJNaefwrR02IwFw6sY7GXvKOpOhb0dJqYAiOKMNCTpDbDK6prHKN1dYhUkMmVrZNpwza50
	FzN5dsdAMBI2eC4gs6iLubAosBiL/opm1JDyYq+iz+ACkIOFydCTPTsp4ABOwKa23u0RPA76jvxhX
	HuXdCK1QocpFSpmERNg0FIAlLesJX3wIVzT8l/yVF5L4qXRCK2nFxx+MgYFMDVWzNKex2vnS+74C7
	AgFkfvAvPyK2efOGlZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXDDO-000000062Wf-1mK0;
	Tue, 06 Feb 2024 04:37:46 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXDDM-000000062Vq-1K4j
	for linux-mtd@lists.infradead.org;
	Tue, 06 Feb 2024 04:37:45 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-604545fee99so18032167b3.3
        for <linux-mtd@lists.infradead.org>; Mon, 05 Feb 2024 20:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707194262; x=1707799062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUGWq0bG7qM4KtVGWXKEmZzR8pElQnRAE/tnq0IUqIk=;
        b=X5HH6jGMxr5xOUxK+ON+z3zPaCS3QnUa8HCRtVU3AsOHSeKCFFazoLCy5T2VWfkWGc
         3zgO3mmlFu5Hkxi8SHQt4pK7OtTkOt7YsEbSlctKD25FMGaugwzCWAStwQTWjNOvjp9l
         x/5NGiwkURAWa0qSIP7y5E/YFfb0ZugiFqlU2LgACUv/cUWNhOmQ0/Ra/cTqz/Er4zvi
         Yzooi8/3xqHg+KjndK0MSYZWkx25Y0zWCmJpT3NT0jO3WB+Z4BdEuIdweRTQ/qS6BbSj
         q9/5XQzCMw9oULsXxs1jWuzg7d4HYypSDh3ltAbkMUyBL/GaXTTxxVKH9IcalzOw+9av
         W31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707194262; x=1707799062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUGWq0bG7qM4KtVGWXKEmZzR8pElQnRAE/tnq0IUqIk=;
        b=wdR1ODpQU8VxJaT3Hc6T2xzPUsc+EkiFrDThVjSHs7FNEI0ROZ7YL81LcDjxMeOB/0
         lYZDQI8PWdwgD86yF7mdfi6sdtwTdm72bEehR6zQ5ndZuQWOGPVeP7y+exmpDQHqQBT0
         IRp4xxuIrnvjj2HX4FgJ+NPUqNFW++GwlM/Pug8JaLVAlbBWarZm5bL+2L+KvUHKoTyo
         6MbuDgELgC6V73FN80Tbltjs4fwMnaZH7NH+qbBF3U8Tp3ZUVocYdYiHiB9/Ooc6U7Hn
         JrTXhwFpg6y9ldI3Mw6XZD0SbJbr4k9bV4VupzvlBG8QToSuYbuIHBOF7zr2hryrcHIE
         YS2w==
X-Gm-Message-State: AOJu0Yxg3pUvacKKF+afed6dOCOlklLLnEI3dv/0tVbf9s0HnTCbexuV
	PLIZFFqoy2VEIzPPy/eaxRPlTKrgdoYfu+Nhh7vcER+P05Pyb5LbXSslfrUx
X-Google-Smtp-Source: AGHT+IGc8wMeeSYAWACn1sqnjHZa26lD6JyocTPxGZvdiEfg837b/A4nkbo9Jm9ZPtH9KIIGwS0XRA==
X-Received: by 2002:a25:ac8a:0:b0:dc6:cb93:18e8 with SMTP id x10-20020a25ac8a000000b00dc6cb9318e8mr568169ybi.1.1707194262305;
        Mon, 05 Feb 2024 20:37:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW8du2sVJ+GQeppnEAtzDUg7qS8FIE1xsqc/lgdWGsvXhUVBePQBG79jl0C0HbOUa3oup5/DRJF0tv//b4Zy2JXQ30UYgJql8Vv2WndAX4qKEDx/cKMKVgjI685alWwE7O3dUelQAa7tWPNj5W9gz4bYRuYkUQdVon7DQskRqW0HNipeefxMvD2O6Uak2phPNObiDM9L2lEFDgQy2evGSxs4Jt/IdKO4a/XWgtf5+Sp1Wlhpo1DJ02bZ7MShfAZToMQT1di/OzeKkYxDrYQyby9aUx1SUOF1pUjfYf24s3POQ==
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id c19-20020a631c53000000b005d6b5934deesm945466pgm.48.2024.02.05.20.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 20:37:41 -0800 (PST)
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
Subject: [PATCH v3 2/2] mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map
Date: Tue,  6 Feb 2024 13:37:26 +0900
Message-Id: <bb49c5512fc2e00a30e1c07bffd5b3d229c4b839.1707193539.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707193538.git.Takahiro.Kuwano@infineon.com>
References: <cover.1707193538.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_203744_380838_D70ACD98 
X-CRM114-Status: GOOD (  17.63  )
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
index 7f4ac146f56b..1b729784713f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3401,7 +3401,54 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
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
@@ -3432,6 +3479,11 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
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
@@ -3524,7 +3576,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
