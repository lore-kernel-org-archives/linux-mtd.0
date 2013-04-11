Received: from mail-pd0-f176.google.com ([209.85.192.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQCyL-0001AJ-T0
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2013 08:35:11 +0000
Received: by mail-pd0-f176.google.com with SMTP id r11so734022pdi.7
 for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2013 01:35:08 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
Date: Thu, 11 Apr 2013 01:34:57 -0700
Message-Id: <1365669299-6830-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Traditionally, the command set used by SPI flash only supported a 3-byte
address. However, large SPI flash (>= 32MB, or 256Mbit) require 4 bytes
to address the entire flash. Most manufacturers have supplied a mode
switch (via a "bank register writer", or a "enable 4-byte mode"
command), which tells the flash to expect 4 address cycles from now on,
instead of 3. This mode remains until power is cut, the reset line is
triggered (on packages where present), or a command is sent to reset the
flash or to reset the 3-byte addressing mode.

As an alternative, some flash manufacturers have developed a new command
set that accept a full 4-byte address. They can be used orthogonally to
any of the modes; that is, they can be used when the flash is in either
3-byte or 4-byte address mode.

Now, there are a number of reasons why the "stateful" 4-byte address
mode switch may not be acceptable. For instance, some SoC's perform a
dumb boot sequence in which they only send 3-byte read commands to the
flash. However, if an unexpected reset occurs, the flash chip cannot be
guaranteed to return to its 3-byte mode. Thus, the SoC controller and
flash will not understand each other. (One might consider hooking up the
aforementioned reset pin to the system reset line so that any system
reset will reset the flash to 3-byte mode, but some packages do not
provide this pin. And in some other packages, one must choose between
having a reset pin and having enough pins for 4-output QSPI support.
It is an error prone process choosing a flash that will support a
hardware reset pin!)

This patch provides support for the new stateless command set, so that
we can avoid the problems that come with a stateful addressing mode
change. The flash can be left in "3-byte mode" while still accessing the
entire flash.

Note that Spansion supports this command set on all its large flash
(e.g, S25FL512S), and Macronix has begun supporting this command set on
some new flash (e.g., MX25L25635F). For the moment, I don't know how to
differentiate the Macronix that don't support this command set (e.g.,
MX25L25635E) from those that do, so this patch only supports Spansion.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Marek Vasut <marex@denx.de>
---
v2: fix compiler errors
    fix logical error, where I was setting the read opcode (based on the value
    of flash->fast_read) before the fast_read setting was computed

 drivers/mtd/devices/m25p80.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 2f3d2a5..74bf3ae 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -48,6 +48,12 @@
 #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
 
+/* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
+#define	OPCODE_NORM_READ_4B	0x13	/* Read data bytes (low frequency) */
+#define	OPCODE_FAST_READ_4B	0x0c	/* Read data bytes (high frequency) */
+#define	OPCODE_PP_4B		0x12	/* Page program (up to 256 bytes) */
+#define	OPCODE_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
+
 /* Used for SST flashes only. */
 #define	OPCODE_BP		0x02	/* Byte program */
 #define	OPCODE_WRDI		0x04	/* Write disable */
@@ -84,6 +90,8 @@ struct m25p {
 	u16			page_size;
 	u16			addr_width;
 	u8			erase_opcode;
+	u8			read_opcode;
+	u8			program_opcode;
 	u8			*command;
 	bool			fast_read;
 };
@@ -371,7 +379,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	 */
 
 	/* Set up the write data buffer. */
-	opcode = flash->fast_read ? OPCODE_FAST_READ : OPCODE_NORM_READ;
+	opcode = flash->read_opcode;
 	flash->command[0] = opcode;
 	m25p_addr2cmd(flash, from, flash->command);
 
@@ -422,7 +430,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	write_enable(flash);
 
 	/* Set up the opcode in the write buffer. */
-	flash->command[0] = OPCODE_PP;
+	flash->command[0] = flash->program_opcode;
 	m25p_addr2cmd(flash, to, flash->command);
 
 	page_offset = to & (flash->page_size - 1);
@@ -1037,15 +1045,30 @@ static int m25p_probe(struct spi_device *spi)
 	flash->fast_read = true;
 #endif
 
+	/* Default commands */
+	flash->read_opcode = flash->fast_read ?
+		OPCODE_FAST_READ :
+		OPCODE_NORM_READ;
+	flash->program_opcode = OPCODE_PP;
+
 	if (info->addr_width)
 		flash->addr_width = info->addr_width;
-	else {
+	else if (flash->mtd.size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
-		if (flash->mtd.size > 0x1000000) {
-			flash->addr_width = 4;
-			set_4byte(flash, info->jedec_id, 1);
+		flash->addr_width = 4;
+		if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
+			/* Dedicated 4-byte command set */
+			flash->read_opcode = flash->fast_read ?
+				OPCODE_FAST_READ_4B :
+				OPCODE_NORM_READ_4B;
+			flash->program_opcode = OPCODE_PP_4B;
+			/* No small sector erase for 4-byte command set */
+			flash->erase_opcode = OPCODE_SE_4B;
+			flash->mtd.erasesize = info->sector_size;
 		} else
-			flash->addr_width = 3;
+			set_4byte(flash, info->jedec_id, 1);
+	} else {
+		flash->addr_width = 3;
 	}
 
 	dev_info(&spi->dev, "%s (%lld Kbytes)\n", id->name,
-- 
1.8.2
