Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FF8C05052
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTb+k0g6+HOgiT4+0UeM7RKOMXAgGfbUz2Qq+URip1k=; b=Fk9O9wBWrpxzUV
	Bh+U2ZAtAPmtgCbusMaso5/VfTRlvVIZ0H9zhv6o1ip4MDHmjJNI4wFmYkop36AM2TG2/GQkV1wI7
	dIO74G5C37LuDveTIiMOWbeQoeKDw6geMr//aPqrgazZpWWnglxr9RDzpMnsJjAi60TNHvv2Q0q6n
	4FnbraWH2OnADS+zSKOapMSdEjp2iTjcQrK1UvNC3yHznI0ZKfqmLCxEXE6WAFSX0TPiWnWss+Es0
	mY7H9CrpPcNjz/ySMGZoZAjDSq6VTRjKMNgv/XRa3jEqMGBDPB5WW7fNIKkiOVSFXi2xg+tlfnm/r
	/BIrpm4aWa53JbGxLwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuDT-007upR-0B;
	Fri, 18 Aug 2023 07:48:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCm-007uJt-31;
	Fri, 18 Aug 2023 07:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=965axM03+neYG5IO+P1otR1bLN+zFl3bIP1fBe43W8s=; b=nTrNG2pNZdHjAjgFFdhSltE/XB
	fVgwg1STpsKEJhxg71Okd1ZPxnhftdwOXZdT/adATVkApkV6i1igGxdoWLAge6yiKhmZAkMeOs+Xp
	BrBmyMz3H3wRtCXmvdlvm5DqwGBLdZRfciVsnzhMEsE93EFlG10y0nYzkPrT9KMj0pvqH5tjIA35j
	wzJ7xnAIBgmgdjnhv1LHui7ChNv5+DVJBL+AX7qGKPI3bUT7tYLOjI3bYualDwFHCmS6SiagcI07w
	0NU+k9yd8+1tc5KesCvilCNiKi/tFWWAf0aSi4nLF/y2NCL7DZwwwSP78nHz1MJGrtBA4OejX1mzy
	ioomxweg==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCh-00FL7g-2B;
	Fri, 18 Aug 2023 07:47:35 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv4l0ZKRztS0n;
	Fri, 18 Aug 2023 15:43:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:12 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
CC: <alexandre.torgue@foss.st.com>, <angelogioacchino.delregno@collabora.com>,
	<christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
	<dmitry.torokhov@gmail.com>, <frank.li@vivo.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jinpu.wang@ionos.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-sunxi@lists.linux.dev>, <martin.blumenstingl@googlemail.com>,
	<matthias.bgg@gmail.com>, <mcoquelin.stm32@gmail.com>, <michael@walle.cc>,
	<michal.simek@amd.com>, <miquel.raynal@bootlin.com>,
	<nicolas.ferre@microchip.com>, <paul@crapouillou.net>, <philmd@linaro.org>,
	<pratyush@kernel.org>, <richard@nod.at>, <robh@kernel.org>,
	<rogerq@kernel.org>, <samuel@sholland.org>, <stefan@agner.ch>,
	<tudor.ambarus@linaro.org>, <u.kleine-koenig@pengutronix.de>,
	<vigneshr@ti.com>, <vz@mleia.com>, <wens@csie.org>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next v2 07/12] mtd: rawnand: mtk: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:37 +0800
Message-ID: <20230818074642.308166-8-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818074642.308166-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_084732_749417_486F73EE 
X-CRM114-Status: GOOD (  14.72  )
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enable (and possibly
prepare) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clock explicitly, so drop
the label "clk_disable". And both mtk_nfc_enable_clk() and
mtk_nfc_disable_clk() now have a single user, which is the resume or
suspend callback, so drop this two helper function and just move related
operations in the resume or suspend function.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message and drop two helper functions
mtk_nfc_enable_clk() and mtk_nfc_disable_clk().
v1: https://lore.kernel.org/all/20230817024509.3951629-8-lizetao1@huawei.com/

 drivers/mtd/nand/raw/mtk_nand.c | 62 ++++++++++-----------------------
 1 file changed, 19 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index b6eb8cb6b5e9..29c8bddde67f 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1118,32 +1118,6 @@ static irqreturn_t mtk_nfc_irq(int irq, void *id)
 	return IRQ_HANDLED;
 }
 
-static int mtk_nfc_enable_clk(struct device *dev, struct mtk_nfc_clk *clk)
-{
-	int ret;
-
-	ret = clk_prepare_enable(clk->nfi_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable nfi clk\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(clk->pad_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable pad clk\n");
-		clk_disable_unprepare(clk->nfi_clk);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void mtk_nfc_disable_clk(struct mtk_nfc_clk *clk)
-{
-	clk_disable_unprepare(clk->nfi_clk);
-	clk_disable_unprepare(clk->pad_clk);
-}
-
 static int mtk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oob_region)
 {
@@ -1545,40 +1519,36 @@ static int mtk_nfc_probe(struct platform_device *pdev)
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
@@ -1586,14 +1556,11 @@ static int mtk_nfc_probe(struct platform_device *pdev)
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
 
@@ -1618,7 +1585,6 @@ static void mtk_nfc_remove(struct platform_device *pdev)
 	}
 
 	mtk_ecc_release(nfc->ecc);
-	mtk_nfc_disable_clk(&nfc->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1626,7 +1592,8 @@ static int mtk_nfc_suspend(struct device *dev)
 {
 	struct mtk_nfc *nfc = dev_get_drvdata(dev);
 
-	mtk_nfc_disable_clk(&nfc->clk);
+	clk_disable_unprepare(nfc->clk.nfi_clk);
+	clk_disable_unprepare(nfc->clk.pad_clk);
 
 	return 0;
 }
@@ -1641,9 +1608,18 @@ static int mtk_nfc_resume(struct device *dev)
 
 	udelay(200);
 
-	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
-	if (ret)
+	ret = clk_prepare_enable(nfc->clk.nfi_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable nfi clk\n");
 		return ret;
+	}
+
+	ret = clk_prepare_enable(nfc->clk.pad_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable pad clk\n");
+		clk_disable_unprepare(nfc->clk.nfi_clk);
+		return ret;
+	}
 
 	/* reset NAND chip if VCC was powered off */
 	list_for_each_entry(chip, &nfc->chips, node) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
