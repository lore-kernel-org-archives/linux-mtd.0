Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A99F43858
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u1lxCYb7Jn5YkPUY47PInjyRJ26+/nidvMib4dkNkNE=; b=ntVJMmcDDFAKQz
	907pd4wZvHm3evCM2UCO9ExM1z+A/gIbeY2nbA/JVFAtG2aHEEAZWRhQ8WZDR9gd9nboPpNSVgJWN
	+6/KNNLoBfwensO3RwLWyeSceJ2fviOnMkRDbLmDrRrBL1hfi1BWFhb5HCyAcKl4+CTV2be24Zsvh
	maEcgQxTBm1X2A/cgk2CjUbnEz6kih9MNDOFzkL4b0s8rh27FfuOZGET7P45vSQQ2CrKOka/0tDHf
	slZhCdBLR/2u8pxn+6Bdr+eo1nIfVhZ3oIhEwNOR39006e6yweHqotUUxPgh/y7EHOPIf7wuYzeCG
	SVJhYIxwgqUr3cMwX0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3bY-00000001QmZ-115N;
	Wed, 15 Apr 2026 17:00:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3bU-00000001QmA-2UvL
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 17:00:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ad617d5b80so38835895ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2026 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776272439; x=1776877239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJqWM7Qg/yxY9S66GjsuTrsJ7EEWVnPgKW5QeWWEd6M=;
        b=gnaBYO47HeAsEdQANyGYHfUryOKBt4uqLI7iPSxEtdElmRPhfQohSTGpIQP+FSSYjS
         rEgqoPhveeUyVGMKa1SVh3LUaGYapkfc5FKInrDeohQyw3GI7GsZiL8EPwWNQ0gZQ2C6
         Xxpb/z+hdAhJz1E7JdxlCGw4Hf2DvJuVVAKkP5bLAmdDs5IlLs9mUy42fd2YPFdT/eBO
         1oNF/MAzy4vuA4sWJguQY57LQDdmsSP0LZTNj99QbErGfofPaXHt1x1pzAKDSHsyBxJR
         9dsRfx1XHQd4Z67vLNa5F0jcyzwzaOuEEr2q+TfQ6FPxILue0Ipa/tDvo+DjWKeItmIz
         Ts8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776272439; x=1776877239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJqWM7Qg/yxY9S66GjsuTrsJ7EEWVnPgKW5QeWWEd6M=;
        b=J1kvE6E64e5v8QkqPRQAkZv4g9xgyFbOCDt+hGbmpuB8vOjPsiiIWEYuGVSssZ9Ba7
         ir1E1UfrYLrUbvars802YEP+rolbeQQmsNbhKiVrHXLP/EcFizyu9t8Rf08kv7RPJLsN
         3X9pAYQMMxcuiF/08bCkSL9g4Oma8Wox81cFIvSKdxjwRt5R5oUOKphCGjovJBYVy3m5
         aVkLyY7pzCUdlp9nL//igMqv1qsYBzZ13/Sp9FSPoNlsjy0yDbakBzENvKihxEcw4f8k
         JjJj26/JUqB0+sLR+DlV9oaeDxpb0FfsxHGBgqyN3rVcYE7k4EjKk7NM3MAcZzb8uVLr
         bxJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kPidAj0yfJV4AXSPHbyoGCYBBZQJinn2cXpQqPjYATjYQ82F/oGHLHg28R2VRidXIcrgFh5yM7Ak=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1m5wPIB38wv3akUrrqp4uVkWrN+E30Jq8cX0OMG+scsScv3cB
	DDA5p3fYR7ZI0jS3wiLsuMVIPlwx9SP2ynBETCPqPewvH4XNYxXRyEwG
X-Gm-Gg: AeBDieuiKLpT9RYqZiYV7QklLrkkr0drRaMznViu9K9jI38T17GjSUMcMiguE93gY9p
	LeuUYvM5vgMoOdduuMQOqwDo2+fIZ96J+eLeL6gqYun+Tjf09Ah83kQEhpjeFP7Il1P6qmXNvzE
	QdRgbOycfo3rKG9z+3cFWGJv8fD49ykppsbz2D6r5nr0s983rv8yz9swVNi6HYal+9DnJKQkgfG
	Guh7HbsxMbkTxsPLDBlWLzvQYPGN/o8eoS+9Ki7ns5V3Qt9aQmuqsc36Eb5miFPRTYXu1YxQSQs
	sOb3snArbGsFYp/tv8wwq5EUN4GFFLpt7ab/kYFDG5gIX6NIW46tQTj4iDwuCUtx0K88fRc/na3
	cFkw/m2wxFq26bOFzdFp0s1ynMsrz1QlOS7G/XNoDl7At6OeGNLxTJq/eE/7V3JCSGg6Ag22qW8
	muLlxUxmmMm/Otn06zPGQZijW3JHf/P5j9kYLI48tCc+aoIIw=
X-Received: by 2002:a17:903:284:b0:2b2:5822:7a70 with SMTP id d9443c01a7336-2b2d5a63d4dmr223583195ad.38.1776272439043;
        Wed, 15 Apr 2026 10:00:39 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:48dd:8f21:beaa:cec8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4780ef365sm25319625ad.1.2026.04.15.10.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:00:38 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linus Walleij <linusw@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	H Hartley Sweeten <hartleys@visionengravers.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] mtd: maps: physmap: fix reference leak on failed device registration
Date: Thu, 16 Apr 2026 01:00:27 +0800
Message-ID: <20260415170027.3593563-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_100040_638382_5E21ECCE 
X-CRM114-Status: GOOD (  14.61  )
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

When platform_device_register() fails in physmap_init(), the embedded
struct device in physmap_flash has already been initialized by
device_initialize(), but the failure path only unregisters the platform
driver and does not drop the device reference for the current platform
device:

  physmap_init()
    -> platform_device_register(&physmap_flash)
       -> device_initialize(&physmap_flash.dev)
       -> setup_pdev_dma_masks(&physmap_flash)
       -> platform_device_add(&physmap_flash)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before unregistering the
platform driver.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 1ca5d2f0196cf ("mtd/maps/physmap: catch failure to register MTD_PHYSMAP_COMPAT device")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mtd/maps/physmap-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 0dcc25b7ff98..6299a741e65b 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -659,8 +659,10 @@ static int __init physmap_init(void)
 #ifdef CONFIG_MTD_PHYSMAP_COMPAT
 	if (err == 0) {
 		err = platform_device_register(&physmap_flash);
-		if (err)
+		if (err) {
+			platform_device_put(&physmap_flash);
 			platform_driver_unregister(&physmap_flash_driver);
+		}
 	}
 #endif
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
