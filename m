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
Subject: [PATCH v2 15/25] cris: nand: use the mtd instance embedded in struct
 nand_chip
Date: Tue,  1 Dec 2015 12:03:12 +0100
Message-Id: <1448967802-25796-16-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1448967802-25796-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1448967802-25796-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct nand_chip now embeds an mtd device. Patch all drivers to make use
of this mtd instance instead of using the instance embedded in their
private struct or dynamically allocated.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Most of those changes were generated with the coccinelle script added
in commit c671312 "coccinelle: nand: detect and correct drivers embedding
an mtd_info object"
---
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 3 +--
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index db953cf..ee74e45 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -36,7 +36,6 @@
 #define CE_BIT 12
 
 struct mtd_info_wrapper {
-	struct mtd_info info;
 	struct nand_chip chip;
 };
 
@@ -148,7 +147,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 
 	/* Get pointer to private data */
 	this = &wrapper->chip;
-	crisv32_mtd = &wrapper->info;
+	crisv32_mtd = nand_to_mtd(this);
 
 	/* Link the private data with the MTD structure */
 	crisv32_mtd->priv = this;
diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index 22a6467..5626297 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -31,7 +31,6 @@
 #define BY_BIT 7
 
 struct mtd_info_wrapper {
-	struct mtd_info info;
 	struct nand_chip chip;
 };
 
@@ -129,7 +128,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 
 	/* Get pointer to private data */
 	this = &wrapper->chip;
-	crisv32_mtd = &wrapper->info;
+	crisv32_mtd = nand_to_mtd(this);
 
 	pa_oe.oe |= 1 << CE_BIT;
 	pa_oe.oe |= 1 << ALE_BIT;
-- 
2.1.4
