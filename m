Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fN3d4-0006I0-KI
 for linux-mtd@lists.infradead.org; Sun, 27 May 2018 21:55:08 +0000
From: Stefan Agner <stefan@agner.ch>
To: boris.brezillon@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at,
 marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com,
 benjamin.lindqvist@endian.se, jonathanh@nvidia.com,
 pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 4/6] clk: tegra20: init NDFLASH clock to sensible rate
Date: Sun, 27 May 2018 23:54:40 +0200
Message-Id: <20180527215442.14760-5-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Lucas Stach <dev@lynxeye.de>

Set up the NAND Flash controller clock to run at 150MHz
instead of the rate set by the bootloader. This is a
conservative rate which also yields good performance.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/clk/tegra/clk-tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 0ee56dd04cec..dff8c425cd28 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1049,6 +1049,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_GR2D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_VDE, TEGRA20_CLK_CLK_MAX, 300000000, 0 },
+	{ TEGRA20_CLK_NDFLASH, TEGRA20_CLK_PLL_P, 150000000, 0 },
 	/* must be the last entry */
 	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.17.0
