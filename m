Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11595C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Emk0FrnXSRcOBRbzFaamqol9pwOTiy5JhA26YHQs8Kw=; b=WAGYD+gpKHPzIR
	BhCahUCnTXQNMElVK2KPLoyBXZoh7YlSiRz6ooCxqnq66rrQYsm7b+bSF9JgCZ0KjFAms1ZLSIR9p
	o6cp3qFB3RU4SLzf3mV2RYVvzo3PAatCnYGkGT8VoM8LQ64VGW4StchrsWEpROpoqIYLHKRx6gzTE
	T534vQ2RJWfemQ9FGy7e0kw55DcNWdwRDd6VmbinFp1Oy6cMxxtm19XipuO4jLBysV58smyYSJpGv
	9cnhgewzQzYMWkH6wOLD4QIRs9I28p2kCLV876pH8sRfTVDn14sF4mq/VkyktHeb3DzcpdWy27CZs
	VBwntO0tWQfyY7CSeVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XcZ-00000007khw-1U9d;
	Wed, 09 Apr 2025 15:45:47 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XcW-00000007kfy-2zPj;
	Wed, 09 Apr 2025 15:45:46 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af93cd64ef3so4766635a12.2;
        Wed, 09 Apr 2025 08:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213544; x=1744818344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTd+jcAteb5XQtuvZoTF72DclP9q3bsZAYfMztua9WA=;
        b=eMHLtbeJ9eROzaxr3HVSYG8UcqD5wVVZnAw1piSho7qdS6btRlM/pIE+nkOycFElep
         gTL18kzE8W9ArPr9f0/+lXUqpEKhS0M5dG/gbc2qKWv2FVfwyZ8S+hHwqyjDhDd68UI1
         H5AWivv16dIAMq6o5REswu+t9sXd5ra8vCIJqNUrTro0GUhKaAK4gSmTY7D827fyRM79
         Icv+MefjQIUhoi7N+3AeJLiem+j53CVJX3LdHbkRnZHnhf1cmsof5A+IB8Pm4pygduQP
         t48ddst3/XyiN/ovKgRxFk/FfmnC0YjY9gbpc1KGGaJejGeI5hFoGOIK50tSRMxwHPrc
         6ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213544; x=1744818344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTd+jcAteb5XQtuvZoTF72DclP9q3bsZAYfMztua9WA=;
        b=OSDvyr8HZBu1tQebLntPSjXieMvT1XM6yy9hn5FNkvk2R66ZKYCP9OqZdkc1uSIeG5
         6qKOOpynh1FTREKasJbueBvdi83Ix72nCz7EB0qPXQAlySFgAqj4L9WxhOFO1AuDei+j
         Nl5qlGSYLom5W5NDU+bMmPpscdUkR3UUEv5diTTj7pJ155gt40v6SkboS9CYIyWKczio
         Q96YP8Ov9FC4IODNfNeBsC5XFSKioM15Ss/+zUIMPlgdePnOS93vqhqaFRUwdzi7Ws2G
         lRh0I5kT2MPuzLP6/yDhBwbQHkMq5bkJJUCn0b/dR898yVP6m1MBT1wccG4c/mTRiiiv
         k/jA==
X-Forwarded-Encrypted: i=1; AJvYcCUAI8jQRT/jc4wznoKnAfLCRl/IPq7lsfLQs0LmAgZuICWM9s63RntU2uhYek5whQkli84xkzITZKQ=@lists.infradead.org, AJvYcCUxj838lrvRl1NxA+F2avp0e8BcvsXMrLyg8dmo/7T5VBgfzo79vRxs45jzBcmeDv5rWokeFIuI5WlM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8scQO4ycGfvKyerjFeyNIxHIqjzmZHdvauk+6oaYgJcvXUFiv
	TSa+CEqCdQja9HN3l8Eqf82rzePl7GizaTI6LQlOOdKN+JIfzqcJ
X-Gm-Gg: ASbGncuO2g/K+c0aJIS5wVqxkWKFTNUuj/yeI2iQOnpOOshUePhkyAQPAyhIWBmdViI
	itfzg/UMYcagfJk72FfQWbeOA5Z3HYJV+wLP+5m25bB5fGpUFwS+jPfa1cnxg578MK2xG6qGa1B
	t75LyokP1EHvGTIcw8cJvq7Tb16YGX165cRFGmnGdfoBR17iyhk9UpXVD3KXkImPq89jqxUUHC0
	4YmmI56W3vX5Gux1NSfjykuSU+SQEzMJS4n2OknXDQpEqvMREYN/3oUn4kOb9VQglaykacUt7Un
	gaRHocchqW8jhWNSTXzpGvagV1VwCE8nePQjUXakz/+iAC8hVja5yXLKSibDasXQRq6xm38=
X-Google-Smtp-Source: AGHT+IEJ7Jl6M7/jx+b0QfG2QtnETYXioK/EteWOwSUQmw7SIb5H5CEFmuEhS1eLp2rAJpsPWE7AMg==
X-Received: by 2002:a17:90b:3d09:b0:2ff:6fc3:79c4 with SMTP id 98e67ed59e1d1-306dd56b507mr3990247a91.27.1744213544132;
        Wed, 09 Apr 2025 08:45:44 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:43 -0700 (PDT)
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
Subject: [PATCH v4 06/13] lib/bch: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:49 +0800
Message-Id: <20250409154356.423512-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084544_749444_63FA1C08 
X-CRM114-Status: UNSURE (   8.54  )
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
 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..3f14d69f373e 100644
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
+			tmp |= parity_odd(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
