Return-Path: <SRS0=W5Gy=YQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDFBCA9EB6
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 13:57:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEFF62173B
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 13:57:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n2VNwguB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEFF62173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IeSRCjcz4ixg9KwMfl+hrkANohr1l+tQagv6hZhlp6s=; b=n2VNwguBONjUS2
	v9kfU84iJcp09lGi+BBnnMaG065/kS9hBcZTlQB9dxkABANn+7MijhAgBDAc+q4BQGvKIJgZfQpDR
	xkFC4FTEEKvfTYHUE9jvFzZ8Tz7mk+MreY2EfqmQ1kyN3FC/SrPJaAW+8C+UDGnIsYsxe3CrSv9o5
	tdiXyAFlwzPy9XRoPiFE+EwEkdP/aTwwU3Ry9dgbsfAdw67IZjMCafqmomfT8WZ2xMxMckzKieRac
	+bHXOGJPrHvP0bGut973x3ieDBXwGPOXReIEEtC/G9Jj44ClpMmHWANWMSbvrFRHj+Bv9RGIza/sn
	0xb6u/2Tk2k0hJhraj7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNH8o-0001Ut-HZ; Wed, 23 Oct 2019 13:57:34 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNH8l-0001U3-9u
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2019 13:57:33 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id ED1D5DD28FD9AC71B3EB;
 Wed, 23 Oct 2019 21:57:26 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
 21:57:17 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <piotrs@cadence.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <vigneshr@ti.com>
Subject: [PATCH -next] mtd: rawnand: cadence: Remove dev_err() on
 platform_get_irq() failure
Date: Wed, 23 Oct 2019 21:57:10 +0800
Message-ID: <20191023135710.29888-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_065731_953431_9452789D 
X-CRM114-Status: UNSURE (   8.33  )
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

platform_get_irq() will call dev_err() itself on failure,
so there is no need for the driver to also do this.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 91dabff..5f07e8e 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2961,10 +2961,8 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 
 	cdns_ctrl->dev = &ofdev->dev;
 	cdns_ctrl->irq = platform_get_irq(ofdev, 0);
-	if (cdns_ctrl->irq < 0) {
-		dev_err(&ofdev->dev, "no irq defined\n");
+	if (cdns_ctrl->irq < 0)
 		return cdns_ctrl->irq;
-	}
 	dev_info(cdns_ctrl->dev, "IRQ: nr %d\n", cdns_ctrl->irq);
 
 	cdns_ctrl->reg = devm_platform_ioremap_resource(ofdev, 0);
-- 
2.7.4



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
