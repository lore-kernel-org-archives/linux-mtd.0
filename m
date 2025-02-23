Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91324C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqdNf2dtcl3IuKDwFQwp6IO1UqgKT7PB5VBZy+FCD5E=; b=2CKpVTDS28F6zS
	phjwVwmzScm5uX5DniWJQpGahe3DJK505k26a/sdMIqO08QFBtwhUWDJPMaSIoLmGC6CjS0lKyJ8+
	iH/6oYLL2+QCx8aRQlAlnmJRTCYSgjxw20Z6HtDH0sjbIWFMfB339LURi+JzSxXVekE3pTQYVgm54
	Wyb/FwbqYw9zc1LYlLFtShzOKHDzMNNACbSwUQC8T5/qBwk+By9O/6N0LRXchW5+V94QUP3wYXVCc
	2n5EI6OuddAXCPIDduSh/6ox3jdkD5lqesmPwTtfB3oS+rpq+rN9y6gCSZgKvK1GRUcEn3gVlaYcb
	FMKm0wqM1TrY4xfo2mRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF4s-0000000BPq0-4AeL;
	Sun, 23 Feb 2025 16:43:38 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF4p-0000000BPoA-2JWp
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:43:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220d398bea9so54581465ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329014; x=1740933814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ7uyC7/exlluLKkDx5P6Zr0yOli/KDaWMiD/A1Io8w=;
        b=HCIKK5g4YToqHPhHC6SXH9w7h0bPu+wpUAjEr1GHjYJ98X0N7fXGrQp5Bh4CcXV9S6
         7fFi2gND8itEcFW2xKxLpQpyF26GOGvsUeq6ZEVOYbOg39/tGtUO3bSj7QwMp8u7QavI
         wkj1xCBD8eJWT3wFzH/ZOltHWd/UiD3XNIkmx9BTzjSZiHiP4IzFutuNqe0aP36uzpbw
         xhQDHDIIqPdYTvnHFKeMIAxbUJV16kv62WYyZlHdZWPg5ec3OwEz1eEX/lYx2++12l0N
         BoAToF9pOArUkHccMlnuTJrif07pR4z0v6WPnS1CCZtJOnednl5mEbSAzEX57XboF5io
         msqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329014; x=1740933814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ7uyC7/exlluLKkDx5P6Zr0yOli/KDaWMiD/A1Io8w=;
        b=j2vRsIUrI6GKyNURlOkxh8BqUqPIs1bZsZaY28MQaV/7R8nnV6pVeCRKW2SJwsHVk6
         Ah1fuQsbj17QbF35l/tXf2Y1hN6DomIjR/L65tLEkdjSmYRk9QNkx/B4aqwbSFXtKRCN
         QpYJ1SoCng9a0H8jJ+qdjZNaqWOt/WLXIM1reAjjJRokxXvjAZnRXHDhKjiYZdG2VaMH
         moM3Y2VbRuBJK/t2BlVn81eEDArmU0DOnHYlCLaKAjOoHQLT3BmLOzWDol/LFcOpOZFS
         UGuJTlN9ltqRBeCKQc/nN8tfteubVcGjJYZvinnkKMi8M/q4dyLtHVY/2C/MDh4ItXJX
         vd0w==
X-Forwarded-Encrypted: i=1; AJvYcCV5649+yrgmjWGYlTxWGG0hY6bgfrlMw1OmVsaBKo4i3nAaqh6OqkrKI2JiYpHrfMJ35qEt9TPHQ0k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJLU0Gk4FVRE3ugsPN6+TwTsXNwz/O4r+8Boy+8RlXOOxeRp7s
	hyBemz5NRRIKQ5R3w+UMJYDIM0bF801ZxJeCg4IUX92WF1H3sBqP
X-Gm-Gg: ASbGnctFevzL14x+BOrUBTT2t9BWyvUdT0d4r1WQWW68QNlGgtwgOqevVHFiMX7lEJl
	ALBXVMHyPRtDsxrskcwoBQF6xxrmHzg5QneLXWguF8hyx+JcY2HCBZ8EUXI0t7TW38+HoADQnau
	SGCGa6kng14dWDciz4zKklzhmGMNf0tg+EQJzCDJZi6+1xow8iq6tUDFCV2nsMtXcbD/tDyDCnB
	VWLENDVbJWjLfZNgmh9oc4gjJfE3MCDPFK3JWxnPboVtMJuUy08F/CxLsB8q/NYG8eJdDA20RN0
	pMNqYvsBja2VpjcP2DCWmSccxA52/ikWB3Y+XLbdSCrQ5u4yYJuulA7I
X-Google-Smtp-Source: AGHT+IGEf83VZ2oIxRJRK+CnkiI3bN9hJqE3s48Hx05CleZdaHJAPpPthd1i56ltfHnEYIca1Ehjjg==
X-Received: by 2002:a05:6a21:394c:b0:1ee:cdda:b8ea with SMTP id adf61e73a8af0-1eef52f7d5fmr16011633637.19.1740329014620;
        Sun, 23 Feb 2025 08:43:34 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:34 -0800 (PST)
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
Subject: [PATCH 04/17] media: media/test_drivers: Replace open-coded parity calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:04 +0800
Message-Id: <20250223164217.2139331-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084335_591433_AA7041B9 
X-CRM114-Status: GOOD (  10.51  )
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
index 70a4024d461e..90fafa533ccd 100644
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
+	return val | ((parity8(val)) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
