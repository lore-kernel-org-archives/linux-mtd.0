Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2B2C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:43:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F002820656
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uie51uBO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wqes9SeN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F002820656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v8yUtN6vIAd/lI043ek3nasz8tZzzShueR6fOz98NsU=; b=Uie51uBOLT4uEQlxz9c4x/oBQ
	0vrh7QEStRaC8N/fWZ4I70Zn4RqeVzJvspPnZP4GiOqUYtJmkDq4tmzvjeM3wJDaL79+rTEdzzzEC
	VkXErU+YZ9oFR5LqBrFImr2fiOrJZl7NrE2VCbpTrDXGG50uNO26RqPtvmaKjdWCFqhfmvNyy3UQX
	+ujgjjPBAaeioyilC1x3AdN3V3WbEiMKyhHC7HMTvtfULcaNa1PGsOSVBOhWVkQ9r4I9G1i/xoH66
	UF8Wusg4wg8bnWnOASehW3ubM/qcm2C9BFp4ZDnWVN8YbJql5ZI7g37Cskheii5Mp3dSdKqnjI88b
	Zc8F9GjFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCvy-0005qT-DC; Thu, 02 May 2019 14:43:38 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMCm3-0001H5-FL
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 14:33:44 +0000
Received: by mail-lj1-x241.google.com with SMTP id z26so2408481ljj.2
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 07:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ohcDEvkPistHHHhOpFFR0NARkPBUpb4Juo62pfPYr0=;
 b=Wqes9SeNHgt8NqnKfKCZ6AhoUzeRAIz4/tnbpeK/SgJ6K4ycOZENvW/4XsuUS1flPS
 KqZqA2RKIfiEBzUQJIVwku6thOl25HI7r7GUHaa4PELY0nqsqkbO8CjMMMvxZ9N1KPb+
 d8pWJe37XHka9oTuxgyNu/3gOiHNOVesGLxaiLfEX0pv2ZjBkDkaVjd5cTz4baOFPhrD
 4vcVuoxwYa1m3dV7FhbHvVtC/pPIr46T3WRWCyOvuBcDHdYt/LSGABg0uRFx/D6+hXOc
 mYDFG2KVCkrimMoVIahumnaoKxh56v+R9EKxv/hSI9z5+Gc4K8LJGZeyvscnfDVbdWmo
 zLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ohcDEvkPistHHHhOpFFR0NARkPBUpb4Juo62pfPYr0=;
 b=nbMYhI2Lh3gmsiEEt1A7EN7aZExvcy/rrmRjf4ezLFE5V9CsC8skaT3Bu3IDjI489H
 JvQ/r091a1swXACC/sHhBwe+1ORZzVxMJsmUEeFNWsIYKnyGphtNScjA2kuJw5Z3eOsr
 a+tdGr4y29AkET8//pDhQHI+xVFAwsLCud6VT8Hyvmsq7ro8S5hrIWE2usxi6TdQKHDy
 jL9cln6j8sf3KqyKO/79Y0c/DogEsdzQRDlhdkFp/Rka4yk5ncpdwgELx44L0C2HwiY3
 CNlaKDceXqmjunYbXO5fFxxrGRB3C3FB10qXLBLAkADJ2N4u3qoZDsQmKdd6pXyma3Z+
 vaWA==
X-Gm-Message-State: APjAAAW3/u5c9lUNpMIm3nk3+vxRhpICn1g4cvvrYHeUifZawEYgoAGm
 EJzQ4j+2oBCYIsGDer5aEVaweA==
X-Google-Smtp-Source: APXvYqysptrh083qRNGcHfaJOcrm2hEEO9zp7bC5QgjJ1/tvqnCI6Spo6S0+5FLEvEFcss1pubMTjQ==
X-Received: by 2002:a2e:94ca:: with SMTP id r10mr2096891ljh.33.1556807601756; 
 Thu, 02 May 2019 07:33:21 -0700 (PDT)
Received: from localhost.localdomain
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id l79sm9430625lfe.92.2019.05.02.07.33.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 07:33:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 9/9 RESEND 2] mtd: afs: add v2 partition parsing
Date: Thu,  2 May 2019 16:30:34 +0200
Message-Id: <20190502143034.16781-10-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502143034.16781-1-linus.walleij@linaro.org>
References: <20190502143034.16781-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_073324_041490_E69932D5 
X-CRM114-Status: GOOD (  22.38  )
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
Content-Type: multipart/mixed; boundary="===============3299517347096104006=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3299517347096104006==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

The AFS v2 partition type appear in later ARM reference designs
such as RealView, Versatile Express and the 64bit Juno Development
Platform.

The image informations is padded with a 32bit word (4 bytes) on
the 32bit platforms and a 64bit word (8 bytes) on the 64bit
platforms. The boot monitor source code gives at hand that this
is because the first entry in the struct mapped over the image
information is a "next" pointer for a linked list, filled in
by firmware after reading in the info block, and always zero
in the flash. We adjust padding by checking what padding gives
the right checksum.

This was tested on:
- Integrator/AP (v1 partitions)
- RealView PB11MPCore (v2 32bit partitions)
- Juno Development System (v2 64bit partitions)

All systems display the images in flash very nicely as separate
partitions, e.g on Juno:

4 afs partitions found on MTD device 8000000.flash
Creating 4 MTD partitions on "8000000.flash":
0x000000040000-0x0000000c0000 : "fip"
0x000000ec0000-0x0000018c0000 : "Image"
0x000000f00000-0x000000f40000 : "juno"
0x000003ec0000-0x000003f00000 : "bl1"

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/parsers/afs.c | 158 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 157 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 72c688b8a383..0c730024f806 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -3,6 +3,7 @@
     drivers/mtd/afs.c: ARM Flash Layout/Partitioning
 
     Copyright © 2000 ARM Limited
+    Copyright (C) 2019 Linus Walleij
 
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -35,6 +36,8 @@
 #include <linux/mtd/partitions.h>
 
 #define AFSV1_FOOTER_MAGIC 0xA0FFFF9F
+#define AFSV2_FOOTER_MAGIC1 0x464C5348 /* "FLSH" */
+#define AFSV2_FOOTER_MAGIC2 0x464F4F54 /* "FOOT" */
 
 struct footer_v1 {
 	u32 image_info_base;	/* Address of first word of ImageFooter  */
@@ -68,6 +71,22 @@ static u32 word_sum(void *words, int num)
 	return sum;
 }
 
+static u32 word_sum_v2(u32 *p, u32 num)
+{
+	u32 sum = 0;
+	int i;
+
+	for (i = 0; i < num; i++) {
+		u32 val;
+
+		val = p[i];
+		if (val > ~sum)
+			sum++;
+		sum += val;
+	}
+	return ~sum;
+}
+
 static bool afs_is_v1(struct mtd_info *mtd, u_int off)
 {
 	/* The magic is 12 bytes from the end of the erase block */
@@ -88,6 +107,27 @@ static bool afs_is_v1(struct mtd_info *mtd, u_int off)
 	return (magic == AFSV1_FOOTER_MAGIC);
 }
 
+static bool afs_is_v2(struct mtd_info *mtd, u_int off)
+{
+	/* The magic is the 8 last bytes of the erase block */
+	u_int ptr = off + mtd->erasesize - 8;
+	u32 foot[2];
+	size_t sz;
+	int ret;
+
+	ret = mtd_read(mtd, ptr, 8, &sz, (u_char *)foot);
+	if (ret < 0) {
+		printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
+		       ptr, ret);
+		return false;
+	}
+	if (ret >= 0 && sz != 8)
+		return false;
+
+	return (foot[0] == AFSV2_FOOTER_MAGIC1 &&
+		foot[1] == AFSV2_FOOTER_MAGIC2);
+}
+
 static int afs_parse_v1_partition(struct mtd_info *mtd,
 				  u_int off, struct mtd_partition *part)
 {
@@ -185,6 +225,113 @@ static int afs_parse_v1_partition(struct mtd_info *mtd,
 	return 0;
 }
 
+static int afs_parse_v2_partition(struct mtd_info *mtd,
+				  u_int off, struct mtd_partition *part)
+{
+	u_int ptr;
+	u32 footer[12];
+	u32 imginfo[36];
+	char *name;
+	u32 version;
+	u32 entrypoint;
+	u32 attributes;
+	u32 region_count;
+	u32 block_start;
+	u32 block_end;
+	u32 crc;
+	size_t sz;
+	int ret;
+	int i;
+	int pad = 0;
+
+	pr_debug("Parsing v2 partition @%08x-%08x\n",
+		 off, off + mtd->erasesize);
+
+	/* First read the footer */
+	ptr = off + mtd->erasesize - sizeof(footer);
+	ret = mtd_read(mtd, ptr, sizeof(footer), &sz, (u_char *)footer);
+	if ((ret < 0) || (ret >= 0 && sz != sizeof(footer))) {
+		pr_err("AFS: mtd read failed at 0x%x: %d\n",
+		       ptr, ret);
+		return -EIO;
+	}
+	name = (char *) &footer[0];
+	version = footer[9];
+	ptr = off + mtd->erasesize - sizeof(footer) - footer[8];
+
+	pr_debug("found image \"%s\", version %08x, info @%08x\n",
+		 name, version, ptr);
+
+	/* Then read the image information */
+	ret = mtd_read(mtd, ptr, sizeof(imginfo), &sz, (u_char *)imginfo);
+	if ((ret < 0) || (ret >= 0 && sz != sizeof(imginfo))) {
+		pr_err("AFS: mtd read failed at 0x%x: %d\n",
+		       ptr, ret);
+		return -EIO;
+	}
+
+	/* 32bit platforms have 4 bytes padding */
+	crc = word_sum_v2(&imginfo[1], 34);
+	if (!crc) {
+		pr_debug("Padding 1 word (4 bytes)\n");
+		pad = 1;
+	} else {
+		/* 64bit platforms have 8 bytes padding */
+		crc = word_sum_v2(&imginfo[2], 34);
+		if (!crc) {
+			pr_debug("Padding 2 words (8 bytes)\n");
+			pad = 2;
+		}
+	}
+	if (crc) {
+		pr_err("AFS: bad checksum on v2 image info: %08x\n", crc);
+		return -EINVAL;
+	}
+	entrypoint = imginfo[pad];
+	attributes = imginfo[pad+1];
+	region_count = imginfo[pad+2];
+	block_start = imginfo[20];
+	block_end = imginfo[21];
+
+	pr_debug("image entry=%08x, attr=%08x, regions=%08x, "
+		 "bs=%08x, be=%08x\n",
+		 entrypoint, attributes, region_count,
+		 block_start, block_end);
+
+	for (i = 0; i < region_count; i++) {
+		u32 region_load_addr = imginfo[pad + 3 + i*4];
+		u32 region_size = imginfo[pad + 4 + i*4];
+		u32 region_offset = imginfo[pad + 5 + i*4];
+		u32 region_start;
+		u32 region_end;
+
+		pr_debug("  region %d: address: %08x, size: %08x, "
+			 "offset: %08x\n",
+			 i,
+			 region_load_addr,
+			 region_size,
+			 region_offset);
+
+		region_start = off + region_offset;
+		region_end = region_start + region_size;
+		/* Align partition to end of erase block */
+		region_end += (mtd->erasesize - 1);
+		region_end &= ~(mtd->erasesize -1);
+		pr_debug("   partition start = %08x, partition end = %08x\n",
+			 region_start, region_end);
+
+		/* Create one partition per region */
+		part->name = kstrdup(name, GFP_KERNEL);
+		if (!part->name)
+			return -ENOMEM;
+		part->offset = region_start;
+		part->size = region_end - region_start;
+		part->mask_flags = 0;
+	}
+
+	return 0;
+}
+
 static int parse_afs_partitions(struct mtd_info *mtd,
 				const struct mtd_partition **pparts,
 				struct mtd_part_parser_data *data)
@@ -200,6 +347,10 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 			sz += sizeof(struct mtd_partition);
 			i += 1;
 		}
+		if (afs_is_v2(mtd, off)) {
+			sz += sizeof(struct mtd_partition);
+			i += 1;
+		}
 	}
 
 	if (!i)
@@ -213,13 +364,18 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	 * Identify the partitions
 	 */
 	for (i = off = 0; off < mtd->size; off += mtd->erasesize) {
-
 		if (afs_is_v1(mtd, off)) {
 			ret = afs_parse_v1_partition(mtd, off, &parts[i]);
 			if (ret)
 				goto out_free_parts;
 			i++;
 		}
+		if (afs_is_v2(mtd, off)) {
+			ret = afs_parse_v2_partition(mtd, off, &parts[i]);
+			if (ret)
+				goto out_free_parts;
+			i++;
+		}
 	}
 
 	*pparts = parts;
-- 
2.20.1



--===============3299517347096104006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3299517347096104006==--
