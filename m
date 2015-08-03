Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMKe4-00056C-T0
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 18:39:33 +0000
Message-Id: <cover.1438626500.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Mon, 3 Aug 2015 20:28:20 +0200
Subject: [PATCH v2 0/6] fix error checking in spi-nor read and write functions
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
  "Bean Huo 霍斌斌" <beanhuo@micron.com>, linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org, Hou Zhiqiang <B48286@freescale.com>,
  shijie.huang@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This is update of the spi-nor patchset that implements error checking in SPI
transfers.

It's been pointed out that the first patch is too big so I split it into
smaller incremental patches.

With these patches writing to NOR flash connected to a SPI controller with
transfer size limitation should work properly.

Also when a transfer fails it should be now reported all the way to the
userspace rather than silently ignored.

Thanks

Michal

Michal Suchanek (6):
  mtd: spi-nor: change return value of read/write
  mtd: m25p80: Add read/write error check and return
  mtd: fsl-quadspi: update read/write function prototype
  mtd: spi-nor: check return value from read/write
  mtd: spi-nor: stop passing around retlen
  mtd: spi-nor: simplify write loop

 drivers/mtd/devices/m25p80.c      | 33 ++++++++++------
 drivers/mtd/spi-nor/fsl-quadspi.c | 29 +++++++-------
 drivers/mtd/spi-nor/spi-nor.c     | 79 ++++++++++++++++++++++-----------------
 include/linux/mtd/spi-nor.h       |  8 ++--
 4 files changed, 84 insertions(+), 65 deletions(-)

-- 
2.1.4
