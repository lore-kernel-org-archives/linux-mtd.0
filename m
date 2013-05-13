Received: from mail-bk0-x234.google.com ([2a00:1450:4008:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbmgA-0005Yp-9a
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 06:56:16 +0000
Received: by mail-bk0-f52.google.com with SMTP id mz1so33602bkb.25
 for <linux-mtd@lists.infradead.org>; Sun, 12 May 2013 23:55:52 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 13 May 2013 14:55:52 +0800
Message-ID: <CAPgLHd_ETnhT-YQgyPKJJ5meTF_mibYipShRO2GPGMhpdGOuyw@mail.gmail.com>
Subject: [PATCH] mtd: fsmc_nand: fix error return code in fsmc_nand_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com,
 artem.bityutskiy@linux.intel.com, linus.walleij@linaro.org,
 viresh.kumar@linaro.org, vipin.kumar@st.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return -ENODEV in the dma channel request error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/fsmc_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 911e243..6988fc8 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1032,6 +1032,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	case USE_DMA_ACCESS:
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_MEMCPY, mask);
+		ret = -ENODEV;
 		host->read_dma_chan = dma_request_channel(mask, filter,
 				pdata->read_dma_priv);
 		if (!host->read_dma_chan) {
