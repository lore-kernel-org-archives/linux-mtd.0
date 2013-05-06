Received: from smtp41.i.mail.ru ([94.100.177.101])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZLs8-0004lq-5y
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 13:54:35 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [RESEND PATCH v2 4/7] mtd: nand-gpio: Use default nand_base
 {read/write}_buf functions
Date: Mon,  6 May 2013 17:53:51 +0400
Message-Id: <1367848434-28493-4-git-send-email-shc_work@mail.ru>
In-Reply-To: <1367848434-28493-1-git-send-email-shc_work@mail.ru>
References: <1367848434-28493-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/gpio.c | 56 -------------------------------------------------
 1 file changed, 56 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 0d26f8b..312c285 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -87,51 +87,6 @@ static void gpio_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	gpio_nand_dosync(gpiomtd);
 }
 
-static void gpio_nand_writebuf(struct mtd_info *mtd, const u_char *buf, int len)
-{
-	struct nand_chip *this = mtd->priv;
-
-	iowrite8_rep(this->IO_ADDR_W, buf, len);
-}
-
-static void gpio_nand_readbuf(struct mtd_info *mtd, u_char *buf, int len)
-{
-	struct nand_chip *this = mtd->priv;
-
-	ioread8_rep(this->IO_ADDR_R, buf, len);
-}
-
-static void gpio_nand_writebuf16(struct mtd_info *mtd, const u_char *buf,
-				 int len)
-{
-	struct nand_chip *this = mtd->priv;
-
-	if (IS_ALIGNED((unsigned long)buf, 2)) {
-		iowrite16_rep(this->IO_ADDR_W, buf, len>>1);
-	} else {
-		int i;
-		unsigned short *ptr = (unsigned short *)buf;
-
-		for (i = 0; i < len; i += 2, ptr++)
-			writew(*ptr, this->IO_ADDR_W);
-	}
-}
-
-static void gpio_nand_readbuf16(struct mtd_info *mtd, u_char *buf, int len)
-{
-	struct nand_chip *this = mtd->priv;
-
-	if (IS_ALIGNED((unsigned long)buf, 2)) {
-		ioread16_rep(this->IO_ADDR_R, buf, len>>1);
-	} else {
-		int i;
-		unsigned short *ptr = (unsigned short *)buf;
-
-		for (i = 0; i < len; i += 2, ptr++)
-			*ptr = readw(this->IO_ADDR_R);
-	}
-}
-
 static int gpio_nand_devready(struct mtd_info *mtd)
 {
 	struct gpiomtd *gpiomtd = gpio_nand_getpriv(mtd);
@@ -314,19 +269,8 @@ static int gpio_nand_probe(struct platform_device *dev)
 	this->ecc.mode   = NAND_ECC_SOFT;
 	this->options    = gpiomtd->plat.options;
 	this->chip_delay = gpiomtd->plat.chip_delay;
-
-	/* install our routines */
 	this->cmd_ctrl   = gpio_nand_cmd_ctrl;
 
-	if (this->options & NAND_BUSWIDTH_16) {
-		this->read_buf   = gpio_nand_readbuf16;
-		this->write_buf  = gpio_nand_writebuf16;
-	} else {
-		this->read_buf   = gpio_nand_readbuf;
-		this->write_buf  = gpio_nand_writebuf;
-	}
-
-	/* set the mtd private data for the nand driver */
 	gpiomtd->mtd_info.priv = this;
 	gpiomtd->mtd_info.owner = THIS_MODULE;
 
-- 
1.8.1.5
