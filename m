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
Subject: [PATCH v4 03/58] mtd: nand: nuc900: create and use mtd_to_nuc900()
Date: Thu, 10 Dec 2015 08:59:47 +0100
Message-Id: <1449734442-18672-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Create and use mtd_to_nuc900() instead of direct container_of() calls.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nuc900_nand.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 8148cd6..65908c0 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -62,6 +62,11 @@ struct nuc900_nand {
 	spinlock_t lock;
 };
 
+static inline struct nuc900_nand *mtd_to_nuc900(struct mtd_info *mtd)
+{
+	return container_of(mtd, struct nuc900_nand, mtd);
+}
+
 static const struct mtd_partition partitions[] = {
 	{
 	 .name = "NAND FS 0",
@@ -78,9 +83,7 @@ static const struct mtd_partition partitions[] = {
 static unsigned char nuc900_nand_read_byte(struct mtd_info *mtd)
 {
 	unsigned char ret;
-	struct nuc900_nand *nand;
-
-	nand = container_of(mtd, struct nuc900_nand, mtd);
+	struct nuc900_nand *nand = mtd_to_nuc900(mtd);
 
 	ret = (unsigned char)read_data_reg(nand);
 
@@ -91,9 +94,7 @@ static void nuc900_nand_read_buf(struct mtd_info *mtd,
 				 unsigned char *buf, int len)
 {
 	int i;
-	struct nuc900_nand *nand;
-
-	nand = container_of(mtd, struct nuc900_nand, mtd);
+	struct nuc900_nand *nand = mtd_to_nuc900(mtd);
 
 	for (i = 0; i < len; i++)
 		buf[i] = (unsigned char)read_data_reg(nand);
@@ -103,9 +104,7 @@ static void nuc900_nand_write_buf(struct mtd_info *mtd,
 				  const unsigned char *buf, int len)
 {
 	int i;
-	struct nuc900_nand *nand;
-
-	nand = container_of(mtd, struct nuc900_nand, mtd);
+	struct nuc900_nand *nand = mtd_to_nuc900(mtd);
 
 	for (i = 0; i < len; i++)
 		write_data_reg(nand, buf[i]);
@@ -124,11 +123,9 @@ static int nuc900_check_rb(struct nuc900_nand *nand)
 
 static int nuc900_nand_devready(struct mtd_info *mtd)
 {
-	struct nuc900_nand *nand;
+	struct nuc900_nand *nand = mtd_to_nuc900(mtd);
 	int ready;
 
-	nand = container_of(mtd, struct nuc900_nand, mtd);
-
 	ready = (nuc900_check_rb(nand)) ? 1 : 0;
 	return ready;
 }
@@ -137,9 +134,7 @@ static void nuc900_nand_command_lp(struct mtd_info *mtd, unsigned int command,
 				   int column, int page_addr)
 {
 	register struct nand_chip *chip = mtd_to_nand(mtd);
-	struct nuc900_nand *nand;
-
-	nand = container_of(mtd, struct nuc900_nand, mtd);
+	struct nuc900_nand *nand = mtd_to_nuc900(mtd);
 
 	if (command == NAND_CMD_READOOB) {
 		column += mtd->writesize;
-- 
2.1.4
