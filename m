Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6csz-00062W-0F
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 07:40:26 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH resend] i.MX53 Nand support
Date: Wed, 29 Aug 2012 09:40:15 +0200
Message-Id: <1346226019-23560-1-git-send-email-s.hauer@pengutronix.de>
Cc: Roland Stigge <stigge@antcom.de>, linux-arm-kernel@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

The following patches add i.MX53 and dt support to mxc_nand. This
is only a resent based on v3.6-rc3 as it seems this series slipped
through the cracks last time I posted it.

So Artem, if there are no objections, please consider applying up to
3/4, I would then take 4/4 through my tree.

Sascha

The following changes since commit fea7a08acb13524b47711625eebea40a0ede69a0:

  Linux 3.6-rc3 (2012-08-22 13:29:06 -0700)

are available in the git repository at:

  git://git.pengutronix.de/git/imx/linux-2.6.git tags/mtd-imx53-nand

for you to fetch changes up to 587450da74aa7db28fe0e9a9ee2a3816140fa8f4:

  ARM i.MX5: Add nand oftree support (2012-08-29 09:33:47 +0200)

----------------------------------------------------------------
Add i.MX53 and dt support to the mxc_nand driver

----------------------------------------------------------------
Sascha Hauer (4):
      mtd nand mxc_nand: Use managed resources
      mtd nand mxc_nand: swap iomem resource order
      mtd nand mxc_nand: add i.MX53 support
      ARM i.MX5: Add nand oftree support

 arch/arm/boot/dts/imx51.dtsi                  |    7 ++
 arch/arm/boot/dts/imx53.dtsi                  |    7 ++
 arch/arm/mach-imx/clk-imx51-imx53.c           |    2 +
 arch/arm/plat-mxc/devices/platform-mxc_nand.c |   11 +-
 drivers/mtd/nand/mxc_nand.c                   |  137 ++++++++++++++-----------
 5 files changed, 97 insertions(+), 67 deletions(-)
