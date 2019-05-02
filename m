Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167EDC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:34:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBAD4205F4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:33:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XQ2EP4B3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0bb27D+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBAD4205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Akef23xsONd0UQO7Q52/SwvVw9EVxKRajkd7lt7xsWg=; b=XQ2EP4B3h0Ifd5
	oAxcALmwM26dC8xLEmrtg0VmaqALZ7tMi0+PIylkWbwVOLerwK3I5orVX0iZEunZhf2LibC5p1u+t
	1mbDGNixGr4tvJpJfuQhQcv+7dlKzrZ6k4QZ2alGTOxrdlnlgE4v1icFjjyso2RYkVEIaDILSTRnR
	Ir7Y4nHQHdgLHGc6elKs48bH7RKha/iLrp+eNMFFS6hP5hbLOj2qtWIWn7r/pHZf2L+JMnoPIgtoH
	KCB0HUDiynOcTbSfC0fUypSUUUSiS3kM5YSo0WK/dppYWAezSMNGZSRO3uphwRDAsvFUgM0vq1afZ
	Ygk6U6At6l7YDDKSEsqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCma-0001zd-L1; Thu, 02 May 2019 14:33:56 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMClv-00015b-HO
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 14:33:28 +0000
Received: by mail-lf1-x143.google.com with SMTP id j20so2068411lfh.2
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 07:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKgEJ1Km5j3zIkbrJZuw9OFBKPPbAWx/j0MzNmJOHJ4=;
 b=P0bb27D+6Y0ovg9oJjGhlYW8s1jemW6BE3aR8v7PboluNO0H1h3FexJXFM1Gp+rw7Q
 UKMl1VzeoQV4LRcKOx7xLQ+BvFFHcqBKfGUpYUfrPgpul7HdWpl8v5uANhKhGkao9xLk
 o8rhKUIJKWAIK9/GJvoaxjiZeinGGQ3wvxX1HRwMy7i+F5txdekxodLjFtKCkh7V7T8Q
 F7HidmUT/T6miXxUpJ6nlaI6ilshpRxXvtu584KBXXLDvzvLTpWWIe8IqvUa9pcZfEke
 6CCdIdPHsKBHAIMdG/gbOQShE0KDyGIC1D8FluIBjzC0IQT8MOjfy0axZ/9UfoN6tEjK
 wOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKgEJ1Km5j3zIkbrJZuw9OFBKPPbAWx/j0MzNmJOHJ4=;
 b=FyVV9ieYVUKTQUcPDTB4HPBv4NqRkJs6XJzsLU2ZnGyZxzDlWm4GSxFn98IdomUMmd
 F76xB320Z9HE/1jt5fr5zb9FL6+kw3iYU6UpTKvVPMHfikP2aaxaN8P7SHWWB3wxnjjC
 fKI/a8UC+eB8Yp7USMzYKLJ9bezOy7CBEhcF/Yd8964MuLal6evF90cDtNXNX1eo6p12
 MnNWSuM0cIkhRc+Fi9wWzbacOS29pIQ4BzhhQF57AcqJGHfLbgmLviiIpXjgZcbtB8xZ
 pPnzDkrP4jiIe/+Ob68EiYmOHoBprO06waMBxwQ5heSocRfq927j2BgSZf+zvLthMVRl
 SOJw==
X-Gm-Message-State: APjAAAW+YAuqS34G2Eg/ayii0ed8bcrVl8Wp34bQRB9DOQgs+nQAXIAb
 8WCWaEyk5Bv2LYFN80JZwYgefg==
X-Google-Smtp-Source: APXvYqw2uqDR3kMOb6sytxYAy4Q48t7tszVTmTR4gHdBWoc4RZyPWSp2XGGDc1mMi1UsritpsAlUmg==
X-Received: by 2002:a19:4a04:: with SMTP id x4mr2191114lfa.124.1556807593883; 
 Thu, 02 May 2019 07:33:13 -0700 (PDT)
Received: from localhost.localdomain
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id l79sm9430625lfe.92.2019.05.02.07.33.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 07:33:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 6/9 RESEND 2] mtd: factor out v1 partition parsing
Date: Thu,  2 May 2019 16:30:31 +0200
Message-Id: <20190502143034.16781-7-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502143034.16781-1-linus.walleij@linaro.org>
References: <20190502143034.16781-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_073316_129393_F7EA2A49 
X-CRM114-Status: GOOD (  19.69  )
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
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
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
