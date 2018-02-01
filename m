Received: from mail-he1eur01on0084.outbound.protection.outlook.com
 ([104.47.0.84] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ehFhT-0003oP-5w
 for linux-mtd@lists.infradead.org; Thu, 01 Feb 2018 14:18:54 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, poonam.aggrwal@nxp.com, suresh.gupta@nxp.com,
 yogeshnarayan.gaur@nxp.com, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH 0/3] mtd: spi-nor: Add support of Sector Map Parameter Table
Date: Thu,  1 Feb 2018 19:48:19 +0530
Message-Id: <1517494699-2718-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

JESD216B defines Sector Map Parameter Table. It identifies the
location and size of sectors within the main data array of the
flash memory device and identifies which Erase Types are supported
by each sector. This table is used when a memory device has sectors
of more than one size Or, does not allow all Erase Type commands to
be applied to all sectors.

This patch-set add support of Sector Map Parameter Table parsing.
It also update framework to support read/write anyreg commands
required by S25FS512S flash.

Tested with "S25FS512S" flash for uniform 256KB sector configuration id.
For hybrid configuration ids, fsl_qspi_read_anyreg() was over-rided.  

Prabhakar Kushwaha (3):
  mtd: spi-nor: Add support of read/write any reg commands
  mtd: spi-nor: Implement anyreg functions for fsl-quadspi
  mtd: spi-nor: Add support of Sector Map Parameter Table

 drivers/mtd/spi-nor/fsl-quadspi.c |  18 +++
 drivers/mtd/spi-nor/spi-nor.c     | 293 +++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h       |  22 +++
 3 files changed, 329 insertions(+), 4 deletions(-)

-- 
2.7.4
