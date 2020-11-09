Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1531FC388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AE0C206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j1uLHhfP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4+xXsux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AE0C206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=roWoVZOyisf3kP8yVLumHtLaTdS3bQKe7/mFiNzATVM=; b=j1uLHhfPjwzlod5SJ/sE4EBvH
	kbdZPZSuztz0Vk4hCT4q5RMJm6FIDgycQNhDP8VcJmKwMJpKpk/5TZv1pETSLGg42juB2+gG8quBo
	IRCE0nbAaJwTcp7qvLgVS4PvVjDd2aSbm0TWp+ObSxKSULV83lmNjQDlNvENRL4mbVc+yioxYKcVH
	UNcwgRdSEo3Xr1x4t+9kclDHdmSWIhLNyqVY9P0BiuN6Lrxw6M99urIx0wV9Jlkw8joEJHZacXj/o
	hwYP/k5IiZaJQjL7cAy5OMo7kfvNDZEox8qCjX5eC6o1hW44+KZcn0BWnhZFj6jF95wzXgqQi6RO7
	lZAPZmRqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBqX-0001wA-OL; Mon, 09 Nov 2020 18:24:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoP-0000w1-Hv
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:49 +0000
Received: by mail-wm1-x342.google.com with SMTP id h62so380256wme.3
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=agE410NhHkG/VilLjKYAizauXJMrtB10xUIGh/10Z74=;
 b=Z4+xXsux0cuxaF0X0CxSUo3a337YVpcYhtV1lfsrsLYeg+rP4mBKxEDnfCcV32WgQs
 nwvFDV0UVswNzv+7k9HnNM9G42WDu95sxlT3VuXoi73XDGB9l7A3Sd6ny3gvazveNwCa
 9BF3Lm8IbmMKQLvBRIrW8GctWJWfoNTZslH//t/ip+jPJuTZwgO/3BP+dNUZz1zwdUO5
 D/3nfNGkBbHbn4XHeEJB2/HS32axERrHMrMitwM8hiYsiwk/osob6aQ5y3A0A8JbCRMG
 D1Vg8ROq/Fn28PyM2WXP/DincnC/LRQ7WGSGhTWQbp0J9f52aTUCQGArOWmWLceSZENc
 /KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=agE410NhHkG/VilLjKYAizauXJMrtB10xUIGh/10Z74=;
 b=aZn79JA3w62EVvML36IY3w0yWNt6oq+xDWasXX9l8oDzpNoo2wjBvbTl1VyAka4ycz
 I91PGao1RImVDG+IbxN3a7mS++OUn/1E0WbULY8FbRBkEXRy2Zp1/R2dwYq9X6ppKnwG
 657F6c5PpWkw2ASkJ5b0XKeLo/m2sb0/DlKVm0/yeuUI5ILKeIZB5o9SUga7d6E82G7x
 opVvhFvkl8eJ0z3UjDcg/RR74974+Y0bjo6lQifQ+6xUGugxItBXZJwNI1eZsk/plmuL
 k1FBY7aYcD17d1JXRS/zp+JO4vVbKvmGYVzLVCm337lNkJmIEHOXJa11XCg9mfFT4euB
 7aRw==
X-Gm-Message-State: AOAM533NEJg1g0pEEDkw/V94mxuXFvkJDVvHjrWHTAWsqgDihRb8w72F
 av7PKMpW7WY8hoL4w2rVDWwolA==
X-Google-Smtp-Source: ABdhPJyw3u7oovt0s0+EZWOET6iA5NhMchu1kRYIDRZYcKaCmHuKTbHQTjEihlIA9JdcEXKzNEVNSw==
X-Received: by 2002:a7b:c772:: with SMTP id x18mr445117wmk.185.1604946160461; 
 Mon, 09 Nov 2020 10:22:40 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:39 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 14/23] mtd: ubi: gluebi: Fix misnamed function parameter
 documentation
Date: Mon,  9 Nov 2020 18:21:57 +0000
Message-Id: <20201109182206.3037326-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132241_635850_6D1B5992 
X-CRM114-Status: GOOD (  14.97  )
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
