Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJ9Vd-0000fL-Rj
	for linux-mtd@lists.infradead.org; Wed, 16 Jul 2008 16:05:42 +0000
Date: Wed, 16 Jul 2008 20:05:40 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [MTD] [NAND] fsl_upm: update driver for the new OF bindings
Message-ID: <20080716160540.GA11851@polina.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, Wolfgang Grandegger <wg@grandegger.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- get rid of fsl,wait-pattern and fsl,wait-write. I think this isn't
  chip-specific, and we should always do waits. I saw one board that
  didn't need fsl,wait-pattern, but I assume it was exception that
  proves general rule;
- get rid of chip-delay. Today there are no users for this, and if
  anyone really need this they should push the OF bindings beforehand;
- Now flash chips should be child nodes of the FSL UPM nand controller;
- Implement OF partition parsing.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
---

The new bindings were accepted, so.. David, please apply this for
2.6.27. Thanks in advance!

 drivers/mtd/nand/fsl_upm.c |   57 +++++++++++++++++++++++++------------------
 1 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 1ebfd87..3af5ef3 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -36,9 +36,6 @@ struct fsl_upm_nand {
 	uint8_t upm_cmd_offset;
 	void __iomem *io_base;
 	int rnb_gpio;
-	const uint32_t *wait_pattern;
-	const uint32_t *wait_write;
-	int chip_delay;
 };
 
 #define to_fsl_upm_nand(mtd) container_of(mtd, struct fsl_upm_nand, mtd)
@@ -89,8 +86,7 @@ static void fun_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 
 	fsl_upm_run_pattern(&fun->upm, fun->io_base, cmd);
 
-	if (fun->wait_pattern)
-		fun_wait_rnb(fun);
+	fun_wait_rnb(fun);
 }
 
 static uint8_t fun_read_byte(struct mtd_info *mtd)
@@ -116,14 +112,16 @@ static void fun_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 
 	for (i = 0; i < len; i++) {
 		out_8(fun->chip.IO_ADDR_W, buf[i]);
-		if (fun->wait_write)
-			fun_wait_rnb(fun);
+		fun_wait_rnb(fun);
 	}
 }
 
-static int __devinit fun_chip_init(struct fsl_upm_nand *fun)
+static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
+				   const struct device_node *upm_np,
+				   const struct resource *io_res)
 {
 	int ret;
+	struct device_node *flash_np;
 #ifdef CONFIG_MTD_PARTITIONS
 	static const char *part_types[] = { "cmdlinepart", NULL, };
 #endif
@@ -131,7 +129,7 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun)
 	fun->chip.IO_ADDR_R = fun->io_base;
 	fun->chip.IO_ADDR_W = fun->io_base;
 	fun->chip.cmd_ctrl = fun_cmd_ctrl;
-	fun->chip.chip_delay = fun->chip_delay;
+	fun->chip.chip_delay = 50;
 	fun->chip.read_byte = fun_read_byte;
 	fun->chip.read_buf = fun_read_buf;
 	fun->chip.write_buf = fun_write_buf;
@@ -143,18 +141,37 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun)
 	fun->mtd.priv = &fun->chip;
 	fun->mtd.owner = THIS_MODULE;
 
+	flash_np = of_get_next_child(upm_np, NULL);
+	if (!flash_np)
+		return -ENODEV;
+
+	fun->mtd.name = kasprintf(GFP_KERNEL, "%x.%s", io_res->start,
+				  flash_np->name);
+	if (!fun->mtd.name) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
 	ret = nand_scan(&fun->mtd, 1);
 	if (ret)
-		return ret;
-
-	fun->mtd.name = fun->dev->bus_id;
+		goto err;
 
 #ifdef CONFIG_MTD_PARTITIONS
 	ret = parse_mtd_partitions(&fun->mtd, part_types, &fun->parts, 0);
+
+#ifdef CONFIG_MTD_OF_PARTS
+	if (ret == 0)
+		ret = of_mtd_parse_partitions(fun->dev, &fun->mtd,
+					      flash_np, &fun->parts);
+#endif
 	if (ret > 0)
-		return add_mtd_partitions(&fun->mtd, fun->parts, ret);
+		ret = add_mtd_partitions(&fun->mtd, fun->parts, ret);
+	else
 #endif
-	return add_mtd_device(&fun->mtd);
+		ret = add_mtd_device(&fun->mtd);
+err:
+	of_node_put(flash_np);
+	return ret;
 }
 
 static int __devinit fun_probe(struct of_device *ofdev,
@@ -220,17 +237,8 @@ static int __devinit fun_probe(struct of_device *ofdev,
 
 	fun->dev = &ofdev->dev;
 	fun->last_ctrl = NAND_CLE;
-	fun->wait_pattern = of_get_property(ofdev->node, "fsl,wait-pattern",
-					    NULL);
-	fun->wait_write = of_get_property(ofdev->node, "fsl,wait-write", NULL);
-
-	prop = of_get_property(ofdev->node, "chip-delay", NULL);
-	if (prop)
-		fun->chip_delay = *prop;
-	else
-		fun->chip_delay = 50;
 
-	ret = fun_chip_init(fun);
+	ret = fun_chip_init(fun, ofdev->node, &io_res);
 	if (ret)
 		goto err2;
 
@@ -251,6 +259,7 @@ static int __devexit fun_remove(struct of_device *ofdev)
 	struct fsl_upm_nand *fun = dev_get_drvdata(&ofdev->dev);
 
 	nand_release(&fun->mtd);
+	kfree(fun->mtd.name);
 
 	if (fun->rnb_gpio >= 0)
 		gpio_free(fun->rnb_gpio);
-- 
1.5.5.4
