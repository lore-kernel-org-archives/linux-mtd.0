Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFCO6-0002zT-Er
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 01:21:02 +0000
Received: by mail-pd0-f178.google.com with SMTP id w10so4262558pde.9
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 18:20:41 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/8] mtd: m25p80: drop wait-till-ready checks
Date: Wed,  6 Aug 2014 18:16:58 -0700
Message-Id: <1407374222-8448-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, zajec5@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

spi-nor.c should be taking care of these now.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index ed7e0a1bed3c..96226ea69f90 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -129,12 +129,6 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	struct spi_transfer t[2];
 	struct spi_message m;
 	int dummy = nor->read_dummy;
-	int ret;
-
-	/* Wait till previous write/erase is done. */
-	ret = nor->wait_till_ready(nor);
-	if (ret)
-		return ret;
 
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
@@ -160,16 +154,10 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 static int m25p80_erase(struct spi_nor *nor, loff_t offset)
 {
 	struct m25p *flash = nor->priv;
-	int ret;
 
 	dev_dbg(nor->dev, "%dKiB at 0x%08x\n",
 		flash->mtd.erasesize / 1024, (u32)offset);
 
-	/* Wait until finished previous write command. */
-	ret = nor->wait_till_ready(nor);
-	if (ret)
-		return ret;
-
 	/* Send write enable, then erase commands. */
 	ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0, 0);
 	if (ret)
-- 
1.9.1
