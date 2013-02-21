Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8d57-0002wI-78
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 20:49:29 +0000
Date: Thu, 21 Feb 2013 14:49:22 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH 3/3] powerpc/fsl_lbc: Lock shared UPM resources
Message-ID: <11674f90-2805-4cb3-a2af-1a0172f2e457@zimbra>
In-Reply-To: <c257020c-d86a-4bd0-8f59-afecedb33ff4@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Nate Case <ncase@xes-inc.com>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Author: Nate Case <ncase@xes-inc.com>

When multiple devices are attached to the same UPM, they can stomp on
each other in SMP mode.  This was observed on a platform with multiple
NAND flash chips which were on separate chip selects but the same UPM.
Although the NAND subsystem has its own locking mechanism, it only
locks access to an individual MTD rather than taking into
consideration the other shared resources on the SoC.

Some UPM resources (e.g., MAR) are shared across all devices and
require exclusive access.  Add new locking functions for this purpose
and update the fsl_upm driver to utilize it whenever it touches the
shared UPM registers.

Signed-off-by: Nate Case <ncase@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 arch/powerpc/include/asm/fsl_lbc.h |   10 +++++
 arch/powerpc/sysdev/fsl_lbc.c      |   71 ++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/fsl_upm.c         |   26 +++++++++++--
 3 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/fsl_lbc.h b/arch/powerpc/include/asm/fsl_lbc.h
index 8971a9f..181e55c 100644
--- a/arch/powerpc/include/asm/fsl_lbc.h
+++ b/arch/powerpc/include/asm/fsl_lbc.h
@@ -240,6 +240,10 @@ struct fsl_lbc_regs {
 #define FBCR_BC      0x00000FFF
 };
 
+/* FSL UPM lock states */
+#define FSL_UPM_STATE_READY	0
+#define FSL_UPM_STATE_BUSY	1
+
 /*
  * FSL UPM routines
  */
@@ -251,6 +255,9 @@ struct fsl_upm {
 extern u32 fsl_lbc_addr(phys_addr_t addr_base);
 extern int fsl_lbc_find(phys_addr_t addr_base);
 extern int fsl_upm_find(phys_addr_t addr_base, struct fsl_upm *upm);
+extern int fsl_upm_get_device(struct fsl_upm *upm);
+extern int fsl_upm_try_get_device(struct fsl_upm *upm);
+extern void fsl_upm_release_device(void);
 
 /**
  * fsl_upm_start_pattern - start UPM patterns execution
@@ -290,6 +297,9 @@ struct fsl_lbc_ctrl {
 	wait_queue_head_t		irq_wait;
 	spinlock_t			lock;
 	void				*nand;
+	int				upm_state;
+	struct fsl_upm			*active_upm;
+	wait_queue_head_t		upm_wait;
 
 	/* status read from LTESR by irq handler */
 	unsigned int			irq_status;
diff --git a/arch/powerpc/sysdev/fsl_lbc.c b/arch/powerpc/sysdev/fsl_lbc.c
index 9b4f0cf..c0b38e1 100644
--- a/arch/powerpc/sysdev/fsl_lbc.c
+++ b/arch/powerpc/sysdev/fsl_lbc.c
@@ -143,6 +143,74 @@ int fsl_upm_find(phys_addr_t addr_base, struct fsl_upm *upm)
 EXPORT_SYMBOL(fsl_upm_find);
 
 /**
+ * fsl_upm_get_device - Get access to shared UPM resources
+ * @upm:	the UPM device requesting access
+ *
+ * Get access to the UPM and lock it for exclusive access.  Although there
+ * are multiple chip selects and three UPM MxMR registers, some resources
+ * (e.g., MAR) are shared across all devices and require exclusive access.
+ */
+int fsl_upm_get_device(struct fsl_upm *upm)
+{
+	spinlock_t *lock = &fsl_lbc_ctrl_dev->lock;
+	wait_queue_head_t *wq = &fsl_lbc_ctrl_dev->upm_wait;
+	unsigned long flags;
+	DECLARE_WAITQUEUE(wait, current);
+retry:
+	spin_lock_irqsave(lock, flags);
+
+	if (fsl_lbc_ctrl_dev->active_upm == NULL)
+		fsl_lbc_ctrl_dev->active_upm = upm;
+
+	if (fsl_lbc_ctrl_dev->active_upm == upm &&
+	    fsl_lbc_ctrl_dev->upm_state == FSL_UPM_STATE_READY) {
+		fsl_lbc_ctrl_dev->upm_state = FSL_UPM_STATE_BUSY;
+		spin_unlock_irqrestore(lock, flags);
+		return 0;
+	}
+
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	add_wait_queue(wq, &wait);
+	spin_unlock_irqrestore(lock, flags);
+	schedule();
+	remove_wait_queue(wq, &wait);
+	goto retry;
+}
+
+/*
+ * fsl_upm_try_get_device - If unlocked, get access to shared UPM resources
+ * @upm:	the UPM device requesting access
+ *
+ * If unlocked, get access to the UPM and lock it for exclusive access.
+ * If locked by the same UPM already, simply return.
+ */
+int fsl_upm_try_get_device(struct fsl_upm *upm)
+{
+	if (fsl_lbc_ctrl_dev->active_upm == upm)
+		return 0;
+
+	return fsl_upm_get_device(upm);
+}
+
+/**
+ * fsl_upm_release_device - Release shared UPM resources
+ *
+ * Release UPM resource lock and wake up anyone waiting on the device
+ */
+void fsl_upm_release_device(void)
+{
+	spinlock_t *lock = &fsl_lbc_ctrl_dev->lock;
+	wait_queue_head_t *wq = &fsl_lbc_ctrl_dev->upm_wait;
+	unsigned long flags;
+
+	spin_lock_irqsave(lock, flags);
+	fsl_lbc_ctrl_dev->active_upm = NULL;
+	fsl_lbc_ctrl_dev->upm_state = FSL_UPM_STATE_READY;
+	wake_up(wq);
+	spin_unlock_irqrestore(lock, flags);
+}
+
+/**
  * fsl_upm_run_pattern - actually run an UPM pattern
  * @upm:	pointer to the fsl_upm structure obtained via fsl_upm_find
  * @io_base:	remapped pointer to where memory access should happen
@@ -295,6 +363,9 @@ static int fsl_lbc_ctrl_probe(struct platform_device *dev)
 
 	spin_lock_init(&fsl_lbc_ctrl_dev->lock);
 	init_waitqueue_head(&fsl_lbc_ctrl_dev->irq_wait);
+	init_waitqueue_head(&fsl_lbc_ctrl_dev->upm_wait);
+	fsl_lbc_ctrl_dev->upm_state = FSL_UPM_STATE_READY;
+	fsl_lbc_ctrl_dev->active_upm = NULL;
 
 	fsl_lbc_ctrl_dev->regs = of_iomap(dev->dev.of_node, 0);
 	if (!fsl_lbc_ctrl_dev->regs) {
diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 04e0725..b9f51ae 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -82,8 +82,16 @@ static void fun_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	struct fsl_upm_nand *fun = to_fsl_upm_nand(mtd);
 	u32 mar;
 
+	/* If neither one of ALE or CLE of 'ctrl' match 'last_ctrl' state */
 	if (!(ctrl & fun->last_ctrl)) {
+		/*
+		 * cmd_ctrl() gets called in this case sometimes without
+		 * prior commands, so we must try to get a lock to ensure
+		 * we don't unlock someone else
+		 */
+		fsl_upm_try_get_device(&fun->upm);
 		fsl_upm_end_pattern(&fun->upm);
+		fsl_upm_release_device();
 
 		if (cmd == NAND_CMD_NONE)
 			return;
@@ -92,10 +100,13 @@ static void fun_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	}
 
 	if (ctrl & NAND_CTRL_CHANGE) {
-		if (ctrl & NAND_ALE)
+		if (ctrl & NAND_ALE) {
+			fsl_upm_get_device(&fun->upm);
 			fsl_upm_start_pattern(&fun->upm, fun->upm_addr_offset);
-		else if (ctrl & NAND_CLE)
+		} else if (ctrl & NAND_CLE) {
+			fsl_upm_get_device(&fun->upm);
 			fsl_upm_start_pattern(&fun->upm, fun->upm_cmd_offset);
+		}
 	}
 
 	mar = (cmd << (32 - fun->upm.width)) |
@@ -125,8 +136,13 @@ static void fun_select_chip(struct mtd_info *mtd, int mchip_nr)
 static uint8_t fun_read_byte(struct mtd_info *mtd)
 {
 	struct fsl_upm_nand *fun = to_fsl_upm_nand(mtd);
+	uint8_t byte;
+
+	fsl_upm_get_device(&fun->upm);
+	byte = in_8(fun->chip.IO_ADDR_R);
+	fsl_upm_release_device();
 
-	return in_8(fun->chip.IO_ADDR_R);
+	return byte;
 }
 
 static void fun_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
@@ -134,8 +150,10 @@ static void fun_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	struct fsl_upm_nand *fun = to_fsl_upm_nand(mtd);
 	int i;
 
+	fsl_upm_get_device(&fun->upm);
 	for (i = 0; i < len; i++)
 		buf[i] = in_8(fun->chip.IO_ADDR_R);
+	fsl_upm_release_device();
 }
 
 static void fun_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
@@ -143,6 +161,7 @@ static void fun_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 	struct fsl_upm_nand *fun = to_fsl_upm_nand(mtd);
 	int i;
 
+	fsl_upm_get_device(&fun->upm);
 	for (i = 0; i < len; i++) {
 		out_8(fun->chip.IO_ADDR_W, buf[i]);
 		if (fun->wait_flags & FSL_UPM_WAIT_WRITE_BYTE)
@@ -150,6 +169,7 @@ static void fun_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 	}
 	if (fun->wait_flags & FSL_UPM_WAIT_WRITE_BUFFER)
 		fun_wait_rnb(fun);
+	fsl_upm_release_device();
 }
 
 static int fun_chip_init(struct fsl_upm_nand *fun,
-- 
1.7.9.5
