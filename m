Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD58C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxjOo+wA6LIMH+/xhEw/MPhsTaf5Qv5SqqTQ+v6QWmM=; b=1qVNYUKqGmOCSj
	ZX6E3I1HRDdMNNXDaJyB28pSkOGytsF321fuOeueKdyOa3PGHfreus7E4d+gsJC6pyybJC2yj23OX
	anWwzqYsuJtLbJYPrg8wG8guP4NKDbg6J81b/sZBd/MVeqFQOGxR6DHALgspBiK9F185ubvuQaPwH
	Hm0FcvFeXfr7F89Y+Ib9j1RvpVv0axh+Enwi+gP7rlgA/J6mfoKw7skgzv5xhQVO90qObn6T7GfBl
	o22f86bQK558L6dQt37xnv5eGEXZCN5IPEhgXFmwCGpzIq66N22xa7N0pFN6ooxLGkEuYISr/LPKT
	4w8iZLJDEZwKTEJjKnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YkQ-00000007xlY-3x03;
	Wed, 09 Apr 2025 16:57:58 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XdJ-00000007lA7-1rdn;
	Wed, 09 Apr 2025 15:46:35 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so5316246a12.3;
        Wed, 09 Apr 2025 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213593; x=1744818393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxwU2Eo6SZITicqBQinN6iBaz5ky/0lGxu1bDy42GZ4=;
        b=bri3v8hQXkYE4uNwg9gzAuRogQcJ7cpLzGhXgRkezEaoTkZuu0PxfN87eQI/xIKRgB
         TWOQfjm92WFf2CpqdqDy9nBeFVtgRbZ+Uc0T9ZwHQ4zFY9o9sjKVv6wHd/j4RnoEYnfC
         x7n7cptQxN9jFxkHSOBBZlVRS6o08PnmLc7pSobCjVWfnHWHzuktQYMv8NUrsQqqN5yq
         aEwINwQW+llbc+kHSfDUuMi1itg+6XW0qNoe1kSok58wPbzxPdAO3RBJIQ7c0iUxVbkE
         KG/g8gK+WEPPT5lywA9zu9aujgxxiUGACHM0+JoLIocwiuRdqSGjK4/GGW3YNMjMX0J7
         1Z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213593; x=1744818393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxwU2Eo6SZITicqBQinN6iBaz5ky/0lGxu1bDy42GZ4=;
        b=SD9pvCk6gzIhbwfWfA41f9ZsLtt2EupwjlcnZDGJcxJTiaX1U0BhkAupI3YfLwEWDw
         nL59061U1/gksmnaH+abKSwLgS3V+IHcJZM6Q5+lelI2sY7EEwJLFREU8CeNpO4ioQFo
         GQ7UxrRheaYLM4ofDY5hZ1zCtCiQ99yAKPScZmlfbraE07l1m/gwfnRFUR8zMuoOL/Xt
         8zUPPqXNV9nTjFulQbjL9/ufF49+dMvFBjd3z9zv0B6I/F0nUfyFYoSDxgTSF8g7RJPv
         eDjETbhRA1uW4bjg8y0EnN99fX9yNqrYCccMEN7Iza9SVQpGIVg7SixxszO2hGjkCy8Z
         mHYA==
X-Forwarded-Encrypted: i=1; AJvYcCWKN3vHICU0y9dv+GPdfjf/I6ryRH1Pwt5RnfsgA0mhBJ7a6/ZatxQO6Jovdu5nXDR9AoEo4RNGDMs=@lists.infradead.org, AJvYcCXVkYF1c+HAxa0zwBENzb1NhteS1yiJ26Ds3QDhfeoQfSSVFKmugQhtRzeDuwwfR4ZP2PfD64g6O4rL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+pdvg1ruJWTRYt3MYYpDz71qp5ciOgfw+V9YNxeMIm5cOWJ/q
	s/EPp2+/n/6k4A0qzcNn9ncECAO6vnLeOyOacD0LOrvqYw3yXWR0
X-Gm-Gg: ASbGncuOpy9ompgwRLwG5FNSSkagvT71ucMHc6l7cAy2rMfWWIckn+eJSaAR4VVUdpd
	jCFEBPj8bAsDagXA7N3K0CWfaaBw0lgd52CwfpllrVgpkmGTQ60fxYFJgjXo1ouWsZB059Z1UjP
	ZJnhtBIb5hshVsOuSf3pnIccmQhtLemzbjv8VpePssSF1+sWVUYWgBMNQqHMNa8PVeyG63OPKeS
	etWdT77CY82HY63aooDM93kG5QE0rAZg2CZsARQTqkM+0CE1cTYCzzr+nGlOiGeJGSrj1sjZmiJ
	QjLlAuJc+tEO2u50sbiYEPD0NZ2ttj+Ip4gfMNAKotpm4Nhof1/02f1fd5MNGII/BKiVsnA=
X-Google-Smtp-Source: AGHT+IGJskC9aR+5Dgsn/0q7tVfn/b9wEb0pUAkxSpjYPK7zbEkvmX2PCK7JdW0DCG7ccVky18srmw==
X-Received: by 2002:a17:90a:c887:b0:301:a0e9:66f with SMTP id 98e67ed59e1d1-306dd521d88mr4820575a91.14.1744213592804;
        Wed, 09 Apr 2025 08:46:32 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:32 -0700 (PDT)
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
Subject: [PATCH v4 10/13] drm/bridge: dw-hdmi: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:53 +0800
Message-Id: <20250409154356.423512-11-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084633_478754_49BF3FE6 
X-CRM114-Status: UNSURE (   9.17  )
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..abf2c72be622 100644
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
+	return parity_odd(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
