Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E0CC021B8
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfKRCNVhYL758wvflawb2G11nwvouDw841/CF/lnzDM=; b=KgW4e6enfjRvtE
	lYDqsgcrZYMI3qMc6CnZVhlrTKwK3ONXi+bl1IdXp/gve8QeRlzNJ4MoLMd8PlTf5YO4TZoxqbVhO
	mucWihWT7KVyKS+L1hloeNifrqMDQGBzaKZwXx3uwEBcqKF/gHS2+gAEZn87z1x60Awz3APrlDxnr
	mXnyS5I7NqTu5DGLOykamqLtXqWExwUASXTaquUUKpfMDJBD7AIqvBFul1Befn9XUmX55Y4y9x/5B
	5YCG2m71R0RJ5wnxAieFr63nNtnI3t+/RyzkgQWf5kW/IJXGvUDUMrODHVHpzZcTCyWtZ/w1+FkF0
	sijeRjtZGefEjPw20HMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNmz-0000000ES2y-0buR;
	Sat, 01 Mar 2025 14:26:01 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNmw-0000000ES15-1lMp
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:26:00 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22337bc9ac3so59623785ad.1
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839157; x=1741443957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
        b=Xhg04diKCJ+PO5R4suclPIfyNDKGHO9ul7sguwNGG+35Wak0yunfXYhvGNU2gZYEr+
         thl+zimEzg5l1kCMZrcpvkYU8NMm0TbWkNQQELJBQtwhpcOEeaqWyz//ULOApEsoweDt
         iJ3gfEsW+F8A0Rs24/ZSpJ0SHnMVp2JTVqkFc1zKh3OYuTNrWxVunAz/gMkq9WuL+mqP
         tu1Mljy8ZUqSFkxycXe66CXv+LouaY7oyrz/r/WzwV0nl0kYAFDCKctynSyT5XLB75z3
         S0SSQnL1aSfF822HbHSsgULV6dBHFzmERIh6M/qMNJgbbMxQz6BgDhQUbyqsI8x+Iwkq
         wWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839157; x=1741443957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
        b=JMg3oCJSo/p3sWFDaAVXIsCcQvGmowszZdZeXPinfS1/nzgwmkx/dRCei4rgHUgm31
         3ZzBOyQhzR7qCtirY7RWTP+e4XSf0hcByvZPVr5hSLZ93Ihfk3J4yt10gE/7m1ExjK+7
         BaG0H02iCRf1+O8xHUX7w0kkm0ZN1JJ9VbQhI4WTcEHw0ZuGu3HwPCSaSNeu+2+IZ+fI
         MhsOFH9dUuSTwEJ71UPvgvbkA6l1MkUKjvLxSBkpGfjdr3kUvi8VOkN1GQTqaieeTg2M
         p0pepy5OKONHf0wW2GHI1vQwzfj8LCtENX8kacHonfT04UsUtU/mda7tfU7KdjddkeBp
         j1NA==
X-Forwarded-Encrypted: i=1; AJvYcCW8tVGHmqqwt8abbYCOED5EIExS0d/PgGCu7TjOD2O+pakfSdfKh1jY5K5LwsgheMfSgDrxdDO8kKo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxO02KfM6cbflf1WJgTYs3oqle8O9tw2w1dzXr0yVxeG3xaOuqk
	PhN4xFpgRU8uwBIKpZDkzClEpGODMtDulQlCNnnxg1p59+pxfBCh
X-Gm-Gg: ASbGncscfQVZNppztxIHmqXTpynP9/LBtxqTe9Jb0YkIK/BxdXWWLuvTqr+TF44Pd+L
	pdQ5Zg8JovxIeCsC+0+w/eDpudjEniO/2mCWaJSk0Nzn970qNWZLmlS54X5X89F1umkhR0hcP68
	Fj7gPjwF4DOCsoMNOGAkWmBS6CPYuE4i95Fcy9Xrwna/UvMinzrYyoaCs5tdtsMG9al/K6450KZ
	Nua0Bw51Lu0yHs550Bk4xYKth1NaCeGwZadVhnucPdOKErQ1jtZRXEEMYYDTwTfKi147H8IIVzd
	021TXigqs+N9F39ybSbvz2iy6JIpeI2uxhwFF2E9Y0WPto07z7DFibAuSln2gf3YNDqPxcCVsNE
	=
X-Google-Smtp-Source: AGHT+IGPradnOrYoMR1IanWjYjFo3KQDnHNjL2IS+TgfZGmLy7jDODNM73AvbKhXyZC7rWPMMIa78g==
X-Received: by 2002:a17:902:d507:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-22368bc6ae3mr104323495ad.0.1740839157468;
        Sat, 01 Mar 2025 06:25:57 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:56 -0800 (PST)
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
Subject: [PATCH v2 04/18] media: media/test_drivers: Replace open-coded parity calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:55 +0800
Message-Id: <20250301142409.2513835-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062558_462052_43CF2D86 
X-CRM114-Status: GOOD (  11.36  )
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
index 70a4024d461e..e0f4151bda18 100644
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
+	return val | (parity8(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
