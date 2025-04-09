Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1503AC369A4
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQrMiIM2ABXXokFni9cNez9iPoag3HnLEiBhLvkORaM=; b=nDCaBPNscKfLOB
	GYWrdXkLl27okWc9HAr9C+LiSJUdu6G/PtLorArntE4qiH/LrRDuHKtmsW3iL6tK/nCy3B5msUkpy
	tYazw4xPEafH+5piqvCYy9Eo/I7QZCPhmgb2sUoD9VSJR8rY0GO1sbxWMQkmOraKD4thpFqGdDD6/
	h2Cur4kCnKreTwvrjU1fVTpFHCkCkEdHJpWTU9p+1Omg51x+L/66MRGjJihS7Dng3S+FpCC3viVsh
	s+NSu6qfcLeGPBxINCg4Q+N9zS8OBEzU+XY41yg+/TPpujOjy4REcF5jLX4YPOlqv/wzC4OeGSYYC
	epEWy6F2o7AonostCQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xck-00000007kpY-2KE1;
	Wed, 09 Apr 2025 15:45:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xci-00000007knR-0lwy;
	Wed, 09 Apr 2025 15:45:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22928d629faso72457285ad.3;
        Wed, 09 Apr 2025 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213555; x=1744818355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GTX40p8Eu+tWq8rarx+bIs4dwN06BcTyPGidfavgSc=;
        b=T5VvuOKc369zex5B07LsnHWXjs9ec67IQOXgLf0pyTWko611IViEcMhYZtCa9T7DHN
         tHrqHIPQpeUcw9pVU6ZH4GSaUoc9vRwwglvosC5tBDhNFinZJVS21WFxNZI2IAFmxOjn
         9nRadfXF2bmOjn9SSEP8AXn4oreOMmPy9knNbCLTlMU7YzTPY8RwNxYfb5r2pivjowzS
         5wJwGySidTlaZqTwQ4/TLKIg/unvHVJYdQ23nUK/x/K7C5FL6Yh7rEFtU0aIIdedznRb
         ak5cQeTnR31CZOCcq5hyz2TTIlXNQ2g7O1p/edM9hnnT2HIY62vvtBWjppAFAKOCuGkg
         +6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213555; x=1744818355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GTX40p8Eu+tWq8rarx+bIs4dwN06BcTyPGidfavgSc=;
        b=FGGf91tgFRDBnhBkfhhoViPOPeoVYpXhDBd/Cc+OmxT9+luVSAANFFu4p9lFC6dVZa
         ihabUy9tOjMnmM1nPoYfcRZTJc9BGia4j6Wzs/1wJdYSA8/ukcL37mNoawA4PVBnNRON
         WDoBBCI6NBKWif0BNLKNKoT5bfJgVZWX3JFcbM3Aq2WDa12pTTTi8/jum9d1Ms8Hbpr7
         hp1lp5sZ6xXp6BOCkdv0frHWYfpAV8yHW5UIStEufaAHZI7MnW9Y7eMRlJIXDdk254WO
         ihkyAraSm6eba6D7dNldBIZLz1ZrSaE/HOmd+JtK4uWrN5/qhhCtxK3trMSYaG84QJXR
         23yg==
X-Forwarded-Encrypted: i=1; AJvYcCVkhxJy0crLWbjBb0fHgi30C8SctHFAKJX7liTTQVX5eCQUTYOryByhcyN5CrOZOJsBrGFnMl42rP8=@lists.infradead.org, AJvYcCWtN1Q6cTnJOpVOHhnRpy+Exh9z+53tgKyGXxANZaQqV2j649/OuHgOTwRz2bal402d1z6FQCo6lbT/@lists.infradead.org
X-Gm-Message-State: AOJu0YyDEpvN9Sp7Or392XBz3pvGW4SY/XuWIGw2x8nQ+hLXzgWtbiDg
	hGN92U1Kg3yAQdQ+Gnd+TCxfrqscabU0XTgjRvpiTwtruGuCQixE
X-Gm-Gg: ASbGncvJLfSLHzmPMgF4YXj8GLt5AMTzqnr/7wwlL1Xf2IMrkY5SFhaFuCD7XkwzqPM
	+Hup0aZzb1YHMC2OPscfLy8s9LO1anVdMux+SCeC/tFFRSQFQLT1xHLIr5ZM/rbrlwQh86/4fMl
	E+CsEVdO92EIWHale+DpSM3IzKJg2ilT2M0TXRIq5zHKrK2Ww/0l9qdfHaQLEGQdfTbq1E0g1uc
	tGnjO13uCx4JL1/2kR0e6vPUAdYin0Hlhk80p0NxJM2al66ZpLyVI2UgDJrobUmU8Up3E1QQtrI
	cGwX6zyiwAr8ZwRNEqey8pn5B3Rn54qOo9Z/wFCo2C17zFFiSDA8TVo0M4S422zHrybmALU=
X-Google-Smtp-Source: AGHT+IG+nlKBY0fzC5EpfikKx++hN068mStMCGrKOPeFQ0KT+ZFhaeW1hEnEku5KKvT2BN4jgM2ClA==
X-Received: by 2002:a17:90b:2dca:b0:305:2d28:e435 with SMTP id 98e67ed59e1d1-306dbb8e7d2mr5088169a91.7.1744213555184;
        Wed, 09 Apr 2025 08:45:55 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:54 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 07/13] Input: joystick - Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:50 +0800
Message-Id: <20250409154356.423512-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084556_221997_3F8F75CA 
X-CRM114-Status: GOOD (  12.90  )
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/grip_mp.c    | 17 ++---------------
 drivers/input/joystick/sidewinder.c | 25 +++++--------------------
 2 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..e7f60a83a89b 100644
--- a/drivers/input/joystick/grip_mp.c
+++ b/drivers/input/joystick/grip_mp.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/proc_fs.h>
 #include <linux/jiffies.h>
+#include <linux/bitops.h>
 
 #define DRIVER_DESC	"Gravis Grip Multiport driver"
 
@@ -112,20 +113,6 @@ static const int axis_map[] = { 5, 9, 1, 5, 6, 10, 2, 6, 4, 8, 0, 4, 5, 9, 1, 5
 
 static int register_slot(int i, struct grip_mp *grip);
 
-/*
- * Returns whether an odd or even number of bits are on in pkt.
- */
-
-static int bit_parity(u32 pkt)
-{
-	int x = pkt ^ (pkt >> 16);
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
-
 /*
  * Poll gameport; return true if all bits set in 'onbits' are on and
  * all bits set in 'offbits' are off.
@@ -236,7 +223,7 @@ static int mp_io(struct gameport* gameport, int sendflags, int sendcode, u32 *pa
 		pkt = (pkt >> 2) | 0xf0000000;
 	}
 
-	if (bit_parity(pkt) == 1)
+	if (parity_odd(pkt))
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 3a5873e5fcb3..fb6f7004a485 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -7,6 +7,7 @@
  * Microsoft SideWinder joystick family driver for Linux
  */
 
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -240,22 +241,6 @@ static void sw_init_digital(struct gameport *gameport)
 	local_irq_restore(flags);
 }
 
-/*
- * sw_parity() computes parity of __u64
- */
-
-static int sw_parity(__u64 t)
-{
-	int x = t ^ (t >> 32);
-
-	x ^= x >> 16;
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
-
 /*
  * sw_ccheck() checks synchronization bits and computes checksum of nibbles.
  */
@@ -316,7 +301,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 			for (i = 0; i < sw->number; i ++) {
 
-				if (sw_parity(GB(i*15,15)))
+				if (parity_odd(GB(i*15,15)))
 					return -1;
 
 				input_report_abs(sw->dev[i], ABS_X, GB(i*15+3,1) - GB(i*15+2,1));
@@ -333,7 +318,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 		case SW_ID_PP:
 		case SW_ID_FFP:
 
-			if (!sw_parity(GB(0,48)) || (hat = GB(42,4)) > 8)
+			if (!parity_odd(GB(0,48)) || (hat = GB(42,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -354,7 +339,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FSP:
 
-			if (!sw_parity(GB(0,43)) || (hat = GB(28,4)) > 8)
+			if (!parity_odd(GB(0,43)) || (hat = GB(28,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -379,7 +364,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FFW:
 
-			if (!sw_parity(GB(0,33)))
+			if (!parity_odd(GB(0,33)))
 				return -1;
 
 			dev = sw->dev[0];
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
