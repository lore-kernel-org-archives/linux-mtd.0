Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA4CC001DE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPrvs1SmApltdU7iz6I8JN5dELFqL+qmtDhyyEzszNA=; b=zQhYbLdd9nKuql
	F0rgkqoNMnnnu99AoG8BfxkDplCINYP8qZshsb8xVtAUdqAzuW1FNqu4aSsQglEBaCIw9k5zXONNE
	LV+YknPrA1p1+ENgTzmGZEzpvnk+GMJXYEm3pbmjINawLJvgahuczMDDvv8cH23oYGTzvEyp4IVSr
	A9cCE/yzAgV+VXnGwTXA4TDX23TYFu1unrhCUVQwMdVez3Z7fQNnF5NysH+T0vvGt0/m0XP+kAHSf
	TPM3lr7OqbwU7noGpB6qZLSJM7uNFqn6JRbOnGgi1feadFOLWvHGkqwfmvBuoaBC/OdlFFx19NJXh
	fDakev7T/LKPysmni4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuD3-007uVt-2D;
	Fri, 18 Aug 2023 07:47:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCS-007uCj-0C;
	Fri, 18 Aug 2023 07:47:21 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRv4n1kD9zNmvx;
	Fri, 18 Aug 2023 15:43:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:08 +0800
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
Subject: [PATCH -next v2 03/12] mtd: rawnand: fsmc: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:33 +0800
Message-ID: <20230818074642.308166-4-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230818_004716_620244_03E9E4BC 
X-CRM114-Status: GOOD (  11.39  )
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
no longer necessary to unprepare and disable the clock explicitly. The
label "disable_clk" no longer makes sense, rename it to "disable_fsmc".

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message and rename the label "disable_clk" to "disable_fsmc"
v1: https://lore.kernel.org/all/20230817024509.3951629-4-lizetao1@huawei.com/

 drivers/mtd/nand/raw/fsmc_nand.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 7b4742420dfc..7d587284c9a5 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1066,16 +1066,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	host->regs_va = base + FSMC_NOR_REG_SIZE +
 		(host->bank * FSMC_NAND_BANK_SZ);
 
-	host->clk = devm_clk_get(&pdev->dev, NULL);
+	host->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		dev_err(&pdev->dev, "failed to fetch block clock\n");
 		return PTR_ERR(host->clk);
 	}
 
-	ret = clk_prepare_enable(host->clk);
-	if (ret)
-		return ret;
-
 	/*
 	 * This device ID is actually a common AMBA ID as used on the
 	 * AMBA PrimeCell bus. However it is not a PrimeCell.
@@ -1111,7 +1107,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		if (!host->read_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get read dma channel\n");
 			ret = -ENODEV;
-			goto disable_clk;
+			goto disable_fsmc;
 		}
 		host->write_dma_chan = dma_request_channel(mask, filter, NULL);
 		if (!host->write_dma_chan) {
@@ -1155,9 +1151,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 release_dma_read_chan:
 	if (host->mode == USE_DMA_ACCESS)
 		dma_release_channel(host->read_dma_chan);
-disable_clk:
+disable_fsmc:
 	fsmc_nand_disable(host);
-	clk_disable_unprepare(host->clk);
 
 	return ret;
 }
@@ -1182,7 +1177,6 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
-		clk_disable_unprepare(host->clk);
 	}
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
