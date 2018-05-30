Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fO0yT-0001WB-9l
 for linux-mtd@lists.infradead.org; Wed, 30 May 2018 13:17:10 +0000
From: Frieder Schrempf <frieder.schrempf@exceet.de>
To: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com,
 linux-spi@vger.kernel.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, miquel.raynal@bootlin.com, broonie@kernel.org,
 david.wolfe@nxp.com, fabio.estevam@nxp.com, prabhakar.kushwaha@nxp.com,
 yogeshnarayan.gaur@nxp.com, han.xu@nxp.com,
 Frieder Schrempf <frieder.schrempf@exceet.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] spi: spi-mem: Extend the SPI mem interface to set a
 custom memory name
Date: Wed, 30 May 2018 15:14:30 +0200
Message-Id: <1527686082-15142-2-git-send-email-frieder.schrempf@exceet.de>
In-Reply-To: <1527686082-15142-1-git-send-email-frieder.schrempf@exceet.de>
References: <1527686082-15142-1-git-send-email-frieder.schrempf@exceet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When porting (Q)SPI controller drivers from the MTD layer to the SPI
layer, the naming scheme for the memory devices changes. To be able
to keep compatibility with the old drivers naming scheme, a function
is added to the SPI mem interface to let controller drivers set a
custom name for the memory.

Example for the FSL QSPI driver:

Name with the old driver: 21e0000.qspi,
or with multiple devices: 21e0000.qspi-0, 21e0000.qspi-1, ...

Name with the new driver without spi_mem_get_name: spi4.0

Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
---
 drivers/spi/spi-mem.c       | 25 +++++++++++++++++++++++++
 include/linux/spi/spi-mem.h |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 990770d..5e9af47 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -311,6 +311,31 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 EXPORT_SYMBOL_GPL(spi_mem_exec_op);
 
 /**
+ * spi_mem_get_name() - Let drivers using the SPI mem interface specify a
+ *			custom name for the memory to avoid compatibility
+ *			issues with ported drivers.
+ * @mem: the SPI memory
+ *
+ * When porting (Q)SPI controller drivers from the MTD layer to the SPI
+ * layer, the naming scheme for the memory devices changes. To be able to
+ * keep compatibility with the old drivers naming scheme, this function can
+ * be used to get a custom name from the controller driver.
+ * If no custom name is available, the name of the SPI device is returned.
+ *
+ * Return: a char array that contains the name for the flash memory
+ */
+const char *spi_mem_get_name(struct spi_mem *mem)
+{
+	struct spi_controller *ctlr = mem->spi->controller;
+
+	if (ctlr->mem_ops && ctlr->mem_ops->get_name)
+		return ctlr->mem_ops->get_name(mem);
+
+	return dev_name(&mem->spi->dev);
+}
+EXPORT_SYMBOL_GPL(spi_mem_get_name);
+
+/**
  * spi_mem_adjust_op_size() - Adjust the data size of a SPI mem operation to
  *			      match controller limitations
  * @mem: the SPI memory
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 4fa34a2..f1912d3 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -178,6 +178,7 @@ struct spi_controller_mem_ops {
 			    const struct spi_mem_op *op);
 	int (*exec_op)(struct spi_mem *mem,
 		       const struct spi_mem_op *op);
+	const char *(*get_name)(struct spi_mem *mem);
 };
 
 /**
@@ -236,6 +237,8 @@ bool spi_mem_supports_op(struct spi_mem *mem,
 int spi_mem_exec_op(struct spi_mem *mem,
 		    const struct spi_mem_op *op);
 
+const char *spi_mem_get_name(struct spi_mem *mem);
+
 int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
 				       struct module *owner);
 
-- 
2.7.4
