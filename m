Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g34b4-0005eX-IJ
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 19:26:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Applied "spi: spi-mem: Add extra sanity checks on the op param" to
 the spi tree
In-Reply-To: <20180920073112.7897-4-boris.brezillon@bootlin.com>
Message-Id: <20180920192620.B2817440078@finisterre.ee.mobilebroadband>
Date: Thu, 20 Sep 2018 20:26:20 +0100 (BST)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch

   spi: spi-mem: Add extra sanity checks on the op param

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 380583227c0c7f52383b0cd5c0e2de93ed31d553 Mon Sep 17 00:00:00 2001
From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Thu, 20 Sep 2018 09:31:12 +0200
Subject: [PATCH] spi: spi-mem: Add extra sanity checks on the op param

Some combinations are simply not valid and should be rejected before
the op is passed to the SPI controller driver.

Add an spi_mem_check_op() helper and use it in spi_mem_exec_op() and
spi_mem_supports_op() to make sure the spi-mem operation is valid.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-mem.c | 54 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index eb72dba71d83..cc3d425aae56 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -12,6 +12,8 @@
 
 #include "internals.h"
 
+#define SPI_MEM_MAX_BUSWIDTH		4
+
 /**
  * spi_controller_dma_map_mem_op_data() - DMA-map the buffer attached to a
  *					  memory operation
@@ -149,6 +151,44 @@ static bool spi_mem_default_supports_op(struct spi_mem *mem,
 }
 EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
 
+static bool spi_mem_buswidth_is_valid(u8 buswidth)
+{
+	if (hweight8(buswidth) > 1 || buswidth > SPI_MEM_MAX_BUSWIDTH)
+		return false;
+
+	return true;
+}
+
+static int spi_mem_check_op(const struct spi_mem_op *op)
+{
+	if (!op->cmd.buswidth)
+		return -EINVAL;
+
+	if ((op->addr.nbytes && !op->addr.buswidth) ||
+	    (op->dummy.nbytes && !op->dummy.buswidth) ||
+	    (op->data.nbytes && !op->data.buswidth))
+		return -EINVAL;
+
+	if (spi_mem_buswidth_is_valid(op->cmd.buswidth) ||
+	    spi_mem_buswidth_is_valid(op->addr.buswidth) ||
+	    spi_mem_buswidth_is_valid(op->dummy.buswidth) ||
+	    spi_mem_buswidth_is_valid(op->data.buswidth))
+		return -EINVAL;
+
+	return 0;
+}
+
+static bool spi_mem_internal_supports_op(struct spi_mem *mem,
+					 const struct spi_mem_op *op)
+{
+	struct spi_controller *ctlr = mem->spi->controller;
+
+	if (ctlr->mem_ops && ctlr->mem_ops->supports_op)
+		return ctlr->mem_ops->supports_op(mem, op);
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
 /**
  * spi_mem_supports_op() - Check if a memory device and the controller it is
  *			   connected to support a specific memory operation
@@ -166,12 +206,10 @@ EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
  */
 bool spi_mem_supports_op(struct spi_mem *mem, const struct spi_mem_op *op)
 {
-	struct spi_controller *ctlr = mem->spi->controller;
-
-	if (ctlr->mem_ops && ctlr->mem_ops->supports_op)
-		return ctlr->mem_ops->supports_op(mem, op);
+	if (spi_mem_check_op(op))
+		return false;
 
-	return spi_mem_default_supports_op(mem, op);
+	return spi_mem_internal_supports_op(mem, op);
 }
 EXPORT_SYMBOL_GPL(spi_mem_supports_op);
 
@@ -196,7 +234,11 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	u8 *tmpbuf;
 	int ret;
 
-	if (!spi_mem_supports_op(mem, op))
+	ret = spi_mem_check_op(op);
+	if (ret)
+		return ret;
+
+	if (!spi_mem_internal_supports_op(mem, op))
 		return -ENOTSUPP;
 
 	if (ctlr->mem_ops) {
-- 
2.19.0
