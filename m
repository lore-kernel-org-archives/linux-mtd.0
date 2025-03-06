Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF285C28B2E
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfKRCNVhYL758wvflawb2G11nwvouDw841/CF/lnzDM=; b=ka9nX++ReM0X6b
	trascc8ii/VTqR16dt+pTJVFgjWFiEEtMJA08k19d7BrVQUDsDOS9P0/dc1858ZRqAdv60Ez9awoJ
	OA5rY9JE0+DFgVSfoR4pVsBK+RFXSrwr5hL3v3Mp2ad3xSYhTKVMTbEhEQrgC1iozp9d8xa2gxfa9
	gnPCdXZ/EOrtwBwLOZ1Dw9HzR+KreHLRj+QAR6Snqo0COIKoDmlwKQnT5yxFenRSHyItrlc0Qhzsk
	Vc4wSlPVmTuErEL0BwxT1AUZEkG/oeS1AiSub9AHpO6Y4dstBP059dQ9z/1BiEA8gvB15aw7M/PEz
	BRm/8pkW7hFe9K/aeodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4s-0000000BU36-0tbg;
	Thu, 06 Mar 2025 16:28:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE3H-0000000BTUW-2W4S
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:26:28 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f44353649aso1505556a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278387; x=1741883187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
        b=fPgSlvs1zLPRQMoFzpcInqlizsB5jgnp47vY0JRbr62XIz2Xlj1KuhskLyXVJpAoWt
         /fWtw7M7HyzJx5vbKiK5SVRJ+PJ4ExjalfLzoPqx8WIyeS6NyESWGJNhjFqMATyJvv1d
         FA4b10Sy/5i1MDpQowskajFMocxH586cmGFJ82ngYzhyDI+K5YVcvjy1m3F7YvNqSfDA
         7Ndiw/2f1YV1kqlTRvuFrZdOds5b1GnLmkxbAe3+pHDlKlGe/K3wRPubrj/jdNHXFzFi
         EiiFne4pKgc68hytiaGeA2dveWzxgmUVguJ6T7zeRauIvlGM15uWzmZFYLEe+kjK5hlq
         U+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278387; x=1741883187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
        b=gGqBiIFIbNeYAlDxmm9+V3E7SauAnerXNscfu974g0Ym/su7EezqwwNs7ekkQPEO6H
         LlO71ahyznMaZDf8mG4ICwETbN8m+SLqVLDwMZ4UN/qM9VxhaH15d6T2Zrbnd64ODxw9
         i2LUbdMrqam0yi8lJK3CSISCki2asLDG/QANl2+B7NHL/AM1Ts/XJbovxR38WPMy8ZKG
         c/CV+FJuQ0Boq7jTUO/T70adfoAbB6k4woX7qmsN3FPc7+hvrCzO4af2Jh54QtkYVAsy
         5E3Dtn2888sGfDRhaUmzQmvgW6LDWduMxVtumJhUm+YFJJhY3unvxDEQT2srao8lLudy
         wT+w==
X-Forwarded-Encrypted: i=1; AJvYcCX9TD881ZvuL5qAAiJU1in2k2G1CUCS3Mjo3iSzNQMhQjt8L4HOV++LCq+rYJCfGtrs9KSv3INpCiw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3bCnGa4ToHS9v1Mf45QSQSGMmrkmFgXLipMb4yx4xCVn6WPPH
	JR9XHgTWhGoeiatYzt2Q1Ne/feu/n1bxk7jyDCX6wfGlDOM0Qtvc
X-Gm-Gg: ASbGnctb1cUkqk9FzyoUUBobgn4o0uiMk7PSLJ4m68+Y6bX8I/5Cxt0A3r7Zg13JbOT
	UVBxG1FZ4K80DrNtswgc765gfllZe7v8qv330S88KeON5aynmR0kiXdwXmeAZTrwBYxSRNOWQGf
	qz2BU6GSE3+JUe5cnJufIMBIDIh5zsI5K5tUKExVrfJbkuiBmdkddhmHaSXhCdib37FOWJWbsDe
	mJsNrP7B8nEKhC/aP2qe/YMpjenxjxlHDh0gaGq3eRcjnIMIYGaV7mGcSdfGXTj6wU0ZpxmPPyE
	CDu1igvLAeMxPtvPbwFOTjNWkPv45MfqQwHS5Wt9KQYbJdrZ0PJqqecQ8sWQRHONX3FeES4YOps
	=
X-Google-Smtp-Source: AGHT+IGnAbA7Y19sbet7/e0FnFCoTVhlFvSe7Bxbq8+Kkwl3FpD5fIN6ErN6a+dRmXJdCrcvBmbfjw==
X-Received: by 2002:a17:90b:4c07:b0:2ff:6ac2:c5a6 with SMTP id 98e67ed59e1d1-2ff6ac2c770mr3503350a91.31.1741278386628;
        Thu, 06 Mar 2025 08:26:26 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:26 -0800 (PST)
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
Subject: [PATCH v3 03/16] media: media/test_drivers: Replace open-coded parity calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:28 +0800
Message-Id: <20250306162541.2633025-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082627_642575_92C2ECFB 
X-CRM114-Status: GOOD (  11.15  )
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index 70a4024d461e..e0f4151bda18 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
@@ -5,6 +5,7 @@
  * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
 
 static u8 calc_parity(u8 val)
 {
-	unsigned i;
-	unsigned tot = 0;
-
-	for (i = 0; i < 7; i++)
-		tot += (val & (1 << i)) ? 1 : 0;
-	return val | ((tot & 1) ? 0 : 0x80);
+	return val | (parity8(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
