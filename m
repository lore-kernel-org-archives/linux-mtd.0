Received: from eu1sys200aog118.obsmtp.com ([207.126.144.145])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F61-0006Uj-Oy
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:31:54 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/18] nand/fsmc: use ALE and CLE offsets from platform data
Date: Wed, 7 Mar 2012 17:00:51 +0530
Message-ID: <d5d0f41404fc5df93c4c83f828600418c84c2842.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Artem.Bityutskiy@nokia.com, linus.walleij@linaro.org,
 Shiraz Hashim <shiraz.hashim@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shiraz Hashim <shiraz.hashim@st.com>

ALE and CLE offsets can be different on different devices. Let devices
pass these offsets to the fsmc driver through platform data.

Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |    9 +++++----
 include/linux/mtd/fsmc.h     |    5 +++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index abbff77..4dda9bb 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -729,27 +729,28 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto err_probe1;
 	}
 
-	host->resaddr = request_mem_region(res->start + PLAT_NAND_ALE,
+	host->resaddr = request_mem_region(res->start + pdata->ale_off,
 			resource_size(res), pdev->name);
 	if (!host->resaddr) {
 		ret = -EIO;
 		goto err_probe1;
 	}
 
-	host->addr_va = ioremap(res->start + PLAT_NAND_ALE, resource_size(res));
+	host->addr_va = ioremap(res->start + pdata->ale_off,
+			resource_size(res));
 	if (!host->addr_va) {
 		ret = -EIO;
 		goto err_probe1;
 	}
 
-	host->rescmd = request_mem_region(res->start + PLAT_NAND_CLE,
+	host->rescmd = request_mem_region(res->start + pdata->cle_off,
 			resource_size(res), pdev->name);
 	if (!host->rescmd) {
 		ret = -EIO;
 		goto err_probe1;
 	}
 
-	host->cmd_va = ioremap(res->start + PLAT_NAND_CLE, resource_size(res));
+	host->cmd_va = ioremap(res->start + pdata->cle_off, resource_size(res));
 	if (!host->cmd_va) {
 		ret = -EIO;
 		goto err_probe1;
diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
index 6987995..2cd655f 100644
--- a/include/linux/mtd/fsmc.h
+++ b/include/linux/mtd/fsmc.h
@@ -151,6 +151,11 @@ struct fsmc_nand_platform_data {
 	unsigned int		options;
 	unsigned int		width;
 	unsigned int		bank;
+
+	/* CLE, ALE offsets */
+	unsigned long           cle_off;
+	unsigned long           ale_off;
+
 	void			(*select_bank)(uint32_t bank, uint32_t busw);
 };
 
-- 
1.7.0.4
