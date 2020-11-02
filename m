Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD368C388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:12:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41693223B0
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B0vy26BG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ULCWvdpW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efDkt69i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41693223B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=roWoVZOyisf3kP8yVLumHtLaTdS3bQKe7/mFiNzATVM=; b=B0vy26BGzCab+UndiAd2c06FU
	mqcJ2PgwwOJXwQppuSxmiRgN4v08NGGcyWoyZkQW8Vx2Qun7x3o0MoU6u4a3E4lKYKV+F27unWhM7
	+S0ursqZSzttDoI8BdMeGot7e0UD/hiGELEoUAN4dFJiMKE1mYWoz3bHOJ9vRAcpIyDmIsDqkqKCk
	ZMG3GQiUvv1CThvZadAvLZiY6WSEmYC9s1XmMhh59AdgRfyRErPiq94zbHBC9ffhsa+ucf5gSVewy
	QO/23i3muZltewDwJYcvQ1XDbz3Y33uIEGiSkH7o/CZv4UTmsdERnGQ4WlhTNU7bLUdg+KS5GvGiI
	lWkpN2KTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYgu-0003y9-9N; Mon, 02 Nov 2020 12:12:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYgq-0003p2-2U
 for linux-mtd@merlin.infradead.org; Mon, 02 Nov 2020 12:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=agE410NhHkG/VilLjKYAizauXJMrtB10xUIGh/10Z74=; b=ULCWvdpWc28rpZV50Me4TTkZxx
 qr26OofCi8GL3BEGOfniRMkkpBHZmUU4CHnGuXHVDZW/KxX9iE4DkG5yYw0gYxL0PJN121enFCPTC
 STh/tSKC8QRu/vXnQK+oNDmLf5mqwytlE7/bwKRYQ6YW2pgJJCvTnfVCcR+vRoTstMkHMlfS2z0TR
 GNANXI7NdbBOoQQrrwapFDeRiWHD9f6onaNdvJ+oZQy8/Or2huoBXoRNN42GmkZhNNhHxCir548Lm
 As81BdVuRF4BiwVgc8sDhRBWA7xrx3XflylA2Z/PFWgvmdgClLELLF4waQ6B12f7UbsoqCsQsqTlu
 v7qiHXKg==;
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPw-0004sR-IM
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:47 +0000
Received: by mail-wm1-x344.google.com with SMTP id 205so1466478wma.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=agE410NhHkG/VilLjKYAizauXJMrtB10xUIGh/10Z74=;
 b=efDkt69iAXIfaFShsw8QdN8pMdlUr14fnqgER9/XWjM85qTpoLusGukH1GUpZoscQR
 2xzVomzsolZiM/cbJD2su7dGPNYjJIy1CpfOLwpKh6C3avFQzLVJxUsMif+2EoumKkg9
 qZ6x9zOQ7axeibb2gKvbLzzyP7ITWrBtWEdhhf0ZIbuI/ky0aK5diuxkjJtY405VPngU
 qbKmSEGfaXJsn4B/LeAbws3mRDGAK/uiUkXdgLgNepay+avLJAbhbj6IDJ1tBCQN26Z+
 ft+Ic1S3BNKvYLOg32UFxsHOkIhJaIk0gdBdgCLgDWjR2im3npYFNFelsQIPCtS9FuVy
 TntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=agE410NhHkG/VilLjKYAizauXJMrtB10xUIGh/10Z74=;
 b=JL7eUoEq7AgWwNGl50Pr3ILX9Hw/nRltKj4fKGYLdJp8VhnCkwp1YjT3+4ivhwM926
 iZKy2EscE6KMfOck4Q0vAjP1/3e503j99ayiETauNsc+D34aYg5lcKvvX5Bx3XQ0yny6
 4b8xU5x6LX2WwxB6bycaPB38k05AZjMrINfKK2OjQnImHIq3z24myhDNBij/hFHZe1zL
 OER+Yc9VKamSKHbKE9oli6aCUmCdxm51U2iv7aPOEhiXHX6hrc6ihKnpBPYrpNbaZltA
 +XdpD769j31gWjg/ohGkrzzLOKh7j5YwhMVZq+xgu79Ob5/OIaYjofU7gSOrKqykPMrI
 Bg6g==
X-Gm-Message-State: AOAM531wsnrHgcq+xeiDcmKgwWpVulaxwkN+XjbrWBkK2S1Dm4na049E
 7BdZ2+z64GqZ0KyqytiA9eXz5w==
X-Google-Smtp-Source: ABdhPJwbjEHHr9F/MB3xAbI8XwcE4zqRABiYKvggAy+sYEL/4jiPJ2Srwe7vzWC7+ZG2ZhZubwUXfA==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr17324424wmc.8.1604318071129; 
 Mon, 02 Nov 2020 03:54:31 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 14/23] mtd: ubi: gluebi: Fix misnamed function parameter
 documentation
Date: Mon,  2 Nov 2020 11:53:57 +0000
Message-Id: <20201102115406.1074327-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_115433_503609_1FDA2624 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: Richard Weinberger <richard@nod.at>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
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
