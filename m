Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIB3I-0007Sn-Hx
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 10:50:02 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mtd: nand: Fix return type of __DIVIDE() when called with
 32-bit
Date: Mon, 14 May 2018 12:49:37 +0200
Message-Id: <1526294977-32303-1-git-send-email-geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The __DIVIDE() macro checks whether it is called with a 32-bit or 64-bit
dividend, to select the appropriate divide-and-round-up routine.
As the check uses the ternary operator, the result will always be
promoted to a type that can hold both results, i.e. unsigned long long.

When using this result in a division on a 32-bit system, this may lead
to link errors like:

    ERROR: "__udivdi3" [drivers/mtd/nand/raw/nand.ko] undefined!

Fix this by casting the result of the 64-bit division to the type of the
dividend.

Fixes: 8878b126df769831 ("mtd: nand: add ->exec_op() implementation")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
This fixes the root cause of the link failure seen with
m68k/allmodconfig since commit 3057fcef385348fe ("mtd: rawnand: Make
sure we wait tWB before polling the STATUS reg").

An alternative mitigation was posted as "[PATCH] m68k: Implement
ndelay() as an inline function to force type checking/casting"
(https://lkml.org/lkml/2018/5/13/102).
---
 include/linux/mtd/rawnand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5dad59b312440a9c..d06dc428ea0102ae 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -871,7 +871,7 @@ struct nand_op_instr {
 #define __DIVIDE(dividend, divisor) ({					\
 	sizeof(dividend) == sizeof(u32) ?				\
 		DIV_ROUND_UP(dividend, divisor) :			\
-		DIV_ROUND_UP_ULL(dividend, divisor);			\
+		(__typeof__(dividend))DIV_ROUND_UP_ULL(dividend, divisor); \
 		})
 #define PSEC_TO_NSEC(x) __DIVIDE(x, 1000)
 #define PSEC_TO_MSEC(x) __DIVIDE(x, 1000000000)
-- 
2.7.4
