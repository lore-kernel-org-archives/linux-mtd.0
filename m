Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMcqG-0003Fg-8d
 for linux-mtd@lists.infradead.org; Sat, 14 Feb 2015 13:33:09 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 1/3] mtd: nand: introduce NAND controller ops
Date: Sat, 14 Feb 2015 14:32:36 +0100
Message-Id: <1423920758-1556-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently all NAND operations are attached to the NAND chip itself (
struct nand_chip).
While this makes sense for some of them, like setup_read_retry or cmdfunc
because they depend on the discovered chip, most of them can be shared
across all chips attached to the NAND controller.

This would not only clean the nand_chip struct but also add a clear
separation between what's controller specific and what's chip specific.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 23 +++++++++++++++++++++++
 include/linux/mtd/nand.h     | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 41585df..e36ec5e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2944,9 +2944,32 @@ static void nand_resume(struct mtd_info *mtd)
 			__func__);
 }
 
+static void nand_set_controller_ops(struct nand_chip *chip)
+{
+	const struct nand_controller_ops *ops = chip->controller->ops;
+
+	if (!ops)
+		return;
+
+	chip->read_byte = ops->read_byte;
+	chip->read_word = ops->read_word;
+	chip->write_byte = ops->write_byte;
+	chip->write_buf = ops->write_buf;
+	chip->read_buf = ops->read_buf;
+	chip->select_chip = ops->select_chip;
+	chip->cmd_ctrl = ops->cmd_ctrl;
+	chip->init_size = ops->init_size;
+	chip->waitfunc = ops->waitfunc;
+	chip->erase = ops->erase;
+	chip->write_page = ops->write_page;
+}
+
 /* Set default functions */
 static void nand_set_defaults(struct nand_chip *chip, int busw)
 {
+	/* assing chip callbacks to controller ops functions if available */
+	nand_set_controller_ops(chip);
+
 	/* check for proper chip_delay setup, set 20us if not */
 	if (!chip->chip_delay)
 		chip->chip_delay = 20;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3d4ea7e..6c0aadc 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -426,17 +426,54 @@ struct nand_jedec_params {
 } __packed;
 
 /**
+ * struct nand_controller_ops - NAND Controller operations
+ * @read_byte:		read one byte from the chip
+ * @read_word:		read one word from the chip
+ * @write_byte:		write a single byte to the chip on the low 8 I/O lines
+ * @write_buf:		write data from the buffer to the chip
+ * @read_buf:		read data from the chip into the buffer
+ * @select_chip:	select chip nr
+ * @cmd_ctrl:		hardwarespecific function for controlling ALE/CLE/nCE.
+ *			Also used to write command and address
+ * @init_size:		hardwarespecific function for setting mtd->oobsize,
+ *			mtd->writesize and so on.
+ *			@id_data contains the 8 bytes values of NAND_CMD_READID.
+ *			Return with the bus width.
+ * @waitfunc:		hardwarespecific function for wait on ready.
+ * @erase:		erase function
+ * @write_page:		High-level page write function
+ */
+struct nand_controller_ops {
+	uint8_t (*read_byte)(struct mtd_info *mtd);
+	u16 (*read_word)(struct mtd_info *mtd);
+	void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
+	void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
+	void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
+	void (*select_chip)(struct mtd_info *mtd, int chip);
+	void (*cmd_ctrl)(struct mtd_info *mtd, int dat, unsigned int ctrl);
+	int (*init_size)(struct mtd_info *mtd, struct nand_chip *this,
+			 u8 *id_data);
+	int(*waitfunc)(struct mtd_info *mtd, struct nand_chip *this);
+	int (*erase)(struct mtd_info *mtd, int page);
+	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
+			  uint32_t offset, int data_len, const uint8_t *buf,
+			  int oob_required, int page, int cached, int raw);
+};
+
+/**
  * struct nand_hw_control - Control structure for hardware controller (e.g ECC generator) shared among independent devices
  * @lock:               protection lock
  * @active:		the mtd device which holds the controller currently
  * @wq:			wait queue to sleep on if a NAND operation is in
  *			progress used instead of the per chip wait queue
  *			when a hw controller is available.
+ * @ops:		controller operations
  */
 struct nand_hw_control {
 	spinlock_t lock;
 	struct nand_chip *active;
 	wait_queue_head_t wq;
+	const struct nand_controller_ops *ops;
 };
 
 /**
-- 
1.9.1
