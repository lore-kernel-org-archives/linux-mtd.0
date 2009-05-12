Message-Id: <200905122106.n4CL6Fhn009459@imap1.linux-foundation.org>
Subject: [patch 04/14] mtd: plat_nand: allow platform to set partitions
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 12 May 2009 13:46:59 -0700
Cc: hsweeten@visionengravers.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: H Hartley Sweeten <hsweeten@visionengravers.com>

Add optional callback to allow platform to initialize partitions.

Static partitions on a nand device could vary depending on the size of the
device.  This patch allows an optional platform callback to be used to
setup this partition information at runtime.

Scan order is:
	1) chip.part_probe_types
	2) chip.set_parts
	3) chip.partitions
	4) full mtd device (fallback for no partitions)

Some of the existing nand drivers could possibly be replaced by the
plat_nand driver by using this patch.  These include autcpu12.c and
ts7250.c drivers.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/plat_nand.c |    2 ++
 include/linux/mtd/nand.h     |    3 +++
 2 files changed, 5 insertions(+)

diff -puN drivers/mtd/nand/plat_nand.c~mtd-plat_nand-allow-platform-to-set-partitions drivers/mtd/nand/plat_nand.c
--- a/drivers/mtd/nand/plat_nand.c~mtd-plat_nand-allow-platform-to-set-partitions
+++ a/drivers/mtd/nand/plat_nand.c
@@ -93,6 +93,8 @@ static int __devinit plat_nand_probe(str
 			return 0;
 		}
 	}
+	if (pdata->chip.set_parts)
+		pdata->chip.set_parts(data->mtd.size, &pdata->chip);
 	if (pdata->chip.partitions) {
 		data->parts = pdata->chip.partitions;
 		res = add_mtd_partitions(&data->mtd, data->parts,
diff -puN include/linux/mtd/nand.h~mtd-plat_nand-allow-platform-to-set-partitions include/linux/mtd/nand.h
--- a/include/linux/mtd/nand.h~mtd-plat_nand-allow-platform-to-set-partitions
+++ a/include/linux/mtd/nand.h
@@ -563,6 +563,7 @@ extern int nand_do_read(struct mtd_info 
  * @options:		Option flags, e.g. 16bit buswidth
  * @ecclayout:		ecc layout info structure
  * @part_probe_types:	NULL-terminated array of probe types
+ * @set_parts:		platform specific function to set partitions
  * @priv:		hardware controller specific settings
  */
 struct platform_nand_chip {
@@ -574,6 +575,8 @@ struct platform_nand_chip {
 	int			chip_delay;
 	unsigned int		options;
 	const char		**part_probe_types;
+	void			(*set_parts)(uint64_t size,
+					struct platform_nand_chip *chip);
 	void			*priv;
 };
 
_
