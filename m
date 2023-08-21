Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32FDEE49A5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SvvMEVq5n5wrqq8cB6bA7bI48pzCslCrMwEngdRYZFI=; b=dzbybqkUj6+32m
	H65uQgrwU4ufev/gfgOWsIQKyl7Q+aJYcwic/lCk0kO6/KsuFNVOkqzicgBv7drVr51bDnASsFsAk
	HGKCNxnwKnH0n4xoDI3E197IsLA9rM9SrBpKx7vm9U8AHCXUIPYUc3PR1+fX8uQ2kZX6LOaokI2wl
	qup/UdBrfNukAkJISTQtLjGqyqF9+shJfNdkauCwrPWo97UR5/Um1+TfaU33W9GiS8LkhM5IlrjTH
	a4Kh7fe4T/tXtrt+p+Rbdstfh4TyI+SDLwySzRCdGq1w/B0SybPdlE8+YNOKFaH/Nhg05i3i1ioOk
	PuYVFnkVNeskZ7fLAOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY0Yp-00DWMO-2u;
	Mon, 21 Aug 2023 08:46:55 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY0Ym-00DWLN-1x
	for linux-mtd@lists.infradead.org;
	Mon, 21 Aug 2023 08:46:54 +0000
Received: from kwepemm600014.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RTmJZ2XdCz1L8xC;
	Mon, 21 Aug 2023 16:45:18 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.175.28) by
 kwepemm600014.china.huawei.com (7.193.23.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 16:46:44 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <martin.blumenstingl@googlemail.com>, <heiko@sntech.de>,
	<jernej.skrabec@gmail.com>, <nicolas.ferre@microchip.com>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: omap2: Fix check 0 for platform_get_irq()
Date: Mon, 21 Aug 2023 16:46:22 +0800
Message-ID: <20230821084622.218442-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.28]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_014652_889221_B42DFDCA 
X-CRM114-Status: UNSURE (   9.35  )
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

Refer to commit a85a6c86c25b ("driver core: platform: Clarify that IRQ
0 is invalid"). Do not check 0 for platform_get_irq(), because
platform_get_irq() never return zero, and use the return error code of
platform_get_irq() instead of -ENODEV.

Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/mtd/nand/raw/omap2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index c45bef6158e7..cf76afc6c0ed 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1881,8 +1881,8 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 
 	case NAND_OMAP_PREFETCH_IRQ:
 		info->gpmc_irq_fifo = platform_get_irq(info->pdev, 0);
-		if (info->gpmc_irq_fifo <= 0)
-			return -ENODEV;
+		if (info->gpmc_irq_fifo < 0)
+			return info->gpmc_irq_fifo;
 		err = devm_request_irq(dev, info->gpmc_irq_fifo,
 				       omap_nand_irq, IRQF_SHARED,
 				       "gpmc-nand-fifo", info);
@@ -1894,8 +1894,8 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		}
 
 		info->gpmc_irq_count = platform_get_irq(info->pdev, 1);
-		if (info->gpmc_irq_count <= 0)
-			return -ENODEV;
+		if (info->gpmc_irq_count < 0)
+			return info->gpmc_irq_count;
 		err = devm_request_irq(dev, info->gpmc_irq_count,
 				       omap_nand_irq, IRQF_SHARED,
 				       "gpmc-nand-count", info);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
