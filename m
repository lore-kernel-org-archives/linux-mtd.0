Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C55C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9187061042
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9187061042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dlcr1VgDz84rviok3grFkAmWXkhZZ0lSgcDg1DzlL1Y=; b=N818teRXBQAUcj
	LM1zJFi/0Tc1Vc/eG/pBm5LNRQFsX79CD4v9XirQjhGTkv+JSVuz341zSvF4UdRi3S+psC0HGbGma
	hh9jULYlVSgIR0s4FkxlC8kFcthNSfPW9za9iqGZyFufHGdahbay81NB2NsuFr6t64rRHL2PTEqM1
	G4SHGkKmKQLimzhHETMRpnbpJpQpkqdZjOCHlANSJL02VqHdri242J8OOlqh33h/6DYWzjQs+ONTN
	vQaHd+OWGiHFsfTuFNv1cNwEjr5aRkg/nhoU+vwgfW/POAl6sRmPpEG9JF3jbAg0M3lubbEBRouCw
	bntPWRH4222eSl09tkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCU9D-00FBVL-2Z; Sat, 07 Aug 2021 21:46:27 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCU8U-00FBL5-M2
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 21:45:45 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 1E3E0C63FF; Sat,  7 Aug 2021 22:45:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628372739; bh=Q8THvPbEc24FArMnsWwOWU9i3rfZl3y5bXxUnpIBVCQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DB4O54UibpsAUqbMsDeLJONXrwv5m6L+5jmfWyCTc0RNHiQYaxj4v+PZAOB4KwA+8
 OQuyBBajCmXdoyuI6yHR809emfsDt49baGzOyyYumVHg4IzZxQB5EP5hMNUDRmk7QB
 sm0NRjiPSQJPKUJ7+/B3ni+61f+6sBl1AGi+G/2h8i20vrFK3dzMUIfTc54pH9qOUw
 ml1MrRbQ3qpj3Ccb9Oty1gPfXYeZrjIl73ojnFBsVEfAGFyYhljaAnaZ8egH60AbvN
 ZJUW3az/V89j/rQa+ZbR8nnjqWzs/Z1rayfIWFhtWWKYQIWyt0o7GFoIaqIMnnzkRL
 1Dk+QRl7c3nuQ==
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/5] mtd: rfd_ftl: allow use of MTD_RAM for testing purposes
Date: Sat,  7 Aug 2021 22:45:34 +0100
Message-Id: <20210807214538.14484-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210807214538.14484-1-sean@mess.org>
References: <20210807214538.14484-1-sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_144542_945572_3F5DDE2B 
X-CRM114-Status: GOOD (  10.75  )
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

This allows the rfd_ftl to be used with the mtdram module, so we can
test different mtd sizes and test the rfd_ftl on machines without a
physical nor flash device.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/mtd/rfd_ftl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 6e0d5ce9b010..7b243f2b2fa3 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -720,7 +720,8 @@ static void rfd_ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 {
 	struct partition *part;
 
-	if (mtd->type != MTD_NORFLASH || mtd->size > UINT_MAX)
+	if ((mtd->type != MTD_NORFLASH && mtd->type != MTD_RAM) ||
+	    mtd->size > UINT_MAX)
 		return;
 
 	part = kzalloc(sizeof(struct partition), GFP_KERNEL);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
