Received: from ns.lynxeye.de ([87.118.118.114] helo=lynxeye.de)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtLxW-0007rL-Nc
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 20:44:07 +0000
From: Lucas Stach <dev@lynxeye.de>
To: Stephen Warren <swarren@wwwdotorg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v4 3/5] clk: tegra20: init NDFLASH clock to sensible rate
Date: Mon,  2 Nov 2015 21:33:20 +0100
Message-Id: <1446496402-8142-4-git-send-email-dev@lynxeye.de>
In-Reply-To: <1446496402-8142-1-git-send-email-dev@lynxeye.de>
References: <1446496402-8142-1-git-send-email-dev@lynxeye.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Set up the NAND Flash controller clock to run at 150MHz
instead of the rate set by the bootloader. This is a
conservative rate which also yields good performance.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 drivers/clk/tegra/clk-tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index bf004f0..741c74e 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1062,6 +1062,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{TEGRA20_CLK_DISP2, TEGRA20_CLK_PLL_P, 600000000, 0},
 	{TEGRA20_CLK_GR2D, TEGRA20_CLK_PLL_C, 300000000, 0},
 	{TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0},
+	{TEGRA20_CLK_NDFLASH, TEGRA20_CLK_PLL_P, 150000000, 0},
 	{TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0}, /* This MUST be the last entry */
 };
 
-- 
2.4.3
