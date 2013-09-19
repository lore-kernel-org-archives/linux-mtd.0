Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMggd-000136-N4
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:02:37 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/21] mtd: nand: pxa3xx: Use a completion to signal device
 ready
Date: Thu, 19 Sep 2013 13:01:27 -0300
Message-Id: <1379606505-2529-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Apparently, the expected behavior of the waitfunc() NAND chip call
is to wait for the device to be READY (this is a standard chip line).
However, the current implementation does almost nothing, which opens
a possibility to issue a command to a non-ready device.

Fix this by adding a new completion to wait for the ready event to arrive.

Because the "is ready" flag is cleared from the controller status
register, it's needed to store that state in the driver, and because the
field is accesed from an interruption, the field needs to be of an
atomic type.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 45 +++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index a8d2ea7..fba91c2 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -35,6 +35,7 @@
 
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
 
+#define NAND_DEV_READY_TIMEOUT  50
 #define	CHIP_DELAY_TIMEOUT	(2 * HZ/10)
 #define NAND_STOP_DELAY		(2 * HZ/50)
 #define PAGE_CHUNK_SIZE		(2048)
@@ -167,7 +168,7 @@ struct pxa3xx_nand_info {
 	struct clk		*clk;
 	void __iomem		*mmio_base;
 	unsigned long		mmio_phys;
-	struct completion	cmd_complete;
+	struct completion	cmd_complete, dev_ready;
 
 	unsigned int 		buf_start;
 	unsigned int		buf_count;
@@ -197,7 +198,13 @@ struct pxa3xx_nand_info {
 	int			use_ecc;	/* use HW ECC ? */
 	int			use_dma;	/* use DMA ? */
 	int			use_spare;	/* use spare ? */
-	int			is_ready;
+
+	/*
+	 * The is_ready flag is accesed from several places,
+	 * including an interruption hander. We need an atomic
+	 * type to avoid races.
+	 */
+	atomic_t		is_ready;
 
 	unsigned int		page_size;	/* page size of attached chip */
 	unsigned int		data_size;	/* data size in FIFO */
@@ -457,7 +464,7 @@ static void start_data_dma(struct pxa3xx_nand_info *info)
 static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 {
 	struct pxa3xx_nand_info *info = devid;
-	unsigned int status, is_completed = 0;
+	unsigned int status, is_completed = 0, is_ready = 0;
 	unsigned int ready, cmd_done;
 
 	if (info->cs == 0) {
@@ -493,8 +500,9 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 		is_completed = 1;
 	}
 	if (status & ready) {
-		info->is_ready = 1;
+		atomic_set(&info->is_ready, 1);
 		info->state = STATE_READY;
+		is_ready = 1;
 	}
 
 	if (status & NDSR_WRCMDREQ) {
@@ -523,6 +531,8 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 	nand_writel(info, NDSR, status);
 	if (is_completed)
 		complete(&info->cmd_complete);
+	if (is_ready)
+		complete(&info->dev_ready);
 NORMAL_IRQ_EXIT:
 	return IRQ_HANDLED;
 }
@@ -554,7 +564,6 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	info->use_ecc		= 0;
 	info->use_spare		= 1;
 	info->use_dma		= (use_dma) ? 1 : 0;
-	info->is_ready		= 0;
 	info->retcode		= ERR_NONE;
 	if (info->cs != 0)
 		info->ndcb0 = NDCB0_CSEL;
@@ -730,6 +739,8 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 	exec_cmd = prepare_command_pool(info, command, column, page_addr);
 	if (exec_cmd) {
 		init_completion(&info->cmd_complete);
+		init_completion(&info->dev_ready);
+		atomic_set(&info->is_ready, 0);
 		pxa3xx_nand_start(info);
 
 		ret = wait_for_completion_timeout(&info->cmd_complete,
@@ -842,21 +853,27 @@ static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
+	int ret;
+
+	/* Need to wait? */
+	if (!atomic_read(&info->is_ready)) {
+		ret = wait_for_completion_timeout(&info->dev_ready,
+				CHIP_DELAY_TIMEOUT);
+		if (!ret) {
+			dev_err(&info->pdev->dev, "Ready time out!!!\n");
+			return NAND_STATUS_FAIL;
+		}
+	}
 
 	/* pxa3xx_nand_send_command has waited for command complete */
 	if (this->state == FL_WRITING || this->state == FL_ERASING) {
 		if (info->retcode == ERR_NONE)
 			return 0;
-		else {
-			/*
-			 * any error make it return 0x01 which will tell
-			 * the caller the erase and write fail
-			 */
-			return 0x01;
-		}
+		else
+			return NAND_STATUS_FAIL;
 	}
 
-	return 0;
+	return NAND_STATUS_READY;
 }
 
 static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
@@ -1000,7 +1017,7 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 		return ret;
 
 	pxa3xx_nand_cmdfunc(mtd, NAND_CMD_RESET, 0, 0);
-	if (info->is_ready)
+	if (atomic_read(&info->is_ready))
 		return 0;
 
 	return -ENODEV;
-- 
1.8.1.5
