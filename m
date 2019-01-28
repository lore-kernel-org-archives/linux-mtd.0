Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005D0C282CD
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E0321738
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lV4s8Red";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzHReQfF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E0321738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0f6MnjWOdxMV+/5/XQ7AnOefWp68VqcDmV8j2u0XaT4=; b=lV4s8RedtGiN+v
	YBl6i56KhOyRYijU8zZNMLb3b7lKap1FD2pEkfYd9F/Q/JIKAg8rnWndAJfm4FSQavmh3JbdOva25
	a9sUSxCAaqC6fSengltUW2MAv9d2FAQdhEjtWwyZE1w/bHsA4LZ2IsdTXly8YBtGTvDFvYEMwDxss
	hAYPpn8F4T6iI8xckV28Nt2ARCs9Nrmx+JPT+m14q+YGh8B3hOa9Pp9lQ5v8eO0JLThwM3pmJjTOz
	hEXzbFm/pNfD86bfbNeFH0fIWeUnzgdAJcT+EGEqqT7zs0BXBr0aiXMLsk4G4sqtcZ2g0iCcDpqwB
	zMX6N3dFtUezyTwIJxPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go7Nd-0000lX-6b; Mon, 28 Jan 2019 13:55:17 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go7NS-00089F-BK
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 13:55:08 +0000
Received: by mail-lj1-x243.google.com with SMTP id g11-v6so14303799ljk.3
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2019 05:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ctr64GnyMPW2Z4vCyliLOxUJF1YjKnteZrfOLWzfbsw=;
 b=UzHReQfFZkG3wpvcisKA9TM1+5+xPHfRmqvagRHVr5xKeX9PicLEYasdHadFG2bKKO
 ihw+KeE7SnBx4oa+sTxLR4/c2IaTina9Xvi2Pupp0fkL0mAezjHYunfUh+zQqLJVVnY+
 JmQMrIZdUzrGd0aFCREu/6/sET01nFIOkqs+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ctr64GnyMPW2Z4vCyliLOxUJF1YjKnteZrfOLWzfbsw=;
 b=mE3QXPwBYKLe3kBBdweL1kXq4EGwJB1Jo43o0aAMMSGYCtZQpYWqEgK7pyAR6ciMOI
 tDz74tTI67/aYwKazicuF+ceTkHXewQdgsfhVW/eCcPc7gwKul1Un721bHFGF7J8F/IN
 AV59mnfcR8tPBaZn/Ruh+HHl5U8FE8Yzsiu+Fw5dG23nNtxZHXLikANHFGI/vzLx4SCy
 WNu8TTQRH62k78d3J9LxDc2m1dqcjt43fE/ugMm0xl30CFlYrBIiXMVnzU8fqhgljbqN
 FbsD1hYBpy83mc8HFRyL8i+VIi8+banOvxjwNB3agUw+5oSzl+xJA4wah3MwJDYtifmW
 +VHA==
X-Gm-Message-State: AJcUukfAGyNESU1quAbJ9XX7sqwsmsj+7B03JBKzSeXIYoYo42wMFYMg
 IwgKgqOakMm4u3ZySoIT830K+g==
X-Google-Smtp-Source: ALg8bN5FRhmU7JK6+8dmpIoeaRFNdS8Z4T3P9LAfJ/Pe4t0EoH1qdtlpb2fSV2fnRveeH4D0tfSJUw==
X-Received: by 2002:a2e:6595:: with SMTP id
 e21-v6mr17134967ljf.123.1548683704125; 
 Mon, 28 Jan 2019 05:55:04 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id a2-v6sm3050503lji.13.2019.01.28.05.55.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 05:55:03 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] mtd: afs: simplify partition parsing
Date: Mon, 28 Jan 2019 14:54:44 +0100
Message-Id: <20190128135449.15555-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128135449.15555-1-linus.walleij@linaro.org>
References: <20190128135449.15555-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_055506_473445_A895853F 
X-CRM114-Status: GOOD (  23.38  )
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
Cc: Liviu Dudau <liviu.dudau@arm.com>
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
