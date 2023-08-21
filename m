Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801CBEE4996
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oyimVT6oQUe3NfoVZpdbbBJqkkguEI4vSoUBKehyqho=; b=zk0EJy7ql6rwGF
	0lQY3D3eEE0Q+VRyAcr1KnYzlfWUyGOZXBvJ2BAvT373Cb0Evpyd2a6hJriC8AhdV9L+3XD6w3Qe0
	fHxY+1VgwcEhZRVNNYPicN40UWDfDMesdJWBK+7+vlGoqmx8RlVrI1RS5yTM6jYnhjYDeVPYbRjOr
	/+UaizorSXrrnBa4yBiQDH/ycZf3I2pVuV/IyAqhuZgXIrwNhXeednt9GIKSIcbhOvP+NbWJfTTWK
	waAPvA9O856X+nvUiAyVZMw3xImlCBt0jzqeMniZFNy8iXeumc00+gzRKXejqVnF56LfpCBGK6gjo
	PylgVj3APdZHGAwjtf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY0TZ-00DVex-28;
	Mon, 21 Aug 2023 08:41:29 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY0TW-00DVeF-1l
	for linux-mtd@lists.infradead.org;
	Mon, 21 Aug 2023 08:41:28 +0000
Received: from kwepemm600014.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTm7j08byzNnJP;
	Mon, 21 Aug 2023 16:37:36 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.175.28) by
 kwepemm600014.china.huawei.com (7.193.23.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 16:41:10 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <stefan@agner.ch>, <dev@lynxeye.de>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<linux-mtd@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: tegra: add missing check for platform_get_irq()
Date: Mon, 21 Aug 2023 16:40:46 +0800
Message-ID: <20230821084046.217025-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.28]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_014126_847952_791D05B6 
X-CRM114-Status: UNSURE (   9.08  )
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

Add the missing check for platform_get_irq() and return error code
if it fails.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index eb0b9d16e8da..a553e3ac8ff4 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1197,6 +1197,10 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	init_completion(&ctrl->dma_complete);
 
 	ctrl->irq = platform_get_irq(pdev, 0);
+	if (ctrl->irq < 0) {
+		err = ctrl->irq;
+		goto err_put_pm;
+	}
 	err = devm_request_irq(&pdev->dev, ctrl->irq, tegra_nand_irq, 0,
 			       dev_name(&pdev->dev), ctrl);
 	if (err) {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
