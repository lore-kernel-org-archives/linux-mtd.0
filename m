Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3695FC021B3
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yD8qMQNKGzOtztMQKpFnurvkDdIC2XIQYtsLGoGFgac=; b=Uca4T8dweYQsru
	7koUJc6zExI5u7cjAZMCGBQb3JVC3wXCLzWGWVm06efQ0H5ilb/OT60JawSWYwsHlFphgxMnbVdao
	SUx2ig0iMSpRNJVR3JJRtCNXTVMPcHVgfYi805K/1jO4ixglV4BMlCSJ2/GwzYGuuhFF4zF9mshzp
	+4CisbD4KZ/3lJ7gp0oXxBTE55w1dXr89yC5XR/NO4+JJoliWeOIXawEVZhOwJOZPnUZcRe9AVRI2
	OcjnkTrH2p+axjlf6NvORiPPTGJXSzm86uyavogSQy8s21xATnIblBHsLA2TKHFHSh9rnaSmktqLR
	vcpV/1xtpvCyoKkRu9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF52-0000000BPut-25dh;
	Sun, 23 Feb 2025 16:43:48 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF50-0000000BPt7-06wx
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:43:47 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2fcf3a69c3cso2757431a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329025; x=1740933825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=Mry+bXhgQ83rdg5qqLQ5nV1ZhE5zT0dl32YeWUZV+tbA8pTSbvKbCwh+h/haxPFkY8
         kVQB/tFkVaDYbj7ufVXC/F3TBoVjaDNOl6KXyYFIREWmCL+8YfkOEm+ZwRSHEg9g1mvl
         gFbEi7u3LMCikWlRlBOlnXCySVqdOfN8SAUgO5o0j3+Oa5s2Np0uXdrsqCqTUsRZquPg
         bLvP3jK3/YRspEVc8wfHxmEbJiWLBRBr1rw+n+NggQE0dpmr8RHunmxTQpjsJ4I5+NBu
         F0wEDe3NXpLAt2xdr4nHcRfJ2xeqCLnOBAn94pN2a7HW39bSY+0cfaFU+mja6DV2O8L/
         rZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329025; x=1740933825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=Q22eSawZHOzLBLAY2yuDFgPVmLxn3CocpH9pEbkElVA46jTGp0K2xpPdN4cmxDgVUM
         cAccmzDJ9a0Tg7IdEMT5g4oj2pBxPJ6VyjM/+cFVfQdy1VYkpSZ+1x6xAN6wSpKUWYVA
         S9eesGchuIdDz6YOFQLm9UrTcKoUFPG/8cWR40HNSiPsTZo8FO+eRO25Qtubao6K2v9p
         F6ObV79P0sWNzaMETDdvXiM89ZLKCu3QoPvviGuITYzeIyo3/aJxD1DN6KpTyAZXEMl0
         mwdBgFj4/6cFtKdPd/1lyMhKaQL7KI1I6OvUxEDuMhQugoSyj9CG9Rwu/svI+blqHIs5
         tdRg==
X-Forwarded-Encrypted: i=1; AJvYcCWYZeltb0Z43g8xd8ReX6Q0f5385dTnpmNpUIhUDfHvWfDlxWDp7Ykqzw8IFqoW2BE0Xp8nUT+lilw=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuc0jCwPKl7+GkKMvfkIzaawFiFdWcVjy8pvPA6azEwq7GYDEP
	GHLyfEXJsc2D7TZ9qL+HBh4S2adMhaI1dPqLie0G6TyeSY2XTUcC
X-Gm-Gg: ASbGncusSltxMVafqroXqvoIkri0lpZBUFDCugkpt8HORjMniAgJZVVbITdVXtYDB0e
	HyGlQ67LsqAqfWoT6S37izIoycvE7SWw+MHNOkZz8lpAh6UwxsNqDpztzBjbFqc4THAvoKrD/6s
	iyo55FUPqE995Xvhl/5r+3Eiu0A9aIUEmxZtX4ahysUV0LzU6pvRjg1rfXZcSrLEBLvjQUMB3YU
	TaaH2q+w3A7m9cIvr7G1zBFMzBxxuusqs3H26HgoaSRmAxU/qjHbzCyjnUgPgEqbqbU63s8iMIN
	FxNxCYnO/9FZGHxdU6OsQSgSJqH9zF32dM+dilCm7W2veGnBiNk4hCqG
X-Google-Smtp-Source: AGHT+IGVq/VDL8yFNkkrNqMmhpwnPeH21AgiBV1Ypn8QzIpzc6gLajBMUvDiltb0IdO3Sbiytrzwqg==
X-Received: by 2002:a17:90b:2e0d:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2fce7b07205mr19070739a91.33.1740329025494;
        Sun, 23 Feb 2025 08:43:45 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:45 -0800 (PST)
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
Subject: [PATCH 05/17] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:05 +0800
Message-Id: <20250223164217.2139331-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084346_065682_5E6DA2EE 
X-CRM114-Status: UNSURE (   9.35  )
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 65281d40c681..1a113aad9cd4 100644
--- a/drivers/media/pci/cx18/cx18-av-vbi.c
+++ b/drivers/media/pci/cx18/cx18-av-vbi.c
@@ -8,6 +8,7 @@
  */
 
 
+#include <linux/bitops.h>
 #include "cx18-driver.h"
 
 /*
@@ -56,15 +57,6 @@ struct vbi_anc_data {
 	/* u8 fill[]; Variable number of fill bytes */
 };
 
-static int odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
 		break;
 	case 6:
 		sdid = V4L2_SLICED_CAPTION_525;
-		err = !odd_parity(p[0]) || !odd_parity(p[1]);
+		err = !parity8(p[0]) || !parity8(p[1]);
 		break;
 	case 9:
 		sdid = V4L2_SLICED_VPS;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
