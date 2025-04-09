Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3716C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87rU9X9aqj7orJAt73GsXlWi4fEI2PKFB/hPsHeAxoY=; b=ZlcDsz4KgcHzRp
	Z6u8en2oeGdN96qHJvHf4LNe5Dl/QbrORGZ2WHcaP+unQ5DGjzgrxEE47jpGI7r4QGTI1F+VQcaCQ
	DWN3poPP0s6W8mRUPHeRaSW+p8NQcTnB+IWgJ4iOmq8mwURmMJgKwRrwMTAcXa9oS2JKhDkQxh2oi
	tOXxbdLO6yF+eOWHmApPUKLivW0ErROIqfHR+2HgWf8lfIVJ/lW5DrRLjC8YBPcK2kaYnkqCsdjF0
	7rw82co1cT694OoZwTOYBohOh2WkZCJP9ipWkwosFDLnIc7m4zQroBhzhiwURxCqSUPxG6qeE0WPj
	MryTRExG/HhZ8EG7AYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XcA-00000007kRw-0ffH;
	Wed, 09 Apr 2025 15:45:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xc8-00000007kQo-0Q5N;
	Wed, 09 Apr 2025 15:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0vmckaFkj9v1ziFLew45kxKFqGeGwuFVGwp5LAE34T4=; b=SX+laNAtT/VetSLcW986Xih6QA
	B15VYT34cv6D2Kocgu8HXyik82Fy4TftcT3+siV3M3AJtrTJHvGxFGa73sotPZht5QompEkmdH0KK
	COODL6as6FhZDXF+/dB/IY1RWGkztjprb/l1LIXzc4L6bmPn+m+t09GjJ+bv5CCVx2SzaeICnCqsk
	lz7CIJEVYStHWovRCSd9ELMYxFWS9IBUFXUAuhF0To2uXBc8hSgwYW7+9eGOVbevjmGHN/UqLnBOM
	ojM59ZHtFIQo+bgICaisCBMrCexTX1JKMtv5KInl6wsgwu1aHpWJfn9S00g1ST92ZzxYbhhnPizaM
	r4nQrM2A==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Xc4-00000008e6S-2odG;
	Wed, 09 Apr 2025 15:45:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so5600087a91.3;
        Wed, 09 Apr 2025 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213513; x=1744818313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vmckaFkj9v1ziFLew45kxKFqGeGwuFVGwp5LAE34T4=;
        b=J6p4oq2Xh+L2/fAUQu4bgG4JPBlzAY2rv+FfHPxYB5tB9orTfVoYE7n4nZ7E22SKlh
         ctFoagxbNPbGHaICCCF6/OudoUABrdpBrxEusLM+KQSFLqDBvodXiqP//mDExwCgnzQB
         iQ+6KnyUw+b5xC4uwPxxEDGdlaTWIN7OgmbTHngUXvPqFhiWRR1ZpHpb4wl8uFk3X+8h
         cA6jYK+HeZ54VJ2+c1H9tovI/0xX4aha0SyF6muBNSY5XI1bPWO17g9GMrxewgKmGm9c
         wwy+icqgtBtMhoXwodm1aWaRYnZ/dLKaQyKkwtKRx2lQpdGlbCPsWEu658LfHErDJfQS
         iHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213513; x=1744818313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vmckaFkj9v1ziFLew45kxKFqGeGwuFVGwp5LAE34T4=;
        b=bhYx6NnLIxT9rI8UHNy2ShgLZwSWgEq0VwrC2uK85jDk8EAeqeR3ka+an7NaWL0ffW
         ZDfxXbDcLu73sUe2TeDqba8KpOliL4iFu3JWB683gVQWUFPraZUxtgYL5f8R83ezwErv
         tYl76gnteleaFsOLbjEwNmTw8HqSQ/GkNfGZQr0aoE1+uaxsoiRHzC8w9+SYaQOIjnLi
         IHlJrRDpCOwDFXc4PRriDudlZSC3bMP5BwZklMK1S1fyo2uzT6XzCaJH57XKFngZKf5R
         NuuSoOmjFq/jwqJgncukpGuT366/3yu8GkI+0A0Nr6PVutuQ6oR4YSvlzPKJ5VYvm8mS
         i0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV/6WL97md5BcYbhTbgaRMTWR9SJgazuGor/thEBrcBqc3e74pV05a1M0bS13r3q1GhDOthA7/BINa@lists.infradead.org, AJvYcCVsio0WPXK+/56sB9QUvTy5gtdvJMjH7VVQpCKIjriBrYDNRnwzNRmvvCc/WIELAlElfqTsdf8yHeo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1WV3Ee9vMGL0olLaSYoMa49ABJ+GEOZwUPT79Akf3yKFuUxOq
	/aS/RoscnO3kt1MtJyyV6FlQKqQeultATXbtUFSuKkBjgjg7ICyX
X-Gm-Gg: ASbGncvK3cfRu8DoIZ0pWPnP7uFAwbmofFLjUxS+LmwPM5Fa70y4Sd3grC4aTF7EUlS
	mO9JJI90u2EupiCIbwoSz0H1jIzud9LMOkpv7FGJceXUnZ71I+SKRZiVpubknl5lmYqBSbv6p9p
	vKuOykuQyeLCJT9xDhNJ6INBYVsISZKPjWVLENqh2yV3viG6f2RMVU0j5Cb9xADsl5lpuNVFHu9
	ei5HcvnnOipRXut7YZQSzZRpldyjjTkULH0BPzJDyMsLDM5KViejC+J+R9MiQoIUT8KwZSqA+8D
	YimlAZgoZwOqV7ktWK4pa/0ntX0V9Hqd7C2rbyCFI7KF5OQYP7WjCqxsBNNrPuDu6S8O5N4=
X-Google-Smtp-Source: AGHT+IFGakXWHWi8mPXKxnYyjY+QGe+hrJ1DKxm8mqQTtmCR5lZ2ol4+lqNevSMOwq7LjWocz+r/eA==
X-Received: by 2002:a17:90a:da88:b0:2f9:c139:b61f with SMTP id 98e67ed59e1d1-306dbbb557amr5410743a91.14.1744213513621;
        Wed, 09 Apr 2025 08:45:13 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:13 -0700 (PDT)
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
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
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
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 04/13] media: saa7115: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:47 +0800
Message-Id: <20250409154356.423512-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_164516_815404_86EE7F25 
X-CRM114-Status: UNSURE (   9.71  )
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/i2c/saa7115.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index a1c71187e773..a7886269dcfc 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -25,6 +25,7 @@
 
 #include "saa711x_regs.h"
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -664,15 +665,6 @@ static const unsigned char saa7115_init_misc[] = {
 	0x00, 0x00
 };
 
-static int saa711x_odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int saa711x_decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -1227,7 +1219,7 @@ static int saa711x_decode_vbi_line(struct v4l2_subdev *sd, struct v4l2_decode_vb
 		vbi->type = V4L2_SLICED_TELETEXT_B;
 		break;
 	case 4:
-		if (!saa711x_odd_parity(p[0]) || !saa711x_odd_parity(p[1]))
+		if (!parity_odd(p[0]) || !parity_odd(p[1]))
 			return 0;
 		vbi->type = V4L2_SLICED_CAPTION_525;
 		break;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
