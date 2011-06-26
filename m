Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QasBh-0006D8-Tm
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 16:27:59 +0000
Received: by wwf22 with SMTP id 22so2949770wwf.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 09:27:07 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] refactor mtd wait code
Date: Sun, 26 Jun 2011 18:26:53 +0200
Message-Id: <1309105616-3609-3-git-send-email-matthieu.castet@parrot.com>
In-Reply-To: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch move the common wait code for read and reset in the function
nand_wait_reset and nand_wait_read.

The only fonctionnal change are :
- there is a 5s timeout for nand reset (there was no timeout before)
- For AUTOINC nand, we wait 100ns before pooling RnB (to be similar of
what we do after a read command).

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |  148 ++++++++++++++++++++++--------------------
 1 files changed, 78 insertions(+), 70 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 095dfea..70af1c0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -99,6 +99,9 @@ static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
 
+static void nand_wait_reset(struct mtd_info *mtd, struct nand_chip *chip);
+static void nand_wait_read(struct mtd_info *mtd, struct nand_chip *chip);
+
 /*
  * For devices which display every fart in the system on a separate LED. Is
  * compiled away when LED support is disabled.
@@ -603,33 +606,11 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 		return;
 
 	case NAND_CMD_RESET:
-		if (chip->dev_ready)
-			break;
-		udelay(chip->chip_delay);
-		chip->cmd_ctrl(mtd, NAND_CMD_STATUS,
-			       NAND_CTRL_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd,
-			       NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
-		while (!(chip->read_byte(mtd) & NAND_STATUS_READY))
-				;
+		nand_wait_reset(mtd, chip);
 		return;
-
-		/* This applies to read commands */
-	default:
-		/*
-		 * If we don't have access to the busy pin, we apply the given
-		 * command delay
-		 */
-		if (!chip->dev_ready) {
-			udelay(chip->chip_delay);
-			return;
-		}
 	}
-	/* Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine. */
-	ndelay(100);
-
-	nand_wait_ready(mtd);
+	/* This applies to read commands */
+	nand_wait_read(mtd, chip);
 }
 
 /**
@@ -710,15 +691,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		return;
 
 	case NAND_CMD_RESET:
-		if (chip->dev_ready)
-			break;
-		udelay(chip->chip_delay);
-		chip->cmd_ctrl(mtd, NAND_CMD_STATUS,
-			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-			       NAND_NCE | NAND_CTRL_CHANGE);
-		while (!(chip->read_byte(mtd) & NAND_STATUS_READY))
-				;
+		nand_wait_reset(mtd, chip);
 		return;
 
 	case NAND_CMD_RNDOUT:
@@ -734,24 +707,9 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
 			       NAND_NCE | NAND_CTRL_CHANGE);
-
-		/* This applies to read commands */
-	default:
-		/*
-		 * If we don't have access to the busy pin, we apply the given
-		 * command delay
-		 */
-		if (!chip->dev_ready) {
-			udelay(chip->chip_delay);
-			return;
-		}
 	}
-
-	/* Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine. */
-	ndelay(100);
-
-	nand_wait_ready(mtd);
+	/* This applies to read commands */
+	nand_wait_read(mtd, chip);
 }
 
 /**
@@ -838,25 +796,19 @@ static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_wait - [DEFAULT]  wait until the command is done
+ * nand_wait_timeout - wait until the command is done
  * @mtd:	MTD device structure
  * @chip:	NAND chip structure
+ * @timeout : timeout (in jiffies) to wait
  *
- * Wait for command done. This applies to erase and program only
- * Erase can take up to 400ms and program up to 20ms according to
- * general NAND and SmartMedia specs
+ * Wait for command done. This applies to erase, program and reset
  */
-static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
+static int nand_wait_timeout(struct mtd_info *mtd, struct nand_chip *chip,
+					unsigned long timeo)
 {
 
-	unsigned long timeo = jiffies;
 	int status, state = chip->state;
 
-	if (state == FL_ERASING)
-		timeo += (HZ * 400) / 1000;
-	else
-		timeo += (HZ * 20) / 1000;
-
 	led_trigger_event(nand_led_trigger, LED_FULL);
 
 	/* Apply this short delay always to ensure that we do wait tWB in
@@ -891,6 +843,68 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 }
 
 /**
+ * nand_wait - [DEFAULT]  wait until the command is done
+ * @mtd:	MTD device structure
+ * @chip:	NAND chip structure
+ *
+ * Wait for command done. This applies to erase and program only
+ * Erase can take up to 400ms and program up to 20ms according to
+ * general NAND and SmartMedia specs
+ */
+static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
+{
+	unsigned long timeo = jiffies;
+	int state = chip->state;
+
+	if (state == FL_ERASING)
+		timeo += (HZ * 400) / 1000;
+	else
+		timeo += (HZ * 20) / 1000;
+
+	return nand_wait_timeout(mtd, chip, timeo);
+}
+
+/**
+ * nand_wait_reset - wait until the reset is done
+ * @mtd:	MTD device structure
+ * @chip:	NAND chip structure
+ *
+ * Wait for command done. This applies to erase and program only
+ */
+static void nand_wait_reset(struct mtd_info *mtd, struct nand_chip *chip)
+{
+	/* 5s timeout */
+	unsigned long timeo = jiffies + (HZ * 5000) / 1000;
+	nand_wait_timeout(mtd, chip, timeo);
+
+	return;
+}
+
+/**
+  * This is call after sending a read command, or for autoincrement
+  * chip that need it (!NAND_NO_READRDY).
+  *
+  * We can't call NAND_CMD_STATUS here, because the read command
+  * is not finished
+  */
+static void nand_wait_read(struct mtd_info *mtd, struct nand_chip *chip)
+{
+	/*
+	 * If we don't have access to the busy pin, we apply the given
+	 * command delay
+	 */
+	if (!chip->dev_ready) {
+		udelay(chip->chip_delay);
+	}
+	else {
+		/* Apply this short delay always to ensure that we do wait tWB in
+		 * any case on any machine. */
+		ndelay(100);
+		nand_wait_ready(mtd);
+	}
+}
+
+/**
  * __nand_unlock - [REPLACEABLE] unlocks specified locked blocks
  *
  * @mtd: mtd info
@@ -1526,10 +1540,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				 * increment is marked as NOAUTOINCR by the
 				 * board driver.
 				 */
-				if (!chip->dev_ready)
-					udelay(chip->chip_delay);
-				else
-					nand_wait_ready(mtd);
+				nand_wait_read(mtd, chip);
 			}
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
@@ -1811,10 +1822,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 			 * chip which does auto increment is marked as
 			 * NOAUTOINCR by the board driver.
 			 */
-			if (!chip->dev_ready)
-				udelay(chip->chip_delay);
-			else
-				nand_wait_ready(mtd);
+			nand_wait_read(mtd, chip);
 		}
 
 		readlen -= len;
-- 
1.7.5.4
