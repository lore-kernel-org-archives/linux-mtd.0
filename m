Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D05C05052
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 02:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmJ/op6gZ/kJi6eqAk+TwtSdkDAZWci6kQ5PT6qfS9I=; b=HpEUEGhIe6E1fz
	u523QulS+DtZq88FwGtgiEtUvp702eJN9+T+JY+LKYeD1wCrJWcwtJzzLxTXcVAqu15NkumzyiCeE
	glP44MZPGOxm8k9AMbwYMZ+P8PEmf2A3HaAlhZn7xcUomkfJpFwHlBmf+W0eQeUCB8kHvZGf0ak3Q
	975+Yhc4NBVxFtrj+T731QOBkEj4E473Ixkvr3Zl79X+Z/PXtNqrzQ1NGDHd7KPQfO2O+34C2DLsY
	dMm9MvRrYxSrcqcxyvV9+hdonYF7pojbysUzkwpVMrHKwm8YqgiEFgkrjigf1kUCj7mf5qW3ohON1
	wg2wewCFLUkAQs9OMKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWT1p-005Nc1-2G;
	Thu, 17 Aug 2023 02:46:29 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWT12-005Mz6-1o;
	Thu, 17 Aug 2023 02:45:42 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RR8Tm1WZ0zrSXH;
	Thu, 17 Aug 2023 10:44:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:33 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<michal.simek@amd.com>, <vz@mleia.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <michael@walle.cc>, <frank.li@vivo.com>
CC: <robh@kernel.org>, <martin.blumenstingl@googlemail.com>,
	<philmd@linaro.org>, <geert+renesas@glider.be>,
	<u.kleine-koenig@pengutronix.de>, <rogerq@kernel.org>,
	<paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
	<yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
	<christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
	<jinpu.wang@ionos.com>, <lizetao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: [PATCH -next 07/11] mtd: rawnand: mtk: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:45:05 +0800
Message-ID: <20230817024509.3951629-8-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817024509.3951629-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_194541_014890_2F4A3D8E 
X-CRM114-Status: GOOD (  11.94  )
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

After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
prepared and enabled clocks"), it can replace the pair of functions,
devm_clk_get() and clk_prepare_enable() with a single helper function
devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
(or enabled) during the whole lifetime of the driver, it is unnecessary to
unprepare and disable clock explicitly when remove driver or in the error
handling path. The mtk_nfc_enable_clk() is a helper function that enables
the "clk->nfi_clk" and "clk->pad_clk", it can be combined into
devm_clk_get_enabled().

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index b6eb8cb6b5e9..0d185e650aaf 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1545,40 +1545,36 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 		goto release_ecc;
 	}
 
-	nfc->clk.nfi_clk = devm_clk_get(dev, "nfi_clk");
+	nfc->clk.nfi_clk = devm_clk_get_enabled(dev, "nfi_clk");
 	if (IS_ERR(nfc->clk.nfi_clk)) {
 		dev_err(dev, "no clk\n");
 		ret = PTR_ERR(nfc->clk.nfi_clk);
 		goto release_ecc;
 	}
 
-	nfc->clk.pad_clk = devm_clk_get(dev, "pad_clk");
+	nfc->clk.pad_clk = devm_clk_get_enabled(dev, "pad_clk");
 	if (IS_ERR(nfc->clk.pad_clk)) {
 		dev_err(dev, "no pad clk\n");
 		ret = PTR_ERR(nfc->clk.pad_clk);
 		goto release_ecc;
 	}
 
-	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
-	if (ret)
-		goto release_ecc;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -EINVAL;
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	ret = devm_request_irq(dev, irq, mtk_nfc_irq, 0x0, "mtk-nand", nfc);
 	if (ret) {
 		dev_err(dev, "failed to request nfi irq\n");
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "failed to set dma mask\n");
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	platform_set_drvdata(pdev, nfc);
@@ -1586,14 +1582,11 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	ret = mtk_nfc_nand_chips_init(dev, nfc);
 	if (ret) {
 		dev_err(dev, "failed to init nand chips\n");
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	return 0;
 
-clk_disable:
-	mtk_nfc_disable_clk(&nfc->clk);
-
 release_ecc:
 	mtk_ecc_release(nfc->ecc);
 
@@ -1618,7 +1611,6 @@ static void mtk_nfc_remove(struct platform_device *pdev)
 	}
 
 	mtk_ecc_release(nfc->ecc);
-	mtk_nfc_disable_clk(&nfc->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
