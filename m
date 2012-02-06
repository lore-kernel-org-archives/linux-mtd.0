Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RuWRx-0003ab-Qo
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2012 21:50:14 +0000
Received: by pbdx9 with SMTP id x9so6391817pbd.36
 for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2012 13:50:12 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v5] mtd: nand: write BBM to OOB even with flash-based BBT
Date: Mon,  6 Feb 2012 13:44:00 -0800
Message-Id: <1328564640-21417-1-git-send-email-computersforpeace@gmail.com>
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

Currently, the flash-based BBT implementation writes bad block data only
to its flash-based table and not to the OOB marker area. Then, as new bad
blocks are marked over time, the OOB markers become incomplete and the
flash-based table becomes the only source of current bad block
information. This becomes an obvious problem when, for example:

 * bootloader cannot read the flash-based BBT format
 * BBT is corrupted and the flash must be rescanned for bad
   blocks; we want to remember bad blocks that were marked from Linux

So to keep the bad block markers in sync with the flash-based BBT, this
patch changes the default so that we write bad block markers to the proper
OOB area on each block in addition to flash-based BBT. Comments are
updated, expanded, and/or relocated as necessary.

The new flash-based BBT procedure for marking bad blocks:
 (1) erase the affected block, to allow OOB marker to be written cleanly
 (2) update in-memory BBT
 (3) write bad block marker to OOB area of affected block
 (4) update flash-based BBT
Note that we retain the first error encountered in (3) or (4), finish the
procedures, and dump the error in the end.

This should handle power cuts gracefully enough. (1) and (2) are mostly
harmless (note that (1) will not erase an already-recognized bad block).
The OOB and BBT may be "out of sync" if we experience power loss bewteen
(3) and (4), but we can reasonably expect that on next boot, subsequent
I/O operations will discover that the block should be marked bad again,
thus re-syncing the OOB and BBT.

Note that this is a change from the previous default flash-based BBT
behavior. If your system cannot support writing bad block markers to OOB,
use the new NAND_BBT_NO_OOB_BBM option (in combination with
NAND_BBT_USE_FLASH and NAND_BBT_NO_OOB).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
There are some small issues that may still be addressed in the future, like
checking the OOB before erase/rewrite. This patch still stands as-is,
though.

v5: Revise patch description to reflect discussion. Move BUG_ON() to
    nand_scan_tail().
v4: Re-order operations so we write BBM before BBT. This should help with
    power cuts. Option for old behavior changed to NAND_BBT_NO_OOB_BBM, 
    use in chip->bbt_options.
v3: Writing to flash-based BBT and to BBM is still default, but
    there is a new option NAND_NO_WRITE_OOB that can prevent writing the
    BBM as well as prevent all other OOB writes.
v2: Explain potential power cut issues and remove option for retaining
    old behavior.
v1: Implement option NAND_BBT_WRITE_BBM that causes marker to be written
    to both BBT + BBM.

 drivers/mtd/nand/nand_base.c |   46 ++++++++++++++++++++++++++++-------------
 include/linux/mtd/bbm.h      |    5 ++++
 2 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2d010e4..5822e3a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -386,15 +386,23 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
  * @ofs: offset from device start
  *
  * This is the default implementation, which can be overridden by a hardware
- * specific driver.
+ * specific driver. We try operations in the following order, according to our
+ * bbt_options (NAND_BBT_NO_OOB_BBM and NAND_BBT_USE_FLASH):
+ *  (1) erase the affected block, to allow OOB marker to be written cleanly
+ *  (2) update in-memory BBT
+ *  (3) write bad block marker to OOB area of affected block
+ *  (4) update flash-based BBT
+ * Note that we retain the first error encountered in (3) or (4), finish the
+ * procedures, and dump the error in the end.
 */
 static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd->priv;
 	uint8_t buf[2] = { 0, 0 };
-	int block, ret, i = 0;
+	int block, res, ret = 0, i = 0;
+	int write_oob = !(chip->bbt_options & NAND_BBT_NO_OOB_BBM);
 
-	if (!(chip->bbt_options & NAND_BBT_USE_FLASH)) {
+	if (write_oob) {
 		struct erase_info einfo;
 
 		/* Attempt erase before marking OOB */
@@ -407,23 +415,17 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 	/* Get block number */
 	block = (int)(ofs >> chip->bbt_erase_shift);
+	/* Mark block bad in memory-based BBT */
 	if (chip->bbt)
 		chip->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
 
-	/* Do we have a flash based bad block table? */
-	if (chip->bbt_options & NAND_BBT_USE_FLASH)
-		ret = nand_update_bbt(mtd, ofs);
-	else {
+	/* Write bad block marker to OOB */
+	if (write_oob) {
 		struct mtd_oob_ops ops;
 		loff_t wr_ofs = ofs;
 
 		nand_get_device(chip, mtd, FL_WRITING);
 
-		/*
-		 * Write to first/last page(s) if necessary. If we write to more
-		 * than one location, the first error encountered quits the
-		 * procedure.
-		 */
 		ops.datbuf = NULL;
 		ops.oobbuf = buf;
 		ops.ooboffs = chip->badblockpos;
@@ -435,18 +437,28 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		}
 		ops.mode = MTD_OPS_PLACE_OOB;
 
+		/* Write to first/last page(s) if necessary */
 		if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 			wr_ofs += mtd->erasesize - mtd->writesize;
 		do {
-			ret = nand_do_write_oob(mtd, wr_ofs, &ops);
+			res = nand_do_write_oob(mtd, wr_ofs, &ops);
+			if (!ret)
+				ret = res;
 
 			i++;
 			wr_ofs += mtd->writesize;
-		} while (!ret && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE) &&
-				i < 2);
+		} while ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
 
 		nand_release_device(mtd);
 	}
+
+	/* Update flash-based bad block table */
+	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
+		res = nand_update_bbt(mtd, ofs);
+		if (!ret)
+			ret = res;
+	}
+
 	if (!ret)
 		mtd->ecc_stats.badblocks++;
 
@@ -3222,6 +3234,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 	int i;
 	struct nand_chip *chip = mtd->priv;
 
+	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
+	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
+			!(chip->bbt_options & NAND_BBT_USE_FLASH));
+
 	if (!(chip->options & NAND_OWN_BUFFERS))
 		chip->buffers = kmalloc(sizeof(*chip->buffers), GFP_KERNEL);
 	if (!chip->buffers)
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index c4eec22..650ef35 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -112,6 +112,11 @@ struct nand_bbt_descr {
 #define NAND_BBT_USE_FLASH	0x00020000
 /* Do not store flash based bad block table in OOB area; store it in-band */
 #define NAND_BBT_NO_OOB		0x00040000
+/*
+ * Do not write new bad block markers to OOB; useful, e.g., when ECC covers
+ * entire spare area. Must be used with NAND_BBT_USE_FLASH.
+ */
+#define NAND_BBT_NO_OOB_BBM	0x00080000
 
 /*
  * Flag set by nand_create_default_bbt_descr(), marking that the nand_bbt_descr
-- 
1.7.5.4
