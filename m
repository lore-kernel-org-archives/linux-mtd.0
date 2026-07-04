Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB04C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0673O6MMUWaxEl78vxMhT1YOwlrbK7WcDh43CGGIIGI=; b=Udkey4f/PAbLuL
	Z0fxRFPJ4/irKo8JGAQUCpPPfajyq+84Wpb+FiLpWii+tHO+GxSGO6DjXlH8Dc4wxDnxsi+InxC8O
	Fdbb2wo4GdruPffsFCHVMCMpY4BjpAqo7bs18cyooF+EhWR/AxD6kZmDfsdXyOaX0D6JBZqw7wXrv
	ktPdzfwr0RnOwbDIPELlbsELpauKzC5p+sPuWYGOuOkYCrDjIHRCBvgyhZEFOMi9uO/yIRRY3h3Qs
	UiLSCU3PKb3lWxS+g5W9ZycdpwlDZiODmxxq89xtZfFcOyvBzKQDVn43G2nPkgUpeM55+U53h3sB2
	TyKvR0R5Wf4NRsih5ppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOB-00000008C6N-1Rg4;
	Sat, 04 Jul 2026 05:58:07 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO7-00000008ByO-3nLa
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso384781a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144683; x=1783749483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVPHekxxTvV9T4JJnXvyVv5aZspg0AcEDMfkFw+e5yg=;
        b=AMlWGN1ca3IVotrCR/ljo3IIWKbOTd6QTG7VzMgJdniBiDBe9i2SEgp1KaZFrUfDRT
         oFKKczbyPi3mHw0FdEt0ETxanPu4fM03th6u8na4PYEhVLaUZ0q+qdC0LEIyyKxNVUAL
         vwqJkdYzxiXH091zSZG7hw3CM45y2to5r/S9uukGCQ5VfNzHj6Pfhu21IjAnNheG6HXs
         vIZ7G8G5MJXJvwUHVAoONYgNy2XeX7WcgM6Cgsf8yDFzan6NuxnWgo6rxcvEExw2+Voh
         ZHMS3dg4R72PYiQ6koqI+keyO1zvZYbrEdCAi7a8IgK3Ni0llCj5oKdnlDk3Wfd7ideo
         y8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144683; x=1783749483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVPHekxxTvV9T4JJnXvyVv5aZspg0AcEDMfkFw+e5yg=;
        b=N4lunTznsRhDOWAFVfNSFMgRUH/rGE0vp761VYgUTtogHuprTkZsrOKwH5y8RC74DR
         qYq4n2/Rf1wo5gDSOl8aDc4sdKqbs7z2vLNLNALAN4/SxDExkWZZ55CHhuxstYpIaBho
         LNOHU3ffGVDMnfR8EvlBdjEIY1FDMj2Y5ZTaryJ49OCufgocjnPAS8P+eVyRQXDQ5V5V
         02yN0OUMpPWHhS69tTy6ZwKTbjjVbcIu2C8zE5AhHtf8/T4FreTo/lj+3GvjXzmUPCW9
         cW2XHi+ouxoB0qYie3usPB2Kno8YRn+4Vv+ysGbTfd7PLCLKEyEQ2fwA1E1R5aZI3TY5
         6Evw==
X-Forwarded-Encrypted: i=1; AHgh+RpA4uRp827w2EI4D1iROUMOgsvofpOc4sGyuWQwHXWSmWkU8Cr+87Ram0LtEG83eEuDgsYBTQc8eMg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yys5qr3/pkF742zAWzxuJhGt9fddBudSxpApyQm2Ofi8PgPzKO1
	OozzPMYBLq2EQEBrvCcOFMGlv2m8DUR0pKaNCyCtxHfY6rG3nOItsXtz
X-Gm-Gg: AfdE7cn3b+Pygdp0fGDYuAqOssw9mHiK9SfhfeQB2qs9VOK62LmPtJvbbwZEpZxro/x
	owtSYq8xv2c2gJGZn1EbJWQwr2FDgqJnogkrscTEuoz/IEPorRG5UA491QMgw/Rpb4lIjCd+ZiF
	U29uckgyKMkwrS+QkvOjsbImJjWzhUyf0XsTq1HZY7QAuW+yr0mMldXvfbEZu4zzUxsgFgAsmgc
	uW4gTZ5ZRDCXdQvRhiOBltW3uMdPALdHYAxi+bP7efbNbbV+fujzfWWUy8Soag48SzTmyLYoAVE
	vnl8JbEG2OOS5NA0uUhpguMlzDL1/JdW/s47i7HWboeAs4+aQF5MGGy10GLnOd5sTH+oZHd1YKV
	ZlVylUb21ntugf6+izkE+ZXAMl3+p+m1ztqylQfrlRVOkmvLitW3dIHlOcNbHonN9ocvLPBF3Ss
	uOC2uPd650pIIW93wrE2pP1w9D5zIzSx7nQ8Tj+x5RYo76gPyBunIJjzfgbnT+vmaMGPyxxGbwP
	JJRazF8ZOujBQ==
X-Received: by 2002:a17:90b:224d:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-3829eb1d7a8mr2296385a91.16.1783144682891;
        Fri, 03 Jul 2026 22:58:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:58:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:41 -0700
Subject: [PATCH 18/26] sh: maple: introduce callback_mutex in maple_device
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-18-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225804_000809_08C46C4B 
X-CRM114-Status: GOOD (  14.33  )
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

The Maple bus core invokes client callbacks asynchronously from a
workqueue (maple_dma_handler). If a device is removed (or closed) while
a callback is in flight, it can lead to UAF bugs if the driver's private
data is freed.

Introduce callback_mutex in struct maple_device to synchronize
callback registration/modification and callback invocation.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/sh/maple/maple.c | 9 +++++++--
 include/linux/maple.h    | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/sh/maple/maple.c b/drivers/sh/maple/maple.c
index c0715e3ace6f..7c82b7a8a280 100644
--- a/drivers/sh/maple/maple.c
+++ b/drivers/sh/maple/maple.c
@@ -121,6 +121,7 @@ void maple_getcond_callback(struct maple_device *dev,
 			void (*callback) (struct mapleq *mq),
 			unsigned long interval, unsigned long function)
 {
+	guard(mutex)(&dev->callback_mutex);
 	dev->callback = callback;
 	dev->interval = interval;
 	dev->function = cpu_to_be32(function);
@@ -230,11 +231,13 @@ static struct maple_device *maple_alloc_dev(int port, int unit)
 	mdev->dev.bus = &maple_bus_type;
 	mdev->dev.parent = &maple_bus;
 	init_waitqueue_head(&mdev->maple_wait);
+	mutex_init(&mdev->callback_mutex);
 	return mdev;
 }
 
 static void maple_free_dev(struct maple_device *mdev)
 {
+	mutex_destroy(&mdev->callback_mutex);
 	kmem_cache_free(maple_queue_cache, mdev->mq->recvbuf);
 	kfree(mdev->mq);
 	kfree(mdev);
@@ -655,8 +658,10 @@ static void maple_dma_handler(struct work_struct *work)
 				break;
 
 			case MAPLE_RESPONSE_DATATRF:
-				if (mdev->callback)
-					mdev->callback(mq);
+				scoped_guard(mutex, &mdev->callback_mutex) {
+					if (mdev->callback)
+						mdev->callback(mq);
+				}
 				atomic_set(&mdev->busy, 0);
 				wake_up(&mdev->maple_wait);
 				break;
diff --git a/include/linux/maple.h b/include/linux/maple.h
index 641cf3330409..48ed7558b8ab 100644
--- a/include/linux/maple.h
+++ b/include/linux/maple.h
@@ -3,6 +3,7 @@
 #define __LINUX_MAPLE_H
 
 #include <linux/device.h>
+#include <linux/mutex.h>
 #include <mach/maple.h>
 
 /* Maple Bus command and response codes */
@@ -75,6 +76,7 @@ struct maple_device {
 	char product_licence[64];
 	atomic_t busy;
 	wait_queue_head_t maple_wait;
+	struct mutex callback_mutex;
 	struct device dev;
 };
 

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
