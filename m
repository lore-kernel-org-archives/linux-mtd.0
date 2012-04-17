Received: from eu1sys200aog120.obsmtp.com ([207.126.144.149])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SK4R1-0004qW-Jk
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 09:11:00 +0000
From: Viresh Kumar <viresh.kumar@st.com>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 2/2] mtd: fsmc_nand: Add clk_{un}prepare() support
Date: Tue, 17 Apr 2012 14:26:18 +0530
Message-ID: <e602342fa929bc44ef85683e457b1cdfcd6b9946.1334652831.git.viresh.kumar@st.com>
In-Reply-To: <e95a4f03450aa1761d137bf3487de3e33e454563.1334652831.git.viresh.kumar@st.com>
References: <e95a4f03450aa1761d137bf3487de3e33e454563.1334652831.git.viresh.kumar@st.com>
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
 drivers/mtd/nand/fsmc_nand.c |   24 ++++++++++++++++++++++--
 1 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 1b8330e..29d03b6 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -994,6 +994,10 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		return PTR_ERR(host->clk);
 	}
 
+	ret = clk_prepare(host->clk);
+	if (ret)
+		goto err_clk_prepare;
+
 	ret = clk_enable(host->clk);
 	if (ret)
 		goto err_clk_enable;
@@ -1178,6 +1182,8 @@ err_req_write_chnl:
 err_req_read_chnl:
 	clk_disable(host->clk);
 err_clk_enable:
+	clk_unprepare(host->clk);
+err_clk_prepare:
 	clk_put(host->clk);
 	return ret;
 }
@@ -1199,6 +1205,7 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 			dma_release_channel(host->read_dma_chan);
 		}
 		clk_disable(host->clk);
+		clk_unprepare(host->clk);
 		clk_put(host->clk);
 	}
 
@@ -1209,16 +1216,29 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 static int fsmc_nand_suspend(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
-	if (host)
+	if (host) {
 		clk_disable(host->clk);
+		clk_unprepare(host->clk);
+	}
 	return 0;
 }
 
 static int fsmc_nand_resume(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
+	int ret;
+
 	if (host) {
-		clk_enable(host->clk);
+		ret = clk_prepare(host->clk);
+		if (ret)
+			return ret;
+
+		ret = clk_enable(host->clk);
+		if (ret) {
+			clk_unprepare(host->clk);
+			return ret;
+		}
+
 		fsmc_nand_setup(host->regs_va, host->bank,
 				host->nand.options & NAND_BUSWIDTH_16,
 				host->dev_timings);
-- 
1.7.9
