Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bqFas-00028E-W7
 for linux-mtd@lists.infradead.org; Sat, 01 Oct 2016 08:24:28 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH 2/2] mtd: nand: Wait tCCS after a column change
Date: Sat,  1 Oct 2016 10:24:03 +0200
Message-Id: <1475310243-32625-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1475310243-32625-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1475310243-32625-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drivers implementing ->cmd_ctrl() and relying on the default ->cmdfunc()
implementation usually don't wait tCCS when a column change (RNDIN or
RNDOUT) is requested.
Add an option flag to ask the core to do so (note that we keep this as
an opt-in to avoid breaking existing implementations), and make use of
the ->data_interface information is available (otherwise, wait 500ns).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 26 +++++++++++++++++++++++++-
 include/linux/mtd/nand.h     | 10 ++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7a00245ebada..3b0e6d861e2e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -709,6 +709,25 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	nand_wait_ready(mtd);
 }
 
+static void nand_ccs_delay(struct nand_chip *chip)
+{
+	/*
+	 * The controller already takes care of waiting for tCCS when the RNDIN
+	 * or RNDOUT command is sent, return directly.
+	 */
+	if (!(chip->options & NAND_WAIT_TCCS))
+		return;
+
+	/*
+	 * Wait tCCS_min if it is correctly defined, otherwise wait 500ns
+	 * (which should be safe for all NANDs).
+	 */
+	if (chip->data_interface && chip->data_interface->timings.sdr.tCCS_min)
+		ndelay(chip->data_interface->timings.sdr.tCCS_min / 1000);
+	else
+		ndelay(500);
+}
+
 /**
  * nand_command_lp - [DEFAULT] Send command to NAND large page device
  * @mtd: MTD device structure
@@ -773,10 +792,13 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_ERASE1:
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
-	case NAND_CMD_RNDIN:
 	case NAND_CMD_STATUS:
 		return;
 
+	case NAND_CMD_RNDIN:
+		nand_ccs_delay(chip);
+		return;
+
 	case NAND_CMD_RESET:
 		if (chip->dev_ready)
 			break;
@@ -795,6 +817,8 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
 			       NAND_NCE | NAND_CTRL_CHANGE);
+
+		nand_ccs_delay(chip);
 		return;
 
 	case NAND_CMD_READ0:
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6fe83bce83a6..970ceb948835 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -210,6 +210,16 @@ enum nand_ecc_algo {
  */
 #define NAND_USE_BOUNCE_BUFFER	0x00100000
 
+/*
+ * In case your controller is implementing ->cmd_ctrl() and is relying on the
+ * default ->cmdfunc() implementation, you may want to let the core handle the
+ * tCCS delay which is required when a column change (RNDIN or RNDOUT) is
+ * requested.
+ * If your controller already takes care of this delay, you don't need to set
+ * this flag.
+ */
+#define NAND_WAIT_TCCS		0x00200000
+
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
 #define NAND_CONTROLLER_ALLOC	0x80000000
-- 
2.7.4
