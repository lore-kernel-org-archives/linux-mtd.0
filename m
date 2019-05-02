Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299D7C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:34:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3F09205F4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q1jtGjlW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7mY8KNN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3F09205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFpsCRb+VDkKHNFadVWETTUK20jCdxzZrg5Dp2XYUic=; b=Q1jtGjlWpsRl0p
	vZr9JEYbXg+rDqQ5atFNUVbJL0rzETs0BrlVkQFgTDwDA9VYR78zvWwdJQGLOC6ww3ug5rQTZ9Hd4
	CtwIi0J8+Dl1z+MmUaNdiShojWltfMcCEWADOcl4qpZSzqIYmVemcVK/m9Bnx9vjyDHiaRqj/3CqK
	2a26QK72PePF2FcDuCCf7G0Of5FHqD8b8Iysm7V83hQ6wo/ekDbcNPuIShdGhKURXGT0EeHf2NvFr
	pTJw25lx96XP/2UMABEIfgwAZlE6GyxGeWbzIxffZz3tJ6B1aDurfAmNkKWBnPHQGIhm/6AAPt9tJ
	wjTmxVVftzGvAqgSIjiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCmu-0002R1-RZ; Thu, 02 May 2019 14:34:16 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMCly-00019J-MO
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 14:33:34 +0000
Received: by mail-lj1-x241.google.com with SMTP id t1so2369906lje.10
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rj711N4u+SYqDnZQYL9jQuymU6HES5b6qp0qWAvrKoQ=;
 b=D7mY8KNNHfwil5hxYax+JTkRllxmZ+8WgLY7qWAfx9AdL1gSo3m4/izbROLE1LSG+A
 +iBSsTbFaPkZuTZj3AE1I09F7dGYDWeNdb3drV/ev0mLrcgOLgRGpI7g/QObVgVoGOQ4
 bIFQ7g2WekCbENIGTP3NiB8r6ntDNN4J1tgf+M+oOC6rTwpYsw7IKpDzR/SeYRYL494M
 RY98M7k5uCv4WUQDHHSA2lHDp9S6M5em+F5ACvHcbzLxvD+Q8zwYlc1u3YaBpoLpr87o
 d0rsPVPZj39X/wjPqi/J4eeVAuv05FH6p3jLVQDQXt8BygmBaGDlIJNEGKIzUc8+x78w
 0wrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rj711N4u+SYqDnZQYL9jQuymU6HES5b6qp0qWAvrKoQ=;
 b=ft8wewyfn+3c+0ngl+qhKbz8Ufy/d8lZU/yeyPoaaLx8gh4Fm4jmQglcEu9eLH5N7X
 uRgmZ3++S0T7Eywq+ysAEOPmB+rSmkUdfbjRKE44YR1od6cRikmIJc45UoCSr8ZamgmH
 R+rrWZlX+vyoXibNcDuDFdH6AcQJg6p5u5x5oH+wWjI3joj1LMjWhgmfEWMTs9YlpHz9
 tF49E2e9KP96+ltd9fKnJ7IODz73ldUSEUbcZuc0LL6a5GitSLaBwJsRRezDVxg87k4q
 xGXQVIQJ4dX422BP8Uped5ahH1MCoPVaCYr4MPwfcV7dr4JfBEhUC95Og6dsBwVUD5T1
 0Wlw==
X-Gm-Message-State: APjAAAV0UeIvEQtFuLlaK+LRhwSXiuWWXdIEjo4plZ/3UETxr8Q3Axn4
 LguAX/HjFXiM5O21GMW66+7JDw==
X-Google-Smtp-Source: APXvYqxX6nvYwIQpJdC0dVYCKCG4MfahigYpePPmYvWvDOwoLWPJD72/uKKvngqSpHDV5pR+0Gj4sg==
X-Received: by 2002:a2e:99d5:: with SMTP id l21mr2250903ljj.113.1556807596581; 
 Thu, 02 May 2019 07:33:16 -0700 (PDT)
Received: from localhost.localdomain
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id l79sm9430625lfe.92.2019.05.02.07.33.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 07:33:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 7/9 RESEND 2] mtd: afs: factor footer parsing into the v1 part
 parsing
Date: Thu,  2 May 2019 16:30:32 +0200
Message-Id: <20190502143034.16781-8-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502143034.16781-1-linus.walleij@linaro.org>
References: <20190502143034.16781-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_073319_518712_5A353BA0 
X-CRM114-Status: GOOD (  19.41  )
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

This simplifies the code by factoring in the image footer
parsing into the single function parsing the AFSv1 partitions.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/parsers/afs.c | 98 ++++++++++++++++-----------------------
 1 file changed, 39 insertions(+), 59 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 32ded91ae66c..8ff82a548252 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -88,63 +88,6 @@ static bool afs_is_v1(struct mtd_info *mtd, u_int off)
 	return (magic == AFSV1_FOOTER_MAGIC);
 }
 
-static int
-afs_read_footer_v1(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
-		   u_int off, u_int mask)
-{
-	struct footer_v1 fs;
-	u_int ptr = off + mtd->erasesize - sizeof(fs);
-	size_t sz;
-	int ret;
-
-	ret = mtd_read(mtd, ptr, sizeof(fs), &sz, (u_char *)&fs);
-	if (ret >= 0 && sz != sizeof(fs))
-		ret = -EINVAL;
-
-	if (ret < 0) {
-		printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
-			ptr, ret);
-		return ret;
-	}
-
-	/*
-	 * Does it contain the magic number?
-	 */
-	if (fs.signature != AFSV1_FOOTER_MAGIC)
-		return 0;
-
-	/*
-	 * Check the checksum.
-	 */
-	if (word_sum(&fs, sizeof(fs) / sizeof(u32)) != 0xffffffff)
-		return 0;
-
-	/*
-	 * Don't touch the SIB.
-	 */
-	if (fs.type == 2)
-		return 0;
-
-	*iis_start = fs.image_info_base & mask;
-	*img_start = fs.image_start & mask;
-
-	/*
-	 * Check the image info base.  This can not
-	 * be located after the footer structure.
-	 */
-	if (*iis_start >= ptr)
-		return 0;
-
-	/*
-	 * Check the start of this image.  The image
-	 * data can not be located after this block.
-	 */
-	if (*img_start > off)
-		return 0;
-
-	return 1;
-}
-
 static int
 afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
 {
@@ -184,6 +127,7 @@ afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
 static int afs_parse_v1_partition(struct mtd_info *mtd,
 				  u_int off, struct mtd_partition *part)
 {
+	struct footer_v1 fs;
 	struct image_info_v1 iis;
 	u_int mask;
 	/*
@@ -192,6 +136,8 @@ static int afs_parse_v1_partition(struct mtd_info *mtd,
 	 */
 	u_int uninitialized_var(iis_ptr);
 	u_int uninitialized_var(img_ptr);
+	u_int ptr;
+	size_t sz;
 	int ret;
 
 	/*
@@ -200,9 +146,43 @@ static int afs_parse_v1_partition(struct mtd_info *mtd,
 	 */
 	mask = mtd->size - 1;
 
-	ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
-	if (ret < 0)
+	ptr = off + mtd->erasesize - sizeof(fs);
+	ret = mtd_read(mtd, ptr, sizeof(fs), &sz, (u_char *)&fs);
+	if (ret >= 0 && sz != sizeof(fs))
+		ret = -EINVAL;
+	if (ret < 0) {
+		printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
+		       ptr, ret);
 		return ret;
+	}
+	/*
+	 * Check the checksum.
+	 */
+	if (word_sum(&fs, sizeof(fs) / sizeof(u32)) != 0xffffffff)
+		return -EINVAL;
+
+	/*
+	 * Hide the SIB (System Information Block)
+	 */
+	if (fs.type == 2)
+		return 0;
+
+	iis_ptr = fs.image_info_base & mask;
+	img_ptr = fs.image_start & mask;
+
+	/*
+	 * Check the image info base.  This can not
+	 * be located after the footer structure.
+	 */
+	if (iis_ptr >= ptr)
+		return 0;
+
+	/*
+	 * Check the start of this image.  The image
+	 * data can not be located after this block.
+	 */
+	if (img_ptr > off)
+		return 0;
 
 	/* Read the image info block */
 	ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
