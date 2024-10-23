Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D12D2E027
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2024 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NwDzPN/0Rya8GWV2uPb2mNgzf9Se2zxg2M+YhdfrR3k=; b=RWnR05pX+t2SM9
	gDdDW2cT3GKJp0suQJiigrNZ+g3wYSpZFGUMgqLESDIWGMMjZib6lBVr3To8tZgbp7s4KGGyNh1Ch
	VpUQ957h1tRq+7ybfCilKrrU2eoQYnRlyxzujeemEy+NbTEmM8t/7p8dSQTWoRLd8OAGzvDjyDj6S
	7pka5KVGQ5Bh88JC3tuZiAXPQhZf3e5J8V7MPhyHBZqm5z7B/0HZzfbuJxgongtKJhEnG3NuFdpYH
	JMdx0wBrrI/wkPyaFraqcmpJfLd4u/85NuKD77qEO4Xog8wN2LYsVgAJpG1J+zGkSWYwlhCbpZCvE
	KjTBEwX9mUeUr/FI60bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X4a-0000000Ddab-2jC0;
	Wed, 23 Oct 2024 08:50:32 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WvP-0000000DbsZ-0dSz
	for linux-mtd@lists.infradead.org;
	Wed, 23 Oct 2024 08:41:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d49a7207cso4739820f8f.0
        for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2024 01:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672861; x=1730277661; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OTGtBlFhpF4KfA5UaZkwNHNmAJyTL8PF0NqzCKMi89Y=;
        b=hU4AhDQj+Ypup2UZDIvFX6hkyCAvqDcwD5rymu7BPGokgHGi02PdPvKlVM0rJHtuBx
         S5gjwNHWyZq3aSo77JBAzxi2icymcPUemI5Kn55S5RkeSGpVXnsa8p8im1Rurb4ZU1H3
         PKvumR7ImsgaZN05tjtLGZfbePiE8EzO9b8AdEybMxoEIWXi559r3sHBBDWhgxc5CQhU
         DaFwiosyRA/hHHrjH47SX8kzDtRnMhAzlk34apc0NDEDZls0xr8AofPqRO2UZfdSj/MQ
         URb+vsvbf3r3DSbV3rlIPNkDEvUyyWfo/pxVD9RfJ2snpYD2CcGEh+diVENJEs+4JIwk
         m1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672861; x=1730277661;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTGtBlFhpF4KfA5UaZkwNHNmAJyTL8PF0NqzCKMi89Y=;
        b=MOQkdYfW5ZuUN9mZfgOX/RrEXhGU1/QZlr7n3cnxeKXZBZ9dYlK5KHGmeEj0FiqYiN
         TzKUZZOk3U03R5gzn0zPtQU3GN2nwhfkkuYeF2VfuFddfjTIMOAtGh5eJEVvODLDj9Hi
         xdQM/yV+GDV5TZY/s4ztZ8/D7bUrBEGMXN6bn68xfIpO33/jpIVU/ABbSjlCNvFYrhuT
         vT/Zi3CgkgKUJ1M+UdTffyxZTdKV4X9pk7kYUY+t66RNbIDJ/0URDtgbut26Tg6m+4yt
         jK29iDoygIUSUNt+trdxAVowV0kNH6ntZofvpdtJ53xOeWPjWuzhElj/75e5oao3C1F7
         zKgA==
X-Forwarded-Encrypted: i=1; AJvYcCUH9SQiXG2rjiX5M7iVCcXaglapWRpWh6BnBeWcfQ1rDfmm84wWk0RpRzkbWBAnOJCW2eoqP49MUqw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzu4YLWDxhw/YAL/aKxAsGKqR8W1o+QdeHCneCxCuuk1umw+Ha
	x6aFoRIN51Ss1c7vum1W51YPnxbOU7bCwoN/1pfwUYBsSp5KWaxX0+DG/nrdZEs=
X-Google-Smtp-Source: AGHT+IHBkbz8Gkiu8syBDS0U/jZ595MpfEdCm+s1X/ZgIeh+fOEidnPqxPO8f+s/cE9RJuzVEPDXEw==
X-Received: by 2002:a05:6000:128d:b0:37d:4a68:61a1 with SMTP id ffacd0b85a97d-37efcf926d3mr1140382f8f.56.1729672860806;
        Wed, 23 Oct 2024 01:41:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b93e76sm8408355f8f.82.2024.10.23.01.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:41:00 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:40:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: rawnand: fix double free in
 atmel_pmecc_create_user()
Message-ID: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_014103_226352_33396568 
X-CRM114-Status: GOOD (  10.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The "user" pointer was converted from being allocated with kzalloc() to
being allocated by devm_kzalloc().  Calling kfree(user) will lead to a
double free.

Fixes: 6d734f1bfc33 ("mtd: rawnand: atmel: Fix possible memory leak")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/nand/raw/atmel/pmecc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index a22aab4ed4e8..3c7dee1be21d 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -380,10 +380,8 @@ atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
 	user->delta = user->dmu + req->ecc.strength + 1;
 
 	gf_tables = atmel_pmecc_get_gf_tables(req);
-	if (IS_ERR(gf_tables)) {
-		kfree(user);
+	if (IS_ERR(gf_tables))
 		return ERR_CAST(gf_tables);
-	}
 
 	user->gf_tables = gf_tables;
 
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
