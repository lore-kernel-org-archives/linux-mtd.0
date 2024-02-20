Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9079CC54787
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRa0U3IkXWnM5JN8tf6J44L63tYmy97uCCDWCPaNw5M=; b=OBoc3akrCKDG73
	Qg6CxIg1i0P/xLjLxlIICuwHogYjNYX79xJ4mHyL4PScFeNgJ5Nv9ewW+NJp8IoV2M3zBnI2/xyoh
	CnCDI5OV/bMs5o+V2IgQW5v8ELnWH+TCIcxYjTrwvdy28Y+QA4adIvX5kOKkf7y4GUGH/FFrAQYEA
	mHQ0+ynzMqSG9QdRWFqmHVsM1n93aRFNOlSUZLdl0qN6RSL/i4Cqf+lrzLoRy/Al3lKZzQgc9S8tN
	fAAptj0BfU/Vc9pyBL0/F63BdklAh2M20vf6+xt4I3C1JeYwaiIHurFpdrP8V8Nr0fPPJZRa78uuV
	qVza9cAeLe8tXZzL5zIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLaA-0000000Dk0i-3wwQ;
	Tue, 20 Feb 2024 08:34:30 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLa8-0000000DjzY-0jRX
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 08:34:29 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5d8ddbac4fbso4256761a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 00:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708418067; x=1709022867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3vT7WGWXnjY1O45vFvNWSwEU06q7bTsa1rUBvw9WPc=;
        b=jMvOGymYQgHOjY2nz8ktMb6+lrseTNJE1WjMAQB+cs9tOHEN9FbOgGvLZjqro/NqZ0
         4WtpcQFm1vUSUVxGfIVT9VzFHREF1PwhiPPn4rpIaO5ShahyTfmY3kRXyfBQYy7aKnwy
         qN6oWyoyGw1oZkKGRv3b4YaU/T3B2iRqQ34AxRnuQSHtqt+oMbqDi48j/vofVvfXDmjI
         rkcwJcttyjQKTkZy/8igWi3VxXlIHuegdJeaso4m0CCIqwhnF8rCKjLv/NmaMf2G9/z8
         yN7/zi3RUGjqyHeZtcL7ttjom1j3bVzTxNrEFRtULdcDUo6nH6sNLO/UeJNitD1Ob31Z
         Il+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708418067; x=1709022867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3vT7WGWXnjY1O45vFvNWSwEU06q7bTsa1rUBvw9WPc=;
        b=Shrn7Q8Wt/FDO3g4n/qoM15VLbouYS247pRPXtbVpbGMysTcrHuml2DV370vuLeDaX
         4kik0yotKQ0qjwoBB5ZnwFP5bTeu09lGd1YET2/BdK7lKIVihMX4P1dNVRDFprFT8niQ
         2Pvxb8lLETo2jySp2qSgLbsPTqG+1mVJTTaezk/3KBMnpcHEZOdRWGB5eZRkuOFYLuFL
         ISwQJghOhah26oa0/kPJ0nMpfCJEqqVzTotQP4G7RcmjVNDx7RhZr1L/CbHOFmrDoiRY
         cMXxcr7XIAScgXeqJrY11B7SB0r0s2F1y82cFYv87cRrsPxUdvcgmcA7yN7zJEGWTR5R
         mnsw==
X-Gm-Message-State: AOJu0Yy1MplF/g1q7hfa9ofy9GfK5OOWO3+2ij1UhUBuOiQ3PowCLzl5
	I+zDZsDWctdoYVSZzbc885OHlq5bM/f2//S4LUXH/gnrz97G1vaqGyqLSnd4
X-Google-Smtp-Source: AGHT+IGKheJCgOoXDW70oKqwvqbR8Eebt9TSPEzuX7WNu8rmga8IThF6UaOxt37soLymFJPr2z+ywQ==
X-Received: by 2002:a05:6a20:8c09:b0:1a0:6016:bf6f with SMTP id j9-20020a056a208c0900b001a06016bf6fmr13508036pzh.29.1708418066963;
        Tue, 20 Feb 2024 00:34:26 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id lo5-20020a170903434500b001db715d3bf2sm5655655plb.137.2024.02.20.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 00:34:26 -0800 (PST)
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
Subject: [PATCH v4 2/4] mtd: spi-nor: core: get rid of SNOR_LAST_REGION flag
Date: Tue, 20 Feb 2024 17:34:07 +0900
Message-Id: <eded84294bd81e966d6f423e578fc2cfb9a4a5b6.1708404584.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_003428_298310_9C93D873 
X-CRM114-Status: GOOD (  24.85  )
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

Introduce n_regions in spi_nor_erase_map structure and remove
SNOR_LAST_REGION flag. Loop logics that depend on the flag are also
reworked to use n_regions as loop condition.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Suggested-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c    | 105 +++++++++-------------------------
 drivers/mtd/spi-nor/core.h    |  10 ++--
 drivers/mtd/spi-nor/debugfs.c |  16 +++---
 drivers/mtd/spi-nor/sfdp.c    |  18 ++----
 4 files changed, 43 insertions(+), 106 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5b2f13d0888e..d9a0c0e31950 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1565,57 +1565,11 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
 	return NULL;
 }
 
-static u64 spi_nor_region_is_last(const struct spi_nor_erase_region *region)
-{
-	return region->flags & SNOR_LAST_REGION;
-}
-
 static u64 spi_nor_region_end(const struct spi_nor_erase_region *region)
 {
 	return region->offset + region->size;
 }
 
-/**
- * spi_nor_region_next() - get the next spi nor region
- * @region:	pointer to a structure that describes a SPI NOR erase region
- *
- * Return: the next spi nor region or NULL if last region.
- */
-struct spi_nor_erase_region *
-spi_nor_region_next(struct spi_nor_erase_region *region)
-{
-	if (spi_nor_region_is_last(region))
-		return NULL;
-	region++;
-	return region;
-}
-
-/**
- * spi_nor_find_erase_region() - find the region of the serial flash memory in
- *				 which the offset fits
- * @map:	the erase map of the SPI NOR
- * @addr:	offset in the serial flash memory
- *
- * Return: a pointer to the spi_nor_erase_region struct, ERR_PTR(-errno)
- *	   otherwise.
- */
-static struct spi_nor_erase_region *
-spi_nor_find_erase_region(const struct spi_nor_erase_map *map, u64 addr)
-{
-	struct spi_nor_erase_region *region = map->regions;
-	u64 region_end = spi_nor_region_end(region);
-
-	while (addr < region->offset || addr >= region_end) {
-		region = spi_nor_region_next(region);
-		if (!region)
-			return ERR_PTR(-EINVAL);
-
-		region_end = spi_nor_region_end(region);
-	}
-
-	return region;
-}
-
 /**
  * spi_nor_init_erase_cmd() - initialize an erase command
  * @region:	pointer to a structure that describes a SPI NOR erase region
@@ -1682,48 +1636,41 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
 	struct spi_nor_erase_region *region;
 	struct spi_nor_erase_command *cmd = NULL;
 	u64 region_end;
+	unsigned int i;
 	int ret = -EINVAL;
 
-	region = spi_nor_find_erase_region(map, addr);
-	if (IS_ERR(region))
-		return PTR_ERR(region);
-
-	region_end = spi_nor_region_end(region);
+	for (i = 0; i < map->n_regions; i++) {
+		region = &map->regions[i];
+		region_end = spi_nor_region_end(region);
 
-	while (len) {
-		erase = spi_nor_find_best_erase_type(map, region, addr, len);
-		if (!erase)
-			goto destroy_erase_cmd_list;
-
-		if (prev_erase != erase ||
-		    erase->size != cmd->size ||
-		    region->flags & SNOR_OVERLAID_REGION) {
-			cmd = spi_nor_init_erase_cmd(region, erase);
-			if (IS_ERR(cmd)) {
-				ret = PTR_ERR(cmd);
+		while (len && addr >= region->offset && addr < region_end) {
+			erase = spi_nor_find_best_erase_type(map, region, addr,
+							     len);
+			if (!erase)
 				goto destroy_erase_cmd_list;
-			}
 
-			list_add_tail(&cmd->list, erase_list);
-		} else {
-			cmd->count++;
-		}
-
-		addr += cmd->size;
-		len -= cmd->size;
+			if (prev_erase != erase || erase->size != cmd->size ||
+			    region->flags & SNOR_OVERLAID_REGION) {
+				cmd = spi_nor_init_erase_cmd(region, erase);
+				if (IS_ERR(cmd)) {
+					ret = PTR_ERR(cmd);
+					goto destroy_erase_cmd_list;
+				}
+
+				list_add_tail(&cmd->list, erase_list);
+			} else {
+				cmd->count++;
+			}
 
-		if (len && addr >= region_end) {
-			region = spi_nor_region_next(region);
-			if (!region)
-				goto destroy_erase_cmd_list;
-			region_end = spi_nor_region_end(region);
+			len -= cmd->size;
+			addr += cmd->size;
+			prev_erase = erase;
 		}
 
-		prev_erase = erase;
+		if (!len)
+			return 0;
 	}
 
-	return 0;
-
 destroy_erase_cmd_list:
 	spi_nor_destroy_erase_cmd_list(erase_list);
 	return ret;
@@ -2439,8 +2386,8 @@ void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
 	map->uniform_region.offset = 0;
 	map->uniform_region.size = flash_size;
 	map->uniform_region.erase_mask = erase_mask;
-	map->uniform_region.flags = SNOR_LAST_REGION;
 	map->regions = &map->uniform_region;
+	map->n_regions = 1;
 }
 
 int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e002de22b18a..1668d79f55bc 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -238,8 +238,7 @@ struct spi_nor_erase_command {
  *			inside this region. The erase types are sorted in
  *			ascending order with the smallest Erase Type size being
  *			at BIT(0).
- * @flags:		flags to determine if this region is overlaid, if this
- *			region is the last in the SPI NOR flash memory
+ * @flags:		flags to determine if this region is overlaid.
  */
 struct spi_nor_erase_region {
 	u64		offset;
@@ -250,8 +249,7 @@ struct spi_nor_erase_region {
 
 #define SNOR_ERASE_TYPE_MAX	4
 
-#define SNOR_LAST_REGION	BIT(0)
-#define SNOR_OVERLAID_REGION	BIT(1)
+#define SNOR_OVERLAID_REGION	BIT(0)
 
 /**
  * struct spi_nor_erase_map - Structure to describe the SPI NOR erase map
@@ -264,11 +262,13 @@ struct spi_nor_erase_region {
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
@@ -699,8 +699,6 @@ void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
 void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
 			    u8 opcode);
 void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase);
-struct spi_nor_erase_region *
-spi_nor_region_next(struct spi_nor_erase_region *region);
 void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
 				    u8 erase_mask, u64 flash_size);
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 16b30f1a3066..0832b5893d6b 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -78,10 +78,10 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	struct spi_nor *nor = s->private;
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *erase_map = &params->erase_map;
-	struct spi_nor_erase_region *region;
+	struct spi_nor_erase_region *region = erase_map->regions;
 	const struct flash_info *info = nor->info;
 	char buf[16], *str;
-	int i;
+	unsigned int i;
 
 	seq_printf(s, "name\t\t%s\n", info->name);
 	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
@@ -144,13 +144,11 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | flags\n");
 	seq_puts(s, " ------------------+------------+----------\n");
-	for (region = erase_map->regions;
-	     region;
-	     region = spi_nor_region_next(region)) {
-		u64 start = region->offset;
-		u64 end = start + region->size - 1;
-		u8 erase_mask = region->erase_mask;
-		u8 flags = region->flags;
+	for (i = 0; i < erase_map->n_regions; i++) {
+		u64 start = region[i].offset;
+		u64 end = start + region[i].size - 1;
+		u8 erase_mask = region[i].erase_mask;
+		u8 flags = region[i].flags;
 
 		seq_printf(s, " %08llx-%08llx |     [%c%c%c%c] | %s\n",
 			   start, end,
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c8d8b4e5b7e6..c4721d7dc97a 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -390,15 +390,14 @@ static void spi_nor_regions_sort_erase_types(struct spi_nor_erase_map *map)
 {
 	struct spi_nor_erase_region *region = map->regions;
 	u8 sorted_erase_mask;
+	unsigned int i;
 
-	while (region) {
-		sorted_erase_mask = spi_nor_sort_erase_mask(map,
-							    region->erase_mask);
+	for (i = 0; i < map->n_regions; i++) {
+		sorted_erase_mask =
+			spi_nor_sort_erase_mask(map, region[i].erase_mask);
 
 		/* Overwrite erase mask. */
-		region->erase_mask = sorted_erase_mask;
-
-		region = spi_nor_region_next(region);
+		region[i].erase_mask = sorted_erase_mask;
 	}
 }
 
@@ -774,11 +773,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	return ret;
 }
 
-static void spi_nor_region_mark_end(struct spi_nor_erase_region *region)
-{
-	region->flags |= SNOR_LAST_REGION;
-}
-
 static void spi_nor_region_mark_overlay(struct spi_nor_erase_region *region)
 {
 	region->flags |= SNOR_OVERLAID_REGION;
@@ -836,6 +830,7 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
 	if (!region)
 		return -ENOMEM;
 	map->regions = region;
+	map->n_regions = region_count;
 
 	uniform_erase_type = 0xff;
 	regions_erase_type = 0;
@@ -864,7 +859,6 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
 
 		offset = region[i].offset + region[i].size;
 	}
-	spi_nor_region_mark_end(&region[i - 1]);
 
 	save_uniform_erase_type = map->uniform_region.erase_mask;
 	map->uniform_region.erase_mask =
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
