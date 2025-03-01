Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68727C282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5oVwIjnB3/3ZYQXQqubghaWjr4L77i953kjb6TTDRM=; b=ef/sAvgxn8PRvT
	HJ8//CT+i/gBwYsICGJ1Pq0j6J4wqK9ql/nhtfohtH5Lck2pRCB12Aq45IcKHb8M4HHjTkD1FNOOG
	Krcc6MTGq/5iXWeApnHMLDgjD6hS5Z1wjaiEYLNit6tzu9pZgZ1hm1PQk7UmrTfMUjqNhIdBZ9H/o
	Y5fzjkpWbdsbY7oQSUVbCv2GoeLP47ewe3wcpFiGqiMJPD969vFlIGPePPmRRREslJpYoq7AD/98G
	4YffA/JCY38nL9+LlA7SIWXJlqiP3mlwDFP55ksvJB6vxEJwhybUtt2bkbJMOpxHf6gDdE9uPDZ0R
	pXr2ftVD6N2VbE0YpNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNnS-0000000ESLe-3XTV;
	Sat, 01 Mar 2025 14:26:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNnQ-0000000ESJx-0XqH
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:26:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2239aa5da08so1666405ad.3
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839187; x=1741443987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hp3kGqc16FF01of4e/8WmkeqsdCblTk7qrBu9qHKlh8=;
        b=BEcQU3FIKiUHwnCwTqtv4ku0QIFczmsXgMROFwcYIKT5XVkqWMkC0W/SFlbMaWbf1s
         gKSRivBJhNtCA0UfHuOnJuxXbO+TyJHg6iLluVEB+Celj6oHPUcvLfH1GW3GlfU2iHAE
         pTAosOhNcQNB51HazypguO0dfJicyMot3GqpewgM11axxUrbNQHjvmBcyqLUvt5/rTLj
         BHVo2xLjQagDqalXIe2LtYMBFM/5cg9vbG4JuC/pmvRxCyOZ3t9vRo2n8JR4F0KCmA2Z
         vcFzOMfLJu+EoAgPkewBbofD2MMSuslFxloNBDI8ZqZXeAEevNIcbcYO7BobdmDkxGsn
         qm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839187; x=1741443987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hp3kGqc16FF01of4e/8WmkeqsdCblTk7qrBu9qHKlh8=;
        b=kB+rLqBemYmd/tCEJG1HGF8B0r5lrZf/XNTDAnbckpSNIT/Rxe7dWdO9tp7ulR3ZMx
         0qY7fVbkVnwLWG9rQLaZZOVwzCoDK4xnuLgGK90jHqU8MdC9xpzgfycx2qi+Wf+Qi2Mg
         EK+OFSbVQppBuud3DiGs+PhcjhUSRlnNA2gUnDLgEGZOWX6ApAcKRteIWpHQfbmN25xN
         tREBN85A8cdGiciGFH0FVcIvGEhc9mJe7Nw7M9bpWRvWwX2B5eb3GcTO64n0KJ/kN2+0
         YG3kwAWgTW0+zobP3ke47HRVOtfBiJxZ861ON2FtwRmbcd8bfyxY9LlhIEnJTZciicha
         JfJg==
X-Forwarded-Encrypted: i=1; AJvYcCU//J+Gp4bFsTFlWNXCas9SKbK+e5+wQ/67SuIG8TxpqLZNCAVsz5QfKkJoDhem4DrDdfZ9QVokIZQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz0bigBxq+PEDlSL9tfpOriG+XbfY24FQ1pVKqFn9WLR5Pr/wr
	tmh6iNmg4/K1S3UgD22tg9uwW2wGOP/+DHlY0fd0qEBBemLKekU9
X-Gm-Gg: ASbGncvWwNAJVJW9HmC2anx3+BerGFynCn9MYQCcfykXU+1XFenGjqJfo7kOrbQA9y6
	Nhplv+gqgszTGE5bbK8fxJgYRtD0WhSGfupNUGIHxZX3lQ5APQotsNvLc6eaZviKbUm+uKZ7mEc
	Z+c2N8qTVhQ8SAa5SSpf5XAimafyBEkTlB7iIbuvYzuf6xr+fdHVpOXs4vOYYAOh/Aod9PZGaYW
	RjgGnYxaPgp7iNr9Y51ROyqESuxrqBaiLuqbdkQqaiQ7bdVhOA9HrukQzuqyCIuRdin2oeN9HIX
	CwA9fM+o5poitwzk6WHe98oLseuZTa3KiL0m5uLHSv/HxeSn2COYse5M961qaRs9QGTNrIxMJKs
	=
X-Google-Smtp-Source: AGHT+IGHEYprq9u4C7FchZ9I6Y/Ibnse4qNPj1GVk/AdnINX25zgN7NgXyYUydYVyaa9stUlYFgdnA==
X-Received: by 2002:a17:903:198c:b0:220:e1e6:4457 with SMTP id d9443c01a7336-22368fc987fmr121177295ad.26.1740839187181;
        Sat, 01 Mar 2025 06:26:27 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:26 -0800 (PST)
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
Subject: [PATCH v2 07/18] serial: max3100: Replace open-coded parity calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:58 +0800
Message-Id: <20250301142409.2513835-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062628_169527_563A80A9 
X-CRM114-Status: GOOD (  10.30  )
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
 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index cde5f1c86353..3b05ed113a67 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -16,6 +16,7 @@
 /* 4 MAX3100s should be enough for everyone */
 #define MAX_MAX3100 4
 
+#include <linux/bitops.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
+	parity = parity ^ parity8(c);
 	return parity;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
