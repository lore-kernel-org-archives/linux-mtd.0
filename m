Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105A3C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pljYoLNw6M9JwgBpor8rhkL7twhMgKkrogmOOZ5gNI=; b=Bbh3lQrz5dImET
	C7HPYjEJ2+sfSDG+En8zImnYROWZoaVqUIXW8ciubCeRlbNjDBpOFtl1/22y28LiVUbD5liNyoxVy
	HIRM+pvmrmkndw70B8JEIbjM9PYy81X69eyjalr6jT/ZAOQ50zwcF2s15zCW6sfYLVCCDpgYQlBA8
	apl56WZiUsuAoCIXPnJCFGk9qpzhELTEO5Bdl4zWX9U7Zeoab4YlOBTSFPV61FBBPJtXQsbvV6M6f
	R6KsWl4fssusVHBMHv3BHxzzoDYOOL7cbjR2gOi1ychWNjQgCl8+aXt6qCsRhUNlLHZK7m40lE8dF
	XPKULdlbJd2lGRRzfr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO7-00000008Byz-35Cb;
	Sat, 04 Jul 2026 05:58:03 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO2-00000008Bqv-3Abp
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1509499a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144678; x=1783749478; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mshEXDTZ0VEnwp2KN2nTQ9wDHI1nE7UH34EulSApwM8=;
        b=dfc8dztpv6J+fYqQJblmiGtcuVbKVlvPhOESaXooqc6TjSxak/yxtFjfho+DPohK4W
         A4Ndn5eEYyO1OWKZf1ffc28o0cF9QOCyQ+nYIk5ETrh4AapCtQzYVBQyUctFUgRY444S
         /K/1Wdr9ntq5M8nGZ9AykH0zRQ60ihHgKJwodnrlaNHkGGvGPQeg5rmClGk/J2ovCKzn
         zMKMQEys8tFTKsBdRpwZ1GLtS7PRPQ2/Wkc4GoLuH4BKXzhbhPcdui91UkppTU2eyrSy
         eicJbiTwE5T35RB9Q9hE35CuTitBUVWlDIOpx+KWOlZcC3L6GwxC1P29SBFGmsjgWnnz
         jEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144678; x=1783749478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mshEXDTZ0VEnwp2KN2nTQ9wDHI1nE7UH34EulSApwM8=;
        b=lJHW44sp13Ouvhihy0LdHj1DgqXCiMx5e5j0Kd+QPSSJkxGo+WfIDNmSeqAx47NiDE
         Q8YBH+T6cNb2Vh7XndvkWe0npw4UHmL/TvITo8lL2zq2GyrnaCoXD0+dKvBCSkia7kiW
         HyE19moUMxENe/33NyZhSL9Irj2cVmwNyGvOJ7d6sffz8nXWMowAUsh/Tev8xZqZjPjA
         0yfMaboYZlp0DPo24yrsfXu2pZKrvZTs/4B5jM04ndKM8g0IcJqwdbNhodHnYSsGPZRg
         AZALc537cmmIlSDWlkIu+cSNXqjbb5i/ongBKHpifmpnCfYSBaxjE5KnCr7Ss/vZus4K
         Yjrg==
X-Forwarded-Encrypted: i=1; AHgh+RqRSk7kkXg5Sd4r6GkSbr3WF2r6QqAbWbS6WnhaClR1b38p3Xk1p+WPSmBjpOshLjd16m19m5GITGo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2T4iRRVBkC3l0fewKmmTAEq9ZF5kFcoH7D4k0U/sepvYzu83Y
	u2d2mcOXZGQ4MGwUCIz9zm9sydYdFUBR20u2d0Y4UojUrMajKz3DEed5
X-Gm-Gg: AfdE7ckDmDcFssDfZUbasSiidB9n4d0a8pSAI3MolNWxVb10TR+Gz3uPbGGpZ2tNleB
	oO6CDlk5f/ieIzblf6P+YX8NzsWHYLxu+cFh/IuCiR/WRq5irVaXdlflwjQCs1Y5EWG/yltHy0E
	geT5IQhS64V8MYVYSiBlrd8XqIe2+PGL+cb1JZJGUs4r+/Sea0tmrlWh7h8o/IQG0XXQ931UnyI
	KjLMC28v/b8Ws3NSPsdw0pJGCGqGCcwQxPObx01/YlU1QKcby1A3owqhyt9ENcEvYYd0zH4KwM8
	L087ckdwKQMxDY2WzzvT4/fLoLYbyEXo6eq7JQ+UKVxjnY3B8oSTElykgVt6ZDHK3f0bzvwdlLt
	BOADPxTD1wJbK/JXg6PnIaMq/7WrJOVAE6QKJVGBlp5//Zb2YFnk1PV4XX/L42ED4HtrfZULAc6
	nvtNHzAnWkKqt8l03xteGSLkVvZsT30DDHYt1yvBtznmovKksExfmQfFalS/GEiYg1N1bCgrMjr
	a9uedJb2vuDYw==
X-Received: by 2002:a17:90b:1c8c:b0:37f:9ce1:cda7 with SMTP id 98e67ed59e1d1-3829f9e9bb1mr2379238a91.29.1783144677755;
        Fri, 03 Jul 2026 22:57:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:57 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:38 -0700
Subject: [PATCH 15/26] sh: maple: remove not needed
 maple_unsupported_device driver
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-15-41e424964da5@gmail.com>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
In-Reply-To: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Florian Fuchs <fuchsfl@gmail.com>, 
 Adrian McMenamin <adrianmcmenamin@gmail.com>, linux-kernel@vger.kernel.org, 
 Dmitry Torokhov <dtor@mail.ru>, linux-input@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_225758_971405_FFC25156 
X-CRM114-Status: GOOD (  17.81  )
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

The maple_unsupported_device driver was used as a fallback driver
when no matching driver was found for a device, or for ports with no
devices. However, this is not needed as the driver core handles
devices without drivers.

Remove the no longer needed maple_unsupported_device driver and its
registration and update the shared interrupts (HW_EVENT_MAPLE_DMA and
HW_EVENT_VSYNC) to use &maple_bus as their dev_id instead of
&maple_unsupported_device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/sh/maple/maple.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/sh/maple/maple.c b/drivers/sh/maple/maple.c
index 5585f220e495..35aff2e57d2c 100644
--- a/drivers/sh/maple/maple.c
+++ b/drivers/sh/maple/maple.c
@@ -43,7 +43,6 @@ static LIST_HEAD(maple_sentq);
 /* mutex to protect queue of waiting packets */
 static DEFINE_MUTEX(maple_wlist_lock);
 
-static struct maple_driver maple_unsupported_device;
 static struct device maple_bus;
 static int subdevice_map[MAPLE_PORTS];
 static unsigned long *maple_sendbuf, *maple_sendptr, *maple_lastptr;
@@ -368,7 +367,6 @@ static void maple_attach_driver(struct maple_device *mdev)
 	if (function > 0x200) {
 		/* Do this silently - as not a real device */
 		function = 0;
-		mdev->driver = &maple_unsupported_device;
 		dev_set_name(&mdev->dev, "%d:0.port", mdev->port);
 	} else {
 		matched =
@@ -378,7 +376,6 @@ static void maple_attach_driver(struct maple_device *mdev)
 		if (matched == 0) {
 			/* Driver does not exist yet */
 			dev_info(&mdev->dev, "no driver found\n");
-			mdev->driver = &maple_unsupported_device;
 		}
 		dev_set_name(&mdev->dev, "%d:0%d.%lX", mdev->port,
 			     mdev->unit, function);
@@ -727,13 +724,13 @@ static irqreturn_t maple_vblank_interrupt(int irq, void *dev_id)
 static int maple_set_dma_interrupt_handler(void)
 {
 	return request_irq(HW_EVENT_MAPLE_DMA, maple_dma_interrupt,
-		IRQF_SHARED, "maple bus DMA", &maple_unsupported_device);
+		IRQF_SHARED, "maple bus DMA", &maple_bus);
 }
 
 static int maple_set_vblank_interrupt_handler(void)
 {
 	return request_irq(HW_EVENT_VSYNC, maple_vblank_interrupt,
-		IRQF_SHARED, "maple bus VBLANK", &maple_unsupported_device);
+		IRQF_SHARED, "maple bus VBLANK", &maple_bus);
 }
 
 static int maple_get_dma_buffer(void)
@@ -765,12 +762,6 @@ static void maple_bus_release(struct device *dev)
 {
 }
 
-static struct maple_driver maple_unsupported_device = {
-	.drv = {
-		.name = "maple_unsupported_device",
-		.bus = &maple_bus_type,
-	},
-};
 /*
  * maple_bus_type - core maple bus structure
  */
@@ -799,15 +790,12 @@ static int __init maple_bus_init(void)
 	if (retval)
 		goto cleanup_device;
 
-	retval = driver_register(&maple_unsupported_device.drv);
-	if (retval)
-		goto cleanup_bus;
 
 	/* allocate memory for maple bus dma */
 	retval = maple_get_dma_buffer();
 	if (retval) {
 		dev_err(&maple_bus, "failed to allocate DMA buffers\n");
-		goto cleanup_basic;
+		goto cleanup_bus;
 	}
 
 	/* set up DMA interrupt handler */
@@ -863,17 +851,14 @@ static int __init maple_bus_init(void)
 	kmem_cache_destroy(maple_queue_cache);
 
 cleanup_bothirqs:
-	free_irq(HW_EVENT_VSYNC, 0);
+	free_irq(HW_EVENT_VSYNC, &maple_bus);
 
 cleanup_irq:
-	free_irq(HW_EVENT_MAPLE_DMA, 0);
+	free_irq(HW_EVENT_MAPLE_DMA, &maple_bus);
 
 cleanup_dma:
 	free_pages((unsigned long) maple_sendbuf, MAPLE_DMA_PAGES);
 
-cleanup_basic:
-	driver_unregister(&maple_unsupported_device.drv);
-
 cleanup_bus:
 	bus_unregister(&maple_bus_type);
 

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
