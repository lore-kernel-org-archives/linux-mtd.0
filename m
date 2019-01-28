Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4E2C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:56:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2CCB21738
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mDqDX3Md";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="NjnkcihM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2CCB21738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93fWBYsnQGgybrfRnUMaHX7XQkIq7KE1E3vcEzzSrd0=; b=mDqDX3MdFHmi0t
	qsybhq41M0OBVcxWoWWtpdOPKY/tXCJkMDxYBh1jXZA7fXCzXsWv1CoxTBD84t+MAhzuRywoFf9fI
	gQXYaGHzNpXPVlrUtloCUnYYeIDO5AGN9qdEJFE3vq0G46t5F4RL7k347Ot1SynQXw5kcNnMG6xgP
	k5Jjo7/rd1PADGHPTqcIQOh7isbPcC3TdFgCfknsvqU/dLB4SHU5gim0btPNO0BiVoW4OZ1EJG4aa
	umJlSgp5p2qpfxht0z2Ao0cGf5rt4aT585/lDdGfblkCE9lGSR5JollD/HQZEDpC8qA2E4ijADoUf
	V0ElLk7qAfgPT6LBcnZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go7OW-0001lN-Nq; Mon, 28 Jan 2019 13:56:12 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go7Nh-0000sK-AW
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 13:55:28 +0000
Received: by mail-lj1-x244.google.com with SMTP id s5-v6so14245666ljd.12
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2019 05:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m9CK2FIaqX5ahLo+vJZ7bZ0fFWNyscRpfdYobu3qH8I=;
 b=NjnkcihM6WybI/+gOLacqjiy7inKNIfsfldgKk4+pRQVloWJXFVm3eMuS4Vx611Nfp
 hHVfJSwR3u6d+PQonWLaTo9rW4a5obBL/6coOHz88+xqWIcGSCT7ev4w6eR54tSMfHRi
 Rl1ZcI7sfWAuR8/q9VhUjmSZBa1aQOECtnl1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m9CK2FIaqX5ahLo+vJZ7bZ0fFWNyscRpfdYobu3qH8I=;
 b=Ed3fxsk8BPzronzEI7+qO+Xzsv/T6UnCiPHiQhsditvc0cVN2QEq0mycAyjoUMEx5g
 g3p54VeqYM0pY2JJ+Xq/enrPUHJZQGK3vaDpPl43v6cSGyoOgNqM4jI8EG7Ptz/W6vst
 rFg4B85TfdSKNgL9UmSKBIYXGN2fTXBhEcfE3F75yZlyHZPG+sVvziMIAYwFojS8IbDw
 9p53CyQGAtoE2xZgHA+vafjdFHU3jlGxYmmKBs+2jSRgP2xqztOdmWsRfriH2wTFYlwz
 1a9q7mWnxrorgNRY2vGIiqk7K+5OQ9ceLNwebYWdWtXfFlI6meZIcNCLr7ZNw8JaSt4A
 XUHg==
X-Gm-Message-State: AJcUukdI4JsPYYgojSSOM6VndiGHcnYvGEWR1CXPAg6YpJFpChQ57BQd
 zYPyuUT0KD9gsqXyztLQs942vg==
X-Google-Smtp-Source: ALg8bN7Wz+K1e0nc1BrFw1niFC/zgEvUENT9GPGTUmFpCchKEAw+lyAryE73vQP43bdM/loDteAMHA==
X-Received: by 2002:a2e:91d1:: with SMTP id
 u17-v6mr17513569ljg.160.1548683719439; 
 Mon, 28 Jan 2019 05:55:19 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id a2-v6sm3050503lji.13.2019.01.28.05.55.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 05:55:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] mtd: afs: factor the IIS read into partition parser
Date: Mon, 28 Jan 2019 14:54:48 +0100
Message-Id: <20190128135449.15555-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128135449.15555-1-linus.walleij@linaro.org>
References: <20190128135449.15555-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_055522_299287_98FE6154 
X-CRM114-Status: GOOD (  20.08  )
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
Cc: Liviu Dudau <liviu.dudau@arm.com>
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
