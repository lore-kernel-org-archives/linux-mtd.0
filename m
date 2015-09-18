From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <nicolas.ferre@atmel.com>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <zajec5@gmail.com>, <beanhuo@micron.com>,
 <juhosg@openwrt.org>, <marex@denx.de>, <ben@decadent.org.uk>,
 <jogo@openwrt.org>, <jteki@openedev.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
 <mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
 <galak@codeaurora.org>, <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH linux-next 0/4] mtd: spi-nor: fix Quad SPI memory support
Date: Fri, 18 Sep 2015 17:49:24 +0200
Message-ID: <cover.1442590224.git.cyrille.pitchen@atmel.com>
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

Hi all,

this series of patches fixes the QSPI support mostly for Micron and
Macronix memories. There are also some updates for Spansion memories.
There are also many comments to explain the implementation choices based
on the datasheets from memory manufacturers.

The series was backported to a at91-4.1 kernel then tested on a sama5d2
xplained board, which embeds a at25df321a memory on a SPI controller and
a Micron n25q128a13 QSPI memory on the new Atmel QSPI controller.

The at25 memory was used to check non regression on the m25p80 driver
whereas the Micron memory was used to test the fixes of the spi-nor
framework. The driver for the Atmel QSPI controller will be sent in a
dedicated series.

Best Regards,

Cyrille

Cyrille Pitchen (4):
  mtd: spi-nor: remove unused read_xfer/write_xfer hooks
  mtd: spi-nor: properly detect the memory when it boots in Quad or Dual
    mode
  mtd: spi-nor: fix Quad SPI mode support for Spansion, Micron and
    Macronix
  mtd: m25p80: add support of dual and quad spi protocols to all
    commands

 drivers/mtd/devices/m25p80.c  | 254 ++++++++++---
 drivers/mtd/spi-nor/spi-nor.c | 811 ++++++++++++++++++++++++++++++++++++------
 include/linux/mtd/spi-nor.h   |  69 ++--
 3 files changed, 954 insertions(+), 180 deletions(-)

-- 
1.8.2.2
