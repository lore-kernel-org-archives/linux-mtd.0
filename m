Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD89C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:23:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74C2F20659
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L4Cd+GN2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74C2F20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GOBhwVhsXo6HcjQVXg7b/TvuWbb/MCkQdhR5336WfFg=; b=L4Cd+GN24FHP8w
	6PCMXn3/d8AcZKL5zDVmtxBs/4/A6Nwkuaz3w3mwLokd/6s7VimKyP/GVv2Ul/8vmMz9rvCCgj3tU
	+UH2wFuWBT9GFj/jN4pZhXIggONVRq8egGN594crwzISf5WTS8xGlkm+b+qaYztiAP18Eefg2M07r
	ft98dmlKb0sAg5IIWhJcLp5R9A9+6yDu6r+v64lwujrbV1UltChvcCbE7UhjTeAar/lq0TerbghCP
	Z9FKqezfyDahkPnVIoK3gH0UYcn3KqRzO2jk0dU0bIxBIaaL/Vk9rmVitmQPSme+1ZKl6FIK0GD8J
	BPGmBPXYxoyz+GBY+tUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYv6G-0001bX-5M; Wed, 13 May 2020 17:23:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYv5t-0001BD-PK
 for linux-mtd@lists.infradead.org; Wed, 13 May 2020 17:22:59 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 215912A2000;
 Wed, 13 May 2020 18:22:56 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/4] mtd: rawnand: davinci: Inherit from nand_controller
Date: Wed, 13 May 2020 19:22:45 +0200
Message-Id: <20200513172248.141402-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_102257_970460_CD762B2D 
X-CRM114-Status: GOOD (  11.77  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Let's not rely on the dummy_controller embedded in nand_chip.legacy
and explicitly inherit from nand_controller instead.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Changes in v2:
* Add T-b/R-b
---
 drivers/mtd/nand/raw/davinci_nand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 25c185bea50c..0312c632d86a 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -38,6 +38,7 @@
  * outputs in a "wire-AND" configuration, with no per-chip signals.
  */
 struct davinci_nand_info {
+	struct nand_controller	controller;
 	struct nand_chip	chip;
 
 	struct platform_device	*pdev;
@@ -788,7 +789,9 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	info->chip.legacy.dummy_controller.ops = &davinci_nand_controller_ops;
+	nand_controller_init(&info->controller);
+	info->controller.ops = &davinci_nand_controller_ops;
+	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
 	if (ret < 0) {
 		dev_dbg(&pdev->dev, "no NAND chip(s) found\n");
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
