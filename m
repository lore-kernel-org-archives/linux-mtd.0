Received: from mail-by2nam01on0043.outbound.protection.outlook.com
 ([104.47.34.43] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUtG6-00008S-0A
 for linux-mtd@lists.infradead.org; Fri, 29 Dec 2017 11:55:32 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <marek.vasut@gmail.com>, <cyrille.pitchen@wedev4u.fr>,
 <poonam.aggrwal@nxp.com>, <suresh.gupta@nxp.com>, <ashish.kumar@nxp.com>,
 <yogeshnarayan.gaur@nxp.com>, <rajat.srivastava@nxp.com>,
 <fabio.estevam@nxp.com>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [RFC 0/3] mtd: spi-nor: Add support of Sector Map Parameter Table
Date: Fri, 29 Dec 2017 17:23:49 +0530
Message-ID: <1514548432-13302-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

Tested with "S25FS512S" flash and by over-riding fsl_qspi_read_anyreg()
return with desired configuration id i.e. 0x05. Flash was
pre-programmed for Uniform 256-kB sectors via non-volatile registers.

Prabhakar Kushwaha (3):
  mtd: spi-nor: Add support of read/write any reg commands
  mtd: spi-nor: Implement anyreg functions for fsl-quadspi
  mtd: spi-nor: Add support of Sector Map Parameter Table

 drivers/mtd/spi-nor/fsl-quadspi.c |  18 +++
 drivers/mtd/spi-nor/spi-nor.c     | 266 +++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h       |  21 +++
 3 files changed, 302 insertions(+), 3 deletions(-)

-- 
2.7.4
