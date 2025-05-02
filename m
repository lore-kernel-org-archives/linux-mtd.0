Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD602C3ABAC
	for <linux-mtd@archiver.kernel.org>; Fri,  2 May 2025 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8KBXizHKqHng3tJf5wx7O6F0deoFzg012JDGmLDD1NU=; b=MxHkvnbh1bAqb2
	NJ7JAC925I53DaIm1Ujlfo9UFS/M1iOL0Cy2uKwV8UnqGzXGDv2TMCxcJBgr5E17EzKpJJr0MTpfs
	KJtt9vZuQgW0FOxHI0/GA7u5x/ipU12xvchxypZTeLUyS1VfqKBG8bcuzbmcSR/691Ie7hjfD0nxR
	uGWL4EEuSPHvQYkcK5gCH4PPJ4FByi9IK/bAtLTEo6RMYp2QiMjaD5gROtzqww4neQzGp/pcyTWBp
	tOP3iAu8Qz6F4sOLkWGMC+4vtj25Ppq5dXkcm++ZjgMOnAZwQ7bc7JhTV5ClDYZoDZlENF40DFMhR
	bSrPZ5o7XH/J6T55TEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlvl-00000001DBA-1ACk;
	Fri, 02 May 2025 08:39:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlvj-00000001DAg-031R
	for linux-mtd@lists.infradead.org;
	Fri, 02 May 2025 08:39:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39bf44be22fso1241764f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 02 May 2025 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746175173; x=1746779973; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTp1n3CXi4d/IkYoP7iNGIaUGP0jg9QVzJw7i5UhA5Y=;
        b=FTifl3c04QbLhauVLOccgWK2y6/KcDYeN1LPUziVGX6bGQsNnKGxMTxsWDOjTOfNlY
         at6p9/BD+OMV0PI3rRHM/xsclcC0ZknV5ooo8orHFuDVK5lFK5Vh4cnGRXTl7GKxLYT5
         r9+IlEGhFy2gDl2C3i9CuU3EWWwanHpXDHMPRK5b6dDMsb5f/7YpDWX+2lRb7aPQhb2p
         z3Eu120yIYCGyYBtsM36shmXzTJrEemHntHebW/rN5c24AZjVJE6IHTTFGraq42kr1D1
         MknB1ljVDRvFX0VrBRZyrimWbqLLJFciqtnAtenyImybA3gAy/sHrXtPx1Z0nZ94bxs4
         lfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175173; x=1746779973;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTp1n3CXi4d/IkYoP7iNGIaUGP0jg9QVzJw7i5UhA5Y=;
        b=wVFg9i4p9NiMtGzfQv6G7D7MljullXgv5V9Kp1lSD61fQnb2iCpckuSa2IJ9UzsstB
         VZOAbrPD2fxHqQIYkLj10Yk3gZ5ay2zIHkr+2qvEMcr5QeNwHiiUUoQfz1js2+LjoK4I
         qlRSsvcJlDObU2/YZvZyZGUFEFKEj+EryBVH0r6QmNCKNsaa4get6NRN1JjZdB8ZZkWy
         y4JOAi9OtL493+cBw+L8JgWFWwFv6z61gKcnBc1JsvX+7wmzCT+AuIqkt3onQ8+OUXrY
         xHCsOkaQipWiCIFG60ld6csMkG4LDxPM42EoSxByBBqBAaa5OBkQvIsG/WLvJfZfgO7b
         ZeAg==
X-Forwarded-Encrypted: i=1; AJvYcCWi2uK54fv/mTrGUnfXreQBK7WZEfBOwKgzISpPK+xqDZhusfUSGZA78Xp2LI6w5RZxLivTmjjhiTk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpjJ33sXf1avZoKdu6h53jpJ8sWgefHkQFbjVCM+bDvSSDuaay
	WCefci5DZQstJ+p7bcNPO+ANHCBcwQjznpS2HyBZKkmjmbr5CzKflK7dwOJR8p4=
X-Gm-Gg: ASbGnctf2WvX4X9QuMWKBekHWF/NgWUaArL9ks6QuXt5V/eg7t0/w2jk2Z4VaGqK3iQ
	R4HHjfVFMto9RUpIORFhH8J3Zs+wH8mrQfmPXbkE3Yy15L5dUWyWoEjVaaGb6myIaoyAl5Ue4WL
	kSzf+Zq09A2JSpe2HWtgHt027fdEpBw4A3hbpNVxKo7QJc1NeNVhByaYezPi5kaeuGMURyH6qr5
	GjBn6xqBRGJi4Zg0WPTla2Bf1ik9WegYGv3gPOpC0qOADiIYoOTbMHjwrWlxaQ/oZd/QvqzxpJ/
	6xaKYm0ibVv0WlTKV83Q7LBZcJ4y/Mp7k+T8A55VdsWByA==
X-Google-Smtp-Source: AGHT+IGb74sv8hsGiSyin0BDmnbpMA2IZnPZBnAg8xwnjuUfYCPDX9NlYI/bGPAEUyHsmHQ+F3zSMg==
X-Received: by 2002:a5d:588b:0:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-3a099adeae2mr1444276f8f.35.1746175173327;
        Fri, 02 May 2025 01:39:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0d2csm1473852f8f.2.2025.05.02.01.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:39:32 -0700 (PDT)
Date: Fri, 2 May 2025 11:39:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBSEwag_ducqOwy7@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_013935_055291_BBB3F946 
X-CRM114-Status: GOOD (  15.16  )
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

The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
a negative error code instead.

Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It's hard to know what the patch prefix should be here.  Ideally when we
add a new driver we would use the patch prefix for the driver.

Tired: subsystem: Add driver XXX
Wired: subsystem: XXX: Add driver for XXX

 drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
index 6a369b1c7d86..8754bb4f8b56 100644
--- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
@@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
 	desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
 	if (!desc) {
 		dev_err(dev, "failed to prepare DMA descriptor\n");
-		ret = PTR_ERR(desc);
+		ret = -ENOMEM;
 		goto err;
 	}
 	desc->callback = ls1x_nand_dma_callback;
-- 
2.47.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
