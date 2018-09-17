Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1uYw-0001Xh-9G
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 14:31:43 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: devices: m25p80: Make sure the buffer passed in op is
 DMA-able
Date: Mon, 17 Sep 2018 16:31:30 +0200
Message-Id: <20180917143130.23007-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As documented in spi-mem.h, spi_mem_op->data.buf.{in,out} must be
DMA-able, and commit 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx()
API") failed to follow this rule as buffers passed to
->{read,write}_reg() are usually placed on the stack.

Fix that by allocating a scratch buffer and copying the data around.

Fixes: 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx() API")
Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Note that the ->{read,write}() path is still buggy since nothing
guarantees that buffers passed by the MTD layer to the SPI NOR layer
are DMA-able, but this is a long-standing issue which we'll have to
address at the spi-nor level (this layer can choose the bounce buffer
size based on nor->page_size).

Changes in v2:
- Copy the data from scratchbuf in the ->read_reg() path
---
 drivers/mtd/devices/m25p80.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index cbfafc453274..270d3c9580c5 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -39,13 +39,23 @@ static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
 	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(code, 1),
 					  SPI_MEM_OP_NO_ADDR,
 					  SPI_MEM_OP_NO_DUMMY,
-					  SPI_MEM_OP_DATA_IN(len, val, 1));
+					  SPI_MEM_OP_DATA_IN(len, NULL, 1));
+	void *scratchbuf;
 	int ret;
 
+	scratchbuf = kmalloc(len, GFP_KERNEL);
+	if (!scratchbuf)
+		return -ENOMEM;
+
+	op.data.buf.in = scratchbuf;
 	ret = spi_mem_exec_op(flash->spimem, &op);
 	if (ret < 0)
 		dev_err(&flash->spimem->spi->dev, "error %d reading %x\n", ret,
 			code);
+	else
+		memcpy(val, scratchbuf, len);
+
+	kfree(scratchbuf);
 
 	return ret;
 }
@@ -56,9 +66,19 @@ static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 1),
 					  SPI_MEM_OP_NO_ADDR,
 					  SPI_MEM_OP_NO_DUMMY,
-					  SPI_MEM_OP_DATA_OUT(len, buf, 1));
+					  SPI_MEM_OP_DATA_OUT(len, NULL, 1));
+	void *scratchbuf;
+	int ret;
 
-	return spi_mem_exec_op(flash->spimem, &op);
+	scratchbuf = kmemdup(buf, len, GFP_KERNEL);
+	if (!scratchbuf)
+		return -ENOMEM;
+
+	op.data.buf.out = scratchbuf;
+	ret = spi_mem_exec_op(flash->spimem, &op);
+	kfree(scratchbuf);
+
+	return ret;
 }
 
 static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
-- 
2.14.1
