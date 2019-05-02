Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDC3C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:34:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C91A205F4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:34:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ye5KOw38";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ifnaU5YL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C91A205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32g4R+o6Kgn45gK8Rj91pX+/5009gOMXzAIc3aIEiY0=; b=Ye5KOw38t34uAG
	z9GpcL0AePkVDPxaW0ux0lqjZSZndtXv+J3aLmiiW0eGkH42KaTCMyr+kmzirzozuoPOkhlIcp8pS
	oyxNCO3L9xPRCKyqXW0ricvFK2WwwueRvpAqFgV2SR2qi0H/QVtYbFi1r+Ox1P5ugfxBeduQ9hIkN
	j2DBwjuTEOBcTklnkVeh5VWfGYeyIFPKI9AUUhnH98iBtnuiccFxvBUwGuyFykS1wa1DLgHsADHmB
	8mjJVLOj3gK/euUGIUUqQCNIOx962w/Xc1gXkjqYCxpsJu4Y0V8faxZFZH6vOytwkjJVA28FNbYXh
	SnYl5pYoRD2WjfDJevjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCmk-0002Df-Vv; Thu, 02 May 2019 14:34:07 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMCm1-0001DK-6P
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 14:33:34 +0000
Received: by mail-lf1-x142.google.com with SMTP id j20so2068658lfh.2
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o4x2AwA/3CLBONjG7dpZpyuRhgYfsOiX68AZc6HGuSQ=;
 b=ifnaU5YL8TOetW2sEUOBvTwzLn3XYh8p46Mu3ByasHC79TnX5LkzcJYj0lrt9GAufY
 u3HCJDusK4e2Mm6O5/KFbjUpiZtSwULT/OwQzhnrFrNNFmJYxKv0jh2wcLM2Jj8Eb76J
 5nRi4zC5PpvdlrxnYgzlUfW5/aCX69IHiFKB4cY9GO12gUf8bkIVJOB8k5OqXiIzLh0p
 KLwylVzcK0o8k3ivYK9hIjlOyPSCI45Z97H4MMNMhHJFLjCB52zPoOgw6XlMZiYkor9j
 yEvN7v0P6Mau3Nqqxc33Kb1yMX4I054+mbWG13NGfOlvgwFrQVD5ZlGXxxdm3IGiKUSR
 bQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o4x2AwA/3CLBONjG7dpZpyuRhgYfsOiX68AZc6HGuSQ=;
 b=P3PmQtmt5UKkElBllVLTsBW+PsVIjHERUt6aFNuxwXhu1TN1lmCDPRIk09Yzre4nyW
 HC4HFfbLwdPhyCQkXnztsUW80GtFajv8bQrT07EBeaqVFqDAPaWwyBo0EjpgQ5PPGe9A
 3PmNt+uFyiFaTa5qqLb5z+i6WzPHSvB2POYNDbx9TGUnCS3zu+yPTwTBF9JiH0F0lESk
 9sD3CR9eGJUXaPQmHBogH7T5GS6COO8hVix08G//JhAuWQMzYVpfZKtIegCqE0tPMTyf
 q9DACVSejmKPSjs+yrE05y6vU3hI06qo2swTyFcPNi05Hj1cWl6dNjvAYEw2H4dMmJwR
 wZyA==
X-Gm-Message-State: APjAAAVqq+YZggI5PB40vliknfVS/ulYFzxqYwnjOPEcwuXYqlWj8cgk
 WFLbLIsNYPP04mFFVgq0u/w5lw==
X-Google-Smtp-Source: APXvYqyYNF2NVISrvZs20Oyrrn5VhAEN/vQ2xOGJkPL+Y2qqq1YSPllyCOmckWXpa+27OkASBtZZFA==
X-Received: by 2002:a19:189:: with SMTP id 131mr650254lfb.74.1556807599102;
 Thu, 02 May 2019 07:33:19 -0700 (PDT)
Received: from localhost.localdomain
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id l79sm9430625lfe.92.2019.05.02.07.33.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 07:33:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 8/9 RESEND 2] mtd: afs: factor the IIS read into partition
 parser
Date: Thu,  2 May 2019 16:30:33 +0200
Message-Id: <20190502143034.16781-9-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502143034.16781-1-linus.walleij@linaro.org>
References: <20190502143034.16781-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_073321_863816_86E26DE8 
X-CRM114-Status: GOOD (  17.87  )
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

Factor the IIS (Image Information Structure) reading into the
partition parser, giving us a single, clean partition parser
function.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/parsers/afs.c | 59 +++++++++++++--------------------------
 1 file changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 8ff82a548252..72c688b8a383 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -88,42 +88,6 @@ static bool afs_is_v1(struct mtd_info *mtd, u_int off)
 	return (magic == AFSV1_FOOTER_MAGIC);
 }
 
-static int
-afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
-{
-	size_t sz;
-	int ret, i;
-
-	memset(iis, 0, sizeof(*iis));
-	ret = mtd_read(mtd, ptr, sizeof(*iis), &sz, (u_char *)iis);
-	if (ret < 0)
-		goto failed;
-
-	if (sz != sizeof(*iis)) {
-		ret = -EINVAL;
-		goto failed;
-	}
-
-	ret = 0;
-
-	/*
-	 * Validate the name - it must be NUL terminated.
-	 */
-	for (i = 0; i < sizeof(iis->name); i++)
-		if (iis->name[i] == '\0')
-			break;
-
-	if (i < sizeof(iis->name))
-		ret = 1;
-
-	return ret;
-
- failed:
-	printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
-		ptr, ret);
-	return ret;
-}
-
 static int afs_parse_v1_partition(struct mtd_info *mtd,
 				  u_int off, struct mtd_partition *part)
 {
@@ -139,6 +103,7 @@ static int afs_parse_v1_partition(struct mtd_info *mtd,
 	u_int ptr;
 	size_t sz;
 	int ret;
+	int i;
 
 	/*
 	 * This is the address mask; we use this to mask off out of
@@ -185,9 +150,25 @@ static int afs_parse_v1_partition(struct mtd_info *mtd,
 		return 0;
 
 	/* Read the image info block */
-	ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
-	if (ret < 0)
-		return ret;
+	memset(&iis, 0, sizeof(iis));
+	ret = mtd_read(mtd, iis_ptr, sizeof(iis), &sz, (u_char *)&iis);
+	if (ret < 0) {
+		printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
+		       iis_ptr, ret);
+		return -EINVAL;
+	}
+
+	if (sz != sizeof(iis))
+		return -EINVAL;
+
+	/*
+	 * Validate the name - it must be NUL terminated.
+	 */
+	for (i = 0; i < sizeof(iis.name); i++)
+		if (iis.name[i] == '\0')
+			break;
+	if (i > sizeof(iis.name))
+		return -EINVAL;
 
 	part->name = kstrdup(iis.name, GFP_KERNEL);
 	if (!part->name)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
