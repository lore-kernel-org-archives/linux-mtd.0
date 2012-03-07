Received: from eu1sys200aog107.obsmtp.com ([207.126.144.123])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F6T-0006fH-S7
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:23 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/18] fsmc/nand: Use dev_err to report error scenario
Date: Wed, 7 Mar 2012 17:01:04 +0530
Message-ID: <c83b4ffe7544e8aae24a752a9bc584a780862a98.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Vipin Kumar <vipin.kumar@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fsmc controller takes time to calculate the bch8 codes and the error offsets.
The calculate logic checks for completion upto a timeout. This patch adds a
error print when this timer expires and the ecc or error offsets are not yet
calculated.

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
Reviewed-by: Viresh Kumar <viresh.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 08aa93e..1f00b37 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -464,6 +464,7 @@ struct fsmc_nand_data {
 
 	struct fsmc_eccplace	*ecc_place;
 	unsigned int		bank;
+	struct device		*dev;
 	struct clk		*clk;
 
 	struct fsmc_nand_timings *dev_timings;
@@ -625,6 +626,11 @@ static int fsmc_read_hwecc_ecc4(struct mtd_info *mtd, const uint8_t *data,
 			cond_resched();
 	} while (!time_after_eq(jiffies, deadline));
 
+	if (time_after_eq(jiffies, deadline)) {
+		dev_err(host->dev, "calculate ecc timed out\n");
+		return -ETIMEDOUT;
+	}
+
 	ecc_tmp = readl(&regs->bank_regs[bank].ecc1);
 	ecc[0] = (uint8_t) (ecc_tmp >> 0);
 	ecc[1] = (uint8_t) (ecc_tmp >> 8);
@@ -961,6 +967,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 	host->bank = pdata->bank;
 	host->select_chip = pdata->select_bank;
+	host->dev = &pdev->dev;
 	host->dev_timings = pdata->nand_timings;
 	regs = host->regs_va;
 
-- 
1.7.0.4
