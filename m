Return-Path: <SRS0=DkJA=5E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062F4C4332D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2020 14:39:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C958B20663
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2020 14:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jt3swb/E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cartesi-io.20150623.gappssmtp.com header.i=@cartesi-io.20150623.gappssmtp.com header.b="Pwc94d17"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C958B20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cartesi.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6zc0MOD5T0lJ1Ve2xhn5eiBFPs2PTPInCzINvCiREP0=; b=jt3
	swb/E7n0xVWwc7fVT0qlVdcTE0cfuOt1L24NJT3hhnQWNgvAOT5xt8nlTXN+OixFBL83w5F0uNbeu
	geVL2Q+TQC7mWvLZu/vIlv5xBtLG3J62ItdZNGP5cHfc8zGQj9ZUkanwtcF+Ajps7liQhl3Kp4tHL
	LoW585SoaKycmw2eadGixusWgtWjgJW9wi31vR5uN+84eyEK/qAHwLQlMqtPuy0kV4fA8cZxk4yx6
	ueogQlTtW6U1oP1XBwi6Yvx0zcK9OcXXooXMVTklzMjG5VI+WhZ9iEsyX2ftSP+P3g2vxN0fAz6UP
	2G4vy5bDgHAGvFKD076Pce8wbFbN1qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEwKC-0004Es-BS; Thu, 19 Mar 2020 14:39:08 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEwK9-0004EX-7j
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2020 14:39:06 +0000
Received: by mail-qk1-x742.google.com with SMTP id p6so3290032qkm.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Mar 2020 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cartesi-io.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=mrkPInIySQs4Ig6viEvZQbyOJf3E2L/MWew9uzARNUU=;
 b=Pwc94d17mbO7Nj9ORNLce1J+Qb+//4u3nhjrPhmfEB7B8bz9lPNpGd8Kz/Yzo1CW+k
 weU5fFugidMBzTX2EsBgNOd5v7ZzQ3NweE1Sdg0cw2Y53eVZJmmJ4TcPhJGXK+JugqbW
 OLTWkwdpRaB+bcdIIUvIZP8fDWF2Sbvd3YaQnjDscyWYma+KtDUqUibPEGPHB5Zwse0O
 LYBiPIPEgB7F4EovJXH5cT1fZCnKRT2BXudOnxeGkOPD+r+Q1uxPoPNc2wOloTVzm5rh
 1OlantZ3bvMTXixOeq31EbqUnf4912wewGN78NOhZT14U21ctLAX3Pg0QKgVIkROCYRs
 I/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mrkPInIySQs4Ig6viEvZQbyOJf3E2L/MWew9uzARNUU=;
 b=J9dbvukR8MZBce95yRGYOopYq7UNDET7yhjTgMeMezSdzDpMqd0wctrWv4WxKmm6AG
 T6dMrpZ7N4rVLd7Ga9Reze/hqTaWnOTkmDFJIckdAxgD1Wz0sObPmxe2zVaBjo4ZdgH5
 39BnfCFbwXw1JWoHKrMvSkAwq6fhA4DSkyZjQHzmXbSLMParnqTDQsQS7lqP7btGgNIM
 DImi2zctINrJXZrDxfPLA+KiBYvRyWn2tJVisdmgN6upoPrDvcXUScqjm1IFgDWcHiM+
 C7NWAno0DqbNAZIS+2Uw5B+ianW5ySDbliK2nV/ar6jTM7qEvxqdbh+EGsF6R9pQpdyd
 AHkw==
X-Gm-Message-State: ANhLgQ3zjYAi9xA1W8GOQrRB3Vdh27qN+fO5o6xYTZtGaLaN7dFE8gPh
 /Q2u6IlcFBWST6wG7KPt3pjNs57XWis=
X-Google-Smtp-Source: ADFU+vs1ccVIYEquXH4E1utxmnNXEfRvFp+TcSPSely+5+wev4exkNnyzQOEX7dy93DO7KyXA6LmGw==
X-Received: by 2002:a37:b646:: with SMTP id g67mr3288437qkf.52.1584628743417; 
 Thu, 19 Mar 2020 07:39:03 -0700 (PDT)
Received: from localhost.localdomain (191-45-75-85.user3p.veloxzone.com.br.
 [191.45.75.85])
 by smtp.gmail.com with ESMTPSA id f22sm1641851qto.79.2020.03.19.07.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 07:39:02 -0700 (PDT)
From: Victor Fusco <victor@cartesi.io>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: physmap: Fix mtd device name
Date: Thu, 19 Mar 2020 14:38:33 +0000
Message-Id: <20200319143833.24767-1-victor@cartesi.io>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_073905_415031_13FA41FE 
X-CRM114-Status: GOOD (  12.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Victor Fusco <victor@cartesi.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch fixes the mtd device name when the "linux,mtd-name" field is
defined on the Device Tree. A verification to check if the name was
already defined was missing causing the name to be overwritten with a
default value.

Signed-off-by: Victor Fusco <victor@cartesi.io>
---
 drivers/mtd/maps/physmap-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 8f7f966fa9a7..6372197ad865 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -515,7 +515,8 @@ static int physmap_flash_probe(struct platform_device *dev)
 		dev_notice(&dev->dev, "physmap platform flash device: %pR\n",
 			   res);
 
-		info->maps[i].name = dev_name(&dev->dev);
+		if (!info->maps[i].name)
+			info->maps[i].name = dev_name(&dev->dev);
 
 		if (!info->maps[i].phys)
 			info->maps[i].phys = res->start;

base-commit: 5076190daded2197f62fe92cf69674488be44175
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
