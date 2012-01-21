Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RoSiU-0007dy-Nq
 for linux-mtd@lists.infradead.org; Sat, 21 Jan 2012 04:38:15 +0000
Received: by mail-iy0-f177.google.com with SMTP id w33so2339146iag.36
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2012 20:38:14 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 1/2] mtd: nand: move SCANLASTPAGE handling to the correct
 code block
Date: Fri, 20 Jan 2012 20:38:03 -0800
Message-Id: <1327120684-7066-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1327120684-7066-1-git-send-email-computersforpeace@gmail.com>
References: <1327120684-7066-1-git-send-email-computersforpeace@gmail.com>
Cc: Angus CLARK <angus.clark@st.com>, Dan Carpenter <error27@gmail.com>,
 Kulikov Vasiliy <segooon@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Peter Wippich <pewi@gw-instruments.de>, Gabor Juhos <juhosg@openwrt.org>,
 Guillaume LECERF <glecerf@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As nand_default_block_markbad() is becoming more complex, it helps to
have code appear only in its relevant codepath(s). Here, the calculation
of `ofs' based on NAND_BBT_SCANLASTPAGE is only useful on paths where we
write bad block markers to OOB. We move the condition/calculation closer
to the `write' operation and update the comment to more correctly
describe the operation.

The variable `wr_ofs' is also used to help isolate our calculation of
the "write" offset from the usage of `ofs' to represent the eraseblock
offset. This will become useful when we reorder operations in the next
patch.

This patch should make no functional change.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c6603d4..b902066 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -411,9 +411,6 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		nand_erase_nand(mtd, &einfo, 0);
 	}
 
-	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
-		ofs += mtd->erasesize - mtd->writesize;
-
 	/* Get block number */
 	block = (int)(ofs >> chip->bbt_erase_shift);
 	if (chip->bbt)
@@ -424,11 +421,12 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		ret = nand_update_bbt(mtd, ofs);
 	else {
 		struct mtd_oob_ops ops;
+		loff_t wr_ofs = ofs;
 
 		nand_get_device(chip, mtd, FL_WRITING);
 
 		/*
-		 * Write to first two pages if necessary. If we write to more
+		 * Write to first/last page(s) if necessary. If we write to more
 		 * than one location, the first error encountered quits the
 		 * procedure.
 		 */
@@ -442,11 +440,14 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 			ops.len = ops.ooblen = 1;
 		}
 		ops.mode = MTD_OPS_PLACE_OOB;
+
+		if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
+			wr_ofs += mtd->erasesize - mtd->writesize;
 		do {
-			ret = nand_do_write_oob(mtd, ofs, &ops);
+			ret = nand_do_write_oob(mtd, wr_ofs, &ops);
 
 			i++;
-			ofs += mtd->writesize;
+			wr_ofs += mtd->writesize;
 		} while (!ret && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE) &&
 				i < 2);
 
-- 
1.7.5.4
