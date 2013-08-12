Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8pHK-0005GD-OU
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 10:23:11 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] m25p80 / fast read
Date: Mon, 12 Aug 2013 12:22:22 +0200
Message-Id: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following adds support for the mr25h10 chip to to the m25p80
driver.

This driver currently has the problem that it unconditionally uses
the fast_read command once it's enabled in Kconfig which of course
leads to problems with multiboard kernels. This series adds a flag
to the chip specific data to solve this. Also some unnecessary ifdefs
are removed.

Sascha

----------------------------------------------------------------
Markus Niebel (1):
      mtd: m25p80: add support for mr25h10

Sascha Hauer (3):
      mtd: m25p80: Pass flags through CAT25_INFO macro
      mtd: m25p80: make CONFIG_M25PXX_USE_FAST_READ safe to enable
      mtd: m25p80: remove unnecessary ifdef

 drivers/mtd/devices/m25p80.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)
