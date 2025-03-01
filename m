Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C202C282D1
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DC9JOnOpfKYC5UkWZteT3id2LQ7AwnrPLOADsnn9y4I=; b=BsUlBHMqMRop7+
	DZ2FRtJfxsS7xR4o3kQbXeUCrNOJM5BRPleI5f22O6hXq1HU9b+uo4WSUeiGpmP9nTioIYqA8Filh
	yHeTumBbKvoZaAg6pdUiuQRm7nWy2bQE6cXe3LwsEGNiMcTn44YXsDeIcG3AkqcqSMkkontQkcPnh
	Yx2ql2HOMS4pdEOaQR901Mu/34E3G004bT/6OD1T154cyfKhFyGeASXU9kgVrpI3C53nn3MGri3Ma
	jPTZ8S5jYad8v7xVJcEJ83dk0tN6r7JRh9UzJUVxqgz9W63o+bTw+JRELaLOv/iEoYw3L5X8dE1rM
	P6ZbuusJAo83vM0Z3jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNoy-0000000ETKO-3Z2V;
	Sat, 01 Mar 2025 14:28:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNow-0000000ETIV-1foK
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:28:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2235908a30aso28678375ad.3
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839282; x=1741444082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=IBAaoJ1vQfKazFJJVGD8GafhF/6OIH5p2ILFSvcfQwW6Hw44oG/F3hqGska6DsRyDN
         JCJ504U/TGoFjjsICltmLoyBpWT/UliqkgRpmhxFhkAot5hg6mLg3tPPMri7RSuy7pti
         0R3w/EOInYxgqeg3/kGdyK/p38yth0parVSrHhlcWwuelFgIZc4ze9eaeQAEk3BM1C55
         1J1KkYJr6VBt82z72m48z+BF821c+k00uRkr3V3z35oIZ0Ml+wjdUXZv0QVaKFwNMGSd
         FLy2v6JMw8NUNWH79jRMhhLrWak0kEDnfiT2AtFtfF97hecmxGG/L6zVSUZaGIfNGt3H
         e+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839282; x=1741444082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=a2dQMdLKjB3P6UuB/TEWG/wEKIaJVvXc8pW3PNcoErdZpHLe6QusXMd51++A2kcD9x
         z/TPQh/2KubruLoxBCLk87g2qKpiQ6lXGRujyxkeF75Cx9M/a3Zd19WUv2FOK6HzMvtR
         ufS21cYWqUWIdr4RVEbUdiLAL5TbOSreEZ2vE2z6UNkU9ZQpxPy3H4kwa6jYVhxM4Gvz
         w8e1iIJV3FB9jOMUlWC2/lsqvTiBl2605sbvnQAuYnrYQDKEuBoT00SLHWqTrav/emQf
         7XUz6biBy73uC+ZF31C13Tbsmwxx0llV1QtpCTEUVxJYXVqWgUkAMHgZbuzZe6y04gOw
         WIlg==
X-Forwarded-Encrypted: i=1; AJvYcCVdtdfwIuWyIC6V3b5SsMoAlzNP9KgSQoAAb4bXkpEIMR/0ja7FtVa4unoA0/9vmi/4SD6+B/G2nVU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZUSk8CKf6TrmX8ovXas9dJFVWyq5k1A8b+HEpTQLmfXwKbbCw
	F+/VlUMGJVscBiAlgeDmex1IyWmuu4ke004I6FgiYaz6OVKZss/V
X-Gm-Gg: ASbGncvKkpi1gWcLalIMKlha/t+bO4PBT8kObWI2pi0rDvAioV3PK2oODVVff+G9Us2
	tsmC2DkLg1eTRgtqiVD6RUb+EvggfmBRDxZOZbf5RhKrIqlQFwJhtmC1hXT86mEkBxjbrNYhS5B
	vL/5+4KItUVC840E8Nc/e/r/b+d3uYt/r2nLfx/FxBw+/ZJtQMzjQZLRccGX3FjFPh7OgQ/kDLP
	gX1cUnf6N9sZuYsa7Fwoc8t2n/6zoW+ghWSmov23oDdIemM8NZFXf+ERcUjL7gH/aXA+bdGQxBz
	M+lS2c6MMmSeRVRLPCm730Kx4hsFR4/4nTQUEH2Zh2JSdOeTLQn93eMuw/5ePofv44D2tqmzDjg
	=
X-Google-Smtp-Source: AGHT+IE6Wlnx/zKBNSK8vHDH90VpNnFUcC/6AIsKwE//R5+rZAZsk6Mdwf+K5eJJM57bLHOOu0BXag==
X-Received: by 2002:a17:903:f86:b0:223:536d:f67b with SMTP id d9443c01a7336-2236920780dmr123851985ad.38.1740839281880;
        Sat, 01 Mar 2025 06:28:01 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:28:01 -0800 (PST)
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
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 16/18] Input: joystick - Replace open-coded parity calculation with parity64()
Date: Sat,  1 Mar 2025 22:24:07 +0800
Message-Id: <20250301142409.2513835-17-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062802_435675_AE021949 
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
