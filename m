Received: from m12-17.163.com ([220.181.12.17])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNfQv-0008DP-DI
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 12:08:02 +0000
From: weiyj_lk@163.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "Cooper Jr., Franklin" <fcooper@ti.com>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH -next] mtd: nand: omap2: fix return value check in
 omap_nand_probe()
Date: Thu, 14 Jul 2016 12:06:45 +0000
Message-Id: <1468498005-10664-1-git-send-email-weiyj_lk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function dma_request_chan() returns ERR_PTR() and
never returns NULL. The NULL test in the return value check should be
replaced with IS_ERR().

Fixes: aa7abd312c11 ('mtd: nand: omap2: Support parsing dma channel
information from DT')
Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/omap2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index a36ad3d..26fbe29 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1922,9 +1922,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 		dma_cap_set(DMA_SLAVE, mask);
 		info->dma = dma_request_chan(pdev->dev.parent, "rxtx");
 
-		if (!info->dma) {
+		if (IS_ERR(info->dma)) {
 			dev_err(&pdev->dev, "DMA engine request failed\n");
-			err = -ENXIO;
+			err = PTR_ERR(info->dma);
 			goto return_error;
 		} else {
 			struct dma_slave_config cfg;
