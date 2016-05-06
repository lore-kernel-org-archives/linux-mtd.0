Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThO-0006LI-Im
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:32:55 +0000
Received: by mail-pf0-x230.google.com with SMTP id c189so44575130pfb.3
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:34 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michal Suchanek <hramrach@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Rafal Milecki <zajec5@gmail.com>, Jagan Teki <jteki@openedev.com>,
 "Andrew F. Davis" <afd@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v7 00/10] Add error checking to spi-nor read and write
Date: Thu,  5 May 2016 17:31:46 -0700
Message-Id: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm picking up Michal's patch set, since he dropped it on the floor, and it's
useful for others. My additions:

 * rebased on latest
 * added fixes for drivers that have been merged in the meantime
 * addressed most of Heiner's comments

I've put some v6->v7 change info in the patch descriptions as well.

Tested on m25p80 only.

Regards,
Brian
Brian Norris (2):
  mtd: mtk-quadspi: return amount of data transferred or error in
    read/write
  mtd: nxp-spifi: return amount of data transferred or error in
    read/write

Michal Suchanek (8):
  mtd: spi-nor: change return value of read/write
  mtd: m25p80: return amount of data transferred or error in read/write
  mtd: fsl-quadspi: return amount of data read/written or error
  mtd: spi-nor: check return value from write
  mtd: spi-nor: stop passing around retlen
  mtd: spi-nor: simplify write loop
  mtd: spi-nor: add read loop
  mtd: m25p80: read in spi_max_transfer_size chunks

 drivers/mtd/devices/m25p80.c      |  37 +++++++++-----
 drivers/mtd/spi-nor/fsl-quadspi.c |  29 +++++------
 drivers/mtd/spi-nor/mtk-quadspi.c |  42 +++++++++-------
 drivers/mtd/spi-nor/nxp-spifi.c   |  25 +++++-----
 drivers/mtd/spi-nor/spi-nor.c     | 100 +++++++++++++++++++++++++-------------
 include/linux/mtd/spi-nor.h       |   8 +--
 6 files changed, 148 insertions(+), 93 deletions(-)

-- 
2.8.0.rc3.226.g39d4020
