Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95635EE49A4
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 03:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzYAS29k8WSe8mDSBOrwDV1CnfiKihTLc5WrALhEeos=; b=oj0A+L9xCmUKWy
	QCLEllEPHKs14E5lBuMorbwsu5K8G7bHnGhmf7X3HX12k2bytIBCwopcJTKmUFswEqEMQG25uT1kA
	tUgE/NpOnWBhPZdpVBQQEAFx4ufqc1y/8zqsKMHxVZS+mrLtExfygt0Q+8RAthVcn+Svlrw2Mh4t0
	Li9SL+Q0PUAvZySE6C2MZAV4LENIgvazWEooK2p4eC7gWHWSs3JFT9sY3SFOBOAAma6UzXF8IyQJq
	6B/7VJvps7/G76lBF1UdNGUoWwDvnsadQQaSiaPDNKX7ow3+Twp3ijOPZJmaAjg72DaZnr19Pkk+1
	ycatwxJ9qBEaQCwlr78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvR1-00Cwg8-0c;
	Mon, 21 Aug 2023 03:18:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvQc-00CwTC-0j;
	Mon, 21 Aug 2023 03:18:10 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTcyk6d6XzNmyS;
	Mon, 21 Aug 2023 11:14:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:17:55 +0800
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
Subject: [PATCH -next v3 02/12] mtd: rawnand: arasan: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 11:17:27 +0800
Message-ID: <20230821031737.1973183-3-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230820_201806_662692_9F5441F2 
X-CRM114-Status: UNSURE (   9.90  )
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly, so drop
the label "disable_bus_clk" and "disable_controller_clk".

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Modify the syntax error in the commit message.
v2: https://lore.kernel.org/all/20230818074642.308166-3-lizetao1@huawei.com/
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-3-lizetao1@huawei.com/

 drivers/mtd/nand/raw/arasan-nand-controller.c | 29 ++++---------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 906eef70cb6d..4621ec549cc7 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1440,45 +1440,29 @@ static int anfc_probe(struct platform_device *pdev)
 
 	anfc_reset(nfc);
 
-	nfc->controller_clk = devm_clk_get(&pdev->dev, "controller");
+	nfc->controller_clk = devm_clk_get_enabled(&pdev->dev, "controller");
 	if (IS_ERR(nfc->controller_clk))
 		return PTR_ERR(nfc->controller_clk);
 
-	nfc->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	nfc->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 	if (IS_ERR(nfc->bus_clk))
 		return PTR_ERR(nfc->bus_clk);
 
-	ret = clk_prepare_enable(nfc->controller_clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(nfc->bus_clk);
-	if (ret)
-		goto disable_controller_clk;
-
 	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
 	if (ret)
-		goto disable_bus_clk;
+		return ret;
 
 	ret = anfc_parse_cs(nfc);
 	if (ret)
-		goto disable_bus_clk;
+		return ret;
 
 	ret = anfc_chips_init(nfc);
 	if (ret)
-		goto disable_bus_clk;
+		return ret;
 
 	platform_set_drvdata(pdev, nfc);
 
 	return 0;
-
-disable_bus_clk:
-	clk_disable_unprepare(nfc->bus_clk);
-
-disable_controller_clk:
-	clk_disable_unprepare(nfc->controller_clk);
-
-	return ret;
 }
 
 static void anfc_remove(struct platform_device *pdev)
@@ -1486,9 +1470,6 @@ static void anfc_remove(struct platform_device *pdev)
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
 	anfc_chips_cleanup(nfc);
-
-	clk_disable_unprepare(nfc->bus_clk);
-	clk_disable_unprepare(nfc->controller_clk);
 }
 
 static const struct of_device_id anfc_ids[] = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
