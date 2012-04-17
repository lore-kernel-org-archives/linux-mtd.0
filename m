Received: from eu1sys200aog103.obsmtp.com ([207.126.144.115])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SK4R1-0004qV-JC
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 09:11:00 +0000
From: Viresh Kumar <viresh.kumar@st.com>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 1/2] mtd: spear_smi: Add clk_{un}prepare() support
Date: Tue, 17 Apr 2012 14:26:17 +0530
Message-ID: <e95a4f03450aa1761d137bf3487de3e33e454563.1334652831.git.viresh.kumar@st.com>
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
 drivers/mtd/devices/spear_smi.c |   31 ++++++++++++++++++++++++++-----
 1 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 797d43c..55507be 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -990,6 +990,10 @@ static int __devinit spear_smi_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	ret = clk_prepare(dev->clk);
+	if (ret)
+		goto err_clk_prepare;
+
 	ret = clk_enable(dev->clk);
 	if (ret)
 		goto err_clk_enable;
@@ -1022,6 +1026,8 @@ err_bank_setup:
 err_irq:
 	clk_disable(dev->clk);
 err_clk_enable:
+	clk_unprepare(dev->clk);
+err_clk_prepare:
 	clk_put(dev->clk);
 err_clk:
 	iounmap(dev->io_base);
@@ -1075,6 +1081,7 @@ static int __devexit spear_smi_remove(struct platform_device *pdev)
 	free_irq(irq, dev);
 
 	clk_disable(dev->clk);
+	clk_unprepare(dev->clk);
 	clk_put(dev->clk);
 	iounmap(dev->io_base);
 	kfree(dev);
@@ -1090,8 +1097,10 @@ int spear_smi_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	struct spear_smi *dev = platform_get_drvdata(pdev);
 
-	if (dev && dev->clk)
+	if (dev && dev->clk) {
 		clk_disable(dev->clk);
+		clk_unprepare(dev->clk);
+	}
 
 	return 0;
 }
@@ -1099,13 +1108,25 @@ int spear_smi_suspend(struct platform_device *pdev, pm_message_t state)
 int spear_smi_resume(struct platform_device *pdev)
 {
 	struct spear_smi *dev = platform_get_drvdata(pdev);
-	int ret = -EPERM;
+	int ret;
+
+	if (dev && dev->clk) {
+		ret = clk_prepare(dev->clk);
+		if (ret)
+			goto err_clk_prepare;
 
-	if (dev && dev->clk)
 		ret = clk_enable(dev->clk);
+		if (ret)
+			goto err_clk_enable;
+	}
+
+	spear_smi_hw_init(dev);
 
-	if (!ret)
-		spear_smi_hw_init(dev);
+	return 0;
+
+err_clk_enable:
+	clk_unprepare(dev->clk);
+err_clk_prepare:
 	return ret;
 }
 
-- 
1.7.9
