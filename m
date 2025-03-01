Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938D8C282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3G1UTSbAtq4rhsOW+2LWp6D6KKNufiV9gT4dGHV4Kb0=; b=LzzFMQ2kt2iT/i
	MB0mYT/WjekEFtsWnEInIr6wZpH3tZLo6W7R2RDcuTua69jgi147sswXfjltHDij2MXn5rDB+a6x7
	13LQKbCOMrjqVw1XeQUmtp8jk4YuWf7P8cihaicN54MhvXKXj8RHQssueRcrnqm87E+O/5Fh7u8Ej
	xXPzhAKjo/VSeoifoaBrFdcRh0PxYg8hsmMIYGH4cY1Bqkc0dvInWS3ApCO5CioEhtg8lu1F43Tnh
	5BXozYFE+4qFE6LNoko4skbK3O7J84JtYNuvN8sbNJmqKPcNoUo/ZMMlU0lWax7tSbC7+0LH9QF4d
	uQ4s22SDFusbUkKPKrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNng-0000000ESTc-08BC;
	Sat, 01 Mar 2025 14:26:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNnc-0000000ESQw-0lD8
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:26:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2238e884f72so4222045ad.3
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839199; x=1741443999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
        b=bvc5hjS3Rgn7MYZdL8k890ekIMOCSwHOcebYzchUY7yOGoIIB4etkS/RvYOi9LjKVf
         nUTGaGFEkzJ3MRrxSRo00Uvlz+hFCRCLweOUuznC0a0aHZO2uN1zICCZ53ftD6IQT7ob
         f1v2bfPpJdmU7LIsZDiS8XbpBJcCoS3Mrk1uojSWEcnOj6gNBLsUwFae4PxkkIO+R+Jl
         pJWycptPhg3EQe+6LfKuoeFE2zFoQzKUZOs72Q1AMnQ9kNwa8yodepmuoQ6OS20Y0P7P
         H4Aeps5H/n697F6GDQXmwUpQ8f7G2lsFQ2RaCkgXve01kUpPhbyvuJM8YCjjKqCJ0aPs
         FWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839199; x=1741443999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
        b=cdIRazsIGzj5jjXOfaxauO4ApQJmds/FDjNhL/slY8KXj0f8BUA0boE8m2ig5yuTMZ
         xGkw4Olwfy0H2rLcR61rNgwenbo6Nj6LGR/Yp++BCqTc99Pge3phAHc/m4+36GufE4T+
         ob4OhKpiyG3aIOt2ct7DGZFTeCg5Ivt03Ym3Yv5p+jQR8e3FbK5iq70k+DbxUOPi+t3h
         Hr1S29W3ulj+2QsAMWf2CXT2kZTzfQf5bVwUdjzBcIzkx4kx2gU1JAnS6SHmWkcrSisN
         1M0njiDZmh/i4RMz6EQ2/rJ/7xWM+g/S+x8nwdIF6m45hy1LKmjN6EVhTT4NHVS+thDX
         gu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8/Y2JoFcpUl7i8QAq0hhaytM7cg1A7FlMwAVlXcCvOdiODzYIdzPRd/S4/vvMXhGJ1nSAnugP3ms=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoE9dqpmQIneHZpZmiJuqXdOe26WotrR1MU6G8Lo8yGlE1J8jD
	0zzvAOIQjWXnIy3S4R4QAYEmF0Ejm6OUzswOmLEvuNCcmsHhpYIC
X-Gm-Gg: ASbGnctdgTt+Z9736EY6bLEIrb4APjHjbndqDrrofQU3OOhVS3OlZGeD0K596fbZ3WH
	IGNdRVZfx8sZyeBE9bwaJVcOo48RSIwfzVwFzRUEFBf2fYsSn9rtQg6JJlKT/kAz2OczF2CtVmB
	Hnzb9I3CsL0bd5f5Dq9ScTP2N0Sh+VkRyh6zET9CI2g8Hje9nKwek534titXkmUJOG+BTJmymZ5
	usTj1zNikt+LcTtcasaDSt9gGTNtjVXGfhF756/TxssDza4ACOLG5MIALBVEBYPVIkR+aYul+Uu
	gN8cOkWz4TG3bJ4nQRGFILQR54mEsyeWNGUslVoA3XBUR/PDHOJ3k2XSplVx6n0vtmH0HXJ1pko
	=
X-Google-Smtp-Source: AGHT+IF0PsFOHNYq2JTljPhmrhYVkAKjdgh1XZeXstNsMDq6/4mtC72Fp39DdqLibOGQ7FEZk2iiHA==
X-Received: by 2002:a17:902:da8d:b0:215:9bc2:42ec with SMTP id d9443c01a7336-22369260956mr94926455ad.47.1740839199131;
        Sat, 01 Mar 2025 06:26:39 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:38 -0800 (PST)
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
Subject: [PATCH v2 08/18] lib/bch: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:23:59 +0800
Message-Id: <20250301142409.2513835-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062640_222313_E1454C11 
X-CRM114-Status: UNSURE (   9.26  )
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
 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..769459749982 100644
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
+			tmp |= parity32(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
