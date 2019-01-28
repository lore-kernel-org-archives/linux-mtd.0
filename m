Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E660C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:55:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B84B20449
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ME2VQ8RS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="jofZ87qy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B84B20449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKXedS5IYS1lONMMRTD+CVJWxMtCZHZzjMP4zuhr5gQ=; b=ME2VQ8RSM3pJIf
	6SKG7mgxZOXZTv1IpUOSMyViKsZGVbRaQ079V7mGcQ+hfgZjp1IO4a+sey3bDEPLHL+ot6NTczDrH
	MBpOGsNESqgrMq5hD/6Gm9AhJETJ5KO+41e1GAcDkXq4v2jgvANTdGK+GAnyGiBhJO+PcJNkut5TK
	B4a6Pn2b6S6bIr646FgCvz6rWmhALuYMiwFcFOiJXjH90EpyHNBaz2izqZlksKV26IQbPBvsjhTth
	3y4Jkrd09tVhiKrPVobNj92lFn0afxAdxTUpZhEokeISuV5irXmE6fJ3/LJjxuBmQb2dKxKeCnfoU
	4kVSaSNVXacW0sFg5Hxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go7O3-0001I3-Po; Mon, 28 Jan 2019 13:55:43 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go7Na-0000TA-Dm
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 13:55:21 +0000
Received: by mail-lj1-x241.google.com with SMTP id n18-v6so14274056lji.7
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2019 05:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWmZxsQVuMIf2AkP/1PkW+ARHBWjvKhuF5HT3GrzPJc=;
 b=jofZ87qy0FvOkvCkbIV9gynM1Px1dX3tehlorXzgYUwOsCBJ9waU3OKpZVAlNvIrj+
 l9c0Hy9jbYNPbIH3vQ7UgaQZ3uy/HaQM7VRA4P/l+9bV8wG9OAsNy/WUJNWFdzdpy5/i
 cLJZSM2tR235N9vb+pzOhnEYzWLGNjnAOfSxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWmZxsQVuMIf2AkP/1PkW+ARHBWjvKhuF5HT3GrzPJc=;
 b=j/uHDYlgbTbhJbCDdaOyJp5jZhzxWhdaHVXkI2Al3JN6zykjccnjO2XVyPwecX08RK
 wralcoeeTO5nRZmvMoJWmcOZ1X0YXLIs7jd8HRekO3gBsbGtFWOMxgR1NDD4jGD98n9j
 9TaKmqyTBuWNWX+171kdvqu2bzLwYyG7wmmgSuztvwbrmqLD3hSwD0iGxs3eHLut+zBW
 7Od/ciJg4jWKA0QdVgn8tREt1S31iBSaomm4/XndXaEUQb4fex27NbOItEAxEt/NZbmQ
 GlaxaogxixQewfrMWoFCo9UuTB7SRAmVbW80riq+Gs8pL5v2VOcotjJ1PsNNBoSb1qW6
 DsrA==
X-Gm-Message-State: AHQUAubPI0rEwrrfaXqp749kGRDRTbcOqk4RCvD2ePnjj9d1AbxGVezp
 sHVe/S6q93cFZ48T83ByS58FyA==
X-Google-Smtp-Source: AHgI3Ia2z/1DyMSUiI86tmxlqH+51skPqyaIohc8dKHKksLtuyYPuAx9gdmssoJn6hvWWIZnlU69eA==
X-Received: by 2002:a2e:8786:: with SMTP id
 n6-v6mr6574348lji.100.1548683712405; 
 Mon, 28 Jan 2019 05:55:12 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id a2-v6sm3050503lji.13.2019.01.28.05.55.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 05:55:11 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] mtd: factor out v1 partition parsing
Date: Mon, 28 Jan 2019 14:54:46 +0100
Message-Id: <20190128135449.15555-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128135449.15555-1-linus.walleij@linaro.org>
References: <20190128135449.15555-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_055515_006450_6D9B9DB5 
X-CRM114-Status: GOOD (  22.22  )
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

This breaks out the parsing of v1 partitions so we can later add
a v2 partition parser.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/parsers/afs.c | 88 ++++++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index ccc198818057..32ded91ae66c 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -181,14 +181,18 @@ afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
 	return ret;
 }
 
-static int parse_afs_partitions(struct mtd_info *mtd,
-				const struct mtd_partition **pparts,
-				struct mtd_part_parser_data *data)
+static int afs_parse_v1_partition(struct mtd_info *mtd,
+				  u_int off, struct mtd_partition *part)
 {
-	struct mtd_partition *parts;
-	u_int mask, off, sz;
-	int ret = 0;
-	int i;
+	struct image_info_v1 iis;
+	u_int mask;
+	/*
+	 * Static checks cannot see that we bail out if we have an error
+	 * reading the footer.
+	 */
+	u_int uninitialized_var(iis_ptr);
+	u_int uninitialized_var(img_ptr);
+	int ret;
 
 	/*
 	 * This is the address mask; we use this to mask off out of
@@ -196,6 +200,39 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	 */
 	mask = mtd->size - 1;
 
+	ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
+	if (ret < 0)
+		return ret;
+
+	/* Read the image info block */
+	ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
+	if (ret < 0)
+		return ret;
+
+	part->name = kstrdup(iis.name, GFP_KERNEL);
+	if (!part->name)
+		return -ENOMEM;
+
+	part->size = (iis.length + mtd->erasesize - 1) & ~(mtd->erasesize - 1);
+	part->offset = img_ptr;
+	part->mask_flags = 0;
+
+	printk("  mtd: at 0x%08x, %5lluKiB, %8u, %s\n",
+	       img_ptr, part->size / 1024,
+	       iis.imageNumber, part->name);
+
+	return 0;
+}
+
+static int parse_afs_partitions(struct mtd_info *mtd,
+				const struct mtd_partition **pparts,
+				struct mtd_part_parser_data *data)
+{
+	struct mtd_partition *parts;
+	u_int off, sz;
+	int ret = 0;
+	int i;
+
 	/* Count the partitions by looping over all erase blocks */
 	for (i = off = sz = 0; off < mtd->size; off += mtd->erasesize) {
 		if (afs_is_v1(mtd, off)) {
@@ -215,38 +252,13 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	 * Identify the partitions
 	 */
 	for (i = off = 0; off < mtd->size; off += mtd->erasesize) {
-		struct image_info_v1 iis;
-		u_int iis_ptr, img_ptr;
-
-		/* Read the footer. */
-		ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
-		if (ret < 0)
-			goto out_free_parts;
-		if (ret == 0)
-			continue;
-
-		/* Read the image info block */
-		ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
-		if (ret < 0)
-			goto out_free_parts;
-		if (ret == 0)
-			continue;
-
-		parts[i].name = kstrdup(iis.name, GFP_KERNEL);
-		if (!parts[i].name) {
-			ret = -ENOMEM;
-			goto out_free_parts;
-		}
 
-		parts[i].size		= (iis.length + mtd->erasesize - 1) & ~(mtd->erasesize - 1);
-		parts[i].offset	= img_ptr;
-		parts[i].mask_flags	= 0;
-
-		printk("  mtd%d: at 0x%08x, %5lluKiB, %8u, %s\n",
-			i, img_ptr, parts[i].size / 1024,
-			iis.imageNumber, parts[i].name);
-
-		i += 1;
+		if (afs_is_v1(mtd, off)) {
+			ret = afs_parse_v1_partition(mtd, off, &parts[i]);
+			if (ret)
+				goto out_free_parts;
+			i++;
+		}
 	}
 
 	*pparts = parts;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
