Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04266C021B6
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASXiiAar6Ub6sPyu+jaT3KQNiy9JnySuwqYYCFcUHoY=; b=uw4hwhhA9TmIY/
	8HXRao85eVdHqW3r0/EOAj7KfqAVOTMPfzqUCnLo/97vOvalwYVdYW05LIdYREN1hCMEW0lKUsVe7
	SNvlSWtmNMpilz7yHvSx7DTttqH5kptsY23QbjLEkOrWmMLs8TEGZlgFO+HroGv3UIStioJwAzxYF
	yEc3r/edIYdLJdAf802s8+/L0q21w82gCbRcNb++VxwfNk6SKzhmnLW4tr7Q5L/bxNsOIONYPuWIc
	25o/WnZ2FbC36/qjmfjvc07U0Wz/JCQ5e15XuPn8f6fzrk7dqI8v8/xukR0JUQPFnC7ZVVQPUqVkQ
	Xa0nPG12GcDC/pHIlEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF68-0000000BQTk-1VjD;
	Sun, 23 Feb 2025 16:44:56 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF66-0000000BQSp-0hKt
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:44:55 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fc291f7ddbso5850800a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329093; x=1740933893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/rM0c8KAofiqOH9E+BbTStqrJdKUl6Z4Ta9tU7voiA=;
        b=Ul0VUuF6KLFugDy5tZ+nogxp7ygZ0h526hKjl1Vyv9qIHHidAulSGCtm9balOtetKQ
         bnZwhH2Q+LANsw+jzvnicuHEHTa4tOTsh6nIfKUyBWz8eG2/zlzO3vmCPngheUgdff/P
         skjByZcN3spkeZpA0/QRSRLPyrqZ5KjL7KktOE3mC6prJ2R6ZPa5ueFR/+YRDFdF7Mpt
         ewvemeXjLZcOTgr1SP9RNRXB+phfWOOIWWrnbvLjt0c6TdRU0vs2v2+SsI8wCm/nvJc4
         q8aG1RF7CDwJq9FaIFeEHcccNqGBy6mez5IMW0s8z/h7xkWl0U0JRl7BVXs4o93h9lXU
         6CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329093; x=1740933893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/rM0c8KAofiqOH9E+BbTStqrJdKUl6Z4Ta9tU7voiA=;
        b=Xmq1LQS9AwvVa/6i9ydF0SQuXGkupevF5MeCz//10xwuLx+Vgo8PBOXD+pDyAydh/P
         pB1Z443ehcZW+ZtSd27sYm/RXXMFjrDYzscgbxjxWRfP7M+916AgAOU0DbFQQB0uUoVY
         531hrg8g/7eZ5AI2aezJ5K9uTWXT9LtNoApMBO/7I24tlmQRq3DGpU2IBl0m0KH6L6wu
         FIm7NGG2MVHLNYEIyJRMlEDL234xGpIvAgaS89neFBVlGaY1Irm63ygCzzZ3WELs0fcy
         5HiNOBL/Z/BIgTdvMxODnR5o1pfFEN8aN/SNDjclunSAyck4RiFQWHFow6FokzpNlumg
         WU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVv6DCZhkfV6nNRu03UaJNfPSr9jS36/87a6+Q0JcCzMXxEwH+meL0xV/z3uDaVPprJ3EPVq1ys/wY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvvUEqpcugtHtzDLvIKjCSIxZh6wwItUXGv2q3+0jg5n/D/Fr1
	/TUiGDdE6ofEWJGaUyHSTosfqQQkD1UgK4cZT6iVqI5EV1gNA173
X-Gm-Gg: ASbGncuFwblsW0mXIDHwpvcJqICfqw2PLsQYXS96oxo1aBp/irUhPejKBiVusfxXxPh
	OCvDdgXVrtHFX7pWlQlfnHFshUs92bfsd9pIdDhktnsEoYgMLAyHCpCBlSUcX3A54fyWBH8VwHV
	4VBgU8CJSOqr4DzUBSH78RWwGyxrSKD9jxyFKB3nQ7YgG33jUPwNO+KDU4u/URTk3DUxsKwp+Iz
	wjn4bx+MRdVVPkJo62loLlarNqAWZrsxTHS4Mfy+5HKnQ73f7p9gg61NEt1QxstBDEE83QzbnpG
	+F0du+jEWWinLv0b/ls6ssTMfkwWjv2QEt5B1Od0yfJ6M2RtZau/8PBb
X-Google-Smtp-Source: AGHT+IFyGSvrJM271swgjLlCi2TwHZU6y12ME2N9/TuoQb9IugR13IQRKyCWyxRNE+S6ruhpAiUUqQ==
X-Received: by 2002:a17:90b:2b8f:b0:2ea:3f34:f194 with SMTP id 98e67ed59e1d1-2fce78aab09mr18428370a91.10.1740329093592;
        Sun, 23 Feb 2025 08:44:53 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:53 -0800 (PST)
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
Subject: [PATCH 11/17] wifi: brcm80211: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:11 +0800
Message-Id: <20250223164217.2139331-12-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084454_204555_BEAF5171 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..d1a1ecd97d42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,21 +284,6 @@ struct dma_info {
 	bool aligndesc_4k;
 };
 
-/* Check for odd number of 1's */
-static u32 parity32(__le32 data)
-{
-	/* no swap needed for counting 1's */
-	u32 par_data = *(u32 *)&data;
-
-	par_data ^= par_data >> 16;
-	par_data ^= par_data >> 8;
-	par_data ^= par_data >> 4;
-	par_data ^= par_data >> 2;
-	par_data ^= par_data >> 1;
-
-	return par_data & 1;
-}
-
 static bool dma64_dd_parity(struct dma64desc *dd)
 {
 	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
