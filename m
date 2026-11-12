Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56C607020C
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SKcvRLb+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AjpughZD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpolscxk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mzylaEQ1dNkH3rc81RKB+cKSZXck2K4S25Y7bD2yiio=; b=SKcvRLb+86NJdiVPiL0RK4LOGB
	xI+Fnf7SjAqwu9RIR/Qnn6AqjXXTfVBuDTJ9sQPRNLTo6jgQmO7SDIwebqmD2ujKeUvtZPNk5obd+
	vOcPiK6E9JbypmhZMVkXMsG6SuSpND54ZSys73GeQ/fAuEdStJn/82T+MF5ES2RMEeoLBoKMA0ghH
	vlmdbnSKi/pYm2yqvd4HHpfMRkz65ACZn0+T7zELtmfi3Ngp21c3L45pTv8Mf0+Tn1E43/dN0a11C
	M88DvmZ2zM65dVTaPQO5qhUTgxyeFbB6OuhN6UDW5/ti4JjI/L6rFGNbrrlQrd3JqQDGtnwTnp/5z
	MKqJxrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcp-00000008MHC-2eHN;
	Thu, 12 Nov 2026 01:29:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcX-00000008LlV-01Id
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=; b=AjpughZD7RTnIF6CN/iwdTo/BK
	nWrrbYCufP1nJmJwjzZ6hXe6vmTZqm5agOx8vjBAY2xptZUnDB00QHbfrGshzLvUyiH3Ari9gEvUa
	pbQmjJYGCfC2S9A5gg5fXAFymyhiuB2Z7iLWabPT6kVIsSRsjjXfpnJdCaWTqbsy1M/4wW+YwiCUj
	M8dhWCWsaLCe02V+k6QWBeSW+07jkIkc5WrXsKXEG5pkpurgbRyqDPKqwvpJGvbjdWC3ivUbGHiiK
	bzKtua/EWVKkN6Yi+rhQyj90la3s97P7HSeMXjLPwLhq699u9UrGMFB/wYupCwmtGyxAUEy873/G0
	ijOmQFZA==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcS-00000009mjz-1tWP
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:55 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4b28d7c729fso2411016b6e.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446930; x=1795051730; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=bpolscxkhXoAsAZor5lrqtyo8ATl6vL1DXdSnBcYNjs7ZX+2HrcGsN0xjWJwWHZose
         ov5oxGJCJK6b/3koxlmO3xC7+4JR6IwizQQs1AfxkWcLddv/d8Z9gQJVK8yEhz63rtxN
         59D03IK+8tX1BXDBcre/oI2Oj87lY9xjCWWQ3mA4I3nejO0icLyqQMd+WhgP2a4vGDSP
         IPqWi1r3K6/kSDTxWBmhoR2BoHQFBZ9QfJhiw/O2SJQvZameSMRcmC1fK1rmY5iG5Clh
         ZU9B+0Fxt/XkMH49unrMW2u6+pD41hIDHxkfW0UMe+WXyV1wQkw6sLXaH2LMZldg8IbO
         yVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446930; x=1795051730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=yVnrfYP20Vb++Nn+J7BzAwndUT1Ah9+LYK5UPC2vrb+uHO45b+EJj2elFOtbqeQIUA
         /4ymhqxTsoozitQQQngTF4imSpKM/U0/WDTBNoRXS9clW8G5OwssZyH2aWCyYaUFhYNk
         nXb8shH4OQj5JJZtXqxipmSQ+mOWBOfYmRnx9OyUw1DfjUfKPsuywwKguOsZMmpSAObm
         i4G4phAYTlYeIzAUW2gOJ0SFGo7sOCvnMn80eo6i8NM4c+V/Pc6LSedAWHYA5qJ6BgfW
         58vffSqy0Evx6j9DFAY6oYlQnxb82cWNjs01mrU2ATLZAsRpxSwVW/MqrAbDY96aRKRY
         zl+w==
X-Gm-Message-State: APuU4Z/vAuAZc8cZnI1AczPEXNHePFYSwSdzfDrpTvfRGJrdQXt1+3ag
	628jAyIlEhyUm0/4FWnjjQXl6LMNap+noD3agDhSx8vlJLY89wI4ToJS
X-Gm-Gg: AYBFou3LQvR22tsJRrcrePLqbXksw0GsuZmB0UW+nXjs7wrp8WE+ndWSDf8zYTc3hGu
	l4VoQMy3HTg0hlhAgSE1EY8r9eP7xtZZequY/fYbqJMw/YmSruiQj3GWGaWqknEV7SQR71LquNc
	RW4e6uesaWdZLV/ye4IJ17r3hEWO9+r9QIaABjXGdNbMDq1v+k7usa5KfMk0qp5WeMvdh0BStKq
	Rd6lgZclkSiU7mRYqL/TBulCpN8FTJ18uAviJHditnmZzzxjFMCZCDeCOc1TNZFJZpQJaF81+R9
	YUYbh8/LRyyW0q67ceRxXKPOel9KR0uKEfOiTjPQ12Gy8eY+LxqTrIcjYRdhTNX2MMlC31Vd8xP
	PjjWNmGiUsoskB522lHY9u4P+Nu817fXmhFjy4r8nqzR0Co/XqPBCn6doKOHhp4f6hCC6qGCBDk
	S/6GiZOj3+82D94sbQKjDdpWSWVx5yM69I7j8GDo7LySsUFs5jaeeDjRa6oMHuN5yYn942veZAH
	Ca8P10YoMtxwjO738NzRtf0Q17ea/plWZmUXVtEU4KYt90ZIoGsi/x6Rj4RrNr2IzTRqnJRDMyZ
	Eb02/ntqZDHomCYJ7Nmzb7kLj7xFgB8SwOdFC85D4sGq2suG6LvzCBTcha04B8jxggdICDtYIZo
	THOTSQHVECRH9p8WEPzZ0xvmby6CgEw01+qxmQjoY8t3zbCtsMyLz3qYviXJwneBbAxMLU1Un59
	9cbbSauYuWme+mE8tqzZsGHmP1Z8i+G4VdJDEc6idpwUhclUj4qDP+
X-Received: by 2002:a05:6808:ec2:b0:4f1:9d5b:3113 with SMTP id 5614622812f47-56b98c18b0amr3223347b6e.67.1794446930074;
        Wed, 11 Nov 2026 17:28:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:58 -0700
Subject: [PATCH v3 19/58] mtd: rawnand: orion: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-19-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012854_073018_4344B70D 
X-CRM114-Status: GOOD (  14.75  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded chip and its copied name through the shared
allocation.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 2a1dba2931dc ("[MTD] [NAND] Marvell Orion device bus NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 6cec25425710..1b1cf3b31fb3 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -106,15 +106,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +186,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_lifetime(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +209,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
