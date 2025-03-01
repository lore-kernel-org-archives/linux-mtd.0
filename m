Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D167C282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLiJZ863BHqoZLbYCEw7dolTx04cDvMH/CHmS2Zak7M=; b=XsWStLc9ctEJD7
	M20G+QlVVmV/3FYiumiID+Ikl+5FSb645NBxpai+MnV1oO8GeAi+yv7eOol5lOrqaLn8H4sEK2bGP
	Gj9BI9EECWuvJoTi5/5ufeAOBlKZ/lOTfba/InDNUHWp/4xHwaxYb62S0EFCK2JuPVf0celFmmU2C
	2s5afg06wsIijg2Hv+KcT8fU9Xh4Y2CxHWme7yklvPg4wWzZPXhPN2aQr73c0uPaswrV2zzHmTpEY
	xl/OoGxsn1gcTJaGQ4xRk8alazIZQdddw8Z5SB/fTwWGXS6oZEaybj88IiepOGvWtD0NWCrzVe06Y
	3b17OlQ3P9slDRg/kFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNoS-0000000ET0r-1ybT;
	Sat, 01 Mar 2025 14:27:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNoQ-0000000ESyI-228X
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:27:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2234e4b079cso57667615ad.1
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839250; x=1741444050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
        b=NwcRy/lNuUBBr4oQKQCsyzW3V6AcQWbPGxCV+5/4LLdPc0lKqMuGuJko4VBfOD8iu3
         BSkW8dlqXkRL0JtOn4vd+XIQrkxNGtU9S6aOhJI0+SM6L60khLwDxQW0KY5RkZ4UJOCq
         3EblHBrUoxAhjVmX4lspgjBIZVDod3YXsUxPMpCmz4UH8VPprE+Vk+9tpK8nOOi4b7An
         mAHCCFIilc3A56jpuS9wpFV1KcRlYnjrbZNZYAiZhiKpL46SlAzQWM3tVI18tT+gGBvN
         yPlBw8br2wXIWlA/16H+Y7yTyh3Bx6OOn3K80tUVb+e2fVn2947BBqP78lZxaXZnkNEZ
         +t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839250; x=1741444050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
        b=aMrjcf9aFRT12Iz3PMW58Q5uHxNsXLoaIV7k0RiHwZusbANvQs2RvnLVnyaAhY+dxk
         /BqLTWYV8bsR6vxqZa4YxUk0NDoaF8fSiZPaMvO25QSWyTkDexucUHMAUQxJrDw0ZCkq
         A2gi6ggjdd1ggqvledodK9E6v83rXjGlGid4asknvEDhfWfgUJVWBxNBba3ZwT6i9+HU
         btX1J1aHUGr2CMiiDPFa93ktYb/AxG5ZjMcdirHIy4MP5rKKbE0hBffKelKGkb0rLIe5
         8A7Ip/EnBMwUMaQUEzZ9RtioZ1ZvkrrmDBwBDbvR+SbLoq0LFoamJnlRh9pwjcUu5N2q
         QXxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGvqdzUq1FsGhsgK2tToEohel7gZ0lD2pT4UzTfRF6qXZfVVoWNUsWUIILtx7K7gttPk2C2p/lqj4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFsaYCL9DYlOqqcQs5+bB5a3xz4cRRIyaiRE0alWfsGVUODagS
	KU2ho4PCeeFvDZA0F8TJKbdJyW0rpnHaQySe2L8a/i4c0smxvK52
X-Gm-Gg: ASbGncsPMqQwg2aF1p2bnCR2GNa+cUHWM9kVO3RH/Zy0AfUz1jQnb7ZVcD+/4lVghYw
	cbHMaqNw7kBga9Ha9lI4CK+rFsjvn/RpHB8Dx1ZfYdJ9ZMDGyUtDP74SJ4+g4rFOIkiLQVWTrOt
	EJ+9vkgZTK0s1/UYCtnZY1ftbeFOLPoVZ3nZLkZ0TtFLwCxvlUCVpRvzdKuFoEunqquRCKQcbEa
	FHfBp67euJp2ELznZHbW03YaMTFqpH2Z6ahC6Lum/c/D0MWicck5SfVQ7WerfUW1+IEQujDFntL
	KeDtAOzpVIuWijXGVOMXljoe7zncff5WsgYk2vVC6HQWExGj0TMlWsTHQKzFkbMJISOv6RpO5B4
	=
X-Google-Smtp-Source: AGHT+IFMEc8dvlQQuKrdEq7g4EcMsmoDBk21A7+d2Y0BFwhyjxtIIjawJKqlgdflPWZNOKVAtnpI1w==
X-Received: by 2002:a17:903:2ca:b0:21f:55e:ed71 with SMTP id d9443c01a7336-22368f6d002mr138003395ad.5.1740839249904;
        Sat, 01 Mar 2025 06:27:29 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:29 -0800 (PST)
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
Subject: [PATCH v2 13/18] mtd: ssfdc: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:04 +0800
Message-Id: <20250301142409.2513835-14-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062730_527430_826C458E 
X-CRM114-Status: GOOD (  11.51  )
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
 drivers/mtd/ssfdc.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..e7f9e73da644 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -7,6 +7,7 @@
  * Based on NTFL and MTDBLOCK_RO drivers
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -178,20 +179,6 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	return 0;
 }
 
-/* Parity calculator on a word of n bit size */
-static int get_parity(int number, int size)
-{
- 	int k;
-	int parity;
-
-	parity = 1;
-	for (k = 0; k < size; k++) {
-		parity += (number >> k);
-		parity &= 1;
-	}
-	return parity;
-}
-
 /* Read and validate the logical block address field stored in the OOB */
 static int get_logical_address(uint8_t *oob_buf)
 {
@@ -215,7 +202,7 @@ static int get_logical_address(uint8_t *oob_buf)
 			block_address &= 0x7FF;
 			block_address >>= 1;
 
-			if (get_parity(block_address, 10) != parity) {
+			if (parity32(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
