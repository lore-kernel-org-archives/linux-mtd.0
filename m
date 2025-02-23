Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1FEC021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zNKgFricqpU7DnWhSnnKZ1E1kEoHlTTMOO0QAtlK1c=; b=SQkAH60a8hxg3H
	FArP59PzqBIxr6vJv3gjQWDkHJpqjJMtH+aqz8m54tTPrdSaspeJWeO1cDRkZhEVl0zPMbc9o14eX
	y0uSvbMAm+6rpR4JCDpDShlCfJ5SeqMOwS902jBBEyQ18KdmeEygqNsMMzyZg11PBKZs6mjNi+q6s
	mVygM2BJE/mg/qqsnzWcuMXwW2FFFZlTMFS4EsZx/gbuqMIieYKnBHw7SJdTgXxA+C2slANUuEZxg
	L0B4XiQBIcDAQ1W0YW89bNB8ZJRQD6euUQ80ceOeU36pWHwr3cYPTs6MW6jjuBoCuQv9LV7ZWuXWm
	ZSWdHqj+0pseOxmrBlSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5m-0000000BQI4-1nnp;
	Sun, 23 Feb 2025 16:44:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5j-0000000BQGA-4AOw
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:44:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-221050f3f00so80332575ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329071; x=1740933871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
        b=VujGnsouWAaEHpi8OyHQArVwzKIqZngkvMANVLw8Od4eCgBwdLzTkSQvzaTCMWzGnR
         Tui/FDq8dq5dFU/JkBq27ZRfsMDimEIKc8vMhNDccef6tfXKCo46Lb2XLsmPNP/r/Nqu
         xDLijzgR1rrEadJZH9p92rQsnqAxPh4S+XHhZoCYYZm7E0Vd5NXsGgKjpb6HZWzphsO0
         moi2NyGBnJEeoIrEMXRaY5tSgssdci2QqDT3uzoMWgZRpHwHdgvnwZ0vq8Mu+CNpU9KT
         /RW5GUnQTqOOgQbpdWSLIgB1ti2DA9Efj5xUoJ+qy/7Z8zPaeacyLpzLzwx/cFhTSFhp
         ytVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329071; x=1740933871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
        b=m7S6MHbkyHd86wYanUX2Fignj1BIjHS/jDNk6kF3AjAgGUXuGkAw7FXSnLbJ8MdwFD
         7w8xQvWydKLiTm+HznTh6W4NrcSyvBFQXqC2gBPpC7CvbjpJvMpYquuywQza4mDQMWP0
         lqdJqSo4VqEwfZ6XIg75m0vkO4A6c4RGlEXY+5tq3RBE5C0qW5Ds5WGsL1He9q3sIQD5
         hj2C9VcLkVRD3D+BUoWANHwDfRHA55WaW0LIT/wbaD2+fOMwv+/RAum71MO3TBo7acxm
         oWNCpM+ACTR9UkNN7v1x7kfNoMtxxf5EGm9EhhngYIBxyIVU3H/hwWRCB09um86lK56g
         cz4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnI19tuyZZ5LtUGXbvIetYumMtUNs/VgY9tArL9jsBHxYobuuCb2pmVwb42zC1CAWn2AK3NX3B0d4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0RqVBmiP2fnW3eN+LRSUwBKmBaPTfwJB20rjGb+0CDysfkr/u
	r/3oBqOx8Xht/AppDUL1DYMAJS/Yyeu6uWTsB6S11cPoY+lfMHpy
X-Gm-Gg: ASbGncsMiOWjghU4bVyPOFju7zhHyLnSf3mrXBDZVT6ye7QaePqf8PUHn8OKAZ2y6Nb
	gOpgDuoUxU6EcJJtw9Bqbg8Xa1+/aMsd56Kj6Yn9PAx22oLATv6ZFXDAAdiLFf1qJ9CRG62aORl
	VQD+D3kv3PEOAbE45QlaIMZGj/25S6/658kujYxqmGfItysiWVyH5V/MYNboqjuhwH7/uTm4m7U
	84AJSgC77o8Ah3odXLSRZS48QH/pd/R5NLRK3YQlpRqNwQGXOr71BuC//J7fYLkGvblUom3WP/h
	XXiUwYyEp/Ssu4MJ/FTXr25b6U8OrOWcO/NOst9HU9xhcfaVuSqlTPJO
X-Google-Smtp-Source: AGHT+IFqMPtN+gPmr77Z5+UXqcepcxQO5H8AaDoUEcywHGCumZ53dM6PMFmuD7xMrlzO6YmaaybKmg==
X-Received: by 2002:a17:903:2286:b0:220:cd9f:a186 with SMTP id d9443c01a7336-2219fdc2dfcmr186405365ad.0.1740329071014;
        Sun, 23 Feb 2025 08:44:31 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:30 -0800 (PST)
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
Subject: [PATCH 09/17] Input: joystick - Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:09 +0800
Message-Id: <20250223164217.2139331-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084432_032756_C820A354 
X-CRM114-Status: GOOD (  10.62  )
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/grip_mp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..897ce13753dc 100644
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
+	if (parity32(pkt) == 1)
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
