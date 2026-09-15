Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D38C88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s59Ffz1HCohjqLz+oYJV5TUI5IgKFXVF6JtXb9dffZU=; b=r2x8oDldGOlUIp
	Y7YmPF8X5RaeYMPOrcU5g54US+/QgxthupunWXzzfgy4fLdnuUm03u/++FMDKKsSekcz9sUyWfoQW
	NlDjMcizR4mLaKCSsFG+H/IrQ5dUWvZI8BIuCp32LMhLDAbvDgpLMC+673x8CTRscegidyKrCLPKw
	X6+b5g3GWIVYf32jwp/Xi/d5XjDHZzYKNnsVcDf6gjqz6jhia0AwhgLe2ddOB98HxkM7Wj3cxFbDD
	yH+Bz0477YJYl3YJQzE6smutUb7bo6nStRpT5uv6Tr08zgqM8uvSMittIu8GYc5k28wWODqkbwVlg
	FcNxHyX/N75PSRk2AunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WI2-00000007Skc-0vtn;
	Tue, 15 Sep 2026 16:45:50 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WI0-00000007Sjx-2fq9
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 16:45:49 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8633a38df87so358949b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490748; x=1790095548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvCnDXZrWO8TEYbuW/IRJAcni3hfewokDsrz8A4uCCc=;
        b=ZzWlZ0aRN8oN0R+b/Xj42shCYj9lC11eN1x6k7lNTQz2gsKKqBAnOZ8kYM4rjPgICE
         vdq2lXCTYe711wMaXmEYjejecCdKrhBbYj+9mO2uW1gYiBZaOkD7wN4V49qoQSi2Q4rD
         usmgCaE6egao/BPAPheC9Dn3MnvNDWOT8Lb8vssWd8Sm8VvT6+VzLKqtgAFZ+OP+uxn9
         wfzbTuAld+fda6TE/0V6tYG62lNowEzbVUG3yxfXoU2H3vxFp/Njbku7dpwZRzJNQXsx
         h9FEfGcd+oIgwXg6HSN2o60emY3zasR0sA48iYfrUXjV5NHCq7cdoJY6LFecPfu3+fKt
         18Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490748; x=1790095548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvCnDXZrWO8TEYbuW/IRJAcni3hfewokDsrz8A4uCCc=;
        b=KHbYWerTiku9LflRLXccaI29vYuPzpexnbWl9J9XF8Zq8LG8IhTz401XEaqpfb4sTV
         GPC8yqNfCJYAfGa7l5O3c7zEROYqzJWSJME8OO6W080d87cMYHrLSqKNTDJiI/TkO9Ti
         IoZsJH5WTqBunOXTJ0gyOmVx6Rf8DI3ZPMhZJX/zfIHaygORA4Jb8D8LpILwLn6suU8A
         15tP2XZOMh7anTG5GSvu3A03tBufXO81LW/sHMSvjJr1OsvtrYRpIswwq1/H3lrJChlz
         0xdG4YPmEsaeiITyFiPq/v4+whewr0iYN1Yd0gOd0+K6k+IHus3XGK/VLvRzXLYxbANT
         c00g==
X-Forwarded-Encrypted: i=1; AKwUvBy/URhkEe4p8q126YjdeD5JZK09yRDy8pBv7PpnnJXaoVc37budV2681g4BIQgDmgvfVpa/hghSkwU=@lists.infradead.org
X-Gm-Message-State: AFuF++lbaMMZH4qlroKzyp1tslhByZDuiL2FyLdfXb+QOJ5eG9DrNBhQ
	Z4IT/8P01Y4KPE2ZiT7JNlox6o94zeIi5HqZSxch9xMq7NuL4UwJJGaD
X-Gm-Gg: AYBFou0yunmmMRPqDElzBkmV2zes04kK1CEycc/K91vdh/aJPpunLJFCTnyvZoI9yNO
	STqf41iBrE4EpjHS6lOGKll/QHh8s9NwpLSfdxHBRxkcPaKe0p54UrVzNvB+0meECZqFU0YM/Bb
	qm6OA29u55v4+VMCXWaFWo3XQ6NhD0gOHwNXWVPMqSbqHypwe1uhLC+9NmpTP7MADw2jeq5q/SG
	2Kjf9y5sFVORGkOAaFuNJluKf1Rbgqx1FUlRC6TyRuSMubuXWZOHGNVXcocIQ+9sG2U8V8TCnnS
	dQXwmZFFF9Sqckm8Ok16fwICALojNWCOrBFwCJN9YwuqXUcn3KKAEpvIgjtLbmJFWraXOYxiPD3
	XIJsgRVUUus+uDGxfj7fZ1DUam3jaXwFlv8n/g9IGgEg87qqopUyU2ZhMXSwDuBUK5Qd8cckcd1
	v7b8lJdiOezWncqOwXHc/NQtwALRlliZMZhjC8IrAJZy71HLxndybzHA==
X-Received: by 2002:a05:6a00:e18:b0:86c:f33d:e3d6 with SMTP id d2e1a72fcca58-8717eadc194mr2942536b3a.9.1789490747845;
        Tue, 15 Sep 2026 09:45:47 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29dc09d4sm6481081b3a.47.2026.09.15.09.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:45:47 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: nuvoton: fix clock cleanup on probe failure
Date: Wed, 16 Sep 2026 00:45:37 +0800
Message-ID: <20260915164537.2496540-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094548_680352_3692C5A7 
X-CRM114-Status: GOOD (  12.41  )
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

ma35_nand_probe() gets and enables the NAND clock with
devm_clk_get_enabled(), but the ma35_nand_chips_init() failure path
also calls clk_disable() before returning.

devm_clk_get_enabled() registers a managed cleanup that calls
clk_disable_unprepare() on probe failure and driver removal. Calling
clk_disable() explicitly first drops the clock enable count, so the
managed cleanup attempts to disable the clock again and triggers the
clock framework warning for an already disabled clock.

Remove the redundant clk_disable() and let the managed clock cleanup
handle the clock state.

This issue was found by manual code inspection.

Fixes: 5abb5d414d55 ("mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 1a285cd8fad6..f659d3a6b9ef 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -993,7 +993,6 @@ static int ma35_nand_probe(struct platform_device *pdev)
 	ret = ma35_nand_chips_init(&pdev->dev, nand);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init NAND chips\n");
-		clk_disable(nand->clk);
 		return ret;
 	}
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
