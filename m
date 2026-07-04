Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD61C43602
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzcKHq2tZ1cO+qJW7vXWmk3huTzp1J9zVdXYWZZ8aYk=; b=f270246pHZSIau
	N04rdJYI7bsrvN1A//41hCskSQRn/qhDgGoFSrXv6fxxG3oSxR/6nbutEOmcdUYYfV3lL5a8FDP7V
	VZAAhuXhJKRQ+QJJ/3j5yewPpfxS0JJGJH6G8BnQpOk+enwKCt30ty7eVNJicvUZTpx54UsJD8Xvx
	1mV72T02W8lrZn6kzKIWWP8VjWIG2A56+qaakmjCGKD+r2PtTgCDnVrQxOTa/3hS4dYqm+oEVfm1F
	qiL/qpgouSPsjxTYm/JGQG6zqXYOvJ08/HRJ7LaV+brjuxsbDQRodhj/NXxU55iwT8IqfSknsD0lm
	Bek8pCdV33VXr8OeFD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOH-00000008CHx-0VzA;
	Sat, 04 Jul 2026 05:58:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOE-00000008CC7-33p2
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:11 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37de8008910so1156050a91.0
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144690; x=1783749490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odQ5XDRk/imIwJvcMYJydfLsPk2M2zgv/XPdgoTp5mQ=;
        b=BIetO4KPSBqHpREWbIGrZAA3IRlLyE6yMFFTrqz+NzJkRmQrVS8tTNz3jTYqci5Aqe
         98K1LhxVJY9yHNDHr7/65x1PP0SQ8bcFX/+a5GWh4L25vkEbx9RgIps0kpWKmLYLR+kQ
         z5lnoOKIdUz4OXbLXG0WzzDvrX9Y9zBz3lC1VuHyjQsp1oPtcjHHsrLK2a6phQJNdY+6
         xVwD2WjytPoXagFZquVD0MV8HFs9GxZA7yedemweJtKV55/NpgP9JXG/HANmfsSyGidO
         ULmIu/Li3wlLf4vKVowaSUk9Qcqa3Hu+5vkSAEc7Wxb77M9VTzSx88JRwIzuMnGYFowQ
         RjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144690; x=1783749490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=odQ5XDRk/imIwJvcMYJydfLsPk2M2zgv/XPdgoTp5mQ=;
        b=SLZ6G4RSyAb0L2NYz+gW6KbZ1f6QKxxrbdUwHQdyFN1r3QGJcATWlGQkZcrR6hv5Vn
         SPgQs8RXrY/6+1x4J9k1EOjgPmpD1m9yH/wI+2fhOjXqtuFOyKP0nBt/9BsnIxD8GNxj
         e41OJYf5oBEshBjmI8Br6qoWakIaLYp3B7T/kfdubiSoP/8nNys+H66h6rfE4bSoC9gP
         c5oyxndw40a9b8HoN1xGVPX8gVNFxOnU2TPMfAsOhNa/5w9A5IE/ZDT/fNYcpATYzkhO
         CzDcXfRfJ04fhpu25ftxqX07TPdhcwITgjrAZi6wt8akRW7ljFBzh9VyXzIdK02ArLOX
         xSKw==
X-Forwarded-Encrypted: i=1; AHgh+Rrv7ScvtmoewBuZs5N2mcst7G0B5AIqupSnnwpzoFFlzZdBjiEvWO/AgrSVHHD/6nHAG5z2ie5wi4E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhFCkrrpY9g+HeFmynCY+gaAov+LLqspkRqe9EDYtBGBqPUMIs
	AR21mnZGfIPcH95S34JwwM3p4njPsAgDpngnsqP/eXwlF9K6t0t0Xwmz
X-Gm-Gg: AfdE7cksLJSWCBiSZ14YlDDi1N1dBIlqTDat4vS83lLex1oFW6UeVs0fBnPCtQCU2WW
	EjdQDSdjAEvzzYT+DrZ2rzIftLX7uA7vIK6c+J9ghFlvicnK4ZAD3SE99RA4HgKBvNqcRHCi/Yr
	n8ReTIz6A/H02AoAbF6vos3tftZTMVSLg4GiMbjdK2XEHMdMhJvBlDUxPPpXuSopDmYU+XaaODm
	iKkvmbATk9pAIFMKrENdqzaKhyzdUZtezIjOxdfHQlARi6+5XPnEFfDjTA19e/31Dc60KnS5+1x
	nhzMLNCGU9ocZX4q3/dNmOyttcOiZHu6ZlCJpANpFG0mx+utFhzpAfnqjeOf5/LhUY5GkjjQGTd
	UH6CTPyzYvZ0wbClCU3MYG0oX/hll/YR4DMj/hjX6nlXrdbSdj9cf/XxHmXJAqDDFnMV0ZCEWN+
	2hkc7P0wMC7LDtitieG2606ti50W2N5gWyidzf6A1aecLks1ZdFScgJznrbzyez1cjboCdJh6tX
	Ln1onbE5reSIA==
X-Received: by 2002:a17:90b:3b8a:b0:380:9d0d:7ade with SMTP id 98e67ed59e1d1-3825c50c9cbmr2507478a91.0.1783144689694;
        Fri, 03 Jul 2026 22:58:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:58:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:45 -0700
Subject: [PATCH 22/26] Input: maplecontrol - convert to devm
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-22-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225810_787633_87A1F639 
X-CRM114-Status: GOOD (  11.92  )
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

Convert the driver to use managed resources to simplify resource
lifecycle management.

This eliminates manual error handling in probe() and allows removing
the remove() callback entirely, as all cleanup is handled automatically.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/maplecontrol.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
index 6864243b0b4a..3ef6652d40cb 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -99,12 +99,13 @@ static int probe_maple_controller(struct maple_device *mdev)
 	struct input_dev *idev;
 	unsigned long data = be32_to_cpu(mdev->devinfo.function_data[0]);
 
-	pad = kzalloc_obj(*pad);
-	idev = input_allocate_device();
-	if (!pad || !idev) {
-		error = -ENOMEM;
-		goto fail;
-	}
+	pad = devm_kzalloc(&mdev->dev, sizeof(*pad), GFP_KERNEL);
+	if (!pad)
+		return -ENOMEM;
+
+	idev = devm_input_allocate_device(&mdev->dev);
+	if (!idev)
+		return -ENOMEM;
 
 	pad->dev = idev;
 	pad->mdev = mdev;
@@ -129,33 +130,20 @@ static int probe_maple_controller(struct maple_device *mdev)
 	if (idev->keybit[BIT_WORD(BTN_JOYSTICK)])
 		idev->evbit[0] |= BIT_MASK(EV_KEY);
 
-	idev->dev.parent = &mdev->dev;
 	idev->name = mdev->product_name;
 	idev->id.bustype = BUS_HOST;
 
 	error = input_register_device(idev);
 	if (error)
-		goto fail;
-	return 0;
+		return error;
 
-fail:
-	input_free_device(idev);
-	kfree(pad);
-	return error;
-}
-
-static void remove_maple_controller(struct maple_device *mdev)
-{
-	struct dc_pad *pad = maple_get_drvdata(mdev);
+	return 0;
 
-	input_unregister_device(pad->dev);
-	kfree(pad);
 }
 
 static struct maple_driver dc_pad_driver = {
 	.function =	MAPLE_FUNC_CONTROLLER,
 	.probe =	probe_maple_controller,
-	.remove =	remove_maple_controller,
 	.drv = {
 		.name	= "Dreamcast_controller",
 	},

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
