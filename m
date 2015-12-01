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
Subject: [PATCH v2 18/25] cris: nand: remove useless mtd->priv = chip
 assignments
Date: Tue,  1 Dec 2015 12:03:15 +0100
Message-Id: <1448967802-25796-19-git-send-email-boris.brezillon@free-electrons.com>
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

mtd_to_nand() now uses the container_of() approach to transform an
mtd_info pointer into a nand_chip one. Drop useless mtd->priv
assignments from NAND controller drivers.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Patch generated with the following coccinelle script:

---8<----
virtual patch

@@
struct mtd_info m;
struct mtd_info *mp;
struct nand_chip *c;
@@
(
-(m).priv = c;
|
-(mp)->priv = c;
|
-(mp)->priv = (void *)c;
)
---8<----
---
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 3 ---
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index ee74e45..5aa3f51 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -149,9 +149,6 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	this = &wrapper->chip;
 	crisv32_mtd = nand_to_mtd(this);
 
-	/* Link the private data with the MTD structure */
-	crisv32_mtd->priv = this;
-
 	/* Set address of NAND IO lines */
 	this->IO_ADDR_R = read_cs;
 	this->IO_ADDR_W = write_cs;
diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index 5626297..a7c17b0 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -140,9 +140,6 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	bif_cfg.gated_csp1 = regk_bif_core_wr;
 	REG_WR(bif_core, regi_bif_core, rw_grp3_cfg, bif_cfg);
 
-	/* Link the private data with the MTD structure */
-	crisv32_mtd->priv = this;
-
 	/* Set address of NAND IO lines */
 	this->IO_ADDR_R = read_cs;
 	this->IO_ADDR_W = write_cs;
-- 
2.1.4
