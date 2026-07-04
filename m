Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB65C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvvCe3uIQBzZgvlt4AYnADrdx0brzmcHBWOr9N8jZGk=; b=1MfS1LzR66qvWa
	uLCrHQFyzfOWbs+5XxzCT8xDhnQOg1+XjPhFsGzuXOuwVarduqBZdCpdkJpkVxb/59MGDhefhK8/S
	GCNvOo3YUfQirVQEz5xmxGH+76og1UYQIgaT+8+RPzdc5SVLLMrg7cNe+7SaDbEVVERBFfGeO9ySh
	W3bsvmvik3GYe+1U/r+ZxMrcw4UAG9kXEhexO8nvM/x3KJ39XGbyaV5CbOpI495Hh8/6+hq2+AVc7
	v/u+spBsBatMfT36p8aJbv5t6S38etus4ZL9HG7F4ms442JZmzsig8vzCXlt8UVqyhHjlZK8YoWKn
	kP0kybe91U586VjJufOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNi-00000008BXu-36f0;
	Sat, 04 Jul 2026 05:57:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNg-00000008BXL-44Py
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:38 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9a20f70263so788223a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144656; x=1783749456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSErm6zpSptbzDDa+NTYvT0p4kk13g2ope/8ugzuH+A=;
        b=JkySzGZuZslEx6MSZ23vjiR/DjxcgIn3pAA3JUWDe3RiAzaL9OmfqR3Y4ez9ulPAyW
         yVOxCAt2oiWBqKXcJTPOpDr+QmSMopnIzXEFLXHyeXcx6tM8/4sjbfOc64hCimJ5i0kT
         LyCLCXgkgKbdSgN8umh7EE0lUQO3M91SgRRUw3pQrF46ySAGP9k9Cug7hg3whLnXJvGn
         uOkV6Vr2fs/iimVba/uk2qnCBrclEzKktIxSWLCpESpXuY+gH2SUecTA5TMgCARZpE2/
         tf4HegdKO/WbzX0oMAEjPiK79tpdmWWzQno+6z62Q2W7x6ZU/n2q+WW9KB2lUrOkRqgE
         wh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144656; x=1783749456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VSErm6zpSptbzDDa+NTYvT0p4kk13g2ope/8ugzuH+A=;
        b=hboon1PnYen1+kb7QTZEHIPhBJ8MVmI1UP1/fRtEOlPxrs8CPSDQQB6Qdc43KbqaNq
         DF+XfHBGrQGec0rd1PL+qVbVoKWcLTr8kMyXeADhO1PAjq6j9VcbgnB4Wl9p1d6lbEGm
         8XbiBlepqsEmctvaWoP057BZn/qmW9gMT+YNoiq6j48PZpY0/vzhP7wV2tMrnDL1Sa6i
         io0G6WfOtaxttrwvJuSVUrR4s4ystmYCE0XnLrxszwbmXnYCa+hOdPbaWt9iC2Uz/eRC
         7m81aLqc5/2bKDVwXHzHJ3ILPvNuLvByMSdHNqBb066ZsFSKGLR506Xfmt9hOG+ZFagw
         VNZA==
X-Forwarded-Encrypted: i=1; AFNElJ96uesJ6+6LxqDoJP4h8S02F1OZPCI7qhS1Tz4+uZKoid5bhxw20uOFD1oLslldQqPwmPltwfLi/B0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Atpbh1rxfkqh5T1rZMZ43nKvcPjinAFKO02gXex98yVjRqyz
	5j85uFpfjk26wZcjcsNPB1nL1QSF1Ct3ySBD4POIHLAp+SiKFHPwSqMD
X-Gm-Gg: AfdE7cl0+E3lKJrhnt4zq1+DEaKoXRzwSvfcZ/ZIkpiQO5bPX/e9Zz8b+wF+rg7z1Mq
	vME8Mn9aYs6NDn4rk0JshexIu2h9YykCpC5kd3BD9NhWRNKlGpC/aHnEHrxIsZqCBFhxndJfqYa
	SjR4EmD8E4NTm/MzmAxglJs/wQqhfJqPOPgFg5/peD45JU6AqYZC6nHUQqnNaLZREZOtoC6+zYC
	r1/vTosZ/yCIy+vT6tOgHK43fEc0mslygJtkVZQv3XKYpUL6HNTWjfSu4XQHR2A/6dsBzpDlQgs
	1QkC0u6HK7oTc6W/VvE9JAJ4nUz+MsUpQsV8VTkXouwgfwAPjED4hLLhgYj5T05LPcZyfkzlzqP
	WfsUsaJSfWT4/LIv6CA5JYdLDjEuvyB8ila4bkiDu0HPBFHUNXz2ngAKv9Ax8KolP4jgVPIRmQc
	RS/2hcxBcb36IHogTWdbbZqItxvb+lQkMBt1b705sJnE3uqilVmsIvRz4fXn6uIQk23+N1AYbLM
	58=
X-Received: by 2002:a05:6a21:3a85:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c01caacc85mr7518057637.18.1783144655975;
        Fri, 03 Jul 2026 22:57:35 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:35 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:25 -0700
Subject: [PATCH 02/26] Input: maple_keyb - fix key press detection
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-2-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225737_036277_F31C10EA 
X-CRM114-Status: GOOD (  15.88  )
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

The key press detection logic was using ptr instead of !ptr (where ptr is
the result of memchr searching for the new key in the old keys).

If ptr is not NULL, it means the key was already pressed in the previous
report, so it is not a new press. If ptr is NULL, it means the key was
not pressed before, so it is a new press.

Using ptr instead of !ptr caused new presses to be ignored in the first
poll cycle (only reported in the second cycle if still held, because
then it was in 'old'), and caused redundant press events to be sent
on every subsequent poll while the key was held.

Fix this by using !ptr for press detection, matching the release
detection logic.

Fixes: b11d2127c489 ("Input: add support for SEGA Dreamcast keyboard")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/maple_keyb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index 3d5538dd4f23..623d7951405b 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -107,7 +107,7 @@ static void dc_scan_kbd(struct dc_kbd *kbd)
 		}
 		ptr = memchr(kbd->old + 2, kbd->new[i], 6);
 		code = kbd->new[i];
-		if (code > 3 && ptr) {
+		if (code > 3 && !ptr) {
 			keycode = kbd->keycode[code];
 			if (keycode) {
 				input_event(dev, EV_MSC, MSC_SCAN, code);

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
