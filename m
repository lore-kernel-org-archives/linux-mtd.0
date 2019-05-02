Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21535C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:33:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62FC205F4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:33:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDp333S2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jojellB7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62FC205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/En1BVyh0M0iO48rPx8d2VlGWTBy/CR7ht9GXG0vDeY=; b=vDp333S2sqHlQq
	VfeCE7cOT5QJY05bIxYwEaGQHQN9eqziVYHddJGpNaWukiklvn57RwrIl3W5BVDfz1r4yS1XxuhwT
	HPamz58LRYG+Rpf4xDQPe1JwQwUxPF6in/ZxMEg6ROf68UJ3JFiYzTnlyKIYZtQ31yTvPOCrADPa7
	66w6PK7yTDFKUtpu5AxE0oFL+elsoZRg7kJStusDVuiyWx33RnFONv44U1YjZrXGJdj9oxPn8kGLX
	aDGbNRunA4dfBu+2nH3echFSXbACogW+I9eQUsPfIjI5Chfg8bpmY72Q4Wo8forqBcw8/UMroKmqG
	60F9OPmp3DI/VS6TCz0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCmD-0001Vc-Kl; Thu, 02 May 2019 14:33:33 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMClq-0000xf-MV
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 14:33:18 +0000
Received: by mail-lj1-x243.google.com with SMTP id b12so2396695lji.4
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 07:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t94QfyZ+Xm+PlEwTvOydeskpmPUSbr8jtJqXKc3oa1Q=;
 b=jojellB7eQYHQh2jiEdC3WoSIUGzBAXF4CAsT+921TB2HELzTjiGLwi8emvbhJPvJF
 wP08WvFkVK42LgkUwMIfr/iiLVRUt1WQXguXaf7smm8d/5nr+9/V9/6NT9AuZklJtI7K
 zgV168yLPnf4bpvEhpWMofy8BDOQnFjCdSfQb1hZhaRFKtY/FgI1T4cIU8zbzmWLzlcQ
 BhZ9D2LSwu8YXSF03JEIei5PN67PrbLsYcwdZr2GWp80z71snCZLLHdlr1XjryoJMgeZ
 Zdone5W3QB0QOgVDFmhG9R320A5GABy+jAhpLjQ0L9eLg8jZpXJOQM9KoKO7QY9/mWw/
 LkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t94QfyZ+Xm+PlEwTvOydeskpmPUSbr8jtJqXKc3oa1Q=;
 b=puWkfrPk/e/CO8i5Kjvx4kpblLOZA6xTQoflgB9UCwAm7ch9G3gkwj7wZulnwh8bZs
 ypndVe8XubRbu8DTWFFKJrHdIHL292+axA5cp7SsScLG5KgRvU/tTmfSBO49abAAS8Fw
 FnWxqWD3K43rzQFzjbIr/Bhxe8b7z670b5DI++2jKcwNwl7CuFuO5TAKTPmdnNEwc3Fv
 Qzfa5C3AN/woghPiXBkrqeCT3sdym438tGOx+xsZiExWucwOU061Mv/Ojx4flLluv438
 R/vnBsMWk4H5Hk7l/32K2iW2qLJPqHw0PMGe2Jyw/8bY+Rh3FbmF2GFFO+3gwtnM5dWl
 X8Dg==
X-Gm-Message-State: APjAAAWK0AHvhZeaZ4jlSJVRwOeb93ID7ql9DxEIE1UCvhEwq257uZWo
 ZCA2FKiOBqScMVHlV8L6sT1V1Q==
X-Google-Smtp-Source: APXvYqxUrDYTOH0UNCmG6sU4OP6mJ98R/BU0yTJ7hF2pr59pQyvDe7PI5J59kZQjSJVSuTB60bNPsw==
X-Received: by 2002:a2e:9659:: with SMTP id z25mr2167017ljh.92.1556807588324; 
 Thu, 02 May 2019 07:33:08 -0700 (PDT)
Received: from localhost.localdomain
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id l79sm9430625lfe.92.2019.05.02.07.33.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 07:33:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 4/9 RESEND 2] mtd: afs: simplify partition parsing
Date: Thu,  2 May 2019 16:30:29 +0200
Message-Id: <20190502143034.16781-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502143034.16781-1-linus.walleij@linaro.org>
References: <20190502143034.16781-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_073311_147601_6824AE14 
X-CRM114-Status: GOOD (  21.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Ryan Harkin <ryan.harkin@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This simplifies the AFS partition parsing to make the code
more straight-forward and readable.

Before this patch the code tried to calculate the memory required
to hold the partition info by adding up the sizes of the strings
of the names and adding that to a single memory allocation,
indexing the name pointers in front of the struct mtd_partition
allocations so all allocated data was in one chunk.

This is overzealous. Instead use kstrdup and bail out,
kfree():ing the memory used for MTD partitions and names alike
on the errorpath.

In the process rename the index variable from idx to i.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/parsers/afs.c | 67 +++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 3679e1d22595..c489938cd665 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -166,9 +166,9 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 				struct mtd_part_parser_data *data)
 {
 	struct mtd_partition *parts;
-	u_int mask, off, idx, sz;
+	u_int mask, off, sz;
 	int ret = 0;
-	char *str;
+	int i;
 
 	/*
 	 * This is the address mask; we use this to mask off out of
@@ -181,78 +181,75 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	 * partition information.  We include in this the size of
 	 * the strings.
 	 */
-	for (idx = off = sz = 0; off < mtd->size; off += mtd->erasesize) {
-		struct image_info_v1 iis;
+	for (i = off = sz = 0; off < mtd->size; off += mtd->erasesize) {
 		u_int iis_ptr, img_ptr;
 
 		ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
 		if (ret < 0)
-			break;
+			return ret;
 		if (ret) {
-			ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
-			if (ret < 0)
-				break;
-			if (ret == 0)
-				continue;
-
 			sz += sizeof(struct mtd_partition);
-			sz += strlen(iis.name) + 1;
-			idx += 1;
+			i += 1;
 		}
 	}
 
-	if (!sz)
-		return ret;
+	if (!i)
+		return 0;
 
 	parts = kzalloc(sz, GFP_KERNEL);
 	if (!parts)
 		return -ENOMEM;
 
-	str = (char *)(parts + idx);
-
 	/*
 	 * Identify the partitions
 	 */
-	for (idx = off = 0; off < mtd->size; off += mtd->erasesize) {
+	for (i = off = 0; off < mtd->size; off += mtd->erasesize) {
 		struct image_info_v1 iis;
 		u_int iis_ptr, img_ptr;
 
 		/* Read the footer. */
 		ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
 		if (ret < 0)
-			break;
+			goto out_free_parts;
 		if (ret == 0)
 			continue;
 
 		/* Read the image info block */
 		ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
 		if (ret < 0)
-			break;
+			goto out_free_parts;
 		if (ret == 0)
 			continue;
 
-		strcpy(str, iis.name);
+		parts[i].name = kstrdup(iis.name, GFP_KERNEL);
+		if (!parts[i].name) {
+			ret = -ENOMEM;
+			goto out_free_parts;
+		}
 
-		parts[idx].name		= str;
-		parts[idx].size		= (iis.length + mtd->erasesize - 1) & ~(mtd->erasesize - 1);
-		parts[idx].offset	= img_ptr;
-		parts[idx].mask_flags	= 0;
+		parts[i].size		= (iis.length + mtd->erasesize - 1) & ~(mtd->erasesize - 1);
+		parts[i].offset	= img_ptr;
+		parts[i].mask_flags	= 0;
 
 		printk("  mtd%d: at 0x%08x, %5lluKiB, %8u, %s\n",
-			idx, img_ptr, parts[idx].size / 1024,
-			iis.imageNumber, str);
-
-		idx += 1;
-		str = str + strlen(iis.name) + 1;
-	}
+			i, img_ptr, parts[i].size / 1024,
+			iis.imageNumber, parts[i].name);
 
-	if (!idx) {
-		kfree(parts);
-		parts = NULL;
+		i += 1;
 	}
 
 	*pparts = parts;
-	return idx ? idx : ret;
+	return i;
+
+out_free_parts:
+	while (i >= 0) {
+		if (parts[i].name)
+			kfree(parts[i].name);
+		i--;
+	}
+	kfree(parts);
+	*pparts = NULL;
+	return ret;
 }
 
 static const struct of_device_id mtd_parser_afs_of_match_table[] = {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
