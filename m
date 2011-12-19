Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RclLa-0007Ms-Qz
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2011 22:06:15 +0000
Received: by iadk27 with SMTP id k27so9184427iad.36
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2011 14:06:12 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: nand: write bad block marker even with BBT
Date: Mon, 19 Dec 2011 14:03:51 -0800
Message-Id: <1324332231-30884-1-git-send-email-computersforpeace@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Baruch Siach <baruch@tkos.co.il>,
 Dan Carpenter <error27@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Barry Song <barry.song@analog.com>, Gabor Juhos <juhosg@openwrt.org>,
 Guillaume LECERF <glecerf@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sukumar Ghorai <s-ghorai@ti.com>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>, Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>,
 Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, the flash-based BBT implementation writes bad block data only
to its flash-based table and not to the OOB marker area. Then, as new
bad blocks are marked over time, the OOB markers become out of date and
the flash-based table becomes the only source of current bad block
information. This can be a problem when:

 * bootloader cannot read the flash-based BBT format
 * BBT is corrupted and the flash must be rescanned for bad
   blocks; we want to remember bad blocks that were marked from Linux

In an attempt to keep the bad block markers in sync with the flash-based
BBT, this patch changes the default so that we write bad block markers
to the proper OOB area on each block in addition to flash-based BBT.

Theoretically, the bad block table and the OOB markers can still get out
of sync if the system experiences a power cut between writing the BBT to
flash and writing the OOB marker to a newly-marked bad block. However,
this is a relatively unlikely event, as new bad blocks shouldn't appear
frequently.

Note that this is a change from the previous default flash-based BBT
behavior. If any contributors rely on the old behavior, they are welcome
to introduce an option flag for it.

Adapted from code by Matthieu Castet.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: Explain potential power cut issues and remove option for retaining
    old behavior. I CC'd various MTD contributors; speak up if the new
    default is unacceptable!

drivers/mtd/nand/nand_base.c |   59 +++++++++++++++++++++++------------------
 1 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 35b4565..dfa017e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -393,6 +393,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	struct nand_chip *chip = mtd->priv;
 	uint8_t buf[2] = { 0, 0 };
 	int block, ret, i = 0;
+	struct mtd_oob_ops ops;
 
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
@@ -403,34 +404,40 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		chip->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
 
 	/* Do we have a flash based bad block table? */
-	if (chip->bbt_options & NAND_BBT_USE_FLASH)
+	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
 		ret = nand_update_bbt(mtd, ofs);
-	else {
-		struct mtd_oob_ops ops;
+		if (ret)
+			return ret;
+	}
 
-		nand_get_device(chip, mtd, FL_WRITING);
+	/*
+	 * Write bad block marker to OOB
+	 * Note that a flash-based BBT (when used) can become out of sync with
+	 * OOB markers if a power cut occurs here. See:
+	 *   http://lists.infradead.org/pipermail/linux-mtd/2011-December/038851.html
+	 */
 
-		/*
-		 * Write to first two pages if necessary. If we write to more
-		 * than one location, the first error encountered quits the
-		 * procedure. We write two bytes per location, so we dont have
-		 * to mess with 16 bit access.
-		 */
-		ops.len = ops.ooblen = 2;
-		ops.datbuf = NULL;
-		ops.oobbuf = buf;
-		ops.ooboffs = chip->badblockpos & ~0x01;
-		ops.mode = MTD_OPS_PLACE_OOB;
-		do {
-			ret = nand_do_write_oob(mtd, ofs, &ops);
-
-			i++;
-			ofs += mtd->writesize;
-		} while (!ret && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE) &&
-				i < 2);
+	nand_get_device(chip, mtd, FL_WRITING);
+
+	/*
+	 * Write to first two pages if necessary. If we write to more than one
+	 * location, the first error encountered quits the procedure. We write
+	 * two bytes per location, so we dont have to mess with 16 bit access.
+	 */
+	ops.len = ops.ooblen = 2;
+	ops.datbuf = NULL;
+	ops.oobbuf = buf;
+	ops.ooboffs = chip->badblockpos & ~0x01;
+	ops.mode = MTD_OPS_PLACE_OOB;
+	do {
+		ret = nand_do_write_oob(mtd, ofs, &ops);
+
+		i++;
+		ofs += mtd->writesize;
+	} while (!ret && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
+
+	nand_release_device(mtd);
 
-		nand_release_device(mtd);
-	}
 	if (!ret)
 		mtd->ecc_stats.badblocks++;
 
-- 
1.7.5.4
