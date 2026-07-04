Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A17C44500
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXFz+Qtf2beqi+NFm2s6icI9RCw+pfKGentKvM9l7Z8=; b=zzWkF42SUDM11I
	edLA8ttPs+c6zRcYNIKOsMXczbcrcCcSrKg8pjXMmaE+tuViZq5kZGNYGTIpfmtm7/W3Qkmpuur5p
	nofxUKeax9JuAqkWX3B3ZxoAo++wGi6LqSafkVBlJGTGa6XQIuAXOOv2P6E6M3IyYVAc7UiOz0dZE
	R0QndKgwpPumZfnhvhlLIrivGnYkoKdYb7S0GIYREo9BGlei9anhSN4GcCnPQHPL/RsP7wCS8LQCD
	RtysYDGkW5f/QVO4vziUoSEU6JgJ3JuarOD6dWerwhuTikJc1v3BazKncDT2SBGEqFDSCA5su7t0V
	JDLN3b2wvc8x9VOJBfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO0-00000008Bnc-0oQa;
	Sat, 04 Jul 2026 05:57:56 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNx-00000008Bjm-1T3J
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:54 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9672e02e05so678668a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144673; x=1783749473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07j3He9KyvXqEqK2ACGmojqTsdGGsyBD8B2ZxOHnjt8=;
        b=hHIrqYocogDvUUUJ0pbu0vR6KdqO4g8cGc2nyxv2+qZG1vCFclHgdHASIGf+R4L/b3
         6b721xkAzsCCLsMoVcFcaiWoKidBiXgYmWacz4q5wvgISmFXbFyTYNlvCQvqQ0m+GJ2s
         kBLmU9aVMb/cfYtRvzS2PmQJIHTrL8maFSbbGBGb75EJVcsGvPLYagubTiyhadbtzKmh
         tH+1wYd3jNvistkWNnnMRzUiS+eGh/DoxvT+L9GTfYXI6nzIWBuId0eljfQghU0A0iDD
         bKSTN4fttdkfbEzSuzibhmqcV0iMPLZnlP0Yen6Hd+4hj+Y5iUwL5ZNR+Vn9853pKTXb
         wpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144673; x=1783749473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=07j3He9KyvXqEqK2ACGmojqTsdGGsyBD8B2ZxOHnjt8=;
        b=BxdfbMEaY9yg2MVjb4QtK2dDn0QFNvKaeoM7krcRLS6ZGJWmbTsbrwyCo4adiiMKMl
         +opffu2bn7FdqmKCkfkLTQS2LhsMbaES2XhS9cskDLIULMHTRUGsf9fxGbOFrDIKZg7z
         Wahth3gOqev7GnNA8sciHPutS5sAYkMypCauCO7+d1yX5csQaCtTV9iHps+p5iqzg6Rr
         cxn6ZFQIujk3ScrSw+WQ/gcCSIbw9rCqwvHirPESUReFWkqnrEWqjUWodwvHx2DOhxV4
         aWjW/a1I87nnXVEndISxIevRjlLTyL2hxCDwQCUzCzusX2bO3h30It7FeRV0o8ROHC0Y
         zrGw==
X-Forwarded-Encrypted: i=1; AFNElJ96FEmVDXtJAVcLtnx2Z46CxocBspgVaNOuFHan9VbGdkxQA792Z6UtrcqI6cnZiZ/J3gcqsNp/J2k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsN9m/oEQyY+K2d8FL9KdGRXOZZ++x4mtueOxEdL25bJEcJVbO
	00NT8NOS3iClGYbqpcwi/x6rp31X6xv6je9Z1qYa7TTcos21IySynPjc
X-Gm-Gg: AfdE7clIQiTR1msOH9KveChBabVpVRu808vp05brLNMIRoQHFyLyOhCb7SyS11VefmS
	x0trWoaKDxsV1scmtDgGgPCVG5sRi9fCDO1+8qbrIB/vTRCwETOvjXnldnBTdmXNKYnBJfNXT6E
	sRX49pEoyv91r5GxgL3zZjyQdefy3jyV9SL83c1KCxiOJSE3T1/J4LBs0Hik1eJxHZEDqiEZA93
	PINK5SswNa8i9X7g1ZHKwXG/GF8x2CCMP4UshprDhD9b7f1kDDg+uhK7/VJL1ul61D250oRqHOL
	wt7zXuELYY6puWaLnMe+8GLAiEUkv5dXk1eYjLDk6/620wJ76ZZJX/v+uiOXUsIByg4yLGRj2pe
	hGo1tojbaps2A7gUUeyv/mhwblaWrSZA2pblpFjmXfXxzXiVJmqcpWLzbXcXhCgbt6qroWreoyV
	AnoZL1WonRHSmW9XAnWXhufT8u0duPUmnU2UfbZMmkZ1Covep4rR3DGzebP0hBf3TOnxE4uhC7Z
	VM=
X-Received: by 2002:a05:6a21:2d42:b0:3bf:6c08:fb87 with SMTP id adf61e73a8af0-3c03e51b48emr2391065637.55.1783144672651;
        Fri, 03 Jul 2026 22:57:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:51 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:35 -0700
Subject: [PATCH 12/26] Input: maplecontrol - remove unused mdev->driver
 assignment
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-12-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225753_821879_4AC4EB6F 
X-CRM114-Status: GOOD (  10.54  )
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
mdrv variable in probe_maple_controller.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/maplecontrol.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
index 79cec89ad52a..955e01bcfa0c 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -95,7 +95,6 @@ static int probe_maple_controller(struct device *dev)
 	};
 
 	struct maple_device *mdev = to_maple_dev(dev);
-	struct maple_driver *mdrv = to_maple_driver(dev->driver);
 	int i, error;
 	struct dc_pad *pad;
 	struct input_dev *idev;
@@ -138,9 +137,6 @@ static int probe_maple_controller(struct device *dev)
 	error = input_register_device(idev);
 	if (error)
 		goto fail;
-
-	mdev->driver = mdrv;
-
 	return 0;
 
 fail:

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
