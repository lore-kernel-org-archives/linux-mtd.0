Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ao6sw-00023k-Pn
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2016 10:10:04 +0000
From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
CC: <dwmw2@infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <fcooper@ti.com>, <nsekhar@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Roger Quadros
 <rogerq@ti.com>
Subject: [PATCH v6 03/17] memory: omap-gpmc: Introduce GPMC to NAND interface
Date: Thu, 7 Apr 2016 13:08:21 +0300
Message-ID: <1460023715-19332-4-git-send-email-rogerq@ti.com>
In-Reply-To: <1460023715-19332-1-git-send-email-rogerq@ti.com>
References: <1460023715-19332-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The OMAP GPMC module has certain registers dedicated for NAND
access and some NAND bits mixed with other GPMC functionality.

For the NAND dedicated registers we have the struct gpmc_nand_regs.

The NAND driver needs to access NAND specific bits from the
following non-dedicated registers
- EMPTYWRITEBUFFERSTATUS from GPMC_STATUS

For accessing these bits we introduce the struct gpmc_nand_ops.

Add gpmc_omap_get_nand_ops() that returns the gpmc_nand_ops along
with updating the gpmc_nand_regs. This API will be called by the
OMAP NAND driver to access the necessary bits in GPMC register space.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/memory/omap-gpmc.c | 21 +++++++++++++++++++++
 include/linux/omap-gpmc.h  | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 21825dd..0b62afd 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1118,6 +1118,27 @@ void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs)
 	}
 }
 
+static struct gpmc_nand_ops nand_ops;
+
+/**
+ * gpmc_omap_get_nand_ops - Get the GPMC NAND interface
+ * @regs: the GPMC NAND register map exclusive for NAND use.
+ * @cs: GPMC chip select number on which the NAND sits. The
+ *      register map returned will be specific to this chip select.
+ *
+ * Returns NULL on error e.g. invalid cs.
+ */
+struct gpmc_nand_ops *gpmc_omap_get_nand_ops(struct gpmc_nand_regs *reg, int cs)
+{
+	if (cs >= gpmc_cs_num)
+		return NULL;
+
+	gpmc_update_nand_reg(reg, cs);
+
+	return &nand_ops;
+}
+EXPORT_SYMBOL_GPL(gpmc_omap_get_nand_ops);
+
 int gpmc_get_client_irq(unsigned irq_config)
 {
 	int i;
diff --git a/include/linux/omap-gpmc.h b/include/linux/omap-gpmc.h
index 2dcef1c..dc2ada6 100644
--- a/include/linux/omap-gpmc.h
+++ b/include/linux/omap-gpmc.h
@@ -14,14 +14,45 @@
 #define GPMC_IRQ_FIFOEVENTENABLE	0x01
 #define GPMC_IRQ_COUNT_EVENT		0x02
 
+/**
+ * gpmc_nand_ops - Interface between NAND and GPMC
+ * @nand_write_buffer_empty: get the NAND write buffer empty status.
+ */
+struct gpmc_nand_ops {
+	bool (*nand_writebuffer_empty)(void);
+};
+
+struct gpmc_nand_regs;
+
+#if IS_ENABLED(CONFIG_OMAP_GPMC)
+struct gpmc_nand_ops *gpmc_omap_get_nand_ops(struct gpmc_nand_regs *regs,
+					     int cs);
+#else
+static inline gpmc_nand_ops *gpmc_omap_get_nand_ops(struct gpmc_nand_regs *regs,
+						    int cs)
+{
+	return NULL;
+}
+#endif /* CONFIG_OMAP_GPMC */
+
+/*--------------------------------*/
+
+/* deprecated APIs */
+#if IS_ENABLED(CONFIG_OMAP_GPMC)
+void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs);
+#else
+static inline void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs)
+{
+}
+#endif /* CONFIG_OMAP_GPMC */
+/*--------------------------------*/
+
 extern int gpmc_calc_timings(struct gpmc_timings *gpmc_t,
 			     struct gpmc_settings *gpmc_s,
 			     struct gpmc_device_timings *dev_t);
 
-struct gpmc_nand_regs;
 struct device_node;
 
-extern void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs);
 extern int gpmc_get_client_irq(unsigned irq_config);
 
 extern unsigned int gpmc_ticks_to_ns(unsigned int ticks);
-- 
2.5.0
