Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BC6C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 05:45:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E172074B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 05:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QaK+L+Xt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPc879Fn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E172074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5Aaejqu2+V5ThGOoYcatJkMgtUdoONlyJwvNSocunxw=; b=QaK
	+L+XttGTqOJLtKcDowqPUg+1cheDy/JBk1B73uddugl3kdiHn3R3RXaUBxcb+sOgj4QFZzSAoJ5IW
	tWA1v4QR8wvjPNYQVOIhXhkDJMXXorEywiAtep5cT8X3SsfnjyTylR7ANrh7glo1bfL6j4+ga6lnz
	PnAoMWK/yGIBinLm47E+oLVWBHjjVW6QDPtZbPcIBHxaHTszNAAvTqSd0QYwwtP/jo8uG4pG/97YA
	3Z4wNDVdfElBjo4jJT5OCQFTcsYBorrNQhwbWcxG7Z9xJMC9NGOdCHv3dplEjBHavJpRYeNewFDzU
	V/6Psby/viINXDK8HMyH52Zv6YfoUDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjG1Y-0004Zk-0a; Thu, 11 Jun 2020 05:45:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjG1U-0003K7-Iq
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2020 05:45:09 +0000
Received: by mail-wr1-x444.google.com with SMTP id x6so4721270wrm.13
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2020 22:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CMSRdAMjqQ0hUIKg7+9PjXGS1txRLKEo1w8Yv1LWP4U=;
 b=RPc879FnDmXOmAiuG2ZiC2YAn/tFY+I56Ips0B76qiI4DawSzuLFJVbQq0JOYlQDvD
 QLujLY1XQ4R7Jo2IeeSNhcAYgf3KHPenlEC/nFdJIa9AoFcCBxo6ovQH8zm+bPeHfxFx
 Ia36NQzuV5x9wyHdewsXeQX2C1iAjxvRH5d+dcUdrkTKU5Wa2CLaXobq1J4sAnYghdwv
 cN1Knh+GBr2tfe99M45qIk5ozZq8B1Daw1dCXcbesgd3/OscMuvVXSbwvDpkVlMVWCIF
 nwS/J6EaUvJevLnehE9CPm8svB3JeptLEDquIukgcmT5DmpfSsppK5sv3tCRRfqxrYa0
 vg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CMSRdAMjqQ0hUIKg7+9PjXGS1txRLKEo1w8Yv1LWP4U=;
 b=qsLj2g5dBTMKApRZTM8+uUZVOGbYknLzAocvvsQ2/tolNpRxpKk74XzXv4asbmS2Ue
 6PNoqK/6tVLf2oNszXgs7OwENVQSGG5L7ZrdNrajUHTIgLzjS8hJvfSTWXtrLPIZIwDx
 oSqnLGKEOJ7ROdXZGFeW6IS4zIj2UTSBg7aQakb2/BZVawwGfUA1ubIjZFFS+7lkdLri
 bkygxYCoV0g9Xgpd5YvUhhm3rRfXgL07FzViNK7VXZUeCVC+5KLkS75IRcr/m/WRD7EE
 UxpNQG9Wjnjt1vbPwNSpeu00oVrR2YzD9NKIVrpegHO8179ZmjSaWJOPo/2v57gV9wMz
 m0xg==
X-Gm-Message-State: AOAM532JntlY8G9Gx3u9Y+SIpEijLaUbHz1OaJIBeKnPQ8qn5oKQkXNe
 b8+3VbdWBameX0wHqJE1pFg=
X-Google-Smtp-Source: ABdhPJwiu6b2yxpfn7MNIZSUJW6IzfpHRnguKDTAPMNAkrUoYbMuKaWHiMGXorXYC42Gftp6XKv2Mw==
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr7404152wrw.404.1591854301729; 
 Wed, 10 Jun 2020 22:45:01 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id j16sm3492724wre.21.2020.06.10.22.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 22:45:01 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH  1/2] mtd: rawnand: brcmnand: Don't default to edu transfer
Date: Thu, 11 Jun 2020 01:44:53 -0400
Message-Id: <20200611054454.2547-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_224508_663407_783FAA92 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When flash-dma is absent do not default to using flash-edu.
Make sure flash-edu is enabled before setting EDU transfer
function.

Fixes: a5d53ad26a8b ("mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers")
Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 8f9ffb46a09f..0c1d6e543586 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2953,8 +2953,9 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		if (ret < 0)
 			goto err;
 
-		/* set edu transfer function to call */
-		ctrl->dma_trans = brcmnand_edu_trans;
+		if (has_edu(ctrl))
+			/* set edu transfer function to call */
+			ctrl->dma_trans = brcmnand_edu_trans;
 	}
 
 	/* Disable automatic device ID config, direct addressing */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
