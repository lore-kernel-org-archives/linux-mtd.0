Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C682AC32771
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Sep 2022 13:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YUzCySPsnct8H4n+iAniYNJhsBYDvsNsTqpF90zS+5g=; b=f7TwALPRtfdt6f
	3K3dKBZq8HJLlXdCxJIukY06aSmIrTnTd3DN7twMcKsfLyCe4pJRHQq0IoB3x+mOo43gT1TH+Ihl8
	i13a80R2p4sepY5b7IfGmbD6DjSXIzn3i8ruUdIEg96uKeIgegOr4TjIYaqCowbcIaIcXDNlUg//s
	Qy3s53lV3/0Z1YUsO/XSfexBZiezXh5oI2kRiLaHC2XpkFNvdd8Y1XfDmX/hRSRZ3ZuKzVNbZEkT+
	VoOyKbMnmWaoKeiKbtk8rqD441IPXUgqAjvznfhROqaR6XlDp337IHynpF2nvCDM+ZXXTfGHA37Ia
	W+lKFMH6g0Qm72+t2iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc4oy-007Cwn-Sy; Sat, 24 Sep 2022 13:03:52 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc4ou-007Cu3-61
	for linux-mtd@lists.infradead.org; Sat, 24 Sep 2022 13:03:50 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MZTch6MwvzWgvl;
	Sat, 24 Sep 2022 20:59:32 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 21:03:33 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 21:03:32 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <martin.blumenstingl@googlemail.com>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next] mtd: rawnand: intel: Add missing of_node_put() in ebu_nand_probe()
Date: Sat, 24 Sep 2022 21:10:10 +0800
Message-ID: <20220924131010.957117-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_060348_417260_3EDCFFE7 
X-CRM114-Status: UNSURE (   8.98  )
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

The 'chip_np' returned by of_get_next_child() with refcount decremented,
of_node_put() need be called in error path to decrease the refcount.

Fixes: bfc618fcc3f1 ("mtd: rawnand: intel: Read the chip-select line from the correct OF node")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 23 +++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index d4a0987e93ac..6f4cea81f97c 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -608,11 +608,12 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ret = of_property_read_u32(chip_np, "reg", &cs);
 	if (ret) {
 		dev_err(dev, "failed to get chip select: %d\n", ret);
-		return ret;
+		goto err_of_node_put;
 	}
 	if (cs >= MAX_CS) {
 		dev_err(dev, "got invalid chip select: %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_of_node_put;
 	}
 
 	ebu_host->cs_num = cs;
@@ -620,18 +621,22 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", cs);
 	ebu_host->cs[cs].chipaddr = devm_platform_ioremap_resource_byname(pdev,
 									  resname);
-	if (IS_ERR(ebu_host->cs[cs].chipaddr))
-		return PTR_ERR(ebu_host->cs[cs].chipaddr);
+	if (IS_ERR(ebu_host->cs[cs].chipaddr)) {
+		ret = PTR_ERR(ebu_host->cs[cs].chipaddr);
+		goto err_of_node_put;
+	}
 
 	ebu_host->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(ebu_host->clk))
-		return dev_err_probe(dev, PTR_ERR(ebu_host->clk),
-				     "failed to get clock\n");
+	if (IS_ERR(ebu_host->clk)) {
+		ret = dev_err_probe(dev, PTR_ERR(ebu_host->clk),
+				    "failed to get clock\n");
+		goto err_of_node_put;
+	}
 
 	ret = clk_prepare_enable(ebu_host->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clock: %d\n", ret);
-		return ret;
+		goto err_of_node_put;
 	}
 
 	ebu_host->dma_tx = dma_request_chan(dev, "tx");
@@ -695,6 +700,8 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ebu_dma_cleanup(ebu_host);
 err_disable_unprepare_clk:
 	clk_disable_unprepare(ebu_host->clk);
+err_of_node_put:
+	of_node_put(chip_np);
 
 	return ret;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
