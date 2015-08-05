From: Sheng Yong <shengyong1@huawei.com>
To: <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 2/5] MTD: nandsim: fix column address size of large page
Date: Wed, 5 Aug 2015 08:55:51 +0000
Message-ID: <1438764954-36976-3-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
References: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If NAND flash has large page, its default cmdfunc is changed to
nand_command_lp() during scanning. When READID command is send, nand
tries to write 2 bytes as column address, so we have to tell nandsim
to read one more byte.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/nand/nandsim.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 24a50e5..5938be4 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -238,7 +238,7 @@ MODULE_PARM_DESC(numchips,	 "Number of chips of the NAND flash (1 by default)");
 #define STATE_ADDR_PAGE        0x00000010 /* full (row, column) address is accepted */
 #define STATE_ADDR_SEC         0x00000020 /* sector address was accepted */
 #define STATE_ADDR_COLUMN      0x00000030 /* column address was accepted */
-#define STATE_ADDR_ZERO        0x00000040 /* one byte zero address was accepted */
+#define STATE_ADDR_ZERO        0x00000040 /* zero address was accepted */
 #define STATE_ADDR_MASK        0x00000070 /* address states mask */
 
 /* During data input/output the simulator is in these states */
@@ -1904,7 +1904,14 @@ static void switch_state(struct nandsim *ns)
 				break;
 
 			case STATE_ADDR_ZERO:
-				ns->regs->num = 1;
+				/* For flash which has large page,
+				 * its column consists of 2 bytes,
+				 * so 2 bytes are written to flash
+				 */
+				if (nsmtd->writesize > 512)
+					ns->regs->num = 2;
+				else
+					ns->regs->num = 1;
 				break;
 
 			case STATE_ADDR_COLUMN:
@@ -2073,7 +2080,14 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 					ns->regs->num = ns->geom.secaddrbytes;
 					break;
 				case STATE_ADDR_ZERO:
-					ns->regs->num = 1;
+					/* For flash which has large page,
+					 * its column consists of 2 bytes,
+					 * so 2 bytes are written to flash
+					 */
+					if (mtd->writesize > 512)
+						ns->regs->num = 2;
+					else
+						ns->regs->num = 1;
 					break;
 				default:
 					BUG();
-- 
1.8.3.4
