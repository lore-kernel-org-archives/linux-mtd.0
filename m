Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13555C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D53DC205F4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Um0G42aD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DkSmuAUf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D53DC205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UOE/ebYlNAKUixyLRrSJG1boZv/VLFf9EVzAPVs7Is=; b=Um0G42aDQRqqyG
	JIFaZhsBuPTLNEea+gfjCHNkODtmG+siyFhSnRH+eduRQBSxdzr0Vacat3/Q5hfY2P9MYwI2Tzc+d
	KLDqhvmaBm1tO5P2w3a7o2Y6NSkoop26sZb9qUj83RSMr6O817ip6voR8xhdc7q168NZGf4RsjLkO
	ZMt94dx+K+aFQ+0sRWDQCOhdTNzuxRsygbyQtvVLDkHodGCzPfDIpQ4w//HbYj5vkOIxKoYJgc1XD
	jNEJz1G9rtSTRD+xKBFAhdFjotco3w0Ku2FQJYdxArd/ZZywqYZb2NLpcH5jbVvGCQ/vQv6bCt6Rx
	X128oli8k1kKVHyin9mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCmO-0001jX-C4; Thu, 02 May 2019 14:33:44 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMClt-00011p-2b
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 14:33:23 +0000
Received: by mail-lf1-x141.google.com with SMTP id n134so243372lfn.11
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JN8+FUhBHB+3KhRg/Al6vKCq53Lvs7UOlgl2J6s0o8c=;
 b=DkSmuAUf6UysBxChIOAZitWX8KvzTXGVRHjI1Cn+DcMK3PIAcgaRE2BaYDogakUSY+
 Q/EpdVqu8x2dit4MCYiu1n9wFahR0fLHKQaNpt1cJ6htBVOeWNRsgEIHCdgSuEekRcrS
 cNoWwY69Ha1cleBCn/v/eTUx1Is9t6msPa4g+TS/1DfkkQPV9vMg2mP0eXMhgh9AncVE
 8TlaZA3V5go4dS853VnJdqtmstDFJW7ptoB79b3+pMR/v5GPKAgAHKoXWPiS6H2gSFz5
 EMrfYF1wKe//UgE5rqhEWl/hqSbMvs8KHMpwRs/qpiVJKPIW5KYb2wR61bvKn/C7RnM0
 U2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JN8+FUhBHB+3KhRg/Al6vKCq53Lvs7UOlgl2J6s0o8c=;
 b=GMnFThasiKJAYRB/B7bbnBkaOV2R+BymeaWuj9BlKbRKxw7bdn5Ffa6jq2RCB9zSn7
 r3CmBC30RyoJg2m2ZhWK/iNJZU9i3nYRlchfV8Bm07SU/Zu7aETs1mNJhC/k4o7QRUzr
 3BgfWl6wvjkDcxuZ1o5Zuh+omFoUOWPrzuuQzLs7co8gUB9U0K9INCBAz5MPUkDyKkqu
 SYvxX2KzqhD58VHnejFbAD87lrf9jnw8ufs993cfe7jhVVjlaxNUITlFP94mr7A1UYnT
 MmaAu2GLuVJ1NFxJlly+NPOjSiQmNkA7TpHeJnrgzUfi8aqMoC6yhKvrqtGxDDl5Mat2
 ZqIw==
X-Gm-Message-State: APjAAAUkRNIoOKjbt8vcsFBlAQwI2J0ovdNK3F218LipK3io4o2SRaGv
 yoket+QJ29T7YQYYFFzb/5REcg==
X-Google-Smtp-Source: APXvYqwcGwyAdBSPZW2RDazDLlhcULCKKD5VdgZxHOlCObIKCylE72oGugnwCFWApBDxy2xq6HOxMg==
X-Received: by 2002:a19:c511:: with SMTP id w17mr2113016lfe.37.1556807591140; 
 Thu, 02 May 2019 07:33:11 -0700 (PDT)
Received: from localhost.localdomain
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id l79sm9430625lfe.92.2019.05.02.07.33.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 07:33:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 5/9 RESEND 2] mtd: afs: simplify partition detection
Date: Thu,  2 May 2019 16:30:30 +0200
Message-Id: <20190502143034.16781-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502143034.16781-1-linus.walleij@linaro.org>
References: <20190502143034.16781-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_073313_504443_6200F0D9 
X-CRM114-Status: GOOD (  17.64  )
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

Instead of reading out the AFS footers twice, create a separate
function to just check if there is a footer or not. Rids a few
local variables and prepare us to join the actual parser into
one function.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/parsers/afs.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index c489938cd665..ccc198818057 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -68,6 +68,26 @@ static u32 word_sum(void *words, int num)
 	return sum;
 }
 
+static bool afs_is_v1(struct mtd_info *mtd, u_int off)
+{
+	/* The magic is 12 bytes from the end of the erase block */
+	u_int ptr = off + mtd->erasesize - 12;
+	u32 magic;
+	size_t sz;
+	int ret;
+
+	ret = mtd_read(mtd, ptr, 4, &sz, (u_char *)&magic);
+	if (ret < 0) {
+		printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
+		       ptr, ret);
+		return false;
+	}
+	if (ret >= 0 && sz != 4)
+		return false;
+
+	return (magic == AFSV1_FOOTER_MAGIC);
+}
+
 static int
 afs_read_footer_v1(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
 		   u_int off, u_int mask)
@@ -176,18 +196,9 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	 */
 	mask = mtd->size - 1;
 
-	/*
-	 * First, calculate the size of the array we need for the
-	 * partition information.  We include in this the size of
-	 * the strings.
-	 */
+	/* Count the partitions by looping over all erase blocks */
 	for (i = off = sz = 0; off < mtd->size; off += mtd->erasesize) {
-		u_int iis_ptr, img_ptr;
-
-		ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
-		if (ret < 0)
-			return ret;
-		if (ret) {
+		if (afs_is_v1(mtd, off)) {
 			sz += sizeof(struct mtd_partition);
 			i += 1;
 		}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
