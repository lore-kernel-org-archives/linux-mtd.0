Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378A1C0015E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Aug 2023 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sTqXon0XkzLPyLPSZlEdRcBBhzq7kCnvCpTg0KWwR6M=; b=0Z0CySA4FZzxkt
	MmJcK26uHJye5j7ZS2oL0MjWz6gNczmLvO6l1nEIDdqDju46qIzJacIQpsNgbC/vO9aY2yC7ib70C
	aWHBa5T6rYlHcMteY3FfSjL5DPdrymJuVz86vAnmI+0f2PNwD4UpJFJbPtRHwNqNOafZpIHINhcWj
	Ry7y6RMk+iPyZB/nxc3iz+FePRxEnroSQRGk4vYVmmKjnhE9XXlrCzeQt6aQTmHFnPrJ7Pki5VPPw
	DMbGFoIzfuoRIRP+njUgZSlaVHJv+EmJQhS68s4bhwIlK8WqqWS9EngS8j/m984DpP3QqCRmj5e5g
	BLyEx28OHwtwF+WWHd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRU3Z-0074p6-0X;
	Thu, 03 Aug 2023 08:51:41 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRU3V-0074o5-0P
	for linux-mtd@lists.infradead.org;
	Thu, 03 Aug 2023 08:51:39 +0000
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RGjDp0gkjzyNJ0;
	Thu,  3 Aug 2023 16:48:42 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 16:51:25 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <stefan@agner.ch>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
CC: <wangzhu9@huawei.com>
Subject: [PATCH -next] mtd: rawnand: vf610_nfc: Do not check 0 for platform_get_irq()
Date: Thu, 3 Aug 2023 16:50:56 +0800
Message-ID: <20230803085056.30888-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_015137_360336_DBF45787 
X-CRM114-Status: GOOD (  12.28  )
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

Since platform_get_irq() never returned zero, so it need not to check
whether it returned zero, and we use the return error code of
platform_get_irq() to replace the current return error code, for that
platform_get_irq() may return -EINVAL or -ENXIO.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 86522048e271..dcdf33dbaef2 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -827,8 +827,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	mtd->name = DRV_NAME;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return -EINVAL;
+	if (irq < 0)
+		return irq;
 
 	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(nfc->regs))
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
