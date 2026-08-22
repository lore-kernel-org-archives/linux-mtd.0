Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9963DC5DF8C
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Aug 2026 05:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zlgxt6dTmGYTv3NBEqtcI9nVWGMjXV9q7YmLjiOALMI=; b=329xiq9uBqW6G5
	Av+NZKDHFut2yM60l/wqZ2jBqHMYGu9cuC/0ygzunpeOkEQSWL4IDXQk7EAlaea7JFpg9tFgmAERM
	UDS+4UlPOciLIoKSgGBp2R1TGC8EL+nftqRZKJnJosicHX9baSVIXj0qpza2eO55nSsj+Go+fccMT
	kNC0LdX5zYbn1lb6HcRYIsSyvd+pZNfab2wGSKkquSu0Pf8qnk3JJVj3rIpY3wH8YWSFGzeozM+sf
	AOhVeE864VGUoTtJIoGY0PzvDJZshVL9gNboRwjIwYJcMxeYj2pb2j5xwceH244BLKNo5zs1eUQ98
	3iv7PWQmfy4UjjH97jmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxdsy-0000000EI9x-1AbP;
	Sat, 22 Aug 2026 05:03:16 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxdst-0000000EI9B-1kjR
	for linux-mtd@lists.infradead.org;
	Sat, 22 Aug 2026 05:03:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84e507b079dso984159b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2026 22:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787374990; x=1787979790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaKW2U+yMxpMkfu3V+tl4dxFwdr/bp4aDLEXOqceHEc=;
        b=EVpWQhkn5cQisV/eDUEESZfOJ4rz9nmgUMAxC8wZTMZwa7UVlFyJ1XEZUTQvWcz6/D
         FbsJxnV+unPhe5NA5jkbgGLiCG042nNuavKjpb5kcIMveCJuyKn3AvblNSxJz7MmxLd7
         ag5S4IOT84Al9yNheAVmq+etL5H/1/ZKTudAOMWYFqUdzQfznDWULNydMnGWV8TClOUs
         XL1gDZ+LfnyieRseEX9AWm4Z5ilMDDWVmGF/uETgNB2Dyl7taZdEWI+CWArq7wYMTuZ6
         Oyx0VaVn9bgBb+IxGLopqI4D2B04x5kMTHbKvuYmxJIw2onEmPwJYAKprRJ+6v5aTf/A
         oemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787374990; x=1787979790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaKW2U+yMxpMkfu3V+tl4dxFwdr/bp4aDLEXOqceHEc=;
        b=bRB+fwlGlBw73TAnpHetoFvtMpA9ZP3Bw3YzHmIr3TLwSM16tmYRMR0We5syuVRG3W
         iZewQvrfsz7r9I5qTIlfiKu8oOdNDGXrfe9rvFkhzpi99Vaj8Jyzmsq7UNG3AeNK6ftu
         ll8O6aT0O58VQ1cX4gsU7r4UO1MeBsQSouxfmeTny3gaRZfTad6dQErmVjRM1HdXeMuL
         Gu63ZOvvz9sALS7mZ5v+rvRHQ3U2J7lfGi+SFmgTtbUeA7lCkuAFkkkIffqEU/5b7dJu
         JRYxqAJwmGwzwSpiJ+GBQ8O236yknGxgidTZ7VLQ43JX+mBvGjkMTLsffJ8xDMwc1pfB
         QWkw==
X-Forwarded-Encrypted: i=1; AHgh+RpT5rTx5UZ9IdoSrcJcA8Z3cQsyFa4S/CPY8tgyqIUuL8vwgvx/JvOpErk8k+wUeDXsP7QD2d46ed8=@lists.infradead.org
X-Gm-Message-State: AFuF++mw0ccMDCeEaXRCS3yhV/0+nWWfs8MJqj0FGB66rR0pnGyRohpR
	8V7LVXsP7IkJZvD1/TcT5SwkQAMXHPvBQktJv6vzHEdftHgOfx5IgiI=
X-Gm-Gg: AR+sD12ImRQ+lkj3J+M4VkLQwe2M6KNA/Hu1WI8lWURjeYk+Ni/NHPAvD8Vikwq3Gf/
	MlIKCX6Ygu5Z8R8VO9878tNKpO5E7IjRtfV4+5e4QkzV+Ffa4VKtnTPVd7XNqyQ9CRDCnyZtNVg
	pksgncNkb7iU3z+TdF8R8hOhSc8hYxibSKtXn+5B/yCcDvz6tUXptLWd+LoIUyjsgBgk5jH7Tge
	/S1k1acOBlTlHAdg92TP7j4Hnq8IpHUPJY+fhFIkm+ZcYWT/D25JKIYDMZZtPwehluw+gnMma6t
	bfolFkL8U+aiMStrO2jDmsmBr3CGzNLDwuU13ulQqxcWReDJBDtX7lUenQ5hftUpdW4nzcxFoXl
	t/i7ZJVMhwepykdkwAiVG/eRX/28PhF0FjUA8WOHQsUI50qtle+egm2nxJoeOfYEIv24iVzBW8v
	4uygQ3EQEWfq2tDW7fypul4IcfBf402azMpUQ3PZ9V2XRACzUZfQkGagHXro3fGCubW7kZB31o6
	1W4mwUFaDP5+f5B+bfLTuqF+mjm7e2cguKDkp4+fTZCF5KlN8s1Qnhf//w/A6eim0xI+g==
X-Received: by 2002:a05:6a21:a49:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3cd301370b3mr22342048637.14.1787374990316;
        Fri, 21 Aug 2026 22:03:10 -0700 (PDT)
Received: from codespaces-2db70c.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([207.46.224.81])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14186183f31sm3060974c88.13.2026.08.21.22.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 22:03:10 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	christophe.kerello@foss.st.com,
	triet.hoang.dev@gmail.com,
	johan@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: stm32_fmc2: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Sat, 22 Aug 2026 04:59:56 +0000
Message-ID: <20260822045957.12511-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_220311_463754_0C36221A 
X-CRM114-Status: GOOD (  11.17  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from its suspend 
and resume callbacks, also reduces kernel size in case CONFIG_PM 
or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b176372..9f42f8ab3212 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -2076,7 +2076,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	stm32_fmc2_nfc_wp_enable(nand);
 }
 
-static int __maybe_unused stm32_fmc2_nfc_suspend(struct device *dev)
+static int stm32_fmc2_nfc_suspend(struct device *dev)
 {
 	struct stm32_fmc2_nfc *nfc = dev_get_drvdata(dev);
 	struct stm32_fmc2_nand *nand = &nfc->nand;
@@ -2090,7 +2090,7 @@ static int __maybe_unused stm32_fmc2_nfc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused stm32_fmc2_nfc_resume(struct device *dev)
+static int stm32_fmc2_nfc_resume(struct device *dev)
 {
 	struct stm32_fmc2_nfc *nfc = dev_get_drvdata(dev);
 	struct stm32_fmc2_nand *nand = &nfc->nand;
@@ -2118,7 +2118,7 @@ static int __maybe_unused stm32_fmc2_nfc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(stm32_fmc2_nfc_pm_ops, stm32_fmc2_nfc_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(stm32_fmc2_nfc_pm_ops, stm32_fmc2_nfc_suspend,
 			 stm32_fmc2_nfc_resume);
 
 static const struct stm32_fmc2_nfc_data stm32_fmc2_nfc_mp1_data = {
@@ -2153,7 +2153,7 @@ static struct platform_driver stm32_fmc2_nfc_driver = {
 	.driver	= {
 		.name = "stm32_fmc2_nfc",
 		.of_match_table = stm32_fmc2_nfc_match,
-		.pm = &stm32_fmc2_nfc_pm_ops,
+		.pm = pm_sleep_ptr(&stm32_fmc2_nfc_pm_ops),
 	},
 };
 module_platform_driver(stm32_fmc2_nfc_driver);
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
