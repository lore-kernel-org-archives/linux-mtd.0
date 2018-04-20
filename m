Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RNA-0001zQ-U5
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:26 +0000
Received: by mail-wr0-x241.google.com with SMTP id v15-v6so2563441wrm.10
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:12 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: [PATCH 10/18] mtd: rawnand: factor nand_command_lp() into
 nand_command()
Date: Fri, 20 Apr 2018 10:19:38 +0200
Message-Id: <20180420081946.16088-11-sam.lefebvre@essensium.com>
In-Reply-To: <20180420081946.16088-1-sam.lefebvre@essensium.com>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The nand_command() and nand_command_lp() functions are very similar.
Factor them into a single function, and use conditions on writesize to
identify the differences.

is_lp checks are added everywhere to make sure the behaviour is exactly
the same as before. Most likely, the checks in CACHEDPROG, RNDIN and
RNDOUT are not needed since these commands are only valid for LP
devices. But since I'm not sure of that, I'm leaving it as is.

The only side effect of this patch is that the large-page behaviour is
activated a little bit earlier: as soon as writesize is set. However,
only SEQIN, READOOB, READ0, CACHEDPROG, RNDIN and RNDOUT behave
differently between small and large page. Of these, only RNDOUT is used
in nand_detect().  RNDOUT is used by nand_change_read_column_op() which
is called by nand_flash_detect_ext_param_page(). Before this patch, the
switch to nand_command_lp was already made just before calling that
function so the behaviour doesn't change.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note that I don't have access to a small-page device, so only tested on
large-page devices. Also only tested on i.MX6Q (gpmi-nand).

I only verified the lack of change in behaviour during nand_detect by
reading the code, so it's possible that I missed something. Testing on
various devices (ONFI, JEDEC, non-ONFI/JEDEC) is needed to be really
sure that nothing breaks.

Note that this patch can be removed from the series without affecting
the rest.
---
 drivers/mtd/nand/raw/nand_base.c | 236 ++++++++++++---------------------------
 1 file changed, 70 insertions(+), 166 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index bcc0344b1f27..320efbe41bd6 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -747,121 +747,6 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 };
 EXPORT_SYMBOL_GPL(nand_soft_waitrdy);
 
-/**
- * nand_command - [DEFAULT] Send command to NAND device
- * @mtd: MTD device structure
- * @command: the command to be sent
- * @column: the column address for this command, -1 if none
- * @page_addr: the page address for this command, -1 if none
- *
- * Send command to NAND device. This function is used for small page devices
- * (512 Bytes per page).
- */
-static void nand_command(struct mtd_info *mtd, unsigned int command,
-			 int column, int page_addr)
-{
-	register struct nand_chip *chip = mtd_to_nand(mtd);
-	int ctrl = NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE;
-
-	/* Write out the command to the device */
-	if (command == NAND_CMD_SEQIN) {
-		int readcmd;
-
-		if (column >= mtd->writesize) {
-			/* OOB area */
-			column -= mtd->writesize;
-			readcmd = NAND_CMD_READOOB;
-		} else if (column < 256) {
-			/* First 256 bytes --> READ0 */
-			readcmd = NAND_CMD_READ0;
-		} else {
-			column -= 256;
-			readcmd = NAND_CMD_READ1;
-		}
-		chip->cmd_ctrl(mtd, readcmd, ctrl);
-		ctrl &= ~NAND_CTRL_CHANGE;
-	}
-	if (command != NAND_CMD_NONE)
-		chip->cmd_ctrl(mtd, command, ctrl);
-
-	/* Address cycle, when necessary */
-	ctrl = NAND_NCE | NAND_ALE | NAND_CTRL_CHANGE;
-	/* Serially input address */
-	if (column != -1) {
-		/* Adjust columns for 16 bit buswidth */
-		if (chip->options & NAND_BUSWIDTH_16 &&
-				!nand_opcode_8bits(command))
-			column >>= 1;
-		chip->cmd_ctrl(mtd, column, ctrl);
-		ctrl &= ~NAND_CTRL_CHANGE;
-	}
-	if (page_addr != -1) {
-		chip->cmd_ctrl(mtd, page_addr, ctrl);
-		ctrl &= ~NAND_CTRL_CHANGE;
-		chip->cmd_ctrl(mtd, page_addr >> 8, ctrl);
-		if (chip->options & NAND_ROW_ADDR_3)
-			chip->cmd_ctrl(mtd, page_addr >> 16, ctrl);
-	}
-	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
-
-	/*
-	 * Program and erase have their own busy handlers status and sequential
-	 * in needs no delay
-	 */
-	switch (command) {
-
-	case NAND_CMD_NONE:
-	case NAND_CMD_PAGEPROG:
-	case NAND_CMD_ERASE1:
-	case NAND_CMD_ERASE2:
-	case NAND_CMD_SEQIN:
-	case NAND_CMD_STATUS:
-	case NAND_CMD_READID:
-	case NAND_CMD_SET_FEATURES:
-		return;
-
-	case NAND_CMD_RESET:
-		if (chip->dev_ready)
-			break;
-		udelay(chip->chip_delay);
-		chip->cmd_ctrl(mtd, NAND_CMD_STATUS,
-			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-			       NAND_NCE | NAND_CTRL_CHANGE);
-		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
-		nand_wait_status_ready(mtd, 250);
-		return;
-
-		/* This applies to read commands */
-	case NAND_CMD_READ0:
-		/*
-		 * READ0 is sometimes used to exit GET STATUS mode. When this
-		 * is the case no address cycles are requested, and we can use
-		 * this information to detect that we should not wait for the
-		 * device to be ready.
-		 */
-		if (column == -1 && page_addr == -1)
-			return;
-
-	default:
-		/*
-		 * If we don't have access to the busy pin, we apply the given
-		 * command delay
-		 */
-		if (!chip->dev_ready) {
-			udelay(chip->chip_delay);
-			return;
-		}
-	}
-	/*
-	 * Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine.
-	 */
-	ndelay(100);
-
-	nand_wait_ready(mtd);
-}
-
 static void nand_ccs_delay(struct nand_chip *chip)
 {
 	/*
@@ -882,26 +767,48 @@ static void nand_ccs_delay(struct nand_chip *chip)
 }
 
 /**
- * nand_command_lp - [DEFAULT] Send command to NAND large page device
+ * nand_command - [DEFAULT] Send command to NAND device
  * @mtd: MTD device structure
  * @command: the command to be sent
  * @column: the column address for this command, -1 if none
  * @page_addr: the page address for this command, -1 if none
  *
- * Send command to NAND device. This is the version for the new large page
- * devices. We don't have the separate regions as we have in the small page
- * devices. We must emulate NAND_CMD_READOOB to keep the code compatible.
+ * Send command to NAND device.
  */
-static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
+static void nand_command(struct mtd_info *mtd, unsigned int command,
 			    int column, int page_addr)
 {
 	register struct nand_chip *chip = mtd_to_nand(mtd);
 	int ctrl = NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE;
+	/* Large page devices (> 512 bytes) behave slightly differently. */
+	bool is_lp = mtd->writesize > 512;
 
-	/* Emulate NAND_CMD_READOOB */
-	if (command == NAND_CMD_READOOB) {
-		column += mtd->writesize;
-		command = NAND_CMD_READ0;
+	if (is_lp) {
+		/* Large page devices don't have the separate regions as we
+		 * have in the small page devices. We must emulate
+		 * NAND_CMD_READOOB to keep the code compatible.
+		 */
+		if (command == NAND_CMD_READOOB) {
+			column += mtd->writesize;
+			command = NAND_CMD_READ0;
+		}
+	} else if (command == NAND_CMD_SEQIN) {
+		/* Write out the command to the device */
+		int readcmd;
+
+		if (column >= mtd->writesize) {
+			/* OOB area */
+			column -= mtd->writesize;
+			readcmd = NAND_CMD_READOOB;
+		} else if (column < 256) {
+			/* First 256 bytes --> READ0 */
+			readcmd = NAND_CMD_READ0;
+		} else {
+			column -= 256;
+			readcmd = NAND_CMD_READ1;
+		}
+		chip->cmd_ctrl(mtd, readcmd, ctrl);
+		ctrl &= ~NAND_CTRL_CHANGE;
 	}
 
 	/* Command latch cycle */
@@ -920,7 +827,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		ctrl &= ~NAND_CTRL_CHANGE;
 
 		/* Only output a single addr cycle for 8bits opcodes. */
-		if (!nand_opcode_8bits(command))
+		if (is_lp && !nand_opcode_8bits(command))
 			chip->cmd_ctrl(mtd, column >> 8, ctrl);
 	}
 	if (page_addr != -1) {
@@ -939,7 +846,6 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	switch (command) {
 
 	case NAND_CMD_NONE:
-	case NAND_CMD_CACHEDPROG:
 	case NAND_CMD_PAGEPROG:
 	case NAND_CMD_ERASE1:
 	case NAND_CMD_ERASE2:
@@ -949,9 +855,17 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_SET_FEATURES:
 		return;
 
+	case NAND_CMD_CACHEDPROG:
+		if (is_lp)
+			return;
+		break;
+
 	case NAND_CMD_RNDIN:
-		nand_ccs_delay(chip);
-		return;
+		if (is_lp) {
+			nand_ccs_delay(chip);
+			return;
+		}
+		break;
 
 	case NAND_CMD_RESET:
 		if (chip->dev_ready)
@@ -966,40 +880,44 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		return;
 
 	case NAND_CMD_RNDOUT:
-		/* No ready / busy check necessary */
-		chip->cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
-			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-			       NAND_NCE | NAND_CTRL_CHANGE);
-
-		nand_ccs_delay(chip);
-		return;
+		if (is_lp) {
+			/* No ready / busy check necessary */
+			chip->cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
+				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+			chip->cmd_ctrl(mtd, NAND_CMD_NONE,
+				NAND_NCE | NAND_CTRL_CHANGE);
+
+			nand_ccs_delay(chip);
+			return;
+		}
+		break;
 
 	case NAND_CMD_READ0:
 		/*
 		 * READ0 is sometimes used to exit GET STATUS mode. When this
 		 * is the case no address cycles are requested, and we can use
-		 * this information to detect that READSTART should not be
-		 * issued.
+		 * this information to detect that that we should not wait for
+		 * the device to be ready and READSTART should not be issued.
 		 */
 		if (column == -1 && page_addr == -1)
 			return;
 
-		chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
-			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-			       NAND_NCE | NAND_CTRL_CHANGE);
-
-		/* This applies to read commands */
-	default:
-		/*
-		 * If we don't have access to the busy pin, we apply the given
-		 * command delay.
-		 */
-		if (!chip->dev_ready) {
-			udelay(chip->chip_delay);
-			return;
+		if (is_lp) {
+			chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
+				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+			chip->cmd_ctrl(mtd, NAND_CMD_NONE,
+				NAND_NCE | NAND_CTRL_CHANGE);
 		}
+		/* Read commands must wait */
+		break;
+	}
+	/*
+	 * If we don't have access to the busy pin, we apply the given command
+	 * delay.
+	 */
+	if (!chip->dev_ready) {
+		udelay(chip->chip_delay);
+		return;
 	}
 
 	/*
@@ -5180,16 +5098,6 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		chip->ecc_step_ds = 512;
 	} else if (chip->parameters.onfi.version >= 21 &&
 		(le16_to_cpu(p->features) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
-
-		/*
-		 * The nand_flash_detect_ext_param_page() uses the
-		 * Change Read Column command which maybe not supported
-		 * by the chip->cmdfunc. So try to update the chip->cmdfunc
-		 * now. We do not replace user supplied command function.
-		 */
-		if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
-			chip->cmdfunc = nand_command_lp;
-
 		/* The Extended Parameter Page is supported since ONFI 2.1. */
 		if (nand_flash_detect_ext_param_page(chip, p))
 			pr_warn("Failed to detect ONFI extended param page\n");
@@ -5686,10 +5594,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	chip->badblockbits = 8;
 	chip->erase = single_erase;
 
-	/* Do not replace user supplied command function! */
-	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
-		chip->cmdfunc = nand_command_lp;
-
 	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 		maf_id, dev_id);
 	pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
-- 
2.14.1
