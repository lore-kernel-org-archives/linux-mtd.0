Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D42C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtpLdopRm6XFcznjeVojqzpkrMQh4u8kLBFeS16bnII=; b=V9guNNSjOwz6PG
	sd/rnLdIw/BUcK1kLKrU8NJp2xBxv6JYXzDlJlp4ola/iLmeWwHUv5cLLen0sxvGTUs3DAUiY7FP9
	wnP9fV2a8lfckGNQjk/n9az6Jwgk93HJGcapk0X4JDfrqrpjqPcFopNKEKz2yoGJGn1hsCLIP1n8Z
	6P6v7LMPcvwqYKLshVaWYZkhh9073fVwKSWk64TPc18G//PoV2Pnfi/9C/4jvQ2O5Te5oQK8yJicU
	6U6KSkANCV1t9XP0RLPSn15m6gmIQMern4zfhotIwIl/F0h/sf7iY2R6dP6uJBCMC9kDbU3xhMdBf
	a06UOxk75srS9CldZljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO3-00000008Bss-1m6c;
	Sat, 04 Jul 2026 05:57:59 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNz-00000008Bll-1USk
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:56 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so885671a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144674; x=1783749474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5F7LxDsRkHtfo4eJ/PQP5nz/gnv4TgKb2uK7bw1iEA=;
        b=hmCHl5Me8vjWgA9IkKd9ZG0goFIGyTQhWeXI3z5A7FK42JrPD4bg7sL9y2PS2lVl8x
         +HmhWECssrrhKOLrWoi2da8jPTzUUQvqUoH3EJ2v6zoGLuYsc0C2g1UqRKgkT5MNJ9yA
         V5P72y6ljPiGztBkRG1WLGB9ExBCx69k4nIFqitj9WU0MyAKqYY1GYovS4bRHgvHYQZq
         o1V5eYXKdZTxbqPKVj2YB023qkaXvIUnxw/ofoNcUP+i/51rqRf2j3C9nJDT/yP1f4+f
         uQ5k+Cam5Kt//Jh1XOcWyb8X1ReoxqAepm1EpPxDIM3UOC7iIv8PtI1HK4UhSRS7Ctbh
         533A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144674; x=1783749474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5F7LxDsRkHtfo4eJ/PQP5nz/gnv4TgKb2uK7bw1iEA=;
        b=FcFtmUHEKTByMLgVnyhMANzNouysX4IY2307ArkdMr2ml0LSO5/4As4NK8AuuPglza
         xUGdmB2lECRvp6qp+PRJUiune+qw7ucnLs1s1aQXiiAdWqmvIROM9ROfoC7vousECPjp
         Lz1ykIsm+hik0Ucsoqtrdh2IMRcH5rD1b2uNA89onsibuIOvqSlyuAOfCd8sDB49BYtj
         w+qkUd0fGcG25GfPIDnvO1S5HEKH9uXyYc+KkmR1rVRjGmIKzssYGP77BLRqCowinWP3
         CuPPwc77tTS759nDwEwPoKAzPKgrS7pydMB+2lKtlhIORgaYSxnNlWkXfYvQltMCDTdi
         EDug==
X-Forwarded-Encrypted: i=1; AHgh+RqGRrLny7deuS1VIKt7p9fMqohYeoagVDLLXUD+C0+QehHXUJeyNitoDox9jmIu/JX7KWN5VlRaVGE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc0jogESklr4daNk+pRHb7FrFbfuJZ36akyP7JulqIzvCdi0i7
	gonECbbqImWJ7z+Llg9lfZvtRBpyzebAFvrcoUXxpA9NEbyrM79TZyfV
X-Gm-Gg: AfdE7clz2MEIpgqItTC8cPKUBgXnHekvSLKI2v309D+ZW8Ol3VRuikbAL5aUUBbqE25
	Pooz0LUEUZEK8VKWN+EN2ERCSPblUojmU6lTAfilGtJoGPb2WXKL5ejnoqKVRetAjrDDLPLPZCV
	OHLzSClfkjFT9X+7sqG3UP8TFH2mT8/90pjd3tvtQYrRKe4/u6CGWzQX9qCBBCa7IWkuxvrVX3V
	mqiohRbawRsrCX4tGzyQx0Lt1apdWJ+8yljN4GHIxd/SvvAap1rJoZ8HMlRR04iYwpXbosKzHVT
	v8RxjmqsuEt5dTAazN2U3JcgqLgcElE4A483P1ynSmKY7c7jugj8wQDxQB/b8nHbBRZwyjqi1nE
	KabT4guZmwUjc1u7ULI+DyZbKh88+3VXLxcBnC+H5ZqLYIePJFoNln6oNtgUdsuhiFiPEOLK0Cr
	pIytT1jhwYLYpAgh2cDUoeFt4B9fwg3PNhQgTVZ2QBXzyuQqbvBy++KYl6YPrIOJaZloLpLacaj
	wc=
X-Received: by 2002:a17:90b:1850:b0:37f:9ce1:735c with SMTP id 98e67ed59e1d1-3829f5ea616mr2372239a91.29.1783144674303;
        Fri, 03 Jul 2026 22:57:54 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:53 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:36 -0700
Subject: [PATCH 13/26] Input: maple_keyb - remove unused mdev->driver
 assignment
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-13-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225755_404861_EB0CC759 
X-CRM114-Status: GOOD (  10.53  )
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

The driver field in struct maple_device is no longer used since
commit 1795cf48b322 ("sh/maple: clean maple bus code") which removed
the reading of this field.

Remove the unused assignment to mdev->driver and the now unused
mdrv variable in probe_maple_kbd.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/maple_keyb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index 0c92138bcc77..e277b929a375 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -161,13 +161,11 @@ static void dc_kbd_close(struct input_dev *dev)
 static int probe_maple_kbd(struct device *dev)
 {
 	struct maple_device *mdev;
-	struct maple_driver *mdrv;
 	int i, error;
 	struct dc_kbd *kbd;
 	struct input_dev *idev;
 
 	mdev = to_maple_dev(dev);
-	mdrv = to_maple_driver(dev->driver);
 
 	kbd = kzalloc_obj(*kbd);
 	if (!kbd) {
@@ -206,9 +204,6 @@ static int probe_maple_kbd(struct device *dev)
 	error = input_register_device(idev);
 	if (error)
 		goto fail_register;
-
-	mdev->driver = mdrv;
-
 	return error;
 
 fail_register:

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
