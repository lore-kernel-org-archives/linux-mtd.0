Received: from albert.telenet-ops.be ([195.130.137.90])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3Sis-0003Jb-Gq
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2014 15:49:43 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brian Norris <computersforpeace@gmail.com>,
 Sourav Poddar <sourav.poddar@ti.com>, Marek Vasut <marex@denx.de>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: m25p80: Use OPCODE_QUAD_READ_4B for 4-byte addressing
Date: Wed, 15 Jan 2014 16:48:55 +0100
Message-Id: <1389800935-6468-1-git-send-email-geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>

commit 3487a63955c34ea508bcf4ca5131ddd953876e2d ("drivers: mtd: m25p80: add
quad read support") in -next added both the 3-byte OPCODE_QUAD_READ and the
4-byte OPCODE_QUAD_READ_4B, but incorrectly uses OPCODE_QUAD_READ for both
3-byte and 4-byte addressing.

Use OPCODE_QUAD_READ_4B in the 4-byte case to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
---
 drivers/mtd/devices/m25p80.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index bf358326c335..0e9e78acc677 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -1258,7 +1258,7 @@ pr_info("jid = 0x%p\n", jid);
 			/* Dedicated 4-byte command set */
 			switch (flash->flash_read) {
 			case M25P80_QUAD:
-				flash->read_opcode = OPCODE_QUAD_READ;
+				flash->read_opcode = OPCODE_QUAD_READ_4B;
 				break;
 			case M25P80_FAST:
 				flash->read_opcode = OPCODE_FAST_READ_4B;
-- 
1.7.9.5
