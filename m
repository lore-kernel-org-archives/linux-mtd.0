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
Subject: [PATCH v2 04/25] mips: nand: make use of mtd_to_nand() where
 appropriate
Date: Tue,  1 Dec 2015 12:03:01 +0100
Message-Id: <1448967802-25796-5-git-send-email-boris.brezillon@free-electrons.com>
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

mtd_to_nand() was recently introduced to avoid direct accesses to the
mtd->priv field. Update all MIPS specific implementations to use this
helper.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/mips/alchemy/devboards/db1200.c | 2 +-
 arch/mips/alchemy/devboards/db1300.c | 2 +-
 arch/mips/alchemy/devboards/db1550.c | 2 +-
 arch/mips/pnx833x/common/platform.c  | 2 +-
 arch/mips/rb532/devices.c            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
index 8c13675..992442a 100644
--- a/arch/mips/alchemy/devboards/db1200.c
+++ b/arch/mips/alchemy/devboards/db1200.c
@@ -200,7 +200,7 @@ static struct i2c_board_info db1200_i2c_devs[] __initdata = {
 static void au1200_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				 unsigned int ctrl)
 {
-	struct nand_chip *this = mtd->priv;
+	struct nand_chip *this = mtd_to_nand(mtd);
 	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;
 
 	ioaddr &= 0xffffff00;
diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index b580770..d3c087f 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -150,7 +150,7 @@ static void __init db1300_gpio_config(void)
 static void au1300_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				 unsigned int ctrl)
 {
-	struct nand_chip *this = mtd->priv;
+	struct nand_chip *this = mtd_to_nand(mtd);
 	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;
 
 	ioaddr &= 0xffffff00;
diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
index 5740bcf..b518f02 100644
--- a/arch/mips/alchemy/devboards/db1550.c
+++ b/arch/mips/alchemy/devboards/db1550.c
@@ -128,7 +128,7 @@ static struct i2c_board_info db1550_i2c_devs[] __initdata = {
 static void au1550_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				 unsigned int ctrl)
 {
-	struct nand_chip *this = mtd->priv;
+	struct nand_chip *this = mtd_to_nand(mtd);
 	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;
 
 	ioaddr &= 0xffffff00;
diff --git a/arch/mips/pnx833x/common/platform.c b/arch/mips/pnx833x/common/platform.c
index b4b774b..3cd3577 100644
--- a/arch/mips/pnx833x/common/platform.c
+++ b/arch/mips/pnx833x/common/platform.c
@@ -180,7 +180,7 @@ static struct platform_device pnx833x_sata_device = {
 static void
 pnx833x_flash_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *this = mtd->priv;
+	struct nand_chip *this = mtd_to_nand(mtd);
 	unsigned long nandaddr = (unsigned long)this->IO_ADDR_W;
 
 	if (cmd == NAND_CMD_NONE)
diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 9bd7a2d..0966adc 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -148,7 +148,7 @@ static int rb532_dev_ready(struct mtd_info *mtd)
 
 static void rb532_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd->priv;
+	struct nand_chip *chip = mtd_to_nand(mtd);
 	unsigned char orbits, nandbits;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
-- 
2.1.4
