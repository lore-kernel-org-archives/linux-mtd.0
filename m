Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SK6xG-000658-Ea
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 11:52:22 +0000
From: Viresh Kumar <viresh.kumar@st.com>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 1/2 V2] mtd: spear_smi: Add clk_{un}prepare() support
Date: Tue, 17 Apr 2012 17:07:56 +0530
Message-ID: <43a59a35ce076693de33846844ac5be4dae5a49b.1334662614.git.viresh.kumar@st.com>
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

 drivers/mtd/devices/spear_smi.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 797d43c..6796036 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -990,9 +990,9 @@ static int __devinit spear_smi_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	ret = clk_enable(dev->clk);
+	ret = clk_prepare_enable(dev->clk);
 	if (ret)
-		goto err_clk_enable;
+		goto err_clk_prepare_enable;
 
 	ret = request_irq(irq, spear_smi_int_handler, 0, pdev->name, dev);
 	if (ret) {
@@ -1020,8 +1020,8 @@ err_bank_setup:
 	free_irq(irq, dev);
 	platform_set_drvdata(pdev, NULL);
 err_irq:
-	clk_disable(dev->clk);
-err_clk_enable:
+	clk_disable_unprepare(dev->clk);
+err_clk_prepare_enable:
 	clk_put(dev->clk);
 err_clk:
 	iounmap(dev->io_base);
@@ -1074,7 +1074,7 @@ static int __devexit spear_smi_remove(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	free_irq(irq, dev);
 
-	clk_disable(dev->clk);
+	clk_disable_unprepare(dev->clk);
 	clk_put(dev->clk);
 	iounmap(dev->io_base);
 	kfree(dev);
@@ -1091,7 +1091,7 @@ int spear_smi_suspend(struct platform_device *pdev, pm_message_t state)
 	struct spear_smi *dev = platform_get_drvdata(pdev);
 
 	if (dev && dev->clk)
-		clk_disable(dev->clk);
+		clk_disable_unprepare(dev->clk);
 
 	return 0;
 }
@@ -1102,7 +1102,7 @@ int spear_smi_resume(struct platform_device *pdev)
 	int ret = -EPERM;
 
 	if (dev && dev->clk)
-		ret = clk_enable(dev->clk);
+		ret = clk_prepare_enable(dev->clk);
 
 	if (!ret)
 		spear_smi_hw_init(dev);
-- 
1.7.9
