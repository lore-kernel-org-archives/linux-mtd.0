Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88111C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:56:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 596F720449
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:56:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJCsrMOo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRDhXiqF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 596F720449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzmfFk1bmlBiS6oYB0B9CrGOhkQIUgQ9tHT3+p3yfL8=; b=mJCsrMOoyeyOl4
	4qZzrqq9qQNHleEJ9elI/95gFc7EaAKCYctHOduUTowYGl/+j0WDkICx8nUm56X7MJIRAxly5p95v
	sJ7ta33TKvLLaI9lyClqfF3r3sn0AhqlsyF6ZVd1E9z/DXBVPlt3iseCraNyItC8CQ/viqzFa77bo
	DyKZLgQ1DE5h8DiGivG8HNU+yg70alP0TzbKtofiIKqiZ6tKuRKcWDj1HFLoqp0bQsUPlBXnTpsEq
	wO9sAQDX36qfDspWJZNANPG0Fw9fwf/ngYHM20jCyXuUzRLqp1DP0/WJVMW1zVcAWDGLQqVyvWHRS
	nFnahYRr1nknQhiM7CTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go7OG-0001VT-ND; Mon, 28 Jan 2019 13:55:56 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go7Nd-0000ju-OW
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 13:55:24 +0000
Received: by mail-lj1-x243.google.com with SMTP id k15-v6so14264902ljc.8
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2019 05:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQcDIXczqauucFef6KTlzM2bz+VwyoVSWjrYrYT/y2E=;
 b=gRDhXiqFt/xw3LXKZ9NKnOagKdxiq/rAHfsqRqqwzGaczdYq3u/vWcdpq45aR1a0fv
 ixY8D1u6bTR33IWT2lSXClOLQyPVmd7H8W7h02hLUSLsCMXmvCNbudVy4MwO94l64Rkm
 cFjgtLaOPML7kUNwCz4ppnFaHHkougpDPoluc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQcDIXczqauucFef6KTlzM2bz+VwyoVSWjrYrYT/y2E=;
 b=sY/H/ux8f1KDMCb4WQ2cuoqBGwt3jSm7g90GtyAswHD2l7375YSrvOEU0PB2GlOARH
 iVuk6c1F7FLhcnEI+7I6cnS5kxXeMKRkoSu7knwLVzq8Uv24syF2C6gPSU5ZEUOXA3Fj
 YGgT7LFQdBm8wOU3N5v9g0BOoSjTOTT6pDgNAlQHBTe7oUW8liPxvrPX6UOtCEVhnslt
 pGeHdlmP20nvu67CrKCL3uwIlawVqDHp5Wyu6iCdMDhFYy8uXN73bHMoqb+c5P5mx7ph
 FDKW+D9TJo+aDiM1TT91gp6JwF+LTztggD8H8QUjWfz1YoOVGdqs74lS+NNuobiMWsV8
 gwSQ==
X-Gm-Message-State: AHQUAubSCnLecog8zx4icoCz0VrNnhQTxffAiKrdTs2o4EeXMdqs0qzQ
 HGGYmK3x+r5ULwjiR9v0LhldxA==
X-Google-Smtp-Source: ALg8bN7A7m/SJQE8/rq4NAcWoxFVLmRsdLNGuBM+DDB/7RY9s3y45D20p+274acEuMUvztBLgx3PMA==
X-Received: by 2002:a2e:6a13:: with SMTP id
 f19-v6mr11226359ljc.41.1548683715843; 
 Mon, 28 Jan 2019 05:55:15 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id a2-v6sm3050503lji.13.2019.01.28.05.55.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 05:55:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] mtd: afs: factor footer parsing into the v1 part parsing
Date: Mon, 28 Jan 2019 14:54:47 +0100
Message-Id: <20190128135449.15555-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128135449.15555-1-linus.walleij@linaro.org>
References: <20190128135449.15555-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_055518_177078_BFBB1FE4 
X-CRM114-Status: GOOD (  21.84  )
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
Cc: Liviu Dudau <liviu.dudau@arm.com>
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
