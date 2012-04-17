Received: from eu1sys200aog101.obsmtp.com ([207.126.144.111])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SK6xG-000657-1A
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 11:52:21 +0000
From: Viresh Kumar <viresh.kumar@st.com>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 2/2 V2] mtd: fsmc_nand: Add clk_{un}prepare() support
Date: Tue, 17 Apr 2012 17:07:57 +0530
Message-ID: <0e30cc60464d6052706b96a020700ecbf2121d71.1334662614.git.viresh.kumar@st.com>
In-Reply-To: <43a59a35ce076693de33846844ac5be4dae5a49b.1334662614.git.viresh.kumar@st.com>
References: <43a59a35ce076693de33846844ac5be4dae5a49b.1334662614.git.viresh.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Viresh Kumar <viresh.kumar@st.com>, linus.walleij@linaro.org,
 spear-devel@list.st.com, linux-mtd@lists.infradead.org, viresh.linux@gmail.com,
 sr@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

clk_{un}prepare is mandatory for platforms using common clock framework. Since
this driver is used by SPEAr platform, which supports common clock framework,
add clk_{un}prepare() support for it.

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
---
V1->V2:
- Use clk_prepare_enable and clk_disable_unprepare

 drivers/mtd/nand/fsmc_nand.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 1b8330e..9d7f417 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -994,9 +994,9 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		return PTR_ERR(host->clk);
 	}
 
-	ret = clk_enable(host->clk);
+	ret = clk_prepare_enable(host->clk);
 	if (ret)
-		goto err_clk_enable;
+		goto err_clk_prepare_enable;
 
 	/*
 	 * This device ID is actually a common AMBA ID as used on the
@@ -1176,8 +1176,8 @@ err_req_write_chnl:
 	if (host->mode == USE_DMA_ACCESS)
 		dma_release_channel(host->read_dma_chan);
 err_req_read_chnl:
-	clk_disable(host->clk);
-err_clk_enable:
+	clk_disable_unprepare(host->clk);
+err_clk_prepare_enable:
 	clk_put(host->clk);
 	return ret;
 }
@@ -1198,7 +1198,7 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
-		clk_disable(host->clk);
+		clk_disable_unprepare(host->clk);
 		clk_put(host->clk);
 	}
 
@@ -1210,7 +1210,7 @@ static int fsmc_nand_suspend(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
 	if (host)
-		clk_disable(host->clk);
+		clk_disable_unprepare(host->clk);
 	return 0;
 }
 
@@ -1218,7 +1218,7 @@ static int fsmc_nand_resume(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
 	if (host) {
-		clk_enable(host->clk);
+		clk_prepare_enable(host->clk);
 		fsmc_nand_setup(host->regs_va, host->bank,
 				host->nand.options & NAND_BUSWIDTH_16,
 				host->dev_timings);
-- 
1.7.9
