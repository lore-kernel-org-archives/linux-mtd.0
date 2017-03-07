From: Franklin S Cooper Jr <fcooper@ti.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <tony@atomide.com>, <robh+dt@kernel.org>
CC: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 0/2] ARM: dts: am335x-icev2: Add support for W25Q64 NOR flash
Date: Tue, 7 Mar 2017 15:57:49 -0600
Message-ID: <20170307215751.29266-1-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch set adds support for the on board SPI NOR flash on TI's AM335x
Industrial Communication Engine rev 2.x board.

Franklin S Cooper Jr (1):
  ARM: dts: am335x-icev2: Add SPI based NOR

Sekhar Nori (1):
  doc: dt: mtd: add w25q64 to list of supported SPI flashes

 .../devicetree/bindings/mtd/jedec,spi-nor.txt      |  1 +
 arch/arm/boot/dts/am335x-icev2.dts                 | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.10.0
