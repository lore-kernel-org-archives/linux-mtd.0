Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTvdd-0006um-Rn
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 15:25:26 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <broonie@kernel.org>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>
Subject: [PATCH 0/3]Add quad/memory mapped support for SPI flash. 
Date: Wed, 9 Oct 2013 20:54:41 +0530
Message-ID: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: spi-devel-general@lists.sourceforge.net,
 Sourav Poddar <sourav.poddar@ti.com>, linux-mtd@lists.infradead.org,
 balbi@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch add quad/memory mapped support in flash driver(m25p80).

Added support for quad memory mapped for TI qspi controller also.

This patch has been tested with some internal dts data.

Sourav Poddar (3):
  spi/qspi: Add memory mapped read support.
  drivers: mtd: devices: Add quad read support.
  drivers: mtd: devices: Add memory mapped read support.

 drivers/mtd/devices/m25p80.c |  193 ++++++++++++++++++++++++++++++++++++++++--
 drivers/spi/spi-ti-qspi.c    |  140 +++++++++++++++++++++++++++---
 include/linux/spi/spi.h      |    2 +
 3 files changed, 312 insertions(+), 23 deletions(-)
