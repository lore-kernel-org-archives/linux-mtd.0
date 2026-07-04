Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EB8C44506
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRZqAzBTfP3i+TNRmsZz9PKI+qpw9rZZWsEuK/H/RkA=; b=iNPBl8dIiwKrnR
	t3FQHWZwMv1nM66dcpjxcCniXQLHhvLIGiF3F9FZ/Jgg1AjFWL4zFy3zUdeYyPoeqGSYWMNVAwbXn
	hnEA1dZhTTfNIc8axialaoQKwr8zhJ+PNPjMkRFWh57Pr7fX1j1e+7pJphvhngOIFZ141YcBifmeq
	YAjHTYdf6SgTUzkdFR2xKfsUIrUiHZzWDzj8dJXAn2o01e4mGB7nc/2eS8jjRZHWRenTULTwCgi2Y
	bKC+9VStSqBSvAiX5mKUnYx4EjcMOYoBRUDeCVDu5zv0zzNZxaIp+D9l5c+mHpkgEftaiAOxfUyvg
	OnER6t8ib2y55ffIVj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNr-00000008Bcc-1N8J;
	Sat, 04 Jul 2026 05:57:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNp-00000008BbM-0FBC
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:46 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso466201a91.0
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144664; x=1783749464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=As+a+oXMaauuXL6cjX0g2Fcb3J4Vh+vaEl8MbjsXlXU=;
        b=L4wgBD66PRSVTkvbmDxsp5xselpEFhXz13MV1bYujHbF7zv0J1P8Ki9fpxo71j6w28
         cNYPoRTrIcnNwZ1DOz+7KaT7jnSpGt+tlfpwLt8zjy5x6XY29NmueO/FmZQLssFUqNOR
         TcbcEgNjgtRAvye2KRspR8XWsF5FrSd3CaZx+dOJMFayF8RSr54aqFb8y05bAkjRLbm6
         fOmxgS/fOknozSiDe3fPHusnnz0eb2NCr1Ia8lyw1N1F939kjjCn0eCq1mSDAWE2zSNc
         waVqrbiSpopcuKGAlGPt5KZEOGEGVSMIGk7+vkSQl+oTZQow7X6VTHXD4vHJSYsZEE9W
         L6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144664; x=1783749464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=As+a+oXMaauuXL6cjX0g2Fcb3J4Vh+vaEl8MbjsXlXU=;
        b=aVy18RPj4zijXPqA14MSj24g3FrrFegi+/iUpbouDbDKr0jT11liRbZxaXE8LOf5hi
         pzC9EI/5m6h79N3uS5yGCqIeXsWR/QaNmJL7JvXQQWP5Hc6g9e2PKFgrwyS4Rpi2+5y+
         qCRdyZQrJRNIEf6b5QfpSmQ+IGrzRjJYasombKuR577poRTuc0kApwYfVC2LYDkd9jvl
         cIBBhP2eN+L/DxW5Z2Vymk3t3XopkRCqqSLGlzi11JBbcl0TDLBvCdxjeIQyBLSgiO9g
         c8ujrgEagU8ZYvlngDy8A3T8HZvFCuHvHeLugOPnQDSclkQCswbnz5YwQLJ7RzOHuYBk
         7chw==
X-Forwarded-Encrypted: i=1; AHgh+RoyeHjQ4yxc9kRUJrYSUWuCs073LFHkznTQNZrCrUtmWMWuBOrw8P31mXcjAKiqFeAxXf13WZFtbus=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRJCdGjem5jQ41ZGbyvbo4GjEifY0IThDVbOb+VRV2SIJQeU3Q
	ct50KGj8FMCVDt3dFNo5BL84lL9xaekigYbwHjTNTornQdR0wU2H4b2E
X-Gm-Gg: AfdE7clqfwmBlhUTdSogkxmYWixlP6yHJ9N7itD+2BoUyRBdb3ca0X+495BcMUV51Gf
	CrRHYKPeaQdTT5t9Y6CcdUajljgZeOSdS48n2dXUZlcSTP07HmVKIqr9FLlUSvTG+lMvfLabaBi
	FrfvSSVHoE2X94pIsti9vRK3kXtSPeWgE94Xgdrn0Ao+NR/OQjutPWXIF/OarBCgr6Ro1/mdhDz
	oJ8b2b5ydPb61jhH73PygRR6Hc/KODisEzmulETtwJbyt5186PCPwBx80qsiSJsghpXwoFQpJWT
	ldhYtzALwww3qvvXYX+ONBLi7196q6TMOf0JDVMQhzmptQ9jvUWkhfa8b/HLwS5CujH1Jp018Rm
	HZM3wAgJiroHlxLxaEO2Jyf6tfK/7EKnWzbtMb002bab7moX91TrvphrMPxd62fM8VPGQXLZcwA
	8H6D35YhulTl7YFTeP/rIpPq2A17nOFyj739bewiM1MRVp0CLu4iSul0O5B0cb7oBmodnBuJmG5
	fDk1Xi6tzwexw==
X-Received: by 2002:a17:90b:58e8:b0:37f:b16a:cc23 with SMTP id 98e67ed59e1d1-3829f5ea622mr2048940a91.23.1783144664401;
        Fri, 03 Jul 2026 22:57:44 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:43 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:30 -0700
Subject: [PATCH 07/26] Input: maple_keyb - implement open and close methods
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-7-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225745_107705_85A7B6BD 
X-CRM114-Status: GOOD (  15.75  )
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

Instead of polling the keyboard constantly from probe, implement open
and close methods for the input device to only start polling when the
device is actually opened by userspace, and stop polling when it is
closed.

This matches the behavior of maplemouse and maplecontrol drivers.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/maple_keyb.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index 623d7951405b..a245774acc55 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -140,6 +140,24 @@ static void dc_kbd_callback(struct mapleq *mq)
 	}
 }
 
+static int dc_kbd_open(struct input_dev *dev)
+{
+	struct maple_device *mdev = input_get_drvdata(dev);
+
+	/* Maple polling is locked to VBLANK - which may be just 50/s */
+	maple_getcond_callback(mdev, dc_kbd_callback, HZ / 50,
+			       MAPLE_FUNC_KEYBOARD);
+
+	return 0;
+}
+
+static void dc_kbd_close(struct input_dev *dev)
+{
+	struct maple_device *mdev = input_get_drvdata(dev);
+
+	maple_getcond_callback(mdev, NULL, 0, MAPLE_FUNC_KEYBOARD);
+}
+
 static int probe_maple_kbd(struct device *dev)
 {
 	struct maple_device *mdev;
@@ -167,6 +185,7 @@ static int probe_maple_kbd(struct device *dev)
 	memcpy(kbd->keycode, dc_kbd_keycode, sizeof(kbd->keycode));
 
 	maple_set_drvdata(mdev, kbd);
+	input_set_drvdata(idev, mdev);
 
 	idev->name = mdev->product_name;
 	idev->evbit[0] = BIT(EV_KEY) | BIT(EV_REP);
@@ -175,6 +194,8 @@ static int probe_maple_kbd(struct device *dev)
 	idev->keycodemax = ARRAY_SIZE(kbd->keycode);
 	idev->id.bustype = BUS_HOST;
 	idev->dev.parent = &mdev->dev;
+	idev->open = dc_kbd_open;
+	idev->close = dc_kbd_close;
 
 	for (i = 0; i < NR_SCANCODES; i++)
 		__set_bit(dc_kbd_keycode[i], idev->keybit);
@@ -186,10 +207,6 @@ static int probe_maple_kbd(struct device *dev)
 	if (error)
 		goto fail_register;
 
-	/* Maple polling is locked to VBLANK - which may be just 50/s */
-	maple_getcond_callback(mdev, dc_kbd_callback, HZ/50,
-		MAPLE_FUNC_KEYBOARD);
-
 	mdev->driver = mdrv;
 
 	return error;

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
