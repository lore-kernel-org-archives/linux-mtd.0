Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkLlP-0004CR-DO
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 20:24:16 +0000
Received: by iadk27 with SMTP id k27so8399335iad.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 12:24:13 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 0/6] NAND BBM + BBT updates
Date: Mon,  9 Jan 2012 12:23:26 -0800
Message-Id: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
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

This patch series is an update to a previous patch (that has split into
a few patches) with a few additional patches at the end. The important
segments of this series involve the default steps for marking new bad
blocks when using a flash-based BBT. The new default behavior will write
to the BBT as well as attempting to write a BBM to the OOB area of the
bad block. See the patch descriptions for details.

The first patch, regarding NAND_NO_WRITE_OOB, is a first attempt at
satisfying Sebastian's concerns that some systems utilize the entire OOB
area for ECC, and so we need an option to prevent writing markers to
OOB. My attempt to prevent other OOB writes may be misguided,
incomplete, flawed in some other way, or some combination of the three.
Please provide constructive criticism.

v3: writing to flash-based BBT and to BBM is still default, but
    there is a new option NAND_NO_WRITE_OOB that can prevent writing the
    BBM as well as prevent all other OOB writes.

Brian Norris (6):
  mtd: nand: add NAND_NO_WRITE_OOB option
  mtd: nand: write bad block marker by default even with BBT
  mtd: nand: erase block before marking bad
  mtd: nand: fix SCAN2NDPAGE check for BBM
  mtd: nand: differentiate 1- vs. 2-byte writes when marking bad blocks
  mtd: nand: correct comment on nand_chip badblockbits

 drivers/mtd/nand/nand_base.c |   79 ++++++++++++++++++++++++++++-------------
 include/linux/mtd/nand.h     |   11 +++++-
 2 files changed, 63 insertions(+), 27 deletions(-)

-- 
1.7.5.4
