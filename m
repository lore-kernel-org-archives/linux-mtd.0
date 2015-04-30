Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnpWv-0005aR-T4
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 14:33:38 +0000
Message-Id: <cover.1430403750.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Apr 2015 16:22:30 +0200
Subject: [PATCH 0/3] Using SPI NOR flah on sunxi.
To: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
  Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
  Ian Campbell <ijc+devicetree@hellion.org.uk>,
  Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
  Huang Shijie <b32955@freescale.com>, Michal Suchanek <hramrach@gmail.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Ben Hutchings <ben@decadent.org.uk>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Mika Westerberg <mika.westerberg@linux.intel.com>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  "grmoore@altera.com" <grmoore@altera.com>, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I tried to connect a SPI NOR flash to my sunxi board and due to the current
sunxi SPI driver limitations it does not work.

The SPI driver returns an error when more than 64 bytes are transferred at once
due to lack of DMA support.

I tried to hack in an option to limit the transfer size and discovered that the
return value of write in m25p80 driver is wrong and never checked.

This might be useful while working with other devices with limited driver support.

Thanks

Michal

Michal Suchanek (3):
  MTD: m25p80: fix write return value.
  MTD: spi-nor: check for short writes in spi_nor_write.
  MTD: m25p80: Add option to limit SPI transfer size.

 Documentation/devicetree/bindings/mtd/m25p80.txt |  5 +++
 drivers/mtd/devices/m25p80.c                     | 21 ++++++++++--
 drivers/mtd/spi-nor/spi-nor.c                    | 42 ++++++++++--------------
 3 files changed, 40 insertions(+), 28 deletions(-)

-- 
2.1.4
