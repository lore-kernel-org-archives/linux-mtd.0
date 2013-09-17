Received: from mail-ea0-x230.google.com ([2a00:1450:4013:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLzP2-0003or-Cu
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 17:49:34 +0000
Received: by mail-ea0-f176.google.com with SMTP id q16so2895425ead.21
 for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2013 10:49:08 -0700 (PDT)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: m25p80: Fix 4 byte addressing mode for Micron devices.
Date: Tue, 17 Sep 2013 19:48:22 +0200
Message-Id: <1379440103-5167-1-git-send-email-eliedebrauwer@gmail.com>
In-Reply-To: <20130917014706.GL4550@ld-irv-0074.broadcom.com>
References: <20130917014706.GL4550@ld-irv-0074.broadcom.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to the datasheet for Micron n25q256a (N25Q256A13ESF40F) 4-byte
addressing mode should be entered as follows:

<quote>
To enter or exit the 4-byte address mode, the WRITE ENABLE command
must be executed to set the write enable latch bit to 1. (Note: The
WRITE ENABLE command must NOT be executed on the N25Q256A83ESF40x and
N25Q256A83E1240x devices.) S# must be driven LOW. The effect of the
command is immediate; after the command has been executed, the write
enable latch bit is cleared to 0.
</quote>

Micron's portable way to perform this for all types of Micron flash
is to first issue a write enable, then switch the addressing mode
followed by a write disable to avoid leaving the flash in a write-
able state.
---
 drivers/mtd/devices/m25p80.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 26b14f9..272d483 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -169,8 +169,16 @@ static inline int write_disable(struct m25p *flash)
 static inline int set_4byte(struct m25p *flash, u32 jedec_id, int enable)
 {
 	switch (JEDEC_MFR(jedec_id)) {
-	case CFI_MFR_MACRONIX:
 	case CFI_MFR_ST: /* Micron, actually */
+	{
+		int status;
+		write_enable(flash);
+		flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
+		status = spi_write(flash->spi, flash->command, 1);
+		write_disable(flash);
+		return status;
+	}
+	case CFI_MFR_MACRONIX:
 	case 0xEF /* winbond */:
 		flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
 		return spi_write(flash->spi, flash->command, 1);
-- 
1.7.10.4
