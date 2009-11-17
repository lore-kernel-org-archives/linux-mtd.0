Message-Id: <200911172245.nAHMjmsc001957@imap1.linux-foundation.org>
Subject: [patch 3/4] mtd: error return -EIO instead of EIO
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 17 Nov 2009 14:45:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: roel.kluin@gmail.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roel Kluin <roel.kluin@gmail.com>

Return a negative error value instead of a positive

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/maps/physmap.c    |    2 +-
 drivers/mtd/maps/vmu-flash.c  |    2 +-
 drivers/mtd/nand/atmel_nand.c |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff -puN drivers/mtd/maps/physmap.c~mtd-error-return-eio-instead-of-eio drivers/mtd/maps/physmap.c
--- a/drivers/mtd/maps/physmap.c~mtd-error-return-eio-instead-of-eio
+++ a/drivers/mtd/maps/physmap.c
@@ -129,7 +129,7 @@ static int physmap_flash_probe(struct pl
 						 info->map[i].size);
 		if (info->map[i].virt == NULL) {
 			dev_err(&dev->dev, "Failed to ioremap flash region\n");
-			err = EIO;
+			err = -EIO;
 			goto err_out;
 		}
 
diff -puN drivers/mtd/maps/vmu-flash.c~mtd-error-return-eio-instead-of-eio drivers/mtd/maps/vmu-flash.c
--- a/drivers/mtd/maps/vmu-flash.c~mtd-error-return-eio-instead-of-eio
+++ a/drivers/mtd/maps/vmu-flash.c
@@ -621,7 +621,7 @@ static int __devinit vmu_connect(struct 
 
 	card = kmalloc(sizeof(struct memcard), GFP_KERNEL);
 	if (!card) {
-		error = ENOMEM;
+		error = -ENOMEM;
 		goto fail_nomem;
 	}
 
diff -puN drivers/mtd/nand/atmel_nand.c~mtd-error-return-eio-instead-of-eio drivers/mtd/nand/atmel_nand.c
--- a/drivers/mtd/nand/atmel_nand.c~mtd-error-return-eio-instead-of-eio
+++ a/drivers/mtd/nand/atmel_nand.c
@@ -463,7 +463,7 @@ static int __init atmel_nand_probe(struc
 	if (host->board->det_pin) {
 		if (gpio_get_value(host->board->det_pin)) {
 			printk(KERN_INFO "No SmartMedia card inserted.\n");
-			res = ENXIO;
+			res = -ENXIO;
 			goto err_no_card;
 		}
 	}
@@ -534,7 +534,7 @@ static int __init atmel_nand_probe(struc
 
 	if ((!partitions) || (num_partitions == 0)) {
 		printk(KERN_ERR "atmel_nand: No partitions defined, or unsupported device.\n");
-		res = ENXIO;
+		res = -ENXIO;
 		goto err_no_partitions;
 	}
 
_
