Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F7CC43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5wIjrKu6rg5qebI4UW06mhvSIKYfwtByiq5MvBgU6s=; b=ljYOWlvsnG1qVW
	yKRJlsQSvpbvzsbGbhgIJd8y6lOhjlOvahz5ROJwunsy+2ot/mOFYkuLSx44UOQMSugqgn8KM6OMl
	p06x41OccXhtwv2ckeLsTLuQlrKG8MxuUfi6gfYYxFCCmNNGB7O8PBMuHCvHm650H7RKwgpw3Pg0q
	CHZFvi+rqWwJnK24imBnclOy9683aAOJDSuHLdkO2/SPsYirp+KihYtVvr3qer9Ikq6i/bg8NBQFc
	CX4nqIuWsXuU8SIC0vNDpsnaxIFL1jZ0adESEwih3SFmn/YWKCmJP3/0FuiT0iMQK0UIRWeTL/CeT
	j44NFkFU2IBoL4EkhNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNw-00000008Bj1-3FPL;
	Sat, 04 Jul 2026 05:57:53 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNu-00000008BfT-0lZk
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-847a52edeb2so923365b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144669; x=1783749469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHrM5LSEGqI4QhlJVp2LQ5Kcemj6Dk254XODTohARZs=;
        b=oZOZ/3YkhHvRmF9pUJwdBHD0k6ADjhINHCsebmwe0o7Qfmk0uWQU1K2qv2afkfBhLN
         BPVptEHKt0OARPskmB8sgOr10TjsPFDNIV/lpgS7tFfGEhNHhEFrhKJzzp3yUK9bt4Xb
         f/gtqJ8Zm5Rqbmccvmtj3Jkdrw5p/5aGeMQgq8nu55xUVT8tgi5zkl/8swfBL8GZVYwu
         XHPdfTmHkehi0rZJXSAUtOxM+cRQkaMAZfYYqO/XXWx2lz6ZFrR+2xjyjj5fdc7UNPfj
         XCWNs9golQVvD8qDSERyBoHnAOeb1sUuFkBypoExKrruvsgEC6UiN6B3b0EMWeWc2jZm
         PU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144669; x=1783749469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lHrM5LSEGqI4QhlJVp2LQ5Kcemj6Dk254XODTohARZs=;
        b=BIXFFE+CNc9oFkTCTADWTWy5Q3Ipvmk8Wem1zP/2aOaqEN51IU3otndKUjTcbUNJG7
         HjDbjkRc2uOwvi+iH9XDgfyYBBSfXYqRPDOj6Mv7siHI3MC60jwfLj7zSuIJGDB+cy43
         RhTs1mr0sJEG7zrogFGBrPhHOKWkYUCqqQlc+484QsBdektFIOaQsEeTP0ilU/pLma1T
         H8cjEjr1QVkiBpdIyEvQv0qEUbOa//KFgiqL9t2qzOODckZVFEqthkYKA4Sc/f9hLYJI
         G8ZWyKLtHCGdiBtKbZdx+uZkNMLRnxJvIMai8bY+japrMUFvJbHKef9DajNQH4BIQ6uh
         zcog==
X-Forwarded-Encrypted: i=1; AFNElJ/867jalFirb0EeNb0UQWzHT0vqOfH+eKigcB5DEwB9XP7GYKg94DHkg3UO52wI8QS2ksRqCaCQrYk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSH0yTd2AqBbOfUV4NEf65qQSozzA2pEgA4L4i8WOrzS1TRPCu
	3Hrj38H1U5O7nazPo4O6DsZPC4qRt37hwEOMuu6AYhNfWl/ZJi/wekFe
X-Gm-Gg: AfdE7cm000NXAapsYvVYGNbpPUMUuhb1+l9ZP9FhBMgL8qhcqy6swSekGbBmAHnc2OY
	C7TC7NRdTddJ13PachHocx/xkDhVqNUsuutmcBuSt+M+XExPuXDTLKWXFX8XIlEIPLEWKxBW0AW
	FdpaJer+qanSmvLh5kXWDCWF5hdJDnDeZMQNFxeusyPQhiz6v/2kKTGtBNWwkN5lEnfxeqUcP4x
	O5ewmmx1k/iCb8ndhM+SBV7khV5d1GihTCW8kiYiCmpPlXABumpfsWGOr7ONUxSB5wUJ08l6R6f
	gvgbu3QVrHAnLzCPzG2oFuoKK01Cu55c5KeMf6F2KzwPHUWAF6S/qrpK8jyaCyOezUFhDvTWwJr
	HgRKRNSxrNHX6ohAMHwXtIQfs/1oCQl9bCijHM/iOv05ydWtPu7SQfVnwxGJNtWhxFWRCNDgMpp
	l/JigdFWqhNLoRI6si54SgOboZ2KvAqBugFmMqgInKiGed9xuyoFnOStmre+nY1ltpvKlSqM4nC
	MLOqfIL3zfSFQ==
X-Received: by 2002:a05:6a20:d70f:b0:3bf:b4ed:5579 with SMTP id adf61e73a8af0-3c03e4f1acdmr2369689637.59.1783144669308;
        Fri, 03 Jul 2026 22:57:49 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:48 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:33 -0700
Subject: [PATCH 10/26] Input: maplecontrol - remove redundant drvdata
 resetting
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-10-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225750_230623_4D21A7EF 
X-CRM114-Status: GOOD (  10.15  )
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
 drivers/input/joystick/maplecontrol.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
index 9d623c9e8f22..79cec89ad52a 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -146,7 +146,6 @@ static int probe_maple_controller(struct device *dev)
 fail:
 	input_free_device(idev);
 	kfree(pad);
-	maple_set_drvdata(mdev, NULL);
 	return error;
 }
 
@@ -156,7 +155,6 @@ static int remove_maple_controller(struct device *dev)
 	struct dc_pad *pad = maple_get_drvdata(mdev);
 
 	input_unregister_device(pad->dev);
-	maple_set_drvdata(mdev, NULL);
 	kfree(pad);
 
 	return 0;

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
