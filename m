Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A29EE49A4
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 03:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bm8cnsTO+06pcYOe+PNdrxqUcSB/dMxNVHJ+nuONHnM=; b=3/ZHCiiVHMdgFF
	JXmYkGxoPawUX+8HiezyGx47T1kngXd5LGXPiLVUGhENHC/aCLgnxiLZGYEePrGS/M+ob8yUgxIjr
	ZLDs9N2jH1IcF0kv1oZRX9aTfA9iE1yD1tS6/llLhttj3wSC37KRxWMgCqfJSAKi7vkygw3ppF7JD
	g6orbvHxKTpVA0FV0RRwrFP4vDFjj39ZdkOHLTBgJtcWyw2BpEgthp+kHpVjTYbZV4xE+weZoI4/o
	tR07JYslEsuiTubVTbBKZ6U/POoFW29a6CQJrGxu4LvWa8P/vhdnM/uI+g1zQCR/Ad7xrZ6loV1/V
	UKJwUHYf8jY0BVGFZBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvRO-00Cx8W-2d;
	Mon, 21 Aug 2023 03:18:54 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvQi-00CwVG-1D;
	Mon, 21 Aug 2023 03:18:15 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RTd1K71Hsz1L9Jy;
	Mon, 21 Aug 2023 11:16:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:18:03 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>
CC: <alexandre.torgue@foss.st.com>, <angelogioacchino.delregno@collabora.com>,
	<christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
	<dmitry.torokhov@gmail.com>, <frank.li@vivo.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jinpu.wang@ionos.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-sunxi@lists.linux.dev>, <lizetao1@huawei.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
	<paul@crapouillou.net>, <philmd@linaro.org>, <pratyush@kernel.org>,
	<richard@nod.at>, <robh@kernel.org>, <rogerq@kernel.org>,
	<samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
	<u.kleine-koenig@pengutronix.de>, <vigneshr@ti.com>, <vz@mleia.com>,
	<wens@csie.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next v3 09/12] mtd: rawnand: sunxi: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 11:17:34 +0800
Message-ID: <20230821031737.1973183-10-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-1-lizetao1@huawei.com>
References: <20230818101004.4f2cd343@xps-13>
 <20230821031737.1973183-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_201812_891088_4BD7FFAC 
X-CRM114-Status: GOOD (  11.20  )
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
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly, so drop
the label "out_mod_clk_unprepare" and "out_ahb_clk_unprepare".

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Modify the syntax error in the commit message.
v2: https://lore.kernel.org/all/20230818074642.308166-10-lizetao1@huawei.com/
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-10-lizetao1@huawei.com/

 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 64c09eae951d..9abf38049d35 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2094,37 +2094,26 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	nfc->ahb_clk = devm_clk_get(dev, "ahb");
+	nfc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
 	if (IS_ERR(nfc->ahb_clk)) {
 		dev_err(dev, "failed to retrieve ahb clk\n");
 		return PTR_ERR(nfc->ahb_clk);
 	}
 
-	ret = clk_prepare_enable(nfc->ahb_clk);
-	if (ret)
-		return ret;
-
-	nfc->mod_clk = devm_clk_get(dev, "mod");
+	nfc->mod_clk = devm_clk_get_enabled(dev, "mod");
 	if (IS_ERR(nfc->mod_clk)) {
 		dev_err(dev, "failed to retrieve mod clk\n");
-		ret = PTR_ERR(nfc->mod_clk);
-		goto out_ahb_clk_unprepare;
+		return PTR_ERR(nfc->mod_clk);
 	}
 
-	ret = clk_prepare_enable(nfc->mod_clk);
-	if (ret)
-		goto out_ahb_clk_unprepare;
-
 	nfc->reset = devm_reset_control_get_optional_exclusive(dev, "ahb");
-	if (IS_ERR(nfc->reset)) {
-		ret = PTR_ERR(nfc->reset);
-		goto out_mod_clk_unprepare;
-	}
+	if (IS_ERR(nfc->reset))
+		return PTR_ERR(nfc->reset);
 
 	ret = reset_control_deassert(nfc->reset);
 	if (ret) {
 		dev_err(dev, "reset err %d\n", ret);
-		goto out_mod_clk_unprepare;
+		return ret;
 	}
 
 	nfc->caps = of_device_get_match_data(&pdev->dev);
@@ -2163,10 +2152,6 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		dma_release_channel(nfc->dmac);
 out_ahb_reset_reassert:
 	reset_control_assert(nfc->reset);
-out_mod_clk_unprepare:
-	clk_disable_unprepare(nfc->mod_clk);
-out_ahb_clk_unprepare:
-	clk_disable_unprepare(nfc->ahb_clk);
 
 	return ret;
 }
@@ -2181,8 +2166,6 @@ static void sunxi_nfc_remove(struct platform_device *pdev)
 
 	if (nfc->dmac)
 		dma_release_channel(nfc->dmac);
-	clk_disable_unprepare(nfc->mod_clk);
-	clk_disable_unprepare(nfc->ahb_clk);
 }
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
