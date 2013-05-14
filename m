Received: from mail-bk0-x234.google.com ([2a00:1450:4008:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uc50k-0003OY-BO
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 02:30:46 +0000
Received: by mail-bk0-f52.google.com with SMTP id mz1so3847bkb.39
 for <linux-mtd@lists.infradead.org>; Mon, 13 May 2013 19:30:19 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 14 May 2013 10:30:19 +0800
Message-ID: <CAPgLHd_DjX-Bfdf9p6k2t_fy+SjgQanuJjX_WxA1tqewwRe1HA@mail.gmail.com>
Subject: [PATCH v2] mtd: fsmc_nand: fix error return code in fsmc_nand_probe()
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
v1 -> v2: set ret for error cases only
---
 drivers/mtd/nand/fsmc_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 0e5a1d9..95e1768 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1035,12 +1035,14 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		host->read_dma_chan = dma_request_channel(mask, filter,
 				pdata->read_dma_priv);
 		if (!host->read_dma_chan) {
+			ret = -ENODEV;
 			dev_err(&pdev->dev, "Unable to get read dma channel\n");
 			goto err_req_read_chnl;
 		}
 		host->write_dma_chan = dma_request_channel(mask, filter,
 				pdata->write_dma_priv);
 		if (!host->write_dma_chan) {
+			ret = -ENODEV;
 			dev_err(&pdev->dev, "Unable to get write dma channel\n");
 			goto err_req_write_chnl;
 		}
