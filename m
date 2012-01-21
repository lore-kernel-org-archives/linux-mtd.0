Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RoSiJ-0007dy-D6
 for linux-mtd@lists.infradead.org; Sat, 21 Jan 2012 04:38:04 +0000
Received: by iagw33 with SMTP id w33so2339146iag.36
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2012 20:38:02 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 0/2] write OOB BBM + flash-based BBT
Date: Fri, 20 Jan 2012 20:38:02 -0800
Message-Id: <1327120684-7066-1-git-send-email-computersforpeace@gmail.com>
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

Hi,

It looks like we have some consensus that:
- OOB markers are not a guaranteed reliable method for tracking bad blocks
- We should work to make flash-based BBT a reliable, primary source of bad
  block information
- There are occasions where having bad block markers in OOB is important,
  so we should make a best effort to write bad block markers even when
  using flash-based BBT
- Some users do not want to write bad block markers to OOB for one reason
  or another; so we provide an option (bbt_options) that will prevent this

Thus, this is yet another iteration of my patch(es) to write bad block data
to both the OOB area and the flash-based BBT when marking new bad blocks.
They try to accomodate for some of the issues brought up in previous
threads. Please comment if more changes are necessary or if I introduced
crazy ones.

This series consists of a small fixup patch followed by the main
substantial patch.

I will highlight a few things here, but see the patch descriptions for
details.

I re-ordered nand_default_block_markbad() so that BBM is written before
BBT, for power cut reasons, and since when available, we mostly use
flash-based BBT as the "primary" source of information.

v4: re-order operations so we write BBM before BBT. This should help with
    power cuts. Option for old behavior changed to NAND_BBT_NO_OOB_BBM,
    use in chip->bbt_options.
v3: writing to flash-based BBT and to BBM is still default, but
    there is a new option NAND_NO_WRITE_OOB that can prevent writing the
    BBM as well as prevent all other OOB writes.

Thanks,
Brian

Brian Norris (2):
  mtd: nand: move SCANLASTPAGE handling to the correct code block
  mtd: nand: write BBM to OOB even with flash-based BBT

 drivers/mtd/nand/nand_base.c |   54 +++++++++++++++++++++++++++--------------
 include/linux/mtd/bbm.h      |    5 ++++
 2 files changed, 40 insertions(+), 19 deletions(-)

-- 
1.7.5.4
