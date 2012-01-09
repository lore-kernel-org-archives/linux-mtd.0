Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkLmD-0004G9-Es
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 20:25:06 +0000
Received: by ggnp4 with SMTP id p4so1889968ggn.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 12:25:04 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 2/6] mtd: nand: write bad block marker by default even with
 BBT
Date: Mon,  9 Jan 2012 12:23:28 -0800
Message-Id: <1326140612-26323-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
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
 Florian Fainelli <florian@openwrt.org>, Artem Bityutskiy <dedekind1@gmail.com>,
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
to its flash-based table and not to the OOB marker area. Then, as new
bad blocks are marked over time, the OOB markers become out of date and
the flash-based table becomes the only source of current bad block
information. This can be a problem when, for example:

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
behavior. To restore old behavior (and to generally prevent writing to
OOB area), use the NAND_NO_WRITE_OOB options (in combination with
NAND_BBT_USE_FLASH and NAND_BBT_NO_OOB).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b9dbf0c..ead2a12 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -392,7 +392,10 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd->priv;
 	uint8_t buf[2] = { 0, 0 };
-	int block, ret, i = 0;
+	int block, ret = 0, i = 0;
+
+	BUG_ON((chip->options & NAND_NO_WRITE_OOB) &&
+			!(chip->bbt_options & NAND_BBT_USE_FLASH));
 
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
@@ -405,7 +408,9 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	/* Do we have a flash based bad block table? */
 	if (chip->bbt_options & NAND_BBT_USE_FLASH)
 		ret = nand_update_bbt(mtd, ofs);
-	else {
+
+	/* Write bad block marker to OOB */
+	if (!(chip->options & NAND_NO_WRITE_OOB)) {
 		struct mtd_oob_ops ops;
 
 		nand_get_device(chip, mtd, FL_WRITING);
-- 
1.7.5.4
