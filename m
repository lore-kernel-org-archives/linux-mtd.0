Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96E9C7112B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 07:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFNtqaH8XhPyt803RzX21Rcu6I0wTWgE0jPYIMyrVvY=; b=Ef5B2smzGg+NNj
	UNCVdA5qBsnqhZqpb7djTNZmwtlON3xtN/wysGgDsW+Z1oCbC4+fYC4c4nma/VAUCwkBMmYP+OMr9
	gTSCikhx168TJ5UvGDAn+frP29IwEoeYkPFzlCuQ/09/OfhtzB9yd9GW3bFEUsQwhYgRv7mStKObB
	nyE4cIFM68C2NckEM0jLWDV++kXc2kw+9j/uyyDoG1J3raeaeImAL+cRQ9pDkQcrGLc/gSyAJj+Xn
	utRqO6a7KbVyNyexvGn5PU763+DcobLLxAf31Dz34NCigFuJ0OQT4ojR3S8dNHX68VNXCTTXO7ccY
	Mqe9nHIk950cuf1eFUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCy-007uS2-0X;
	Fri, 18 Aug 2023 07:47:48 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCS-007uCm-1u;
	Fri, 18 Aug 2023 07:47:21 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRv4q2V6VzNn0P;
	Fri, 18 Aug 2023 15:43:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:10 +0800
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
Subject: [PATCH -next v2 05/12] mtd: rawnand: lpc32xx_slc: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:35 +0800
Message-ID: <20230818074642.308166-6-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230818_004717_183562_CDB4085D 
X-CRM114-Status: GOOD (  11.29  )
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
the label "unprepare_clk".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-6-lizetao1@huawei.com/

 drivers/mtd/nand/raw/lpc32xx_slc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 2201264d3c37..1c5fa855b9f2 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -871,15 +871,12 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd->dev.parent = &pdev->dev;
 
 	/* Get NAND clock */
-	host->clk = devm_clk_get(&pdev->dev, NULL);
+	host->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		dev_err(&pdev->dev, "Clock failure\n");
 		res = -ENOENT;
 		goto enable_wp;
 	}
-	res = clk_prepare_enable(host->clk);
-	if (res)
-		goto enable_wp;
 
 	/* Set NAND IO addresses and command/ready functions */
 	chip->legacy.IO_ADDR_R = SLC_DATA(host->io_base);
@@ -907,13 +904,13 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 				      GFP_KERNEL);
 	if (host->data_buf == NULL) {
 		res = -ENOMEM;
-		goto unprepare_clk;
+		goto enable_wp;
 	}
 
 	res = lpc32xx_nand_dma_setup(host);
 	if (res) {
 		res = -EIO;
-		goto unprepare_clk;
+		goto enable_wp;
 	}
 
 	/* Find NAND device */
@@ -934,8 +931,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	nand_cleanup(chip);
 release_dma:
 	dma_release_channel(host->dma_chan);
-unprepare_clk:
-	clk_disable_unprepare(host->clk);
 enable_wp:
 	lpc32xx_wp_enable(host);
 
@@ -962,7 +957,6 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	tmp &= ~SLCCFG_CE_LOW;
 	writel(tmp, SLC_CTRL(host->io_base));
 
-	clk_disable_unprepare(host->clk);
 	lpc32xx_wp_enable(host);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
