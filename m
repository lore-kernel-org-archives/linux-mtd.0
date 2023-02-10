Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D109C636CD
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Feb 2023 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/Icl34JwOZFg/TknO/HxDLJS/EktpUwUf5eN4OMSark=; b=gjI
	j9LvY6kNbGJiwSBczICF+0mJg95OvbzKx4paGqKbkMPOLpS/OP0tLQcjCt+HfY0zQN3+G7+7G5oS3
	p9bTuOOaqpUq8HMM/gQC9l+efYcsmvircu8lVyES6m6ws8prGba2nVq32Z0mcIzA7yF7XBNjFCYOT
	xK04bSViEOhUX9zNA6T12UvZjpexpXxWaIh8PKccoUYhY35PaPAdQcM4KsLMb3rchuA8k6B5ADFzv
	UdVrZxHffRxpRwYNbR3VUiTFCeZjGYeaxVXdvv8KZfv4OVMtE0ou0g1ASqt2fJ8srV0aahmazQp7X
	iFJjfYd6QeL20EsW1MofPEaVyA/3QCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPdk-00543v-F1; Fri, 10 Feb 2023 09:24:20 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPdg-00542E-6B
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2023 09:24:17 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4PCpG60gPDz4xpyD;
	Fri, 10 Feb 2023 17:24:14 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 31A9Nrtu090567;
	Fri, 10 Feb 2023 17:23:54 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 10 Feb 2023 17:23:56 +0800 (CST)
Date: Fri, 10 Feb 2023 17:23:56 +0800 (CST)
X-Zmail-TransId: 2af963e60d2c5b93241f
X-Mailer: Zmail v1.0
Message-ID: <202302101723563685569@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <miquel.raynal@bootlin.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <christophe.jaillet@wanadoo.fr>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBtdGQ6IHJhd25hbmQ6IG9yaW9uOiB1c2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCk=?=
X-MAIL: mse-fl2.zte.com.cn 31A9Nrtu090567
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63E60D3E.000/4PCpG60gPDz4xpyD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_012416_400687_B32EEE83 
X-CRM114-Status: UNSURE (   9.92  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_ioremap_resource(), as this is exactly what this
function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
v1 -> v2
change devm_platform_get_and_ioremap_resource to devm_platform_ioremap_resource.
Fix the double space in subject.

 drivers/mtd/nand/raw/orion_nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 1bfecf502216..1bdcd544c3fa 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -102,7 +102,6 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	struct nand_chip *nc;
 	struct orion_nand_data *board;
-	struct resource *res;
 	void __iomem *io_base;
 	int ret = 0;
 	u32 val = 0;
@@ -119,8 +118,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	io_base = devm_ioremap_resource(&pdev->dev, res);
+	io_base = devm_platform_ioremap_resource(pdev, 0);

 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
