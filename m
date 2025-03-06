Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3ADCC28B31
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLiZvL6Hw0FIbd05tL3RgreJnH9qliranVdlTBQJIEI=; b=LNS1px112RYmnT
	ii0eek/AALSxH9usTxDUPihOmgwl04ouubtaZgNIw8MTxFO4xquN3e2W4LC2iw7KdJspwpo12pcYb
	aDjupeEhzeYqrupvzvtyEJ8AtD/Ztqni0+TR8cogiaNIcHph0QlzH9boLUTiDwnYYd6sM8HM26GSx
	odHDmkjQZuntbPYgFyHFjTlBP9KTdOlJ6JFXPT+lduDZPzhFTFiM2/ON9nQMd/2GOL7vXqS5//c0U
	XqcBHZpoxqVWZsKa6rgbj/tUMSDQQyV/2/r6EvvCCXS8JIR5lvzN8E3wDeJykdIX6qHE697mWwGDO
	/4RJW4xNcKsvaay/15pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4u-0000000BU6I-2sAu;
	Thu, 06 Mar 2025 16:28:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE42-0000000BTiH-0W3S
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Mar 2025 16:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vfkeURT+EbeVrjHOwezSCAhftS9inN7HFKHEaavRXXI=; b=Zf04WXwf2Jg/f1h7B7H2z6nRRO
	fnTl+kR9MactlPCdV46k+TZjSho4NTUeka/fl+wPod36kPAUTTWwwGt6+mMOIem2M4Ivl6xB6t6d5
	Ca66cSgHUXB7VsdSdB0b/EXsKTez8sYg5vADMGXOrVXz+oyPIc6HwjHoXlPjGSFU3BXsLf6MZJZk6
	06p+2ysI9XuK+RhJJJZ2SyFwW6tZYUaQVKFLDdR+++CaWtlpPV/31G81VUM9hP4U/pwsh1bmBFdSy
	cA9cE8mWKdnkV5B8EDfrt7SDae3PGcckQgTr6TuSze0qXMPAOeVh1hYpBRKm1sNNBfI5yBUuzU2xh
	A+g0+bdA==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE3z-000000019TG-0T1y
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:27:13 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso1659138a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278428; x=1741883228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfkeURT+EbeVrjHOwezSCAhftS9inN7HFKHEaavRXXI=;
        b=DaxV0UCXjYwdB5o9K8OYjw19whhhpKOeJrUBeaVivXbUrQn72FjD+SOh8wVDrYPRZz
         FV4IqwrFzQcTE4mO4bdmJ0In0DXWdWANP7QKLe9J6Yx2iIHp/sTvX5BtPSNQ+CBhRpZJ
         SzxexQzRGi2wbGcZwDTipTsagmDv/TTeQnu9GmfewW1d5A26jNwmCGTWSXZ2z8auALTt
         umW7Us3TsNfnu9/Sc8w9JRUD4mtBFjhUXFW7qh7hZQ3XQZtKKR/Qr6Jhbevj8Zif1m/O
         BnfPorBc2BaHpaJXiulvr6NlfIVRjSnRaFG9s15TNg7y/3oQBA2Zt4hVLahAZpGg1Fol
         A56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278428; x=1741883228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfkeURT+EbeVrjHOwezSCAhftS9inN7HFKHEaavRXXI=;
        b=RT4CE6HgjyFxf8BxvZWt5abafXgqC2h3PqvPuuB8l+EjMZN1LiKITxHLdJVbtV/xRp
         RKbG9itYMx+8ciVLrLXz659t5UG42ohSwsmrm7FGCNp99TW9L3vNRPZAyVD144dM5bWI
         gMyeoJTsmWp0TNIDzzGjH5EfHKWn/aktNb/bKoCo2/1PGLXnOG7K6bZy72Gs+o/Tj+1x
         MV+4xp6unD+bGrb3HreWombu8/GkQdTU9Ot5qQmr6ofu6jQXdRcuGJsk2HbV5raGGcmx
         K4kxwyFx3dL9zU61Rw7Fyci0+Mk9sA2m9xnlm68WNI1QgIEbc2/QA033KQE054+QTUfT
         0bHA==
X-Forwarded-Encrypted: i=1; AJvYcCUQYEixN5HX0cJBaUNOzQ26AKJWp8fZ0HUwTz9ZJ7JYsFO31qY2nphuTZSW+QzSIR3a/B8oGxDm5YA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaDOlLMhfHS2Z12xgHtnzZZndSCd1YhkpwDU6bJMtcAjSVGHFC
	MW9P3A76fyt3Abv8w1dYXGiGFA1IQl9Znz9DQ/i1XltVp9Dr8guL
X-Gm-Gg: ASbGncvnLwfutqOef0lIVCCI3x1nM6nQwxixTk9mjCngeduIkYezREJ+kp3R9HoNjbk
	6Fr50W1smR1YR4qpTTW0uKvcwFGrBJKjiwJwVPG+adyrxw3L3KanhHdvfZyARs11gFEZ5n0CDkK
	c6wkildo5JIbHQEp73vEOgsvEzY56D4y1MEISMayYYQZKRjXvp5sqcFByPBq9q/TOo59rAj9qkm
	iXE56EhH9jdzzUN5jj696GZF/w7pg2mq1rRIfajmbpZG3wwTc8MyVm8y5S57oZBpaUXaGbZkvLj
	Fnq0zX/0nT8N/GQ5dxb7RmSMVFWk5dSsRYAN0UbMpJaL8Vp6JxT4LyLjuq7CZTDVdeoYRmW0GEU
	=
X-Google-Smtp-Source: AGHT+IGNBcefivOmpQNsVFSdkYo/uQMo0VhzohCZYprzHPevS02kDmNn83LuER8aDdhmdhff3Ulvpw==
X-Received: by 2002:a17:90b:1808:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-2ff7b59dcffmr195851a91.2.1741278428557;
        Thu, 06 Mar 2025 08:27:08 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:08 -0800 (PST)
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
Subject: [PATCH v3 07/16] lib/bch: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:32 +0800
Message-Id: <20250306162541.2633025-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162711_254235_DF9C1A7B 
X-CRM114-Status: UNSURE (   9.49  )
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
Changes in v3:
- Change parity32(mask) to !!parity32(mask).

 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..6c29122c0982 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -311,18 +311,6 @@ static inline int deg(unsigned int poly)
 	return fls(poly)-1;
 }
 
-static inline int parity(unsigned int x)
-{
-	/*
-	 * public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	x ^= x >> 1;
-	x ^= x >> 2;
-	x = (x & 0x11111111U) * 0x11111111U;
-	return (x >> 28) & 1;
-}
-
 /* Galois field basic operations: multiply, divide, inverse, etc. */
 
 static inline unsigned int gf_mul(struct bch_control *bch, unsigned int a,
@@ -524,7 +512,7 @@ static int solve_linear_system(struct bch_control *bch, unsigned int *rows,
 		tmp = 0;
 		for (r = m-1; r >= 0; r--) {
 			mask = rows[r] & (tmp|1);
-			tmp |= parity(mask) << (m-r);
+			tmp |= !!parity32(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
