From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Alexander Clouter <alex@digriz.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Wan ZongShun <mcuos.com@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Mans Rullgard <mans@mansr.com>,
 Stefan Agner <stefan@agner.ch>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Subject: [PATCH v2 22/23] mtd: rawnand: Pass a nand_chip object to all
 nand_xxx_bbt() helpers
Date: Thu,  6 Sep 2018 14:05:34 +0200
Message-Id: <20180906120535.21255-23-boris.brezillon@bootlin.com>
In-Reply-To: <20180906120535.21255-1-boris.brezillon@bootlin.com>
References: <20180906120535.21255-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Let's make the raw NAND API consistent by patching all helpers and
hooks to take a nand_chip object instead of an mtd_info one or
remove the mtd_info object when both are passed.

Let's tackle the nand_xxx_bbt() helpers.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c |  6 +++---
 drivers/mtd/nand/raw/nand_bbt.c  | 16 +++++++---------
 include/linux/mtd/rawnand.h      |  6 +++---
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 0a89ab663728..074de0c8c9dc 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -515,7 +515,7 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 
 	/* Mark block bad in BBT */
 	if (chip->bbt) {
-		res = nand_markbad_bbt(mtd, ofs);
+		res = nand_markbad_bbt(chip, ofs);
 		if (!ret)
 			ret = res;
 	}
@@ -565,7 +565,7 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 	if (!chip->bbt)
 		return 0;
 	/* Return info from the table */
-	return nand_isreserved_bbt(mtd, ofs);
+	return nand_isreserved_bbt(chip, ofs);
 }
 
 /**
@@ -585,7 +585,7 @@ static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int allowbbt)
 		return chip->block_bad(chip, ofs);
 
 	/* Return info from the table */
-	return nand_isbad_bbt(mtd, ofs, allowbbt);
+	return nand_isbad_bbt(chip, ofs, allowbbt);
 }
 
 /**
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 76849a441518..7424be0547f8 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1387,12 +1387,11 @@ EXPORT_SYMBOL(nand_create_bbt);
 
 /**
  * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @offs: offset in the device
  */
-int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
+int nand_isreserved_bbt(struct nand_chip *this, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
 	int block;
 
 	block = (int)(offs >> this->bbt_erase_shift);
@@ -1401,13 +1400,12 @@ int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
 
 /**
  * nand_isbad_bbt - [NAND Interface] Check if a block is bad
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @offs: offset in the device
  * @allowbbt: allow access to bad block table region
  */
-int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
+int nand_isbad_bbt(struct nand_chip *this, loff_t offs, int allowbbt)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
 	int block, res;
 
 	block = (int)(offs >> this->bbt_erase_shift);
@@ -1429,12 +1427,12 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 
 /**
  * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @offs: offset of the bad block
  */
-int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
+int nand_markbad_bbt(struct nand_chip *this, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int block, ret = 0;
 
 	block = (int)(offs >> this->bbt_erase_shift);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5bfb9d543a8a..e0d98ca7cb45 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1545,9 +1545,9 @@ extern const struct nand_manufacturer_ops amd_nand_manuf_ops;
 extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;
 
 int nand_create_bbt(struct nand_chip *chip);
-int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
-int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
+int nand_markbad_bbt(struct nand_chip *chip, loff_t offs);
+int nand_isreserved_bbt(struct nand_chip *chip, loff_t offs);
+int nand_isbad_bbt(struct nand_chip *chip, loff_t offs, int allowbbt);
 int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		    int allowbbt);
 
-- 
2.14.1
