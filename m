Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPNC3-0000oW-Gg
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 00:13:20 +0000
Received: by pbbrq13 with SMTP id rq13so206959pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 17:13:17 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] mtd: nandsim: remove autoincrement code
Date: Tue,  1 May 2012 17:12:53 -0700
Message-Id: <1335917575-14953-1-git-send-email-computersforpeace@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND layer always has NAND_NO_AUTOINCR set, so we will never utilize the
AUTOINCR code in nandsim. We will be removing the NAND_NO_AUTOINCR option soon,
and so kill this code as well.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nandsim.c |   28 +++-------------------------
 1 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 261f478..6cc8fbf 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -268,7 +268,6 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 #define OPT_PAGE512      0x00000002 /* 512-byte  page chips */
 #define OPT_PAGE2048     0x00000008 /* 2048-byte page chips */
 #define OPT_SMARTMEDIA   0x00000010 /* SmartMedia technology chips */
-#define OPT_AUTOINCR     0x00000020 /* page number auto incrementation is possible */
 #define OPT_PAGE512_8BIT 0x00000040 /* 512-byte page chips with 8-bit bus width */
 #define OPT_PAGE4096     0x00000080 /* 4096-byte page chips */
 #define OPT_LARGEPAGE    (OPT_PAGE2048 | OPT_PAGE4096) /* 2048 & 4096-byte page chips */
@@ -594,7 +593,7 @@ static int init_nandsim(struct mtd_info *mtd)
 		ns->options |= OPT_PAGE256;
 	}
 	else if (ns->geom.pgsz == 512) {
-		ns->options |= (OPT_PAGE512 | OPT_AUTOINCR);
+		ns->options |= OPT_PAGE512;
 		if (ns->busw == 8)
 			ns->options |= OPT_PAGE512_8BIT;
 	} else if (ns->geom.pgsz == 2048) {
@@ -663,8 +662,6 @@ static int init_nandsim(struct mtd_info *mtd)
         for (i = 0; nand_flash_ids[i].name != NULL; i++) {
                 if (second_id_byte != nand_flash_ids[i].id)
                         continue;
-		if (!(nand_flash_ids[i].options & NAND_NO_AUTOINCR))
-			ns->options |= OPT_AUTOINCR;
 	}
 
 	if (ns->busw == 16)
@@ -1936,20 +1933,8 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 	if (ns->regs.count == ns->regs.num) {
 		NS_DBG("read_byte: all bytes were read\n");
 
-		/*
-		 * The OPT_AUTOINCR allows to read next consecutive pages without
-		 * new read operation cycle.
-		 */
-		if ((ns->options & OPT_AUTOINCR) && NS_STATE(ns->state) == STATE_DATAOUT) {
-			ns->regs.count = 0;
-			if (ns->regs.row + 1 < ns->geom.pgnum)
-				ns->regs.row += 1;
-			NS_DBG("read_byte: switch to the next page (%#x)\n", ns->regs.row);
-			do_state_action(ns, ACTION_CPY);
-		}
-		else if (NS_STATE(ns->nxstate) == STATE_READY)
+		if (NS_STATE(ns->nxstate) == STATE_READY)
 			switch_state(ns);
-
 	}
 
 	return outb;
@@ -2203,14 +2188,7 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	ns->regs.count += len;
 
 	if (ns->regs.count == ns->regs.num) {
-		if ((ns->options & OPT_AUTOINCR) && NS_STATE(ns->state) == STATE_DATAOUT) {
-			ns->regs.count = 0;
-			if (ns->regs.row + 1 < ns->geom.pgnum)
-				ns->regs.row += 1;
-			NS_DBG("read_buf: switch to the next page (%#x)\n", ns->regs.row);
-			do_state_action(ns, ACTION_CPY);
-		}
-		else if (NS_STATE(ns->nxstate) == STATE_READY)
+		if (NS_STATE(ns->nxstate) == STATE_READY)
 			switch_state(ns);
 	}
 
-- 
1.7.5.4.2.g519b1
