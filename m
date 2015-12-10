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
Subject: [PATCH v4 12/58] mtd: nand: cmx270: use the mtd instance embedded in
 struct nand_chip
Date: Thu, 10 Dec 2015 08:59:56 +0100
Message-Id: <1449734442-18672-13-git-send-email-boris.brezillon@free-electrons.com>
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

struct nand_chip now embeds an mtd device. Make use of this mtd instance.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/cmx270_nand.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 43bded6..6b26e0c 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -160,10 +160,8 @@ static int __init cmx270_init(void)
 	gpio_direction_input(GPIO_NAND_RB);
 
 	/* Allocate memory for MTD device structure and private data */
-	cmx270_nand_mtd = kzalloc(sizeof(struct mtd_info) +
-				  sizeof(struct nand_chip),
-				  GFP_KERNEL);
-	if (!cmx270_nand_mtd) {
+	this = kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
+	if (!this) {
 		ret = -ENOMEM;
 		goto err_kzalloc;
 	}
@@ -175,8 +173,7 @@ static int __init cmx270_init(void)
 		goto err_ioremap;
 	}
 
-	/* Get pointer to private data */
-	this = (struct nand_chip *)(&cmx270_nand_mtd[1]);
+	cmx270_nand_mtd = nand_to_mtd(this);
 
 	/* Link the private data with the MTD structure */
 	cmx270_nand_mtd->owner = THIS_MODULE;
@@ -216,7 +213,7 @@ static int __init cmx270_init(void)
 err_scan:
 	iounmap(cmx270_nand_io);
 err_ioremap:
-	kfree(cmx270_nand_mtd);
+	kfree(this);
 err_kzalloc:
 	gpio_free(GPIO_NAND_RB);
 err_gpio_request:
@@ -241,7 +238,7 @@ static void __exit cmx270_cleanup(void)
 	iounmap(cmx270_nand_io);
 
 	/* Free the MTD device structure */
-	kfree (cmx270_nand_mtd);
+	kfree(mtd_to_nand(cmx270_nand_mtd));
 }
 module_exit(cmx270_cleanup);
 
-- 
2.1.4
