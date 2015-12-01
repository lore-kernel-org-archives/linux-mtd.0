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
Subject: [PATCH v2 21/25] mtd: nand: kill the chip->flash_node field
Date: Tue,  1 Dec 2015 12:03:18 +0100
Message-Id: <1448967802-25796-22-git-send-email-boris.brezillon@free-electrons.com>
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

Now that the nand_chip struct directly embeds an mtd_info struct we can
get rid of the ->flash_node field and forward set/get_flash_node requests
to the MTD layer.

As a side effect, we no longer need the mtd_set_of_node() call done in
nand_dt_init().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 3 ---
 include/linux/mtd/nand.h     | 7 ++-----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ae3fd2a..8bb8ebd6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3945,9 +3945,6 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (!dn)
 		return 0;
 
-	/* MTD can automatically handle DT partitions, etc. */
-	mtd_set_of_node(nand_to_mtd(chip), dn);
-
 	if (of_get_nand_bus_width(dn) == 16)
 		chip->options |= NAND_BUSWIDTH_16;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 873646d..f12efe1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -545,7 +545,6 @@ struct nand_buffers {
  *			flash device
  * @IO_ADDR_W:		[BOARDSPECIFIC] address to write the 8 I/O lines of the
  *			flash device.
- * @flash_node:		[BOARDSPECIFIC] device node describing this instance
  * @read_byte:		[REPLACEABLE] read one byte from the chip
  * @read_word:		[REPLACEABLE] read one word from the chip
  * @write_byte:		[REPLACEABLE] write a single byte to the chip on the
@@ -645,8 +644,6 @@ struct nand_chip {
 	void __iomem *IO_ADDR_R;
 	void __iomem *IO_ADDR_W;
 
-	struct device_node *flash_node;
-
 	uint8_t (*read_byte)(struct mtd_info *mtd);
 	u16 (*read_word)(struct mtd_info *mtd);
 	void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
@@ -724,12 +721,12 @@ struct nand_chip {
 static inline void nand_set_flash_node(struct nand_chip *chip,
 				       struct device_node *np)
 {
-	chip->flash_node = np;
+	mtd_set_of_node(&chip->mtd, np);
 }
 
 static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
 {
-	return chip->flash_node;
+	return mtd_get_of_node(&chip->mtd);
 }
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
-- 
2.1.4
