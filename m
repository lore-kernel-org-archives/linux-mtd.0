Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B354EE49A6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 03:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+36HSsW+x+9XTOkn0v3Ps5CmVyTeLpNTXU+/Pal285Y=; b=fbTDmgqz8R0AHM
	q6pa+TwNDr82uTlNv3Ej4Hy0vQKPBq1TUNUjS6loPwY6YVwjqgyUugD+WyhyofUgYWDSqkwPAROvu
	JVbLh4ekEnti4TZaRbuZcxFz2e82Fvr26lvqvM0iXTTzvuvdtroJQTqePlD+6lgl8ZlG76V8IIJ1S
	ftY5S942nwTI/XgOUhyGDKypgG8YXWfhhC6B8dstvYELsqJXDVJtBkuvPpHSvRL2EQFWttbyRrRZo
	Zu15L/sq3z+KUOV2bjhyIr8lRvi0LKgV2pTSyyVo6k3SriN6gn9vJXQXNCpFPWGOoOwJsaqzZv1s0
	VRjAWdXHumJLHDVZyI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvRA-00CwpR-0I;
	Mon, 21 Aug 2023 03:18:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvQf-00CwVD-09;
	Mon, 21 Aug 2023 03:18:12 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTcyw6BrvzNn3M;
	Mon, 21 Aug 2023 11:14:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:18:05 +0800
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
Subject: [PATCH -next v3 11/12] mtd: spi-nor: nxp-spifi: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 11:17:36 +0800
Message-ID: <20230821031737.1973183-12-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230820_201809_473769_6B2664B9 
X-CRM114-Status: GOOD (  10.48  )
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
the label "dis_clks" and "dis_clk_reg".

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Modify the syntax error in the commit message.
v2: https://lore.kernel.org/all/20230818074642.308166-12-lizetao1@huawei.com/
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-12-lizetao1@huawei.com/

 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 33 ++++-----------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 337e83bf3362..5d8f47ab146f 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -394,30 +394,18 @@ static int nxp_spifi_probe(struct platform_device *pdev)
 	if (IS_ERR(spifi->flash_base))
 		return PTR_ERR(spifi->flash_base);
 
-	spifi->clk_spifi = devm_clk_get(&pdev->dev, "spifi");
+	spifi->clk_spifi = devm_clk_get_enabled(&pdev->dev, "spifi");
 	if (IS_ERR(spifi->clk_spifi)) {
-		dev_err(&pdev->dev, "spifi clock not found\n");
+		dev_err(&pdev->dev, "spifi clock not found or unable to enable\n");
 		return PTR_ERR(spifi->clk_spifi);
 	}
 
-	spifi->clk_reg = devm_clk_get(&pdev->dev, "reg");
+	spifi->clk_reg = devm_clk_get_enabled(&pdev->dev, "reg");
 	if (IS_ERR(spifi->clk_reg)) {
-		dev_err(&pdev->dev, "reg clock not found\n");
+		dev_err(&pdev->dev, "reg clock not found or unable to enable\n");
 		return PTR_ERR(spifi->clk_reg);
 	}
 
-	ret = clk_prepare_enable(spifi->clk_reg);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to enable reg clock\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(spifi->clk_spifi);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to enable spifi clock\n");
-		goto dis_clk_reg;
-	}
-
 	spifi->dev = &pdev->dev;
 	platform_set_drvdata(pdev, spifi);
 
@@ -430,24 +418,17 @@ static int nxp_spifi_probe(struct platform_device *pdev)
 	flash_np = of_get_next_available_child(pdev->dev.of_node, NULL);
 	if (!flash_np) {
 		dev_err(&pdev->dev, "no SPI flash device to configure\n");
-		ret = -ENODEV;
-		goto dis_clks;
+		return -ENODEV;
 	}
 
 	ret = nxp_spifi_setup_flash(spifi, flash_np);
 	of_node_put(flash_np);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to setup flash chip\n");
-		goto dis_clks;
+		return ret;
 	}
 
 	return 0;
-
-dis_clks:
-	clk_disable_unprepare(spifi->clk_spifi);
-dis_clk_reg:
-	clk_disable_unprepare(spifi->clk_reg);
-	return ret;
 }
 
 static int nxp_spifi_remove(struct platform_device *pdev)
@@ -455,8 +436,6 @@ static int nxp_spifi_remove(struct platform_device *pdev)
 	struct nxp_spifi *spifi = platform_get_drvdata(pdev);
 
 	mtd_device_unregister(&spifi->nor.mtd);
-	clk_disable_unprepare(spifi->clk_spifi);
-	clk_disable_unprepare(spifi->clk_reg);
 
 	return 0;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
