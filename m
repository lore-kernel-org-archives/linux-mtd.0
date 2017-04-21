Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1bSg-0005Rc-JO
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 16:31:12 +0000
Received: by mail-io0-x244.google.com with SMTP id d203so32134212iof.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Apr 2017 09:30:50 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] mtd: dataflash: Replace pr_debug,
 printk with dev_* functions
Date: Fri, 21 Apr 2017 09:30:23 -0700
Message-Id: <20170421163026.24884-3-andrew.smirnov@gmail.com>
In-Reply-To: <20170421163026.24884-1-andrew.smirnov@gmail.com>
References: <20170421163026.24884-1-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lion's share of calls to pr_debug in this driver follow the pattern of
pr_debug("%s <message>", dev_name(<dev>), <arguments>), which should
be semantically identical to dev_dbg(<dev>, "<message>", <arguments>),
so replace such occurencies to simplify the code.

Convert the small minority of pr_debug that do not follow pattern from
above to use dev_dbg as well, for the sake of consistency.

Convert similar patter of printk(KERN_ERR, "%s: ...", dev_name(...),
...) to use dev_err instead.

No functional change intended.

Cc: cphealy@gmail.com
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

No changes since [v4]

Changes between since [v3]:

	 - Collected Reviewd-by from Marek

Not present in v2, v1

[v3] https://patchwork.ozlabs.org/patch/752332/
[v4] http://lkml.kernel.org/r/20170420162952.5181-3-andrew.smirnov@gmail.com

 drivers/mtd/devices/mtd_dataflash.c | 74 +++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 5b7a8c3..ccd1e02 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -130,8 +130,7 @@ static int dataflash_waitready(struct spi_device *spi)
 	for (;;) {
 		status = dataflash_status(spi);
 		if (status < 0) {
-			pr_debug("%s: status %d?\n",
-					dev_name(&spi->dev), status);
+			dev_dbg(&spi->dev, "status %d?\n", status);
 			status = 0;
 		}
 
@@ -157,9 +156,8 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 	u8			*command;
 	u32			rem;
 
-	pr_debug("%s: erase addr=0x%llx len 0x%llx\n",
-	      dev_name(&spi->dev), (long long)instr->addr,
-	      (long long)instr->len);
+	dev_dbg(&spi->dev, "erase addr=0x%llx len 0x%llx\n",
+		(long long)instr->addr, (long long)instr->len);
 
 	div_u64_rem(instr->len, priv->page_size, &rem);
 	if (rem)
@@ -192,7 +190,7 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 		command[2] = (u8)(pageaddr >> 8);
 		command[3] = 0;
 
-		pr_debug("ERASE %s: (%x) %x %x %x [%i]\n",
+		dev_dbg(&spi->dev, "ERASE %s: (%x) %x %x %x [%i]\n",
 			do_block ? "block" : "page",
 			command[0], command[1], command[2], command[3],
 			pageaddr);
@@ -201,8 +199,8 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 		(void) dataflash_waitready(spi);
 
 		if (status < 0) {
-			printk(KERN_ERR "%s: erase %x, err %d\n",
-				dev_name(&spi->dev), pageaddr, status);
+			dev_err(&spi->dev, "erase %x, err %d\n",
+				pageaddr, status);
 			/* REVISIT:  can retry instr->retries times; or
 			 * giveup and instr->fail_addr = instr->addr;
 			 */
@@ -243,8 +241,8 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	u8			*command;
 	int			status;
 
-	pr_debug("%s: read 0x%x..0x%x\n", dev_name(&priv->spi->dev),
-			(unsigned)from, (unsigned)(from + len));
+	dev_dbg(&priv->spi->dev, "read 0x%x..0x%x\n",
+		  (unsigned int)from, (unsigned int)(from + len));
 
 	/* Calculate flash page/byte address */
 	addr = (((unsigned)from / priv->page_size) << priv->page_offset)
@@ -252,7 +250,7 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	command = priv->command;
 
-	pr_debug("READ: (%x) %x %x %x\n",
+	dev_dbg(&priv->spi->dev, "READ: (%x) %x %x %x\n",
 		command[0], command[1], command[2], command[3]);
 
 	spi_message_init(&msg);
@@ -284,8 +282,7 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 		*retlen = msg.actual_length - 8;
 		status = 0;
 	} else
-		pr_debug("%s: read %x..%x --> %d\n",
-			dev_name(&priv->spi->dev),
+		dev_dbg(&priv->spi->dev, "read %x..%x --> %d\n",
 			(unsigned)from, (unsigned)(from + len),
 			status);
 	return status;
@@ -311,8 +308,8 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int			status = -EINVAL;
 	u8			*command;
 
-	pr_debug("%s: write 0x%x..0x%x\n",
-		dev_name(&spi->dev), (unsigned)to, (unsigned)(to + len));
+	dev_dbg(&spi->dev, "write 0x%x..0x%x\n",
+		(unsigned int)to, (unsigned int)(to + len));
 
 	spi_message_init(&msg);
 
@@ -329,7 +326,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	mutex_lock(&priv->lock);
 	while (remaining > 0) {
-		pr_debug("write @ %i:%i len=%i\n",
+		dev_dbg(&spi->dev, "write @ %i:%i len=%i\n",
 			pageaddr, offset, writelen);
 
 		/* REVISIT:
@@ -357,13 +354,13 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 			command[2] = (addr & 0x0000FF00) >> 8;
 			command[3] = 0;
 
-			pr_debug("TRANSFER: (%x) %x %x %x\n",
+			dev_dbg(&spi->dev, "TRANSFER: (%x) %x %x %x\n",
 				command[0], command[1], command[2], command[3]);
 
 			status = spi_sync(spi, &msg);
 			if (status < 0)
-				pr_debug("%s: xfer %u -> %d\n",
-					dev_name(&spi->dev), addr, status);
+				dev_dbg(&spi->dev, "xfer %u -> %d\n",
+					addr, status);
 
 			(void) dataflash_waitready(priv->spi);
 		}
@@ -375,7 +372,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 		command[2] = (addr & 0x0000FF00) >> 8;
 		command[3] = (addr & 0x000000FF);
 
-		pr_debug("PROGRAM: (%x) %x %x %x\n",
+		dev_dbg(&spi->dev, "PROGRAM: (%x) %x %x %x\n",
 			command[0], command[1], command[2], command[3]);
 
 		x[1].tx_buf = writebuf;
@@ -384,8 +381,8 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 		status = spi_sync(spi, &msg);
 		spi_transfer_del(x + 1);
 		if (status < 0)
-			pr_debug("%s: pgm %u/%u -> %d\n",
-				dev_name(&spi->dev), addr, writelen, status);
+			dev_dbg(&spi->dev, "pgm %u/%u -> %d\n",
+				addr, writelen, status);
 
 		(void) dataflash_waitready(priv->spi);
 
@@ -399,20 +396,20 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 		command[2] = (addr & 0x0000FF00) >> 8;
 		command[3] = 0;
 
-		pr_debug("COMPARE: (%x) %x %x %x\n",
+		dev_dbg(&spi->dev, "COMPARE: (%x) %x %x %x\n",
 			command[0], command[1], command[2], command[3]);
 
 		status = spi_sync(spi, &msg);
 		if (status < 0)
-			pr_debug("%s: compare %u -> %d\n",
-				dev_name(&spi->dev), addr, status);
+			dev_dbg(&spi->dev, "compare %u -> %d\n",
+				addr, status);
 
 		status = dataflash_waitready(priv->spi);
 
 		/* Check result of the compare operation */
 		if (status & (1 << 6)) {
-			printk(KERN_ERR "%s: compare page %u, err %d\n",
-				dev_name(&spi->dev), pageaddr, status);
+			dev_err(&spi->dev, "compare page %u, err %d\n",
+				pageaddr, status);
 			remaining = 0;
 			status = -EIO;
 			break;
@@ -757,8 +754,7 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
 	 */
 	ret = spi_write_then_read(spi, &code, 1, id, 3);
 	if (ret < 0) {
-		pr_debug("%s: error %d reading JEDEC ID\n",
-			dev_name(&spi->dev), ret);
+		dev_dbg(&spi->dev, "error %d reading JEDEC ID\n", ret);
 		return ERR_PTR(ret);
 	}
 
@@ -775,16 +771,14 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
 			i < ARRAY_SIZE(dataflash_data);
 			i++, info++) {
 		if (info->jedec_id == jedec) {
-			pr_debug("%s: OTP, sector protect%s\n",
-				dev_name(&spi->dev),
-				(info->flags & SUP_POW2PS)
-					? ", binary pagesize" : ""
-				);
+			dev_dbg(&spi->dev, "OTP, sector protect%s\n",
+				(info->flags & SUP_POW2PS) ?
+				", binary pagesize" : "");
 			if (info->flags & SUP_POW2PS) {
 				status = dataflash_status(spi);
 				if (status < 0) {
-					pr_debug("%s: status error %d\n",
-						dev_name(&spi->dev), status);
+					dev_dbg(&spi->dev, "status error %d\n",
+						status);
 					return ERR_PTR(status);
 				}
 				if (status & 0x1) {
@@ -848,8 +842,7 @@ static int dataflash_probe(struct spi_device *spi)
 	 */
 	status = dataflash_status(spi);
 	if (status <= 0 || status == 0xff) {
-		pr_debug("%s: status error %d\n",
-				dev_name(&spi->dev), status);
+		dev_dbg(&spi->dev, "status error %d\n", status);
 		if (status == 0 || status == 0xff)
 			status = -ENODEV;
 		return status;
@@ -890,8 +883,7 @@ static int dataflash_probe(struct spi_device *spi)
 	}
 
 	if (status < 0)
-		pr_debug("%s: add_dataflash --> %d\n", dev_name(&spi->dev),
-				status);
+		dev_dbg(&spi->dev, "add_dataflash --> %d\n", status);
 
 	return status;
 }
@@ -901,7 +893,7 @@ static int dataflash_remove(struct spi_device *spi)
 	struct dataflash	*flash = spi_get_drvdata(spi);
 	int			status;
 
-	pr_debug("%s: remove\n", dev_name(&spi->dev));
+	dev_dbg(&spi->dev, "remove\n");
 
 	status = mtd_device_unregister(&flash->mtd);
 	if (status == 0)
-- 
2.9.3
