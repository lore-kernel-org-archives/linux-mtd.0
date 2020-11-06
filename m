Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F62C2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60B32087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MG31fUgi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fPUVZrZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C60B32087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=roWoVZOyisf3kP8yVLumHtLaTdS3bQKe7/mFiNzATVM=; b=MG31fUgiAFTh0CT94fR2Ax67g
	l7PcOfpDsfbbzuAyiK1FBbj5w7J1gghO+fpHc+BkETcEpK0iiY21RtW+GDotPZQvQUhl+tjH6egY4
	Gj7V2n1uFEvvm1Rqhg6idhdMFIlFET/vXpLqOuMWosJcALLSKHSZG6Ly4o738Lk8sRk+ps0cPa8ZO
	zRpkbajPbBPUESj1sCk3eckfXMd6EUJYJ+V2Eogj7201x+0dZSK5RSdx2U+xpWAQmlta6cqTzIlZJ
	YVIk58SMno4oNRKWCNRsZ1dJ7sCyTbspLpo+ij72Hlf0Q4dLZ7ilrzHjbDQXnPf73fbLGowll2gXC
	0OslbiUYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9RP-0003K0-Nd; Fri, 06 Nov 2020 21:38:39 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Q7-0002dJ-4M
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id h2so2824940wmm.0
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=agE410NhHkG/VilLjKYAizauXJMrtB10xUIGh/10Z74=;
 b=fPUVZrZJSo95eRMxWSlqADih2GCG8nwGdvu6O3QjQhQ3dpQrgZamfSmZsA6Yjfb8ED
 2F8ZiRkTUeBOXMFtchtdYi+CmlkfcCH/qy/PWfMoqXgROheKldXQ3s96xPGt+smVvpNB
 QCwEgP7PO7Qv7EyEP8rFl6KEr1nd2qBsnPQficJ10laLTMOjXfYHhNTQVBCk7N13RP8y
 ekSjri1cGcLsH6emIAM4G5ZKAik3tDSqJp/XQzk/rPaaXzZafAeW2icIMXQvaBa5epCA
 cZ/tiV5hmSSQeC5LBnb5nSnwwksMbBgAt6xVAeZ2WOLtKUaO+dUYUV/pej6/Cu9LGkBq
 YWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=agE410NhHkG/VilLjKYAizauXJMrtB10xUIGh/10Z74=;
 b=nKMOgnCs97oackwulzrGMnsE1/Yg3XMbN8hvmFP+QAwWf9HMXkwxythVnzytEKPmjT
 TQj2sbGAY0RWC7Errsy+M/u7LOVqpG78p/PfMYJ60zblKKuJKffE9SOw46xyURYinCbg
 APnkqqVrcomEeU8iDEs1ZrdrBbJ1dVUMyn56P/jSmGKONxFdxqVoHu5ME97E4q7rMEjB
 mwDZsV+/JIjfnOUAWJVgKs3v0KVMayGRJLSMneuzCz9DZPMyikHs+H8ivbr+cEBjQIQU
 KZ5APMZACTWEOdzsHo8+HsHOgmEwezZhm43g7jOt9oaWAeHbsBaeoQcNH+KgrbVV6K7b
 vB9Q==
X-Gm-Message-State: AOAM533A7qsc7BbP6nmi6h1UJH2uCCqdwt9Xywm+nbOVR1NI2Hy5gvaF
 CDnUnKE0svU2mhIPgUtiHX0ctA==
X-Google-Smtp-Source: ABdhPJyzOEuHoKw535qtQUVyuiYW5iGsQoWXMkoj85ik1O84tNuz+3qxn2olypB2cX2woe0o7qQ/nA==
X-Received: by 2002:a05:600c:22d7:: with SMTP id
 23mr1596579wmg.67.1604698638184; 
 Fri, 06 Nov 2020 13:37:18 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 14/23] mtd: ubi: gluebi: Fix misnamed function parameter
 documentation
Date: Fri,  6 Nov 2020 21:36:46 +0000
Message-Id: <20201106213655.1838861-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163719_244909_DA8FEFD7 
X-CRM114-Status: GOOD (  14.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/ubi/gluebi.c:446: warning: Function parameter or member 'ns_ptr' not described in 'gluebi_notify'
 drivers/mtd/ubi/gluebi.c:446: warning: Excess function parameter 'ptr' description in 'gluebi_notify'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/gluebi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index cc547b37cace5..1b980d15d9fbf 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -439,7 +439,7 @@ static int gluebi_resized(struct ubi_volume_info *vi)
  * gluebi_notify - UBI notification handler.
  * @nb: registered notifier block
  * @l: notification type
- * @ptr: pointer to the &struct ubi_notification object
+ * @ns_ptr: pointer to the &struct ubi_notification object
  */
 static int gluebi_notify(struct notifier_block *nb, unsigned long l,
 			 void *ns_ptr)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
