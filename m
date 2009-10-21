Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0c4b-0006G5-Mp
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:22:02 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC] mxc nand controller updates
Date: Wed, 21 Oct 2009 16:13:07 +0200
Message-Id: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
Cc: Vladimir Barinov <vova.barinov@gmail.com>, mathieu.berland@eads.com,
	jbe@pengutronix.de, Eric Benard <ebenard@eukrea.com>, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Here are several patches for the mxc nand controller. At the end
of this series we are able to use this driver with the i.MX25/35
SoCs. Please review and test if you do not want to see your boards
break ;)

Sascha

The following changes since commit 012abeea669ea49636cf952d13298bb68654146a:
  Linus Torvalds (1):
        Linux 2.6.32-rc5

are available in the git repository at:

  git://git.pengutronix.de/git/imx/linux-2.6.git mxc-nand

Sascha Hauer (19):
      Revert "mtd: mxc_nand: fix 2KiB pagesize NAND on i.MX27"
      mxc_nand: cleanup eccoob descriptions
      mxc_nand: cleanup initialization
      mxc_nand: merge send_read_page and send_prog_page
      mxc_nand: introduce mxc_do_addr_cycle
      mxc nand: remove debug param
      mxc nand: remove dead code
      mxc nand: use resource_size()
      mxc nand: use buffers
      mxc nand: simplify command processing
      mxc nand: modify send_page to send all pages, not only one
      mxc_nand: remove unused defines
      mxc_nand: Make main/spare areas runtime configurable
      mxc_nand: Get rid of pagesize_2k flag
      mxc_nand: Add NFC V2 support
      mxc_nand: disable sp_en bit only once
      mxc_nand: Allow flash based bbt
      mxc_nand: remove TROP_US_DELAY
      mxc_nand: use DRIVER_NAME where appropriate

 arch/arm/plat-mxc/include/mach/mxc_nand.h |    3 +-
 drivers/mtd/nand/mxc_nand.c               |  781 +++++++++++------------------
 2 files changed, 297 insertions(+), 487 deletions(-)
