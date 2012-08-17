Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2JTJ-0004b3-28
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 10:08:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Subject: [PATCH] mtd: spear_smi: fix compilation warning
Date: Fri, 17 Aug 2012 13:08:10 +0300
Message-Id: <1345198090-12619-1-git-send-email-dedekind1@gmail.com>
Cc: spear-devel <spear-devel@list.st.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

drivers/mtd/devices/spear_smi.c: In function 'spear_smi_probe':
drivers/mtd/devices/spear_smi.c:984:2: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---

Hi, I've just pushed this one to the l2-mtd.git tree.

 drivers/mtd/devices/spear_smi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 7c10466..421bc65 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -981,7 +981,7 @@ static int __devinit spear_smi_probe(struct platform_device *pdev)
 	dev->pdev = pdev;
 	dev->clk_rate = pdata->clk_rate;
 
-	if (dev->clk_rate < 0 || dev->clk_rate > SMI_MAX_CLOCK_FREQ)
+	if (dev->clk_rate > SMI_MAX_CLOCK_FREQ)
 		dev->clk_rate = SMI_MAX_CLOCK_FREQ;
 
 	dev->num_flashes = pdata->num_flashes;
-- 
1.7.10.4
