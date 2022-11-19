Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79EAC4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Nov 2022 07:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1wkXc+LJSV2irqYpeacuVZ//dSO4GGtJZtk8f8kBgAA=; b=t/UMQUIDltIIjL
	e7A2XgIQGdL0BFLVflEu3c4iczARAWFQ0nlXfZ/EFxdaBynlh5fE38in8g0tNHseQMoKRIbnuEVoT
	sRRJRQfgwOPdLf17BgZpZbrfGC8Aa3GJzD0eBwhjlB9YgxuYK5AJ8gDyNjvUQJ2NifllMxrA8Xznv
	Dvj37VFBSVD62BxuGguhQsuO3MI/CRE6Qx6CEhNyGgWHHSmlKkn7ToNOQk5LvQEKCjsMDzegMc/lM
	q15qh8Yw0yZL0+vsNcsgt4qzDMnOtGIjCqEgzy/gXb4cLdbGG/2BtANWyVY7SweYoiPMrHErKry+4
	jAgSXX9j0dw09dgjdxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owINn-00C2I0-25; Sat, 19 Nov 2022 07:35:23 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owINj-00C2GY-Vo
	for linux-mtd@lists.infradead.org; Sat, 19 Nov 2022 07:35:22 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NDlgx1JxyzqSTv;
	Sat, 19 Nov 2022 15:31:09 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 19 Nov
 2022 15:34:59 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: fix memory leak in pxa2xx_flash_probe()
Date: Sat, 19 Nov 2022 07:33:07 +0000
Message-ID: <20221119073307.22929-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_233520_267940_E70C2E8F 
X-CRM114-Status: UNSURE (   9.53  )
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

If '!info->map.virt' or '!info->mtd' success, 'info' should be
freed before return. Otherwise there is a memory leak.

Fixes: e644f7d62894 ("[MTD] MAPS: Merge Lubbock and Mainstone drivers into common PXA2xx driver")
Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/mtd/maps/pxa2xx-flash.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 1749dbbacc13..62a5bf41a6d7 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -64,6 +64,7 @@ static int pxa2xx_flash_probe(struct platform_device *pdev)
 	if (!info->map.virt) {
 		printk(KERN_WARNING "Failed to ioremap %s\n",
 		       info->map.name);
+		kfree(info);
 		return -ENOMEM;
 	}
 	info->map.cached = ioremap_cache(info->map.phys, info->map.size);
@@ -85,6 +86,7 @@ static int pxa2xx_flash_probe(struct platform_device *pdev)
 		iounmap((void *)info->map.virt);
 		if (info->map.cached)
 			iounmap(info->map.cached);
+		kfree(info);
 		return -EIO;
 	}
 	info->mtd->dev.parent = &pdev->dev;
--
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
