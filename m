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
Subject: [PATCH v2 23/23] mtd: rawnand: Pass a nand_chip object
 nand_erase_nand()
Date: Thu,  6 Sep 2018 14:05:35 +0200
Message-Id: <20180906120535.21255-24-boris.brezillon@bootlin.com>
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

Let's tackle the nand_erase_nand() helper.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 10 +++++-----
 drivers/mtd/nand/raw/nand_bbt.c  |  2 +-
 include/linux/mtd/rawnand.h      |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 074de0c8c9dc..ef4d90ed896d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -505,7 +505,7 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 		memset(&einfo, 0, sizeof(einfo));
 		einfo.addr = ofs;
 		einfo.len = 1ULL << chip->phys_erase_shift;
-		nand_erase_nand(mtd, &einfo, 0);
+		nand_erase_nand(chip, &einfo, 0);
 
 		/* Write bad block marker to OOB */
 		nand_get_device(mtd, FL_WRITING);
@@ -4638,22 +4638,22 @@ static int single_erase(struct nand_chip *chip, int page)
  */
 static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	return nand_erase_nand(mtd, instr, 0);
+	return nand_erase_nand(mtd_to_nand(mtd), instr, 0);
 }
 
 /**
  * nand_erase_nand - [INTERN] erase block(s)
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @instr: erase instruction
  * @allowbbt: allow erasing the bbt area
  *
  * Erase one ore more blocks.
  */
-int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
+int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int page, status, pages_per_block, ret, chipnr;
-	struct nand_chip *chip = mtd_to_nand(mtd);
 	loff_t len;
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 7424be0547f8..9d73e086c5de 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -853,7 +853,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		memset(&einfo, 0, sizeof(einfo));
 		einfo.addr = to;
 		einfo.len = 1 << this->bbt_erase_shift;
-		res = nand_erase_nand(mtd, &einfo, 1);
+		res = nand_erase_nand(this, &einfo, 1);
 		if (res < 0) {
 			pr_warn("nand_bbt: error while erasing BBT block %d\n",
 				res);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index e0d98ca7cb45..e6360e1156e7 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1548,7 +1548,7 @@ int nand_create_bbt(struct nand_chip *chip);
 int nand_markbad_bbt(struct nand_chip *chip, loff_t offs);
 int nand_isreserved_bbt(struct nand_chip *chip, loff_t offs);
 int nand_isbad_bbt(struct nand_chip *chip, loff_t offs, int allowbbt);
-int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
+int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
 
 /**
-- 
2.14.1
