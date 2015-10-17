Received: from li271-223.members.linode.com ([178.79.152.223]
 helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZnVvY-0006nj-Nj
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2015 18:09:57 +0000
From: Vladimir Zapolskiy <vz@mleia.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Roland Stigge <stigge@antcom.de>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: lpc32xx_slc: fix warnings caused by enabling
 unprepared clock
Date: Sat, 17 Oct 2015 21:09:29 +0300
Message-Id: <1445105370-576-1-git-send-email-vz@mleia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If common clock framework is configured, the driver generates a warning,
which is fixed by this change:

    WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:727 clk_core_enable+0x2c/0xa4()
    Modules linked in:
    CPU: 0 PID: 1 Comm: swapper Not tainted 4.3.0-rc2+ #201
    Hardware name: LPC32XX SoC (Flattened Device Tree)
    Backtrace:
    [<>] (dump_backtrace) from [<>] (show_stack+0x18/0x1c)
    [<>] (show_stack) from [<>] (dump_stack+0x20/0x28)
    [<>] (dump_stack) from [<>] (warn_slowpath_common+0x90/0xb8)
    [<>] (warn_slowpath_common) from [<>] (warn_slowpath_null+0x24/0x2c)
    [<>] (warn_slowpath_null) from [<>] (clk_core_enable+0x2c/0xa4)
    [<>] (clk_core_enable) from [<>] (clk_enable+0x24/0x38)
    [<>] (clk_enable) from [<>] (lpc32xx_nand_probe+0x290/0x568)
    [<>] (lpc32xx_nand_probe) from [<>] (platform_drv_probe+0x50/0xa0)
    [<>] (platform_drv_probe) from [<>] (driver_probe_device+0x18c/0x408)
    [<>] (driver_probe_device) from [<>] (__driver_attach+0x70/0x94)
    [<>] (__driver_attach) from [<>] (bus_for_each_dev+0x74/0x98)
    [<>] (bus_for_each_dev) from [<>] (driver_attach+0x20/0x28)
    [<>] (driver_attach) from [<>] (bus_add_driver+0x11c/0x248)
    [<>] (bus_add_driver) from [<>] (driver_register+0xa4/0xe8)
    [<>] (driver_register) from [<>] (__platform_driver_register+0x50/0x64)
    [<>] (__platform_driver_register) from [<>] (lpc32xx_nand_driver_init+0x18/0x20)
    [<>] (lpc32xx_nand_driver_init) from [<>] (do_one_initcall+0x11c/0x1dc)
    [<>] (do_one_initcall) from [<>] (kernel_init_freeable+0x10c/0x1d4)
    [<>] (kernel_init_freeable) from [<>] (kernel_init+0x10/0xec)
    [<>] (kernel_init) from [<>] (ret_from_fork+0x14/0x24)

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/mtd/nand/lpc32xx_slc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 40c06b2..4f3d4eb 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -814,7 +814,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		res = -ENOENT;
 		goto err_exit1;
 	}
-	clk_enable(host->clk);
+	clk_prepare_enable(host->clk);
 
 	/* Set NAND IO addresses and command/ready functions */
 	chip->IO_ADDR_R = SLC_DATA(host->io_base);
@@ -919,7 +919,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 err_exit3:
 	dma_release_channel(host->dma_chan);
 err_exit2:
-	clk_disable(host->clk);
+	clk_disable_unprepare(host->clk);
 err_exit1:
 	lpc32xx_wp_enable(host);
 
@@ -943,7 +943,7 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 	tmp &= ~SLCCFG_CE_LOW;
 	writel(tmp, SLC_CTRL(host->io_base));
 
-	clk_disable(host->clk);
+	clk_disable_unprepare(host->clk);
 	lpc32xx_wp_enable(host);
 
 	return 0;
@@ -955,7 +955,7 @@ static int lpc32xx_nand_resume(struct platform_device *pdev)
 	struct lpc32xx_nand_host *host = platform_get_drvdata(pdev);
 
 	/* Re-enable NAND clock */
-	clk_enable(host->clk);
+	clk_prepare_enable(host->clk);
 
 	/* Fresh init of NAND controller */
 	lpc32xx_nand_setup(host);
@@ -980,7 +980,7 @@ static int lpc32xx_nand_suspend(struct platform_device *pdev, pm_message_t pm)
 	lpc32xx_wp_enable(host);
 
 	/* Disable clock */
-	clk_disable(host->clk);
+	clk_disable_unprepare(host->clk);
 
 	return 0;
 }
-- 
2.1.4
