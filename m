Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56A0C28B25
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DC9JOnOpfKYC5UkWZteT3id2LQ7AwnrPLOADsnn9y4I=; b=VIHt98Ns/hbJ2b
	NGSzWRlF0KV5j+X/dtB97MWtsHGvzlm8vkZ6K76YOEUvAuWHwx71xAEiHdpU+qYpOgh+faK9uETDT
	6SdZI0wynnZmyE4cQ9UwwzWAdAEvLz7XCn6i6OiapsZ2Anuh14jOFWr3P1YqLOjGb9xk0mw+rhvS9
	Csk6KAKBKuf6MxkomgUA/7Q76G0DSYlS2I0C2OQZK/0v+cUzifM7YU/CY3pWEbbCDJeqDX+1PWMZw
	4yW5KBbN5DoCu9Bz+1T7dRRf/IYzWRTammOBNBX030D+2cWIwXP24NXd/Gy5vqLr2U04xYtURVpjZ
	F/UssaGeXyOWt2iLvJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF6g-0000000BhaM-2tFD;
	Thu, 06 Mar 2025 17:34:02 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE5F-0000000BUca-3kgU
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:28:32 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f44353649aso1509218a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278509; x=1741883309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=i/Vnf5IPjaSNYr0W3dqUmNZT3DhB5WTum3/WRkavnbYV40Y/IAY010Si3NZIT4+UMc
         Q1CRkV/pGN/I/bH+syC2yS4dIRTDuMKgUwU4DaBd2b7z3cMz0UQ9asvNigT5eSNB34lH
         OfcpgXlk0TE12ssdNR9muc2/t7Dav2nqNmlC1u7MF5Ln6ehWQeeMqo3GkpXbANjxBKvQ
         bdxP4hFXttkwQ6/yQ3gexz+PkZ3ho8Purut88PJ8OJVU8Rjvv56AAAqreR3iAz3c5JiA
         0hLj9CtlBkui9Dr6ULoO5Okdnh73PlGSN6kSHa1a8DDbNiU3QPS3oAsX6JANsn8SlLIU
         osVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278509; x=1741883309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=PrxYD9obw+ScM5u+ct116OvPKMQ53Vf5VQr4JJsqYlzUC7LLYtgkkbYe+bPRf3rQod
         9cMfL7PbELrN3oovlQ1fbWsRcgF4HCmHFp3eczPTNURwP109544N8e5LIgw8iAenGUVY
         G5rI/8ZGK8N/eeMmp3Q6+uw5tRuOCIY6acA2EVWdKZvqO3hG5IApCLXmUGamAkJyorlq
         nEjxp0DG9iFbAzOh7C7vI/pBHqCEvBp6+tfdpsFVcOIxXNklQTsVv09wllttPm9QjrZd
         77gnK+ZmRaXbEBjUJ/nYt/lsMO5bqTM/LLGVR/RF9iHgFTtyL3sPjVWgq3NFLd+O67D7
         L+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWIhaxFMvlGOQbeXpGs6YoTm7T7QxZ8+7k3G+JIb4euwuqtR4wbbjbw/zBVjk9dCcypzOfE4LOmaAM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEowa5g3r5WOHGNioqeOm0N6qatGmyO/GF740/Vk7EoIVFSbT+
	t3uwDKDvzcTfJMT55oTsUmWsVG6E2RN65Nx3IvAZFdU6ItJypnje
X-Gm-Gg: ASbGncu5OBWl88UTghsgHfkVxB7eAg3Xus+lDw707hz8dpS/Hn3F66SrT5EiFjxXlgO
	0PDVwQYbXOVkiFNsTQvNCKv9nDvqa/5mNtfOcRIvs1u6z+QZnGwuBTizscu9y6vXe24CCiDdYZQ
	PIr0PUfUXNGqt10iy29GzWe0Wg6s1EaZlhXa52hruFolRzI6EI/lHVcHAzDUpIW0tInH2D5MY99
	qvfW3qjxulONmdgK1eQ+Q36y5Stw1eikyQNzyWj6w8/VQUnewd8e7Q81+fXkJUoEULqd/hAb5Ef
	N3oKEGthAkLluecVeqDdo0H2e6OdJPLpTHgurWAscJC+5NpJRJ1sqidXfonx8DDeUJa6br2OokM
	=
X-Google-Smtp-Source: AGHT+IE7CMC10LMwovhBW4tB6jZafU5napSqaqhkL82rznmGKafZamE59+csgSshd0lW2KvQujLljw==
X-Received: by 2002:a17:90b:568b:b0:2f9:c139:b61f with SMTP id 98e67ed59e1d1-2ff49728389mr14240353a91.14.1741278507670;
        Thu, 06 Mar 2025 08:28:27 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:28:27 -0800 (PST)
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
Subject: [PATCH v3 15/16] Input: joystick - Replace open-coded parity calculation with parity64()
Date: Fri,  7 Mar 2025 00:25:40 +0800
Message-Id: <20250306162541.2633025-16-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082829_964309_DB9CA085 
X-CRM114-Status: GOOD (  12.06  )
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
