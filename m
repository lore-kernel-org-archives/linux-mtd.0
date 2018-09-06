Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy2vq-0002ZM-KK
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 22:39:38 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Alexander Shiyan <shc_work@mail.ru>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org
Subject: [PATCH 10/19] mtd: rawnand: Move function prototypes after struct
 declarations
Date: Fri,  7 Sep 2018 00:38:42 +0200
Message-Id: <20180906223851.6964-11-boris.brezillon@bootlin.com>
In-Reply-To: <20180906223851.6964-1-boris.brezillon@bootlin.com>
References: <20180906223851.6964-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move nand_scan[_with_ids]() and nand_wait_ready() at the end of the
file where all function prototype lies. This will also allow us to get
rid of the nand_flash_dev forward declaration.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 include/linux/mtd/rawnand.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 992d78d29674..15183b73fed2 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -27,18 +27,6 @@
 struct nand_chip;
 struct nand_flash_dev;
 
-/* Scan and identify a NAND device */
-int nand_scan_with_ids(struct nand_chip *chip, unsigned int max_chips,
-		       struct nand_flash_dev *ids);
-
-static inline int nand_scan(struct nand_chip *chip, unsigned int max_chips)
-{
-	return nand_scan_with_ids(chip, max_chips, NULL);
-}
-
-/* Internal helper for board drivers which need to override command function */
-void nand_wait_ready(struct nand_chip *chip);
-
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8
 
@@ -1739,6 +1727,18 @@ int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
 int nand_write_data_op(struct nand_chip *chip, const void *buf,
 		       unsigned int len, bool force_8bit);
 
+/* Scan and identify a NAND device */
+int nand_scan_with_ids(struct nand_chip *chip, unsigned int max_chips,
+		       struct nand_flash_dev *ids);
+
+static inline int nand_scan(struct nand_chip *chip, unsigned int max_chips)
+{
+	return nand_scan_with_ids(chip, max_chips, NULL);
+}
+
+/* Internal helper for board drivers which need to override command function */
+void nand_wait_ready(struct nand_chip *chip);
+
 /*
  * Free resources held by the NAND device, must be called on error after a
  * sucessful nand_scan().
-- 
2.14.1
