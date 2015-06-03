Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0GBq-0003KG-6r
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 21:27:13 +0000
Date: 3 Jun 2015 21:26:39 -0000
Message-Id: <cover.1433364398.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 00/11] Enable access to SPI NOR flash on Samsung Snow board
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
  Mark Rutland <mark.rutland@arm.com>,
  Ian Campbell <ijc+devicetree@hellion.org.uk>,
  Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>,
  Kukjin Kim <kgene@kernel.org>,
  Krzysztof Kozlowski <k.kozlowski@samsung.com>,
  Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>,
  David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>,
  "Rafał Miłecki" <zajec5@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Knut Wohlrab <knut.wohlrab@de.bosch.com>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  "grmoore@altera.com" <grmoore@altera.com>, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org,
  linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

this patch series makes it possible to access the SPI NOR flash in the Samsung
XE303 'Snow' Chromebook.

Unfortunately not all issues are resolved. To work around an issue with the
pl330 dma engine I respun the patch for limiting transfer size in m25p80
driver.

As the flash does not contain any sane filesystem and is only likely to be
accessed with mtd_debug or similar tool the limit of the dma engine is easily
reached. Filesystems using shorter data transfers are less likely to be
affected.

Thanks

Michal



Michal Suchanek (11):
  ARM: dt: Add SPI CS on Samsung Snow board.
  mtd: spi-nor: Add GD25LQ32C 1.8V SPI NOR flash ID
  mtd: add debug prints to mtdpart partition parser.
  mtd: ofpart: do not fail probe when no partitions exist
  mtd: mtdpart: Do not fail mtd probe when parsing partitions fails.
  mtd: spi-nor: rework spi nor read and write.
  mtd: spi-nor: rework write loop
  MTD: m25p80: Add option to limit SPI transfer size.
  dma: pl330: fix wording in mcbufsz message
  spi: add more debug prints in s3c64xx
  dt: Exynos: add Snow SPI NOR node.

 .../devicetree/bindings/mtd/jedec,spi-nor.txt      |  6 ++
 arch/arm/boot/dts/exynos5250-snow.dts              | 15 +++-
 drivers/dma/pl330.c                                |  4 +-
 drivers/mtd/devices/m25p80.c                       | 57 +++++++++++----
 drivers/mtd/mtdpart.c                              |  9 ++-
 drivers/mtd/ofpart.c                               |  4 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  | 29 ++++----
 drivers/mtd/spi-nor/spi-nor.c                      | 80 ++++++++++++----------
 drivers/spi/spi-s3c64xx.c                          | 30 ++++++++
 include/linux/mtd/spi-nor.h                        |  8 +--
 10 files changed, 166 insertions(+), 76 deletions(-)

-- 
2.1.4
