Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB0CC44503
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImTlKHe5WJjoD5pHfc/y3DKC28NgRJOfztVH7MT9How=; b=Dyb3VG7Vg3bKyN
	82E4tEdUxd6GCJbpKyfT5dFShqWfEwv7/mkSipPZz6er9CNFu9R1JtnJYZMeWr0m3SdQxb92Jv7/F
	G363sBdj4ngPqVEkv3WW4LkLDtv7lbxQbENGeLEBhttvirr/njq6TTVL6lpZljN1iDeDaTvkFz3Oi
	+AEp2+5d1kvbUQSNQIm8H+qkywuh/uF95yPKeCbPRS8DHS7ThwLJwckDmH2Rfn0RvKNEGU0RS+zjl
	RuBgv80+3lWDgJVLjBY0K0UGCU+rMydXh07AuYIuV6pVmYAUAli57h8UoUHgXr1kKjTlFQaRJDZT6
	+LSNu+uCYsg53vK6pngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNn-00000008BZw-059D;
	Sat, 04 Jul 2026 05:57:43 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNk-00000008BYa-1Ou5
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:41 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so53601a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144659; x=1783749459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpRM5xO2P6CrGv5fZ5v8OZOm8BQmO2xLbX7VVDuxobU=;
        b=kOTydH3esU5TFweCx/SsMvL/07wOHAoTC4Q60sn8XhiYjLn7jN5mUFvjjafjUMOXbL
         584/OD2+gcTS/wMDDjNzV4USmeywOi3hhSG+4+V8vXegmtjbBId5/uPAj1uT1xAyqZAR
         J+QgdIduxQp918oVExpMbsMFPAokLUgzqorTiR+bH/H6o1RVjcBmHNNW0yt70SEDeL+B
         ohpSPQgT+k8q/ZCB3Jg/3/qC6pdf3kUk22a6mThlvc//IIf/i7lWSIUr5ud18Y77PDUp
         8CdRTlTJ9Z0jjsWCqzN+eq2pI+xZMO8+WlXdgl3lztYQ38ew+EMxXpGktpdKjsW/qEgo
         1ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144659; x=1783749459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZpRM5xO2P6CrGv5fZ5v8OZOm8BQmO2xLbX7VVDuxobU=;
        b=Sg175G9Ec6TSgvZtpDH+DSXePhoYHt2zVA/Mp9liYU4ip37ve4ajqrcFebpYioGNU6
         sWyJFWttljQtaohS9QeFTxUEzybwijWqjKbbm6m0v0jRyA0hR0/og5bvrEM5FsoCGSMf
         oh7Wd+6THOwZrvj/hYk5LgGJ2yudeEn0GiAoxVUBMVZXS7bvsU5AXT+Yj2KpoPNVhuNH
         uVdc2Ucc7JXszAFqXIgwqOz8uY80V5PJ9sXKO0qAPMcyuRLfsJTfgJfOmvIURipAhqa9
         /coSiYif8jKNsecNOY6MOYJo6bGUxLlB6hY0MD1/KrIltoTAas6mrUzDqBUlGmj3rRin
         xslw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8O6f93ZqHGcWIXAzaTcAas1blRgx3En4Sz+4iNAuMQ9cpsiwRgotbvFjyPyo6U7PhaYg72yIHy7E=@lists.infradead.org
X-Gm-Message-State: AOJu0YymXiDzrdlQjev8vRHVnL1H0bHRA7Gk1tOxTyv8xL5l82HfBBt8
	VvBnnrrOv7gQd1gjJtf/13RJElA8d1S40VpmEMS+wjSWiMd2471i8Drd
X-Gm-Gg: AfdE7cmEttOrp+ZFBy4ATi1dzqqwhuS/IMtW6srW/DMs2t0xUff5TYiI4cSw7+vtZYC
	Q3o15K1mPx8xXg03LO63qWe2rjs5/QKnCBAG1f8BF0EHE5F2ZKiU1QKD3th9DGrzQRtX1vJZAYE
	PivlInokAHURA5FdA/eM27a4jrCBg9o+yd7aHihdP5taxDOxPe7xRGw4E/VJ2TJc8gtBFpnKV+O
	CtoL7ZALMm28cfVd0l3XqQI0QpNN0uX8RMrI0qYgen3cwzRsc9g94DrsfT6OSVJOwbmGuGE2Xfb
	835g/R5lu9NKh4EL/aQDsnbDXY1llqnUm4HPrxS3yTsvVcyp0NWczlTwcGWHXpjspNl/jL+p7P4
	hcz3xFB1uYlBrALpKOxZEY7ahkmw439uGpLwaM9aXFhI/bsaq9HVmRukWt/QlY7GUiYqHjbmRsj
	ouJAW+rODwzVeLc/LsXknetqBRMVXy2t/Jv/+um9m9FZniiUL5iprEYekQVmg8n4hwh9kF21uPy
	Ws=
X-Received: by 2002:a17:90b:5251:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38112063c22mr7851183a91.3.1783144659437;
        Fri, 03 Jul 2026 22:57:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:38 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:27 -0700
Subject: [PATCH 04/26] Input: maplemouse - stop polling and clear callback
 on close
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-4-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225740_380458_916A6AB4 
X-CRM114-Status: GOOD (  12.14  )
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

In dc_mouse_close(), pass NULL instead of dc_mouse_callback to
maple_getcond_callback() to both stop polling and clear the callback
pointer when the input device is closed.

This makes the manual clearing of mdev->callback in
remove_maple_mouse() redundant, as input_unregister_device()
automatically closes the device if it was open. Remove the redundant
assignment.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/maplemouse.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/mouse/maplemouse.c b/drivers/input/mouse/maplemouse.c
index 0c8f7d1b02aa..97d520e7d66d 100644
--- a/drivers/input/mouse/maplemouse.c
+++ b/drivers/input/mouse/maplemouse.c
@@ -60,8 +60,7 @@ static void dc_mouse_close(struct input_dev *dev)
 {
 	struct dc_mouse *mse = input_get_drvdata(dev);
 
-	maple_getcond_callback(mse->mdev, dc_mouse_callback, 0,
-		MAPLE_FUNC_MOUSE);
+	maple_getcond_callback(mse->mdev, NULL, 0, MAPLE_FUNC_MOUSE);
 }
 
 /* allow the mouse to be used */
@@ -122,7 +121,6 @@ static int remove_maple_mouse(struct device *dev)
 	struct maple_device *mdev = to_maple_dev(dev);
 	struct dc_mouse *mse = maple_get_drvdata(mdev);
 
-	mdev->callback = NULL;
 	input_unregister_device(mse->dev);
 	maple_set_drvdata(mdev, NULL);
 	kfree(mse);

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
