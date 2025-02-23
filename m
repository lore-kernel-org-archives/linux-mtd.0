Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B5EC021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gk87rudqt5axMgfSd8lIrlqkpu7/cgq1DcwTwnWNZbY=; b=3hxIcVUZGPPBz2
	4Q49oh1n94VJkaf+DESqEFuT46OqEjVAdvSt3jaQaScdrMgIMCbhcRWV0Ylu2G2fXqAmShZMZfHYY
	2Kz1GjPdbgPJIL77l9CS5Ml4UPxKLSeHE7pD51zpBZ9eR7JL4LyxSWrVn9iPWwhmiSM0gryHAyYzM
	juokq4C9NUiHS7qcHlR/mpGsDQjTWDQYjo7B+USOEz79uJo9vMV1wwqS5zTSfa0njOsE7Esh4UaVM
	p3qzeY3JYoZzme6UU4HkZi90aZj4zwNGRkJn1N1TVHpAdYkmlwZPnI8CjWDOsX6D2oH6mqeUtqq/k
	DlxtpPhpEo/z26RTv4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF6d-0000000BQlF-2Zcv;
	Sun, 23 Feb 2025 16:45:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF6b-0000000BQkB-3Wzp
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:45:26 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220c665ef4cso61068705ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329125; x=1740933925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
        b=GzgX+TDRAGpNUjHpZUeAgbjjsgr7iAOh8/827OmEMgmuFhs11/itHpseLrtwm1efGq
         07NbXYTL2rwgR1G1pamCH9u+kMoXbxLNCyK8mGNWBK/layG1NA2cpI5aMGz4SB0g/5sT
         rTqpx8nSt+VtqCS4ONTrzQL4HTNBX8SP4U+atrRk2rWzOsBoTxoB1DdGKjZ1YMcuy2ZH
         k2yeRrr7xAdWftl8sv+7fvkqkbt7rjvrkESVJ2+f7S5dTVf6iAQoJBT3HdrSnqcwJWBi
         WcLEN6F+whmYjVojKvQQPfz1kaYHyHZRkKzytG1zru0wp3Z7VxlitGOy3unfyg9Dsvmg
         bwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329125; x=1740933925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
        b=wlWlgQWdNEOuxoOv8i4ujPIB6kzAtxRf7hgE2VaaP/A6WHzXofyFPBbadtMGSGuvMw
         phgfkatP8Bo1zR5y+FBiS0UjJMtVUkV9KtY6TJ/F8JdUbhf6RKZ/q7BMrryFJjb2Cjzk
         /NkqbBCGncLh9SyBq7RG1buVxXPlLW7NvFTfJsbIVXznjI/FxY6NAnCtCW1OzMTSh563
         tUrZ/3/1NX9lrWYfU47gMk8F9P1Ej4peoMvkbI1nO+PB3P5MUrHlgHPoQBDQUoL+es11
         pj+oBN2I6Chdb0N6VRd02ACdTPexe3dEUgm9NyjHiFx0S5mMdjKuUbnCVPEx2NlVrMd/
         orhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTPE65AUrihO8o3WVvu0+6OUZc4enmi3n1DxbqUhbRjooGzVRJGHUjgKd6iuMoJZcHyRwuxrh3JL4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1qn2UEwUcFGQi5Paswu+JozAxDf12MnJG5IkGqWe/DnrN5Kdg
	KBC/T9qLe3SlVhuFARW2iQY+yCczh2c93wKLvdbX5zDOEAqXdD7j
X-Gm-Gg: ASbGnctnCGpZCfR0kM9Wo7z0NZF3ecIwNwpKOHrGf+EIfcFi5L3c1ZZVx7QK040Rt/1
	97rIq2+xHFtJ9TUJauDlPTz3Ees8IU/OdPSuU7TuVY9Pa0mKrDCGq4HLy77wKKm26+HfTMAK7SO
	FUv+1hxfrfmG/OovS9t2y6/DJpWAt8dxfWYa7doXDfCC3Wri0OBvsa6C8HddREbHIqlmgWF5Kl3
	qbLLpbEhVSj/s+mThTu8f5aBDJho8KDtW3d3Ae4/DfDIMedG32mZNxKUjhp1vXH9Xqgv3BDqSBX
	FPR7r+A7/zvdkTSCNsEDRNsr0GH3m5aGsrqHhHTv2b5JeR8em6qntSXi
X-Google-Smtp-Source: AGHT+IFs3TQ1rSxmmbPXVRsSl3rqDEDcDSV6UQtHXLRs1szh2ELiA6tHTHYs6po5Gu/F9oStBVoG9Q==
X-Received: by 2002:a17:90b:4fc9:b0:2ee:dd79:e046 with SMTP id 98e67ed59e1d1-2fce78a3738mr17084857a91.13.1740329124995;
        Sun, 23 Feb 2025 08:45:24 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:24 -0800 (PST)
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
Subject: [PATCH 14/17] fsi: i2cr: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:14 +0800
Message-Id: <20250223164217.2139331-15-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084525_880024_F92806A6 
X-CRM114-Status: GOOD (  10.58  )
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
