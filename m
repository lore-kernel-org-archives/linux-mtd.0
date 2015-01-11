Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAIFh-0003Hn-7G
 for linux-mtd@lists.infradead.org; Sun, 11 Jan 2015 13:08:22 +0000
Received: by mail-pd0-f171.google.com with SMTP id y13so25923337pdi.2
 for <linux-mtd@lists.infradead.org>; Sun, 11 Jan 2015 05:07:59 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nandsim: remove unused STATE_DATAOUT_STATUS_M and
 OPT_SMARTMEDIA
Date: Sun, 11 Jan 2015 22:07:48 +0900
Message-Id: <1420981668-16545-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no path to switch to STATE_DATAOUT_STATUS_M state, and
OPT_SMARTMEDIA is unused.

This is leftover from commit 0be718e5525a73557e76ea1c05b8001dde507049
("mtd: nand: remove a bunch of unused commands").

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/nandsim.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index b9a5e8e..1e31ae0 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -247,7 +247,6 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 #define STATE_DATAOUT          0x00001000 /* waiting for page data output */
 #define STATE_DATAOUT_ID       0x00002000 /* waiting for ID bytes output */
 #define STATE_DATAOUT_STATUS   0x00003000 /* waiting for status output */
-#define STATE_DATAOUT_STATUS_M 0x00004000 /* waiting for multi-plane status output */
 #define STATE_DATAOUT_MASK     0x00007000 /* data output states mask */
 
 /* Previous operation is done, ready to accept new requests */
@@ -271,7 +270,6 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 #define OPT_ANY          0xFFFFFFFF /* any chip supports this operation */
 #define OPT_PAGE512      0x00000002 /* 512-byte  page chips */
 #define OPT_PAGE2048     0x00000008 /* 2048-byte page chips */
-#define OPT_SMARTMEDIA   0x00000010 /* SmartMedia technology chips */
 #define OPT_PAGE512_8BIT 0x00000040 /* 512-byte page chips with 8-bit bus width */
 #define OPT_PAGE4096     0x00000080 /* 4096-byte page chips */
 #define OPT_LARGEPAGE    (OPT_PAGE2048 | OPT_PAGE4096) /* 2048 & 4096-byte page chips */
@@ -1110,8 +1108,6 @@ static char *get_state_name(uint32_t state)
 			return "STATE_DATAOUT_ID";
 		case STATE_DATAOUT_STATUS:
 			return "STATE_DATAOUT_STATUS";
-		case STATE_DATAOUT_STATUS_M:
-			return "STATE_DATAOUT_STATUS_M";
 		case STATE_READY:
 			return "STATE_READY";
 		case STATE_UNKNOWN:
@@ -1800,7 +1796,6 @@ static void switch_state(struct nandsim *ns)
 				break;
 
 			case STATE_DATAOUT_STATUS:
-			case STATE_DATAOUT_STATUS_M:
 				ns->regs.count = ns->regs.num = 0;
 				break;
 
@@ -1940,7 +1935,6 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 		}
 
 		if (NS_STATE(ns->state) == STATE_DATAOUT_STATUS
-			|| NS_STATE(ns->state) == STATE_DATAOUT_STATUS_M
 			|| NS_STATE(ns->state) == STATE_DATAOUT) {
 			int row = ns->regs.row;
 
-- 
1.9.1
