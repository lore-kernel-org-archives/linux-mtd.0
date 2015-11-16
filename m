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
Subject: [PATCH 27/27] staging: mt29f_spinand: make use of
 nand_set/get_controller_data() helpers
Date: Mon, 16 Nov 2015 14:38:00 +0100
Message-Id: <1447681080-31232-28-git-send-email-boris.brezillon@free-electrons.com>
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

New helpers have been added to avoid directly accessing chip->field. Use
them where appropriate.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index b7d429d..5b3027a 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -32,7 +32,7 @@
 static inline struct spinand_state *mtd_to_state(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct spinand_info *info = (struct spinand_info *)chip->priv;
+	struct spinand_info *info = (struct spinand_info *)nand_get_controller_data(chip);
 	struct spinand_state *state = (struct spinand_state *)info->priv;
 
 	return state;
@@ -633,7 +633,7 @@ static int spinand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	u8 *p = buf;
 	int eccsize = chip->ecc.size;
 	int eccsteps = chip->ecc.steps;
-	struct spinand_info *info = (struct spinand_info *)chip->priv;
+	struct spinand_info *info = (struct spinand_info *)nand_get_controller_data(chip);
 
 	enable_read_hw_ecc = 1;
 
@@ -679,7 +679,7 @@ static u8 spinand_read_byte(struct mtd_info *mtd)
 
 static int spinand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
-	struct spinand_info *info = (struct spinand_info *)chip->priv;
+	struct spinand_info *info = (struct spinand_info *)nand_get_controller_data(chip);
 
 	unsigned long timeo = jiffies;
 	int retval, state = chip->state;
@@ -745,7 +745,7 @@ static void spinand_cmdfunc(struct mtd_info *mtd, unsigned int command,
 			    int column, int page)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct spinand_info *info = (struct spinand_info *)chip->priv;
+	struct spinand_info *info = (struct spinand_info *)nand_get_controller_data(chip);
 	struct spinand_state *state = (struct spinand_state *)info->priv;
 
 	switch (command) {
@@ -894,7 +894,7 @@ static int spinand_probe(struct spi_device *spi_nand)
 #endif
 
 	nand_set_flash_node(chip, spi_nand->dev.of_node);
-	chip->priv	= info;
+	nand_set_controller_data(chip, info);
 	chip->read_buf	= spinand_read_buf;
 	chip->write_buf	= spinand_write_buf;
 	chip->read_byte	= spinand_read_byte;
-- 
2.1.4
