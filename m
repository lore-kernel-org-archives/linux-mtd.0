Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZryR4-0005YI-Cb
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 01:24:55 +0000
Received: by pasz6 with SMTP id z6so56786747pas.2
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2015 18:24:33 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>
Subject: [PATCH 2/2] mtd: m25p80: drop erase() callback
Date: Thu, 29 Oct 2015 18:24:21 -0700
Message-Id: <1446168261-4102-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1446168261-4102-1-git-send-email-computersforpeace@gmail.com>
References: <1446168261-4102-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just use the spi-nor default instead.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 4b5d7a4655fd..822b6c73dd50 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -152,22 +152,6 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	return 0;
 }
 
-static int m25p80_erase(struct spi_nor *nor, loff_t offset)
-{
-	struct m25p *flash = nor->priv;
-
-	dev_dbg(nor->dev, "%dKiB at 0x%08x\n",
-		flash->spi_nor.mtd.erasesize / 1024, (u32)offset);
-
-	/* Set up command buffer. */
-	flash->command[0] = nor->erase_opcode;
-	m25p_addr2cmd(nor, offset, flash->command);
-
-	spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
-
-	return 0;
-}
-
 /*
  * board specific setup should have ensured the SPI clock used here
  * matches what the READ command supports, at least until this driver
@@ -194,7 +178,6 @@ static int m25p_probe(struct spi_device *spi)
 	/* install the hooks */
 	nor->read = m25p80_read;
 	nor->write = m25p80_write;
-	nor->erase = m25p80_erase;
 	nor->write_reg = m25p80_write_reg;
 	nor->read_reg = m25p80_read_reg;
 
-- 
2.6.0.rc2.230.g3dd15c0
