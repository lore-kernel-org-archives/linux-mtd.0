Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97CDC44507
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WInED/sTUOs5odfgyNGNdAFDvAdRVDT5AYX2WKyt44=; b=kFNGWe/cbBWYPA
	jsd+tk6JKpq2R91YNhcr+gQQ3h4u92AuXgSZjYWAE7cUf3edEPH9IbMtdXC5Tsri+ZDyqnTlHUT/0
	konRYuOxFt86qVdn0PdtbApHMTlRn0ekYES7X7bzw/GL/XBcthG13SsyhLD3+fGiIaFb3wFcb66R0
	a+QubSPBeyEjQj6IJLZ0NgcRPShEvmyltzbMTFtSTgtGG0HrR7DUdEDEWlmpbyJLepFAQfKeAFrUP
	6M9earR3BWuwNgjh55bklPD1VDFp0HSQhvNukSA9IoNIBHA+Saf/5+oyu2UU7f0vMcULsZD3CL2vZ
	RYxjoZgSNskEsHrByTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNq-00000008Bbu-1156;
	Sat, 04 Jul 2026 05:57:46 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNn-00000008BaG-2r9m
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so885580a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144663; x=1783749463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JiJbOxq7Ya2dq8srztzHeLNjlbnlC1+4jsRTTFCbAA=;
        b=Pfiu9KTKATo9BV15TTAWbIqCkAUSeezSJnbgssPYDu3cRrcpH0eVmRwPh3DdQi/e70
         f/mqGodWgOZJYncmolLqEAPrMcJ31FWAkLtnTuTqpz7eZj1wNikIYLxfkLdv8l7+9WxE
         pcOLAGL9uWsEPBAZAO6L+ASC/HllLj0KpDspUENM0gjhnvfRyRfQ1HxaWJc2G8LHUbqp
         q7/gRc7DkMiEGo6GdMTKy265ck/IYyRTIfztoO9SPMg3wHIOfkcwlZWGoHBu1Mz4ffRo
         quNBImJefTylcqXNBJHsEE3scXZPvzc+Iv+0UwQedmS9lpaN2Jhe7glGLtAKG2lHkgvR
         K+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144663; x=1783749463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JiJbOxq7Ya2dq8srztzHeLNjlbnlC1+4jsRTTFCbAA=;
        b=kcV5i+Y8QWxcW6mHQmKlBKDb2swz/tL9Ea1WlEGdHmnbwBuyG8cVutvVjbI4GeRxWD
         VXFvwqxpi0fhV/+Z+G6yxhC+KZ4j2NKLEPY/9sl8/EmbiJvpJWD/GG6/TdPTY4RVdD4Z
         2E5j2yInvpUyiVVTQOMB8PutaBeyuysR/9ColpgLPfwGIetZSAkt+l9MjSIv8+bJZjAY
         1RQV7ibKR+kpXKMrOCMq3Jd05R3pqvj1ByQ7sp0AiY/D5Zz28bZrO1HxBRrkxZKgd4rP
         h1rY8qND87Ey0QshNU6LVaCyHWGVOqg66rwOOHes01Yi/ZsI749CcoLs/H8uXD76Y+Bb
         UzZg==
X-Forwarded-Encrypted: i=1; AHgh+RpQU+0Y4av8GE7wwJZC1ptbOHR4BV+m0CO/IYu3/pXSolhkJRJkTJt+/njIVemS6JB2b37gMgaYFBk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKT64gnN7blQ/ueDWvyhKuNgbjVzuYDcTngxg3lm0oNhBuDmUw
	2Dd1mRu6DsFtICj8OcXFQaMTIGVPxf2qa/FGTqy/4eZh6aMacKiu5ig+
X-Gm-Gg: AfdE7ck0qdvxcyUtioEyWopBS1VYlhOkmPypalrOCo85LHWoJu4AgLB8/z3lMKr6sMx
	kloVhYZZDBfYVA1deJLx+nNw2NfzVl55AUa3p1S9uLy2UwOz3oB90TsT5BhasApmGSLNbaTr1h5
	YPTCwAoxpGlc6nUSkQPGMYBGPPs3kbRMn95PaqZ51d+Z/N94urY57YDRXHflD/ss/PSC/5cqWX+
	UBxn5hB+bOKtE4IeWjCdh/1+Ezk+RMtmgbnygJTAz+T+r/xVTZynhIz0nXisfYlWiXcP4KbLvrZ
	VEOF5AJm3jZHdF7ztf5IGS0JlJ+sxerv9F7Z+XF/tutlyuZwO0Fv6Iwt9r3DkMJixdxm2eWsvnq
	Lc1DCjK92KtPuQpDBh/xKNNTPe8BU94dEZb1FDda90UJsmgyNYnb5wBPUCtgJ0wFeLrUZJR5GjQ
	Zr+EKzw1j/++hKuiyAVmliloL3Tmha4iNDZaKFxKFHmFX1qLA/x0a9pCIV5K0uLgxsnw9Mp9Woy
	6o=
X-Received: by 2002:a17:90b:510b:b0:37f:c28a:de61 with SMTP id 98e67ed59e1d1-3829eb1e24emr2191947a91.17.1783144662715;
        Fri, 03 Jul 2026 22:57:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:29 -0700
Subject: [PATCH 06/26] Input: maplecontrol - simplify maple_device
 retrieval in open/close
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-6-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225743_729911_F19F227E 
X-CRM114-Status: GOOD (  12.54  )
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

Instead of passing the dc_pad structure via platform_data to the
input device to retrieve the maple_device in open/close, store the
maple_device pointer in the input device's private data (drvdata)
and use input_get_drvdata() to retrieve it.

This allows us to remove the platform_data assignment in probe.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/maplecontrol.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
index c66b2614e298..9d623c9e8f22 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -62,19 +62,19 @@ static void dc_pad_callback(struct mapleq *mq)
 
 static int dc_pad_open(struct input_dev *dev)
 {
-	struct dc_pad *pad = dev_get_platdata(&dev->dev);
+	struct maple_device *mdev = input_get_drvdata(dev);
 
-	maple_getcond_callback(pad->mdev, dc_pad_callback, HZ/20,
-		MAPLE_FUNC_CONTROLLER);
+	maple_getcond_callback(mdev, dc_pad_callback, HZ / 20,
+			       MAPLE_FUNC_CONTROLLER);
 
 	return 0;
 }
 
 static void dc_pad_close(struct input_dev *dev)
 {
-	struct dc_pad *pad = dev_get_platdata(&dev->dev);
+	struct maple_device *mdev = input_get_drvdata(dev);
 
-	maple_getcond_callback(pad->mdev, NULL, 0, MAPLE_FUNC_CONTROLLER);
+	maple_getcond_callback(mdev, NULL, 0, MAPLE_FUNC_CONTROLLER);
 }
 
 /* allow the controller to be used */
@@ -112,6 +112,7 @@ static int probe_maple_controller(struct device *dev)
 	pad->mdev = mdev;
 
 	maple_set_drvdata(mdev, pad);
+	input_set_drvdata(idev, mdev);
 
 	idev->open = dc_pad_open;
 	idev->close = dc_pad_close;
@@ -130,7 +131,6 @@ static int probe_maple_controller(struct device *dev)
 	if (idev->keybit[BIT_WORD(BTN_JOYSTICK)])
 		idev->evbit[0] |= BIT_MASK(EV_KEY);
 
-	idev->dev.platform_data = pad;
 	idev->dev.parent = &mdev->dev;
 	idev->name = mdev->product_name;
 	idev->id.bustype = BUS_HOST;

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
