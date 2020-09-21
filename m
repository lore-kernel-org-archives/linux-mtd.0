Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09E4C43465
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 01:17:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83D6820888
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 01:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P4MWmode"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83D6820888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q30MzOr10tTR6cbt2C/+HYZ/4GINyWZmGdvMPIzbjPQ=; b=P4MWmodespg8eibJVV01QBfR9k
	pF3t37MLQCB+322lXqZsZVeg5nsSHWLyquVtp8qTPMLr7+fMO+PSWcZn73PEGmu4F3fy7LNi0+7LM
	b2yLJ9dFMhw3F7rEZaSGcY6WjKxlI3ami5WpulvyDrt5hASWwbXR+/WQtpD50Cl4BoYkGxubqt7uC
	c//ouSlRCg4OqQLxWHv2eFBed3Aq9mFQSHuzTUGE97iFeAxmrOlNZJ46DDEuqxLvjJ+GZ2n1mmWXQ
	qFuHOBr7EgpZVFB0glYioOV6DErczX6Rhh9p09JwkpPSoyNkKv95UejwO8V0OZMxAzP7IhREYwK1K
	MIkw7vaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKAR6-0003lx-Ky; Mon, 21 Sep 2020 01:16:08 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKAR2-0003kw-M2
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 01:16:06 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7E009BE0CB2D04959471;
 Mon, 21 Sep 2020 09:15:51 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 09:15:40 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH -next] mtd: rawnand: remove redundant dev_err call in
 cadence_nand_dt_probe
Date: Mon, 21 Sep 2020 09:38:05 +0800
Message-ID: <20200921013805.1724606-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_211605_580939_C156673F 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Cc: Liu Shixin <liushixin2@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index db29e5e512df..b46786cd53e0 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2980,18 +2980,14 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 	dev_info(cdns_ctrl->dev, "IRQ: nr %d\n", cdns_ctrl->irq);
 
 	cdns_ctrl->reg = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(cdns_ctrl->reg)) {
-		dev_err(&ofdev->dev, "devm_ioremap_resource res 0 failed\n");
+	if (IS_ERR(cdns_ctrl->reg))
 		return PTR_ERR(cdns_ctrl->reg);
-	}
 
 	res = platform_get_resource(ofdev, IORESOURCE_MEM, 1);
 	cdns_ctrl->io.dma = res->start;
 	cdns_ctrl->io.virt = devm_ioremap_resource(&ofdev->dev, res);
-	if (IS_ERR(cdns_ctrl->io.virt)) {
-		dev_err(cdns_ctrl->dev, "devm_ioremap_resource res 1 failed\n");
+	if (IS_ERR(cdns_ctrl->io.virt))
 		return PTR_ERR(cdns_ctrl->io.virt);
-	}
 
 	dt->clk = devm_clk_get(cdns_ctrl->dev, "nf_clk");
 	if (IS_ERR(dt->clk))
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
