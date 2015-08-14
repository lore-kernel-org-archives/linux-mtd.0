Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQBD3-0007B2-Hd
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 09:23:35 +0000
Date: 14 Aug 2015 09:23:06 -0000
Message-Id: <cover.1439543572.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v4 0/7] Add spi-nor SPI transfer error handling
To: Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com,
  David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
  "Bean Huo 霍斌斌, " <beanhuo@micron.com>, linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

with these patches SPI transfer errors are not silently ignored but rather
reported to spi-nor users.

This should prevent silently dropping data to the floor in cases when the SPI
transfer fails and the failure is detected.

It has been pointed out that MTD users do not handle the case when data is read
only partially so this version adds the last patch which handles this in
spi-nor.

Thanks

Michal

Michal Suchanek (7):
  mtd: spi-nor: change return value of read/write
  mtd: m25p80: return amount of data transferred or error in read/write
  mtd: fsl-quadspi: return amount of data read/written or error
  mtd: spi-nor: check return value from read/write
  mtd: spi-nor: stop passing around retlen
  mtd: spi-nor: simplify write loop
  mtd: spi-nor: add read loop

 drivers/mtd/devices/m25p80.c      | 33 +++++++++------
 drivers/mtd/spi-nor/fsl-quadspi.c | 29 ++++++-------
 drivers/mtd/spi-nor/spi-nor.c     | 85 +++++++++++++++++++++++----------------
 include/linux/mtd/spi-nor.h       |  8 ++--
 4 files changed, 91 insertions(+), 64 deletions(-)

-- 
2.1.4
