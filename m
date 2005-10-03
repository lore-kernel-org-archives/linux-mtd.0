Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMQHJ-0006Eo-Mt
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 09:22:56 -0400
Message-ID: <434130A3.2090908@ru.mvista.com>
Date: Mon, 03 Oct 2005 17:22:43 +0400
From: Vitaly Bordug <vbordug@ru.mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary="------------030202000001080305020304"
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD NAND: Fix ECC errors in au1550nd.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030202000001080305020304
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit

David,
This patch fixes ECC errors by automatic CS assertion in the driver.
We still use manual drive of CS only during READ CYCLE and READ OOB
CYCLE, while overriding CS right after third address byte latch and
finishing override after first data byte read.

  From the Nand read page cycle timings (Toshiba Datasheet) - we have to
keep CS active from third address byte latch to the end of the cycle.
It seems that static controller drives CS to low after fourth address
byte latch - this interrupts the read cycle.
We must manually keep CS in active state from third address byte latch
to second data byte read, not during all read page cycles. And when we
drive CS manualy - we have to disable interrupts to prevent simultaneous
CS-s activation (NAND, PCMCIA,NOR CS).

Always at your disposal for clarifications.

Signed-off-by: Konstantin Baidarov <kbaidarov@ru.mvista.com>
Signed-off-by: Vitaly Bordug <vbordug@ru.mvista.com>

-- 
Sincerely,
Vitaly



--------------030202000001080305020304
Content-Type: text/x-patch;
 name="common_db1550_nand_2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="common_db1550_nand_2.patch"

Index: linux-2.6.10/drivers/mtd/nand/au1550nd.c
===================================================================
--- linux-2.6.10.orig/drivers/mtd/nand/au1550nd.c
+++ linux-2.6.10/drivers/mtd/nand/au1550nd.c
@@ -19,6 +19,8 @@
 #include <linux/mtd/partitions.h>
 #include <asm/io.h>
 
+#include <linux/interrupt.h>
+
 /* fixme: this is ugly */
 #if LINUX_VERSION_CODE > KERNEL_VERSION(2, 6, 0)
 #include <asm/mach-au1x00/au1000.h>
@@ -81,6 +83,47 @@ const static struct mtd_partition partit
 
 
 /**
+ * au_nand_select_chip_override - [DEFAULT] control CE line
+ * @mtd:	MTD device structure
+ * @chip:	chipnumber to select, -1 for deselect
+ *
+ * Default select function for 1 chip devices.
+ */
+static void au_nand_select_chip_override(struct mtd_info *mtd, int chip)
+{
+	struct nand_chip *this = mtd->priv;
+	switch(chip) {
+	case -1:
+		this->hwcontrol(mtd, NAND_CTL_CLRNCE);
+		break;
+	case 0:
+		this->hwcontrol(mtd, NAND_CTL_SETNCE);
+		break;
+
+	default:
+		BUG();
+	}
+}
+
+
+/*
+ * Wait for the ready pin, after a command
+ * The timeout is catched later.
+ */
+static void au_nand_wait_ready(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+	unsigned long	timeo = jiffies + 2;
+
+	/* wait until command is processed or timeout occures */
+	do {
+		if (this->dev_ready(mtd))
+			return;
+	} while (time_before(jiffies, timeo));
+}
+
+
+/**
  * au_read_byte -  read one byte from the chip
  * @mtd:	MTD device structure
  *
@@ -336,6 +379,144 @@ int au1550_device_ready(struct mtd_info 
 	return ret;
 }
 
+/**
+ * au_select_chip - Do not drive CS manual by default.
+ *	Nand flash controller do that automatically.
+ 	We use manual CS drive only in NAND_CMD_READ0 and NAND_CMD_READOOB.
+ * @mtd:	MTD device structure
+ * @chip:	chipnumber to select, -1 for deselect
+ *
+ * Default select function for 1 chip devices.
+ */
+static void au_select_chip(struct mtd_info *mtd, int chip)
+{
+
+}
+
+/**
+ * nand_command - [DEFAULT] Send command to NAND device
+ * @mtd:	MTD device structure
+ * @command:	the command to be sent
+ * @column:	the column address for this command, -1 if none
+ * @page_addr:	the page address for this command, -1 if none
+ *
+ * Send command to NAND device. This function is used for small page
+ * devices (256/512 Bytes per page)
+ */
+static void au_command (struct mtd_info *mtd, unsigned command, int column, int page_addr)
+{
+	register struct nand_chip *this = mtd->priv;
+	unsigned long g_cpu_flags_cmd;
+
+	/* Begin command latch cycle */
+	this->hwcontrol(mtd, NAND_CTL_SETCLE);
+	/*
+	 * Write out the command to the device.
+	 */
+	if (command == NAND_CMD_SEQIN) {
+		int readcmd;
+
+		if (column >= mtd->oobblock) {
+			/* OOB area */
+			column -= mtd->oobblock;
+			readcmd = NAND_CMD_READOOB;
+		} else if (column < 256) {
+			/* First 256 bytes --> READ0 */
+			readcmd = NAND_CMD_READ0;
+		} else {
+			column -= 256;
+			readcmd = NAND_CMD_READ1;
+		}
+		this->write_byte(mtd, readcmd);
+	}
+	this->write_byte(mtd, command);
+
+	/* Set ALE and clear CLE to start address cycle */
+	this->hwcontrol(mtd, NAND_CTL_CLRCLE);
+
+	if (column != -1 || page_addr != -1) {
+		this->hwcontrol(mtd, NAND_CTL_SETALE);
+
+		/* Serially input address */
+		if (column != -1) {
+			/* Adjust columns for 16 bit buswidth */
+			if (this->options & NAND_BUSWIDTH_16)
+				column >>= 1;
+			this->write_byte(mtd, column);
+		}
+		if (page_addr != -1) {
+			this->write_byte(mtd, (unsigned char) (page_addr & 0xff));
+			this->write_byte(mtd, (unsigned char) ((page_addr >> 8) & 0xff));
+
+			if( (command == NAND_CMD_READ0) || (command == NAND_CMD_READOOB) ){
+				save_flags(g_cpu_flags_cmd);
+				cli();
+				au_nand_select_chip_override( mtd, 0 );
+			}
+
+
+			/* One more address cycle for devices > 32MiB */
+			if (this->chipsize > (32 << 20))
+				this->write_byte(mtd, (unsigned char) ((page_addr >> 16) & 0x0f));
+		}
+		/* Latch in address */
+		this->hwcontrol(mtd, NAND_CTL_CLRALE);
+	}
+
+	/*
+	 * program and erase have their own busy handlers
+	 * status and sequential in needs no delay
+	*/
+	switch (command) {
+
+	case NAND_CMD_PAGEPROG:
+	case NAND_CMD_ERASE1:
+	case NAND_CMD_ERASE2:
+	case NAND_CMD_SEQIN:
+	case NAND_CMD_STATUS:
+		return;
+
+	case NAND_CMD_RESET:
+		if (this->dev_ready)
+			break;
+		udelay(this->chip_delay);
+		this->hwcontrol(mtd, NAND_CTL_SETCLE);
+		this->write_byte(mtd, NAND_CMD_STATUS);
+		this->hwcontrol(mtd, NAND_CTL_CLRCLE);
+		while ( !(this->read_byte(mtd) & NAND_STATUS_READY));
+		return;
+
+	/* This applies to read commands */
+	default:
+		/*
+		 * If we don't have access to the busy pin, we apply the given
+		 * command delay
+		*/
+		if (!this->dev_ready) {
+			udelay (this->chip_delay);
+
+			if( (command == NAND_CMD_READ0) || (command == NAND_CMD_READOOB) )
+				goto au1550_nand_restore_flags;
+			return;
+		}
+	}
+	/* Apply this short delay always to ensure that we do wait tWB in
+	 * any case on any machine. */
+	ndelay (100);
+
+	au_nand_wait_ready(mtd);
+
+	if( (command == NAND_CMD_READ0) || (command == NAND_CMD_READOOB) )
+		goto au1550_nand_restore_flags;
+
+	return;
+
+au1550_nand_restore_flags:
+	au_nand_select_chip_override( mtd, -1 );
+	restore_flags(g_cpu_flags_cmd);
+}
+
+
 /*
  * Main initialization routine
  */
@@ -431,6 +612,9 @@ int __init au1550_init (void)
 	this->read_buf = (!nand_width) ? au_read_buf16 : au_read_buf;
 	this->verify_buf = (!nand_width) ? au_verify_buf16 : au_verify_buf;
 
+	this->select_chip = au_select_chip;
+	this->cmdfunc = au_command;
+
 	/* Scan to find existence of the device */
 	if (nand_scan (au1550_mtd, 1)) {
 		retval = -ENXIO;

--------------030202000001080305020304--
