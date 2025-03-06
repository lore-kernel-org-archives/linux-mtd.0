Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0FFC28B24
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPGKfN/9yHPCOeCUulnKGgM1xhj3xRdBAsG7bfqJcjk=; b=u+N/8YJUTahKpN
	f23R7ZvZe6C+dE7byzZpQrVWQ73egvILE1GIu3dUwevVCC8mQezK7qCPjxJPkGkVb1S0Yn7Y8QtHb
	UEXh//oHOZ2F2MHvX7GFs0G4E6e28EpkHDWkBjBG/+9yfNsEFi3qKGU51qDUbPcP8J/AWpg+vfMeZ
	o+IklGN2T5UPTG3x513JEDbgQz8fce7fIC/QXYpzFvPuy+g3D1d24PHwvmZ1dH+xg6zxgIxBten8F
	r9daGErJTJWmq9AAXhYdmFbqICPGSJWslYrasfkOAR10uJFzmF8g82nnnXHN2CeYRyLUwbj3qzxec
	QgozQ+ohXfWQL5hXvHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4x-0000000BUAa-3FZx;
	Thu, 06 Mar 2025 16:28:11 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4R-0000000BTpo-29Hi
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:27:40 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2feae794508so1529849a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278458; x=1741883258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
        b=Y3CurRqubsgkWUzjkEMN2Bt0fDuOdcq37FJrY37AOQEYYMq1If9gkN61r7KOHwHz8w
         Da/I+6NzUaRo65PwkUV9duuxiImBYLRmC8OrJ8dRlZI/h4w1ObTXRdx6cxP91lluBLZV
         xQMhUT/tFjZBApkXGhxWVq8fdYP0KlMUtYsJdY4QcHB+cZtsGQZJuN1DfaMCVRgEF7S3
         EoolsrnouMYSncnCTlEIgqjsxvKhyB3t56t5rTyQSznwXI8ZBiabp2xc35lA0RSMh96r
         J2vrXQo76qdVXMlPdRO2osKZlgV3DLvU6PIiiWadRT96kBOLRw2WcG8sKBvftytFvRZH
         ZgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278458; x=1741883258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
        b=siBLyEJ+6dhN7cwtptEzAyXVXDIDnMU6VQq34wNgu6tJyWMNO7oYmWXk0bF3sZT78c
         umiepLsDJbIxFNGVrDZitTn5rp1sjBr7Gf2mpkts5lA9O2gKcgHLM85LArJgUcNWQa+1
         R4lzI2GAK3oUAOBjWRUkokTm0hUfbtgUcQXlOISO3a7mFn1cPwlVajKpiefOl6QoFjI9
         egDX7bMYmMdG1M0tEWOyZ7FmzuH130UmXLDbY93ZCLXhIkUH5rUgJwGKwTh53/SxkC9J
         jfBzQSGdd7rPxTJxRZedTR+mWz3VvDgdX9n65Id0/TnBCW0TZKggNBbaufIPnNGJ5fVP
         0iCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI/iIDBtb1XyyJi/62g0KlVLzPkYStS8sSjGw+k95yHKoeCUPeHUccB8Bog6do+Ru/bvfcxkZfPnU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw35wrCnYdub1iNHfyzoL2/8KojUDsjTc4vMBF5PNO0JL5xckQX
	YOXwvrib0a/Vl9nVDLx9JTdrAG4tK5rT8qdGKSaI9P54Jyh0TQMX
X-Gm-Gg: ASbGncvjk23pNRMIbNkb6hEAtBZUAg7tZy6jtdcv52LWCRnkhLC3KCo3L+l9SuG3FB4
	FQOify0HjBBA1kvjPv7a7ES44QjmRFxR6SDuiazJb5hAEVQNMCB7A9mWOyjoHTZV6zlZMKJFYJQ
	8OuD/Zv6MmLkV8uk72Dx0IdvkJVZmnR5o/XWCLvr7HAvZaulmjAlnIjFhBo/wQo3PQWvTl96skg
	rm2BmJOEC3YPDMkqHGpiJ0N77rfSb6e7OLBu3biGGIvjVbPwbcM027MOz5PRvfIBQyJ3wwQDtJt
	2e7RzkKBZPITrj0TkvFYTh8Zey5/5Z1m34+9CkWWml4QaVotEEalS5mqd0SbVLXrOYcFmQd913c
	=
X-Google-Smtp-Source: AGHT+IHic3IzGXhBZWP6zBd/pJJw64LoRGQ/N6k6+q6inZlCxRIB1pB5KkHjt//av4DrSwa4YWD19w==
X-Received: by 2002:a17:90b:1e04:b0:2ee:a76a:830 with SMTP id 98e67ed59e1d1-2ff49841eeamr12538794a91.24.1741278458615;
        Thu, 06 Mar 2025 08:27:38 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:38 -0800 (PST)
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
Subject: [PATCH v3 10/16] wifi: brcm80211: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:35 +0800
Message-Id: <20250306162541.2633025-11-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082739_553091_F8D3B6E3 
X-CRM114-Status: UNSURE (   9.68  )
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
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
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
