Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F59CC43602
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZuHN+fj7ZeWFtSCJPc7Q4yEVT8a8Mm18Fqc7IEfhu0=; b=s9Kn645nzj2vtA
	/iEoou1xFpw/Hca1e8qooYE6NC1ZWx6owspflsMRojdQ/wExiIc02AF5FU1tzY+opbBn1CDH3ypvf
	muzH+ZsG6/N766m3FS4oMUpnBPOvvxZhkU/kSfxPp1r3ux0Fx6ifWnoobMXHVDE9Rn+amqkxazgUF
	D/XyBslSgkH0c9FH64n4O+Rk04dJrbl6hWGb8RWLnDYOb9EuX2o/u9R8chNYbhAcB7mqcPq9VAVvK
	cCEN4yZLcOxa9A1OvpKFxxgLbeusr3U3ruNCVmuLeEozM1TBbnndfDDPkllW6dDFWoWqsxx3LjM7j
	XyhkzZ5RRFwE/6eBdFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNz-00000008Bm7-04Qg;
	Sat, 04 Jul 2026 05:57:55 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNv-00000008BiG-2qLB
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:52 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-381ed661712so653554a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144671; x=1783749471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HP2OCLaMtFKD9zBA/qewPxKeAuiUz90Bk4XmeA+Nsw=;
        b=R4QTC4NTfrIpXhdKutk4WG3+LejriDbnE3ou6S9IU7Vv8VcWRqzDcRFBIDJsxk8bG5
         pJfY2Mb8O1/7A0Rfj2GddZWz9uHP0nI6WKRyhC3uBGJDwsm3qxp+HaYyePu169NH49m1
         XpYY+o+9hPT6hkOGPmzFmAuhRgchXWg/idDKcR1ZZ+SuuHCAxJodOj+2CoJTWtqhuZxn
         1aZkqQ8UtQc1wTYdM4z1bP3DSQzoCmogKlFJ+aGx1OKkLsY9dW1mP5Cyf/UqOPiKnUSt
         lqxBGu28XwKZPExPPJSBnLJW1eklQllXX2Nn8BVTkNorBaQ/KdcG8MTORwF06xIwWPFd
         WUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144671; x=1783749471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1HP2OCLaMtFKD9zBA/qewPxKeAuiUz90Bk4XmeA+Nsw=;
        b=WxAfKpWD26Skc163joTTmG1ZgBSZoX/f3zV5Pz+0T/zqYw+iv5bCWitmNsKLYeKFkc
         mItJZvNUUktoMirafbuz9SqF7XE4Z4b5z4bDgEVYOVCb4KI87O9vjm5z8l8sjCAGOQ7+
         LMQIyZGRnDYBbffvlMEnsMRXTK6wLxmaQvRKNIZ2QCDsNjCKS3juwxtNeEvOTALmQkUS
         0Rz+rjP42AfRvZsGQWfQ6C2FB3zf97QRWoqC0jund+UjyS+4QL+/hgqBirnqC0RGVoo5
         OYmYDHkYmEdILlUhqFhJNNA+UIFmrJRlhASQEeRbnrZP8tVJOONvCPxQy2P6uSRCcTGW
         9aCw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3M8zUtysE6QTTB/9nLMkf2EYCY+DJFjuH0X364P820DFQb0tLDRQBiWC/hrPjq4epM0/TwxdV2bg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5dyQe2ZDB8O7d9cLbHlVRYeek9/mYDl1RKUCKv+8dVqI+UeWa
	XcF4Y+JnzZzOrGZ63nBakizMjann+qNQ2sCRFXT16dB3x0MoSiFotcVL
X-Gm-Gg: AfdE7ckSG3ByaOKVSk53LVM0ervb9loHRL5ZoH50eXNM5Dpzme9WsqcgKK5IcyYwOXc
	RWTdcWa9aLYIoaR9197irSO9RGgXcuU3tVTiXvDYwtP6IdLuotv7Q48yN5wsRz6/Fao+CoL5DEi
	QGyagn/JoIW7HWXoRZwpl6sCAg8CwdqHvcfkZ+BEOdufKzHkKwwdlPyZ5ngsdj/vOUBPrM/JY9F
	2LPNTkapUP4jIrd68gHh7gKx0mvzaBpXvIekN4n249bw7AuaG+tmJRLGOHjEMcdGu4xEetzDjb3
	Uxj1ys6/Nkr5owCT9goGpztWN4a2i89h2WI9qXIHsh0vk/X5BIjROGPEfdhYb3NdPtBi6QKDpty
	Pmop4hBS66hi5rL8RyhsTJpw2u04JASHmFYAediRMPTs8O2ps8My90J4mpHYds1lHJTF73nBzD/
	UlSl0FMLp1rNwdIPv0CUnA54Bg9zpFp2+TjLvmG31k45AsqFn40jLHFEWum1Ov7qOn4KviyPx3G
	+4=
X-Received: by 2002:a17:90b:2c85:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-3829f9deb79mr2313752a91.32.1783144670906;
        Fri, 03 Jul 2026 22:57:50 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:50 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:34 -0700
Subject: [PATCH 11/26] Input: maplemouse - remove unused mdev->driver
 assignment
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-11-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225751_731684_A66462ED 
X-CRM114-Status: GOOD (  10.83  )
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
mdrv variable in probe_maple_mouse.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/maplemouse.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/mouse/maplemouse.c b/drivers/input/mouse/maplemouse.c
index 37f60bbd0ba4..f67e3eb5841b 100644
--- a/drivers/input/mouse/maplemouse.c
+++ b/drivers/input/mouse/maplemouse.c
@@ -67,7 +67,6 @@ static void dc_mouse_close(struct input_dev *dev)
 static int probe_maple_mouse(struct device *dev)
 {
 	struct maple_device *mdev = to_maple_dev(dev);
-	struct maple_driver *mdrv = to_maple_driver(dev->driver);
 	int error;
 	struct input_dev *input_dev;
 	struct dc_mouse *mse;
@@ -102,9 +101,6 @@ static int probe_maple_mouse(struct device *dev)
 	error =	input_register_device(input_dev);
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
