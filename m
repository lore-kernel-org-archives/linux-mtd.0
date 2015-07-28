Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK16Z-00023u-Ia
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 09:23:25 +0000
Message-Id: <cover.1438074682.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Tue, 28 Jul 2015 11:11:22 +0200
Subject: [PATCH 0/2] Add error checking to spi-nor read and write
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

I am working with half-broken SPI drivers which sometimes fail and spi-nor
completely ignores that leading to silent data corruption.

With these patches I get actual I/O errors when something fails.

Testing on different hardware would be appreciated, especially fsl-qspi.

I don't recall any comment on these patches so I am resending them separately.

Thanks

Michal

Michal Suchanek (2):
  mtd: spi-nor: rework spi nor read and write.
  mtd: spi-nor: rework write loop

 drivers/mtd/devices/m25p80.c      | 33 ++++++++++------
 drivers/mtd/spi-nor/fsl-quadspi.c | 29 +++++++-------
 drivers/mtd/spi-nor/spi-nor.c     | 79 +++++++++++++++++++++------------------
 include/linux/mtd/spi-nor.h       |  8 ++--
 4 files changed, 83 insertions(+), 66 deletions(-)

-- 
2.1.4
