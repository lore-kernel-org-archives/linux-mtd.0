Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA88C2FC14
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 02:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxPqcU8nHR3PsC+dYF/+HceLH9Ko8TqtkZa0PD/naU8=; b=ez8mqIxICU0VKa
	8/6UDvnQl1dkM2KtD8aaVP7CXC26u1RZbJDMqNUgGbaVYtEKpKC3GgjFxRx9JAxGLrBwcfcOLqIqz
	QQ68H2r5WuaPR9h+H1AuaDFJiG6GlZYdV6lxIxf0qJdQ8Xpa3G9MQ7QX1Tz7GmbBtYHAx+sPfHwKa
	dXUGvrVgp6rYQDHJSy4yTKNHyc+GHKQo31GCQvMxHMFHlwwFBJWaMU/aFlv4Ykt8MDpU2U3ECyh2+
	/e6qqmFxYouzghlJvXr+k9G1jnQUt+kt3ubrwAdyaUVwLpLdsJbmpnInQuiOuUpAbLyJvLEOXB48J
	OqhBrwTbOECliHgO7iOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWT1s-005Nf3-37;
	Thu, 17 Aug 2023 02:46:32 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWT13-005N1D-17;
	Thu, 17 Aug 2023 02:45:43 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RR8RL6pvVzNn0V;
	Thu, 17 Aug 2023 10:42:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:37 +0800
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
Subject: [PATCH -next 11/11] mtd: spi-nor: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:45:09 +0800
Message-ID: <20230817024509.3951629-12-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817024509.3951629-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_194541_820368_B452318F 
X-CRM114-Status: GOOD (  10.92  )
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
handling path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
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
