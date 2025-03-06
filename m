Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5748C2BA1B
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rfhFCU1+cXXsE3ZaQSPF/zinljbzqEYpqikudUH1K4=; b=DdWqwIgPBEerfb
	ED5zBeJKbb73AwwKSrL8/pvO6TKwwS/JpYJCQoQs4LlY6IVWnsF7UucI/PKHSUBLiBalOq+xeavDk
	cko/R8ZaWIMNCCfC80SLadkcoeQkHK4M6X/HThxdiWkS6VVYOOT6wN1rPh+1jDtbMYLigEACAQv4B
	FTQF4llm7fhZbDEMsfXHrq/+HBomIGFq5L2wnBU0Uz1hMSqcrf5X1VALQnBuFO7AE2GcLQTpyStmh
	zQc5gTsEFbQy9x0Pa7ODuk/9Fiim6hlYAzHgx/5TwnwxjoDFB3o69cWtUWj5y9dCl/x+NMMfiOINh
	ganUCnGHz/OQFBVJuZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4v-0000000BU7Q-2pn3;
	Thu, 06 Mar 2025 16:28:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE47-0000000BTjR-0z26
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:27:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-219f8263ae0so17491075ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278438; x=1741883238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN5ImNH6dAdBfCykY87Jt3WvSMwHnviLIgPuEMqr3Q4=;
        b=lNSphBGxDg3ptaEW7C1l4rw2+fcFOPHsMaUChALqHo5gZAvLHfMIW0LTPZREyD9Y+U
         PwfjWkcGGJC8vZpqrUJiuHfKPhRM5vKMXHwzyh5cgJgIiDglslDTff6SUs+DR42fzFal
         SPjyypRPiMrecawBqQwRDZv/Rm9p1O3HRVxu4DJFWVLRAsLxmV1V7jdNuoOP7+qO1cDW
         hjzzd1oYHUw/9AhaDLP9ESQ/ho7QeRdwVhue7D44zgA6yoQAgatMhzfuPeK3KoGBkEUH
         kJkytKmQpuaWgnUC0U+ddS0zObW/V5rUMCFneMZSUaGZsaqT9pIYrMvI8etykU7vaETa
         RDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278438; x=1741883238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN5ImNH6dAdBfCykY87Jt3WvSMwHnviLIgPuEMqr3Q4=;
        b=s7lOz8UPFyb2Tf8xJVBHZPDm119aneHb91e8enK2/4rNV9myKRMJ8sqJVez1mD+VLY
         KUxBZYMAQdtm7A47NzkeB2SRjsgDkcxckVRuzSOE3ds8CdRb3ZM+ga4xBRO1nhuJIRqy
         k5dng8z3oNJqz4KunGDU+p2mBymdOVGU9WCVsCRDnnoo+wJzWJKdkXNL+pkAIEJiVTCX
         MuCz8YTvoaR74SOgu5sl4zcTVwhZh8BiZU4w61P2d5FFNUbo1UahzH1Oc1WKmVrfCeVe
         CxMpuwpMBQjPULFe4/AJHqhYqWEv95MMktUDesVkTsdCeY0IoOUUR2nth4+QvKlX3n2y
         YCLw==
X-Forwarded-Encrypted: i=1; AJvYcCWFkocx6f63iYAFJHp+nyWcvkeGMOf/+bUzLTEvtQ1k2Wsm52LUVo5INzi6HKLBQQYKJOhOOojl2yw=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm4AZVRt9WPR/YZZmpHPeYUqxF+oFsPS54OuSePLsUPEuzqIYq
	5r1UKdrRFw9wTC2ux6eQel9KCG4awiN30Yht55B5AUuJuRsw6AID
X-Gm-Gg: ASbGncunIaApZYxEYqEpLl6cKW2GpqHL5FnVG5T5RS0dr9WbXmOvtAjFWU61/szl00O
	N0DqNiRVU47+5N+7apIxcJMQcr8w9DkJBtMFNn1pAsQolL53TO2ROIUpXFuvUtL6XjhzIpRdKVt
	a91db0oWuSxBrUvGvir1pAfAqS7TsFzthRyROhG+57rr1oFb4jSAQjnIs8XUt/oRH8kWf0Cggb6
	UWjm16EBn4DYmkfE0+46tMR/MFRFjI6Q0WvPB5inNpyx35/a/BxGuj3SciqRwr0rqHnEZJVtjG1
	v4ZycYgXP8qrhOZdb6YvHuEBKRYOQ/l2vuHk97p1cBY5oX2oTD2Au1H0N70CC413o7JsIO4Wz+c
	=
X-Google-Smtp-Source: AGHT+IF18uiSk+IKiG1ozkM3lMeST4qvi8jhpDhJUoUXK6z5h5Y70JgwenicEaPtYCl0NNS2nVYnUA==
X-Received: by 2002:a17:902:e5cf:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-2241eaa5f50mr17212195ad.18.1741278438234;
        Thu, 06 Mar 2025 08:27:18 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:17 -0800 (PST)
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
Subject: [PATCH v3 08/16] Input: joystick - Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:33 +0800
Message-Id: <20250306162541.2633025-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082719_273262_25BE26E0 
X-CRM114-Status: GOOD (  11.34  )
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
Changes in v3:
- Change condition if(parity32(pkt) == 1) to if(parity32(pkt)).

 drivers/input/joystick/grip_mp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..26a7ae785942 100644
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
+	if (parity32(pkt))
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
