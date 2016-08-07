Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bWU5B-0004eP-2X
 for linux-mtd@lists.infradead.org; Sun, 07 Aug 2016 19:50:01 +0000
Received: by mail-wm0-x244.google.com with SMTP id i5so11987928wmg.2
 for <linux-mtd@lists.infradead.org>; Sun, 07 Aug 2016 12:49:40 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] spi: introduce max message size and use it in the
 fsl-espi driver
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <01d94235-a874-9331-e7ad-b326fb78271d@gmail.com>
Date: Sun, 7 Aug 2016 21:46:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Recently a maximum transfer size was was introduced in struct spi_master.
However there are also spi controllers with a maximum message size, e.g.
fsl-espi has a max message size of 64KB.
As there are no (known) spi controller with differing size limits for
transfer and message, introduce a flag in spi_master to indicate that
the max transfer size is also the maximum message size.

Then use this flag in the m25p80 driver to calculate proper read chunks
for such controllers.

Eventually this new feature allows to significantly simplify the
fsl-espi driver.

Heiner Kallweit (3):
  spi: introduce max message size flag in spi_master
  mtd: m25p80: consider max message size in m25p80_read
  spi: fsl-espi: eliminate spi nor flash read loop

 drivers/mtd/devices/m25p80.c |  7 +++-
 drivers/spi/spi-fsl-espi.c   | 88 ++++++++++----------------------------------
 include/linux/spi/spi.h      |  4 ++
 3 files changed, 30 insertions(+), 69 deletions(-)

-- 
2.9.2
