Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DC5CD6E54
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 16:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT/mDwXMq6S9kwdjMBjIdQcNU4sOT+/4q26TvheprNI=; b=pFKbZMGg6d/1Mn
	3CvxhqvzU6JHJ2at9Y5Sz9Th1ZtGESPPUFj/K/OQx5JRo7qgUpbWVatHZz/gf2+7t7Yiqrf0/9zq2
	FrhVec8vp8OEzckabDBUcDYlGpwmDjlHTIC5JslzX0UmLEV/vS3nQr/gFzlgrjr3qaJfDaxMSDsx8
	ycRyox3liJ8xmVA15I/vLMt0KP//weJ68BLsn1NaHylYsvrW1LvfbSdPjHpxRW2i8a/wL5xOoU+N+
	CXGV3ry8jz3/ztSN4Re8KzS77bxvHc/GRLXAsWYI11kxPgx0LNrw2a1f5D+DVb+WeRNdfQGqfO2/B
	J7zsnl469tHcxCX//qSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT06K-00000007t3S-1YHj;
	Fri, 29 May 2026 16:30:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT06I-00000007t26-0cQB
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 16:30:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3895CC6245E;
	Fri, 29 May 2026 16:30:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79BE3601FA;
	Fri, 29 May 2026 16:30:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D5A710888CCE;
	Fri, 29 May 2026 18:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780072218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iAAD7ds+fYuXPAPJynykRhbA8G9w9uCf5SM4HMT6ftM=;
	b=e3uLVx06b8fdzVBzRCJy0Y1+5c90ARy0Wx6gcMRxdM8IPeMV3Cw07h8h8r3pgWPof92zVF
	8/9zaIMpR3Guu0e1HizE05GyV3qqBHy7oT0VdZJHA5OGA/lRO4suNIx9V0e0josqmeDH+a
	wQRESsDyra1c6mIUw7h0ccdhWmsl38XSKpYIDCuEFXLCV1mP48X5mX2V54jbknohsckjjV
	yM0EbK8BPe4AyjTJBTtjywMd9t0xT6K2v2Xl1P8b0PQQp8aqrVg6KtYIHckgieTN7sOxm5
	BAFKNZ3e8RKEmiAtlmj3lDH5i1RrsUhKADT33t+jRrC+bR9zPu0wSmT7/slDyg==
From: "Miquel Raynal (DAVE)" <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 18:29:58 +0200
Subject: [PATCH 3/3] mtd: rawnand: pl353: Fix debug prints
MIME-Version: 1.0
Message-Id: <20260529-dave-upstream-nand-fixes-v1-3-8c72aa23aee2@bootlin.com>
References: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
In-Reply-To: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Andrea Scian <andrea.scian@dave.eu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_093022_383541_71658B55 
X-CRM114-Status: UNSURE (   8.67  )
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

They are partially incorrect since "software" engine does not mean
hamming, the "none" cae is also falling into this print, and on-die
means there is some kind of hardware support; we prefer to use the
wording on-host vs. on-die.

Fix all those prints.

Fixes: 1e06dbfdfb85 ("mtd: rawnand: pl353: Add message about ECC mode")
Signed-off-by: Miquel Raynal (DAVE) <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index a941b5c836a3..4d4eaa5bdcf7 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -975,17 +975,19 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_DIE:
-		dev_dbg(nfc->dev, "Using on-die ECC\n");
+		dev_dbg(nfc->dev, "Using on-die hardware ECC\n");
 		/* Keep these legacy BBT descriptors for ON_DIE situations */
 		chip->bbt_td = &bbt_main_descr;
 		chip->bbt_md = &bbt_mirror_descr;
 		fallthrough;
 	case NAND_ECC_ENGINE_TYPE_NONE:
+		dev_dbg(nfc->dev, "Using no ECC engine\n");
+		break;
 	case NAND_ECC_ENGINE_TYPE_SOFT:
-		dev_dbg(nfc->dev, "Using software ECC (Hamming 1-bit/512B)\n");
+		dev_dbg(nfc->dev, "Using software ECC\n");
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
-		dev_dbg(nfc->dev, "Using hardware ECC\n");
+		dev_dbg(nfc->dev, "Using on-host hardware ECC\n");
 		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);
 		if (ret)
 			return ret;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
