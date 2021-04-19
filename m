Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3F8C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 14:04:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 006F061107
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 14:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 006F061107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8lFDmnEAT6XzIECBL81TDhK53FVsqaSz5DeEUFPMxzU=; b=MSLjCUqUXckgTQomkUUfLR48Bn
	0bBJNIaLLytfafI+EJe/OSzDkunOVISa166WZVZPmUgukKTDodjK/PwegIwJvgnVBwU+nV9Iqe6aJ
	4fb7FROCqRtrXrMwz1J29GPyRCpO3DJV6B0SHytTItLiGRazHpPAXAI33IdEhxZA5AR6zxvOItRxq
	KPARDNnpt/ZsbX+6HmZsvoEKBEuY99N4LQtTxQSIt6OmU5LLcJ4+1tbOgvjOWXV0yCp7o9xmzDt//
	53QTkKsIVshNXBxEH/Kam3H8TPKDPMBBh9mrBRO+2/xyWgocVfCZpL/0QgrA+IAsbbec87aSZdIzp
	EYIbGbqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUVY-00A3I2-LL; Mon, 19 Apr 2021 14:04:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUVW-00A3Hp-Kg
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 14:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=nxu9eDPkWq3PTLEH1baFydi/5NrG2V8i2dgIoCh2Q/c=; b=cIHEH1+RK3y0dtMCi6WorE3QkI
 TJ06sBw6C4f3EQP3A3STlvBkeN1ZRNsUThfjLXRvdDR73Q6U8XN/gWNj6IGUd5XlWZ5ipGDDK1dwx
 2xz54fwxJ/YsLRdZbNTLxgpt3GQ0rFMtGgFb2NIgPrj1t6YxDnT3AGl711ou8uXKCK4zKA75fU93q
 Mn7mcwMg3paYhMs09a16cALXQJ8ZDdlpyQ8GYxlWqWcKYkBIrZrNGEexjP07KDunYt3v9rnj4S89y
 2AgCcsebeBacyc6XS6DXPUmGDrd6x1TRb8x1hxAzTBVrSqvWkG+8eBmdxJo6WnKwsZ+X6AemiqU5T
 HDJhcAXQ==;
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUVQ-00BQl8-R0
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 14:04:09 +0000
Received: by mail-qt1-x830.google.com with SMTP id u8so26051938qtq.12
 for <linux-mtd@lists.infradead.org>; Mon, 19 Apr 2021 07:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nxu9eDPkWq3PTLEH1baFydi/5NrG2V8i2dgIoCh2Q/c=;
 b=dI6IEN/hioqa42xeOIr26bj5Io+h/awP9PmIKg9Rk7WUNq8SMb96wQQGXgAERTbyXS
 KckWi0afoGae6xeU85PzGAA6mumG55I3EQZYCPmREWQFF0wuvjguUZ966uyT/rLPands
 xbhRtgcawzrZ64JnvhP68MmB8825egLyB9b5M8x03cfnjDN/n6To+gn3sq75Y4MbA2Gl
 RUPryKWIjt3e1e66T0pDILpnP9aYj6kr9Gg/lVFPPavd0VMgG7Q1oMSd4eQrnfAxi7/H
 wrou5N9T/KZSrSoxqFaXggOOgxFGd+3uAxO6GF1FQIES+2AVndNU4D2Wul75d728lyYQ
 mmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nxu9eDPkWq3PTLEH1baFydi/5NrG2V8i2dgIoCh2Q/c=;
 b=FDFOJ7GZAZVIbMDHwXEO1Ljh2IWW5VJvAmod4466vPohn6Jk0f+AueFPWytafT4F4G
 c/YmmkQ0+i3H4qOmiiF2o4ZkYILt2G6mghlnImYc4ID2+boborMgWvYKnr1ed740XxqV
 MrDzDFgoY8g9hCX+EmLXaaCHZQ2N0CRQMokznLfT6NmnEvXkDuQJAHerSpwGB6IStpVx
 Vy0ZQI+VVakIE22aVVmNKFhanRM4RUbv0HzbZqon00bOexwvngybwunssG8fmK3S/jgN
 J/ejLQoQYWUdUGOCRJzu9MBN+AtW5/O05HGRTlu83JJpYXgubBeRmFZ3PHWOzn4Z+RRy
 kcVA==
X-Gm-Message-State: AOAM530DWa44IvV/bwj81IHyZJGDdhWr02P42YQ1gAAtDYIO4s+DUdU7
 GPeQy6BLG0BeQ8z11fe05jY=
X-Google-Smtp-Source: ABdhPJzkRTugGpBHdljnn4sH8PfB6cZhdsvGsNxKHKT6qWN7hIXtalxaFnc3CTQkK+Rb5nFv9Bk8fw==
X-Received: by 2002:ac8:750f:: with SMTP id u15mr11854091qtq.24.1618841043276; 
 Mon, 19 Apr 2021 07:04:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1001])
 by smtp.gmail.com with ESMTPSA id l14sm5961308qkp.56.2021.04.19.07.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:04:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Cc: s.riedmueller@phytec.de, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] Revert "mtd: rawnand: bbt: Skip bad blocks when searching for
 the BBT in NAND"
Date: Mon, 19 Apr 2021 11:03:50 -0300
Message-Id: <20210419140350.809853-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_070404_891143_AAC7C5B8 
X-CRM114-Status: GOOD (  10.54  )
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

This reverts commit bd9c9fe2ad04546940f4a9979d679e62cae6aa51.

Since commit bd9c9fe2ad04 ("mtd: rawnand: bbt: Skip bad blocks when
searching for  the BBT in NAND") the bad block table cannot be found
on a imx27-phytec-phycard-s-rdk board:

Bad block table not found for chip 0
Bad block table not found for chip 0

Revert it for now, until a better solution can be found.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 6e25a5ce5ba9..dced32a126d9 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -525,7 +525,6 @@ static int search_bbt(struct nand_chip *this, uint8_t *buf,
 {
 	u64 targetsize = nanddev_target_size(&this->base);
 	struct mtd_info *mtd = nand_to_mtd(this);
-	struct nand_bbt_descr *bd = this->badblock_pattern;
 	int i, chips;
 	int startblock, block, dir;
 	int scanlen = mtd->writesize + mtd->oobsize;
@@ -561,10 +560,6 @@ static int search_bbt(struct nand_chip *this, uint8_t *buf,
 			int actblock = startblock + dir * block;
 			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
 
-			/* Check if block is marked bad */
-			if (scan_block_fast(this, bd, offs, buf))
-				continue;
-
 			/* Read first page */
 			scan_read(this, buf, offs, mtd->writesize, td);
 			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
