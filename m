Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7rMg-0005L9-Ca
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 18:24:44 +0000
Received: by mail-pb0-f49.google.com with SMTP id xb4so4797978pbc.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2013 11:24:20 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: m25p80: Micron SPI uses Macronix-style 4-byte addressing
Date: Fri,  9 Aug 2013 11:24:06 -0700
Message-Id: <1376072646-26089-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 stable@vger.kernel.org, Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For SPI NOR flash that are larger than 128Mbit (16MiB), we need 4 bytes
of address space to reach the entire flash; however, the original SPI
flash protocol used only 3 bytes for the address. So far, the practice
for handling this has been either to use new command opcodes that are
defined to use 4 bytes for their address, or to use special
mode-switching command to configure all traditionally-3-byte-address
commands to take 4 bytes instead.

Macronix and Spansion developed two incompatible methods for
entering/exiting "4-byte address mode." Micron flash uses the Macronix
method (OPCODE_{EN4B,EX4B}), not the Spansion method.

This patch solves addressing issues on Micron n25q256a and provides the
ability to support other future Micron SPI flash >16MiB.

Quoting a Micron representative:

  "Majority of our NOR that needs 4-byte addressing (256Mb or 32MB and
   higher) enter and exit 4byte through B7h and E9h commands. The
   N25Q256A7xxx and N25Q512A7xxx parts do not support 4-byte addressing
   mode via B7h or E9h command."

They further clarified that those that don't support the enter/exit
opcodes (B7h/E9h) are manufactured specifically to come up by default in
4-byte mode. We don't need to treat those parts any diffently, as they
will discard the EN4B opcode as a no-op.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Marek Vasut <marex@denx.de>
Cc: <stable@vger.kernel.org> # 3.10+
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index b5190c4..a759c1f 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -169,6 +169,7 @@ static inline int set_4byte(struct m25p *flash, u32 jedec_id, int enable)
 {
 	switch (JEDEC_MFR(jedec_id)) {
 	case CFI_MFR_MACRONIX:
+	case CFI_MFR_ST: /* Micron, actually */
 	case 0xEF /* winbond */:
 		flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
 		return spi_write(flash->spi, flash->command, 1);
-- 
1.8.1.2
