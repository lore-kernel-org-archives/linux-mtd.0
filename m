Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkLmO-0004Da-3x
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 20:25:16 +0000
Received: by mail-iy0-f177.google.com with SMTP id k27so8400220iad.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 12:25:16 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 3/6] mtd: nand: erase block before marking bad
Date: Mon,  9 Jan 2012 12:23:29 -0800
Message-Id: <1326140612-26323-4-git-send-email-computersforpeace@gmail.com>
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

Many NAND flash systems (especially those with MLC NAND) cannot be
reliably written twice in a row. For instance, when marking a bad block,
the block may already have data written to it, and so we should attempt
to erase the block before writing a bad block marker to its OOB region.

We can ignore erase failures, since the block may be bad such that it
cannot be erased properly; we still attempt to write zeros to its spare
area.

Note that the erase must be performed before the BBT is updated, since
otherwise, nand_erase_nand() would not allow us to erase our "bad
block."

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ead2a12..d5dbe0a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -397,6 +397,16 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	BUG_ON((chip->options & NAND_NO_WRITE_OOB) &&
 			!(chip->bbt_options & NAND_BBT_USE_FLASH));
 
+	/* Erase before writing to OOB and before BBT is updated */
+	if (!(chip->options & NAND_NO_WRITE_OOB)) {
+		struct erase_info einfo;
+		memset(&einfo, 0, sizeof(einfo));
+		einfo.mtd = mtd;
+		einfo.addr = ofs;
+		einfo.len = 1 << chip->phys_erase_shift;
+		nand_erase_nand(mtd, &einfo, 0);
+	}
+
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
-- 
1.7.5.4
