Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B752EC021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DC9JOnOpfKYC5UkWZteT3id2LQ7AwnrPLOADsnn9y4I=; b=P3l39Y6LX9oXZv
	5sgO8zaP4VJdyMFj35h37OidZbHguqwlwDsBr/6XZTSYOrwyXMrnT1HcBFzR2UxO+6gMwDtM1FyTC
	yFO5z1LnMsUS9cLmKoABtalTVxYVHTWnGBg2HKtjLpaNRf3cT0ZaI6KDwiMcvFNlzW3uFyvtBJs+1
	JtKVSfJm/MCUny7PxOZ+lXe+CJPI0r8k/dB08Nx++lCpD5uROHDc2LXXAwJq0EKMq1r5VdMFHa+Tw
	UzY4ay/heD2Ec1Pyvkw9mP5NqVb7cPIhGPLwjYDVpq1bJCBSxUP6rfwMIT0GjTKHnAI0aRGi/uReR
	YT0c/8GQXmCz2yoLyDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF70-0000000BQxJ-2hm8;
	Sun, 23 Feb 2025 16:45:50 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF6y-0000000BQvm-2GFP
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:45:49 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so5833681a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329148; x=1740933948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=dStMdNoN9ohPJXSEdpZqefSG6wj5DqhEvrfjrMmwcxzRVZ0WhAvXb0HTpWh5quvzDz
         JeKONN+YeCwxewrmfeHVgUHDIrtGP/X2GQxKVm3Sy2KpS5R7ICZV2GYhGOKgN5a9Qnhb
         p2AJBX4FN0TFfduwBvhLuOhePQ2k4aKivpd59ki4UPknOKyhH7FaTYc6qCfkmtrQ7ggi
         mBfdUbmnWVromfZ29DAVU1e67lIgsFPyZEoKZKCT7tvvU2kfKj6RmJLdVUlVil//rSPL
         3fD3aTCJlDxzSTfGiDeCReO28Ubt4Lopk8rkKCy7OwHTridiGUpamp4FhHU30fhbqKFg
         rAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329148; x=1740933948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=m2ADTP6y3E0KwcUrsZ4qh35cbG+bK5oQfxcYEsOzDy+Ex6PPLNv1aB8hVm7rcREBYd
         bGoX9dcOwSFSvvWcbwAdIpbLeMCtx1qPmOmItd7lYHZ6wqBltn9K2esopnv4AHgkRLsB
         5TOSrUDsgEItKck2TDg/h4/hD2OD6gByfMNtgYwhjrNWo4BeJ2+f3/ACUwlgyeLdfDB3
         FIwUpRj0z4lmFl4wq7NMHBu4hnBhBUIGebKk2kHeQazpZm96Dt0AUwAZLIFtCl6H2aZw
         GgloKJfo/7Zpb+ZoOy4fa6I355mmsYXQNrA0XS3bIE2SLZAJUCH2kSwbTTM0BXTD/SGP
         ZDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYvI54rWr+ntTIaM6X2FkUX9cT0LMPSEIcvYksvT0pDLc09Z/COotr6l8gpZvGiRIGKx5apUq4Lx0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Wd+Y+VuxVvOSlpGhxHwAMGvf9njV6uFTWsk7lFVTJcJz10kn
	kuNfwW4jkjO8TS+pW2tNtRCAv8VbHvPkG1eU5wEDIgqwYSZ0FBtQ
X-Gm-Gg: ASbGncvyzHtb9MvedaSiBEOFk9gIORTvqzxX93TWFYfUSaNaDV3MD9GyD9EIK3Jzoum
	l7d2nj1vASs2luJT29MBR9bLM2sE4bGCPI5z9ZeQgPXaG/vPtkbGlBVubJI36Trgn2sJKeJl994
	l0ShpTQa+Ml5Uaw8VBKK9QJy82P4mnF3t6Ku3SrDpsBfur/fXMhKcnSRjDXBItxdhK5mKztITw2
	D7wd8A6/nC1ab0+6rHZJIhDdV5AawzWPACxazBssTl7fa7OLyhZE4k6smB52UjnWCM12IwL767h
	jRT0yQVyPxxtwspVo4EY+40wae2eO1izj6gvJ+rAz7E/m94ANVI3l0jp
X-Google-Smtp-Source: AGHT+IH16ghKmcmHU0dMEzazIh6n32euSF7ezcTZFrtw55Mtl4npk2uitkdtvmkXgShJlJHnv8p1XQ==
X-Received: by 2002:a17:90b:3c03:b0:2fa:12be:f16a with SMTP id 98e67ed59e1d1-2fce7b43488mr17785880a91.29.1740329147892;
        Sun, 23 Feb 2025 08:45:47 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:47 -0800 (PST)
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
	akpm@linux-foundation.org
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 16/17] Input: joystick - Replace open-coded parity calculation with parity64()
Date: Mon, 24 Feb 2025 00:42:16 +0800
Message-Id: <20250223164217.2139331-17-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084548_575792_EE07A2E3 
X-CRM114-Status: GOOD (  11.31  )
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/sidewinder.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 3a5873e5fcb3..9fe980096f70 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -7,6 +7,7 @@
  * Microsoft SideWinder joystick family driver for Linux
  */
 
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -240,21 +241,6 @@ static void sw_init_digital(struct gameport *gameport)
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
 
 /*
  * sw_ccheck() checks synchronization bits and computes checksum of nibbles.
@@ -316,7 +302,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 			for (i = 0; i < sw->number; i ++) {
 
-				if (sw_parity(GB(i*15,15)))
+				if (parity64(GB(i*15,15)))
 					return -1;
 
 				input_report_abs(sw->dev[i], ABS_X, GB(i*15+3,1) - GB(i*15+2,1));
@@ -333,7 +319,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 		case SW_ID_PP:
 		case SW_ID_FFP:
 
-			if (!sw_parity(GB(0,48)) || (hat = GB(42,4)) > 8)
+			if (!parity64(GB(0,48)) || (hat = GB(42,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -354,7 +340,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FSP:
 
-			if (!sw_parity(GB(0,43)) || (hat = GB(28,4)) > 8)
+			if (!parity64(GB(0,43)) || (hat = GB(28,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -379,7 +365,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FFW:
 
-			if (!sw_parity(GB(0,33)))
+			if (!parity64(GB(0,33)))
 				return -1;
 
 			dev = sw->dev[0];
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
