Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1E9C44501
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKm2h4zgAbdTgIqvLoVQswUCcA+LjciYQCIzEw85HqU=; b=D/fV1BZUUaIXTO
	DzmXCXgNzbCN6Gmi+cCQZAlvJa9lXxE4sKJQsaY7FBaOJUB5wxnqjznM1bcFXuAjP6Ky868cmOg1b
	vpNqYTRiSvtho+xJkyss8NZZfuMs68MTGRLdxi5xm0N6YkYGad/SJsq4JraM8vGAAYreZFnfx7J0d
	GfrqYWjBSdWJ6OlNU8rrqeXl9RRFGU5N2wdCvTREhtW6CyVzGflzSgwYEGHQA8htySxngI0cfgDdu
	8fhwDL320W1aJ4m+UXay9/orQWSYvZzoR+rrPLjteQ7g2dDxatiw/HTy/5rctw88V81QGpPfW2I4w
	fctfMQP4b6J2UlzNx+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOC-00000008C8f-2gNE;
	Sat, 04 Jul 2026 05:58:08 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftO9-00000008C1q-1WAD
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:07 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-37d70036426so808922a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144685; x=1783749485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIbYkeRmMJ3qAal/r9Tkhbn+MH1/NZUDryRDlJi/XtY=;
        b=dOEmls6nlQgJbtaFK/4bC3EHFKbfhWu14MpSD+6XMulz84wu+yVr76apyYFQtcG8uX
         Ylf3wPggzrATYveTHJMCLAICjIQdwLTCWj1UvUX1jTp1XdoXaSufwOVGaDzDTPnEa0Vy
         31Gtks/pTJJ/RS6cLspRVdpAXxcrdp1gmXVu8ypj+7fVDWxSxmv2ODHQuO9sWBMDXtgp
         NM1EusW0KlVr/uFb229wFPRnilu/J//KMcsA07xrfJMt36bk5a2INWrqrgFr8o+ubbjV
         ouVv3eu3k8/obCOkLIEe19u/yXT5MMtg0+PjeLO89uL2G0UW4NmcXT0Ir+NzgTIt3MPb
         pXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144685; x=1783749485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIbYkeRmMJ3qAal/r9Tkhbn+MH1/NZUDryRDlJi/XtY=;
        b=sRTnUVjokXj43yGQAbWgs4p8rWaIC634OLhJ3QxasmMJCbFPIMBNGfeU1OQMQGH/Yx
         g2ug7C6X3GNqJl/wZTc0Bw0p7jdXDyhx974tIDRKd8iJsN9SMJnujMs1YlRceumy7Da4
         09W8F/lNseaKl0E+9TXMBlNYoy7nQECBpemVfYxt53xouUdwelO3H57kDPu7YE77mj50
         AHG5q/92XR+m/6VFbBXWdAS9uqZqxLoHtMBjTLiKHSstr7lB/3tz+qPaTJcUdapxj0ei
         tIn8wLyApX4gHYptuyzasMIKu/SJq3Vz1tzom7jNWSWOHVF7gGBhXbwkXaDa28TPKOR1
         VnQw==
X-Forwarded-Encrypted: i=1; AHgh+RqKPht1EyTEzYj4dCAAGvSO0ojPld+43atRb8RYfj7hReB6L1mEcIcpJB/CZ+EwZxRNzrRGe0+Cu3o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1B91aj0tmAdidpS34xH3pHmYt9my8HcXnc/RNw1Y/nd3NsBCn
	43BHQXim1GvfYqs8KmAHKRgs0AFSFt9/SCot/3OXPOoAZErsgGKobWUV
X-Gm-Gg: AfdE7cmK325qhNR58NZCiiLSrPEJH3BU9Q7ad48F3fxsuNVkOiq+pR/z2lLK11lewGN
	OKmJjmT3zM1Q6n3Ena4i1B/n0L5JNWOXE4MFHAkr3roXSLbhY1kpjCJ7rOALGG7c+smm59myGxZ
	OrODMKb+tv+7t4U6KTdZvsQlOaNCVb953ect38DpsVD0b8OwIdHZcs0qZXO4T3F8hZhtdxVWqOr
	CUYT2Uh5Se45g90t4g/XQ2aI/jKM0r0cEdGiRaO0yK4o9RTdHK+YP35Q/XuHbUKqC0sMLcsZWqr
	yZIjQBqC2YRw8Q93nWsX2oQE0XS3c3T68KacPCFBqz4geIBIp8TflRMHYPd2O3o6PnZYrFE456/
	YCKkUIiwLwUrpuXOXfiPG8JH8Zw90LKdkqi0AEeaYK/oyBIR5GPhGuyzIrE4mOkQC83SxKMn34J
	rWc/0E1oY5l28ZwlwygLw12EzMmDhFIRLuoKGSR7tw+uHzqRJ5YkK7vYWAzZgRw0r5SniF03V8k
	y8=
X-Received: by 2002:a17:90b:564d:b0:381:889a:65ca with SMTP id 98e67ed59e1d1-3829f5e7806mr2141892a91.28.1783144684570;
        Fri, 03 Jul 2026 22:58:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:58:03 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:42 -0700
Subject: [PATCH 19/26] Input: maple_keyb - remove redundant mutex and
 remove method
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-19-41e424964da5@gmail.com>
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
X-CRM114-CacheID: sfid-20260703_225805_874156_4FB84ABC 
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

Now that the Maple bus core handles callback synchronization via
callback_mutex, the keyboard-driver-specific maple_keyb_mutex
is redundant.

Remove the mutex and its usage. Since the mutex was the only reason
we kept the remove method (to synchronize during detach), we can
now remove remove_maple_kbd entirely. The devm-managed resource
cleanup is sufficient.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/maple_keyb.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index ab9257db7e03..aa9a4a80e26f 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -14,9 +14,6 @@
 #include <linux/timer.h>
 #include <linux/maple.h>
 
-/* Very simple mutex to ensure proper cleanup */
-static DEFINE_MUTEX(maple_keyb_mutex);
-
 #define NR_SCANCODES 256
 
 MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk");
@@ -128,15 +125,9 @@ static void dc_kbd_callback(struct mapleq *mq)
 	struct dc_kbd *kbd = maple_get_drvdata(mapledev);
 	unsigned long *buf = (unsigned long *)(mq->recvbuf->buf);
 
-	/*
-	 * We should always get the lock because the only
-	 * time it may be locked is if the driver is in the cleanup phase.
-	 */
-	scoped_guard(mutex_try, &maple_keyb_mutex) {
-		if (buf[1] == mapledev->function) {
-			memcpy(kbd->new, buf + 2, 8);
-			dc_scan_kbd(kbd);
-		}
+	if (buf[1] == mapledev->function) {
+		memcpy(kbd->new, buf + 2, 8);
+		dc_scan_kbd(kbd);
 	}
 }
 
@@ -211,22 +202,12 @@ static int probe_maple_kbd(struct maple_device *mdev)
 	return error;
 }
 
-static void remove_maple_kbd(struct maple_device *mdev)
-{
-	struct dc_kbd *kbd = maple_get_drvdata(mdev);
 
-	guard(mutex)(&maple_keyb_mutex);
 
-	input_unregister_device(kbd->dev);
-	kfree(kbd);
-
-
-}
 
 static struct maple_driver dc_kbd_driver = {
 	.function = MAPLE_FUNC_KEYBOARD,
 	.probe =	probe_maple_kbd,
-	.remove =	remove_maple_kbd,
 	.drv = {
 		.name = "Dreamcast_keyboard",
 	},

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
