Received: from [210.94.41.89] (helo=party)
	by pentafluge.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1IfW91-0007Zy-Io
	for linux-mtd@lists.infradead.org; Wed, 10 Oct 2007 08:38:16 +0100
Date: Wed, 10 Oct 2007 16:34:50 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [OneNAND] To comply with OneNAND Spec.,
	Arragne the register access order
Message-ID: <20071010073450.GA3036@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It also doesn't break the old OneNAND chips.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |   19 ++++---------------
 1 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index b2c40f6..1f1ac94 100644
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
-- 
1.5.0.6
