Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90537C282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gk87rudqt5axMgfSd8lIrlqkpu7/cgq1DcwTwnWNZbY=; b=MGFRsFP2t2pi/w
	b0kTdKxkFNLrblYQAd9OUz6lo/NiVtoXafZGx7Sf7++cG5t6bfUtEI2oCju7groZqhGhcCst5/Rxb
	v8ozZx1tBAKkHlSu+TsDITuohNj5DDj+sdGT+rlUMmxS/HsBhA0U9/p5nowzmGCO+ZZEOa3X1nkNG
	cNGFVux8ERBLBWgoA7nfHvunOI5zC+V1Asg/FLIsXm2Ee5kMdFF/SlriskmUUe4p9zjPYOsaQVoDC
	hRAX2ebwuKuw4PUUmlnDaKQpH5J5eg8bEm1SqBCaSEiHOTugwudrXF3ujWWp7S47ZgJCPtHDX40D+
	tp/jt+tLnlJJnND55Luw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNof-0000000ET8V-06Sn;
	Sat, 01 Mar 2025 14:27:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNoc-0000000ET6k-0VRx
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:27:43 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223594b3c6dso51926435ad.2
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839261; x=1741444061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
        b=kUnJ8PTy7gX+97XWdhPSf+iSdBLJa0CESvrW9+t6HteW6zRUffnxTwDkqYlZsvClE7
         xbvrq913c9vshxz0oolQ609VOhxZVRk5P5/NqCXjpB0dkti8GlR+JEq+f/ER8xinCFNX
         mmo8NgGe2gvUQe29W+GBPbJaBiAtATybDhhpC3pBf6gsSReYGxkyrnuwFV9Au2pt+3T8
         ZFeHm73yJ3Lkz6h82ZIWP1IpLuq0vzr2dKWBwaO6ZASpXfGmoX68XVO5tt/XgVmvXoyw
         c8nL97LeovGFNyeE86YW8CrQ8UhTUmz66t0woqGMC4Uv6dZXCcETC6MVQae0eLurR3n9
         dMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839261; x=1741444061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
        b=OFUZlRPufyq6Mr3OeYu85bsj/yGEA8HlwqGD+YW1vN5qgjg8pwBXaRxhIBjsuN0ZeU
         hkWl23WirsUU7J5sIQw8cyRHkQj9XcyjHyskitNfmhWGq5HCxZ0YXCdVNZMGdlzRSLbq
         RrA+s+aLSLdxsv2YO5v5KFr1ItZfArE1ZaKbmXZOr3fN2Ytt+8EsAN8Z4V4Le0pqIwlg
         HLB0Q10a4mP85itUWmY4FljA9YLOiMqiO39pOw3E0fDCuFiXs2D9bHw7KTSn28TVC0cx
         6kyLLhkf6psAyi2aPnX7JCshsJhie6bVMR2JQq7FieCsRNnFl2LSOm0U7+WrOXoPS/3H
         JXKA==
X-Forwarded-Encrypted: i=1; AJvYcCWAGjHdptNQutwnWGa5En80bLUxwic4TobO7UcAqEL4q5Q7+gTAX0xOCW4tG1z5UGJFZfDYosqQ7lY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJAUTT43yUzuYicmtSx2OfuHBR79JVUlrbbyfz3UuddD3+DNI0
	KR34BegMIxj6MJKJuNMgQkPce9lProyhfHCsTjYIjMX4WxL1Epgr
X-Gm-Gg: ASbGncsyg78G9z39eoDnJrcRICs9z5XXEZ4SBWtQrIq59kC/GQ8BKcpF8BnKW57zSau
	SEj/XA0PtAsYpyI0yhVvWiNUDJVV09U3xBiJcYWOYs9vOgDV5CYCK7w+avFYODT6sfiOvijd2P4
	EsV53NSyiLKK69A9K2iKcrdq588A7H1Ft9BDwSnZYH5rQq+j+z/84adcjchRjOGNya6Iq57VQs9
	Je6vG8ehXiJ2uTxT3/Fl0sUn0qyghZIFF0xa/q9zjaUOV6lE+zMqQP9KBwHuCibiv00lPuO+1tv
	3FKdYHD0OSMV1XnS8rn/XdpzXoKWMMAoa4A24K/19FsW425GhF6O5pUj2y/E6yvKG2cbUslK96E
	=
X-Google-Smtp-Source: AGHT+IFiFnyov77ut9ZE0KvFExTJSaeHLpVxCuPiHzGuQy81Az6d7l02LfGDhYVm8qdT93KSy9qqzw==
X-Received: by 2002:a17:902:ce91:b0:223:64bb:f657 with SMTP id d9443c01a7336-2236922352bmr101615155ad.46.1740839261506;
        Sat, 01 Mar 2025 06:27:41 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:40 -0800 (PST)
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
Subject: [PATCH v2 14/18] fsi: i2cr: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:05 +0800
Message-Id: <20250301142409.2513835-15-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062742_158776_D91B0186 
X-CRM114-Status: GOOD (  11.32  )
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
 drivers/fsi/fsi-master-i2cr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..8212b99ab2f9 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) IBM Corporation 2023 */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
@@ -38,14 +39,7 @@ static const u8 i2cr_cfam[] = {
 
 static bool i2cr_check_parity32(u32 v, bool parity)
 {
-	u32 i;
-
-	for (i = 0; i < 32; ++i) {
-		if (v & (1u << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity ^ parity32(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
