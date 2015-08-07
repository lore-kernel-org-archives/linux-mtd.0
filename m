Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNnq4-0002b5-C7
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 20:02:02 +0000
Date: 7 Aug 2015 20:01:31 -0000
Message-Id: <cover.1438977111.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 0/6] Add error checking in spi-nor read and write
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>, Marek Vasut <marex@denx.de>,
  Ben Hutchings <ben@decadent.org.uk>, Huang Shijie <b32955@freescale.com>,
  Gabor Juhos <juhosg@openwrt.org>, "Bean Huo 霍斌斌" <beanhuo@micron.com>,
  linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, ,
  Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

this is patchset which implements checking for SPI transfer errors in spi-nor.

With this you get an error rather than bunch of zeroes when a transfer fails
and you get correct operation on SPI controllers that truncate long transfers.

Since the only comment to the patchset was that it introduces a warning when
all patches are not applied I resend with this issue fixed.

Thanks

Michal

Michal Suchanek (6):
  mtd: spi-nor: change return value of read/write
  mtd: m25p80: return amount of data transferred or error in read/write
  mtd: fsl-quadspi: return amount of data read/written or error
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
