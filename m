From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <anuragku@xilinx.com>, <cyrille.pitchen@microchip.com>,
 <nicolas.ferre@microchip.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 0/3] mtd: spi-nor: add Global Block Unlock support
Date: Tue, 11 Sep 2018 11:22:29 +0300
Message-ID: <20180911082232.28678-1-tudor.ambarus@microchip.com>
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

To avoid inadvertent writes during power-up, SST26 flash memories are
write-protected by default after a power-on reset cycle. Unlock the serial
flash memory by using the Global Block Protection Unlock command - it offers
a single command cycle that unlocks the entire memory array.

v2:
- add Cyrille's reviewed-by tag
- add cover letter
- fix link to initial work done by Anurag Kumar Vulisha

Tudor Ambarus (3):
  mtd: spi-nor: add Global Block Unlock support
  mtd: spi-nor: unlock global block protection on sst26vf064b
  mtd: spi-nor: add support for Microchip SST26 QSPI flash memories

 drivers/mtd/spi-nor/spi-nor.c | 47 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 47 insertions(+), 1 deletion(-)

-- 
2.9.4
