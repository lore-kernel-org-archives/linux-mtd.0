Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqUXo-00084J-LD
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 18:27:21 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] mtd: plat_nand: fix `bbt_options' compile error
Date: Mon, 8 Aug 2011 11:26:33 -0700
Message-ID: <1312827993-19163-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, axel.lin@gmail.com,
	avorontsov@ru.mvista.com, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes a bug in commit 86cb232d4e6b589be3daef8d570d1921c05be962
("mtd: nand: consolidate redundant flash-based BBT flags"). The problem
was reported by Axel Lin at:

  http://lists.infradead.org/pipermail/linux-mtd/2011-August/037340.html

In restructuring a few of the fields in `struct nand_chip' and similar, I
overlooked my reference to a field in `struct platform_nand_chip' that
didn't exist. He discovered the bug via an ARM build that I didn't test:

  make orion5x_defconfig
  make

    CC      arch/arm/mach-orion5x/ts78xx-setup.o
  arch/arm/mach-orion5x/ts78xx-setup.c:278: error: unknown field 'bbt_options' specified in initializer
  make[1]: *** [arch/arm/mach-orion5x/ts78xx-setup.o] Error 1
  make: *** [arch/arm/mach-orion5x] Error 2

The fix is simply to add the new `bbt_options' field to
`platform_nand_chip' and to pass those options on to `nand_chip' during
its initialization.

I re-reviewed the rest of my previous commit and didn't find any other
similar errors.

Based on:

  git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

Reported-by: Axel Lin <axel.lin@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/plat_nand.c |    1 +
 include/linux/mtd/nand.h     |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index e62468b..ea8e123 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -77,6 +77,7 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	data->chip.read_buf = pdata->ctrl.read_buf;
 	data->chip.chip_delay = pdata->chip.chip_delay;
 	data->chip.options |= pdata->chip.options;
+	data->chip.bbt_options |= pdata->chip.bbt_options;
 
 	data->chip.ecc.hwctl = pdata->ctrl.hwcontrol;
 	data->chip.ecc.layout = pdata->chip.ecclayout;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ebd806f..f4fdb1e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -604,6 +604,7 @@ extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
  * @partitions:		mtd partition list
  * @chip_delay:		R/B delay value in us
  * @options:		Option flags, e.g. 16bit buswidth
+ * @bbt_options:	BBT option flags, e.g. NAND_BBT_USE_FLASH
  * @ecclayout:		ECC layout info structure
  * @part_probe_types:	NULL-terminated array of probe types
  */
@@ -615,6 +616,7 @@ struct platform_nand_chip {
 	struct nand_ecclayout *ecclayout;
 	int chip_delay;
 	unsigned int options;
+	unsigned int bbt_options;
 	const char **part_probe_types;
 };
 
-- 
1.7.0.4
