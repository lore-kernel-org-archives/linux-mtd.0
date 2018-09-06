Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy2vq-0002aO-Kj
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 22:39:36 +0000
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
Subject: [PATCH 12/19] mtd: rawnand: Get rid of the duplicate nand_chip
 forward declaration
Date: Fri,  7 Sep 2018 00:38:44 +0200
Message-Id: <20180906223851.6964-13-boris.brezillon@bootlin.com>
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

There's already a forward declaration of nand_chip at the beginning of
the file. Get rid of this one.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 include/linux/mtd/rawnand.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 768415ed1159..608279104aae 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -210,9 +210,6 @@ enum nand_ecc_algo {
 #define NAND_CI_CELLTYPE_MSK	0x0C
 #define NAND_CI_CELLTYPE_SHIFT	2
 
-/* Keep gcc happy */
-struct nand_chip;
-
 /* ONFI version bits */
 #define ONFI_VERSION_1_0		BIT(1)
 #define ONFI_VERSION_2_0		BIT(2)
-- 
2.14.1
