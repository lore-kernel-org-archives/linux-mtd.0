Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eiq5A-0005oD-7t
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 23:21:55 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar <sourav.poddar@ti.com>
Subject: [RFC PATCH 3/6] spi: bcm53xx: Implement the spi_mem interface
Date: Tue,  6 Feb 2018 00:21:17 +0100
Message-Id: <20180205232120.5851-4-boris.brezillon@bootlin.com>
In-Reply-To: <20180205232120.5851-1-boris.brezillon@bootlin.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

The spi_mem interface is meant to replace the spi_flash_read() one.
Implement the ->exec_op() method so that we can smoothly get rid of the
old interface.

Note that the current ->flash_read() implementation looks a bit fragile
since it does not take the ->read_opcode passed by the spi-nor layer
into account, which means if might not work with all kind of NORs.

Anyway, I left the logic unchanged and added a few extra checks to make
sure we're receiving something that looks like a NOR read operation.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/spi/spi-bcm53xx.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm53xx.c b/drivers/spi/spi-bcm53xx.c
index 6e409eabe1c9..c681d432e26c 100644
--- a/drivers/spi/spi-bcm53xx.c
+++ b/drivers/spi/spi-bcm53xx.c
@@ -263,6 +263,40 @@ static int bcm53xxspi_transfer_one(struct spi_master *master,
 	return 0;
 }
 
+static int bcm53xxspi_exec_mem_op(struct spi_mem *mem,
+				  const struct spi_mem_op *op)
+{
+	struct bcm53xxspi *b53spi = spi_master_get_devdata(mem->spi->master);
+	u32 from;
+
+	/*
+	 * FIXME: There's nothing in this driver programming the opcode and
+	 * buswidth to be used when a read is done on the mmio window, but it
+	 * seems to be used to access a SPI NOR device, so restrict access
+	 * access to SPINOR_OP_READ commands.
+	 */
+	if (!op->data.nbytes || op->data.dir != SPI_MEM_DATA_IN ||
+	    op->addr.nbytes != 3 || op->cmd.opcode != 0x3)
+		return -ENOTSUPP;
+
+	from = ((u32)op->addr.buf[0] << 16) | ((u32)op->addr.buf[1] << 8) |
+	       op->addr.buf[2];
+
+	/* Return -ENOTSUPP so that the core can fall back to normal reads. */
+	if (from + op->data.nbytes > BCM53XXSPI_FLASH_WINDOW)
+		return -ENOTSUPP;
+
+	bcm53xxspi_enable_bspi(b53spi);
+	memcpy_fromio(op->data.buf.in, b53spi->mmio_base + from,
+		      op->data.nbytes);
+
+	return 0;
+}
+
+static const struct spi_controller_mem_ops bcm53xxspi_mem_ops = {
+	.exec_op = bcm53xxspi_exec_mem_op,
+};
+
 static int bcm53xxspi_flash_read(struct spi_device *spi,
 				 struct spi_flash_read_message *msg)
 {
@@ -317,8 +351,10 @@ static int bcm53xxspi_bcma_probe(struct bcma_device *core)
 
 	master->dev.of_node = dev->of_node;
 	master->transfer_one = bcm53xxspi_transfer_one;
-	if (b53spi->mmio_base)
+	if (b53spi->mmio_base) {
+		master->mem_ops = &bcm53xxspi_mem_ops;
 		master->spi_flash_read = bcm53xxspi_flash_read;
+	}
 
 	bcma_set_drvdata(core, b53spi);
 
-- 
2.14.1
