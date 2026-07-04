Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178E4C44500
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yekbtNQw2rDd9GtEiSfHgOAhOcuWh347P6etH2Qt8/E=; b=C05a2V6Ps69GTd
	Rfip5PIR9MhucIsA6PvB25Sa84Fgt+s0t4L22yH8Shzm0r/z0ipPUdQhc2mno3GGu7yE03hBs6iYb
	3sOLiX8sZjdmFvEikqhyAoQn/Wbb7bTITcX8tKPmGtL4f9Z1orQ5SFfFnLPLPiQH6Q+hmKFpsTzHP
	KThSFG7F7qtcHirGG/Fe8hoGO6Inr1nQ+FdUmnfiXT54TRv7lk0SeOgXyZ/78ak3s7K1eMFggqirV
	TwMiJNPcof48K4Nl4Of8R2ku/zPQhCXe485eWhpgjWHTL5b8slXJW8hM5WJBHgmFaVbObMs6iOA7D
	hHYwdXratBX4rU4xlGCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNo-00000008Bap-0hFB;
	Sat, 04 Jul 2026 05:57:44 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNm-00000008BZ9-0B1D
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:43 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1139266a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144661; x=1783749461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15hSQeEEYahDoHIjuKW6WN5DINg66LHxIgPA/aX6Wqk=;
        b=iJXmAV2ixNnvxFnxm+KN5mVqb3H1S4nPY7+UFc0R/TvA2C+EQIib8UDjp/7Wr7f+2L
         wkhqtYMtfP1MSNb8k+sNzsnzA3tqN9yCJ2H9d/swQDjugN9h39TufhUfpaHL12QhdlTl
         TKCIzOu0vOYUh+yfleFqF+HYL3itrDVJoVBvyE3/EtKAvEYzZ0sKH8xND2Sfqyw40AAi
         mdJ6F+VKZzsYoUc4DE+jP8/rJo6mQQVD5OUlA++LdVMWgn6e8DEEXYfgaKCbeeA4fZz8
         ho0WrXbhfHuw1NqsnoZ7L7mfOCdPJALbq++GegxF+N0TafgMNJ03WwPQ9iIp8Fn86Fe4
         tkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144661; x=1783749461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15hSQeEEYahDoHIjuKW6WN5DINg66LHxIgPA/aX6Wqk=;
        b=Mo7TmpbVotcp0zGI1+zFWRtbYbc+SMFvIwhZvdFuzoUBUKXuxiBVghODnjevQBi/78
         31WtPzBZuObDGnf2bLitr4V2IPl7HkzKHzWxyGmZxfvUp6nQSPmUb/h5PE5unPZppmUs
         rdTTxTGrFk45yNc5hcU6EfxcvUJDf4c0Rt89JkgdGvJrhREPO8yOgQAYQh1qAF8j10gL
         aq7L5rnLKx7FHtWyByNWbwnbE7jl/NehJ6Kv4EfiuutDUTsw4znTD25CXO+RMHwXbiLx
         HlF4qngu24+ZOMrJGrAKDpaaFX+BrrLfQeAlgGJGZxHjKmBFe3ua+208UXZxsPtLFFgl
         IrIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/p4zk5tHWzDVoAN5pmtmOX3wO+tfCX6nawSCKjxQt7GvUaGVn902gfKU2dhIM18psiotztQ9vWUzE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1YMICKX/1LjhBbyIzPCaRGDbLI7qYJl0BLyOO1Lz0JSsVXQz/
	Ud3SVKwEhLJUAdQidzH9gNGLYLnDjWcQxOi8AHAYKgPrwR3msr5miCGy
X-Gm-Gg: AfdE7cmM/6K2hPO1QkxMgr7Hi+6r4b1WsOxh4YAnq8Kda9PMQmH+Ll4ksc0AH3BJA0P
	O8c70zbc/bPKMoZ3wKR+tSAKGjd2O9h1+ZGq9P/ILORIy8pDN6AF0LDTGPc4b2ErKMZ32IC6R82
	1nqXEwPOR3DoIocElEwTC72SM0ddV2VZqAeLu4tM/JDRPc+PH27P3nk7fbHQ8xJCWk8ALKFmK+c
	WSRwJrET2oBm84c1TV3OVjPO2X5HQ3tsYVp445PfL1pOiXI/YFzHGFc2hJ3Z7Pq7RbzQq33DO8Y
	EiA70vcUTF8invBYW0pjQjvIoxwL4B+epph6HwOY+zXXUt78KQz5Y2DAyjw9wCn6RcQK6IRF/NW
	wVjDonyUjvuqNxq0GjoNdovFGjD6JlRBtCvz+zKxXhzJseSFMIPq1ihAMynrGfUaR+wBSiDoyhi
	ZM/IY+KHCi4rinZUp+P/Qml0kv3RSWJB9uqVXo5tFrwuSJzoe35vr/kwzpD/AHYf9Fas/fQexeb
	xY=
X-Received: by 2002:a05:6a21:44c8:b0:3bf:6c08:2849 with SMTP id adf61e73a8af0-3c03e540d9dmr2322074637.56.1783144661119;
        Fri, 03 Jul 2026 22:57:41 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:40 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:28 -0700
Subject: [PATCH 05/26] Input: maplecontrol - stop polling and clear
 callback on close
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-5-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225742_088151_A2A5713F 
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

In dc_pad_close(), pass NULL instead of dc_pad_callback to
maple_getcond_callback() to both stop polling and clear the callback
pointer when the input device is closed.

This makes the manual clearing of mdev->callback in
remove_maple_controller() redundant, as input_unregister_device()
automatically closes the device if it was open. Remove the redundant
assignment.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/maplecontrol.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
index a498fc322c4d..c66b2614e298 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -74,8 +74,7 @@ static void dc_pad_close(struct input_dev *dev)
 {
 	struct dc_pad *pad = dev_get_platdata(&dev->dev);
 
-	maple_getcond_callback(pad->mdev, dc_pad_callback, 0,
-		MAPLE_FUNC_CONTROLLER);
+	maple_getcond_callback(pad->mdev, NULL, 0, MAPLE_FUNC_CONTROLLER);
 }
 
 /* allow the controller to be used */
@@ -156,7 +155,6 @@ static int remove_maple_controller(struct device *dev)
 	struct maple_device *mdev = to_maple_dev(dev);
 	struct dc_pad *pad = maple_get_drvdata(mdev);
 
-	mdev->callback = NULL;
 	input_unregister_device(pad->dev);
 	maple_set_drvdata(mdev, NULL);
 	kfree(pad);

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
