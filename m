Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE47C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3G1UTSbAtq4rhsOW+2LWp6D6KKNufiV9gT4dGHV4Kb0=; b=3l9ibmsYdNIeFG
	MM9/YxBt3QiX+nBFIipV0noZuIR0MUXO6SLBTh+hrvrKoRIui4U5djcL5cmWEUNX0AEx3I5oHzoQ4
	cWfhRj4n6FlmiV3t2grule5yFZevIxgTOXqfW6M29tCjV7Qe7A97ttv8ZFhwvj6NyRTm1GSrWTrcH
	FlYJwcloPRtWfUYICIQ2NuV9QUFaf11Z50I07f+7lCtEu1U8+nNKHIh9bcz9bYye6ruYlQmlDEoDs
	gKVTDVg6os1sCgNehXqUyHE8FK8U+g/f9kBZAdJPY8FoqX26z/0fWkIjsQKc/H/lPUPddEaFyJ+TA
	Ib65cYFl+2KbtHX5/9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5c-0000000BQDC-3UPQ;
	Sun, 23 Feb 2025 16:44:24 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5Z-0000000BQBK-0Do1
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:44:23 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fc042c9290so5702808a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329060; x=1740933860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
        b=G303FKAIiGg3F63TD7uJWCkjJeTwmwpeCLTWT1i/04QrPlHiorUb+aXiaAzHbr9OhB
         I30srn/6hiYCECD5HePYxcYFm8PImyBWSrfxJgVHaFZEvOsMJTsRxuDOE58xA6Uilxjt
         N19YVMCz4/Ih2ssHXi1emzDwx5Sus8DykRvneepRsed9NFFo9/L3D07CSp09zZxoo/Lm
         exOt8zfP4MmfiY9JPgZ3xS/ajaQBAQ2eD0VZb38CUOWBvWUe5JmsggVt9gXxgrSocGT5
         z/zNA8x8J1inkFAYeGRNnIsMgi6wjQoXThdNj/00GoPjeSEiY/93IRxf2PoqZ+AHcZNe
         plyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329060; x=1740933860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
        b=uTQ4PAIjJ2Bi/bigN04KeGjr5JTBgEKkSPsUyS68DPOs5yIKnqMaVgD0Q5HCEJOtyq
         Y4XoqtWirP5oYokOS0eUVPfScJmNt530tk2kid2mDKTOx0ifE6GgxFY/3xVH7iqZ1kv0
         jkEewyUO8BQo6YKbYroMzldHM652uxnz20PEe9ARMXT7J9K4qLX2OfiWY53xoSiogEHq
         Epl6IsoZNGE9nWhXjV8I+jmsgS7P6icHlB/vF8VdtdQtFlriIUPHBPX4VuTZaeBxWGWl
         y/GujwMdgdvaUsicAxyve5UfE/9WluaacuY9NDw1t55zPEj2LzquXMkaw6TucYvW8y3/
         /mxg==
X-Forwarded-Encrypted: i=1; AJvYcCXyWvTtyXNhywj3iRkNn7Z1CflaJGK8bQbEmNGLxgoeE9AzunrnwyYFGnFTC4xRyQDdMpbs6Wtz9ZM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwohWaUrb2b2hbtXZg8bzDwwZAtfbw89HWu8ZpghE6FnuZ/kyGi
	tOXJcjfyjg6o86IvjAYQQeRf6mTpmZxHRY7VIAMjdAv58QI3Q4M1
X-Gm-Gg: ASbGncuLW6g1RqHDW0TodaICzKtBN0fdyxiLBIBqM+GoK0j8B+4JNBBM4CcS5j66l23
	YJcKkDGTyCmKJ1HoMHlr9WGjANGCsNS4/BwleTJZPt6D+Yw8UCeWfTam9JcYlE1hGjvR0n3Qtmj
	X1g01gF4hjyGDGW15zqajC3n37jBaebNt86EXd9wtyZyajhw0qhYpy11YWOZZ3aUUqYFZ7goupp
	PTIMK6JJj46Z4V8sjwiwqnUu76tg0qdVO87cICxj6vpOvWARoznOuQ48Tn5BWUaptEmStgJrQYU
	wNJS507xzfzrvuYra0Rg15WUgviXM6k5o7Cz8jCJOMxN/SetFNGL3N5R
X-Google-Smtp-Source: AGHT+IHbMWEVOubhP8X9psmxxmvHUjnp2Da3yrH5tyGilfGOwqHtwm1WTVAYDoMFuzjd1nirp2a0lA==
X-Received: by 2002:a17:90b:2f10:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-2fce75d8389mr20940871a91.0.1740329060473;
        Sun, 23 Feb 2025 08:44:20 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:20 -0800 (PST)
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
Subject: [PATCH 08/17] lib/bch: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:08 +0800
Message-Id: <20250223164217.2139331-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084421_093627_4F27691E 
X-CRM114-Status: UNSURE (   8.51  )
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
