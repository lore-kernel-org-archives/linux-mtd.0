Received: from [89.6.230.141] (helo=traven.no-ip.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnWg8-0008HJ-Nx
	for linux-mtd@lists.infradead.org; Mon, 14 May 2007 10:17:18 +0100
Date: Mon, 14 May 2007 11:19:25 +0200
From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] Use mutex instead of semaphore in the MTD ST M25Pxx driver
Message-ID: <20070514091925.GJ29206@traven>
References: <20070514090256.GF29206@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070514090256.GF29206@traven>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MTD ST M25Pxx driver uses a semaphore as mutex. Use the mutex API
instead of the (binary) semaphore.

Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>

--
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 78c2511..b32806a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -24,8 +24,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
-
-#include <asm/semaphore.h>
+#include <linux/mutex.h>
 
 
 /* NOTE: AT 25F and SST 25LF series are very similar,
@@ -201,13 +200,13 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
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
 
@@ -215,7 +214,7 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 		len -= mtd->erasesize;
 	}
 
-  	up(&flash->lock);
+	mutex_unlock(&flash->lock);
 
 	instr->state = MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
@@ -260,12 +259,12 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
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
 
@@ -281,7 +280,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	*retlen = m.actual_length - sizeof(flash->command);
 
-  	up(&flash->lock);
+	mutex_unlock(&flash->lock);
 
 	return 0;
 }
@@ -323,7 +322,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	t[1].tx_buf = buf;
 	spi_message_add_tail(&t[1], &m);
 
-  	down(&flash->lock);
+	mutex_lock(&flash->lock);
 
 	/* Wait until finished previous write command. */
 	if (wait_till_ready(flash))
@@ -384,7 +383,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	        }
  	}
 
-	up(&flash->lock);
+	mutex_unlock(&flash->lock);
 
 	return 0;
 }
@@ -456,7 +455,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	flash->spi = spi;
-	init_MUTEX(&flash->lock);
+	mutex_init(&flash->lock);
 	dev_set_drvdata(&spi->dev, flash);
 
 	if (data->name)

-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona

                       El camino se hace al andar
                           (Antonio Machado)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
