Received: from forward.atmel.no ([194.19.124.53])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QA0Xa-0002it-IS
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 13:55:31 +0000
Received: from norsmtp01.norway.atmel.com (unknown [10.191.254.110])
	by forward.atmel.no (Postfix) with SMTP id 6493E28173
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 15:55:28 +0200 (CEST)
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: add switch to support NAND flash on big endian bus
Date: Wed, 13 Apr 2011 15:55:18 +0200
Message-Id: <1302702918-6050-2-git-send-email-hans-christian.egtvedt@atmel.com>
In-Reply-To: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
Cc: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a new kconfig symbol to the MTD NAND system, MTD_NAND_BE_BUS.
This symbol is used by the nand base to properly convert the data read from the
bus into the format the CPU expects.

The patch fixes 16-bit NAND flash support on big endian architectures (at least
AVR32) with NAND flash hooked up to a big endian external bus.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 drivers/mtd/nand/Kconfig     |    8 ++++++++
 drivers/mtd/nand/nand_base.c |    8 ++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index edec457..bb3a54a 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -22,6 +22,14 @@ menuconfig MTD_NAND
 
 if MTD_NAND
 
+config MTD_NAND_BE_BUS
+	bool "NAND device on big endian bus"
+	default n
+	help
+	  This option will assume data read from the bus is in big endian
+	  format. This is vital when reading command values from the bus, as
+	  only the lower 8 bit are in use then.
+
 config MTD_NAND_VERIFY_WRITE
 	bool "Verify NAND page writes"
 	help
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..bbb0c1d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -180,7 +180,11 @@ static uint8_t nand_read_byte(struct mtd_info *mtd)
 static uint8_t nand_read_byte16(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
+#if CONFIG_MTD_NAND_BE_BUS
+	return (uint8_t) be16_to_cpu(readw(chip->IO_ADDR_R));
+#else
 	return (uint8_t) cpu_to_le16(readw(chip->IO_ADDR_R));
+#endif
 }
 
 /**
@@ -364,7 +368,11 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 	if (chip->options & NAND_BUSWIDTH_16) {
 		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos & 0xFE,
 			      page);
+#if CONFIG_MTD_NAND_BE_BUS
+		bad = be16_to_cpu(chip->read_word(mtd));
+#else
 		bad = cpu_to_le16(chip->read_word(mtd));
+#endif
 		if (chip->badblockpos & 0x1)
 			bad >>= 8;
 		else
-- 
1.7.1
