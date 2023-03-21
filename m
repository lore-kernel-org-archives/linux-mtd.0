Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91DEC74A5B
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Mar 2023 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=TAAmtDdCbhwC7a7wypbTIetFGSHswMKRZ1i5J4geYS4=; b=Bgx
	G0oZtxILPNMsGKvYYZgPjVDS0OXhidxwD9cqYBimgf9b3ojd+xIsbGPolqaW7crehiaMpDCWel1ep
	hXzwdHEMp2MrOmTtmGSYZDWoLo2wLR4lXG0A9Q0gJqsovM5CDmbfQIEnTKMJNaH9z9t0lXHEPyoVu
	PC1kq/v6KlTPhAX29Tj60db/K2VHp9G4ENIL10Mr+qtpXG7VSBOY3h0pRFXMYCk7VVhFNMox+PnPa
	9777gfChAA7ny6XIcFLbKd3UWGq8IyRO5fvmfR9FQtVYRbQPBPJ3dUG6ByurmPyORQn6kbIgR5pGk
	h70rmkH5Swaze9isfEG7kPSrLMdE3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peaZF-00CFyU-2J;
	Tue, 21 Mar 2023 11:54:17 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peaZC-00CFxO-1f
	for linux-mtd@lists.infradead.org;
	Tue, 21 Mar 2023 11:54:15 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Pgql84qhtz6FK2W;
	Tue, 21 Mar 2023 19:54:12 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 32LBs0tj095231;
	Tue, 21 Mar 2023 19:54:00 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Tue, 21 Mar 2023 19:54:04 +0800 (CST)
Date: Tue, 21 Mar 2023 19:54:04 +0800 (CST)
X-Zmail-TransId: 2afa64199adc41a-04a79
X-Mailer: Zmail v1.0
Message-ID: <202303211954042531445@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <miquel.raynal@bootlin.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtdGQ6IHJhd25hbmQ6IGZzbWM6IHVzZcKgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZSgp?=
X-MAIL: mse-fl1.zte.com.cn 32LBs0tj095231
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 64199AE4.000/4Pgql84qhtz6FK2W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_045414_730039_D2CDF077 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource_byname(),devm_ioremap_resource() to a single
call to devm_platform_ioremap_resource_byname(), as this is exactly what
this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 6b2bda815b88..cb2eb6a79043 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1041,25 +1041,21 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
-	host->data_va = devm_ioremap_resource(&pdev->dev, res);
+	host->data_va = devm_platform_ioremap_resource_byname(pdev, "nand_data");
 	if (IS_ERR(host->data_va))
 		return PTR_ERR(host->data_va);

 	host->data_pa = (dma_addr_t)res->start;

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_addr");
-	host->addr_va = devm_ioremap_resource(&pdev->dev, res);
+	host->addr_va = devm_platform_ioremap_resource_byname(pdev, "nand_addr");
 	if (IS_ERR(host->addr_va))
 		return PTR_ERR(host->addr_va);

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cmd");
-	host->cmd_va = devm_ioremap_resource(&pdev->dev, res);
+	host->cmd_va = devm_platform_ioremap_resource_byname(pdev, "nand_cmd");
 	if (IS_ERR(host->cmd_va))
 		return PTR_ERR(host->cmd_va);

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "fsmc_regs");
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource_byname(pdev, "fsmc_regs");
 	if (IS_ERR(base))
 		return PTR_ERR(base);

-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
