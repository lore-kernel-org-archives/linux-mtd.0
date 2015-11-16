From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com,
 Josh Wu <josh.wu@atmel.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 06/27] cris: nand: make use of mtd_to_nand() where appropriate
Date: Mon, 16 Nov 2015 14:37:39 +0100
Message-Id: <1447681080-31232-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1447681080-31232-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1447681080-31232-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_to_nand() was recently introduced to avoid direct accesses to the
mtd->priv field. Update all CRIS specific implementations to use this
helper.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 2 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index 7fb5212..db953cf 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -52,7 +52,7 @@ static void crisv32_hwcontrol(struct mtd_info *mtd, int cmd,
 {
 	unsigned long flags;
 	reg_pio_rw_dout dout;
-	struct nand_chip *this = mtd->priv;
+	struct nand_chip *this = mtd_to_nand(mtd);
 
 	local_irq_save(flags);
 
diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index e032384..22a6467 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -51,7 +51,7 @@ static void crisv32_hwcontrol(struct mtd_info *mtd, int cmd,
 {
 	unsigned long flags;
 	reg_gio_rw_pa_dout dout;
-	struct nand_chip *this = mtd->priv;
+	struct nand_chip *this = mtd_to_nand(mtd);
 
 	local_irq_save(flags);
 
-- 
2.1.4
