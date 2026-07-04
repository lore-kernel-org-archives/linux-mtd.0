Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B17C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toFulsIYCKuZLZ9fsw5qJM/k4uL5YfJ93D4VJasrSh4=; b=2blco18e+hN6by
	kM4NWEX5fINLGgDNta+UMf8zeD5ztsiPMjGpBUj5wx0SvvGQArh+TCaWXRSaS/0l8S/wm68Z0BVWN
	x/3R+p4vIC6N+7Zl2CunnE+u0SwXH5GPRLJIUgzgBbuGdKsCAT/+h2j0G0sdXigL/X33S90ocuVy9
	J4HqWrsLYkRDejnB9nHsjNJeMQe+4OYloUItunB5HGh7nHnud70P1ZtI3mNhOi6UUyJAyWc4oY1iI
	dxHj2pp0wPhQEn1PKK33WDCtI7AMeEYyDVv46F/d0YsiRDR8M2JneeBkpd5vhUeDMiQzEHbAT0FOK
	CgZl9PREPwY0AdI4z0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOQ-00000008CXK-43cf;
	Sat, 04 Jul 2026 05:58:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOK-00000008CLt-3bvu
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:21 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-37df416c44bso969516a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144696; x=1783749496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEG7tX5+i0yM5fGvf5APIP8u2V/3BZ/C2R2J5nBR/YM=;
        b=I4WGGVc95iUGGGpX0LejSpm5EXHpWkPf8BOdbDzgT70wGybt9R4YFI/6Vsf3U0tjVz
         wXeYGPT5nD4gpn5tAbk6ralP6HNyA9sBHu8XNUku+LHf9nwKseFMwbaXXjYoWMHnPo1q
         Z1Ez0ujBcM6fgrOjrafFiI9v7TYBZLebBgdFRxgwLtouaZyaYV/lsB6pdnN3rLEptM8Q
         NxvCbfCV3Ox9+IEHSzYpfHKz+nM6upIqrSdUgrmzW54Ox0k+4Hjg44zzdsXhwQzh0thW
         tIiuemGKNRSYbLLSdRd/SGYuYb2yq9gzULsCMgHmYVJhxS9XxbA5pd6dOapQEUgPoWCL
         fYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144696; x=1783749496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEG7tX5+i0yM5fGvf5APIP8u2V/3BZ/C2R2J5nBR/YM=;
        b=ck1wEyjyefLL14MzaPxpctK4n4Sss/rWUg92HzvyI3n8Eh3N/70h9cB+Om5Nb7B24x
         CAARsdu/ar7UYt7/lH8kTmlJclZ+iFb3fjfiBE+7C1ig33peMjjtImSIxwdFsZtvyNnm
         fjjD67cvE8+7chhkV/69imSXz0Z+KvuoWhzXJ4J0r2eHGxa9oQnu1Ob5vkDQfoi3EwP8
         gW1mE/EowFjKfD6Q93YPRodjxu4BOBPFvqygf1ctAnf3nJ4Zp2NLBjogHAQKCoVOruca
         2U12cofCP8buqPzm7IQrbdoj6e4Z8X6XeDoGuO4/B56d82VyFnkLUIkd4i595lgnm8j6
         1L3g==
X-Forwarded-Encrypted: i=1; AHgh+Ro9zmMhmCcaWGm39T8h4Rfdlxa+R6WMQ4T/IpG3c4kKAW83c/RVpy+iOmqRNqCkHs6zaRgrPeuzSBc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxE1pN5JoSHbCJhkTUiwdSsNWdshfuTnnwXT0YgIPlVD+38Cir0
	/4xBoqW3Ctj5EgzKNmtn7mSQ4Of3D8vi+gSDnkxfXc2hPB7L+Q8xLr3e
X-Gm-Gg: AfdE7clYvtZRQknCSQia1U+lnpXN7HX/QolwXa8pOpg1nWw43Gob5YXtjtlZNx+A8LF
	JDDGz7ReRfewdfR/7rREKCZ9xlUdZDjbrTR0wZxPdXso5wK5OM255vwlhkFsyjHoNQHKpc8JI7W
	LBqjZTVvaT2ybMXnlDS1k1saYtbCmwBDzEzLqkf6lb6ow/2asLEtvDBc5pFHBbEOHH4T3WpFOB1
	Uay0cK3V031xr3fEOOYHGyjMhlG2EXdoUY88WkAOMOf1+jOFK02eSOEu8pKdyYnZpz3xr6KQmRK
	1aCPfc177UOOiSelJK8TPfuaw7tUWDpDo7m2MVvmxLLhzFVNWKeGH7PAlZF2seAO1G9EHHbmK7r
	EMm/6iKYaC3rOCQ4MkAqsA3dWuanPcX/1rvsiAiCpyFMp4zmG/+ZSQq6saerF+bHbLL2RxWXIDY
	UZBR8C/dQTPHlpvZHWE2R64mcF/rI0XnCY77rnP6Usc5gLStFu12U0dCNaPynIHMS5o1UdfNjhr
	rY=
X-Received: by 2002:a17:90a:d44f:b0:37c:8628:f79e with SMTP id 98e67ed59e1d1-382934ec0bemr2222411a91.16.1783144696090;
        Fri, 03 Jul 2026 22:58:16 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:58:15 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:49 -0700
Subject: [PATCH 26/26] Input: maple_keyb - remove redundant 'new' buffer
 from struct dc_kbd
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-26-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225817_335731_628FBC91 
X-CRM114-Status: GOOD (  14.11  )
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

The 'new' buffer in struct dc_kbd is only ever used as a temporary
staging area during dc_kbd_callback() to pass the received hardware
packet to dc_scan_kbd().

Remove 'new' from struct dc_kbd entirely and pass the received buffer
pointer directly to dc_scan_kbd(). This saves 8 bytes in struct dc_kbd
and avoids an unnecessary 8-byte memcpy on every keyboard poll cycle.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/maple_keyb.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index 1d99ed5bad1e..5b10c6ba7bd5 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -23,8 +23,7 @@ MODULE_LICENSE("GPL");
 struct dc_kbd {
 	struct input_dev *dev;
 	unsigned short keycode[NR_SCANCODES];
-	unsigned char new[8];
-	unsigned char old[8];
+	u8 old[8];
 };
 
 static const unsigned short dc_kbd_keycode[NR_SCANCODES] = {
@@ -75,7 +74,7 @@ static const unsigned short dc_kbd_keycode[NR_SCANCODES] = {
 	KEY_CALC, KEY_RESERVED, KEY_RESERVED, KEY_RESERVED, KEY_RESERVED
 };
 
-static void dc_scan_kbd(struct dc_kbd *kbd)
+static void dc_scan_kbd(struct dc_kbd *kbd, const u8 *new)
 {
 	struct input_dev *dev = kbd->dev;
 	void *ptr;
@@ -86,11 +85,11 @@ static void dc_scan_kbd(struct dc_kbd *kbd)
 		code = i + 224;
 		keycode = kbd->keycode[code];
 		input_event(dev, EV_MSC, MSC_SCAN, code);
-		input_report_key(dev, keycode, (kbd->new[0] >> i) & 1);
+		input_report_key(dev, keycode, (new[0] >> i) & 1);
 	}
 
 	for (i = 2; i < 8; i++) {
-		ptr = memchr(kbd->new + 2, kbd->old[i], 6);
+		ptr = memchr(new + 2, kbd->old[i], 6);
 		code = kbd->old[i];
 		if (code > 3 && !ptr) {
 			keycode = kbd->keycode[code];
@@ -103,8 +102,8 @@ static void dc_scan_kbd(struct dc_kbd *kbd)
 					code);
 			}
 		}
-		ptr = memchr(kbd->old + 2, kbd->new[i], 6);
-		code = kbd->new[i];
+		ptr = memchr(kbd->old + 2, new[i], 6);
+		code = new[i];
 		if (code > 3 && !ptr) {
 			keycode = kbd->keycode[code];
 			if (keycode) {
@@ -118,19 +117,17 @@ static void dc_scan_kbd(struct dc_kbd *kbd)
 		}
 	}
 	input_sync(dev);
-	memcpy(kbd->old, kbd->new, 8);
+	memcpy(kbd->old, new, 8);
 }
 
 static void dc_kbd_callback(struct mapleq *mq)
 {
 	struct maple_device *mapledev = mq->dev;
 	struct dc_kbd *kbd = maple_get_drvdata(mapledev);
-	unsigned long *buf = (unsigned long *)(mq->recvbuf->buf);
+	unsigned long *buf = mq->recvbuf->buf;
 
-	if (buf[1] == mapledev->function) {
-		memcpy(kbd->new, buf + 2, 8);
-		dc_scan_kbd(kbd);
-	}
+	if (buf[1] == mapledev->function)
+		dc_scan_kbd(kbd, mq->recvbuf->buf + 8);
 }
 
 static int dc_kbd_open(struct input_dev *dev)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
