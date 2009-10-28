Received: from bar.sig21.net ([80.81.252.164])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N38TF-0000TS-OL
	for linux-mtd@lists.infradead.org; Wed, 28 Oct 2009 13:21:54 +0000
Date: Wed, 28 Oct 2009 14:21:37 +0100
From: Johannes Stezenbach <js@sig21.net>
To: David Woodhouse <dwmw2@infradead.org>,
	David Brownell <dbrownell@users.sourceforge.net>
Subject: [PATCH] mtd: m25p80: make command buffer DMA-safe
Message-ID: <20091028132137.GA17813@sig21.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

spi_write() requires the buffer to be DMA-safe, kmalloc()
it seperately to ensure this.

Signed-off-by: Johannes Stezenbach <js@sig21.net>


diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 4c19269..21dd4d9 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -79,7 +79,7 @@ struct m25p {
 	struct mtd_info		mtd;
 	unsigned		partitioned:1;
 	u8			erase_opcode;
-	u8			command[CMD_SIZE + FAST_READ_DUMMY_BYTE];
+	u8			*command;
 };
 
 static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
@@ -770,6 +770,11 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	flash = kzalloc(sizeof *flash, GFP_KERNEL);
 	if (!flash)
 		return -ENOMEM;
+	flash->command = kmalloc(CMD_SIZE + FAST_READ_DUMMY_BYTE, GFP_KERNEL);
+	if (!flash->command) {
+		kfree(flash);
+		return -ENOMEM;
+	}
 
 	flash->spi = spi;
 	mutex_init(&flash->lock);
@@ -888,8 +893,10 @@ static int __devexit m25p_remove(struct spi_device *spi)
 		status = del_mtd_partitions(&flash->mtd);
 	else
 		status = del_mtd_device(&flash->mtd);
-	if (status == 0)
+	if (status == 0) {
+		kfree(flash->command);
 		kfree(flash);
+	}
 	return 0;
 }
 
