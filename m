Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CECC43602
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raswQjjCo0qN0OGJdN6livob8cg07MgJQ4oK2WccTho=; b=C2Yqk+c/HrzB49
	uWHrvO6JsD2UgVcbglYSBualpP2s/NwBvgcU9KgY4SQPZo8WhZ4/sj/cT2vDAAJ5kOqHycGQGyl4h
	pw7Vsn+3JnRQWYauMASeEURaARrT+pDRU0EYx1ZuJOuFjXGIdYzN0+MoBo0FV11Ub/pwITTtYd+oA
	nJXdz5ChoyiMpMU8pjmI9hWThBr4Dm/LWqbeJCNQz2i6l21Nc+sm4N1fyqqlPFeUVnOj91xjfcGcq
	CEqdS8EX2hydm7jrIvLUkaWnjWqMlnCysrvscRHnwHcfhinTIfU3CfL138Z3nwXwJe5yp6KJchwXr
	loPfCo0yKUn9W/kDOOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNv-00000008BiH-2Z8d;
	Sat, 04 Jul 2026 05:57:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNs-00000008Bd4-2BXi
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-381507c9380so603447a91.0
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144668; x=1783749468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/P2FegzAbUFBaPcGw6l/wNkWF21hDcB/lwqrEd+3RkY=;
        b=izm5tX8TLnMAs/lwxwRDmt7Kg2jccw+UjBPT4kK5wXh269zBXAJmIlmnH7QjGCgkhL
         XWagERZh8FidF3+Wb9NOsqObNDy5SAW49Axz6IVz90eXcus+PNIP2CUF0kNv2mdFsy1T
         VfRiPnB7iPVtu4cx4BDkJ4YXwFZwB8UD0bWpTkQz0jT3HGUUVUBaBvdO3hxT9IYQOUDt
         WabS3u9XHMIgqxVDXq8qMUohM/wtGIxID3Ym68Ez/vXxS3Xc1OLuFKiQEgQMHHe0uEi1
         A4Ue4ExXzYcOGhm869F/lrEhmBKJYcPfxxt/pSq406p6y2RRJJb8N7Ak9E7+bItFHB34
         V/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144668; x=1783749468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/P2FegzAbUFBaPcGw6l/wNkWF21hDcB/lwqrEd+3RkY=;
        b=HPDX79J6Rogd/E06sE+0dEyFSP6B75lB/SuoJC0Ho+dOQl6LVp6jmKyKzB0vhLDb18
         dkzA22VN7Hcm/bgXLTL5LH6sKpWeWM5UIvcCh7Lw/TeKvUJDsWrNSunV8YMAPv0FLE43
         EoRugbbK1PRySuUwLiX9QZtrrZFgLICt9xjxhMMubvaWkPs/uiZab97C957pV+t+6OEU
         kU1ENlLc5v0Lya+kx3IuRP3NxwBTMUlzMUqK7UqhJTO1kcaB2UKLVOpnPmD2DnLMuGnR
         /2AtJTUHd0BAopdUqmSg87NFsj8g74HCDIoCYVzambMUSa99F7GsHAks3XhEq4QNTg1Q
         jCpw==
X-Forwarded-Encrypted: i=1; AHgh+Rpvub43Ax6qOKvfLEaBytLIj+y4/HYRzjXs4OsgOzRiCjhdHYR8jFeiva5TfdEKUKiB0txc+zy5rTE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9kFchbSEEr8fBaxt6negxD4orOIJj9JmbJA8Qiml5yA1ENWbi
	ersP0C15HsFYdBf401qQak8zXT1WIHHd9BPHP/wL4hJ9xf9yzgEKNAgj
X-Gm-Gg: AfdE7clMa5pGtGMaA2xgr0eAfUvT/vcHWo1V96xPtDK8HQbay/hhiG6WgKB9tjSwVXC
	yEYUHTZpKm51NfT8ZPWzGISvmNg4w57Kg0NU8Oy57+yGqGhbWV37SM1ucz1UJPfHp/6P2VJFjcu
	Ma053UtB04T/411USVHpLVKkm7hpr0UPWsg4rkj1geyXCyug9PZzJyo1y3DXNnVVytCO6ZoyBww
	0k0AZyn1cK91qsaiauYxTwjcS8ogAhpgZQsnn2uOFW+lqnmhn+vxNvWtxccdQr6ou7rA89ovQYd
	zEpAGx096azf1I+ng7gh8ENGL9zlBTGEzUDctbBD89HsqieFb7/Kb55OPoqcS4q4Lb/DcwaidyO
	0qdTm0biP6I64G8o/pxZGkfYsvM+IMNTSO+rWggMlSibHW7bb6WSAHGBTOJecB0ITaVFA0mKp7M
	1EPHYZfVcu+B0f2rKi7sMH1N331Ad3knUFPs/g815ERE39lfycHO8g6bzyBr2kMAWmIDBLG8zE/
	4g=
X-Received: by 2002:a17:90b:4ec5:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38280a9fefemr2264979a91.11.1783144667531;
        Fri, 03 Jul 2026 22:57:47 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:46 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:32 -0700
Subject: [PATCH 09/26] Input: maple_keyb - remove redundant drvdata
 resetting
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-9-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225748_565400_09228291 
X-CRM114-Status: GOOD (  10.05  )
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

The driver core automatically resets driver data to NULL on probe
failures and device removal, so we can remove it from the driver.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/maple_keyb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index a245774acc55..0c92138bcc77 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -212,7 +212,6 @@ static int probe_maple_kbd(struct device *dev)
 	return error;
 
 fail_register:
-	maple_set_drvdata(mdev, NULL);
 	input_free_device(idev);
 fail_idev_alloc:
 	kfree(kbd);
@@ -230,7 +229,6 @@ static int remove_maple_kbd(struct device *dev)
 	input_unregister_device(kbd->dev);
 	kfree(kbd);
 
-	maple_set_drvdata(mdev, NULL);
 	return 0;
 }
 

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
