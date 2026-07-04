Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA77EC43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/2UlDAGjMl9uX3zPDmViyjeVVhUp1osXg2ZHXNWN7Y=; b=g0PhNKLlWKoHcz
	hg6rsN6Qj2gJJAyJ/l7AJGwEgsQWDBevc9nvP5kia7yd4UyVASkFZ7e6rNlgqvGk3n5HsQRZMTQ/D
	BlFJkf9FJaSVXtq/yjlxi8bENsabvlm3ypPojSdfniK9txOnCM1zyHgj+b+wNrrl1kNBloEiE383/
	krWZ1L7ih7tSI6A3Gfclw36O8xH8YHgXq38jkl2J3uPzB4GgegUQLTveqGM+zITKLhMH2amfJ8xYp
	QxMUE+JHzlv6W30biaLBsP2vaxtraVv+93/3sbvUwvu4ibs5hErvYPaYf44tJtvvqiDcXexRzLPYQ
	VpLo5TIAAIdYbwZoCV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOL-00000008COz-2JAF;
	Sat, 04 Jul 2026 05:58:17 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOG-00000008CFP-1WfH
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:13 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so614811a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144691; x=1783749491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWjg7UC3W2OY/ypUpA0NQNYwI2Wk9GMT1X28efRSy2Q=;
        b=OWdqLiGp+XklcMaDGa+eH+/7fhO6vi0GlBduOXJ8kq6nPjKkqN86teuj2jniF/uUpR
         YwfSSiy1z4O2rWseKzPeNlR5S1Q2kV4YyECiVQhjIBOa8JFU4gRJjNjaU95BK9bT9g6S
         X5+cf7l7A2qG8miqvhYYQ2M6VzDoflXFQDFTptEXJLEiXDk/zkRVd2cIN09HjZnSh1Ii
         zdSsRM+xm6pMccPycxa0PSIYEuQLDXXeTjL4c/OLksuUdHfRsmdq0R6L6bBTKZArBPwQ
         yKFe2D08xJsbB/uGKME+Sc9eoEbfZyKNH5XH+bckeJJdUdazekdTTmS5TNktR+Ysxcd8
         zASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144691; x=1783749491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cWjg7UC3W2OY/ypUpA0NQNYwI2Wk9GMT1X28efRSy2Q=;
        b=LlGxA9EOC7bp9sDR7j5jP2SzlJatX5e21qCLkccCXImIqfRBbgI20262Ecr5YDkR85
         ITxLQtVIDfZYhzfCjT6DUb+ib+YowAjhmxbOeNO9EihBdRH7fk7zRqwYsy7khmBo29zZ
         2I3tpfZaUMNF/qXU7l+AT2Akv2e6W+8q4K7K0T0ado72Zi74+lff5p9cRxoRAjhiUvUw
         wIKAg0PjkVVuQj9GFGIaNhcc8jPhDwqUQk+Ui7NNYnvV4T2MWIOV5ozN00ikshxoto1/
         /GaaU6+fJ5eSoGSO/XG3Li/iOnSOFuxoVAmUQm1dxnDjD+hBKMS6gAv3TtQCjN0Q6yqE
         R88w==
X-Forwarded-Encrypted: i=1; AFNElJ9t3aU+mMZNOGgiYd5Oqbh8kUkbCGDN2w8J31qMPR/WBCnA4bXXd1i/Tc6zC+b24FQ0bkDQdDSqYf0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBS6FsMFfil0yfZmJlYqWqTF0xKOe1K4uXzKa1b4ttAb0+lVVc
	wympn7VdQ5MDDn0j6IM0OX/gmDPiAJ1J8sE/G5ZYpChx/Qy39L/QEykk
X-Gm-Gg: AfdE7ck5NwBw7IOxOR1NDRWgWXIF3GH00ttVmZySVDs+SIZ3NXfwIPzGRlbwTwBS6R3
	fgSphRgPbPDiKfn2jNBeeIqSH6bWANothxm3x2kfuhoYaJU9rLU1JbpikDvKr9T0U+nMT8hvk/4
	+CZpCB3ZJz6cHREVCJvBMnJt5ZcFukESLlpTfIl8P16Gw6pabEaVVYD9+XgG3UeMa2CncmzOJoe
	9qE+UyZQ6Fi8JaDNW3b16vt95L/5bAGuHPunuOyyWKXC0p9lsXs9E8CUlUQD7bsM71/RAvj9dJa
	U4zO/A6aACoNoaC7NVVrLeL1qRsqlEitRL38gAQB4oxhUcQ+crvipumG6patzZ2sViQQPNQiXTj
	rg1T0+jSHrw5pQ2WjUHnorToulZurMk8cHn2Z/Gw4/cvSz/pPJ09wTOO3lIVTpbT7SzViurUtP3
	4MYnijrfX4iTJQjREDVNOI4PaZreidOH1JYm70mm6B08DVQxhBxgXGpoJmfieWfVyimPXLLbVfs
	lk=
X-Received: by 2002:a05:6a20:3c90:b0:3bf:6c04:a817 with SMTP id adf61e73a8af0-3c03e4dee8fmr2742445637.56.1783144691289;
        Fri, 03 Jul 2026 22:58:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:58:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:46 -0700
Subject: [PATCH 23/26] Input: maple_keyb - fix style issues
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-23-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225812_416181_B4584D04 
X-CRM114-Status: GOOD (  13.28  )
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

Fix coding style and formatting issues reported by checkpatch.pl.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/maple_keyb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index bd4ce803a13e..1d99ed5bad1e 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -48,7 +48,7 @@ static const unsigned short dc_kbd_keycode[NR_SCANCODES] = {
 	KEY_F23, KEY_F24, KEY_OPEN, KEY_HELP, KEY_PROPS, KEY_FRONT, KEY_STOP,
 	KEY_AGAIN, KEY_UNDO, KEY_CUT, KEY_COPY, KEY_PASTE, KEY_FIND, KEY_MUTE,
 	KEY_VOLUMEUP, KEY_VOLUMEDOWN, KEY_RESERVED, KEY_RESERVED, KEY_RESERVED,
-	KEY_KPCOMMA, KEY_RESERVED, KEY_RO, KEY_KATAKANAHIRAGANA , KEY_YEN,
+	KEY_KPCOMMA, KEY_RESERVED, KEY_RO, KEY_KATAKANAHIRAGANA, KEY_YEN,
 	KEY_HENKAN, KEY_MUHENKAN, KEY_KPJPCOMMA, KEY_RESERVED, KEY_RESERVED,
 	KEY_RESERVED, KEY_HANGEUL, KEY_HANJA, KEY_KATAKANA, KEY_HIRAGANA,
 	KEY_ZENKAKUHANKAKU, KEY_RESERVED, KEY_RESERVED, KEY_RESERVED,
@@ -92,15 +92,16 @@ static void dc_scan_kbd(struct dc_kbd *kbd)
 	for (i = 2; i < 8; i++) {
 		ptr = memchr(kbd->new + 2, kbd->old[i], 6);
 		code = kbd->old[i];
-		if (code > 3 && ptr == NULL) {
+		if (code > 3 && !ptr) {
 			keycode = kbd->keycode[code];
 			if (keycode) {
 				input_event(dev, EV_MSC, MSC_SCAN, code);
 				input_report_key(dev, keycode, 0);
-			} else
+			} else {
 				dev_dbg(&dev->dev,
 					"Unknown key (scancode %#x) released.",
 					code);
+			}
 		}
 		ptr = memchr(kbd->old + 2, kbd->new[i], 6);
 		code = kbd->new[i];
@@ -109,10 +110,11 @@ static void dc_scan_kbd(struct dc_kbd *kbd)
 			if (keycode) {
 				input_event(dev, EV_MSC, MSC_SCAN, code);
 				input_report_key(dev, keycode, 1);
-			} else
+			} else {
 				dev_dbg(&dev->dev,
 					"Unknown key (scancode %#x) pressed.",
 					code);
+			}
 		}
 	}
 	input_sync(dev);
@@ -191,9 +193,6 @@ static int probe_maple_kbd(struct maple_device *mdev)
 	return 0;
 }
 
-
-
-
 static struct maple_driver dc_kbd_driver = {
 	.function = MAPLE_FUNC_KEYBOARD,
 	.probe =	probe_maple_kbd,

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
