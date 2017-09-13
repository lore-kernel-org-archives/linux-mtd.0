Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds07J-0006Xs-NH
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 05:21:54 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 8/9] mtd: nand: denali: clean up comments
Date: Wed, 13 Sep 2017 14:20:45 +0900
Message-Id: <1505280046-16608-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1505280046-16608-1-git-send-email-yamada.masahiro@socionext.com>
References: <1505280046-16608-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver explains too much about what is apparent from the code.

Comments around basic APIs such as init_completion(), spin_lock_init(),
etc. seem unneeded lessons to kernel developers.
(With those comments dropped, denali_drv_init() is small enough,
so it has been merged into the probe function.)

Also, NAND driver developers should know the NAND init procedure, so
there is no need to explain nand_scan_ident/tail.

I removed FSF's address from the license blocks, and added a simple
comment to the spinlock as "checkpatch.pl --strict" suggested so.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c     | 52 +++++--------------------------------------
 drivers/mtd/nand/denali.h     |  7 +-----
 drivers/mtd/nand/denali_dt.c  |  1 -
 drivers/mtd/nand/denali_pci.c |  2 --
 4 files changed, 6 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ca98015..02ce310 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -10,11 +10,6 @@
  * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
- *
  */
 
 #include <linux/bitfield.h>
@@ -64,10 +59,6 @@ MODULE_LICENSE("GPL");
  */
 #define DENALI_CLK_X_MULT	6
 
-/*
- * this macro allows us to convert from an MTD structure to our own
- * device context (denali) structure.
- */
 static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 {
 	return container_of(mtd_to_nand(mtd), struct denali_nand_info, nand);
@@ -450,9 +441,8 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 	} while (!(err_cor_info & ERR_CORRECTION_INFO__LAST_ERR));
 
 	/*
-	 * Once handle all ecc errors, controller will trigger a
-	 * ECC_TRANSACTION_DONE interrupt, so here just wait for
-	 * a while for this interrupt
+	 * Once handle all ECC errors, controller will trigger an
+	 * ECC_TRANSACTION_DONE interrupt.
 	 */
 	irq_status = denali_wait_for_irq(denali, INTR__ECC_TRANSACTION_DONE);
 	if (!(irq_status & INTR__ECC_TRANSACTION_DONE))
@@ -613,7 +603,6 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 	denali_reset_irq(denali);
 	denali_setup_dma(denali, dma_addr, page, write);
 
-	/* wait for operation to complete */
 	irq_status = denali_wait_for_irq(denali, irq_mask);
 	if (!(irq_status & INTR__DMA_CMD_COMP))
 		ret = -EIO;
@@ -1185,22 +1174,6 @@ static const struct mtd_ooblayout_ops denali_ooblayout_ops = {
 	.free = denali_ooblayout_free,
 };
 
-/* initialize driver data structures */
-static void denali_drv_init(struct denali_nand_info *denali)
-{
-	/*
-	 * the completion object will be used to notify
-	 * the callee that the interrupt is done
-	 */
-	init_completion(&denali->complete);
-
-	/*
-	 * the spinlock will be used to synchronize the ISR with any
-	 * element that might be access shared data (interrupt status)
-	 */
-	spin_lock_init(&denali->irq_lock);
-}
-
 static int denali_multidev_fixup(struct denali_nand_info *denali)
 {
 	struct nand_chip *chip = &denali->nand;
@@ -1260,11 +1233,12 @@ int denali_init(struct denali_nand_info *denali)
 
 	mtd->dev.parent = denali->dev;
 	denali_hw_init(denali);
-	denali_drv_init(denali);
+
+	init_completion(&denali->complete);
+	spin_lock_init(&denali->irq_lock);
 
 	denali_clear_irq_all(denali);
 
-	/* Request IRQ after all the hardware initialization is finished */
 	ret = devm_request_irq(denali->dev, denali->irq, denali_isr,
 			       IRQF_SHARED, DENALI_NAND_NAME, denali);
 	if (ret) {
@@ -1282,7 +1256,6 @@ int denali_init(struct denali_nand_info *denali)
 	if (!mtd->name)
 		mtd->name = "denali-nand";
 
-	/* register the driver with the NAND core subsystem */
 	chip->select_chip = denali_select_chip;
 	chip->read_byte = denali_read_byte;
 	chip->write_byte = denali_write_byte;
@@ -1295,11 +1268,6 @@ int denali_init(struct denali_nand_info *denali)
 	if (denali->clk_x_rate)
 		chip->setup_data_interface = denali_setup_data_interface;
 
-	/*
-	 * scan for NAND devices attached to the controller
-	 * this is the first stage in a two step process to register
-	 * with the nand subsystem
-	 */
 	ret = nand_scan_ident(mtd, denali->max_banks, NULL);
 	if (ret)
 		goto disable_irq;
@@ -1323,18 +1291,9 @@ int denali_init(struct denali_nand_info *denali)
 		chip->buf_align = 16;
 	}
 
-	/*
-	 * second stage of the NAND scan
-	 * this stage requires information regarding ECC and
-	 * bad block management.
-	 */
-
 	chip->bbt_options |= NAND_BBT_USE_FLASH;
 	chip->bbt_options |= NAND_BBT_NO_OOB;
-
 	chip->ecc.mode = NAND_ECC_HW_SYNDROME;
-
-	/* no subpage writes on denali */
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
 	ret = denali_ecc_setup(mtd, chip, denali);
@@ -1418,7 +1377,6 @@ int denali_init(struct denali_nand_info *denali)
 }
 EXPORT_SYMBOL(denali_init);
 
-/* driver exit point */
 void denali_remove(struct denali_nand_info *denali)
 {
 	struct mtd_info *mtd = nand_to_mtd(&denali->nand);
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 73aad3a..c761b5e 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -10,11 +10,6 @@
  * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
- *
  */
 
 #ifndef __DENALI_H__
@@ -313,7 +308,7 @@ struct denali_nand_info {
 
 	/* elements used by ISR */
 	struct completion complete;
-	spinlock_t irq_lock;
+	spinlock_t irq_lock;		/* protect irq_mask and irq_status */
 	uint32_t irq_mask;
 	uint32_t irq_status;
 	int irq;
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 01e0100..cfd33e6 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -156,7 +156,6 @@ static struct platform_driver denali_dt_driver = {
 		.of_match_table	= denali_nand_dt_ids,
 	},
 };
-
 module_platform_driver(denali_dt_driver);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 7d5600b..57fb7ae 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -109,7 +109,6 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	return ret;
 }
 
-/* driver exit point */
 static void denali_pci_remove(struct pci_dev *dev)
 {
 	struct denali_nand_info *denali = pci_get_drvdata(dev);
@@ -125,5 +124,4 @@ static struct pci_driver denali_pci_driver = {
 	.probe = denali_pci_probe,
 	.remove = denali_pci_remove,
 };
-
 module_pci_driver(denali_pci_driver);
-- 
2.7.4
