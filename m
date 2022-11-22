Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED1BC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 01:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Rb4WOC5YmUEyR3/n3eNswDceRy8kz2+lQUB+iJ6UAug=; b=rWp
	j1LCJeN8KsIgOUtvAvWYn3hdZM4TiEcO6ixEc+w0I9webwfeqPC+EK8RmZ5h4Ziu/aME27p7d0e+3
	F6y85Q90Ttyyiz4i1ZPOZzzF3ZEGgapAo4xVhFFSUlUONZlowggQ0RHWSaQENuqKdEhZROZUeaU7k
	v/4JU9cCSkJrntaTEL8S8r0mvcvb/Fi+D2SnplGngemEvd4QaHKEjlMhZUv0QIyg6uue0v4xCPNBN
	PyOeyBsWw2K128uY7DE+OC0PRPmlz407YKG2FagKSgw+ChtNvFu+FsTAUix5xYDM9t1qewOReflLE
	sRtlb6jKqo27a7YNm8QhxnnLR2ssqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxIAX-001vjD-2V; Tue, 22 Nov 2022 01:33:49 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxIAU-001vfW-0N
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 01:33:47 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NGRc15QtZz4y0v7;
	Tue, 22 Nov 2022 09:33:37 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
	by mse-fl2.zte.com.cn with SMTP id 2AM1XQvS024917;
	Tue, 22 Nov 2022 09:33:26 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Tue, 22 Nov 2022 09:33:27 +0800 (CST)
Date: Tue, 22 Nov 2022 09:33:27 +0800 (CST)
X-Zmail-TransId: 2afa637c26e7ffffffffe8deadb2
X-Mailer: Zmail v1.0
Message-ID: <202211220933274886024@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <miquel.raynal@bootlin.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <chi.minghao@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBtdGQ6IHJhd25hbmQ6IG9yaW9uOiB1c2UKCiBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgp?=
X-MAIL: mse-fl2.zte.com.cn 2AM1XQvS024917
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.13.novalocal with ID 637C26F1.001 by FangMail milter!
X-FangMail-Envelope: 1669080817/4NGRc15QtZz4y0v7/637C26F1.001/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 637C26F1.001/4NGRc15QtZz4y0v7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_173346_259753_8C7BF879 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/mtd/nand/raw/orion_nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 1bfecf502216..00bd7be76e07 100644
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
+	io_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);

 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
