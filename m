Received: from smtp104.sbc.mail.mud.yahoo.com ([68.142.198.203])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HrnIv-0006gb-A7
	for linux-mtd@lists.infradead.org; Fri, 25 May 2007 23:51:02 -0400
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org
Subject: [patch 2.6.22-rc3] MTD: m25p80 converted to mutex
Date: Fri, 25 May 2007 20:40:44 -0700
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200705252040.46348.david-b@pacbell.net>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert semaphore usage in m25p80 driver to mutex; mention another kind of
SPI flash chip that should be able to use this driver (given minor tweaks).

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/devices/m25p80.c |   33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

--- g26.orig/drivers/mtd/devices/m25p80.c	2007-05-24 02:02:35.000000000 -0700
+++ g26/drivers/mtd/devices/m25p80.c	2007-05-24 02:11:48.000000000 -0700
@@ -19,16 +19,17 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
-#include <linux/interrupt.h>
+#include <linux/mutex.h>
+
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
 
-#include <asm/semaphore.h>
-
 
 /* NOTE: AT 25F and SST 25LF series are very similar,
+ * as are other newer Atmel dataflash chips (AT26),
  * but commands for sector erase and chip id differ...
  */
 
@@ -65,7 +66,7 @@
 
 struct m25p {
 	struct spi_device	*spi;
-	struct semaphore	lock;
+	struct mutex		lock;
 	struct mtd_info		mtd;
 	unsigned		partitioned;
 	u8			command[4];
@@ -201,13 +202,13 @@ static int m25p80_erase(struct mtd_info 
 	addr = instr->addr;
 	len = instr->len;
 
-  	down(&flash->lock);
+	mutex_lock(&flash->lock);
 
 	/* now erase those sectors */
 	while (len) {
 		if (erase_sector(flash, addr)) {
 			instr->state = MTD_ERASE_FAILED;
-			up(&flash->lock);
+			mutex_unlock(&flash->lock);
 			return -EIO;
 		}
 
@@ -215,7 +216,7 @@ static int m25p80_erase(struct mtd_info 
 		len -= mtd->erasesize;
 	}
 
-  	up(&flash->lock);
+	mutex_unlock(&flash->lock);
 
 	instr->state = MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
@@ -260,12 +261,12 @@ static int m25p80_read(struct mtd_info *
 	if (retlen)
 		*retlen = 0;
 
-	down(&flash->lock);
+	mutex_lock(&flash->lock);
 
 	/* Wait till previous write/erase is done. */
 	if (wait_till_ready(flash)) {
 		/* REVISIT status return?? */
-		up(&flash->lock);
+		mutex_unlock(&flash->lock);
 		return 1;
 	}
 
@@ -281,7 +282,7 @@ static int m25p80_read(struct mtd_info *
 
 	*retlen = m.actual_length - sizeof(flash->command);
 
-  	up(&flash->lock);
+	mutex_unlock(&flash->lock);
 
 	return 0;
 }
@@ -323,7 +324,7 @@ static int m25p80_write(struct mtd_info 
 	t[1].tx_buf = buf;
 	spi_message_add_tail(&t[1], &m);
 
-  	down(&flash->lock);
+	mutex_lock(&flash->lock);
 
 	/* Wait until finished previous write command. */
 	if (wait_till_ready(flash))
@@ -381,10 +382,10 @@ static int m25p80_write(struct mtd_info 
 			if (retlen)
 				*retlen += m.actual_length
 					- sizeof(flash->command);
-	        }
- 	}
+		}
+	}
 
-	up(&flash->lock);
+	mutex_unlock(&flash->lock);
 
 	return 0;
 }
@@ -405,7 +406,7 @@ struct flash_info {
 };
 
 static struct flash_info __devinitdata m25p_data [] = {
-	/* REVISIT: fill in JEDEC ids, for parts that have them */
+	/* JEDEC id zero means "has no ID" */
 	{ "m25p05", 0x05, 0x2010, 32 * 1024, 2 },
 	{ "m25p10", 0x10, 0x2011, 32 * 1024, 4 },
 	{ "m25p20", 0x11, 0x2012, 64 * 1024, 4 },
@@ -456,7 +457,7 @@ static int __devinit m25p_probe(struct s
 		return -ENOMEM;
 
 	flash->spi = spi;
-	init_MUTEX(&flash->lock);
+	mutex_init(&flash->lock);
 	dev_set_drvdata(&spi->dev, flash);
 
 	if (data->name)
