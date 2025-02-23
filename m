Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6E6C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VjIrTdqdJO70ot7aCLK84xnQg1NFdHIDjQanjJ2Z+Q=; b=CvwvA5tqhe+Xzv
	PKqxlJzpaI2ax6mBQPJeQsR1zreCNAG+6xNPumbmudc5j1NIaWwkgLxUrC9O9omEO8QqZACtZ/y2+
	bzyC7eJdsLjQalEVub7YxRtWsX7bDdBfiBNv19a0mePCoHnrMOhsFwziNIkGKPuw044MBtui946H8
	QRPzjPWpz31umLKloaboXhLxNOpcR9N49STfGw39qFgWper9ipog3YTq8k4ngZ2PdiRUqmbHKanzy
	fBoJk+6iTRsCDGmJe1AT2AmgudL4JJt6uXXcHQ6xl3L9FWFd8vzUgkxenym8uRFpy2S7qrDgXBRkD
	dS9xVj3XbDjPmc1L1v8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF6J-0000000BQbm-3nMD;
	Sun, 23 Feb 2025 16:45:07 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF6H-0000000BQa1-0miC
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:45:06 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fa48404207so7515444a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329104; x=1740933904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
        b=FG2JKt8e07SpuNeQnA+2iqErPPbgtbdCyn3Ev4bnxFVjCe+DI3BBn3nKl//I64eRsL
         SWX40kLQwO6O81qahlJUUfXJ0IqMi1zX+PCaQAW9PDvHZijcbQvl1VRc2AJS+HAnvse0
         v9tgfVQVf2MTl5i6cwp8Ft+xKp5IMyGFUT5xtCbZAS6mZT6T5Yf9LzYa6r3X33e+IoKw
         mzq2pb/FidMsauMDSN5aXvKnkfdZs7P0xA52wGH//SaJfQIwPvjs7tTxhtVs+Vj2xuEB
         qcu/knMwxbNmkPp+45tBhG0+8ZpqSgApCImrxzfZfdZsQSZVBAsZw3JFH8IHc9wa+JXK
         qsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329104; x=1740933904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
        b=HyQccACe3bsb2IMztWgZYW+vbLY8fBeuuL7q9xVgm/PX6+t1qh73lK5asXvjA7oumv
         1NddCOJekNG2TepZ8f5680f9KD5bPcsHEEXkd4+Z1s8lzEvgLO3EAv5VbkzZI0eIPr4T
         S0TKM4+TTPL1vWSJL92L2gq0Rx5oYdFVU9l6vkLhu5qr5kJwCnCpiObqxZ+ZCEWBRs9p
         ug9zfrzKat3jC40mYDPdOJdenb5CyCN5M0YpugAvAtYjkpz5v1MwsDg2syygno0prUD6
         tSF14c8fEE6qbXFRNNimDQ63QSxiX65NZEqz+ixIA14LICK/1JluohXAdCEibqPQrVVe
         jNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjUUpo27TRWE6Q06SnEOz5OhmoNMWU7X0r0LD6ktt0Gri+z43RJgTvCPpZ2Ah2hBxFWnJK1hl6wDk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQVpWO8jxyc9QgfAtz8GWSIP5g+r0Ftpqnv0YKfuNQbRsuB9qy
	ZOqkfORFQIekGxFiwgutLgIQQ+Z1cgnIRN6jSQ7+T81uWI7LYW8I
X-Gm-Gg: ASbGncuiYECWG6uRlP/9jPSRMSUPd1UzqkYtnyDzMyi6TnyrjtnrItbZVuN/pRvhRAj
	LfyiJYKEg8Bho+g/Dpjp32BqtiMhSleN8nkhZJI0V7jZGWY++uV4wFgVDAcabKgYnD7RTTDUooT
	luJ7S0gzs6piJSd+ufManhHBQd2eS2wsYbP9ey5YWvf/5kOmSjWXmfdGu4xckGS+OR/NU0JanLz
	KJOTpKcXflE8tFKOQOKAm3nZmHTjw/b83Ml1MU5NFIRol3UNuR+NHV1Af5ond//6A1l5SLpzvS2
	PsEykT0Cvo1eZ47Hrd9u6Xonu6hfsWXZHuEx6KSWMiBIFAasg5mHI5is
X-Google-Smtp-Source: AGHT+IGJMVNjh2ZkbH600/jnGa2+6i7gpIXMvZAnEqRCXvTYi+XMSGJQL5WK3aQh+mNtGiJ0yE3iuQ==
X-Received: by 2002:a17:90b:2590:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2fce75e1b18mr21089922a91.0.1740329104301;
        Sun, 23 Feb 2025 08:45:04 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:03 -0800 (PST)
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
Subject: [PATCH 12/17] drm/bridge: dw-hdmi: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:12 +0800
Message-Id: <20250223164217.2139331-13-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084505_226308_90751DC2 
X-CRM114-Status: UNSURE (   9.15  )
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..833e65f33483 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -4,6 +4,7 @@
  *
  * Written and tested against the Designware HDMI Tx found in iMX6.
  */
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -171,12 +172,7 @@ static void dw_hdmi_reformat_iec958(struct snd_dw_hdmi *dw,
 
 static u32 parity(u32 sample)
 {
-	sample ^= sample >> 16;
-	sample ^= sample >> 8;
-	sample ^= sample >> 4;
-	sample ^= sample >> 2;
-	sample ^= sample >> 1;
-	return (sample & 1) << 27;
+	return parity32(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
