Date: Wed, 5 Dec 2007 10:08:11 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][MTD][OneNAND] Consolidate OneNAND operation order
Message-ID: <20071205010811.GA30509@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Consolidate OneNAND operation order as OneNAND Spec.
It also doesn't break previous operation order.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 1b0b320..a3f51d5 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -182,8 +182,7 @@ static int onenand_buffer_address(int dataram1, int sectors, int count)
 static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t len)
 {
 	struct onenand_chip *this = mtd->priv;
-	int value, readcmd = 0, block_cmd = 0;
-	int block, page;
+	int value, block, page;
 
 	/* Address translation */
 	switch (cmd) {
@@ -198,7 +197,6 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 	case ONENAND_CMD_ERASE:
 	case ONENAND_CMD_BUFFERRAM:
 	case ONENAND_CMD_OTP_ACCESS:
-		block_cmd = 1;
 		block = (int) (addr >> this->erase_shift);
 		page = -1;
 		break;
@@ -240,11 +238,9 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		value = onenand_block_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS1);
 
-		if (block_cmd) {
-			/* Select DataRAM for DDP */
-			value = onenand_bufferram_address(this, block);
-			this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
-		}
+		/* Select DataRAM for DDP */
+		value = onenand_bufferram_address(this, block);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
 	}
 
 	if (page != -1) {
@@ -256,7 +252,6 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		case ONENAND_CMD_READ:
 		case ONENAND_CMD_READOOB:
 			dataram = ONENAND_SET_NEXT_BUFFERRAM(this);
-			readcmd = 1;
 			break;
 
 		default:
@@ -273,12 +268,6 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		/* Write 'BSA, BSC' of DataRAM */
 		value = onenand_buffer_address(dataram, sectors, count);
 		this->write_word(value, this->base + ONENAND_REG_START_BUFFER);
-
-		if (readcmd) {
-			/* Select DataRAM for DDP */
-			value = onenand_bufferram_address(this, block);
-			this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
-		}
 	}
 
 	/* Interrupt clear */
