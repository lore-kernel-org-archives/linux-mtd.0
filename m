From: Baruch Siach <baruch@tkos.co.il>
To: Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH 0/3] mx25: NAND support
Date: Thu, 14 Jan 2010 11:24:12 +0200
Message-Id: <cover.1263460321.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series add support for NAND chips on the i.MX25 platform, using the 
recently merged support for this platform in the mxc_nand driver.

I tested this code on the i.MX25 PDK platform.

Baruch Siach (3):
  mtd: mxc_nand: add MX25 to Kconfig
  mx25: add NAND support
  mx25pdk: add NAND device support

 arch/arm/mach-mx25/devices.c          |   20 ++++++++++++++++++++
 arch/arm/mach-mx25/devices.h          |    1 +
 arch/arm/mach-mx25/mx25pdk.c          |    7 +++++++
 arch/arm/plat-mxc/include/mach/mx25.h |    2 ++
 drivers/mtd/nand/Kconfig              |    2 +-
 5 files changed, 31 insertions(+), 1 deletions(-)
