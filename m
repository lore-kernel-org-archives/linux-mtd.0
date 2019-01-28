Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E03FC282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E37D20449
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIHOBKt3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FcJNsc+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E37D20449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pNKEvb+zIK1zzkJPdwE73I1GcIhybBR4Tz+aLFuKK4=; b=pIHOBKt334edFo
	w+5EivmzVe14ajI6O+7MkWGivX2cZtFoGecUaLFnGG2Vp2O3X+63YDktjetzVUsB2GyXKnMLbA07D
	+Mn53HdrrOEoLDLxnqnc1NrKE7O/GHcyH7dDq+ajXr33Yqu5cykag07KTFwKauu4GzhHHm8G1LwoV
	kkI1YcmVM6MVCt/Yb3dc8hLaTp0wzekobam0uRDhO/FFMU1xW+SC9DYzL8+oTCfi0pTTNjNE6P/mg
	/pNgRD2in2I6oEVixS9x79FQfToLQ+cbx8dyrF6/nuviC9MK6O3+TGR0vVVj4k/266eHbGbp4+GjZ
	dCUagkf+w7bGKcJlkqXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go7Nq-00013l-Ml; Mon, 28 Jan 2019 13:55:30 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go7NV-0008UU-Q8
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 13:55:15 +0000
Received: by mail-lj1-x244.google.com with SMTP id k15-v6so14264501ljc.8
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2019 05:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rK8cIESwiOWv9aGmz6Jj/RiNPyMVDDtZglSyhCaz9xI=;
 b=FcJNsc+16HPm8u7fBLdGIfnyu4j5eGMs7ipFBAsPOk9wkYodNbRAdv7tF1dhgesTGh
 SlMQmeEehJoF7Dh1BVZsPUwAGtzftskeSq0pfzraY+MFh16qiYXd8M32wKoSP01zfH+T
 mj5R25Wu4QXBE2L1RtktZI31vwwwAv2dVgMRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rK8cIESwiOWv9aGmz6Jj/RiNPyMVDDtZglSyhCaz9xI=;
 b=mWiq+mldrznS0bN2/7B3idNfd5ex3+szBVvzK/281lry3FcYPN2o0g9yqfmwyHs+b4
 do7wO5Gw2f+9qhquxgidjDM9q+zWSrle5+wz72lcWX1wssHU/etYV2xrFuRStbHRplyb
 o8Rfuom8s3YfJYE2CiDN1hvcp2y+5IENqhTB1jvfzeCMsfkCUEztXw8nZCIPt6syrXm+
 Nq+GyKPmpUboXOIR9HjM7G9LT7RYkLieRXQwr74n32iiijBrXTjyQgyKwGqPbzxKHETF
 K8tCdn5836o6BPKnX7jVa77pfh0Y08jZHUb+9VuRk3dI1lgVuECWcFBooA3bVL5Cu1Op
 4ohA==
X-Gm-Message-State: AJcUuke3PTY+ZtKejp9/LLycGdkqEmhIGhsAwe0LgrdMaqrhtWyXbMqe
 BKfagVi3dcPFYWaKNaAT4cQVXg==
X-Google-Smtp-Source: ALg8bN5soItK2sixqFIOrt/+OiXysrlki/WPEboWEAYdmp56jPacjhd5pXeHbl0n7b8gLBDsr1yrwQ==
X-Received: by 2002:a2e:9ad0:: with SMTP id
 p16-v6mr17828699ljj.102.1548683707792; 
 Mon, 28 Jan 2019 05:55:07 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id a2-v6sm3050503lji.13.2019.01.28.05.55.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 05:55:06 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] mtd: afs: simplify partition detection
Date: Mon, 28 Jan 2019 14:54:45 +0100
Message-Id: <20190128135449.15555-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128135449.15555-1-linus.walleij@linaro.org>
References: <20190128135449.15555-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_055510_272338_5570E7DC 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: Liviu Dudau <liviu.dudau@arm.com>
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
