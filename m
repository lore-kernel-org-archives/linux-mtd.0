Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flD7o-0006YF-Vg
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2018 12:54:43 +0000
From: Frieder Schrempf <frieder.schrempf@exceet.de>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at,
 broonie@kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Cc: cyrille.pitchen@wedev4u.fr, frieder.schrempf@exceet.de, pp@emlix.com,
 Zhiqiang.Hou@nxp.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Extend the SPI mem interface to set a custom memory
 name
Date: Thu,  2 Aug 2018 14:53:51 +0200
Message-Id: <1533214434-28761-1-git-send-email-frieder.schrempf@exceet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These changes were previously send with the series that transforms the FSL QSPI
driver to the SPI mem interface [1]. As these changes are needed for other
drivers too I send them separately now.

The first patch fixes a typo, the second extends the interface to set and get a
custom name for the memory device and the third patch makes use of this in the
m25p80 driver.

[1] https://patchwork.ozlabs.org/cover/939864/

Changes in v3:
==============
* Move fix for typo in spi-mem.h to a separate patch
* Fix documentation of spi_mem_get_name() and get_name()
* Avoid overwriting the name of the memory device in probe of m25p80
* Add Suggested-by tags

Changes in v2:
==============
* Add a name field to struct spi_mem and fill it while probing

Frieder Schrempf (3):
  spi: spi-mem: Fix a typo in the documentation of struct spi_mem
  spi: spi-mem: Extend the SPI mem interface to set a custom memory name
  mtd: m25p80: Call spi_mem_get_name() to let controller set a custom
    name

 drivers/mtd/devices/m25p80.c |  3 +++
 drivers/spi/spi-mem.c        | 28 ++++++++++++++++++++++++++++
 include/linux/spi/spi-mem.h  | 14 +++++++++++++-
 3 files changed, 44 insertions(+), 1 deletion(-)

-- 
2.7.4
