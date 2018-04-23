Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAfqc-0002Xi-CX
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 18:05:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-spi@vger.kernel.org
Subject: Applied "spi: Add an helper to flush the message queue" to the spi
 tree
In-Reply-To: <20180422183522.11118-3-boris.brezillon@bootlin.com>
Message-Id: <E1fAfqB-0004Jh-F7@debutante>
Date: Mon, 23 Apr 2018 19:05:27 +0100
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch

   spi: Add an helper to flush the message queue

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

>From 988f259b46646934003ff8ae4966f7233691d1ad Mon Sep 17 00:00:00 2001
From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Sun, 22 Apr 2018 20:35:15 +0200
Subject: [PATCH] spi: Add an helper to flush the message queue

This is needed by the spi-mem logic to force all messages that have been
queued before a memory operation to be sent before we start the memory
operation. We do that in order to guarantee that spi-mem operations do
not preempt regular SPI transfers.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/internals.h |  2 ++
 drivers/spi/spi.c       | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/spi/internals.h b/drivers/spi/internals.h
index dbe56c77b464..4a28a8395552 100644
--- a/drivers/spi/internals.h
+++ b/drivers/spi/internals.h
@@ -17,6 +17,8 @@
 #include <linux/scatterlist.h>
 #include <linux/spi/spi.h>
 
+void spi_flush_queue(struct spi_controller *ctrl);
+
 #ifdef CONFIG_HAS_DMA
 int spi_map_buf(struct spi_controller *ctlr, struct device *dev,
 		struct sg_table *sgt, void *buf, size_t len,
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 86b778d8563e..3f4666365678 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1522,6 +1522,22 @@ static int spi_controller_initialize_queue(struct spi_controller *ctlr)
 	return ret;
 }
 
+/**
+ * spi_flush_queue - Send all pending messages in the queue from the callers'
+ *		     context
+ * @ctlr: controller to process queue for
+ *
+ * This should be used when one wants to ensure all pending messages have been
+ * sent before doing something. Is used by the spi-mem code to make sure SPI
+ * memory operations do not preempt regular SPI transfers that have been queued
+ * before the spi-mem operation.
+ */
+void spi_flush_queue(struct spi_controller *ctlr)
+{
+	if (ctlr->transfer == spi_queued_transfer)
+		__spi_pump_messages(ctlr, false);
+}
+
 /*-------------------------------------------------------------------------*/
 
 #if defined(CONFIG_OF)
-- 
2.17.0
