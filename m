Received: from mail-qa0-x22f.google.com ([2607:f8b0:400d:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYghE-0005Od-IN
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 19:01:05 +0000
Received: by mail-qa0-f47.google.com with SMTP id m5so3635903qaj.6
 for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2014 12:00:43 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 09/11] mtd: st_spi_fsm: begin using spi-nor.h opcodes
Date: Fri, 11 Apr 2014 12:00:04 -0700
Message-Id: <1397242806-7575-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
References: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Many of the serial_flash_cmds.h opcodes are duplicated with spi-nor.h.
Let's begin to unify them.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Marek Vasut <marex@denx.de>
---
v3: no change

 drivers/mtd/devices/serial_flash_cmds.h | 20 --------------------
 drivers/mtd/devices/st_spi_fsm.c        |  9 +++++----
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/devices/serial_flash_cmds.h b/drivers/mtd/devices/serial_flash_cmds.h
index 82fa1687a2d3..f59a125295d0 100644
--- a/drivers/mtd/devices/serial_flash_cmds.h
+++ b/drivers/mtd/devices/serial_flash_cmds.h
@@ -13,25 +13,12 @@
 #define _MTD_SERIAL_FLASH_CMDS_H
 
 /* Generic Flash Commands/OPCODEs */
-#define SPINOR_OP_WREN		0x06
-#define SPINOR_OP_WRDI		0x04
-#define SPINOR_OP_RDID		0x9f
-#define SPINOR_OP_RDSR		0x05
 #define SPINOR_OP_RDSR2		0x35
-#define SPINOR_OP_WRSR		0x01
-#define SPINOR_OP_SE_4K		0x20
-#define SPINOR_OP_SE_32K	0x52
-#define SPINOR_OP_SE		0xd8
-#define SPINOR_OP_CHIPERASE	0xc7
 #define SPINOR_OP_WRVCR		0x81
 #define SPINOR_OP_RDVCR		0x85
 
 /* JEDEC Standard - Serial Flash Discoverable Parmeters (SFDP) Commands */
-#define SPINOR_OP_READ		0x03	/* READ */
-#define SPINOR_OP_READ_FAST	0x0b	/* FAST READ */
-#define SPINOR_OP_READ_1_1_2	0x3b	/* DUAL OUTPUT READ */
 #define SPINOR_OP_READ_1_2_2	0xbb	/* DUAL I/O READ */
-#define SPINOR_OP_READ_1_1_4	0x6b	/* QUAD OUTPUT READ */
 #define SPINOR_OP_READ_1_4_4	0xeb	/* QUAD I/O READ */
 
 #define SPINOR_OP_WRITE		0x02	/* PAGE PROGRAM */
@@ -40,15 +27,8 @@
 #define SPINOR_OP_WRITE_1_1_4	0x32	/* QUAD INPUT PROGRAM */
 #define SPINOR_OP_WRITE_1_4_4	0x12	/* QUAD INPUT EXT PROGRAM */
 
-#define SPINOR_OP_EN4B_ADDR	0xb7	/* Enter 4-byte address mode */
-#define SPINOR_OP_EX4B_ADDR	0xe9	/* Exit 4-byte address mode */
-
 /* READ commands with 32-bit addressing */
-#define SPINOR_OP_READ4		0x13
-#define SPINOR_OP_READ4_FAST	0x0c
-#define SPINOR_OP_READ4_1_1_2	0x3c
 #define SPINOR_OP_READ4_1_2_2	0xbc
-#define SPINOR_OP_READ4_1_1_4	0x6c
 #define SPINOR_OP_READ4_1_4_4	0xec
 
 /* Configuration flags */
diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index fc193a94307d..7cc49ba78f68 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -19,6 +19,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/spi-nor.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -522,7 +523,7 @@ static int stfsm_mx25_en_32bit_addr_seq(struct stfsm_seq *seq)
 {
 	seq->seq_opc[0] = (SEQ_OPC_PADS_1 |
 			   SEQ_OPC_CYCLES(8) |
-			   SEQ_OPC_OPCODE(SPINOR_OP_EN4B_ADDR) |
+			   SEQ_OPC_OPCODE(SPINOR_OP_EN4B) |
 			   SEQ_OPC_CSDEASSERT);
 
 	seq->seq[0] = STFSM_INST_CMD1;
@@ -630,7 +631,7 @@ static struct stfsm_seq stfsm_seq_erase_chip = {
 		 SEQ_OPC_OPCODE(SPINOR_OP_WREN) | SEQ_OPC_CSDEASSERT),
 
 		(SEQ_OPC_PADS_1 | SEQ_OPC_CYCLES(8) |
-		 SEQ_OPC_OPCODE(SPINOR_OP_CHIPERASE) | SEQ_OPC_CSDEASSERT),
+		 SEQ_OPC_OPCODE(SPINOR_OP_CHIP_ERASE) | SEQ_OPC_CSDEASSERT),
 	},
 	.seq = {
 		STFSM_INST_CMD1,
@@ -665,7 +666,7 @@ static struct stfsm_seq stfsm_seq_write_status = {
 static int stfsm_n25q_en_32bit_addr_seq(struct stfsm_seq *seq)
 {
 	seq->seq_opc[0] = (SEQ_OPC_PADS_1 | SEQ_OPC_CYCLES(8) |
-			   SEQ_OPC_OPCODE(SPINOR_OP_EN4B_ADDR));
+			   SEQ_OPC_OPCODE(SPINOR_OP_EN4B));
 	seq->seq_opc[1] = (SEQ_OPC_PADS_1 | SEQ_OPC_CYCLES(8) |
 			   SEQ_OPC_OPCODE(SPINOR_OP_WREN) |
 			   SEQ_OPC_CSDEASSERT);
@@ -788,7 +789,7 @@ static int stfsm_write_fifo(struct stfsm *fsm, const uint32_t *buf,
 static int stfsm_enter_32bit_addr(struct stfsm *fsm, int enter)
 {
 	struct stfsm_seq *seq = &fsm->stfsm_seq_en_32bit_addr;
-	uint32_t cmd = enter ? SPINOR_OP_EN4B_ADDR : SPINOR_OP_EX4B_ADDR;
+	uint32_t cmd = enter ? SPINOR_OP_EN4B : SPINOR_OP_EX4B;
 
 	seq->seq_opc[0] = (SEQ_OPC_PADS_1 |
 			   SEQ_OPC_CYCLES(8) |
-- 
1.8.3.2
