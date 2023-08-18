Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9EDC7112B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9U2hl0MVExfBdx/e06ZhmtYCpzKLeCOQEe862f/Nmhs=; b=TX+SqwbIbNIOn9
	Hucm0oVKad+OCDGjBiqCF0EJMHnwVWesuhBMMeUevDmSD+upVSpPW/UhO1p0Wbj7MoAytn/qf+VFE
	Z3WqCzXFiHqKvfaBTKFEp8daF3uBYcYj7rDARV8mb4F+gVkhGYLIYPBZMneaaIUIYDdwgQJMPUa1W
	Xu4Kyh9d9yzD/cSkezvYM0HV/wVzVC61bGR3lOBvQ8sdJBMu4tSqqDryh8WHanaOc52GZFKz1BBFd
	X1iJ3QShFGl0ev9vatIkZ87v2uR07IB8siKSP4GxzieDWOqvau7Dzp/1kxVJPeTW7cYBtVRZewmtz
	FhVdCI7v4fX7F1/qJ2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWvLw-00830T-1Q;
	Fri, 18 Aug 2023 09:01:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCp-007uLH-0f;
	Fri, 18 Aug 2023 07:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tcpa760vBUmGN9+NovwWLWgNYMhac0jXVZATCBCRa+M=; b=Mo7Y5mkl5evgZ2EvYqXDQ6r7DP
	wWr46bc4xTVG+MLCrAo3Y5mJ8CiDKJACeNEH2WJa6YcA0Agy3OLT7ly/GpFEOPD3vrVidj2GdyqSp
	8vZqC9fabmmzlmGFG+WXvba0Y9kNKJAvrbZ7pNrdFsBzl8ERaS4jaQibyTyOjXDBwmgQ8ousVAlLM
	vX0ZCrFjrgCP09GZxcnWXhifNNYuEpNjY399bRGTu7VoyDU0xWzlrMlAcThnp52KrVY408vmxdpAb
	IHHV0+p7p/Y3Y5WtHIgDGtqAJA2BAW9+XCF1/bgScX/ANOOoZRhbL3Y+Go/w1Vk6g2HkwaIOQPtW7
	3ayP/JJg==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCi-00FL7h-2D;
	Fri, 18 Aug 2023 07:47:38 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv4n19r9ztS5X;
	Fri, 18 Aug 2023 15:43:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:14 +0800
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
Subject: [PATCH -next v2 09/12] mtd: rawnand: sunxi: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:39 +0800
Message-ID: <20230818074642.308166-10-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230818_084733_697032_AA185160 
X-CRM114-Status: GOOD (  11.28  )
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
the label "out_mod_clk_unprepare" and "out_ahb_clk_unprepare".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
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
