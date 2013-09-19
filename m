Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMghM-0001Al-Ne
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:26 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/21] mtd: nand: pxa3xx: Introduce multiple page I/O support
Date: Thu, 19 Sep 2013 13:01:40 -0300
Message-Id: <1379606505-2529-17-git-send-email-ezequiel.garcia@free-electrons.com>
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

As preparation work to fully support large pages, this commit adds
the initial infrastructure to support splitted (aka chunked) I/O
operation. This commit adds support for read, and follow-up patches
will add write support.

When a read (aka READ0) command is issued, the driver loops issuing
the same command until all the requested data is transfered, changing
the 'extended' command field as needed.

For instance, if the driver is required to read a 4 KiB page, using a
chunk size of 2 KiB, the transaction is splitted in:
1. Monolithic read, first 2 KiB page chunk is read
2. Last naked read, second and last 2KiB page chunk is read

If ECC is enabled it is calculated on each chunk transfered and added
at a controller-fixed location after the data chunk that must be
spare area.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 115 +++++++++++++++++++++++++++++++++++------
 1 file changed, 100 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 0dc6fa4..609f66e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -7,6 +7,20 @@
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
+ *
+ * Large pages implementation
+ * --------------------------
+ *
+ * NAND stack expects data in the following format:
+ * ---------------------------
+ * | Data (4K) | Spare | ECC |
+ * ---------------------------
+ *
+ * While NAND controller expects data to be in the following format:
+ * -----------------------------------------------------
+ * | Data (2K) | Spare | ECC | Data (2K) | Spare | ECC |
+ * -----------------------------------------------------
+ *
  */
 
 #include <linux/kernel.h>
@@ -106,6 +120,8 @@
 #define NDCB0_ST_ROW_EN         (0x1 << 26)
 #define NDCB0_AUTO_RS		(0x1 << 25)
 #define NDCB0_CSEL		(0x1 << 24)
+#define NDCB0_EXT_CMD_TYPE_MASK	(0x7 << 29)
+#define NDCB0_EXT_CMD_TYPE(x)	(((x) << 29) & NDCB0_EXT_CMD_TYPE_MASK)
 #define NDCB0_CMD_TYPE_MASK	(0x7 << 21)
 #define NDCB0_CMD_TYPE(x)	(((x) << 21) & NDCB0_CMD_TYPE_MASK)
 #define NDCB0_NC		(0x1 << 20)
@@ -116,6 +132,14 @@
 #define NDCB0_CMD1_MASK		(0xff)
 #define NDCB0_ADDR_CYC_SHIFT	(16)
 
+#define EXT_CMD_TYPE_DISPATCH	6 /* Command dispatch */
+#define EXT_CMD_TYPE_NAKED_RW	5 /* Naked read or Naked write */
+#define EXT_CMD_TYPE_READ	4 /* Read */
+#define EXT_CMD_TYPE_DISP_WR	4 /* Command dispatch with write */
+#define EXT_CMD_TYPE_FINAL	3 /* Final command */
+#define EXT_CMD_TYPE_LAST_RW	1 /* Last naked read/write */
+#define EXT_CMD_TYPE_MONO	0 /* Monolithic read/write */
+
 /* macros for registers read/write */
 #define nand_writel(info, off, val)	\
 	__raw_writel((val), (info)->mmio_base + (off))
@@ -217,6 +241,7 @@ struct pxa3xx_nand_info {
 
 	unsigned int		fifo_size;	/* max. data size in the FIFO */
 	unsigned int		data_size;	/* data to be read from FIFO */
+	unsigned int		chunk_size;	/* split commands chunk size */
 	unsigned int		oob_size;
 	int 			retcode;
 
@@ -279,9 +304,18 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 };
 
 static struct nand_ecclayout ecc_layout_4KB_bch4bit = {
-	.eccbytes = 0,
-	.eccpos = {},
-	.oobfree = {}
+	.eccbytes = 64,
+	.eccpos = {
+		32,  33,  34,  35,  36,  37,  38,  39,
+		40,  41,  42,  43,  44,  45,  46,  47,
+		48,  49,  50,  51,  52,  53,  54,  55,
+		56,  57,  58,  59,  60,  61,  62,  63,
+		96,  97,  98,  99,  100, 101, 102, 103,
+		104, 105, 106, 107, 108, 109, 110, 111,
+		112, 113, 114, 115, 116, 117, 118, 119,
+		120, 121, 122, 123, 124, 125, 126, 127},
+	/* Bootrom looks in bytes 0 & 5 for bad blocks */
+	.oobfree = { {1, 4}, {6, 26}, { 64, 32} }
 };
 
 /* Define a default flash type setting serve as flash detecting only */
@@ -433,7 +467,7 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
 
 static void handle_data_pio(struct pxa3xx_nand_info *info)
 {
-	unsigned int do_bytes = min(info->data_size, info->fifo_size);
+	unsigned int do_bytes = min(info->data_size, info->chunk_size);
 
 	switch (info->state) {
 	case STATE_PIO_WRITING:
@@ -672,7 +706,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 }
 
 static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
-		uint16_t column, int page_addr)
+		int ext_cmd_type, uint16_t column, int page_addr)
 {
 	int addr_cycle, exec_cmd;
 	struct pxa3xx_nand_host *host;
@@ -705,9 +739,20 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 		if (command == NAND_CMD_READOOB)
 			info->buf_start += mtd->writesize;
 
-		/* Second command setting for large pages */
-		if (mtd->writesize >= PAGE_CHUNK_SIZE)
+		/*
+		 * Multiple page read needs an 'extended command type' field,
+		 * which is either naked-read or last-read according to the
+		 * state.
+		 */
+		if (mtd->writesize == PAGE_CHUNK_SIZE) {
 			info->ndcb0 |= NDCB0_DBC | (NAND_CMD_READSTART << 8);
+		} else if (mtd->writesize > PAGE_CHUNK_SIZE) {
+			info->ndcb0 |= NDCB0_DBC | (NAND_CMD_READSTART << 8)
+					| NDCB0_LEN_OVRD
+					| NDCB0_EXT_CMD_TYPE(ext_cmd_type);
+			info->ndcb3 = info->chunk_size +
+				      info->oob_size;
+		}
 
 		set_command_address(info, mtd->writesize, column, page_addr);
 		break;
@@ -796,12 +841,12 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 	return exec_cmd;
 }
 
-static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
+static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, const unsigned command,
 				int column, int page_addr)
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
-	int ret, exec_cmd;
+	int ret, exec_cmd, ext_cmd_type;
 
 	/*
 	 * if this is a x16 device ,then convert the input
@@ -822,14 +867,37 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		nand_writel(info, NDTR1CS0, info->ndtr1cs0);
 	}
 
+	/* Select the extended command for the first command */
+	switch (command) {
+	case NAND_CMD_READ0:
+	case NAND_CMD_READOOB:
+		ext_cmd_type = EXT_CMD_TYPE_MONO;
+		break;
+	}
+
 	prepare_start_command(info, command);
 
-	info->state = STATE_PREPARED;
-	exec_cmd = prepare_set_command(info, command, column, page_addr);
-	if (exec_cmd) {
+	/*
+	 * Prepare the "is ready" completion before starting a command
+	 * transaction sequence. If the command is not executed the
+	 * completion will be completed, see below.
+	 *
+	 * We can do that inside the loop because the command variable
+	 * is invariant and thus so is the exec_cmd.
+	 */
+	atomic_set(&info->is_ready, 0);
+	init_completion(&info->dev_ready);
+	do {
+		info->state = STATE_PREPARED;
+		exec_cmd = prepare_set_command(info, command, ext_cmd_type,
+					       column, page_addr);
+		if (!exec_cmd) {
+			atomic_set(&info->is_ready, 1);
+			complete(&info->dev_ready);
+			break;
+		}
+
 		init_completion(&info->cmd_complete);
-		init_completion(&info->dev_ready);
-		atomic_set(&info->is_ready, 0);
 		pxa3xx_nand_start(info);
 
 		ret = wait_for_completion_timeout(&info->cmd_complete,
@@ -838,8 +906,22 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 			dev_err(&info->pdev->dev, "Wait time out!!!\n");
 			/* Stop State Machine for next command cycle */
 			pxa3xx_nand_stop(info);
+			break;
 		}
-	}
+
+		/* Check if the sequence is complete */
+		if (info->data_size == 0)
+			break;
+
+		if (command == NAND_CMD_READ0 || command == NAND_CMD_READOOB) {
+			/* Last read: issue a 'last naked read' */
+			if (info->data_size == info->chunk_size)
+				ext_cmd_type = EXT_CMD_TYPE_LAST_RW;
+			else
+				ext_cmd_type = EXT_CMD_TYPE_NAKED_RW;
+		}
+	} while (1);
+
 	info->state = STATE_IDLE;
 }
 
@@ -1028,6 +1110,8 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 		host->read_id_bytes = 2;
 	}
 
+	/* Set an initial chunk size */
+	info->chunk_size = info->fifo_size;
 	info->reg_ndcr = ndcr & ~NDCR_INT_MASK;
 	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
 	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
@@ -1234,6 +1318,7 @@ KEEP_CONFIG:
 	        chip->ecc.layout = &ecc_layout_4KB_bch4bit;
 		chip->ecc.strength = chip->ecc_strength_ds;
 		info->ecc_bch = 1;
+		info->chunk_size = 2048;
 	} else if (mtd->writesize <= 2048) {
 		/*
 		 * This is the default ECC Hamming 1-bit strength case,
-- 
1.8.1.5
