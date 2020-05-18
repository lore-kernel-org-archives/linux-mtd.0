Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCBDC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 15:52:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB9720758
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 15:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qCL0NXuA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FB9720758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Y9TVg2dlgszzf6zZ4eGVao37MKbMXjMZohYAMtjlQk=; b=qCL0NXuAZiUVyj
	wmFiu2mNTZsgUhC/RsPlCySYESRfGJeBpM1KQ+VX47ueuTHLyBpHNP8rdPGtmvWG5oRzT0PNgqa/y
	A4LF80UB3mO+TlxPP9VSXwI6Hw+lWl87iXjbE437JegD7hYiA2mY2nUBrxlXi/+QLpZHI+b2NQAyh
	doERzK2oMI6QvdWx3CrSO+Ui1u9TBNZ1N7R2k0YnTzJijBjEvn/s3emx0EfAvyfAOWT9zxI3dsAro
	4xlrFedGBkavVvPlsqpdrcOJEl7Yz5XiVznj6eetwG/WLn5qSbRKDdUNYUK9LEy/iJaDsPIz090pS
	LMEByaOMrIyTiDAxr1JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jai4N-0006H7-ME; Mon, 18 May 2020 15:52:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jai4J-0006Gf-Ls
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 15:52:46 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 936C0260258;
 Mon, 18 May 2020 16:52:41 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: Fix nand_gpio_waitrdy()
Date: Mon, 18 May 2020 17:52:37 +0200
Message-Id: <20200518155237.297549-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_085243_842656_FEBB1155 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, stable@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Mimic what's done in nand_soft_waitrdy() and add one to the jiffies
timeout so we don't end up waiting less than actually required.

Reported-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Fixes: b0e137ad24b6c ("mtd: rawnand: Provide helper for polling GPIO R/B pin")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/nand_base.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 2d2a216af120..169150a7c140 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -790,8 +790,14 @@ EXPORT_SYMBOL_GPL(nand_soft_waitrdy);
 int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
 		      unsigned long timeout_ms)
 {
-	/* Wait until R/B pin indicates chip is ready or timeout occurs */
-	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms);
+
+	/*
+	 * Wait until R/B pin indicates chip is ready or timeout occurs.
+	 * +1 below is necessary because if we are now in the last fraction
+	 * of jiffy and msecs_to_jiffies is 1 then we will wait only that
+	 * small jiffy fraction - possibly leading to false timeout.
+	 */
+	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms) + 1;
 	do {
 		if (gpiod_get_value_cansleep(gpiod))
 			return 0;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
